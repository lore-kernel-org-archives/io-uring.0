Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CE43BB9F1
	for <io-uring@vger.kernel.org>; Sat, 11 Jul 2026 10:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783766438; cv=none; b=Wg8odS3uMnR/ViSoQhz4cqX7AJDPMESuuPBFGNa2O4aruou6z8GdkQv56Ilj2VKrWLp3qcKW9gFCzFZDzGP7pBITWE44+MQ9++Q+/+1+scSX28txvbbi+8TAEYRMRJ99WL6dzxWwp91ytH5Ah7iWLgPEGLXL++DAKEjUkKtnHzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783766438; c=relaxed/simple;
	bh=9u/CgzNLweE2bHe16o0shDoOVpp7jtVmWikbjcRPcwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yl5uQ3jIuiojExh5HCsz3hhhIHZqRgYryyQx2/LAaAUAQGT9CmylG6+CsFWeTtMiQJr6tNvRsqoaGUtco7LnX3NH48g+GE/w/T2zVrB9/fJRcGSlNiCuKjiu3EPmg5n96vEHQ+xNhRXoNyj1NvgDPk0xLt6Vv9+wplUNcMtm0ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KyHrPPTE; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KyHrPPTE"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15f360851aso248261266b.2
        for <io-uring@vger.kernel.org>; Sat, 11 Jul 2026 03:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783766435; x=1784371235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=REzXyFdz7dKZUYmmyceB7y7FvYAAlICsxOnPzqdIdiY=;
        b=KyHrPPTESGCwXBF4xhEksFSj9IY7lyL98885vtAG6q55kqy+h5JeZPSPzVsvgPLXhw
         Eqcq1z2Emu6hLXBNF10W19+KqPViv760QM2b1fI2T58WdwQEeuUyB6xQlX3rxUfQG5cG
         njqRdiIEsvFx14zbwx+AiTudmEo7UdE+BzlD+isnH7lhffSeA5Uqt4NDT5yCmdFp5c2T
         8Hi0mTXFw88ukZkPxXIKOfKrBRyh61S5B19JkGRWz2bQBDRCwxJatofNMpp2ogmWTFt3
         0pQ0cFkEe4BBY9pfewV4egsSPB84ISzTCO/J48LS9Wc8+mApNddXDIF/ORyqMDhRFbjA
         hMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783766435; x=1784371235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=REzXyFdz7dKZUYmmyceB7y7FvYAAlICsxOnPzqdIdiY=;
        b=Bwxhz1DeeYd3HdvaHsXJnnC/Fg4b+ok9g8Z5b/6jUwQs/gV+hxec5hz9+SqBEH4fLc
         TaNR8CJ/tgSxucvzOJEIEjRnqXE/wA4aq8BwDWKzzt8771M0isWvBWhWGudrPogBY/zp
         Y7cl2SzisYwE40xGcpKNRt9BbI98HAx3unqaEf+DZbgyyvRYl2K0A+2WFxqciULkplzG
         tI2opkzpbr3AK25QzzG8JBiNipJsh1MYo4M0WgLeYQ09L3/e7vtJhx1MduSvDuxI0t3v
         tJaGRM13lZD0KOhx5BF/XRZcEBxobHHkUhKLRJ81s4F1IRoGz/ieMtStfrKR76RQSSqp
         8p8A==
X-Gm-Message-State: AOJu0YzfyaxJUu9gLJswfkG6VJ8gKn9NZaSSZJ+BTG7PY/Cj8fmMP+Yg
	6PsIC1gjTVTPZCk1bebBBw86ztDnz4myhkbAW4kj1Rz67N62t22PM2nPGFPAJg==
X-Gm-Gg: AfdE7clYZMyrTPd+PgfbN/6JdYHUgps2m0fD2EwTDwZQ3zJziaQnvO4odx7F1TSIG2G
	kIawP/JeOmMYUG9K5ILWlaaoD3plTZSaPzNMUAKP/WPSQVSwVQcndbUFSWPJNZhFoLNuq7ekiKB
	s1C2WUeGK1E4l/Hr1bAU4jgAhenJhgxo3DDQ9yiI8tJglJghsr63aQtJ8RV0xAlf64eQtGGpLaL
	jsnHtBZLLUp6ciUICnERoh0l63zv0PJCZMH976FKVlFCZVbOPyF/9Rjf5B24Nh0oFUqdaEV9ZqN
	buhMeeOHLdiON/ke4merBnmgsqUFq1iYznU5Azn2YO7O5i1sA6CwqffXlc4YA1hl8OavU51qyrA
	9K8uIFRzdvJfGsIgFgftHEQoZKkf0Q4rJlJGznPktl9WIo3TJCBQiVPfm8VXLqX2uoVueSfG7PF
	cNNPIqwFVH4DyjCzGFuFJMqYAgtdRg4Kf7+yLM2/zNGPgIgjLoYgZDpSqdMwFDTsU1yxyhDLEK3
	RmeMIwGXHqvHcbayyXxuQsGTfNucUOuUeXJuMVbNyJ7rM0IrQ==
