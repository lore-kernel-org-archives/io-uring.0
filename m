Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AFE4052CF
	for <io-uring@vger.kernel.org>; Fri,  7 Aug 2026 13:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108791; cv=none; b=YA+jZinvltW7iCIiwlsephpmxbtKkmPoiHqrrdMIntshR1HIPeUE0N0uE9RsSbW17KG8NDF9jtiBCAOc3+YRwlOqIihtvLf1wtRaDyG1Dsd7f86yULiMm4CABcvgY24BRESnSmqnfmYSosbqdTU0m3jb4h0IneDQuteUHjrUBt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108791; c=relaxed/simple;
	bh=hAiADmHy5iO4nnbfW8kGjt5/CnQr/gQ7rjoQtgiElBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BNX3BnIXYG1NywjX1zvTTP8zbh/J+LvI5gJygGknap+zK82a9+cGDLL83T8d1sWXx1NwAoSifNvHm0qiRsMANonM8aoRmbwx8pr/ZrivjZE58v0qaqkM8TK+fO4xYVLdtva7qTkZdkVzHzPVP+37xgZnik/0jtqhN1ZYAbkKN6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTVrf4aE; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTVrf4aE"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49557167508so30315955e9.1
        for <io-uring@vger.kernel.org>; Fri, 07 Aug 2026 06:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108784; x=1786713584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FOPzrHzl6TRLjAEb3KCs0jYAx5Ln+lr8kNzNknIEs8M=;
        b=OTVrf4aEWSQpzfc08WvsqHKG9eishl7TcdNVS2haSW7OCo996OyW41NNbJYHepxEX+
         3i/FJUZez583S91i1nccmbR6p+yfzdi4o/94B4Zc0kiSfdjcWe+DAEGSpZ6iFnVYPIi+
         CFDdhsNikJw2hNXd6G3qqBDsQtVFnncCwkn+L6PYzp3mhrrEljnMqv7a6gTOFwSkc9y7
         ou06iUoGwdzN+XWwcs6SckZ3eYHi6soJm/+m2AQJ7Lw0xRJmzhy5s+vdmm5AaH/EY0ys
         vNlk48rdSDw+Nr9mdWKchG6mdhdt05JBbJVaI0fY9YDDVk9qp64UsNXGDKUBWeB0en1R
         j4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108784; x=1786713584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FOPzrHzl6TRLjAEb3KCs0jYAx5Ln+lr8kNzNknIEs8M=;
        b=FVgeSpaLnLm1CXh82R4XohEF+UlB7/bZtyzsiSRRMRL9y81li8LLO8+WBKIhWFi9+V
         ity4m0YVwVPI3Z+QpGGNI5Khh/hchJEaFAOc5FOWIAi9KDccyPETuoZXGAGmu/0CE0Cv
         tCGFf3T6KMrUUQ+FEGkSyQeVHyir6qOBdU174YLycA2jd5+iqwZysLbNMSzTcACDZihT
         m69oRdr08DXsSlRSz9ltb2TXqv7TEORhAcYmmno7BG7TNYV1n2KRoSZkkvk91Jl81DMJ
         rP2CECDjhQ0GM6h0ojq/woii/UyT69vK3zt0aiDtffE6xVDFmAY8KNCp06MN3DQN7BND
         q9xA==
X-Gm-Message-State: AOJu0YyyYHBxfrzsAuVNjtPjyIV3aoZFOUy4cN/l+dP49MrWgb550gcv
	UEQ77mKeovgpyMamA6qw6PpJeuqKfoQlXY8qFXH5ZbLp3Ag1mnhpwsyzTM0wfu9j
