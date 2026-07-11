Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BB23BB9FC
	for <io-uring@vger.kernel.org>; Sat, 11 Jul 2026 10:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783766483; cv=none; b=TyeU8Z4BldvXmnBYvRoponBA340kJJkPMr5d5MIEgGNhh4v/EEE3FbgdYi7nLVWcptn+I/9kiXksumCYzD78nLYsiyM+xs0Yd62DuEslyi5HhfDBW/CJyTrKXGLdUGeAv0jEVeRQjwOWQfotXyDT/jzn5P//QTl1JrgYMKLZQHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783766483; c=relaxed/simple;
	bh=3C5ZHtmURh7dwurigU+mzj8rTDm7QKCNJ6nCU+yuRWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rAFqGt/T98rhC5gW394J6RdEzuwQDLy3Q1SLl+YHIIy6SfzPYmPoFXp75iXL5AbPmDIA35Su1/x9J0fnvQpjVCIOFNFEsZ2ibX3AFuMf4qWyoz6gezEnFFDTCZBnVn6z4MV6E8vPe1dmqyUHGWN6mPFJxC/Q31eUGxLMmYrL1fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0nbvqu+; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0nbvqu+"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c15cd3fd760so207987566b.2
        for <io-uring@vger.kernel.org>; Sat, 11 Jul 2026 03:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783766480; x=1784371280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YzxgLXuoC3y9XYCE+1b8RBAVVFev+ejEK09g/vo1UEs=;
        b=H0nbvqu+fPC8w5bfHmfEl/v5wPLcbO8aITWDR2aLRh6TY2UIvEcJFID5mF7Lqma4uo
         JkMHZWwfu0so+xZnuLyNRJ7bADe+/PhyvEF2NIK3lVgXy5WG0MB/k7CE6ZwgbQpA8CLI
         dE6VDu7vQg9ekIHAr7nwqftgRIMlKUWlB37mA06M1NVQVVehGjaDYE+I0cjW8wcIr12j
         aK6GrVAnANAdR1+5zrnRD2fY/6OPd29QZ2Xa9Rs6QAfln7EAz0CQp0NrsKCXsgXbhdHj
         2U26h+Nc+eglkxfr7vp/M1it2Iu/qs3Ynehaf2FUa8ZKjPwIY+GVZdNkcXAk14sJwJyE
         RJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783766480; x=1784371280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YzxgLXuoC3y9XYCE+1b8RBAVVFev+ejEK09g/vo1UEs=;
        b=X3Gq7GoqYddeuh1acUTpZnmsXvEY9T2UI84VJLiv3XTcYdjIpt0AYBu76lr9cDyMPG
         wWGvGNonmkJQ4mQ0LLB9Zb4CkEWWBeZpyTYrfkrrIPpD/Z0bLrp80ssaHsicHtS+WEQT
         uYNcddqHJULNROHXf0ZvYNZwZnElAExFRiaz/dThIzbnpSjJRHUxaVuTa3pZ2dsvy6IT
         tja/FcvdBZwGtOLmfyflZc1kB6kdpYFocNO8MST3eXYZT4XIO28hbnqQDx+B8yg5fHJM
         8wLkqoaQh5qhCWYyM1xD1/9hADalTQ3qcFv24yGnJZERGzdSecBNZAZA6CjNFPg6Ymel
         svoQ==
X-Gm-Message-State: AOJu0YzS4dyAzaLYqTkkXb1AW9u8aNPuqMTFqSfXvewI+P+boaym41YL
	q5NRgfsEmgcyGqjJrlOtqIzvNugx0JGYhWPA0WPGovMLEFlMwNMi6b4sgtLcug==
X-Gm-Gg: AfdE7clfW88q9mKxIWPYb/ET2ARb5AI4rm1K5zQnFpn13lp5tuVOMXSJToQ3ZK+eDsL
	xOmx1tot8Xm6CCcHQJ7j74+RvSgCua62elJKgu1wOIYeer5myMGUyl8h3EPZ3JYgzYEQcfdA3xH
	47o6wVuaSYICIgCARfUTWK/N17nAKY0gdZvWkPGlzGgfoA1pWi6/MlaEEsaGXprYAocVbmCbjhU
	kocr4fxo8TA9A+ezVeENAJ2ApH54kcJQtuNhssLNCwlUMIfHLfvaUJLjcKFnOIvfm/QpalAfqUH
	QaSUpAxgkyrHDRYc8ZUTIETUxpnc8MiyEME5LzyFooexxAi0oQuHlhfbBvAt3cOU3D0l1meb5mN
	Y4nUayRfzRNBVw90rYivlBeAb8lQ3shg5yOVL6w3A7EQJLAj+05YSOSxYrSbXo2/JbKlDwx9MFR
	9MZSiZLZ/MfJAOJ8tX/xAbrZ4KaV0u//uGNoa3qRBAHNloeZzGZbwYnrb1phKwghEHZrzhZjp2l
	MmIiGodOecB7UBEEjlQQ3GI1L9Z8AvS6c9AW0zKYwLkIuFt+78t+5uMMfWM
