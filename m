Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680350;
	b=hIK6okNu9nHuuzK2aS3g7Sn/f70YfJZr2BatW2mpFc+H8qvjP9qdufToaJoSpZn5OgBS
	 0rLsu4LYZ/SDsSkbhJ1uab3Hgy/QpTDF+nIlY9KeB0TElwBExxkvV4GKtApobm9yAYZ3g
	 evloPcM1wCdaPRtKIEW7mcajoN5PydzgnK+6JOhk0a3ISIxPX9NNBGTYU9DCBEXpiW+V0
	 ytdlYlohhUDy6tCDaMbwJBpvpXO/a8smW8UyZE/G8OnrZMiO1ils1g3F1JzqweGP1i0/X
	 r7AHtolgJl+t183Bbh2wId/9PhgAs5vXHJVDNWTFo6eYjrwd6QdWSTLN/NwiboNbalQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8Bvapck2YZWyHBU4/NPzDAoWoqpmu4MGPJ1W1o84MUI=;
	b=w/U8mazcJRjjfopR3bD4NGlQNtZQCOL/cVphJ8DJXmqMpVga4n7mq3dQ6fH80KjSNvrc
	 tH//uY/c6NMY2BlV/3vDC7wfzn2MQ+UQjvlIZf05bv2OwP7UiKCNh8DygFEf6baBLPAhm
	 EiGCQDhqflq+zAfn3GZl0twS7VOnyBr4X475EYTPVAa5Szx6at94XrpA8Not3sVvtlpVE
	 RnQF5aPylvgTnjTW8Xnj/qkBMa+DqPWbupfbEfblbfa+qDXoD0hRWBaxgrn1kTzTSbMwR
	 ew92J8dwKGyIrvC2l5ZfQTNOiRPNTOqOJTGcBTvZ45N0nT6GwZQXkassCz0yUkNM50Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P9SOghJH;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75DF606A319
	for <io-uring@vger.kernel.org>; Thu, 22 Oct 2026 14:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C75DF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P9SOghJH
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15dd124bbe7so3613795c88.1
        for <io-uring@vger.kernel.org>; Thu, 22 Oct 2026 07:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680349; x=1793285149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Bvapck2YZWyHBU4/NPzDAoWoqpmu4MGPJ1W1o84MUI=;
        b=P9SOghJHObLq9J5Tiaoz7sSrJUBjqbMaAaEVeg6HivGx2sgyt79pFvmte4xPwYiRY1
         RYvY5bYLVTxgBoLtzQxKxde473SW6YhXxV4Z8MUXBUHgPoHA4gnbJKK9Xzx56YRbeySn
         WD1srDNYYn29WCupO9wDHleWFMilODG12NQMkdsUgbra1pKBekay/iIAfdUPiMFrvxS0
         ZEVzUrJmn3LDG4XvYTkH3facur7BERUUC051UA9lckveOTJNsc9ZADXkANI6VayFadPI
         s9zZNztNMKBHH9KdHCyPzkoYLx5disFyq1C+86eLx0csZhlvd/9V2Ftj/00OyZzc4bi7
         ejwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680349; x=1793285149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Bvapck2YZWyHBU4/NPzDAoWoqpmu4MGPJ1W1o84MUI=;
        b=GHxq2x7LLTFEHOn1ZvoQTnxpvcFvrIoRdKFncExz7eipXn3Vj/3PMv7NVvHmcNRyOJ
         HFqjkF74SAYE4ucAnijLTb3iOWcKK1PH2ndgjiMxq8X8sL8a0glliry/qavwWlu3OkX3
         Zdzf0cgQ0qrleOI3zLxIkHwrr8IAnwh4ZOKrgZ67fldSADezQARSxKHhzKQILdAieoO4
         qI/mh0NaUuC8nyxPRJKg3CJSQQY70ASqhVWzAdkrnsAz0PmsEY8DxA5OHqLLQtjJlpc+
         i+1W8I+5Zx7tHNhGyRcBMifh1bOGzNQEB5vIwXlYPQYggvYnNhIs3+F6nm20QNJGvo1n
         nYmA==
X-Gm-Message-State: AFq9FYKDzTgvBBTIQZTejLCP4eRZRbXvjlt/LRRaPiFjh27voiksaNoq
	VANwi2R5CN29AeSyEVV08WflpHQzq0y5c2K6bGOoGYUVgMB3nTWA/9s=
