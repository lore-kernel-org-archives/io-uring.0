Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FBA37AA78
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092740; cv=none; b=Hq0/tIsib0u3yLw3CWGoAdPPwxQ2vJJCgqRSn3VqOH0rDm2aKFsyPGJktqsIxlrytXSK7tYxa4tnsHHmKAwyhye/S4RpHv1izv5LsTI6b63VY81y0uHzXPxtq3Zd/clYJFMeur/mYTnqBV03XZ4XqC4gw4d27ztvFqvuGdr6WmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092740; c=relaxed/simple;
	bh=oBwomQxI3r6FPouUryl6SXpE4fwLhPSDCK72zMrBMaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VtY0dpoTaKifR4fkYhZJWFGJoAJYBr6bF7hbMjwSKiVQBFcms3GR379m0nSvAPVJz3EebNcTE686kGJaL84hzunRJaInmZsF+mmNDclOTI5EId7jRlsV9HCMVBVU9baaW4pQZhTFkHa80qPtMeuUG9r2KM3+yHiGegNRwJ8ZPaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=Jm8HV5rY; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="Jm8HV5rY"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-917a04338c1so60991086d6.0
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092738; x=1792697538; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I57KaZmuANvDJJ9jmZcHPHgVefwhwDPZhD5MKXl3Gaw=;
        b=Jm8HV5rY/yytxvKFYaBkudpM8UbJ4GmDH68o/wOlDcra3cm0bz9DwlkrEPnledRCQl
         wSWLyp8lbHaM1K+McxVrQmNM4BPzHkb7TO8N7+9tERUl57KxF7PU8a2Xz5wksGDSG4e/
         0CnoGB2Rh3DSW6SUJu67egJoJJz6XMkt0xdNj6cL5tTuvgOTZC9L/oemqsxEo8F23FAx
         zXH1qiBFJ8jTURFpCARx77uJ3CFP6wiVs9MRgykp6O0ls9KqIYyAS41vv0Hhzeycd+SK
         j5h+WY57kR20Vd8vGS2oeCfzGPi06upmCyTxvL5QgnVpoXyWi/7xcHgs+aXuOgspANid
         Pj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092738; x=1792697538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I57KaZmuANvDJJ9jmZcHPHgVefwhwDPZhD5MKXl3Gaw=;
        b=eY9LQFqkAb9LqL/pcA5sTnq5p6Dt76b6RIhzgOhN2Jek+xWMxriizDOD5A8UCwZzWu
         U/QyCnk6CBrcGhpNzW7VJcp581rksr2gIh3i0us15f1uhCqKLft4EqRe4xiOyA5IlOt9
         9/Zp7qx+xdDaa5o8rEDxuTZvg5IUbRj4pDWajPsi7+5If9qeDVCO/6wUhhXvcVObGmAc
         1lja3AI5rdS5jHCpV5rJJmgNIyinVjymNw3K+M8dsNjPoGFVKnKbq1qq1s0SUTWN3jRV
         mazpteO97EFRECWawD2PbhXN7G1KTTDCoSmXTIZeC9H3j0vTi0FrxYaJYBRnBH17cD92
         iKdA==
X-Gm-Message-State: AFq9FYIcv4ZmNnCWz8wiyTMAezGMqtewtWl+6HobfGv+W5+6DzACvubB
	B2mPeo44BQIIuAIeSMNxkMpoB26icypvce+OnHHsNaYUzB+w+L/Yq7t7UZOAIRqL88JB5ucej+X
	VByZr
X-Gm-Gg: AYBFou15oBIN6qHaO/C/NXuuJ76YextmP+L4FEVXxuFIbYo38S2Hfgw6KNZiw8h+fM6
	ugqoLqVPhHEonVgLlNimJZZ/MrWpr5EQJQ3KQdhMohW4YdyN1QHF2vyjENv2Kopt8Jabpy/3gg1
	JgQXf+izezPxK5SlXmiipTGRXdacQv0eVzA2ua43DSfLozmPCNelYbFFBRMHUOJe8MMe7Kz+Auz
	u/IZF28RVSoneh9Ljl1StJ13ag/+pOMLB5QEFHb+SmGh60hFBcxtwUs/L1Bk9+rktiEBMl65k4F
	/42tKUE6N+fTu0t3OfSrzzaCFyYKPwM2BFIEq1PylH+OG7bWV3rp7mBFq2EXk6x/Ck/4KOIun3t
	JDXvpaDTbeU8r/mJA5ibRUVNmaLcC1abrD5ANoOP71706c9eDgUd9fW2fWMzsf1beFmOVWyhm66
	EqyzG9bHZkAbpq0yuL523uHhk8E7RgN1B1WhnAhuX+BacHkZbmygLcWvUE8bLEPt17DBpmhG6vp
	Sdho3rQlrEph+Q=
X-Received: by 2002:ad4:5aad:0:b0:912:127b:c56a with SMTP id 6a1803df08f44-91b553398damr330377536d6.2.1792092737905;
        Thu, 15 Oct 2026 12:32:17 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.255])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb233d2sm3288886d6.32.2026.10.15.12.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:32:17 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:58 +0000
Subject: [PATCH 34/43] io_uring/napi: don't busy poll past an expired
 timeout
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-34-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092659; l=1164;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=oBwomQxI3r6FPouUryl6SXpE4fwLhPSDCK72zMrBMaY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEnH7UUyk4E+T9ucUcuHiO5js3Y33j7P7hRHmS8wowRH+C/wmkuqjubfLR5G/v1hZv8s0wBr93y
 V3G9e9HC8xgU=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

__io_napi_busy_loop() caps the busy poll time to what is left until the
timeout of the wait. The difference is negative if the timeout has passed
already, which is what an application gets if it uses
IORING_ENTER_ABS_TIMER with a time that isn't in the future any more. The
min_t(u64, ...) turns that into a huge value, so the cap has no effect
and the wait, which should return right away, spins for the full busy
poll time first.

Fixes: d5cce407e4f5 ("io_uring/napi: postpone napi timeout adjustment")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/napi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/io_uring/napi.c b/io_uring/napi.c
index 53d7623e4d23..7e698720cd51 100644
--- a/io_uring/napi.c
+++ b/io_uring/napi.c
@@ -378,6 +378,8 @@ void __io_napi_busy_loop(struct io_ring_ctx *ctx, struct io_wait_queue *iowq)
 	if (iowq->timeout != KTIME_MAX) {
 		ktime_t dt = ktime_sub(iowq->timeout, io_get_time(ctx));
 
+		/* an absolute timeout may have passed already */
+		dt = max_t(ktime_t, dt, 0);
 		iowq->napi_busy_poll_dt = min_t(u64, iowq->napi_busy_poll_dt, dt);
 	}
 

-- 
2.55.0

