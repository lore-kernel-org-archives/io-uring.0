Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D00D268690
	for <io-uring@vger.kernel.org>; Thu, 23 Jul 2026 12:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784810826; cv=none; b=P3tTUVYVqxfLj5AnlPPAcEH/SDGv50Ger+9ve2N1HNur5NGRA5ty1EJfjdZMs9/T+PZPCnnhP7tnE0yYOWzL/a4/+8ZHidDIWdi6g1ZHoLJk98jlAcv7yUqnbsZvBiI9ZoqU1p2thXSF8EDFQJV9z7c82XBkCwvjAYWXAktlvCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784810826; c=relaxed/simple;
	bh=j3GGzsX2eXyhx0RuQyAkq3bwZiGoPd8jGdrn1Xkk3m4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k2MsqmEALvgAxUQIQXBEJSNDFX2mDvWOKyUoCih1ph1+6QZSrfCYaefEjUXP9ta1T0sBg9/XTwHMKr4Ym4jdm3VOu0TZaCJ2nyWpMq3+MiigYO4IwkMAJS9m5VBNTDu9cC8lprgd/23Hf3dm7Hrr0AobyHYhBbtT4/Danc5tPvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m95YSyou; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m95YSyou"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ccf2360620so5452685ad.3
        for <io-uring@vger.kernel.org>; Thu, 23 Jul 2026 05:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784810825; x=1785415625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DM83ZHtmHP3lv0+ZgmRxnjYe6bLexQLZOmPCtM72mNs=;
        b=m95YSyoujfN0ssQwOM6v0MWOSumVjoOnkMV75ZM1til1RSou5XZbAXd9E8Md2FT5iv
         mc6fKx22+QR+iIhFOU9qV792J1khUiEGX2Jp9cXxX3CAPkfdj1E7A6vR2wHL39Mfyb2j
         jpLVQkQQuo/8Y7Xnj3+MBvvUvgjumIunzfHtIqygjUZkO8inKtPyK1CCx8uzkLgFmL3O
         YfOTliMQWinyeGPW2150OYPVgwMzB+hxo2zHcYFSxvTktXSOudB22t6XMhDYPcRtOFn8
         wCtDjDhiY7i24LJVmEQzPu/c0muVZx0diyfOjhYQG4q6RHMR8w/CSEjwVA+s83x+iOrI
         OAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784810825; x=1785415625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DM83ZHtmHP3lv0+ZgmRxnjYe6bLexQLZOmPCtM72mNs=;
        b=K7catMhpqPyxRVHK4TXEQAKIVTwGGCvI2Ug7jGxvpYmQBFps73ukRkexryib4c+LHE
         nGldX51wYyhbuLiho61T04zFIw0yc1jwH1uQfs3KiS4CJ3q9/ViQLtZ5RMDuxgwnKEC2
         cB7qAxpjB8Li7hA7PUBu96l6sH9QgRJyjpriGengMDYi1ZOhF/frCluQnnBe0+eCu/qJ
         kRozWdeBi8IKIjzTlyJBbnglgEHh0VL1gx0VKgT5JlIEcE56YhMPjDg7gq+KfBXpNxor
         uhcZUxarQ1CrTftjCtPqUCOUtuOfd5lhAohT4VIc9H5UfMcTDezVjUSnyfX5RZ/PNhnI
         QwIQ==
X-Forwarded-Encrypted: i=1; AHgh+RooCMJiqr3wjpBGo1gLHdzHSp/zGhNUT7708KvJ1BZCWSLGT/m4YFRV9IoMD+YfQ0PFHSYpow5/6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNzsh4yK2BveEQFkU/Nv/owoLl8V4JTxSs5Vk5IljONpB+FjXE
	5VyPwwNgT2fsLeOLjmkK7hxW0KSJNasJVB8Y2IlyLTF7E+PyjGMNdW+G
