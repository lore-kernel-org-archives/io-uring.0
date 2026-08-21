Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E26C476CCD
	for <io-uring@vger.kernel.org>; Fri, 21 Aug 2026 10:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787308414; cv=none; b=B55ltovIdjgcM3iuLNl6IG0zX1XQ5oBG7bOP2UtpMfl52qGW0wJv37fC+VJOIrBXKE5MLLbnhzGBORCscQOgpk0tcLEZ/8+Od7TiJPuv1sYcOgvjftjlHf7xJdRdRHNgCpdhuQzY1UwYbrdFxhHWBuXZVAgGldjA6n7WmNK9xiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787308414; c=relaxed/simple;
	bh=jczjUbzDAl6jpxRWnP0Bypt820sjeIHGu2zY1M2ntdE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t1rn/wq4FnwMCy/qvC25tddPBxh6BmvJzSm8ZPTzmq/kZr9lDnuvSpvPVpK8W3jXimr2ADJbYg3xXiA9kgbiwPYlTvY2sUoIUsj0epkBq/GBP25NIW7nsjKNyCHg6hlyXxRyo0zTzxDpQI5ev8F6oNjI1PhUOgj5FG9kUt4FVhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLda/S9P; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLda/S9P"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso613888a12.2
        for <io-uring@vger.kernel.org>; Fri, 21 Aug 2026 03:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787308404; x=1787913204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ocsm7hINWtOwY+nJRxPAD45OZz1hNH2OpiWJbIaIUKg=;
        b=QLda/S9PO9BfJvPsXXp2y+yNk4GH02CsQQc0DlZ6VgW5SEXBRvVK+JycvaGuMzddEK
         pM053/dHgCdBkqlXEFBY6ElFltCOQw64LNsqyZXJAyTsBNdAYYSeoMLSz/Tc4Nw5+egu
         kQhlrFJ1KqDSRGuPc5icEeLyodThOwMKxDUWCH0PCpOvJOvGloUXuaCjYA9FOB7Tv132
         i1Z04J/Sf6O4BS1599i97+LDwnwSa88zotH/8/iyQpHSEhh7nk4BJEYlM+e0Y4Bnad0y
         syNifiUdo1/BrSwMhvWFKucAxFFrx5bk2LaJOjN/rcNrtDk3kwme69+8Wiv7WRSMgd6Q
         4IcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787308404; x=1787913204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ocsm7hINWtOwY+nJRxPAD45OZz1hNH2OpiWJbIaIUKg=;
        b=MZPwZqJt9ysmP/l7fA3y5NhZ2mG0iy/8qbXNIl4DvKb/SvHhDLLYlRLPvMmM33yS/H
         vxSu9Wn7ljp5nu9+6BFfwyU+z3LBxFTOYCAi3ihIIoBtToC+/Ifynmi5EmxiWJkD/G3C
         xYBeyaIQUUIf/2fSQnnQl72aM9dDobvH7/ur4kkOfIsr/uF4SJat5N7c6Ui9olso1zwS
         4VkkmxW9fQKa061zOhP2IG/q7XYDbywT1wVuVJ07/OQVxSb7eDHq+5PfTPMnIG62kYW5
         vqEBt2Djx0dAyAkHZYr9zRPVQLYn1GRHPtZ5EWjMb8g3dfxLTwkR1WXyPr6RPRi1GQEz
         Ydgg==
X-Forwarded-Encrypted: i=1; AHgh+RppfHvbq7ELpO5Ubatt/Z77CaEmFkBPPBonNHsKYRlZx5lOGEZQqaNs3pcIZeY999XZwky7PKXGGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhrSGCOP8OVoCk84BKZ52beUAGB/EUOHOPc0uuB5jNG9eDK6lE
	GAwU8yyyhifLd6A2ev5+NqMd3TsrWtH3IaNOZn5pKBAaS073lW5TD5TG
