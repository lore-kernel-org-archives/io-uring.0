Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206066;
	b=Me+qvNywxCerPu94xHdMHposd12HHqLeRoHq5jDdnRegeQu1diHzv80CHqFIIbzxmoNj
	 eMpB4yFmX0SapUOuLnGRuafahfaC4uU7OYx7WQJqkacgNdmDucAv5znmmpAsIBLLsK9xz
	 2gpWHtqL7gXW6tcVOWALM/hrTnFn6uRla3I0iSyGzwJFHFom6d1vl9xeXHyl+DYz5unTE
	 q4DTFj78JPKH4zDHr8PrBpMlCFWKROozVZp9mgRtFFJzQoeD7mTU2DHX33zkfRj9s8DQw
	 3WKMQiA7ifazs0os9j1cSBjOjGmQDsdEf0RTy6lxMiQ7lys5TFUfPtFN0e2LME3lXWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cqy6614NUdg1Rbs1eCbf2M79PoAa10iSknK41Tuuo+8=;
	b=kj6jCeAPeX1dkAzHcBFD/A9y2Aex8ice6rLkdQkxrn67/P7ZvNKGNEWRUGlxbTq7dODw
	 gfrl+4KBor0w+GkPhf8Q26kwCx6gzGgvfuVz88pV5m1Vmnd9wbBKo+eKXEZgQ9lsnpYsm
	 q4A49iUZaCQiX6Bl3+PYx5aFJCmks4Jakp0CAYl+UnG30I8F/9Q5AQs0J9r+JLFXasu1/
	 w8SYRmlvrgo1b2wk9VCvcihvC+Wg4OA3jigtdfoWXBr3LE2NuukKkmu1Q+wEZAf95p0N3
	 rECIDOMn+jRdzQ8QifDX+Dmg+dmxt5q7x6MaGteqtKdgwyJzpyIhtL4cFeajIO+XF6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BvPZT3eB;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7F5606A31D
	for <io-uring@vger.kernel.org>; Wed, 28 Oct 2026 16:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF7F5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BvPZT3eB
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-843b6f8e2c7so1414018a34.1
        for <io-uring@vger.kernel.org>; Wed, 28 Oct 2026 09:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793206065; x=1793810865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cqy6614NUdg1Rbs1eCbf2M79PoAa10iSknK41Tuuo+8=;
        b=BvPZT3eBElA5X8VTZ2Uks7DMlaD9JE7BDIHEHqx0KDsXKwLTgtKUy7Lo7N+MNtZPrm
         eqFCdhaYjg7dOWJAkthWt2m+OEGpPG668fDacfF3p7+ypqPrcvtuBbCIstIHaeXMBeJk
         DDGGr8F87QWkd25VoxHGlYCM4hwfLHKU6FQmpdq/rdUjKp9/5xOyzJihv5z2q6qEasdh
         ouZ6Hts9IH4JI/OkRe6FFWpGZvRwcm74nrGWiabhbXDtg132j43pJqtryJ7ZIS90CU3F
         9RvX/fG7RhG7GlFXB0g8JSqzJoLWq+6XV+K+YzadD6Z2Re6MVwyBLDyVjyDsYTn69Gh3
         Bifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206065; x=1793810865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cqy6614NUdg1Rbs1eCbf2M79PoAa10iSknK41Tuuo+8=;
        b=T3S9pildiV68e/V+P+hyls5tzc4wMoTHP08oNXD9TxXyvKBhAEqSfwBimcciiFoTzB
         sMIf8fEQ93H44xEobcukn5qe90knwev/XE2Oo5rmXfloh6XsQn8qbga+FhPJdwx1kj9Q
         bFnwXdYPjy1DVeFDTjKaKhADRTCptqfxmFD3ZhsvdY1pVEWhuBc6ktQrZo34EbCdDHxB
         7hUkwDITDSYpW9U4h5ZG7POcLrUp3VRMp0rqKUs2/qwegVcX/8cXcPnIK+qKGl2a1OAU
         a/WLPQo89gCK5NSZDGZqp7GmGiudvfPoKkWVVXPoxKzmBay67icF4UQK2MPGWSEhaQoK
         KH+g==
X-Gm-Message-State: AFq9FYI6YoYyTycujWO5rAVaBiw1ummip9nnPy7OTJq65OMI7KPwNYEG
	H4Lssr1/n5TYCIVBRLX94XnSEczc1maeujiessJpooSiIR869lMMt2toxtfqE2E0ZW82MFZAqxs
	hDPUArXk=
