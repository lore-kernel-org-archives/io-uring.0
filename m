Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DAD3C0A08
	for <io-uring@vger.kernel.org>; Tue, 21 Jul 2026 09:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784624847; cv=none; b=eSNBW2gLJmwNIYDIxOBmnYG4xDuwy8IOw77EU6DTG52S0Q0694t1XXnU2ERRQvDgXy5D8iG3wrLom4GxY0asdlHnKj04Mf91h5AKBrI6jsnELDThR6n4ab66+vNvDbLQBQhaMiHPYmQUW5X0WuLxNJ9iNd9bBH5lQ03UkcrovII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784624847; c=relaxed/simple;
	bh=DW1uYazlN4mJBPODm5JZ+6Yv1hEQOcFIo84INv0ukAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YXS/DK3wscTsEfjIjie5tEVRkqpBfWEhAmcpTfmTIibalq7ZHosGDKdvipV71IwSgu4mbE+FP5h7mHoi0/1X27bx14LE5XZfK6018upwxGOgv3kLwoiU7RVfBxaw0Ud1tn3Ti0vmu9iYEz6ckqkZn043pwmWtp9fEYJbZwqBtAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsyhKgLU; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PsyhKgLU"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso126878745ad.3
        for <io-uring@vger.kernel.org>; Tue, 21 Jul 2026 02:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784624845; x=1785229645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WOX8gQ7ioq0/VRHLmpPhZEI1mv1X14cl6AVZtJwxQac=;
        b=PsyhKgLUchYTfj/zdhAEo/+9g4NhBNeehVS06pgMnJup28igpHN6KHVP9Ay+81hBL4
         3WVY6q0ntvWILjAV73du2AW59OMkLGc1VaD7ngmxCFH7MplwBIonht72Dnve18JHLI95
         AA02YH5CZqTXWOzwBEuZnDoc4ELpiHvh2PpqUvdbn7pHiC73cOy9TjwxHVzp5Cw2VZcF
         rx8Nkc419Yki2yIhEAU/Y4tJV0+pGUq1dua7tmf84N/gwoWd9AXruL9w4nZqLExM1Bux
         CjQYlaBjA5PxBLIQfzqaQJxOn9Vr+UVlAwFnND1VzXs2iQXwiVO0I+nbDp1+lexDk//q
         42Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784624845; x=1785229645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WOX8gQ7ioq0/VRHLmpPhZEI1mv1X14cl6AVZtJwxQac=;
        b=kcV9nNujdZj6t2r/OTG7mCWaIaAxLIP9vlZ7L1vWJ196iSYc+tyeK/GLEAAmKMdHcN
         SOwCMkspsjjMZn73azgLz8rFyrITtZxjVAv/YH1Mu8xH2y+OM5h9QJ+DABK7AWGoyPpu
         RdrBMBwhdcswJzsNsgZ11s8Ioz8hb2oVIuQTYlBTucEqaRDGk/Y3eQpjQrfkPZoZoQ6r
         Pq5a8SJneB4GcM11hcwntlzcrscoIIcgSIsRkAr9Z2tpH08A+3BMMIQ9KkHM2AUu49Zx
         WDqtO3evkLPxNGFnX2253gyUgjL0Ued28wL73OK1ozhMRX+DVlLenbCg4mtkPjDV+/rJ
         f55Q==
X-Forwarded-Encrypted: i=1; AHgh+RplXDqFyavSIfoPz8KuCtG3i0WCcake3GvFVkreUl71kXw+8VAmPqLl8EV3SC77cXqn97dGcMlUug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEsJPNRlrxvFfGoOy8VPriyC2+eKKsl/l1bWHyGJ7cLAOVVRt/
	GovvKKG20Yenw0pNSa4iihJ59sqgPKC36bjT/lZhvEw+AkhHNmoHl+sm
