Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BDC35C6AB;
	Sun, 18 Oct 2026 02:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792292307; cv=none; b=VWaAtw9LfOPTt4WlWjvzbPA4DY5+TAjUgLy/bzf3MfWLZKNpRK+y+OeWpN+xCYYag4vjp2XELPDfX/sGGofGvX5AipGUqQJgi7c8tYMeTJyhPPgErPRgFV2RdcyxDXI6A7b7k5t0XiHhzF7D1+ya3gaobk4fJi/LqWXDireMwCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792292307; c=relaxed/simple;
	bh=zyAdpmpLDaBMDkKC7M8GVtVUFvz6PS19JpnZnhvQ+Rg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QrYxhcWLEyCz5H08dwKZNmO94qa6HjXnHk8b04MNC8/k5+1xHJr2wpwOgF7T9VDgvTke8SxXJgRRd//lJLRY8YhxhW9m3t1Nf62gINqw4MibTV3oN3O/wBQ4yMlJZ1V1JufJmF9eTYAXEjZeW3Dq1x1mSTF45Y61D/hxkoZrkf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xIH6O-004Rmt-RU;
	Sat, 17 Oct 2026 22:58:24 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Jens Axboe <axboe@kernel.dk>
Cc: Christian Brauner <brauner@kernel.org>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v1] io_uring/waitid: return -EAGAIN for a non-blocking pidfd
Date: Sat, 17 Oct 2026 22:58:24 -0400
Message-ID: <20261018025824.799245-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IORING_OP_WAITID on a pidfd opened with PIDFD_NONBLOCK completes at
once with res 0 and an all-zero siginfo when the child has not changed
state, although WNOHANG was not requested. waitid(2) with the same
arguments fails with -EAGAIN. An application that submits the same
request it would pass to waitid(2) and treats res 0 as "the child
changed state" sees si_signo 0 and si_pid 0 instead.

kernel_waitid_prepare() turns an O_NONBLOCK pidfd into WNOHANG in
wo->wo_flags. kernel_waitid() then maps the resulting 0 return to
-EAGAIN when the caller did not ask for WNOHANG itself, as added in
commit ba7d25f3dff6 ("exit: support non-blocking pidfds").
io_waitid() uses kernel_waitid_prepare() and __do_wait() directly and
does not do that mapping.

Do the same check in io_waitid() before completing the request. Only
the inline path needs it: with WNOHANG set, __do_wait() never returns
-ERESTARTSYS, so such a request is never armed on the wait queue.

Reproduced on x86_64 under QEMU: with a PIDFD_NONBLOCK pidfd of a
running child and options = WEXITED, waitid(2) fails with -EAGAIN and
IORING_OP_WAITID completed with res 0 before the change; it completes
with res -EAGAIN after it.

