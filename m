Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A6548876E
	for <io-uring@vger.kernel.org>; Fri,  7 Aug 2026 13:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108790; cv=none; b=WlTPKWodCgwqgnJCIayBsDXwazqjWI9oNJT7aMNbw0TXhzjm5HxZSK4DgqDlE3jDpX3jX+bNN5VpOdEAEds3218vWc1LG0rDe9cs2xI2GPOq9ntwiKylTTd4iMgB686BRlbiboJ+xUw6ffHsYM2A7JQNMgnKE5g72F0oypudYXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108790; c=relaxed/simple;
	bh=ZgqnKArZCI2EXH82gGXSW7OXUUPOI1Y3jnknJv3XLXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZZEiPo29nIE/LpgjUk8fh6wKc7SL8wOkxk37VvDyLOMdseZNC8/7XOPZtaKnD7vuCfLaqHRhlI7x6v84VohHSIZ6FvUcVPUEMTcr5GYO9FraUeUNUSbKkoF+EKW3brydGmkb+xET8hnUZjoHibZ5pRjOQrTzPT5Z0vo2gLky+fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKIqsu60; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKIqsu60"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso15595445e9.0
        for <io-uring@vger.kernel.org>; Fri, 07 Aug 2026 06:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108783; x=1786713583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=04ukqcX/ZygaPdAqIVl2q03Si6kBkAxVKqngIh5MFOs=;
        b=HKIqsu60Bh+3o4Uu+M6eb+u9MlWyyGmHnSdTRHoT4nXS5yM/9AbUwNJ8r6Tx+0G2PV
         cBnzYSBPsAVMlBmf3SKeFlKIFIr8uyDNKPexvoLd70xK9w55iH6wTdwMAVP1dV4slN9W
         1pYnmlJK7JaKbeySGyqwIGaPqnsVQdrzMV0kHY/3K2KR36rc5sVoAwtAtOR06dlokBwN
         f1fZnLea0OU5VDpMtBsLVf5Y++kucZh+wsQWa79cT55KCRqANZEu/IutbmSOwrxxMOB2
         2VROoYoVPpnPg/ikJVboUE94kiSOWofD7VRvy7stz8K+nJI8OuB6EtXQEYT9AfQo+g5m
         A4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108783; x=1786713583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=04ukqcX/ZygaPdAqIVl2q03Si6kBkAxVKqngIh5MFOs=;
        b=c6ir5qs7Z1UVDQgjLsMLFHZpfX/R4JBeDNUN74yHJ1nQCjA9gpAoTvL0HG85NQTkDn
         ueA4ovkoQsn8nRRIX6JvVpYyzWVUuYNlTYVTQ6TXOPGbS9RVZjKLzZAc6lPTVupqObLA
         e9kjf3rVZiW+En7k3KQ0P7sKRC0MlTPbbAUj1ptH0zPcIeM0kuIHC2VTzaK9a+LyLwiE
         hJr0TxIqpXTPbYhzKT+7XpDEBV0SomfCHJniNROnXkc3J69CLeEzxwCL6B1TavYJAEjp
         6wXdj7ukMAnDGdTmMIxFocwkj6ZiKf+HjIYW4xRCCZnoWyCS/2jH9X9/CKcZ4ikukltZ
         ILjA==
X-Gm-Message-State: AOJu0Yxlw8+Zx4OsuPuj9SfXffR4nk3ozocVYmzu4ZCo/Xe1BT0T8XKR
	NiUHnO3SxzVk4WQWKCrvuXe2mHRpDk6jF2aUMmbjRGi9KG6iMxiK2LfLMc9TbKCG
X-Gm-Gg: AR+sD13wNU78B0m4jmGJGBTSgaNuxZJQnXmfSyrGRtKW7ZrBcW4bdlsDP4Gm7QAlVtN
	iN6241/QQ4VCkdBx0t4dFe4vrE9T3rRE3jsuvfVMWfTssjjtPrlXUrCAgtEQfjJ56fO4LJFqxKC
	kvvsd+fvLiPNmADRWxUk32V3ynEShPwbc0Z98TVIdfA1DqCNz5egQIW3RbBODlC8pgjM5zLOxyG
	pdJq8tFtfxz/RZH/D+qjWpZ76UmOPn9dGicRpHNP96XWL+XGEutIpmnkPbXkwZ2QtrzrbALSRTJ
	+mTwAFWV5ited82J2H71qepuWP3SfGDvf/sCBlxfLKcUIfv9zd6m4g422YkL8WOsgdtJfxaM8Cw
	0yvDHcm5enIJXB7r5TV0UFA84dPLcDRcpAqsxi67ck7+3J2TzXNTqf/KeUviMzcsmhXr5j64Y9A
	bSA8wpnHiWLa5hYxybn0XL40ZmySiDxaGaRZT+f0nghes2Oy4j2ufIjY47rbd07YoYY2q845H9a
	3jpJ9cPNNQdHDfTNIKKoCWMu2fZCn0nnWo5ldmRkuKoInmy+O+m+eGc37bbeYEs+w==
X-Received: by 2002:a05:600c:a48:b0:495:69eb:27d3 with SMTP id 5b1f17b1804b1-499553f4c4cmr145986005e9.8.1786108783336;
        Fri, 07 Aug 2026 06:19:43 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995427a244sm144125015e9.10.2026.08.07.06.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:19:42 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	netdev@vger.kernel.org
Subject: [PATCH io_uring 02/16] io_uring/zcrx: move RQ head/tail to separate cache lines
Date: Fri,  7 Aug 2026 14:19:20 +0100
Message-ID: <f769116a3f5267f06cb9a9a819d482ddea2e0852.1786108672.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1786108672.git.asml.silence@gmail.com>
References: <cover.1786108672.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index 88a325736992..4321f0b94b4b 100644
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
index a096d44f7b52..fbc190075e2f 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -379,9 +379,9 @@ static void io_zcrx_get_niov_uref(struct net_iov *niov)
 
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
@@ -409,7 +409,7 @@ static int io_allocate_rbuf_ring(struct io_ring_ctx *ctx,
 		return ret;
 
 	ptr = io_region_get_ptr(&ifq->rq_region);
-	ifq->rq.ring = (struct io_uring *)ptr;
+	ifq->rq.ring = (struct zcrx_rq_hdr *)ptr;
 	ifq->rq.rqes = (struct io_uring_zcrx_rqe *)(ptr + off);
 
 	memset(ifq->rq.ring, 0, sizeof(*ifq->rq.ring));
diff --git a/io_uring/zcrx.h b/io_uring/zcrx.h
index c1005f23caff..9ae0bf1c632f 100644
--- a/io_uring/zcrx.h
+++ b/io_uring/zcrx.h
@@ -44,9 +44,14 @@ struct io_zcrx_area {
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