X-Gm-Gg: AR+sD13OcOFF1ngQ2U/ZI35AZ9BJ/0SNRa7oHoW7zgHPyZy/6ukZ1ZevY4LpHqWDHpN
	7dix1u29niKRVUxLX9l7bVKKRHkQ0/Y6STFrZ64NtGx9JWyE2RnyV4kys8UzdoxsQorJ3By2w7W
	IBkPBClmJo/wBtf892lNn8SLcJeal0HWmvtDno0ao34O133N4oNG+UnraMz1VLoooYi4kmpwj20
	2HFu3ZmWXWAws3YYpfol4Uw8RqWtSB7Zbt/37uHhW8A7Ofh8Ky5Fk3nRG7HELdfOlEuFxark4uH
	fL7KhDQZ66FUH+H4kHUdr8XFJ9pgr/KCHUr2Q/hwc1hhZIEvLWpcbstFlSATCrP+WELvARkunHD
	S5fW+Y0brCr0+GkLYyVI4BJDcLB5XGFOi+4bmX2c8lN7qNzcPjQrP5em7ooko1yoZXEGSOnd0pB
	FAD4WIvJVS
X-Received: by 2002:a17:903:26cf:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2cfa67031b5mr36590885ad.0.1784810824623;
        Thu, 23 Jul 2026 05:47:04 -0700 (PDT)
