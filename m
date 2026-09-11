Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6A4493D37
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141708; cv=none; b=QWj5CnrGZfkLVlbT3cSvTJQ6tEnBcIhvKRBd5Nq5yn3jwojsWlchzyvoFGRAr6wKmYeijFsaNFG9COSzMUMWn5Vg1zKRYV2MKPRUGyqQkooLm6PLe5uHtsXxVCHb7IEZ6FyBhuE/p+Fcp981mBpT5Nj069NHUaJf6gu+pmqFaDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141708; c=relaxed/simple;
	bh=+vG/XNCka29iGBZ7Npl7VlEeURi/pbocinaTbBpYTa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RbdVqPPAoBqNrmCuk8HBatE+0ysDjz85upWdrDDmfSp1AYj9S8kC9zP9g/TICn1gvaX26GsX3EJ+jrOnX8fdjulveIzpOE8DKD2fr5dYLyLymrxVTZ/M6+L3j4S606W7DZXFWbQ7CWYUKlyLqqgeH0pQ3+D0yBFsSLRQ/7X6W0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=LS4/i5Ja; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="LS4/i5Ja"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-801b48c329eso567479a34.3
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141705; x=1789746505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CNmMMXa35LsfZV184CPi/h2/xUGWnnYnc43ODYGG+NM=;
        b=LS4/i5JaBHLcC1SjmmGdpvlVS8Ki+1J3Szf5ZGVE/r7Zq7WYquo5xMIIoHmnB/vHk4
         9GVdEdI4hXId1T312aNs75WVqQZJY/Y9Zy9tKsmknrf0p9oiSx1owSGJuprGgdPj0iC6
         5+pBEW3BMqvZJYAfk66/I2L1ybA4YsSy0oHTRvBcJ+8UMTViq3+93Z7raoT1C4UEGQ9X
         bMgEwK9TA1/OW6BTqN6dObTJdAZWn/t8Zl7K7dDl6bhPY2xW11b/CIK52zoFzSYVXcFu
         0biknEe4gdsfK9xWbBEviSkHlATO0bY09cwLBrxOHXp7WrELJln9Rl7sk08oJkYrI2ib
         IUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141705; x=1789746505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CNmMMXa35LsfZV184CPi/h2/xUGWnnYnc43ODYGG+NM=;
        b=RP+Ym6Dqc4K4eFch3BIv152IZCwXtYsbCM0YTPTff+eiyJ++p9rogqOynDM6KfY2sC
         sSNtHahtT6zwmj7sA6ssAaqfvjCUQc6DS/Qt4WpbsnU7lTq50bjwRsH4+dHnfTMKe7La
         HlIOwV20Wbd3RtT76dlmjtUBv0+uHjKIk8G0vQ2pZe1KYY8J4KHdTfe3nccpRf+e2rcR
         UBSsQv4Vf9KIxIJphoVhNNTYzjUBlhdiOCJbcud8cZfTqPMtiNsNp5kRyryo6lK3F9+4
         PrXSaT7gsINW0W4YPD4toJeLPs4yTSj26MpWcuGX77VhsTiG/N8aOvRVciJM1K6NT9y4
         +H/w==
X-Gm-Message-State: AFuF++mb2Ic3MbQ2kaPQUX+U4nYG1oAyqCMTC32n134UGvzktv9OHc8X
	1e+NkdYFi0dFZD+TnMakh4tep7O72z1S8iOmAU16dc9raEoZWPtc51RnN/TiRTmG4LC0LDz8Y9E
	Ags9qEhY=
X-Gm-Gg: AYBFou1i4BheqQCEyE8On58w+IHOOU5yQ9GxspUHajEjps+LVJV58Q9SrqdwwzYIXHP
	2mEHDWot8HFClOmP9Jga8vnGcz5UJihTjgE2/8KGWHQhZOyoX2m+gSVwgoTeQChdgLAbaUAk1PQ
	uxKcZm7So73zp8sz6H9pMwaFU+NJrrNslWJjwWU1x0ITAWbPqHvbFL17y0Unag4JLQJ7u6e2dD/
	EMn1N7KFEd5RKR2SH7HJIPmo0huyD7wdvCqEAh589X+F/0RkbvarZQ1tYKb8zODH2Vg7+hej6Pe
	SE9eW7ZU24KTYXlg3xeChMg/1O1VsKRgzuNR8zeeYelAtFzbSsWGbnsTx4RVlPWV/QgqL4YVOqU
	Mi0L3PlfG5HIRIJXrwDEpthvb4qGs1NrTWOe1eQRQEh+8bU0Va/YoBhMAyIJ4Z4Vu257p9KiF2P
	jXbo0AYCVvkB8TbYjIWfyp/Xw+OwHaPbYpg/7OSrV7xejXhVWmWieUWAUHrb/4eC0/EdaOpTIRN
	aCYhRYw9kOqzIR5aHkSnnn4lLxBpTwgHughg4uHR4M=
X-Received: by 2002:a05:6830:2785:b0:7fb:547f:98bc with SMTP id 46e09a7af769-803ff55ef3fmr3920700a34.5.1789141705065;
        Fri, 11 Sep 2026 08:48:25 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f6d1ca4bsm2629478a34.23.2026.09.11.08.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:48:24 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: juanlu@fastmail.com,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 09/10] io_uring: drop registered files and buffers at release time
Date: Fri, 11 Sep 2026 09:45:33 -0600
Message-ID: <20260911154811.646705-10-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911154811.646705-1-axboe@kernel.dk>
References: <20260911154811.646705-1-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Registered file and buffer tables are only torn down from
io_ring_ctx_free(), which only runs when all requests have completed and
the ctx refs have hit zero. Before this, every registered file remains
open.

The resource nodes are reference counted and any request using a
registered file or buffer holds its own reference to the node, so this
only releases what is actually unused. The rest follow as those requests
complete or get canceled.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/io_uring.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index eb8a3626c684..977c8c510b85 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -2196,8 +2196,6 @@ static __cold void io_ring_ctx_free(struct io_ring_ctx *ctx)
 	io_sq_thread_finish(ctx);
 
 	mutex_lock(&ctx->uring_lock);
-	io_sqe_buffers_unregister(ctx);
-	io_sqe_files_unregister(ctx);
 	io_unregister_zcrx(ctx);
 	io_cqring_overflow_kill(ctx);
 	io_eventfd_unregister(ctx);
@@ -2463,6 +2461,9 @@ static __cold void io_ring_ctx_wait_and_kill(struct io_ring_ctx *ctx)
 	xa_for_each(&ctx->personalities, index, creds)
 		io_unregister_personality(ctx, index);
 	io_terminate_zcrx(ctx);
+	/* Drop these now, rather than async, to unpin the files */
+	io_sqe_buffers_unregister(ctx);
+	io_sqe_files_unregister(ctx);
 	mutex_unlock(&ctx->uring_lock);
 
 	/*
-- 
2.55.0