X-Received: by 2002:a17:907:9622:b0:c12:da4a:97d5 with SMTP id a640c23a62f3a-c161f404f86mr86595766b.50.1783766434892;
        Sat, 11 Jul 2026 03:40:34 -0700 (PDT)
Received: from 127.0.0.1localhost (82-132-222-132.dab.02.net. [82.132.222.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d5de95e6sm483041566b.39.2026.07.11.03.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 03:40:33 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	netdev@vger.kernel.org
Subject: [PATCH review-only 02/17] io_uring/zcrx: move RQ head/tail to separate cache lines
Date: Sat, 11 Jul 2026 11:39:55 +0100
Message-ID: <9b892fd443ac63428885d1ade94066125923a8f1.1783616211.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783616211.git.asml.silence@gmail.com>
References: <cover.1783616211.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <20260711103955.SKEPNzpAMOsdwSorwW0MpQFCKYn3XvtfebICP3d5HnY@z>

RQ head and tail are currently put into the same cache line, which can
cause false sharing problems when refill is run on another CPU. Put them
into separate cache lines.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/query.c | 2 +-
 io_uring/zcrx.c  | 8 ++++----
 io_uring/zcrx.h  | 7 ++++++-
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/io_uring/query.c b/io_uring/query.c
index d529d94aa8f4..2e7b893cc8f0 100644
--- a/io_uring/query.c
+++ b/io_uring/query.c
@@ -38,7 +38,7 @@ static ssize_t io_query_zcrx(union io_query_data *data)
 	e->register_flags = ZCRX_SUPPORTED_REG_FLAGS;
 	e->area_flags = IORING_ZCRX_AREA_DMABUF;
 	e->nr_ctrl_opcodes = __ZCRX_CTRL_LAST;
-	e->rq_hdr_size = sizeof(struct io_uring);
+	e->rq_hdr_size = sizeof(struct zcrx_rq_hdr);
 	e->rq_hdr_alignment = L1_CACHE_BYTES;
 	e->features = ZCRX_FEATURES;
 	e->__resv2 = 0;
diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index 8348413d6d24..c4a9a663eba4 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -380,9 +380,9 @@ static void io_zcrx_get_niov_uref(struct net_iov *niov)
 
 static void io_fill_zcrx_offsets(struct io_uring_zcrx_offsets *offsets)
 {
-	offsets->head = offsetof(struct io_uring, head);
-	offsets->tail = offsetof(struct io_uring, tail);
-	offsets->rqes = ALIGN(sizeof(struct io_uring), L1_CACHE_BYTES);
+	offsets->head = offsetof(struct zcrx_rq_hdr, head);
+	offsets->tail = offsetof(struct zcrx_rq_hdr, tail);
+	offsets->rqes = ALIGN(sizeof(struct zcrx_rq_hdr), L1_CACHE_BYTES);
 }
 
 static int io_allocate_rbuf_ring(struct io_ring_ctx *ctx,
@@ -410,7 +410,7 @@ static int io_allocate_rbuf_ring(struct io_ring_ctx *ctx,
 		return ret;
 
 	ptr = io_region_get_ptr(&ifq->rq_region);
-	ifq->rq.ring = (struct io_uring *)ptr;
+	ifq->rq.ring = (struct zcrx_rq_hdr *)ptr;
 	ifq->rq.rqes = (struct io_uring_zcrx_rqe *)(ptr + off);
 
 	memset(ifq->rq.ring, 0, sizeof(*ifq->rq.ring));
diff --git a/io_uring/zcrx.h b/io_uring/zcrx.h
index fa00900e479e..3cdfa4415d62 100644
--- a/io_uring/zcrx.h
+++ b/io_uring/zcrx.h
@@ -43,9 +43,14 @@ struct io_zcrx_area {
 	struct io_zcrx_mem	mem;
 };
 
+struct zcrx_rq_hdr {
+	u32		head ____cacheline_aligned_in_smp;
+	u32		tail ____cacheline_aligned_in_smp;
+};
+
 struct zcrx_rq {
 	spinlock_t			lock;
-	struct io_uring			*ring;
+	struct zcrx_rq_hdr		*ring;
 	struct io_uring_zcrx_rqe	*rqes;
 	u32				cached_head;
 	u32				nr_entries;
-- 
2.54.0