X-Gm-Gg: AYBFou21C3bJ6rkk1EWZBD4VyhpmtQxHWLDNRiUgVpVFkGGIkOWD/nONkbRVmnEH9KR
	xrJLIzBBQ3Oh6Le9s/CQ5VOyGn10VytMC8ASGOuAwpCXTyWkhTfdc2jgZvcb+Iarx2wHtzNTdbb
	s915F5qtqnX8mP0HS2L6uxhQSod8e1jZIUm9jV6umt60SyXqHyO/DDsCf7Iz6KEsKAskiSW9Rjq
	UX7NIjGoAlGcOUHf1rStBcLW2BBXQShqjTTmrLCnqGlhKxNGxZXT16bD2OebpJ/GwlYDxFs4XAF
	BrI7JbfY7cSh/dT8+HV5KAOnk0oOjdjU/QQFX9dnlD8Zkzp5D7GcQ4b6NPORXKK9IWpga125bI8
	GJsa1bNYLw/MKqGjSL6VJFt94ajoTu6G4RtNyc3FLY/Ak3GjUVsiP/FD1uoToqCaWgJw8v/JaXw
	rE5ernICrO4Gc5WVxb+rRJZZ920XaK7oHH0iMt1E3lrHtAV1IoMBdOjgGTGsGMdu2aZHZZwxPC+
	aMXWuimnYQ0csnqlb2RdaAeQNbGy8V8bmKWa0xMXGDiwS4Vb9gxfOksCRUf6U9RXvn0ZWe6G5la
	0DKFtXRFnqwpW7tGZgky/sMXxmCx+LF7DINcqm+QuekE3HPncsKPJhBnBSpRjdmlwL8bmACccQ=
	=
X-Received: by 2002:a05:6830:2b2a:b0:829:9992:20e7 with SMTP id 46e09a7af769-85ab88cd029mr2760923a34.30.1793206064772;
        Wed, 28 Oct 2026 09:47:44 -0700 (PDT)
Received: from xps16 ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b206f8a41sm2019182a34.25.2026.10.28.09.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:47:44 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: Chris Mason <mason@kernel.org>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 08/10] io_uring/cancel: drop sqd->lock while SQPOLL waits
Date: Wed, 28 Oct 2026 10:46:56 -0600
Message-ID: <20261028164732.1264069-9-axboe@kernel.dk>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028164732.1264069-1-axboe@kernel.dk>
References: <20261028164732.1264069-1-axboe@kernel.dk>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Mason <mason@kernel.org>

An exiting SQPOLL thread calls io_uring_cancel_generic() with sqd->lock
held, and keeps it across cond_resched() and the sleep until nothing is
in flight anymore. A zero-copy send notification can't be canceled and
stays pending as long as the peer doesn't read, so the lock is held for
as long as a user cares to. io_ring_exit_work() needs it to park the
thread, and so do IORING_REGISTER_IOWQ_AFF and IOWQ_MAX_WORKERS. With
64 such rings sharing the thread, every iou_exit slot sleeps on the lock
and no ring gets freed for anyone.

Drop the lock around cond_resched() and the sleep, like the main loop of
the thread does. Each walk of ctx_list is still under one hold, and
nothing is kept across the unlock. The thread drops its io-wq, frees its
tctx and clears sqd->thread under one hold after the loop, so whoever
holds the lock and finds sqd->thread set can still use them.

Fixes: 63809137ebb5 ("io_uring: flush notifiers after sendzc")
Signed-off-by: Chris Mason <mason@kernel.org>
[axboe: adapted to the schedule_timeout() based loop]
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/cancel.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/io_uring/cancel.c b/io_uring/cancel.c
index 6f7a6cf356c2..79b5c133319b 100644
--- a/io_uring/cancel.c
+++ b/io_uring/cancel.c
@@ -703,7 +703,16 @@ __cold void io_uring_cancel_generic(bool cancel_all, struct io_sq_data *sqd)
 		}
 
 		if (loop) {
+			/*
+			 * A request that runs in io-wq and doesn't end makes
+			 * each round come here. Don't hold sqd->lock for that
+			 * long either.
+			 */
+			if (sqd)
+				mutex_unlock(&sqd->lock);
 			cond_resched();
+			if (sqd)
+				mutex_lock(&sqd->lock);
 			continue;
 		}
 
@@ -741,7 +750,18 @@ __cold void io_uring_cancel_generic(bool cancel_all, struct io_sq_data *sqd)
 
 			if (state & TASK_INTERRUPTIBLE)
 				timeout = MAX_SCHEDULE_TIMEOUT;
+			/*
+			 * A zero-copy notification can't be canceled, and a
+			 * peer that doesn't read keeps it pending. Don't hold
+			 * sqd->lock while waiting for it, or whoever wants the
+			 * lock sleeps as long. No ring is used across this,
+			 * the next round walks ->ctx_list anew.
+			 */
+			if (sqd)
+				mutex_unlock(&sqd->lock);
 			schedule_timeout(timeout);
+			if (sqd)
+				mutex_lock(&sqd->lock);
 		}
 end_wait:
 		finish_wait(&tctx->wait, &wait);
-- 
2.56.0