X-Received: by 2002:a17:907:6e89:b0:c11:ff2c:4f33 with SMTP id a640c23a62f3a-c161f3886bdmr89040966b.45.1783766480430;
        Sat, 11 Jul 2026 03:41:20 -0700 (PDT)
Received: from 127.0.0.1localhost (82-132-222-132.dab.02.net. [82.132.222.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d5de95e6sm483041566b.39.2026.07.11.03.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 03:41:19 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	netdev@vger.kernel.org
Subject: [PATCH review-only 16/17] io_urint/zcrx: narrow var scope in io_zcrx_recv_skb()
Date: Sat, 11 Jul 2026 11:40:09 +0100
Message-ID: <87e57608b1525ebcf4cb1cf29b00ca76ba3b982b.1783616211.git.asml.silence@gmail.com>
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
Message-ID: <20260711104009.ThVCITYD0AkRBJbtNCNXSVb1QNcu_6eHOzF4E1e-iLs@z>

A preparation patch that limits scopes of a couple variables in
io_zcrx_recv_skb() and rename them, it makes it easier to reason about
the code.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/zcrx.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index f7592a3c058d..74046a09911a 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -1836,8 +1836,7 @@ io_zcrx_recv_skb(read_descriptor_t *desc, struct sk_buff *skb,
 	struct io_kiocb *req = args->req;
 	struct sk_buff *frag_iter;
 	unsigned start, start_off = offset;
-	int i, copy, end, off;
-	int ret = 0;
+	int i, ret = 0;
 
 	len = min_t(size_t, len, desc->count);
 	/*
@@ -1875,20 +1874,19 @@ io_zcrx_recv_skb(read_descriptor_t *desc, struct sk_buff *skb,
 
 	for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
 		const skb_frag_t *frag;
+		unsigned frag_end;
 
 		if (WARN_ON(start > offset + len))
 			return -EFAULT;
 
 		frag = &skb_shinfo(skb)->frags[i];
-		end = start + skb_frag_size(frag);
+		frag_end = start + skb_frag_size(frag);
 
-		if (offset < end) {
-			copy = end - offset;
-			if (copy > len)
-				copy = len;
+		if (offset < frag_end) {
+			unsigned copy = min(frag_end - offset, len);
+			unsigned frag_off = offset - start;
 
-			off = offset - start;
-			ret = io_zcrx_recv_frag(req, ifq, frag, off, copy);
+			ret = io_zcrx_recv_frag(req, ifq, frag, frag_off, copy);
 			if (ret < 0)
 				goto out;
 
@@ -1897,24 +1895,23 @@ io_zcrx_recv_skb(read_descriptor_t *desc, struct sk_buff *skb,
 			if (len == 0 || ret != copy)
 				goto out;
 		}
-		start = end;
+		start = frag_end;
 	}
 
 	skb_walk_frags(skb, frag_iter) {
+		unsigned frag_end;
+
 		if (WARN_ON(start > offset + len))
 			return -EFAULT;
 
-		end = start + frag_iter->len;
-		if (offset < end) {
+		frag_end = start + frag_iter->len;
+		if (offset < frag_end) {
+			unsigned copy = min(frag_end - offset, len);
+			unsigned frag_off = offset - start;
 			size_t count;
 
-			copy = end - offset;
-			if (copy > len)
-				copy = len;
-
-			off = offset - start;
 			count = desc->count;
-			ret = io_zcrx_recv_skb(desc, frag_iter, off, copy);
+			ret = io_zcrx_recv_skb(desc, frag_iter, frag_off, copy);
 			desc->count = count;
 			if (ret < 0)
 				goto out;
@@ -1924,7 +1921,7 @@ io_zcrx_recv_skb(read_descriptor_t *desc, struct sk_buff *skb,
 			if (len == 0 || ret != copy)
 				goto out;
 		}
-		start = end;
+		start = frag_end;
 	}
 
 out:
-- 
2.54.0

