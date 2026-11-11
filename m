Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794414440;
	b=R2EQkT+QCcsyKVt8z1MogLEkIAT51eI3u4pETMLpqJYGUl5SCyz7eEXHkyN9VpL8BCen
	 6wugOw93d17q/szxO/dIGkLhGZ841u0vgNfc8HKgQtu/4Jb/QYj5MFpWneD59knOZVX/h
	 qZoPCqH/4AGNP/TU3elVTA70m59F4oxCsIvGi45ToOszNTIIfQz7o85iXsbZ66KEytDoS
	 al8JzbR6gU4U5t7MHy3N9iW7iHr7Lvk3IGD7NunGeK38g8dyOD3W9n3b/p5DXzMa1gEU8
	 zdBJ+ETILYTO0ggHf3Sbh8jYsKFjKQsfyUXG8ROkG8r6AZUzRSEWippS7ppfthYflJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794414440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GAa/JB/dGlysKnvdVKBk1Gac1LQ6ZOjNf/u8F2y2Lpk=;
	b=uhFt+UIOpUGXgiEu79TrHiNE7MdFI891HeYh/v0kA6T2EuS4eFrMgGq1fsv/4s53q6L3
	 TDQwZasUMMI6m3xX/0JO0PqswIhzFcDe6oIQdTyYSUcJpk/kXEYAYqDSSKEq3aHcvYmUp
	 3veegpUbUJYN+yKYQ86ybsCk9QTTfDIOZ4/lARA5UdlfQz/H+ALTdnCaVPOI2+mFj69mT
	 oJkn2g+j97TFAOdZTb8Zp666Do0z3sBqzPciwOOt/enH5pwdfP0oQAtVhKPumJ8VmaZ4s
	 TYnWYDcHLntE9LFLD8RrmOvEl3PWRFnfOHNShxnNndUHXHKVF+IJS6s0VuyI/4vHWFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EF8T2b2w;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907FA606A321
	for <io-uring@vger.kernel.org>; Wed, 11 Nov 2026 16:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 907FA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EF8T2b2w
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so20729135e9.2
        for <io-uring@vger.kernel.org>; Wed, 11 Nov 2026 08:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794414438; x=1795019238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GAa/JB/dGlysKnvdVKBk1Gac1LQ6ZOjNf/u8F2y2Lpk=;
        b=EF8T2b2wmXpqX32VfayoAI++02HL84EXF5Jg74UOsH3nVGseT/oTzt+dLZ1ETXnUAd
         +xGSDniRbT7qGKo92yk60yvYwVmft0YPEb8EzxK+feQ3zedAkFJaCYXkMnvD4DHFAWbn
         ZDszH0Npbh9GSAgRLqIPZGuDnwg8SLuGz0OZWhzYPSsLFjIGj7DX3/N1bH7Vy8B6dnzP
         0BHOH7fqUBnIAdLJsTe/Ap+KQASQuQkPzfa1e8+1e6IbM8DfyRvFXU4lzwZu1sp8hJ0v
         8eDIrVMXCM3mwubkgYJ1aHNbtO6C6HDNrzKA01Q9dKZXctHiOGYlK7IyqSDg8SxFefZA
         Ccbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794414438; x=1795019238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GAa/JB/dGlysKnvdVKBk1Gac1LQ6ZOjNf/u8F2y2Lpk=;
        b=csNvWdJgME9AaBS1F22e1MoHEaGGQD7H46kI+XZkKaaOuaFA3hfr2dTBg4itX3kgXv
         aqlfsmJUFupQlQphoatwV2Tb1cg4hAavAsTu54wG/apdWyuAJEXbJ3JNrlBj8EcGWCwU
         zMRE9Qmt1My8TjT986dJSWXR5er8KEbl3hD9l6rXG8hM2FqONsr5VwqRrCthWSFpBAww
         dwF6ICKnhkz7pRDsUUSRq40AmE95039v+UJZ2ofcmy2+DOupsLsShdgv7sO2GEiu4uuh
         VsrXC41rtFaWwVvJacLROLOisQiBB1L/VkLm7b+LXFnc+1eBUQbJdHoRVkQDB61RD4XF
         Xphw==
