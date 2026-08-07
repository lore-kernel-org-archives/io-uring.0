Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51906476CC5
	for <io-uring@vger.kernel.org>; Fri,  7 Aug 2026 13:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108802; cv=none; b=UKUgoZ4nHCgtl8JOYI2AZUCBB1B6UVv6S5p7ucllwXuWjKxC3NPwXGbOuU8EAZ89MsHrAQYmVkPfddzgAzBjiEKYcw69hIVk15R8WYToBfa7Vj/vXvJ5KxBCsMSx5jAdK2VPNaz3gQO60hiktH8iO10orbAowJq4Vc1iIA7nT/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108802; c=relaxed/simple;
	bh=5pu06JvHixiAVT0qs4ZaZ8MfmBkOaDyNJb1uYUHpmRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YQgm7szy8uWFco+Fgu7oWzHxwtuv0dmXRpgukNjV8A1ashrUEV+7JwB5oGG7+PZFn+xJSTyojkoz1lSWqbj0hYU2xUg/El7xJEHoX9WbYi2E2qRmXjyodh2QQk6tPsc5zMAj0KpkSSRa+4qlCdYpP5u6ktyuFVpzMUzxEPaKXf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uq2go7lM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uq2go7lM"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4994c49f588so20311235e9.0
        for <io-uring@vger.kernel.org>; Fri, 07 Aug 2026 06:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108794; x=1786713594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EDQ+BBm7w3Gy/ahKim7uXbGBp319WtMN7ZYZ7TfHqOY=;
        b=Uq2go7lMFyf6S+SxwhtWi4RMozGrmKaMYvx56nmwHIZjCsnq09FvFBDwRuhZG+PiqL
         0GIM3s83jWp5qIShVG7Ljy47HAZ38FOIcnfzSv7whF9Hr9F5pJUXUzhbHx6MMLn4j0O2
         aNWMRwA+Xnsge80FMKo/9wJVpAUtwj8rh3K//1z17xpdd3yKJrKq3GiJYedcTWSiWpEr
         kB8Qot7W1Wew6GzZeC8Hznw56fMwuylw7cbRNYV7uJ2KUBaHdCn6d9v2gvptImuc7j/Z
         a0FLzDwuhly/+E9xfiQMqwys0o+QC51GpjgdrSQtQIcmXvOPI3vcgRw3025dtcbKANz6
         c/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108794; x=1786713594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EDQ+BBm7w3Gy/ahKim7uXbGBp319WtMN7ZYZ7TfHqOY=;
        b=E9Nli5uFFWDq+5Z7U7tx5eQh9/uDvaXtWpDD03+odhuhbw0qEfxAtVY6hbhQx6KioL
         oG236azrtpDP0RpYzTcUpfCHQ55q6BLh1gTuDha5ADDjBR45wVUSA09K2Cje3+vlEA2X
         n5lZx+hK1EH431NkQD6fZRPz32lVQAxqQCb3LG7VK2dKHIXvsOSqYYmqpY8T0oBRcw50
         yD3KGxknn/t2r0lTbvQqifmUS28ilJPiJ8WQ9V2Z2dEbYWnpOtMGeJvB7ngTYWOBoEvU
         F9PIm7ZwN/T+IM2OVWbQtkljqK9Tbux43nGd0m49RHJx6HJKBy1P0IQu0QppSc+n1/VR
         f4/g==
X-Gm-Message-State: AOJu0YxiYvxt/spSIe0VTSgdWNxKwVZB11Dr3Y84PoOGGXO3zBSGlw8K
	g0ZuKUPRIGKgajqET8/uO6aULv5vjQk3uNFgrZODdTwFoHq54vn3w6Whc/8o71xt
X-Gm-Gg: AR+sD10J7KhFzB/ifdxJbebBuVKbiqH/FY5ta/MzE63CltiLbocc1V+hqRTyLFHUOgp
	CBQvBqcDQ+SGdXS5CudVI1OOfTEr+mkkEKhqmB82AjQ87JX0ZHr17HPfLd8Ot3DmGDZvLbYZA/E
	w/7ZFLRAwoygS5IakgROP80GXHRi3ZXGwYTtzloJyzr7GfZCzKYGiDxW1QpqbS8IbKP9nvTTPYh
	4kbooqnrv4YTCaAd/LfGE85Epi7ooxRObN0dJyohHtsKs62XCqC6tzylmg0cSbAGNxTuUhGjny5
	N/JH5VJ2k3Meg8SS3XaeEfM78plMi1dbaIZ/vX5ujmaV/8PcZWvwP2eUxCEHviyZEV8ujM5UqFl
	aZDWqqSm46QPbY6FsG0bgTcL5KuKPxnLBvdQCjwTN2SUOpndi83oITMutUPezsAOLKNltBDBtcI
	j8qNNk1vxdmNuiIoYA1GGWksI71YxEnTGFV3Q29TLFAJvn/TYFXmBRqBlETuDojzGH+fNVI+lcA
	Kwtl5auIuCu42qKv30ELKdwHc/tf5rrUefVRuUriT54XVUlHfiGggNdiJsOURgxYw==
X-Received: by 2002:a05:600c:4fc5:b0:497:ff5a:38b9 with SMTP id 5b1f17b1804b1-499553f8440mr116495595e9.9.1786108793196;
        Fri, 07 Aug 2026 06:19:53 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995427a244sm144125015e9.10.2026.08.07.06.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:19:52 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	netdev@vger.kernel.org
Subject: [PATCH io_uring 09/16] io_uring/zcrx: add helper for deriving area token
Date: Fri,  7 Aug 2026 14:19:27 +0100
Message-ID: <c7752161065a1f7273ce3de9683804dd105c6d53.1786108672.git.asml.silence@gmail.com>
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

Add zcrx_area_id_to_token() to deduplicate the way the area token is
calculated out of the area index.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/zcrx.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index bea606beaf4f..5b46e1335079 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -39,6 +39,11 @@
 
 #define IO_DMA_ATTR (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_WEAK_ORDERING)
 
+static inline u64 zcrx_area_id_to_token(u32 area_id)
+{
+	return (u64)area_id << IORING_ZCRX_AREA_SHIFT;
+}
+
 static inline struct io_zcrx_ifq *io_pp_to_ifq(struct page_pool *pp)
 {
 	return pp->mp_priv;
@@ -526,7 +531,7 @@ static int io_zcrx_create_area(struct io_zcrx_ifq *ifq,
 	area->free_count = nr_iovs;
 	/* we're only supporting one area per ifq for now */
 	area->area_id = 0;
-	area_reg->rq_area_token = (u64)area->area_id << IORING_ZCRX_AREA_SHIFT;
+	area_reg->rq_area_token = zcrx_area_id_to_token(area->area_id);
 	spin_lock_init(&area->freelist_lock);
 
 	ret = io_zcrx_append_area(ifq, area);
@@ -1533,7 +1538,7 @@ static bool io_zcrx_queue_cqe(struct io_kiocb *req, struct net_iov *niov,
 	area = io_zcrx_iov_to_area(niov);
 	offset = off + (net_iov_idx(niov) << ifq->niov_shift);
 	rcqe = (struct io_uring_zcrx_cqe *)(cqe + 1);
-	rcqe->off = offset + ((u64)area->area_id << IORING_ZCRX_AREA_SHIFT);
+	rcqe->off = offset + zcrx_area_id_to_token(area->area_id);
 	rcqe->__pad = 0;
 	return true;
 }
-- 
2.54.0

