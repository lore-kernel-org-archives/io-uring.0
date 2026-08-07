Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8CF48B383
	for <io-uring@vger.kernel.org>; Fri,  7 Aug 2026 13:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108799; cv=none; b=ZWHQ46nN6kqJHBm64dtp5DZwhXqKypMVfJO69MqK/v4fpZfsYtFTZMDaTUOFSEVo+0liIQwGn4mIUGYjlsAyv0O8fvdSFjh5AunjjHN+g2dv6nYYaH98jRKSAtucbRHNtbcfVVw/Ehv844eLzNKHIJ6rNvvcbp6uUx442TnfZKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108799; c=relaxed/simple;
	bh=1H5deh0Reijn8Kox+Uf/v8W/YmDbXdVXJU4Zg/Zcunc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n34n1Q56haieM2GX1SSp6+5K9hh7P9z1bskNNPCGbcLldDcmg3/XtIObLQMCvxkT9VYCJhsbMCmyunqdUXzHY5uzk4e6qG22WRrll79TDriW1YHpm1QjjlFGPl7gTyzZghPYF0wwcJ5Lt8DcpceLkDfsWk9j+OBgjWIxw4rlWtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bq7Q73fz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bq7Q73fz"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-496b7622a83so28498935e9.2
        for <io-uring@vger.kernel.org>; Fri, 07 Aug 2026 06:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108792; x=1786713592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZJaZJRWy/IKZEWjx0ShchG6wpjaMI3hEZM40yrtEelk=;
        b=bq7Q73fzjF4hxOChDEjK9iqJF+l8PkNI66enRFM3LAXwHIi7hD13y53rgPuRFx2tQZ
         cXqNiZAMqgkEVpLs+Jpyi2OWYudmApdYnRvv1h8s5yuigtQHox1Xn75y43+VZWmTJfz0
         IzroxxatvSlow1hUlDerzL2fjglIwFOeo3nBTJeS0fewINcb9/n9VGmNJZJaF0d4H/Xa
         QJ+i42xDWlLpEBSsObIzhHaOwvuv1VLUfbwsEz3E6q6ImRCHond7BCTfli4z0uzioliE
         lb2HF9lBD0aS5CH1sEDzHmU+VqFv5HJ0634QRvsVpHG3mXbPohQirP4ApFbFur4PK/mJ
         qfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108792; x=1786713592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZJaZJRWy/IKZEWjx0ShchG6wpjaMI3hEZM40yrtEelk=;
        b=roYWiUzJfxRTFuD32kW/VIpzD+VjCN3GYXOwrNTSE3uNHSfZiY7M6tE4UbPYelJsx0
         KtPbMgqCavtDDa0EcAtDtzH/DMVXgZbVDlpfFxq/YqG4ufro8gm732pfkQRU0gs8heFd
         4MPI4odQRCT4J6OOBMNC+Uj3kdsMv5tcIvuS/i/C5oeOuK6V5wA1jWgvj7G4Y/FgaW21
         GN5STawTPgj7P6C2l+ned/SwdNyiyuh6pjVbO4aN+R565sBQV44n5SZZ9idMS9pAYzbM
         QTS8XwYtvpaExi35vpOM/dkhnD3TcKLxR5uk6sG2xqjnLwamwdgooIRN4BXuiuuLKSaE
         mWgw==
X-Gm-Message-State: AOJu0YxkSTBfNTqaePiBzU+Sq/EVvelOwhOh6jT99uz5yfPKVutjMG9W
	9ALY60dHZiDyjeOb9VLM76o0r+i+anmemoOdQDweIUXY1sf0pE1637+N8m1HMKOu
X-Gm-Gg: AR+sD11JwYc2vnSGcE3A3pu46vzLQF4/f1Zl5pD8Bzr0im09PLcxX0vBdxLPZ+B/YrO
	zCAGcNuWqie/kMi+1cdE6jIHHPORlRmYuDKl76WE+1IuH5gOSTO7rn8Z97PvPXN2z+hEk4G3HzM
	AG6F0xHk9bpetkObLExB6pV24gLFM+kLsOIVfLnKYV50tcLt95gP39FNXgFnyrqRaPjW+/4zD6u
	o60b6JSixgoHL3cA9g77W/cTpPBxqocB4q87hazk3wGUsKZOn6ig4uBx5IsS88qPLtfzpIAmrN8
	L7jNjzSlsQp4G49Gw0c3vGOlA4wailjAeezLlk/IanIvTM4MRQoOAmVS8OoUYzr+NbnWaWXfgez
	fAIKPBTcPhSBZkxS09fEvS+tQ0h+tZzXHq/oikANjjKMUKL1EPF267erFQWjQ6EjUxd5vHLendB
	LniUg5GXn/U7VXrqaCqm0mr+Um75uqgZDb0dqPO9/9zG2nQkoe5H/ZAz9Iy2NDpcFEYU2E27bb+
	gvENZjs6/ibpLpRmLOo+OVPobSoXdUMwrWYfuqbK7JyXaseeNx20Yf/BGiJA1D1SgDewdj09S+c
X-Received: by 2002:a05:600c:6d03:b0:498:2b1f:e0c6 with SMTP id 5b1f17b1804b1-4994e7d9949mr265695965e9.18.1786108791778;
        Fri, 07 Aug 2026 06:19:51 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995427a244sm144125015e9.10.2026.08.07.06.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:19:50 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	netdev@vger.kernel.org
Subject: [PATCH io_uring 08/16] io_uring/zcrx: don't reload skb_shinfo
Date: Fri,  7 Aug 2026 14:19:26 +0100
Message-ID: <1e4c864a5ea639803c866aea70b8d5bf558f189f.1786108672.git.asml.silence@gmail.com>
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

Keep skb_shinfo in a local variable so that it doesn't reload it on
every iteration of the loop.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/zcrx.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index 2ea1e79ca8a2..bea606beaf4f 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -1693,6 +1693,7 @@ io_zcrx_recv_skb(read_descriptor_t *desc, struct sk_buff *skb,
 	struct io_kiocb *req = args->req;
 	struct sk_buff *frag_iter;
 	unsigned start, start_off = offset;
+	struct skb_shared_info *shi;
 	int i, ret = 0;
 
 	len = min_t(size_t, len, desc->count);
@@ -1728,17 +1729,15 @@ io_zcrx_recv_skb(read_descriptor_t *desc, struct sk_buff *skb,
 	}
 
 	start = skb_headlen(skb);
+	shi = skb_shinfo(skb);
 
-	for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
-		const skb_frag_t *frag;
-		unsigned frag_end;
+	for (i = 0; i < shi->nr_frags; i++) {
+		const skb_frag_t *frag = &shi->frags[i];
+		unsigned frag_end = start + skb_frag_size(frag);
 
 		if (WARN_ON(start > offset + len))
 			return -EFAULT;
 
-		frag = &skb_shinfo(skb)->frags[i];
-		frag_end = start + skb_frag_size(frag);
-
 		if (offset < frag_end) {
 			unsigned copy = min(frag_end - offset, len);
 			unsigned frag_off = offset - start;
-- 
2.54.0

