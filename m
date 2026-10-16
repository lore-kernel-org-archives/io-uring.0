Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E403BC69E
	for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 09:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142826; cv=none; b=IpMOw8RJIEoikz/cKyxJiJfVsFWjd6B1kStD/mbaZAjagrT1WQF1r4rPRoO0vPuqNLGUcGCMbjZV4BiF3O7Tvjk3Lv+RtaJOEhW4Dc9SEml5c8pHUvlVhf7y58c3W3fiWo7VXFtzPrginy/I7BbAxRrMXAVbvRmdNFqM9Cs0w94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142826; c=relaxed/simple;
	bh=ykZb9eOWIpU6VRivzCp6ymD1DwzHJZdPhV5PxoMMmM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BJeuuSuC7wsCtXHiHGXEoyCDnYnVNhqRWx/jCkGyC3+I4rMhG0Udd2XeZp03fiPcHCoxslYULaXPLHsaRALujyXhhmWGozPc1O6L35MesF6QgdcKWelToouLuyEzlYlqFby6AAt2aPAYyx5A60r0UqO9O0YHhbxmJN5/gW1UdXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=szFK6sCV; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="szFK6sCV"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df4f540ebso964557f8f.3
        for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 02:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792142823; x=1792747623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eiVptqA2ijjSQh+4bOd5h/jNNFZrvsWCv7TeILE2UVo=;
        b=szFK6sCVnIwNaT2LeJroFT0MQ9krh9edyAF0L1hCgC/dNLji6EdAlDsdFXNguEiqoc
         Ew3V0FErR8dfa84AXQG3ae9kiZqAQ8hXReLmLAMPV3u1YaLgXK7OcsHe9YgPNNXi8zH7
         Pr+SoT6aHT8HZhIAy4MPnXx9YQJhX7LaW4MViCsxszTtFgNGcMH+mkTjf1mL/Efgz+me
         x1IjQH6qRrQghggjSU1egXAv5kwjqWwhr/5OM1iFPgEI6gA3aMnUVwLv7odnM3l/VWQJ
         /TLBDx+fX2z5mpLeISFbhMQeV8oRGWLXSSPsMJuJFBeOh+mlAz6R6V/WmGFVfWylOwA/
         hJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142823; x=1792747623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eiVptqA2ijjSQh+4bOd5h/jNNFZrvsWCv7TeILE2UVo=;
        b=gbWeHsuM8se5bDaTJb6z79v0Tv77VoHR/dB6pISHoKm8CvrPOxvvzkEhdYSwC6rBRn
         oW1A7sRJIP4aBk/28KbW6KpUMAkrZbqb8BrrApwsP63ZENE6tKb1Maya4ZPx1v0h48z9
         O9Fk2gIHXjOIiwYVVJo74VCG9AO5L3NEVApGzjL2MVjfDf/5aPFhwEyHMJWY+kb0PwJQ
         yBF+JnF7Lucqc3DRHS08Kfz5vDa4j0qaGbgXJssj1QurY+Bz7FJUHcEvWW5+/6nwI3Yh
         hgTQrvchtvuvMdbFnkC8vL56Yf7ugCi8XfbL1pwTuRGgevDvEkMFJtw6M0YIZd4q6hiu
         ardA==
X-Gm-Message-State: AFq9FYLUxMd6YbYyVtHtCrA90o7wSkocX75RMlS4r5TPx12WzUVqI4F9
	meSN1Rrei05Jqmr7iTnPTeV5praCFjjr8dWy6Bm7cb/wJqjNbI/4hmN9oMVtQg==
X-Gm-Gg: AYBFou1zXbHQgS8r44EBEpvUgHuWvvlMcrrWzRFhOGsisanNIu0f+kTWSm5Xgr0xYjr
	p61mdEQ5IO90nOjtrdCkCw9oxe8NZws0Ni0jUBq8xMybtM6jOVIGD+nKzFhog6B4G2iot8pPmXy
	22lH63aJ9RznROGgfqVPJDb/124llFfOUTMErI0CNlmXP3mjokop4jPfsw4DHFYDRkZo43mtQyY
	igJ7/AsfcPW+vzsbfPgVX02C4tJxjI5wLjhuPG2jjspi1uER3uA1XTLBMZ28KrDtJZPXfLExukp
	tXwFfwAIOcuucW2mX2EsHhg/It15a4eRojDtqG2nWGXhBJhoAhNuLiX7N1KG0U9eg4xnaahpvX2
	0OeCgiXjW8ArMGTxjcJAGjP9ljnhNz/Cl0mG+l4kzUooIavbLS7it3AV7okiFjiSWS4IXx01BmA
	/DUF0DvEPMIsk5KEQFqWTlR0W4Pi7+LqBigxwHJdtB/FwVIBxguurFKUra3emFUivmRg1E44ZIy
	gs3/5ILtyy51CBcDijDBDlSiPm0qY7IC9dPy19zWzDQ62zKrilNoaCMqf8dkkd1zVGNUFmQpspD