X-Forwarded-Encrypted: i=1; AL+hErELrwe8MwFeJBnlqWvPsBudUAiO+TGETizlnDVreOZxvf3R/xBOvLDV4CJTo+7kydw9l6fh73yefg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+nQobkRT4QhRGx4mWxK+scOXVRa+3YjxInMM3e4QX7cuQfjL9A
	Q/sVrsiSIuSn2Md7yiQ/0qv1jyHmrHrumDgaUwD/swM/p6yhR9aJZKkMKtGUhQ==
X-Gm-Gg: AYBFou2Xzg1yCYrxSBDxyYaBQO6+cfObyKIPlUZ8CXjbhfRX85pBNjUnJw0A5916nB5
	V7RQ2py0bl2RH+hfgV0W/yPouzxYwIXz7pXLE3p6oP5I5hCVMP1SRCGTtnKATPGs/qnYg8x/ZYm
	dHlv+kKNRbplRBChdkFTcuQ4N8IisRlZlrYQ3+upswpY0cYIDQRjFpw2DNagw3hzVBMcE35jgwb
	h1a61kKHqTpeebsiF4iHF4xhVV9S9Rre2hQ/Vi/H9EAIaFJ84Q41Q1v81hUyKWS20YdNwdHNYrO
	P0gOeZDyfM9T8sjhpUqNZ+OYMDmAinpBa/vvMOxwGSuMXd5mgn0FlGoBMyaGyTf5k5s7xqklFBJ
	ZTQlW6P4I0ULfx077dGaSrQ6KFX9gWdFBzOkWiLGWnYRDzxwVqAj0yJ0Mxc8C85Ts0EfQFajwYu
	fdQzgMtJRWmsdUXbfG9TqMtyCKP16zkwtjuPowvGWIo6X6R47mzIr3xxlnTRhRQzff2pQAheixD
	an8Y2mGZPzc8gQm8WEcUqCHj7EwYAKhGb4l7RoMm6f5nJzIbE3jZOfNBJrVdqokcOu/LAhdJ2Zm
	9b7kC+XZUA7thJuZE9Bu8R2DcOb+6uL31Q==
X-Received: by 2002:a05:600d:82f1:b0:4a2:cbe:beac with SMTP id 5b1f17b1804b1-4ba093c85ebmr58934365e9.23.1794414437702;
        Wed, 11 Nov 2026 08:27:17 -0800 (PST)
