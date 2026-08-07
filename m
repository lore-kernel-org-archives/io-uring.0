Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A434302ED
	for <io-uring@vger.kernel.org>; Fri,  7 Aug 2026 13:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108798; cv=none; b=rZ+hqGSyMB69B1tHsBHtbwrDrU7FWWXvkv7A3TEXEh3Hy7uQfX3e+e30flaKaiTFIEsENFwyUfF/dQyXOalK5HfjJSG2CXWo2VjCExqvWMABnWiltAO2yObhh6H663tUqI+BplICgVrXFnd7DrYfFUEZau1BquSSRT85bIe0uBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108798; c=relaxed/simple;
	bh=bbVIDvh1oGtEEOuyXNjF7TvjE9GXDKiu6D1WxNZBb4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=arNyu9RhSx0miy7Yfhc9BVU0SAifU2H7zadGZyXX/Pdbly4ftBvbf6MxzEre34AW0qg/YBEIhwm9cVFpYAOoLOOywSWP6Rr35dodvUchWEIvQ95JKVM4+00LJRLg00MGfNsGlQg8Yi+Uyh9DwGXqRdLbRD2PwGsXEiyn/gNdkA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sg7sODxg; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sg7sODxg"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so39235815e9.2
        for <io-uring@vger.kernel.org>; Fri, 07 Aug 2026 06:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108790; x=1786713590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BLXaDYdquGFLQWQJeG2i6v+WQDg9xvWrv08HTjfrVw0=;
        b=Sg7sODxgOKNtIOJTTQXI8kMm/AkfaqRGws9fCao75p3t9p3oJxBV5OXedOeUmOhu4g
         eU+qLPzgyKGzghD8jMQ8J2txkdpU9hWSEov6LPFje6zwumVTA7m4M1LhNLsCYDdjGM4S
         sNmpBvozj0wa+r7kgsnAphLfTdTMBfA5C3LDk9XK70pxTVggVZJLusC01+0uHKTcuVGT
         sa19KQiZGuuSDkPoedFOk0pcLGTz6NpkYd1RcD+9FvWlpb3OW5NfyXimXypRLTgRt8Pv
         vNOSDpx/GCO4s3fmPAZzZj4Gf6TeXm7vqeISyfl4udFJZiWcxee6ZjLIXOv6PQLu94AX
         Nw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108790; x=1786713590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BLXaDYdquGFLQWQJeG2i6v+WQDg9xvWrv08HTjfrVw0=;
        b=BaGKhys+ew3D1MUeHJZaLZRcUO8RaMEMgZYruB6+dosU00Q2hd2JQwvHHXEONH5Mg+
         nbcDa1o6AKr65GXPlFXnencN9AHeW5m45xAbLNXR3JWWol3I6CsNkOUC+EykYTVAXTZ3
         gswPOJaKWFXt1tn+kmrPdFnfHoCey9yLctIzEZo3gYQ3uEshDHU7TPB0kTNGJ5uCxaNz
         MQn2EKNFeMt2wZVefpMikHXDu77Q7eG3GkpUfc7mwDfwwLSH68+/RxZqZc+iUYugPe8C
         qlNB8Sl45JpRJMeZWMXok5jQQyB5ia7ojjnB4BgVH2NhOWRiFomnVf4GaOHNpP2gxQu1
         xSwQ==
X-Gm-Message-State: AOJu0YxzVfmSh/DFsui/dNKfhACFm1Etpz/s2+vORYHc4loG/XbllfYQ
	3X5UJfnCMTW3O7gQvujkLL3dTONMD6Lli0y9BVRY4hrXNvSlMa41zikyO9JvPYck
X-Gm-Gg: AR+sD10VFZ2JQZbCWNTFg2jxIQZdS/V6CCZtX5byZhRQADtJeWym20FY2QQmYpWuXms
	8aUdedtRNnkpcJXrwtfJ1OCe/vTaVP5kcX3G4QYBXd8yxyXyntndaaj6YmV2I0y0+UAm8AoJJx/
	sXigPNgd3hNIhYO/HKRNJf0SQW0zjMmJhAllZo8+dq9tz9TvMxRcVj3wQPyS819MBOZ8aOP1NKQ
	CLa3z+H67YH4rG8tHbIyrwMKIaO2AfLF3adRa0Y280Im03p7wxt9S2Z41j/r2+Vnf+2gP4pEwT7
	/Sp75LKMaChCVqj5ghcRi3MFGEfHV3vAEG1Mw4mYbbr89DPaMQoWDffh/25FJ/BetSeDu2U5HZF
	vUBeWGxmZxYMVBMxlyg/mTAIL2p0xFQWbkBCh+1IBM10UQgyBYq+JPgPuWZTtltsob6hM5jK10U
	2Ghnq19H+Bhz/SMLiUUsa6D/36T1xyhzJonkw00lpoVp6k6mQAxONtvGnDYvjdJxd2qh1xwzxsM
	juUk0WcsbZ3OYGEH5GsRM8oXwI6KKS5r0KV0Vjpi3IjRoDRoBgPCvBfokUIjqnP+os=
X-Received: by 2002:a05:600c:630c:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-4994e71c87bmr245553965e9.7.1786108790041;
        Fri, 07 Aug 2026 06:19:50 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995427a244sm144125015e9.10.2026.08.07.06.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:19:49 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	netdev@vger.kernel.org
Subject: [PATCH io_uring 07/16] io_urint/zcrx: narrow var scope in io_zcrx_recv_skb()
Date: Fri,  7 Aug 2026 14:19:25 +0100
Message-ID: <182c140502e7be534caf10360714a4d78f2ce5f4.1786108672.git.asml.silence@gmail.com>
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

A preparation patch that limits scopes of a couple variables in
io_zcrx_recv_skb() and rename them, it makes it easier to reason about
the code.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/zcrx.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index 50d075fb3825..2ea1e79ca8a2 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -1693,8 +1693,7 @@ io_zcrx_recv_skb(read_descriptor_t *desc, struct sk_buff *skb,
 	struct io_kiocb *req = args->req;
 	struct sk_buff *frag_iter;
 	unsigned start, start_off = offset;
-	int i, copy, end, off;
-	int ret = 0;
+	int i, ret = 0;
 
 	len = min_t(size_t, len, desc->count);
 	/*
@@ -1732,20 +1731,19 @@ io_zcrx_recv_skb(read_descriptor_t *desc, struct sk_buff *skb,
 
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
 
@@ -1754,24 +1752,23 @@ io_zcrx_recv_skb(read_descriptor_t *desc, struct sk_buff *skb,
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
@@ -1781,7 +1778,7 @@ io_zcrx_recv_skb(read_descriptor_t *desc, struct sk_buff *skb,
 			if (len == 0 || ret != copy)
 				goto out;
 		}
-		start = end;
+		start = frag_end;
 	}
 
 out:
-- 
2.54.0

