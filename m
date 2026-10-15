Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C123A47DFBE
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092747; cv=none; b=Vp4ssMCvVHuR48G8tnx5Twelt/t5pLYqv4+lPlGpPo//2ojHRjAGta2NwQ7WNjVwVQxlfypZy2zSy72BwePc6OV4p5mbvnqUR47ty5kIPCDHQjwIXdThkkYHTxWl2lfCiBEGMD8DY7Wa9sdD0Asy37N8NmHFzH1+mCbFOVPB99U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092747; c=relaxed/simple;
	bh=xAVd86mKDFKcIpjZG0euU9fEZ8+RCTmcvJCeM/4VyKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PLxCg3tYgiTPFsUM++bNNqREWrpxCRQfxLRHwUUJ7rAwZLsGOCPQ90OUMVAkt0YPl+LuYnIDsuSkqiebn7m3Gdji8a/WAWKINcUODrtwqnZo6AIih9R65Y9tLVQzIuXysuBRR5NE65+VjwLAlQq9I2S8zoeetSJy8HO2tkGD+4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=X1b1npuE; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="X1b1npuE"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5361e313e63so9680721cf.3
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092745; x=1792697545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJNDwSq79AWWP9pYb5nz7+l7lGfzUNZsaVV5uqU+UJg=;
        b=X1b1npuEuoG0k/uHvyZISZWE8r0ovpXZbdwCYA8l5RHdHbKMrVJKZm0s4wi/UrqOmC
         rVTMz86GSa+rN9ZMn5ETEvSEkMdTfTAHHbFECgpSAY0WCuvlPXKNau+GOc3SPLt7xEBo
         UvWYbnBhasek6O2QLILuIVjl76T/Y35h18be2UM1eYcGAcScInciZ3UDoidA1EF6wSKp
         i/DU/xzC2w/v+1BI8i7x2W5Km8LChHfx6ITS7LChkrFvXZcyuqrRoQGNRmzpxt6XvnfE
         J8VX7By9pDwuy+uzvnTl9WEaOTDJJDnwTcDDv5usL+2eTb1vhXJlUM0h88etx0xS+0Zb
         uNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092745; x=1792697545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJNDwSq79AWWP9pYb5nz7+l7lGfzUNZsaVV5uqU+UJg=;
        b=Zo0LW7yVw5v3ASvJV/5qD8TUpMG30vVyV9TnOQg20pZQxVpc9s5q8HbsF8XConPx7i
         0z9iKquTNP/IVjto4VfO2RYqUJuHjY7VXp1voDkHLSCwhvKZsy5l7wh8DTKfcFmwks/w
         tEGhaVlyMqkK7+H/M+cToCV4UrUsrC55iD763wioX8hHlO4Z5vk3wbeHrWfmM01YdeP5
         NhmIC5HUtiFV4ZFUcBCnNueLf2eQCwfA5o17u22o5sy72rEBgg0jZWJFKPveBPKhavJ+
         PuyWrdZdFGPT8VrH50WRjO4zFTZxb/E0zis3wWBgFiNZqEPs8ELKvJqyKIUxg78ad5qd
         GUtg==
X-Gm-Message-State: AFq9FYLzMquB5pE74PdRVF+9TVAWVXn+AJWQXFgcQquCPxaRgNu7d3LV
	mGYQb2lKaYbyCIIryKS4uUfMwTexjHX6hdq9rvpoR54EFpl8DrK+fIUVJEasHKbvwP0OiUlDu6s
	WH6DI
X-Gm-Gg: AYBFou3BJ4Og6fsMdz5SGP0L9q/NB0hXNx6NHU7uL/GlNL4bGf8+mqmKkZ1/8w2/H5O
	3rLweyD7tHy0h2b+5jRGNJeH6x6D2/b+dwskn9GNiGIxG9/HmlqfM24DPFMaiuVLiW7QE52+HWJ
	eL5RCiChFPgYoE17ZaBDdi5yR6LrE+G6MEhV+d/ddPmgJWGh/6Arq/XTDxhbxVNB1zLcxysNvu2
	X9TX/16qu+OwHt9ZgzWBYjmWnrOT73wKNtOM/HCKkr0fuq1+N1qdOEMqWyH4qA8x7jBmFFJ1fLh
	Q2776FT5Dmb3vvApM8g4Y3Bu3QgAaukWGq7zIB46MAHzbmIV5qOe6Ibvu4IEhNpSO/qa5yqEmgt
	mOwusnd22kGjwAvp7nPErFx3QwzGlwj4tEk1UdpEOo17hF3Vagp07f3qtEm/utZybg3ZcWEPuya
	tPK2V92sEFQ0aa+8R36XW2DTfoc/6y6TqoCblaiXmSz0CSEKhUz1zKjrkMKYExbcRy7M8eWBuld
	MCyGvbkYSrFkfU=
X-Received: by 2002:ac8:5a8c:0:b0:530:d429:c70a with SMTP id d75a77b69052e-5359fac1172mr350440651cf.26.1792092744673;
        Thu, 15 Oct 2026 12:32:24 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.253])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362aa8044dsm1375051cf.30.2026.10.15.12.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:32:23 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:31:01 +0000
Subject: [PATCH 37/43] io_uring/sqpoll: let the thread sleep on disabled
 rings
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-37-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092659; l=1422;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=xAVd86mKDFKcIpjZG0euU9fEZ8+RCTmcvJCeM/4VyKI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMxHewUcnZT0eHJrrCo0hg3gCjXl4agrMlZ97lDFkItqr5qaVa+JZqBH2bZL/83XVgJloIUq4kS
 K74VGXJpRwwg=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

__io_sq_thread() doesn't submit anything as long as the ring has
IORING_SETUP_R_DISABLED set. The check that keeps the SQPOLL thread from
going to sleep while the SQ ring holds entries doesn't know about that.
If an application fills in SQEs first and enables the ring later, the
thread finds that there is work each time it is about to sleep, goes
around, doesn't submit it, and so on. It uses up a CPU until the ring
gets enabled.

Entries in the SQ ring of a disabled ring are no reason to stay awake.
io_register_enable_rings() clears the flag and then wakes the thread, and
the flag is looked at after prepare_to_wait(), so the thread can't miss
that.

Fixes: 7e84e1c7566a ("io_uring: allow disabling rings during the creation")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/sqpoll.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/io_uring/sqpoll.c b/io_uring/sqpoll.c
index ad42e8eb1002..ee97808a065a 100644
--- a/io_uring/sqpoll.c
+++ b/io_uring/sqpoll.c
@@ -385,6 +385,13 @@ static int io_sq_thread(void *data)
 				 */
 				smp_mb__after_atomic();
 
+				/*
+				 * Nothing gets submitted before the ring is
+				 * enabled, which comes with a wake up.
+				 */
+				if (READ_ONCE(ctx->flags) & IORING_SETUP_R_DISABLED)
+					continue;
+
 				if (io_sqring_entries(ctx)) {
 					needs_sched = false;
 					break;

-- 
2.55.0