X-Gm-Gg: AYBFou3k0Ba8QyVuIa+Bl+aA/6K7L2S1fRg8/HDaDpI7ZdlWpsePSnbtW2iq1cu8e6p
	ktgr4V8SAtdPX94Uvq0XLVNdLx4RiL9CYh4WyMDZNyRPoLRljVER2+DQrcGzcpqzUXcBXhC8CCG
	rKMOVEengnJM4xE/aPTB40Ugb3dS2AWuo9cPmW2IcZIrEZArQbU6f3GjLXM/gj/xp2WdwrTOYow
	chXjY10v8G6w3htUxOPeMuPsF1l1GwBC8KElsrsufyCnTWZJ3/4Mb7n6ZswW/inaJ45B2+iz85K
	ItqEFgxov1l44Ofsp1I70PTVwnHxPXb2R0sFXZ3tN3bSqalUm1TYKOiYtK9LH3qCuwvQ1EMqIUr
	Aretowy/dDGcFQM6KiaC5A2Jj96Jcv6CuGfZRe3xUvDkJGQDWZFnXhzvtbS+qW1DtrFVsqHEgPC
	YgWYbrb7phIhk4+SO1/u0Tis9h2icxYBUb6DNauQzIECpemuFUOKRHmF2NQ3QFs1HwMQ5iJEn+Y
	0tRWwZH79VDL+sP7eetLfCx+PSRVU9kAUD7rR/jpCqIG7YBivL3IIY5IkId1SyZYRK6Bjeaxjcq
	E5h86OFVXI2PfH8ZHsUj0fgLTU1qKH9d69oxnHrQhLYjLsBO5zmoLUhluG3C5EJG
X-Received: by 2002:a05:701b:4284:10b0:14a:9dc3:dd11 with SMTP id a92af1059eb24-190a5999e7fmr7654858c88.18.1792680348543;
        Thu, 22 Oct 2026 07:45:48 -0700 (PDT)
Received: from anuj-MacBookPro.. ([2406:7400:63:e55a:5016:92c7:7a35:f3ff])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a275026sm23625880c88.5.2026.10.22.07.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:45:47 -0700 (PDT)
From: Anuj Gupta <anuj1072538@gmail.com>
To: axboe@kernel.dk,
	asml.silence@gmail.com,
	kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	bernd@bsbernd.com,
	joannelkoong@gmail.com,
	miklos@szeredi.hu
Cc: io-uring@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	joshi.k@samsung.com,
	anuj20.g@samsung.com
Subject: [PATCH v2 1/5] io_uring/rsrc: pass import flags to io_import_reg_buf()
Date: Thu, 22 Oct 2026 20:14:52 +0530
Message-ID: <20261022144501.2478417-2-anuj1072538@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022144501.2478417-1-anuj1072538@gmail.com>
References: <20261022144501.2478417-1-anuj1072538@gmail.com>
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

From: Anuj Gupta <anuj20.g@samsung.com>

Give io_import_reg_buf() the import flags argument and drop the
__io_import_reg_buf() variant, which only existed to pass them.

No functional change.

Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 io_uring/net.c       |  6 +++---
 io_uring/rsrc.c      |  6 +++---
 io_uring/rsrc.h      | 13 +++----------
 io_uring/rw.c        |  5 +++--
 io_uring/uring_cmd.c |  2 +-
 5 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/io_uring/net.c b/io_uring/net.c
index 050ed274170a..63089744d43e 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -644,7 +644,7 @@ int io_send(struct io_kiocb *req, unsigned int issue_flags)
 	if (req->flags & REQ_F_IMPORT_BUFFER) {
 		ret = io_import_reg_buf(req, &kmsg->msg.msg_iter,
 					(u64)(uintptr_t)sr->buf, sr->len,
-					ITER_SOURCE, issue_flags);
+					ITER_SOURCE, issue_flags, 0);
 		if (unlikely(ret))
 			return ret;
 		req->flags &= ~REQ_F_IMPORT_BUFFER;
