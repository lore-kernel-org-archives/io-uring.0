Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843E249BD92
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141704; cv=none; b=a3Nu6+qPmoj62sCE5pIrZTBaKf0flyb4qTPevgIk1dcuI0xtNyhewCoCBr654xsMsm38+7SFFKHQpvR+aDynxKDYOs5mGUvBEsXfZLvbWz431MpzoS1raJ7qM2UguCaGKDxWEK1JVAU8Ocr8PmuK6i67vv3bIIaXo5ApHGx64s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141704; c=relaxed/simple;
	bh=a0VVrm1580dGY1+jmtpR1WP/G3gs8V86p9TP+PsuRDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rm6Zrt57H7IMaN4b+u3dkD6RucPnH43czBnGb3WblM2pG9OrNXXIBurcv+UVYWKoy9A4Iefq1qPG/PQPdYv9hTMY0lfD4dqjSVkzCw0xaT5c9uH6Tc6DaNRvwsnDd1jJAYJgy5LQfqZW72hn1o//H0fIfD1wN0QCkphs92SEFZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=u1/eLfq+; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="u1/eLfq+"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-7fc4034841cso924180a34.3
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141701; x=1789746501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ymgjkH7Ory8FSzx3L1+PyxT3bxZTssK53tOk2QZbfG8=;
        b=u1/eLfq+N8T4fFxdPGzPJA64cWoY1LW6+QFBNE//sp0t213xiWlWCB9PhIhl1phX7B
         eekVJ+bAIOJzdmv+LokIhR2LTuG4CE2ijIT6f9QsYi5KiXzRbelJb/8HPfnx5/01D9nV
         CnHkwhw7TzdD5niDC+hHoCfejCOq5nrEQJ6AoCdPaLNIyZYyPT2zMGCboyk3eSzk3ZpS
         HCkBoY5bCNKH/eET4s0h9N+UAGzq+IbAT4jwIpWESd5JKnbUXOr8qVJ5xzkbQXkHoIvj
         ps0fXGMyZwazSdUMrtG+YVYFkStQ/UnDvJPfMy9EmsIJYT95B6h1YM8ZqMH7Eg8TzrS+
         DCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141701; x=1789746501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ymgjkH7Ory8FSzx3L1+PyxT3bxZTssK53tOk2QZbfG8=;
        b=pnXRhAheGLuaswB6/MbhRW4h7ATYUopRh03ZzSKDLOnE8r7/chGiVRPbW8HH3SW1XH
         Q1KCcpS/aQ/nnxQQRWGUqiNvw5lvxvyZCIzTuMEju9ANi/6aZVJ4qBhYBSP9Vrm6J9Pa
         CL5zj7W0UvtocMhOL7BaOb7KakdiY3EYHrC3O/7xxWHiVhcNn7Rb8l3WgzS5LUehZU8m
         CHHeJCcMM4GLGCPtqE+QrLTM22Qe2mRlplVBXmItFknrWdZTqqnAV8Z+CUy1zH3GDqnx
         bnNYLMdAFqR3QGR81sZppxwjFdHlvX4CDtCulykw5EWzTtysd9TqgMNbX1b+rGfqlbtC
         ShcQ==
X-Gm-Message-State: AFuF++nrYv0/ujejAZ2fAj5AjFZV4uVE9VzwdnVVPeuxW39zqZ2yb92t
	SgoJA91YRl4s9or7APL1hE6XlkVX/B6UQ58PqkZ9aDXQjCWPPLBmc45/pu0IbtX0ALelvoV8V23
	eH4sJTUo=
X-Gm-Gg: AYBFou1aLEkKNlD1ne7JvSFXKEeiKA0qxhrhkXvpyMG0c48QBQfNp4hSXM8adiN24VW
	dBoqlPdHMm4rk/0vFhRNfaFO1ljdWQHrDi668rmKuxl9RCJvEl96cQiI5eSuqW0gGjulV393Vc1
	/XSKnboFHRS6hFppP9X4Sj2LuFNJmIFG7yOlsd6WpNURBafKQoItzJTJuEO4+LBgUu5mK/grwdT
	fVX7lrG02+CKxMk7xvBrVfF51GCw7pdOa24ah9FC/Sy/m2iNTp1bBff8AOEe03gYqtNIBCN1biM
	/tWq+IOSR5UJW8EHEwIIIj3acefhy81wGRHzjlQTdowQyj2colmR9WwYSLabxXL73lfPrXl9eT0
	eCw9BTgh4OJ8J2u1Mv82FBJpaReMph36wpIlY4Ng/IvCnh0lUV2sfjoMJB+ktoull8dogC0ajMM
	ct3ND1mkyy1JLEp4Hr/Fkf2Rk8yIk+hmUgcWUM1o4GEuXwAXhBOKHnL/ci4aQB/9JUCU4jxm5+h
	5Gk4F+HAgtSMu86OGaSzL9HKqZn4HzlXSnR17TspoA=
X-Received: by 2002:a05:6830:f98:b0:7f4:e4a4:5d9c with SMTP id 46e09a7af769-803ff440f4emr4091362a34.6.1789141701272;
        Fri, 11 Sep 2026 08:48:21 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f6d1ca4bsm2629478a34.23.2026.09.11.08.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:48:20 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: juanlu@fastmail.com,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 06/10] io_uring/notif: count pending zerocopy notifications per ring
Date: Fri, 11 Sep 2026 09:45:30 -0600
Message-ID: <20260911154811.646705-7-axboe@kernel.dk>
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