X-Received: by 2002:a05:6000:188a:b0:48b:e54:84a1 with SMTP id ffacd0b85a97d-48dbad092e5mr46597197f8f.55.1792142823336;
        Fri, 16 Oct 2026 02:27:03 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5ad06bsm3898167f8f.14.2026.10.16.02.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:27:02 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	Jens Axboe <axboe@kernel.dk>,
	Nitesh Shetty <nj.shetty@samsung.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Anuj Gupta <anuj20.g@samsung.com>,
	Tushar Gohad <tushar.gohad@intel.com>,
	William Power <william.power@intel.com>
Subject: [PATCH] io_uring/dma-buf: allow cloning registered dma-bufs
Date: Fri, 16 Oct 2026 10:26:55 +0100
Message-ID: <b76cf21ee0e2362489c864e43781b20d95fd75f7.1792142588.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One problem that was brought up is that the file table size is often a
limiting factor when working with dma-bufs, which is quite an old
problem. With a single io_uring people can work it around by closing
the dma-buf fd after registration, but for more complex cases we need
a way to dynamically register it into another ring. We also need to
deduplicate internal registrations as each creates a new attachment and
related structures, which could involve large allocations and iommu
mappings. Solve it by enabling io_uring buffer cloning.

I made dma-bufs registered for io_uring not cloneable between rings
because the implementation could modify parts of struct io_buf_dma
without any locking and sharing it would've created races. That was an
optimisation that got dropped at some point for simplicity, so we can
safely enable cloning back as long as IORING_SETUP_IOPOLL rejection
is honoured. Kill the uncloneable flag as unused as well.

Reported-by: William Power <william.power@intel.com>
Reported-by: Tushar Gohad <tushar.gohad@intel.com>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---

Some tests using it:
https://github.com/isilence/liburing/commits/rw-dmabuf-tests

 io_uring/dma-buf.c | 7 ++++++-
 io_uring/rsrc.c    | 4 +++-
 io_uring/rsrc.h    | 3 +--
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/io_uring/dma-buf.c b/io_uring/dma-buf.c
index 1a1a88640823..132e3d0d7023 100644
--- a/io_uring/dma-buf.c
+++ b/io_uring/dma-buf.c
@@ -18,6 +18,11 @@ int __io_register_dmabuf(struct io_ring_ctx *ctx,
 	struct dma_buf *dmabuf = NULL;
 	int ret;
 
+	/*
+	 * We have to drop the dma-buf map early when IO is finished. Disable
+	 * IOPOLL for now as we can't wait potentially infintely for a task
+	 * to do that.
+	 */
 	if (ctx->flags & IORING_SETUP_IOPOLL)
 		return -EOPNOTSUPP;
 	if (desc->uaddr || desc->size)
@@ -51,7 +56,7 @@ int __io_register_dmabuf(struct io_ring_ctx *ctx,
 	imu->len = dmabuf->size;
 	imu->release = io_release_dmabuf;
 	imu->priv = bd;
-	imu->flags = IO_REGBUF_F_DMABUF | IO_REGBUF_F_UNCLONEABLE;
+	imu->flags = IO_REGBUF_F_DMABUF;
 	imu->dir = IO_BUF_DEST | IO_BUF_SOURCE;
 	dma_buf_put(dmabuf);
 	return 0;
diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 2e89e091afbb..d64228b0e19e 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1507,7 +1507,9 @@ static int io_clone_buffers(struct io_ring_ctx *ctx, struct io_ring_ctx *src_ctx
 		if (!src_node) {
 			dst_node = NULL;
 		} else {
-			if (src_node->buf->flags & IO_REGBUF_F_UNCLONEABLE) {
+			/* we don't allow IOPOLL rw with dma-buf for now */
+			if ((src_node->buf->flags & IO_REGBUF_F_DMABUF) &&
+			    (ctx->flags & IORING_SETUP_IOPOLL)) {
 				io_rsrc_data_free(ctx, &data);
 				return -EOPNOTSUPP;
 			}
diff --git a/io_uring/rsrc.h b/io_uring/rsrc.h
index d893cc5e580a..418d236152ff 100644
--- a/io_uring/rsrc.h
+++ b/io_uring/rsrc.h
@@ -27,8 +27,7 @@ struct io_rsrc_node {
 
 enum {
 	IO_REGBUF_F_KBUF		= 1 << 0,
-	IO_REGBUF_F_UNCLONEABLE		= 1 << 1,
-	IO_REGBUF_F_DMABUF		= 1 << 3,
+	IO_REGBUF_F_DMABUF		= 1 << 1,
 };
 
 enum {
-- 
2.54.0