X-Gm-Gg: AR+sD12lqsgZmbrpFrKJdo8nzxvWyzzl0UoKiheLPjQRCWseAYFV9FzgJCp1bS3G2my
	raRIoBqAAJ83vJoJXLJjtzkTRv3K+J5N9vy+6jNoRzTG8EPE4DSTngHIuRNOeIDHaUZvE7nP+8L
	FHvEQuvl95+ohFjklzQQjsz+XUIFFTrly6JwDajmlasCpU7z8B/hCJSyw0X3jpECDprQEJOZxha
	pDOrtfAblQ/nW8g9UgvPzEs1cazfPiqWQoxz1vYorguikC+ZU52UxULo5bk9fAbsXgdzrh+55Q9
	QBcpw8LPVDTDi4HkyeA3Pa1Pt+nIpuP17HGsvjLwIzYRL3/k1W+FfLKYC6p13c8d6lcJK9nNV0e
	Hn+EBLJ9qjcq1x/ZIh26WbMUizz7FiHp2Lorpqx719xGNTCRRFEYS9W/un0EUkhHhpdoR1dcSOn
	uPERuBzfG7MhyTxIQhxA/k+nIN9P+svpDKQgRkMVUWGQWsrkbzF5qOyh734/T+hanYcC64LR+o2
	cv5iqSyydUyv4lTGB5TMEQRCszN7gfTRi0uhTwjLqtmOxNHfBt0YpTRWwbjT/re4DCRk/IuBj+y
	tAFRnoBlCJcIYVOS5s6h
X-Received: by 2002:a17:902:dace:b0:2cc:5f9f:54ed with SMTP id d9443c01a7336-2cf34a0a1e8mr192487455ad.27.1784624845086;
        Tue, 21 Jul 2026 02:07:25 -0700 (PDT)
