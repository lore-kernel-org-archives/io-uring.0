Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E433215E5DC
	for <io-uring@vger.kernel.org>; Sun, 26 Jul 2026 22:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785104900; cv=none; b=tiRtBmkhLnHylUB49KCRQuwj6btl0+svPvomJPtTJzbYxPbfyCg1sdBUFdybOiQFlGjMubVMniWaNoI2Id4gqywzVjPOBVGBdCUkg4j9qC9jRERnganXmcmJJnJxzf/ZqK9ynxYjlbFGz4Hb1klhGbnnYLTDl3Rat5WuCESPARk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785104900; c=relaxed/simple;
	bh=/z5vYgbyTdTS/10mtAaeW2ee8Uz349KH0AhuOQAX+vM=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=krQq8UoMGyx9qoalOH9vuxNzIU5PIrBcqjZfJ3RDR/JCzK+D5mpVawvrS4hAefHBNC7HmeY5XR5Z2p+e8cI7KEeGQx4Dq/QtJu8junXhZ+DDnUcttsNFLE6H/ys8ZjnGVlkYC6/0Fz86jYpOa9Eyvch+s9ft1SIiEnXal5K9o/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=SoTX+6YW; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="SoTX+6YW"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-529a1ee0e62so11533151cf.2
        for <io-uring@vger.kernel.org>; Sun, 26 Jul 2026 15:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1785104898; x=1785709698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+wFk/RiwHOaMIcuGuDUKlnPsXy4xIT5T3SKzoI0BXj8=;
        b=SoTX+6YWq30M57pMRGz5CGJ1rrZ1/olDPLan9ig317CGh6W65MyruoXKBoHAl4fWt7
         Q+os3VdR3uKzvmfVWo9VwC4lWhXBvpA/XZoXvX0hKOm8EsHxkhTZ5MkKWbKaOM7do2SG
         BHwFbddYcMO7orfIbt4i+dcUwoMSV0oSBzq7gt2RMgAN3T/SNwCzaGJpnMZ5XMEFmZVs
         xAbrMB8nYL5ZfEzjrMeaV1D4qEeHFy5pEaU+IGM3C8Eg5RXWtL8EEVdXqe74P5tFEtrE
         26QVpdvg0eRh/OA+S5kL+8NkL4NR4Lr7ijrjLCx2dANYCbxUcW9Mq22ZQrTv+FnOo+fb
         77Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785104898; x=1785709698;
        h=content-transfer-encoding:content-type:cc:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+wFk/RiwHOaMIcuGuDUKlnPsXy4xIT5T3SKzoI0BXj8=;
        b=Q7jslnQXYRM2ViGQrc1FILZyDd8WRr3NSmP3nKsRmH/gOeEN/bZgcUsk0l7SZXoAvr
         HRsGYn7/d8P/oKUhVEykXbIHTPKB9843F8AibY6e1FhAW54+MipsbJbNPsMXLQPxw+Ys
         vgp5IACNtqpW59Q8PSgNgRmA7KdYZoDLq+Wv2qcUN/BTSp1yUWqFQWYymrtFRNMyYAef
         pd0hsMsmAcENXw1X69I4g7d+xzn+WZkAd7T0GbJ9HPZfxtW33WBNN+tjNr/9n1WsqZ2T
         mUqu9FXrtL/0vtn5I9/sgdPXdurmdFLTmPCosU1JMliGR7vZmMcekvEeARhaljraYAEk
         0Mjg==
X-Gm-Message-State: AOJu0YwEHwPzCKs8McabUGyZgd1awa8ml+f3O/49h2n2SDeqZCJvMYGo
	nedJJqOEOThn3i8bB3STRrqcNck/EfkgtVwW1tFq6QpWKHsXIdPK0eI0625z98Mehu7WOC9DjaQ
	/zCphcugKow==
X-Gm-Gg: AR+sD12OhRryT+AZ6y6L7nzSG+Lzk0cgD+HeoXX0UEvYFJaXi5AiirnyTLNJhxfpWS9
	wJVcdqmoMjCYP0xgjwcJPR7gxV3xUFsD/HH0zglkTHp9Q60gP1Z6qeWbgun1TSILW8I6He5ZHp7
	il1FbIUmSSiLKmS5V0xUR9pFp4bwvk3cFHmgrjuOZvKU+3QKZJ//uWVen07l7x10wwrFLTLr4WW
	yUSIsZIdt4KHdBHOa6VCsXDglUBJx29IREFB9dbuWSfrojZzZCGQzKMnoce4P/6K4j+vpKIBNS5
	DIClqzU5333zTM+qVgTWMlxIjcY+1MlupqBafDtbUqzH8M9dOK66H2+byG9NAUACA56ERpmefJW
	h16O4eKgEt27PRiPCVfDxrVFI0poCgzuiDlEVTOTfaRx9S1SMyZyA9svtPBXauhHv8zkuCBCm8e
	p46NBxKFahKYRuBR9wCL8juc9CXk+s58+MlGS+qcus9A1GqH+9zuSVfTVh68h+
X-Received: by 2002:ac8:5a47:0:b0:51c:11a0:9af5 with SMTP id d75a77b69052e-529a8726c5bmr65715021cf.70.1785104897764;
        Sun, 26 Jul 2026 15:28:17 -0700 (PDT)
Received: from [172.20.6.160] ([50.234.234.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529a29f92bbsm41999821cf.23.2026.07.26.15.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 15:28:15 -0700 (PDT)
Message-ID: <aa826e79-ddc5-4a82-9863-a5edfdce709f@kernel.dk>
Date: Sun, 26 Jul 2026 16:28:14 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: io-uring <io-uring@vger.kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] io_uring/kbuf: cap buffer selection length at MAX_RW_COUNT
Cc: Sung Keum <kambodi127@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

io_ring_buffers_peek() builds an iovec array from provided buffers, and
that in turn can be handed off to a lower level provider. Be prudent and
cap the total size to MAX_RW_COUNT, which is the Linux default for how
much IO do to in a single call.

No bugs here, but it's a good preventative measure to avoid truncation
issues.

Signed-off-by: Jens Axboe <axboe@kernel.dk>

---

diff --git a/io_uring/kbuf.c b/io_uring/kbuf.c
index de0129bceaba..1cf5be62bb65 100644
--- a/io_uring/kbuf.c
+++ b/io_uring/kbuf.c
@@ -266,6 +266,9 @@ static int io_ring_buffers_peek(struct io_kiocb *req, struct buf_sel_arg *arg,
 	if (unlikely(!nr_avail))
 		return -ENOBUFS;
 
+	/* MAX_RW_COUNT is the universal Linux per-call IO maximum */
+	arg->max_len = min_t(size_t, arg->max_len, MAX_RW_COUNT);
+
 	buf = io_ring_head_to_buf(br, head, bl->mask);
 	if (arg->max_len) {
 		u32 len = READ_ONCE(buf->len);
@@ -295,7 +298,7 @@ static int io_ring_buffers_peek(struct io_kiocb *req, struct buf_sel_arg *arg,
 
 	/* set it to max, if not set, so we can use it unconditionally */
 	if (!arg->max_len)
-		arg->max_len = INT_MAX;
+		arg->max_len = MAX_RW_COUNT;
 
 	req->buf_index = READ_ONCE(buf->bid);
 	do {

-- 
Jens Axboe


