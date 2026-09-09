Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC0957266D
	for <io-uring@vger.kernel.org>; Wed,  9 Sep 2026 14:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963024; cv=none; b=a+sUnCi0xwhi+PsOS1NC4mwFn79D4pzez9LVL/84IQ7qi8jexG3QOIvAjtk5b1o9iZVCyBnZIE37R9Gwa4s5w5slM4krirAjUh1wkzvLEeHwld69WtKTrj8+fvJshy5HEmqCf7D+3d5ANGp/e8RoDEzt2le6tw93ewAEXyy1UuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963024; c=relaxed/simple;
	bh=a0VVrm1580dGY1+jmtpR1WP/G3gs8V86p9TP+PsuRDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EjdwBhnYGw7jfTf9KJ8JBRqb7sU7AN6s7YMUcny5Xw9DzxeLuWBHwmwmCZYjJ+q8DnTof5e96f1a+pEGvkxWB25AW5HUkBaXR+QXeT7YleQMcQviU84VbrIJsUxKi1ZyCRKf9dIfRvoWSiHSOOjFZ1yCZB6JBhQPSeD/v7V0WhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=iCgl5OgX; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="iCgl5OgX"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-47a6c640bf7so1511736fac.0
        for <io-uring@vger.kernel.org>; Wed, 09 Sep 2026 07:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1788963021; x=1789567821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ymgjkH7Ory8FSzx3L1+PyxT3bxZTssK53tOk2QZbfG8=;
        b=iCgl5OgX3eweHoUeBTFY3In9FiWXMUVTScSBfIZXMJdnBvWAP1bXjdLKA3w4ewVsFJ
         pqmYmSMQ6pT0p6PQXsK0D+tBj+sLu1M0bHsOuxpE6nXmdlHnPitLgepcVoXnRZQrtInA
         +Zj1mNuexR2NG6bfRUd+09UzfBjiN1zG399eYfdXGkZ0XmOyTvRgwWibmvMMy+rpqnxa
         r0oTNFAYUWr9s826LMtMhhjqMfI5B2Gc5J7kz+PTbaLoO6LS+6IrQi7jRtfx4D8DRnXA
         PmGb7voj3gtrl940ChYEo76sxMnZHFbfW2/NFQ2G4dM8AcNVw4RjdfPjf3ZVZkb8KhEd
         sJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963021; x=1789567821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ymgjkH7Ory8FSzx3L1+PyxT3bxZTssK53tOk2QZbfG8=;
        b=owYoWaWx8U4s/L0rpPl0SfndaX4GJtZl37hKSpst+puJ5O3hm3n8rAS+iklI9cBvqR
         JizcQuRhTn83u0TY2dMLM74bNsGpYU7Dfu3c1ERW3cYp+etcmrwUigu8YF9oIpLtWNql
         Wrb564SPgHepiRiA8VIFuyAWxcouNhz4+/yFNh/inmirqS2dmlhc2wJ+5/0+Xdbd78RD
         xQrvx8AhKyPx3gQhFmA+D36aQ72Ioc3cTp7Ep2NRmcfsWY5B/iBAUOhfB3/C1DqsTbwR
         KP7T0hKlOJa5ySGcYPyxMWsEQEQQfB1JMWsmkZRA/iD8oHbHXge4fGLRMH7gEElAw0Oj
         Tzww==
X-Gm-Message-State: AFuF++meB7qF99UKVRlWnYznbDdKFw76qwYJwcn4h2HeTXQfEGmftvPo
	hyCqOCvFhq6ztWoosJtbD5eOZPltkkrJcHvJdYpL6Sk8PbI/CRgs7QVlApAZTjRRgWZicPeoAma
	eTZ98wqE=
X-Gm-Gg: AYBFou1seGXHGveiCpNNm63hZyKRTMKZj4ThX5WXy8cK3LNPqSqaezfa3ciEgObsxwt
	f0xbYdckDSexBns9HiocF+wXJeSgeQmael5Q/Og0NHiYTKHlLFt0mnWufSEUHnGg9XubujF6O4z
	tzHr69DOLFYfnKjlxqGzlIY1meiBrXpQoNT6rx+IzUQcMvVwagpJY89EjY9ZodDJbc5ilHR7pR+
	C4exoDgdgbM/2heKfx7bEMbHUiHiRmj+C/qaBmei6eMKjSPoq0yPRKEune5hswekwxsCGUh0KS3
	+o+5IVO51o6gF3eqxPCvIZl1NtyiDPlWsvE8bRyf+ckMkXfm47dmZFyZnQUGZoEdxAxaAwBAXRV
	Xhl2nyJTrHKV1FInbLwsO+MMq8CfKyptR/IxrJ7jQfVLpVDnGKMLajSMoem1t9AMdh4WgzArXew
	ckJMUl0Y7/oRZUpyT0EQpodNLiI55AeYEiSc1pygAFob9aeBMHH+hzngU72Hrgkp0Tt1qQV2WsU
	kUmXJmyVAI3FJimYL2sO3+N5yy50n0A3keSB3oVsmkQ
X-Received: by 2002:a05:6870:d3c8:b0:475:e066:771d with SMTP id 586e51a60fabf-475e06695bbmr20411604fac.36.1788963021199;
        Wed, 09 Sep 2026 07:10:21 -0700 (PDT)
Received: from m2max ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47a7585b25esm5406514fac.11.2026.09.09.07.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:10:19 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: juanlu@fastmail.com,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 2/7] io_uring/notif: count pending zerocopy notifications per ring
Date: Wed,  9 Sep 2026 08:06:12 -0600
Message-ID: <20260909141010.21064-3-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909141010.21064-1-axboe@kernel.dk>
References: <20260909141010.21064-1-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SEND_ZC notifications are io_kiocbs like any other as far as request
and task accounting goes, but they are special in that they cannot be
canceled and only complete once the network stack is done with the
data. With an unresponsive peer, that can take a while.

The exit and release paths are about to start waiting for requests to
finish so that the files they pin get released in a timely manner, and
notifications neither pin files nor finish in a timely manner. Keep a
per-ring count of them so those paths can leave them out.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 include/linux/io_uring_types.h | 2 ++
 io_uring/notif.c               | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
index 39629ee77b91..90fea94ad202 100644
--- a/include/linux/io_uring_types.h
+++ b/include/linux/io_uring_types.h
@@ -522,6 +522,8 @@ struct io_ring_ctx {
 
 	/* protected by ->completion_lock */
 	unsigned			nr_req_allocated;
+	/* pending SEND_ZC notifications, protected by ->uring_lock */
+	unsigned			nr_notifs;
 
 #ifdef CONFIG_NET_RX_BUSY_POLL
 	struct list_head	napi_list;	/* track busy poll napi_id */
diff --git a/io_uring/notif.c b/io_uring/notif.c
index efce8ae12eaa..6c49aff515df 100644
--- a/io_uring/notif.c
+++ b/io_uring/notif.c
@@ -36,6 +36,7 @@ static void io_notif_tw_complete(struct io_tw_req tw_req, io_tw_token_t tw)
 		}
 
 		nd = nd->next;
+		ctx->nr_notifs--;
 		io_req_task_complete((struct io_tw_req){notif}, tw);
 	} while (nd);
 }
@@ -119,6 +120,7 @@ struct io_kiocb *io_alloc_notif(struct io_ring_ctx *ctx)
 
 	if (unlikely(!io_alloc_req(ctx, &notif)))
 		return NULL;
+	ctx->nr_notifs++;
 	notif->ctx = ctx;
 	notif->opcode = IORING_OP_NOP;
 	notif->flags = 0;
-- 
2.55.0