Received: from build-server.. ([62.96.37.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm104385e9.1.2026.11.11.08.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:27:17 -0800 (PST)
From: Mikhail Malyshev <mike.malyshev@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org
Subject: [PATCH liburing] test/iowq-cpuset: check that io-wq workers follow cpuset changes
Date: Wed, 11 Nov 2026 16:27:16 +0000
Message-ID: <20261111162716.1151068-1-mike.malyshev@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io-wq workers started after the cpuset of a task changes, or after the
task moves to another cgroup, run on the CPUs the task had when its
io-wq was created: the kernel reads the cpuset only then. The kernel
fix is "io_uring/io-wq: apply the current cpuset to new workers".

Add a test that starts a worker on one CPU, moves the task to another
CPU, once by changing its cpuset and once by moving it to another
cgroup, starts three more workers, and checks that all of them run on
the new CPU only. It needs root and cgroup v2 with the cpuset
controller, and skips otherwise.

Signed-off-by: Mikhail Malyshev <mike.malyshev@gmail.com>
---
The kernel fix: https://lore.kernel.org/io-uring/20261111162705.1150983-1-mike.malyshev@gmail.com/

On io_uring-7.4 under QEMU/KVM (x86_64, 8 CPUs, cgroup v2) the test
fails without the kernel fix, at its first subtest (the cpuset change),
and passes with it; the same on 6.18.y. Without root it skips.

The test was written with Claude Code (Anthropic, Claude Opus 5.5)
together with the kernel fix; I have reviewed it.

 test/Makefile      |   1 +
 test/iowq-cpuset.c | 330 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 331 insertions(+)
 create mode 100644 test/iowq-cpuset.c

diff --git a/test/Makefile b/test/Makefile
index 8771aa50..a4249ecd 100644
--- a/test/Makefile
+++ b/test/Makefile
@@ -159,6 +159,7 @@ test_srcs := \
 	io-wq-exit.c \
 	io-wq-unused-exit.c \
 	iowait.c \
+	iowq-cpuset.c \
 	kallsyms.c \
 	large-resize.c \
 	lfs-openat.c \
diff --git a/test/iowq-cpuset.c b/test/iowq-cpuset.c
new file mode 100644
index 00000000..49657655
--- /dev/null
+++ b/test/iowq-cpuset.c
@@ -0,0 +1,330 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Description: test that io-wq workers started after the cpuset of the task
+ *		changes, or after the task moves to another cgroup, run on
+ *		the CPUs of the cpuset the task is in now, not on those it
+ *		had when its io-wq was created. Needs root and cgroup v2
+ *		with the cpuset controller.
+ */
+#include <dirent.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <sched.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/stat.h>
+#include <sys/vfs.h>
+#include <sys/wait.h>
+#include <linux/magic.h>
+
+#include "liburing.h"
+#include "helpers.h"
+
+#define CG_ROOT		"/sys/fs/cgroup"
+#define NR_PARKED	4
+
+static char cg_a[64], cg_b[64], fifo[64];
+static int cpu_old, cpu_new, parked;
+
+static int write_str(const char *path, const char *val)
+{
+	int fd, ret;
+
+	fd = open(path, O_WRONLY);
+	if (fd < 0)
+		return -errno;
+	ret = write(fd, val, strlen(val));
+	ret = ret < 0 ? -errno : 0;
+	close(fd);
+	return ret;
+}
+
+static int set_cpu(const char *cg, int cpu)
+{
+	char path[128], val[16];
+
+	snprintf(path, sizeof(path), "%s/cpuset.cpus", cg);
+	snprintf(val, sizeof(val), "%d", cpu);
+	return write_str(path, val);
+}
+
+static int join(const char *cg)
+{
+	char path[128], val[16];
+
+	snprintf(path, sizeof(path), "%s/cgroup.procs", cg);
+	snprintf(val, sizeof(val), "%d", getpid());
+	return write_str(path, val);
+}
+
+/*
+ * Count the io-wq workers of this process, and check that each of them may
+ * run on @cpu only. Returns the count, or -1 if a worker is elsewhere.
+ */
+static int check_workers(int cpu, int report)
+{
+	char want[32];
+	struct dirent *de;
+	int nr = 0, ret = 0;
+	DIR *dir;
+
+	snprintf(want, sizeof(want), "iou-wrk-%d", getpid());
+	dir = opendir("/proc/self/task");
+	if (!dir)
+		return -1;
+	while ((de = readdir(dir)) != NULL) {
+		char path[300], comm[64];
+		cpu_set_t set;
+		ssize_t len;
+		int fd;
+
+		if (de->d_name[0] == '.')
+			continue;
+		snprintf(path, sizeof(path), "/proc/self/task/%s/comm",
+			 de->d_name);
+		fd = open(path, O_RDONLY);
+		if (fd < 0)
+			continue;
+		len = read(fd, comm, sizeof(comm) - 1);
+		close(fd);
+		if (len <= 0)
+			continue;
+		comm[len] = '\0';
+		comm[strcspn(comm, "\n")] = '\0';
+		if (strcmp(comm, want))
+			continue;
+		if (sched_getaffinity(atoi(de->d_name), sizeof(set), &set))
+			continue;
+		nr++;
+		if (CPU_COUNT(&set) != 1 || !CPU_ISSET(cpu, &set)) {
+			if (report)
+				fprintf(stderr, "worker %s: on %d CPU(s)%s, "
+					"want CPU %d only\n", de->d_name,
+					CPU_COUNT(&set), CPU_ISSET(cpu, &set) ?
+					"" : " without it", cpu);
+			ret = -1;
+		}
+	}
+	closedir(dir);
+	return ret ? ret : nr;
+}
+
+/*
+ * Queue an open of the fifo, forced to io-wq. With no writer it blocks
+ * there, so each one queued while the others wait needs a worker of its
+ * own. Wait for that worker to show up.
+ */
+static int park(struct io_uring *ring, int cpu)
+{
+	struct io_uring_sqe *sqe;
+	int i, before;
+
+	before = check_workers(cpu, 0);
+	sqe = io_uring_get_sqe(ring);
+	io_uring_prep_openat(sqe, AT_FDCWD, fifo, O_RDONLY, 0);
+	sqe->flags |= IOSQE_ASYNC;
+	if (io_uring_submit(ring) != 1)
+		return T_EXIT_FAIL;
+	parked++;
+	for (i = 0; i < 100; i++) {
+		int nr = check_workers(cpu, 0);
+
+		if (nr < 0 || nr > before)
+			break;
+		usleep(10000);
+	}
+	return T_EXIT_PASS;
+}
+
+static void release(struct io_uring *ring)
+{
+	struct io_uring_cqe *cqe;
+	int fd, i;
+
+	fd = open(fifo, O_WRONLY | O_NONBLOCK);
+	for (i = 0; i < parked; i++) {
+		if (io_uring_wait_cqe(ring, &cqe))
+			break;
+		if (cqe->res >= 0)
+			close(cqe->res);
+		io_uring_cqe_seen(ring, cqe);
+	}
+	if (fd >= 0)
+		close(fd);
+}
+
+/*
+ * Start a worker on cpu_old, then move the task to cpu_new: change the
+ * cpuset, or move to the other cgroup. The workers started after that, and
+ * the one cpuset moved, must all be on cpu_new.
+ */
+static int test(int move)
+{
+	struct io_uring ring;
+	int i, ret;
+
+	if (join(cg_a))
+		return T_EXIT_SKIP;
+	ret = io_uring_queue_init(8, &ring, 0);
+	if (ret) {
+		fprintf(stderr, "queue init: %d\n", ret);
+		return T_EXIT_FAIL;
+	}
+	ret = park(&ring, cpu_old);
+	if (ret)
+		goto out;
+	if (check_workers(cpu_old, 1) != 1) {
+		fprintf(stderr, "no worker on CPU %d\n", cpu_old);
+		ret = T_EXIT_FAIL;
+		goto out;
+	}
+
+	if (move)
+		ret = join(cg_b);
+	else
+		ret = set_cpu(cg_a, cpu_new);
+	if (ret) {
+		fprintf(stderr, "moving to CPU %d: %d\n", cpu_new, ret);
+		ret = T_EXIT_FAIL;
+		goto out;
+	}
+
+	for (i = 1; i < NR_PARKED; i++) {
+		ret = park(&ring, cpu_new);
+		if (ret)
+			goto out;
+	}
+	ret = check_workers(cpu_new, 1);
+	if (ret != NR_PARKED) {
+		if (ret >= 0)
+			fprintf(stderr, "%d workers, want %d\n", ret,
+				NR_PARKED);
+		ret = T_EXIT_FAIL;
+	} else {
+		ret = T_EXIT_PASS;
+	}
+out:
+	release(&ring);
+	io_uring_queue_exit(&ring);
+	return ret;
+}
+
+static int run(int move)
+{
+	int status;
+	pid_t pid;
+
+	if (set_cpu(cg_a, cpu_old) || set_cpu(cg_b, cpu_new))
+		return T_EXIT_SKIP;
+	/* a child of its own, so it gets an io-wq of its own */
+	pid = fork();
+	if (pid < 0)
+		return T_EXIT_FAIL;
+	if (!pid)
+		exit(test(move));
+	if (waitpid(pid, &status, 0) < 0 || !WIFEXITED(status))
+		return T_EXIT_FAIL;
+	return WEXITSTATUS(status);
+}
+
+static int setup(void)
+{
+	char buf[256] = "";
+	struct statfs sfs;
+	cpu_set_t set;
+	int fd, i;
+	ssize_t len;
+
+	if (geteuid())
+		return T_EXIT_SKIP;
+	if (statfs(CG_ROOT, &sfs) || sfs.f_type != CGROUP2_SUPER_MAGIC)
+		return T_EXIT_SKIP;
+	fd = open(CG_ROOT "/cgroup.controllers", O_RDONLY);
+	if (fd < 0)
+		return T_EXIT_SKIP;
+	len = read(fd, buf, sizeof(buf) - 1);
+	close(fd);
+	if (len <= 0 || !strstr(buf, "cpuset"))
+		return T_EXIT_SKIP;
+	if (write_str(CG_ROOT "/cgroup.subtree_control", "+cpuset"))
+		return T_EXIT_SKIP;
+
+	if (sched_getaffinity(0, sizeof(set), &set))
+		return T_EXIT_SKIP;
+	cpu_old = cpu_new = -1;
+	for (i = 0; i < CPU_SETSIZE; i++) {
+		if (!CPU_ISSET(i, &set))
+			continue;
+		if (cpu_old < 0) {
+			cpu_old = i;
+		} else {
+			cpu_new = i;
+			break;
+		}
+	}
+	if (cpu_new < 0)
+		return T_EXIT_SKIP;
+
+	snprintf(cg_a, sizeof(cg_a), CG_ROOT "/iowq-cpuset-a.%d", getpid());
+	snprintf(cg_b, sizeof(cg_b), CG_ROOT "/iowq-cpuset-b.%d", getpid());
+	if (mkdir(cg_a, 0755) || mkdir(cg_b, 0755))
+		return T_EXIT_SKIP;
+
+	strcpy(buf, "/tmp/iowq-cpuset.XXXXXX");
+	if (!mkdtemp(buf))
+		return T_EXIT_SKIP;
+	snprintf(fifo, sizeof(fifo), "%s/fifo", buf);
+	if (mkfifo(fifo, 0600))
+		return T_EXIT_SKIP;
+	return T_EXIT_PASS;
+}
+
+static void cleanup(void)
+{
+	int i;
+
+	if (fifo[0]) {
+		unlink(fifo);
+		*strrchr(fifo, '/') = '\0';
+		rmdir(fifo);
+	}
+	/* the workers of the children may take a moment to exit */
+	for (i = 0; i < 100; i++) {
+		if (cg_a[0] && rmdir(cg_a) && errno == EBUSY) {
+			usleep(10000);
+			continue;
+		}
+		if (cg_b[0] && rmdir(cg_b) && errno == EBUSY) {
+			usleep(10000);
+			continue;
+		}
+		break;
+	}
+}
+
+int main(int argc, char *argv[])
+{
+	int ret;
+
+	if (argc > 1)
+		return T_EXIT_SKIP;
+
+	ret = setup();
+	if (ret)
+		goto out;
+
+	ret = run(0);
+	if (ret) {
+		if (ret != T_EXIT_SKIP)
+			fprintf(stderr, "cpuset change failed\n");
+		goto out;
+	}
+	ret = run(1);
+	if (ret && ret != T_EXIT_SKIP)
+		fprintf(stderr, "cgroup move failed\n");
+out:
+	cleanup();
+	return ret;
+}

base-commit: 67bc5dcc7dc31b81bc623074887e2a231ede3b54
-- 
2.43.0