Received: from wokron-navi.. ([113.215.38.212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e621dsm33511745ad.48.2026.07.23.05.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:47:03 -0700 (PDT)
From: Yitang Yang <yi1tang.yang@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Gabriel Krisman Bertazi <krisman@suse.de>,
	io-uring@vger.kernel.org,
	Yitang Yang <yi1tang.yang@gmail.com>
Subject: [PATCH liburing] test: add rw-restart-ret regression test
Date: Thu, 23 Jul 2026 20:46:28 +0800
Message-ID: <20260723124628.190786-1-yi1tang.yang@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e54748e0-1dbd-433f-ab22-22e6a4495b05@kernel.dk>
References: <e54748e0-1dbd-433f-ab22-22e6a4495b05@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The filesystem layer may return internal restart codes to io_uring,
which should be converted to -EINTR before being delivered to
userspace. Add a test using userfaultfd with read multishot to
expose the issue and prevent regressions.

Link: https://lore.kernel.org/io-uring/20260720114116.21830-1-yi1tang.yang@gmail.com/
Signed-off-by: Yitang Yang <yi1tang.yang@gmail.com>
---
 test/Makefile         |   1 +
 test/rw-restart-ret.c | 304 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 305 insertions(+)
 create mode 100644 test/rw-restart-ret.c

diff --git a/test/Makefile b/test/Makefile
index d88a4287..e8cdda75 100644
--- a/test/Makefile
+++ b/test/Makefile
@@ -244,6 +244,7 @@ test_srcs := \
 	ring-leak.c \
 	ring-query.c \
 	rsrc_tags.c \
+	rw-restart-ret.c \
 	rw_merge_test.c \
 	self.c \
 	recvsend_bundle.c \
diff --git a/test/rw-restart-ret.c b/test/rw-restart-ret.c
new file mode 100644
index 00000000..e041c365
--- /dev/null
+++ b/test/rw-restart-ret.c
@@ -0,0 +1,304 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Description: test that io_uring correctly converts internal -ERESTARTSYS
+ * to -EINTR on file read paths. Using userfaultfd to expose the issue.
+ */
+#include <errno.h>
+#include <fcntl.h>
+#include <linux/userfaultfd.h>
+#include <pthread.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/eventfd.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <sys/syscall.h>
+#include <unistd.h>
+
+#include "liburing.h"
+#include "helpers.h"
+
+#define BUF_RING_SIZE	32
+#define BGID		0
+#define EXIT_DATA	1
+
+static size_t num_threads = 16;
+static size_t pages_per_thread = 10000;
+static size_t page_size;
+
+typedef struct {
+	void *data;
+	size_t size;
+	int uffd;
+	int stop_fd;
+	struct io_uring ring;
+	struct io_uring_buf_ring *buf_ring;
+} handler_state;
+
+static int handle_page_fault(handler_state *h, struct uffd_msg *msg)
+{
+	void *fault_addr = (void *)msg->arg.pagefault.address;
+	struct uffdio_zeropage zeropage = {
+		.range = {
+			.start = (unsigned long)fault_addr,
+			.len = page_size,
+		},
+	};
+
+	return ioctl(h->uffd, UFFDIO_ZEROPAGE, &zeropage);
+}
+
+static int init_handler(handler_state *h, void *data, size_t size)
+{
+	int r;
+
+	memset(h, 0, sizeof(*h));
+	h->data = data;
+	h->size = size;
+
+	h->uffd = syscall(__NR_userfaultfd, O_CLOEXEC | O_NONBLOCK);
+	if (h->uffd == -1) {
+		if (errno == ENOSYS || errno == EPERM)
+			return T_EXIT_SKIP;
+		return -1;
+	}
+
+	struct uffdio_api api = {
+		.api = UFFD_API,
+		.features = 0,
+	};
+	if (ioctl(h->uffd, UFFDIO_API, &api) == -1)
+		goto err_close_uffd;
+
+	struct uffdio_register reg = {
+		.range = {
+			.start = (unsigned long)h->data,
+			.len = h->size,
+		},
+		.mode = UFFDIO_REGISTER_MODE_MISSING,
+	};
+	if (ioctl(h->uffd, UFFDIO_REGISTER, &reg) == -1)
+		goto err_close_uffd;
+
+	h->stop_fd = eventfd(0, EFD_NONBLOCK);
+	if (h->stop_fd == -1)
+		goto err_close_uffd;
+
+	r = io_uring_queue_init(128, &h->ring, 0);
+	if (r < 0)
+		goto err_close_stopfd;
+
+	h->buf_ring = io_uring_setup_buf_ring(&h->ring, BUF_RING_SIZE,
+					       BGID, 0, &r);
+	if (!h->buf_ring) {
+		if (r == -EINVAL || r == -ENOENT) {
+			io_uring_queue_exit(&h->ring);
+			close(h->stop_fd);
+			close(h->uffd);
+			return T_EXIT_SKIP;
+		}
+		goto err_cleanup_ring;
+	}
+
+	return 0;
+
+err_cleanup_ring:
+	io_uring_queue_exit(&h->ring);
+err_close_stopfd:
+	close(h->stop_fd);
+err_close_uffd:
+	close(h->uffd);
+	return -1;
+}
+
+static void destroy_handler(handler_state *h)
+{
+	io_uring_free_buf_ring(&h->ring, h->buf_ring, BUF_RING_SIZE, BGID);
+	io_uring_queue_exit(&h->ring);
+	close(h->stop_fd);
+	close(h->uffd);
+}
+
+static int handler_run(handler_state *h)
+{
+	struct io_uring_sqe *sqe;
+	struct io_uring_cqe *cqe;
+	uint64_t stop_signal = 0;
+
+	struct uffd_msg msgs[BUF_RING_SIZE];
+	int i;
+
+	for (i = 0; i < BUF_RING_SIZE; i++) {
+		io_uring_buf_ring_add(h->buf_ring, msgs + i,
+				      sizeof(struct uffd_msg), i,
+				      BUF_RING_SIZE - 1, i);
+	}
+	io_uring_buf_ring_advance(h->buf_ring, BUF_RING_SIZE);
+
+	sqe = io_uring_get_sqe(&h->ring);
+	io_uring_prep_read_multishot(sqe, h->uffd, 0, 0, BGID);
+
+	sqe = io_uring_get_sqe(&h->ring);
+	io_uring_prep_read(sqe, h->stop_fd, &stop_signal,
+			   sizeof(stop_signal), 0);
+	io_uring_sqe_set_data64(sqe, EXIT_DATA);
+
+	io_uring_submit(&h->ring);
+
+	while (1) {
+		int ret = io_uring_wait_cqe(&h->ring, &cqe);
+		if (ret < 0)
+			exit(T_EXIT_FAIL);
+
+		unsigned head;
+		size_t count = 0;
+
+		io_uring_for_each_cqe(&h->ring, head, cqe) {
+			if (cqe->user_data == EXIT_DATA)
+				return 0;
+
+			/*
+			 * The only acceptable errors for a multishot
+			 * read on userfaultfd are ENOBUFS (buffers
+			 * temporarily exhausted) and EINTR.
+			 */
+			if (cqe->res < 0 &&
+			    cqe->res != -ENOBUFS &&
+			    cqe->res != -EINTR)
+				exit(T_EXIT_FAIL);
+
+			if (cqe->res >= 0) {
+				int bid = cqe->flags >> IORING_CQE_BUFFER_SHIFT;
+				struct uffd_msg *this_msg = &msgs[bid];
+
+				if (handle_page_fault(h, this_msg))
+					exit(T_EXIT_FAIL);
+
+				io_uring_buf_ring_add(h->buf_ring, this_msg,
+						      sizeof(struct uffd_msg),
+						      bid, BUF_RING_SIZE - 1, 0);
+				io_uring_buf_ring_advance(h->buf_ring, 1);
+			}
+
+			if (!(cqe->flags & IORING_CQE_F_MORE)) {
+				sqe = io_uring_get_sqe(&h->ring);
+				io_uring_prep_read_multishot(sqe, h->uffd,
+							     0, 0, BGID);
+				io_uring_submit(&h->ring);
+			}
+
+			count++;
+		}
+		io_uring_cq_advance(&h->ring, count);
+	}
+
+	return 0;
+}
+
+static ssize_t handler_stop(handler_state *h)
+{
+	uint64_t u = 1;
+	return write(h->stop_fd, &u, sizeof(u));
+}
+
+static void *thread_function(void *arg)
+{
+	char *data = (char *)arg;
+	size_t i;
+
+	for (i = 0; i < pages_per_thread; i++)
+		data[i * page_size] = (char)i;
+	return NULL;
+}
+
+static void *fault_thread_func(void *arg)
+{
+	handler_run((handler_state *)arg);
+	return NULL;
+}
+
+static void print_usage(const char *prog)
+{
+	fprintf(stderr,
+		"Usage: %s [-n threads] [-p pages] [-h]\n"
+		"  -n NUM  Number of threads\n"
+		"  -p NUM  Pages per thread\n"
+		"  -h      Show this help\n",
+		prog);
+}
+
+int main(int argc, char **argv)
+{
+	handler_state handler;
+	pthread_t fault_thread;
+	pthread_t *threads;
+	size_t total_size;
+	void *data;
+	int ret, opt;
+	size_t i;
+
+	while ((opt = getopt(argc, argv, "n:p:h")) != -1) {
+		switch (opt) {
+		case 'n':
+			num_threads = strtoul(optarg, NULL, 10);
+			break;
+		case 'p':
+			pages_per_thread = strtoul(optarg, NULL, 10);
+			break;
+		case 'h':
+		default:
+			print_usage(argv[0]);
+			return opt == 'h' ? T_EXIT_SKIP : T_EXIT_FAIL;
+		}
+	}
+
+	page_size = sysconf(_SC_PAGESIZE);
+	total_size = num_threads * pages_per_thread * page_size;
+
+	data = mmap(NULL, total_size, PROT_READ | PROT_WRITE,
+		    MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (data == MAP_FAILED)
+		return T_EXIT_FAIL;
+
+	ret = init_handler(&handler, data, total_size);
+	if (ret < 0)
+		goto err_munmap;
+	if (ret == T_EXIT_SKIP) {
+		munmap(data, total_size);
+		return T_EXIT_SKIP;
+	}
+
+	pthread_create(&fault_thread, NULL, fault_thread_func, &handler);
+
+	threads = malloc(num_threads * sizeof(pthread_t));
+	if (!threads) {
+		handler_stop(&handler);
+		pthread_join(fault_thread, NULL);
+		destroy_handler(&handler);
+		munmap(data, total_size);
+		return T_EXIT_FAIL;
+	}
+
+	for (i = 0; i < num_threads; i++) {
+		char *ptr = (char *)data + i * pages_per_thread * page_size;
+		pthread_create(&threads[i], NULL, thread_function, ptr);
+	}
+
+	for (i = 0; i < num_threads; i++)
+		pthread_join(threads[i], NULL);
+
+	handler_stop(&handler);
+	pthread_join(fault_thread, NULL);
+
+	free(threads);
+	destroy_handler(&handler);
+	munmap(data, total_size);
+
+	return T_EXIT_PASS;
+
+err_munmap:
+	munmap(data, total_size);
+	return T_EXIT_FAIL;
+}
-- 
2.43.0

