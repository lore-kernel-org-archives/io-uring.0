Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953EA44D68A
	for <io-uring@vger.kernel.org>; Tue, 21 Jul 2026 09:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627840; cv=none; b=G56LiN2n0n/QPcFmmTFtRT7VQQMtN2vEOlvrpiFAABkvdQB2EvPKFU/rSRERbZ9EknpnmW7LUKodwTYSqkDMPG9jBkXbSSuPawEpEk5TmApFD4ikIC4TdS6WL3XD6+kokqZdXDUDl5mUUkds4CgHh5ne+dOgx97HenBmnyYYunw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627840; c=relaxed/simple;
	bh=pR5vKx+ifxyexrw8+sqWJetVzv0/JsCsCmISYtkw/Zc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aHpUoUe62K9ioKqjjuxkxEQewdlbwPP27MVZ81qbHEBhifRUFVGNwLLHClH5DP5vxUzz1WwGYsIlCTxJ7uWxY3Ct/MqZf1HqHIxIjsIY1K0bLl9OcoE2OaH1xBY7id9Lzx9JdUQUJFvnJb6ciqHhvgGYsemg+eic7l9daBO4jNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IyQ8CSJZ; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IyQ8CSJZ"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca913a601fbso7477796a12.3
        for <io-uring@vger.kernel.org>; Tue, 21 Jul 2026 02:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784627837; x=1785232637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vi8Y5Mae0eMxJXexF7C1mNZVoJhUCTDqrvtov6btneE=;
        b=IyQ8CSJZeA35GEUxdtBIupbv0zSyEg3bChBc/R6eoJeq9823/yzJBl3i4WL/as8T3L
         a2T67BOhg0vxam+igL1pgiJLJK0D6ENOh0AGewqeSKodjyOrWZQyrWlNA4qGyMnl6rPx
         9LGBVRl4OyUVGCpTyQH9zQFS+g5GTpLaXX/5cGbLH/T1Y0kzzhcyKzdK00OGTCjJIg7E
         2TLGiCPiVCuJUyDjKXmzH7fcaOik8f0in4CrskVzq5h4ahXuJrxHw2Axo/3a/yWbu7Hc
         CFhgon756vDaTXvcGZ7ns/Fvzsx/2mx8Trq3SdvLDV3djunYRLGDKUvowwpqzeJehR+x
         /xbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627837; x=1785232637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vi8Y5Mae0eMxJXexF7C1mNZVoJhUCTDqrvtov6btneE=;
        b=ZpWqnKMEhWcEWPuJGhWhYQIfgaBd0h9qKbjPuaXR6Dod+zq9cHeCMUHET9QJpIj17D
         Akn/bpbS4Tr1j3VN6DRoYSFAzeQXGEvtUEEICYNH7dF6Ds25IkWNIjkJNrKPnyvYyZr/
         W1r/TweHD3yN8kvacWxFdmfUGBUooBN9OTk04cS4n/d5BJYxQIMHtFP+uKpd6oB2d/U/
         /p1L60BVSj1koD2wVeC7/1JJMl528ujJ8nBSe/OBlVDhxRZ9nRGle/82oE7bnVEeFqGQ
         auEt1aDJzsNlb3SpOZMBWCQK4UjtTByBf8Mf37azbjXlxYgNtaSxTnT/m88Lwbb3675A
         gj2w==
X-Gm-Message-State: AOJu0Yzii1lLEkxyJ37qNZIaKyzJBs2UUud5c4YSdnHHS7IJcwV9rNSy
	9ixFlRLTW9fzKyCfA3jhOmHPkwhCd8SibXmpqrWQxcIlcyqmmUJdEZDmQsbZac8N
X-Gm-Gg: AfdE7clfX8k1zfooGkiKN9Tb1mLtD8/aVa5fGRrVMCnfe18sQNxwfrZX2DBRKs199IA
	bmWdvSUbSR2/mR/fi+Ofjs6vzna08r/z6ynDzRZE7I8QmFmg1bNgNNhDkwASIt14VSncEvYmaVT
	gJ+wKFwD9EiyCGx8pTOwcP6QyT+rScHFoHS0NXvubo1yIYGhs027QkHLbqmFQ+Wdx0DIBL9zRla
	d3r7EW2CEHP5DWKSb0xuVbGVPY46NkMmN8N2dbUUb68DThaEDfxqeUy7XDh+fG7vvDBUc6WTtV7
	8cswWmWQxRyXGr2MwFWarf3Zg+DoGQlLPdnLK36Lrbl9oe7BQ+PCgP6ZRiyCn5bjQVaGO3Hd7R9
	Onr1DCEaIAQJlu9JE5Ts22LA0NA4hlseRHklVyf+TqYXD30o/LfiNgdiXfCvFvjSeTtjLatc2Df
	apHMMhQiF5DDaLkUxs62/FNsrC9pdWfWTvsRqY
X-Received: by 2002:a05:6a21:ec42:10b0:3c4:de3:816c with SMTP id adf61e73a8af0-3c40de381f5mr2669733637.37.1784627837591;
        Tue, 21 Jul 2026 02:57:17 -0700 (PDT)
Received: from localhost.localdomain ([125.20.165.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bb770sm49460081eec.16.2026.07.21.02.57.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Jul 2026 02:57:16 -0700 (PDT)
From: Aayush7352 <aayushdixit924@gmail.com>
To: io-uring@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>,
	linux-kernel@vger.kernel.org,
	Aayush Dixit <aayushdixit924@gmail.com>
Subject: [PATCH] io_uring/kbuf: fix UAF in buffer selection when access_ok fails on expanded iovec
Date: Tue, 21 Jul 2026 15:27:11 +0530
Message-ID: <20260721095711.80711-1-aayushdixit924@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aayush Dixit <aayushdixit924@gmail.com>

In io_ring_buffers_peek(), when the buffer ring is expanded
(KBUF_MODE_EXPAND), arg->iovs is set to a newly kmalloced array.
If access_ok() then fails on a buffer entry, the error path kfrees
the new array but does not restore arg->iovs to the original value
(org_iovs).  arg->iovs is left dangling and will be reused on retry,
causing a use-after-free when the caller retries the buffer selection.

Fix by restoring arg->iovs = org_iovs after the kfree on the error
path, so the caller's state remains coherent on retry.

Fixes: b3e0216c97e3 ("io_uring: add buffer ring support")
Cc: io-uring@vger.kernel.org
Signed-off-by: Aayush7352 <aayushdixit924@gmail.com>
---
 io_uring/kbuf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/io_uring/kbuf.c b/io_uring/kbuf.c
index de0129bce..eab4de8a7 100644
--- a/io_uring/kbuf.c
+++ b/io_uring/kbuf.c
@@ -314,8 +314,10 @@ static int io_ring_buffers_peek(struct io_kiocb *req, struct buf_sel_arg *arg,
 		iov->iov_base = u64_to_user_ptr(READ_ONCE(buf->addr));
 		iov->iov_len = len;
 		if (unlikely(!access_ok(iov->iov_base, len))) {
-			if (arg->iovs != org_iovs)
+			if (arg->iovs != org_iovs) {
 				kfree(arg->iovs);
+				arg->iovs = org_iovs;
+			}
 			return -EFAULT;
 		}
 		iov++;
-- 
2.55.0