Fixes: f31ecf671ddc ("io_uring: add IORING_OP_WAITID support")
Assisted-by: LLM
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    Reproducer (CONFIG_IO_URING=y; no liburing needed):
    
      #define _GNU_SOURCE
      #include <errno.h>
      #include <fcntl.h>
      #include <linux/io_uring.h>
      #include <signal.h>
      #include <stdio.h>
      #include <string.h>
      #include <sys/mman.h>
      #include <sys/syscall.h>
      #include <sys/wait.h>
      #include <unistd.h>
    
      #ifndef PIDFD_NONBLOCK
      #define PIDFD_NONBLOCK O_NONBLOCK
      #endif
    
      int main(void)
      {
      	struct io_uring_params p = { 0 };
      	struct io_uring_sqe *sqes;
      	struct io_uring_cqe *cqe;
      	siginfo_t si;
      	unsigned int *sq_tail, *sq_array, *cq_head;
      	void *sq, *cq;
      	int ring, pidfd, ret;
      	pid_t child;
    
      	child = fork();
      	if (child == 0) {
      		pause();
      		_exit(0);
      	}
      	pidfd = syscall(SYS_pidfd_open, child, PIDFD_NONBLOCK);
    
      	memset(&si, 0xff, sizeof(si));
      	ret = syscall(SYS_waitid, P_PIDFD, pidfd, &si, WEXITED, NULL);
      	printf("waitid(2):        ret=%d errno=%s si_signo=%d\n", ret,
      	       ret ? strerror(errno) : "-", si.si_signo);
    
      	ring = syscall(SYS_io_uring_setup, 4, &p);
      	sq = mmap(NULL, p.sq_off.array + p.sq_entries * 4, PROT_READ | PROT_WRITE,
      		  MAP_SHARED, ring, IORING_OFF_SQ_RING);
      	cq = mmap(NULL, p.cq_off.cqes + p.cq_entries * sizeof(*cqe),
      		  PROT_READ | PROT_WRITE, MAP_SHARED, ring, IORING_OFF_CQ_RING);
      	sqes = mmap(NULL, p.sq_entries * sizeof(*sqes), PROT_READ | PROT_WRITE,
      		    MAP_SHARED, ring, IORING_OFF_SQES);
      	sq_tail = sq + p.sq_off.tail;
      	sq_array = sq + p.sq_off.array;
      	cq_head = cq + p.cq_off.head;
    
      	memset(&si, 0xff, sizeof(si));
      	memset(&sqes[0], 0, sizeof(sqes[0]));
      	sqes[0].opcode = IORING_OP_WAITID;
      	sqes[0].fd = pidfd;		/* id */
      	sqes[0].len = P_PIDFD;		/* idtype */
      	sqes[0].file_index = WEXITED;	/* options */
      	sqes[0].addr2 = (unsigned long)&si;
      	sq_array[0] = 0;
      	__atomic_store_n(sq_tail, 1, __ATOMIC_RELEASE);
      	ret = syscall(SYS_io_uring_enter, ring, 1, 1, IORING_ENTER_GETEVENTS, NULL, 0);
      	cqe = cq + p.cq_off.cqes;
      	printf("IORING_OP_WAITID: res=%d (%s) si_signo=%d\n", cqe->res,
      	       cqe->res ? strerror(-cqe->res) : "-", si.si_signo);
      	__atomic_store_n(cq_head, 1, __ATOMIC_RELEASE);
    
      	kill(child, SIGKILL);
      	waitpid(child, NULL, 0);
      	return 0;
      }
    
      gcc -O2 -static -o waitid-nonblock waitid-nonblock.c && ./waitid-nonblock
    
    Before:
      waitid(2):        ret=-1 errno=Resource temporarily unavailable si_signo=0
      IORING_OP_WAITID: res=0 (-) si_signo=0
    
    After:
      waitid(2):        ret=-1 errno=Resource temporarily unavailable si_signo=0
      IORING_OP_WAITID: res=-11 (Resource temporarily unavailable) si_signo=0

 io_uring/waitid.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/io_uring/waitid.c b/io_uring/waitid.c
index 2b756017423f..b99faf779766 100644
--- a/io_uring/waitid.c
+++ b/io_uring/waitid.c
@@ -10,6 +10,7 @@
 #include <linux/io_uring.h>
 
 #include <uapi/linux/io_uring.h>
+#include <uapi/linux/wait.h>
 
 #include "io_uring.h"
 #include "cancel.h"
@@ -357,6 +358,9 @@ int io_waitid(struct io_kiocb *req, unsigned int issue_flags)
 
 	hlist_del_init(&req->hash_node);
 	io_waitid_remove_wq(req);
+	/* a non-blocking pidfd implies WNOHANG, report it as waitid(2) does */
+	if (!ret && !(iw->options & WNOHANG) && (iwa->wo.wo_flags & WNOHANG))
+		ret = -EAGAIN;
 	ret = io_waitid_finish(req, ret);
 
 	io_ring_submit_unlock(ctx, issue_flags);

base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.53.0