X-Gm-Gg: AR+sD11kmdhbBQ/CarR3MCO3G6HL9LCenLWkOV6MWS6zgow20LHF1ETi5xWlr92hotv
	YwCe5Lu2YW+BdrBix9A5ynbcA63Mk05mo3AR7F8gvq/QXpjOHyUXFaS6AaOdM9wfVkXCv3ObIEZ
	BDbC8SjEcCr/yW9HVs0cpxP4+8TFKAaAN2akmmzF4P+zfogZ0niP/3jymO0B7jvi2o+Xe0Pb/UF
	FTRBd358+8z2CPzZofuP3yOPjmpgKVINme28WwxG6GbeKfvVFNz7oukmRx9lmQdHyvO2KkSNH1E
	Pj90AR125sjCErTglgTRuFDoL749q0MaKj2y8FECVxetKgw5i3ls1thOCjMjaUrWjNRtZ6imHuN
	S/rxbxLiok20zk7gWR7zLzK1DYjiAoebuaRlPLy8Mmo5IWoDsgQ7XujMjXPDDZdq24UbDrA474r
	QR3rsGr3uhVnz1GckDzdh0XZ80YaohIBx922yNnoFWyq1lAhDqxDswBwUBTIufELps1RN3bxtyF
	mYyRClP/TGLg/zZofSwEMFPQbgxpMI7dtH4tJBsgkX+7fPbEdJE3xOFTd6uR7G5+shs8fbO2xHx
	tdFUbL4epKruVrGbgwlU6OuGWt/hvDGMQDAf6M5gD8biG4106b919JYjtfzuGzGdIqb8RBD+Bpu
	PkAzmZN9tP0jPeCehCwe/xFWcbMyc+49CC/b/7E1gq/+Gyvw=
X-Received: by 2002:a05:6a21:e081:b0:3c8:f342:132c with SMTP id adf61e73a8af0-3cd3000a342mr9446232637.11.1787308404443;
        Fri, 21 Aug 2026 03:33:24 -0700 (PDT)
Received: from localhost.localdomain ([101.251.7.10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae48761sm23237958c88.12.2026.08.21.03.33.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 21 Aug 2026 03:33:24 -0700 (PDT)
From: Laxman Acharya <acharyalaxman8848@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Laxman Acharya Padhya <acharyalaxman8848@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] io_uring/query: cap user size passed to copy_struct_to_user
Date: Fri, 21 Aug 2026 16:18:17 +0545
Message-ID: <20260821103317.91437-1-acharyalaxman8848@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>

io_handle_query_entry() clamps hdr.size for the inbound copy_from_user()
but keeps the original user value as usize. copy_struct_to_user() uses
that usize and, when it is larger than the kernel result, clear_user()s
the trailing bytes.

As hdr.size is a __u32, a query can request nearly 4 GiB of zeroing,
including on the error path where res_size stays 0. The interface is
reachable without a ring via IORING_REGISTER_QUERY.

Reject sizes larger than PAGE_SIZE, as recommended for copy_struct_*
interfaces.

Fixes: c265ae75f900 ("io_uring: introduce io_uring querying")
Cc: stable@vger.kernel.org # 6.18+
Signed-off-by: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
---
 io_uring/query.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/io_uring/query.c b/io_uring/query.c
index 88a325736992..f2b5e19e5af6 100644
--- a/io_uring/query.c
+++ b/io_uring/query.c
@@ -76,6 +76,9 @@ static int io_handle_query_entry(union io_query_data *data, void __user *uhdr,
 
 	if (copy_from_user(&hdr, uhdr, sizeof(hdr)))
 		return -EFAULT;
+	/* copy_struct_to_user() zeros up to usize bytes */
+	if (hdr.size > PAGE_SIZE)
+		return -E2BIG;
 	usize = hdr.size;
 	hdr.size = min(hdr.size, IO_MAX_QUERY_SIZE);
 	udata = u64_to_user_ptr(hdr.query_data);
-- 
2.51.2