@@ -1216,7 +1216,7 @@ int io_recv(struct io_kiocb *req, unsigned int issue_flags)
 	if (req->flags & REQ_F_IMPORT_BUFFER) {
 		ret = io_import_reg_buf(req, &kmsg->msg.msg_iter,
 					(u64)(uintptr_t)sr->buf, sr->len,
-					ITER_DEST, issue_flags);
+					ITER_DEST, issue_flags, 0);
 		if (unlikely(ret)) {
 			kmsg->msg.msg_inq = -1;
 			sel.buf_list = NULL;
@@ -1509,7 +1509,7 @@ static int io_send_zc_import(struct io_kiocb *req,
 	if (!(sr->flags & IORING_SEND_VECTORIZED)) {
 		ret = io_import_reg_buf(notif, &kmsg->msg.msg_iter,
 					(u64)(uintptr_t)sr->buf, sr->len,
-					ITER_SOURCE, issue_flags);
+					ITER_SOURCE, issue_flags, 0);
 	} else {
 		unsigned uvec_segs = kmsg->msg.msg_iter.nr_segs;
 
diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index d64228b0e19e..1abfbb86dae8 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1365,9 +1365,9 @@ inline struct io_rsrc_node *io_find_buf_node(struct io_kiocb *req,
 	return NULL;
 }
 
-int __io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
-			u64 buf_addr, size_t len, int ddir,
-			unsigned issue_flags, unsigned import_flags)
+int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
+		      u64 buf_addr, size_t len, int ddir,
+		      unsigned issue_flags, unsigned import_flags)
 {
 	struct io_rsrc_node *node;
 
diff --git a/io_uring/rsrc.h b/io_uring/rsrc.h
index 418d236152ff..6226c7862d4e 100644
--- a/io_uring/rsrc.h
+++ b/io_uring/rsrc.h
@@ -66,21 +66,14 @@ int io_rsrc_data_alloc(struct io_rsrc_data *data, unsigned nr);
 
 struct io_rsrc_node *io_find_buf_node(struct io_kiocb *req,
 				      unsigned issue_flags);
-int __io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
-			u64 buf_addr, size_t len, int ddir,
-			unsigned issue_flags, unsigned import_flags);
+int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
+		      u64 buf_addr, size_t len, int ddir,
+		      unsigned issue_flags, unsigned import_flags);
 int __io_import_reg_vec(int ddir, struct iov_iter *iter,
 			struct io_kiocb *req, struct iou_vec *vec,
 			unsigned nr_iovs, unsigned issue_flags,
 			unsigned import_flags);
 
-static inline int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
-				    u64 buf_addr, size_t len, int ddir,
-				    unsigned issue_flags)
-{
-	return __io_import_reg_buf(req, iter, buf_addr, len, ddir, issue_flags, 0);
-}
-
 static inline int io_import_reg_vec(int ddir, struct iov_iter *iter,
 				    struct io_kiocb *req, struct iou_vec *vec,
 				    unsigned nr_iovs, unsigned issue_flags)
diff --git a/io_uring/rw.c b/io_uring/rw.c
index d33b925a848e..71782a23e16b 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -360,8 +360,9 @@ static int io_init_rw_fixed(struct io_kiocb *req, unsigned int issue_flags,
 	int ret;
 
 	if (!io->bytes_done) {
-		ret = __io_import_reg_buf(req, &io->iter, rw->addr, rw->len, ddir,
-					  issue_flags, IO_REGBUF_IMPORT_ALLOW_DMABUF);
+		ret = io_import_reg_buf(req, &io->iter, rw->addr, rw->len, ddir,
+					issue_flags,
+					IO_REGBUF_IMPORT_ALLOW_DMABUF);
 		if (ret)
 			return ret;
 		iov_iter_save_state(&io->iter, &io->iter_state);
diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
index 73b606899833..45c9c845f5d0 100644
--- a/io_uring/uring_cmd.c
+++ b/io_uring/uring_cmd.c
@@ -279,7 +279,7 @@ int io_uring_cmd_import_fixed(u64 ubuf, unsigned long len, int rw,
 	if (WARN_ON_ONCE(!(ioucmd->flags & IORING_URING_CMD_FIXED)))
 		return -EINVAL;
 
-	return io_import_reg_buf(req, iter, ubuf, len, rw, issue_flags);
+	return io_import_reg_buf(req, iter, ubuf, len, rw, issue_flags, 0);
 }
 EXPORT_SYMBOL_GPL(io_uring_cmd_import_fixed);
 
-- 
2.43.0