X-Gm-Gg: AR+sD11yytotfTB2ExUu/MKA523iG5Uh491vlr1Mv4ph9yM6O0x+LNE73bNvnIvhvAO
	gAwHWBTeNe8rsjluQ6D7CQtfNKvztkLfhsCVUYGFVmuDmXSD+My+PjhRe99F6/LI9GbySCytKuI
	hj0uz7BwddLaR+uXk5CjwK9D43rS5HAIWABs13JCZKxDqxu3+V4TIqx/nhZw8iVkEXCe3HINLah
	uWmzoB4eT7aCAfr63BhzyQylrWtIDQ1m5aTziry+sSNC5wwAj995O+WnLokQc8ItbdwmUG9rfay
	68HyJWKtO6BUb8BfsemqWHRJr1LflG6Ye8wu6nLFGNwwkMOoxbAhKIZaXts34KAq4urZo6lsYAD
	tZyQ07fAlUEfLrhkFn2bvv9wkUNhp1JzW/ZThhS5GdjZ9MeJZIjYNR53wC2XaUwq/Ma/xaj3XXv
	jjtwAtpGCCAyk6yhcmTPgyYvSVISpWh2N34E34OP99KSY/FUB464J4tbTt6VUhwBtD16+wlBN3k
	sFi1HT8wHQX/wGIVoNEadrMX7D81fvogmlrngGRN6KvKuglP51fnCL7RNs3SrkHWQI=
X-Received: by 2002:a05:600c:19d2:b0:496:bbce:fc with SMTP id 5b1f17b1804b1-4994e7c10c6mr296345275e9.12.1786108784447;
        Fri, 07 Aug 2026 06:19:44 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995427a244sm144125015e9.10.2026.08.07.06.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:19:43 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	netdev@vger.kernel.org
Subject: [PATCH io_uring 03/16] io_uring/zcrx: add RQ iterator
Date: Fri,  7 Aug 2026 14:19:21 +0100
Message-ID: <5d2933ea7bcf9c19c44e43afb3638d7afb362b3c.1786108672.git.asml.silence@gmail.com>
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

Add a iterator structure and helper functions for the refill queue
processing to avoid polluting io_zcrx_ring_refill() with extra state
and logic once it's extended in following patches.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/zcrx.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index fbc190075e2f..805424fdd573 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -1088,6 +1088,10 @@ void io_unregister_zcrx(struct io_ring_ctx *ctx)
 	xa_destroy(&ctx->zcrx_ctxs);
 }
 
+struct zcrx_rq_iter {
+	int rqes_left;
+};
+
 static inline u32 zcrx_rq_entries(struct zcrx_rq *rq)
 {
 	u32 entries;
@@ -1103,6 +1107,24 @@ static struct io_uring_zcrx_rqe *zcrx_next_rqe(struct zcrx_rq *rq, unsigned mask
 	return &rq->rqes[idx];
 }
 
+static inline void zcrx_rq_iter_init(struct zcrx_rq_iter *it,
+				     struct zcrx_rq *rq)
+{
+	it->rqes_left = min_t(unsigned, zcrx_rq_entries(rq), ZCRX_REFILL_CAP);
+}
+
+static inline bool zcrx_rq_iter_next(struct zcrx_rq_iter *it,
+				     struct zcrx_rq *rq,
+				     struct io_uring_zcrx_rqe **rqe)
+{
+	it->rqes_left--;
+	if (unlikely(it->rqes_left < 0))
+		return false;
+
+	*rqe = zcrx_next_rqe(rq, rq->nr_entries - 1);
+	return true;
+}
+
 static inline bool io_parse_rqe(struct io_uring_zcrx_rqe *rqe,
 				struct io_zcrx_ifq *ifq,
 				struct net_iov **ret_niov)
@@ -1131,17 +1153,15 @@ static unsigned io_zcrx_ring_refill(struct page_pool *pp,
 				    netmem_ref *netmems, unsigned to_alloc)
 {
 	struct zcrx_rq *rq = &ifq->rq;
-	unsigned int mask = rq->nr_entries - 1;
-	unsigned int rqes_left;
+	struct io_uring_zcrx_rqe *rqe;
+	struct zcrx_rq_iter it;
 	unsigned allocated = 0;
 
 	guard(spinlock_bh)(&rq->lock);
 
-	rqes_left = zcrx_rq_entries(rq);
-	rqes_left = min_t(unsigned, rqes_left, ZCRX_REFILL_CAP);
+	zcrx_rq_iter_init(&it, rq);
 
-	for (; rqes_left; rqes_left--) {
-		struct io_uring_zcrx_rqe *rqe = zcrx_next_rqe(rq, mask);
+	while (zcrx_rq_iter_next(&it, rq, &rqe)) {
 		struct net_iov *niov;
 		netmem_ref netmem;
 
-- 
2.54.0