Received: from cs-1047136853211-default.asia-southeast1-b.c.z168d0f9edf9bc766-tp.internal (8.99.126.34.bc.googleusercontent.com. [34.126.99.8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1dd90fsm44206552eec.22.2026.07.21.02.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:07:24 -0700 (PDT)
From: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
To: axboe@kernel.dk
Cc: asml.silence@gmail.com,
	io-uring@vger.kernel.org,
	Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
Subject: [PATCH] liburing: add fremovexattr and flistxattr support
Date: Tue, 21 Jul 2026 09:06:59 +0000
Message-ID: <20260721090659.2845-1-aditya.ansh182@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the new IORING_OP_FREMOVEXATTR and
IORING_OP_FLISTXATTR opcodes:
- Add opcodes to src/include/liburing/io_uring.h
- Register sanitizers in src/sanitize.c (updating static assert)
- Implement inline prep functions in src/include/liburing.h:
  - io_uring_prep_fremovexattr()
  - io_uring_prep_flistxattr()
- Add full functional and negative failure tests in test/xattr.c

Signed-off-by: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
---
 src/include/liburing.h          |  17 ++++
 src/include/liburing/io_uring.h |   2 +
 src/sanitize.c                  |   4 +-
 test/xattr.c                    | 173 ++++++++++++++++++++++++++++++++
 4 files changed, 195 insertions(+), 1 deletion(-)

diff --git a/src/include/liburing.h b/src/include/liburing.h
index 0188937b..f99f51fe 100644
--- a/src/include/liburing.h
+++ b/src/include/liburing.h
@@ -1513,6 +1513,23 @@ IOURINGINLINE void io_uring_prep_fsetxattr(struct io_uring_sqe *sqe, int fd,
 	sqe->xattr_flags = flags;
 }
 
+IOURINGINLINE void io_uring_prep_fremovexattr(struct io_uring_sqe *sqe, int fd,
+					      const char *name)
+	LIBURING_NOEXCEPT
+{
+	io_uring_prep_rw(IORING_OP_FREMOVEXATTR, sqe, fd, name, 0, 0);
+	sqe->xattr_flags = 0;
+}
+
+IOURINGINLINE void io_uring_prep_flistxattr(struct io_uring_sqe *sqe, int fd,
+					    char *list, unsigned int len)
+	LIBURING_NOEXCEPT
+{
+	io_uring_prep_rw(IORING_OP_FLISTXATTR, sqe, fd, NULL, len,
+				(__u64) (uintptr_t) list);
+	sqe->xattr_flags = 0;
+}
+
 IOURINGINLINE void io_uring_prep_socket(struct io_uring_sqe *sqe, int domain,
 					int type, int protocol,
 					unsigned int flags)
diff --git a/src/include/liburing/io_uring.h b/src/include/liburing/io_uring.h
index b9ec1ebf..89480960 100644
--- a/src/include/liburing/io_uring.h
+++ b/src/include/liburing/io_uring.h
@@ -312,6 +312,8 @@ enum io_uring_op {
 	IORING_OP_PIPE,
 	IORING_OP_NOP128,
 	IORING_OP_URING_CMD128,
+	IORING_OP_FREMOVEXATTR,
+	IORING_OP_FLISTXATTR,
 
 	/* this goes last, obviously */
 	IORING_OP_LAST,
diff --git a/src/sanitize.c b/src/sanitize.c
index 37fb63e6..45f6f60c 100644
--- a/src/sanitize.c
+++ b/src/sanitize.c
@@ -121,8 +121,10 @@ static const sanitize_sqe_handler sanitize_handlers[IORING_OP_LAST] = {
 	[IORING_OP_PIPE] = sanitize_sqe_addr,
 	[IORING_OP_NOP128] = sanitize_sqe_nop,
 	[IORING_OP_URING_CMD128] = sanitize_sqe_optval,
+	[IORING_OP_FREMOVEXATTR] = sanitize_sqe_addr,
+	[IORING_OP_FLISTXATTR] = sanitize_sqe_addr2,
 };
-_Static_assert(IORING_OP_URING_CMD128 + 1 == IORING_OP_LAST,
+_Static_assert(IORING_OP_FLISTXATTR + 1 == IORING_OP_LAST,
 	       "Need an implementation for all IORING_OP_* codes");
 
 void liburing_sanitize_ring(struct io_uring *ring)
diff --git a/test/xattr.c b/test/xattr.c
index 6448e063..4b7338c8 100644
--- a/test/xattr.c
+++ b/test/xattr.c
@@ -173,6 +173,71 @@ static int io_uring_getxattr(struct io_uring *ring, const char *path,
 	return ret;
 }
 
+/* Submit fremovexattr request. */
+static int io_uring_fremovexattr(struct io_uring *ring, int fd, const char *name)
+{
+	struct io_uring_sqe *sqe;
+	struct io_uring_cqe *cqe;
+	int ret;
+
+	sqe = io_uring_get_sqe(ring);
+	if (!sqe) {
+		fprintf(stderr, "Error cannot get sqe\n");
+		return -1;
+	}
+
+	io_uring_prep_fremovexattr(sqe, fd, name);
+
+	ret = io_uring_submit(ring);
+	if (ret != 1) {
+		fprintf(stderr, "Error io_uring_submit_and_wait: ret=%d\n", ret);
+		return -1;
+	}
+
+	ret = io_uring_wait_cqe(ring, &cqe);
+	if (ret) {
+		fprintf(stderr, "Error io_uring_wait_cqe: ret=%d\n", ret);
+		return -1;
+	}
+
+	ret = cqe->res;
+	io_uring_cqe_seen(ring, cqe);
+	return ret;
+}
+
+/* Submit flistxattr request. */
+static int io_uring_flistxattr(struct io_uring *ring, int fd, char *list,
+			       size_t size)
+{
+	struct io_uring_sqe *sqe;
+	struct io_uring_cqe *cqe;
+	int ret;
+
+	sqe = io_uring_get_sqe(ring);
+	if (!sqe) {
+		fprintf(stderr, "Error cannot get sqe\n");
+		return -1;
+	}
+
+	io_uring_prep_flistxattr(sqe, fd, list, size);
+
+	ret = io_uring_submit(ring);
+	if (ret != 1) {
+		fprintf(stderr, "Error io_uring_submit_and_wait: ret=%d\n", ret);
+		return -1;
+	}
+
+	ret = io_uring_wait_cqe(ring, &cqe);
+	if (ret) {
+		fprintf(stderr, "Error io_uring_wait_cqe: ret=%d\n", ret);
+		return -1;
+	}
+
+	ret = cqe->res;
+	io_uring_cqe_seen(ring, cqe);
+	return ret;
+}
+
 /* Test driver for fsetxattr and fgetxattr. */
 static int test_fxattr(void)
 {
@@ -227,6 +292,104 @@ static int test_fxattr(void)
 		goto Exit;
 	}
 
+	/* Test flistxattr. */
+	char list_buf[XATTR_SIZE];
+	int list_len;
+
+	list_len = io_uring_flistxattr(&ring, fd, list_buf, XATTR_SIZE);
+	if (list_len < 0) {
+		fprintf(stderr, "Error: flistxattr failed with %d\n", list_len);
+		rc = -1;
+		goto Exit;
+	}
+
+	int found_key1 = 0, found_key2 = 0;
+	char *p;
+
+	p = list_buf;
+	while (p < list_buf + list_len) {
+		if (strcmp(p, KEY1) == 0)
+			found_key1 = 1;
+		else if (strcmp(p, KEY2) == 0)
+			found_key2 = 1;
+		p += strlen(p) + 1;
+	}
+	if (!found_key1 || !found_key2) {
+		fprintf(stderr, "Error: flistxattr did not return both keys\n");
+		rc = -1;
+		goto Exit;
+	}
+
+	/* Test fremovexattr for key1. */
+	ret = io_uring_fremovexattr(&ring, fd, KEY1);
+	if (ret < 0) {
+		fprintf(stderr, "Error: fremovexattr on key1 failed with %d\n", ret);
+		rc = -1;
+		goto Exit;
+	}
+
+	/* Verify key1 is gone via fgetxattr. */
+	ret = io_uring_fgetxattr(&ring, fd, KEY1, value, XATTR_SIZE);
+	if (ret >= 0) {
+		fprintf(stderr, "Error: fgetxattr key1 should have failed after fremovexattr\n");
+		rc = -1;
+		goto Exit;
+	}
+
+	/* Verify flistxattr now only has key2. */
+	list_len = io_uring_flistxattr(&ring, fd, list_buf, XATTR_SIZE);
+	if (list_len < 0) {
+		fprintf(stderr, "Error: second flistxattr failed with %d\n", list_len);
+		rc = -1;
+		goto Exit;
+	}
+
+	found_key1 = 0; found_key2 = 0;
+	p = list_buf;
+	while (p < list_buf + list_len) {
+		if (strcmp(p, KEY1) == 0)
+			found_key1 = 1;
+		else if (strcmp(p, KEY2) == 0)
+			found_key2 = 1;
+		p += strlen(p) + 1;
+	}
+	if (found_key1 || !found_key2) {
+		fprintf(stderr, "Error: flistxattr unexpected keys after removing key1\n");
+		rc = -1;
+		goto Exit;
+	}
+
+	/* Test fremovexattr for key2. */
+	ret = io_uring_fremovexattr(&ring, fd, KEY2);
+	if (ret < 0) {
+		fprintf(stderr, "Error: fremovexattr on key2 failed with %d\n", ret);
+		rc = -1;
+		goto Exit;
+	}
+
+	/* Verify both are gone from flistxattr. */
+	list_len = io_uring_flistxattr(&ring, fd, list_buf, XATTR_SIZE);
+	if (list_len < 0) {
+		fprintf(stderr, "Error: third flistxattr failed with %d\n", list_len);
+		rc = -1;
+		goto Exit;
+	}
+
+	found_key1 = 0; found_key2 = 0;
+	p = list_buf;
+	while (p < list_buf + list_len) {
+		if (strcmp(p, KEY1) == 0)
+			found_key1 = 1;
+		else if (strcmp(p, KEY2) == 0)
+			found_key2 = 1;
+		p += strlen(p) + 1;
+	}
+	if (found_key1 || found_key2) {
+		fprintf(stderr, "Error: flistxattr returned keys after removing all keys\n");
+		rc = -1;
+		goto Exit;
+	}
+
 	/* Cleanup. */
 Exit:
 	close(fd);
@@ -331,6 +494,16 @@ static int test_failure_fxattr(void)
 	if (io_uring_fgetxattr(&ring, fd, KEY1, value, 0) != 0)
 		return 1;
 
+	/* Test list attributes failures. */
+	if (io_uring_flistxattr(&ring, -1, value, XATTR_SIZE) >= 0)
+		return 1;
+
+	/* Test remove attributes failures. */
+	if (io_uring_fremovexattr(&ring, -1, KEY1) >= 0)
+		return 1;
+	if (io_uring_fremovexattr(&ring, fd, NULL) >= 0)
+		return 1;
+
 	/* Cleanup. */
 	close(fd);
 	unlink(FILENAME);
-- 
2.47.3

