Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A3D44239C
	for <io-uring@vger.kernel.org>; Fri,  7 Aug 2026 13:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108791; cv=none; b=XG4wsXGGsFgpN+fareIVFWKGNuc537dkouzX7FDPRMPfLv6k7DppYnL1SQBeKG6KjH5kVY7n6TmBRrYIeA2lQC31DmoailkuU0cbJ4Gz3qdy3vTLR9PubiSk0P1bSG+x6o1THYN37wR3DXFzfYMSsJYdiI4kse5aJiUv7DnWgGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108791; c=relaxed/simple;
	bh=skrg9soTb7Ie1llGMGoXq1o0FH0UgZqM1b7lpDH3lv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gi6jop9h9VknicQr6NhuLUFMtvJGfzoRhYaK45nhI7ZiDZPyaYS5CFg2/LdfIQTTVrycW8V9k3YZD+xdzbGD/9Ka8ZcVHNbNA5EIYIVB84Fs5qRQ0Go+NWhaFgKyXv2gmUTKSSkLh9rT8lgqnm+beY873qjDiQmIcRZiylu3Tdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sgoZEQu4; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sgoZEQu4"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47fe89fb333so2084039f8f.3
        for <io-uring@vger.kernel.org>; Fri, 07 Aug 2026 06:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108782; x=1786713582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52jlEQ5aipRQ5ONtSttLeog51aomCUmhXFJUhfIf/QI=;
        b=sgoZEQu4ZBluKnys81QbfAFR5jmjVOOUF9pWZ2WrMs7K91BkpghAREoXnizAkhdNYt
         N96ZMOKfLYMjVCueJjxDK5YfuHxWXJ9ROA/N0VMP9vM0P5/Wp+nvjWG4O29tqF+WiHAc
         NXV6e3CxjY8TmH1kjQV1isLcQV4CguoHaIUjPEHgMVo9E1lBHL2oVVD0Svv/LOV172Xr
         bZQfUhI9cclze5b90Tvxe6LljIBeqRXWEb4sjh5bzQ+evO4qFwMX/0TFMgmBoTwX/irW
         /7s2InFgsYR/ptfXTsnn4qmWCDxY1ARBcQbLKMJRAVNh4aaNa/iXBFFTUUvUPeYkRhwA
         l4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108782; x=1786713582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=52jlEQ5aipRQ5ONtSttLeog51aomCUmhXFJUhfIf/QI=;
        b=KfaauwjqPjQ+iL6KLmFoLsveQF7EqdaSVC+BElEAv0efYO0kf7amHTdxJQpFcgA4eO
         fN5xRRDjTaeJknTZTpl25f2MzQ2hrf2UngQS+o2SsLSxXLphkUM5OvhyAHmInWIhZiJ8
         9sA9nX44NGxCDRU57ituCpEoQdy5FVlVAKo5ybvQJywFJe7QYvlNfYqi+wIAznQrVebQ
         Gd3rfTcKOj+AVgmSAf6Q9bQDDs2odNmGSmmCIn5ineatVC4YGkUVwZ1DealmH16cTDge
         2faw+CyN93/qBurvxxDhfY/P3FXAAuchWqOglfX9LmsXBi5IxeBUd32+L15M2bLny42H
         f1Bw==
X-Gm-Message-State: AOJu0YwQOd2TtS6jsrvaevM/0yu6XW0FcW5zuHpq5r0FJ+Dha0JP39Cn
	NQk+dkIF2YiqeeS/ujBKzckQaFk07fcfJdkyAHnoF7Vl+QTczP3u5t4Vp0iU4Yfw
