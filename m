Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8473D58B6DB
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 20:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792096104; cv=none; b=snPHJ2+1nfeUErg8nYuhE5lk0W7UOzJQvhYPVgHPkUTYlYjT7iTuHajFZWBcn0wY0stINGuflyVWhYSsYhDvZQzx15n9J2R+fvhCW53pEmmvvxR02aaIua6TMFC/VSs3XUgpgCHeo5m1+K39i1ouPa4yDS2nNjPbVpuJ1XIPMxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792096104; c=relaxed/simple;
	bh=P29UiiTgc5TSOtwFzZpweRAhTmA3GJ0e5AFL5rH+cDo=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=I+CYH6NkfQTqWffCdazmZKUtPtWo+X4kliDcg87RaMBakWCewFCrSgOnfjDZ4q2tttbPBQRo7lGv1c8JGNPTD8ReE6P/8yIlUpJ+I07mdEa23RBGhe39tIwf/J4bufBwctIUr2TNny2xFf1vGXQkmYZEZhYIe1WkQjhh7htUH5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=fYear0+L; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="fYear0+L"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4a6f2825dd6so664878fac.2
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 13:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792096095; x=1792700895; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZX5pknan4ntH1HZcthR+WjdFklE/WRtaGozrIikDxnw=;
        b=fYear0+LJ72xmu6NwczXrcBCMXeSiqTcmvgdSswakpGwJypTWurWrquQtxgqHFu+Xz
         HjbLWxwQRRRiB9uLNzqsSKb3r05VxBevs3ZmYn/zVT0KpZVUMQaY1cyLFX62rWGt+VxP
         rLxh4RxjBrULYNpeSJ2YqYtUp03tscJJsbbDCGzO3vgZzKGWBl+1U9oZ6C+iKVGOZok6
         shYcvWyM8XKXpoCnJGM3+1GA2GQ6ONLZJEKKFd16BrGaroyNZpEThkKjyszuC4WPycnZ
         nwYFlDgIhDajDvA7x91WfdfT9XLypfTrAmvVz31hhiWBp/Mu1BlwKi+FIJM4qfUjg3dv
         IP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792096095; x=1792700895;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZX5pknan4ntH1HZcthR+WjdFklE/WRtaGozrIikDxnw=;
        b=EYLVinm5fxnPMnpRjagFQqD5JKXrXJjjAZJ92T2kd/SPmaFcf8XwmOWegnT2/+UeN6
         jjpt8LAXqBpC+bPwklILZXmz87LspfDo6SHdVJPk8tvM15RX26Db0JOlJTdAJ7CCCnY9
         /Z2UKieXG11Msfn2v0q6jCwDaZky+lhwce5/iXL2ZqS50YVrfOSNIPuN26S8fl6UYRVg
         gxrxmFaf1N5ApQWF679HDvYzhWVPmw2VW6BasHNV2C12FSn80vSl7Xfhzumm0zVGAurw
         x6JwjcxiuzdH0cQ9v2MhOmjCcqas8ymaDGGErhNoRHlYhxF4ECZexSuPidU9SBF2YHtn
         KuLw==
X-Gm-Message-State: AFq9FYLIA3hvzYsfUarojNyje3n2fHvCTZYZ9b9LW+FlfSWwooJuRUOE
	cYAi03tTMvwR4b4KIbBzm8bQD3icS2L18b5anvXHNkyEYyFzob2wapj7aJWQe3aSbLMwfGFVkGQ
	0kGU1z+U=
X-Gm-Gg: AYBFou02ExtAiHvc7pSMP5hAKZDTS0Z+5MeTz7W3/aJ35f6IMkUYfgIjmQkyG3fRDsp
	HfDTN0sMf98kydmj+8KOwf9BVzSiLDhkyIQld3MFBVXbabOWjkfVc9Df10KwiZQXOb7ZcNb8KoZ
	T65X6LxXYh0r2F+rzqD64OPYkHQ8F52wOqaQJzyIDQp8G9ts56GAuqny5op0OgjxRuua4yBVL1i
	XKxLGE2Ufo5nIO2DpDZ5Qw6zayRmr1NRjjoJfGwKMerEvirxHIVCbCPp683atr1Qh8kGDEQzuFS
	LAewP6VNs3GGHbprLfaiuD4x08N/UkgyuBxbGwJ+EnDISw1FqcEQeXsQMTN7BceR5qztRA9kMH2
	GjRGkpUR6HkK2Hxv3551/Y602EZBw/kFEdI+zkkqcF+z2rWhpQoE1Zg1XeHEKHuPkHeCMt9te54
	wk+5DTeWhv7XEjKnjgLv4Z3a2BLSi9Xoi9xM7hW9LZuxKo+1ZwBoBdK5TFC3SfzIaGadzx9y3Kc
	AHvJpLYcoCHOLqXd15vaIcRk1kBTtuThLfzfnMoiYgt0e7GTj8q6xgZEQ==
X-Received: by 2002:a05:6870:21d0:b0:4a7:20fa:b5da with SMTP id 586e51a60fabf-4a720fac5cemr1579120fac.24.1792096094620;
        Thu, 15 Oct 2026 13:28:14 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a73b6e4a79sm16537fac.13.2026.10.15.13.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 13:28:13 -0700 (PDT)
Message-ID: <3897c06d-6a6f-4099-956b-627aca3c236c@kernel.dk>
Date: Thu, 15 Oct 2026 14:28:12 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: io-uring <io-uring@vger.kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>
From: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] io_uring/timeout: don't put a sequence target behind the last
 flush
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

io_timeout_fn() and io_kill_timeout() bump ->cq_timeouts when a timeout
fires, but its CQE is only posted later from task_work. Until then the
sequence io_timeout() computes is one below the last flush per fired
timeout. Now that ->cq_last_tm_flush is kept while sequence timeouts are
pending, a timeout armed in that window with a small offset gets a target
behind the base. Its distance from the base wraps, and it's never
completed by events, only by its timer. With DEFER_TASKRUN that window
is as wide as the application makes it, as submission runs before the
local task_work.

Nothing but those in flight CQEs separates the two, so use the last
flush as the base for the target when the sequence is behind it.

Fixes: c6c0b3eba88c ("io_uring/timeout: don't skip over reached sequences")
Signed-off-by: Jens Axboe <axboe@kernel.dk>

---

diff --git a/io_uring/timeout.c b/io_uring/timeout.c
index b219dfdf7af5..e52ba4ad53cb 100644
--- a/io_uring/timeout.c
+++ b/io_uring/timeout.c
@@ -690,7 +690,6 @@ int io_timeout(struct io_kiocb *req, unsigned int issue_flags)
 	}
 
 	tail = data_race(ctx->cached_cq_tail) - atomic_read(&ctx->cq_timeouts);
-	timeout->target_seq = tail + off;
 
 	/*
 	 * Update the last seq here in case io_flush_timeouts() hasn't, it only
@@ -704,6 +703,15 @@ int io_timeout(struct io_kiocb *req, unsigned int issue_flags)
 		ctx->cq_last_tm_flush = tail;
 	base = ctx->cq_last_tm_flush;
 
+	/*
+	 * A fired timeout bumps ->cq_timeouts before its CQE is posted, which
+	 * leaves the sequence behind the last flush until it is. Nothing else
+	 * separates the two then, so count from the flush.
+	 */
+	if ((s32)(tail - base) < 0)
+		tail = base;
+	timeout->target_seq = tail + off;
+
 	/*
 	 * Insertion sort, ensuring the first entry in the list is always
 	 * the one we need first.

-- 
Jens Axboe