X-Gm-Gg: AR+sD12CnxYFr/vAtOrOXIHlRFXhIpFDkvRvuY1KTZ5aF9AHklK1+BKRZPg5ctTz8K+
	XJ77aitxsjf0i+390UR5FLzEV/hfSgd+Xcetz08+uj1HuRIuXP+RkcjJ/88MU1sYbS3wCV7pCM3
	aqyMAmZTYAlE6Dhz31RPvwtdYFTdcX9BcsbD4n8zD81V77NyNT7zeJuGOSbAoDme90DIVrcW3Br
	qPu0b7rr0uP1/Q7qj/97chwb8UTALjE4s+VZ3VwqR4iVOc8ch6HUqtb/5HPDnqsQkM03afgNLcq
	6fhMcH1z2bOY1sFcIEoBGYPsqhX3Dx5kLDLPayFJgzqPqrK4FJW0787Q38/Vn+8ogbURt43ktov
	+18OnEjBwfxcGwNSsRai27mlcoVZBlYFnrvHF9Lzg7PWTJtrtZpf92cLIjYclLuuXAwKieLGiC3
	HM7g1Lqb4C9ISv1P5dgxSwBY4N8xRLIE01uvF2CHcfvojQs4EqOCzOqA7bH3+gp/X/h9BueSvXl
	MGOspMmXoD6dauKFeKk868/fOlLEdzJxY/yivh7ew3+0cyp+xp2ZkSxpnBvi1nyYGsIuw1+RelY
	tg==
X-Received: by 2002:a05:600c:4454:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-4994e7c0377mr312582735e9.9.1786108782213;
        Fri, 07 Aug 2026 06:19:42 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995427a244sm144125015e9.10.2026.08.07.06.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:19:41 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	netdev@vger.kernel.org
Subject: [PATCH io_uring 01/16] io_uring/zcrx: scale refilling with large pages
Date: Fri,  7 Aug 2026 14:19:19 +0100
Message-ID: <143cf439299728759eb0a840c866363fe99293f0.1786108672.git.asml.silence@gmail.com>
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

io_zcrx_ring_refill() caps the loop by mixing the max number of
allocated netmems and the number of available RQEs together, which
caps the number of entries to process the pp cache size. As a result,
when niovs are heavily fragmented, the refilling logic allocates only a
small number of niovs per call on average and sometimes even none.

Keep a separate counter for the number of processed RQ entries, which is
capped by a roughly calculated from the page size value to keep the
cache full. And separately break if it allocates enough niovs.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/zcrx.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index f1464ea8ca64..a096d44f7b52 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -28,6 +28,13 @@
 #include "zcrx.h"
 #include "rsrc.h"
 
+#define ZCRX_MAX_FRAGS_PER_PAGE MAX(PAGE_SIZE / 1024, 1)
+/*
+ * We need a reasonable limit to be able to fill in 64 entries on average
+ * for 1500 byte MTU. Over-estimate it to keep it pow2.
+ */
+#define ZCRX_REFILL_CAP MIN(64 * ZCRX_MAX_FRAGS_PER_PAGE, 1024)
+
 #define IO_ZCRX_AREA_SUPPORTED_FLAGS	(IORING_ZCRX_AREA_DMABUF)
 
 #define IO_DMA_ATTR (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_WEAK_ORDERING)
@@ -1125,17 +1132,15 @@ static unsigned io_zcrx_ring_refill(struct page_pool *pp,
 {
 	struct zcrx_rq *rq = &ifq->rq;
 	unsigned int mask = rq->nr_entries - 1;
-	unsigned int entries;
+	unsigned int rqes_left;
 	unsigned allocated = 0;
 
 	guard(spinlock_bh)(&rq->lock);
 
-	entries = zcrx_rq_entries(rq);
-	entries = min_t(unsigned, entries, to_alloc);
-	if (unlikely(!entries))
-		return 0;
+	rqes_left = zcrx_rq_entries(rq);
+	rqes_left = min_t(unsigned, rqes_left, ZCRX_REFILL_CAP);
 
-	do {
+	for (; rqes_left; rqes_left--) {
 		struct io_uring_zcrx_rqe *rqe = zcrx_next_rqe(rq, mask);
 		struct net_iov *niov;
 		netmem_ref netmem;
@@ -1156,7 +1161,9 @@ static unsigned io_zcrx_ring_refill(struct page_pool *pp,
 
 		netmems[allocated] = netmem;
 		allocated++;
-	} while (--entries);
+		if (allocated >= to_alloc)
+			break;
+	}
 
 	smp_store_release(&rq->ring->head, rq->cached_head);
 	return allocated;
-- 
2.54.0

