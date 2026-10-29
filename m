Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269902;
	b=FFKCK08HzlerCG9OdMeqhQxq3Z8N+4Dgh0juRGjayFVLvItBcjTfgiSz6XDHrv7S/tPz
	 HjzxDT9cbibbtTYDLnnKCADf0QBVKgv7ltiZCwy542l2woHo1rHFm/5CJ1quvpmRHmY4M
	 5XQ+xlTdihk3MSu/9PIw+9nxlvfyuIZ1A6NoQ6DWIXUPWCQhMEZNKF3mRFMj5FLAlWwyb
	 jz0FRBKi4D8t7uACFUBDQtDyCoaOl6d32owIAbJrioLAx4pzJwCZuFI0+YczD19VCNk2j
	 9iqCm6FKzCBVp5/LeDCjxbjiGeWurtEV+7+2vzFJ7mJvTosTZ6wR9TrQ9krh1biOx+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vuWTuv7wT+CRQwrB4gpB0n/Lvy+IrJTCH55qZNEAo0g=;
	b=UTi3YfgHpSirT6UiHcPGOTS30mFHSoaZVt0Xj1TvqOHewh76UjcGHom9FicuwVCwNo58
	 1ucVVjsuwQpYv3U8ptnVNuoEFFJcL7T1r+m7JTR2tsYDg+inWVCcwvzw7pcPLx/UE/T2L
	 FGFckR/afxigkinzhNX950pZCx+Lo2ZDrAmdv8XKt+Z65H5fAFYZzj7MczFLoQObPzVTf
	 m//h+rlNb0+vC+4ARu4uZhtI9qgE8S2TMNzeM/naJZoC3bk/I2mXZ+GVH7S9uHIQX/L3p
	 iWiWzchMgpvJadNx0nheYaeGbKicH3VMt0kKrRElfJ3wG0yD0/7ig1o8iNlZxGKvrqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OQORBYxy;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5479C606A31A
	for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 10:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5479C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OQORBYxy
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-35dc2af1f2fso704966eec.0
        for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 03:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793269901; x=1793874701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vuWTuv7wT+CRQwrB4gpB0n/Lvy+IrJTCH55qZNEAo0g=;
        b=OQORBYxyuPXr2C6tB5FcSWZ112v3RYT/yYSVdqJedc+xpTOi3YmtBggvwlqSwE/WvH
         vzsZ6Q308sXimiWsIOkVEIkm3NjlCuNXH0SvPxqtHg1vrqhb6XTUorARtGDAbZz26gA1
         MZ4qyCBMH76lmEZMhD8EQq+Ovhn0o2Ppa4K2zjuGbWqUkS4rO/4ugKV/N2G1kQL6t9ad
         HP4ESulQxhJWNek8K2kjh3WgalyO4cXD78dzkztQdSjhzK6mVp1WiejGuIpBPxYNHS+2
         2X9oSiOcOS9k/OvBSf94hHKLTG7Ejm4A5PC2+rLas6g6g28MrEZIWxxINkiV6eBtqGAs
         WPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269901; x=1793874701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vuWTuv7wT+CRQwrB4gpB0n/Lvy+IrJTCH55qZNEAo0g=;
        b=GrVemDH8ACni9IKr90dNxr/XLDJoEUBevfxnFQOQJ+YSgU2S9MzVoVKDAk8ZeTqkAR
         Y3tAX3oPbO0hugkEQCIvpor19B/EocxSW2wJxEOroeqjtP0CfTGbPLsBmn5QVyPDUmxb
         rnR+/pOCPcgfpjXMeAHPUFWj5Lc25N2X5tK2w4JK77UUb6jB3bfydhAJ2kGL4eagGEtT
         Vs1CPolT3XscmMiDUbVhkc5I/4qwvl1Vvkp8mRvBtQiikyVwlHYk0YRagt4Lb3ge07zs
         Q7tf5cFXZ5sA74G26kaixD95K9N8LB0jR8GhDI1mWXzncr5oKyLkNISEqnRRdsk6xnC0
         7+Ww==
X-Forwarded-Encrypted: i=1; AKwUvBxuw4gUvvzg8EFIWHvRFRcCPTz7W4nqZoCe2GfuTk5SQ6vdqsxDymnSZ+VtShqb9cxMvB0ZzpU6ow==@vger.kernel.org
X-Gm-Message-State: AFq9FYIs8PdBecwKKceayPYNf7BIVsi0jKj4YCyJW5l2FxU5gGceR0rl
	mM8ZX/jGB1yrrwOlVzbZa6qaqX4/lrR7S1oCUvY8Ol5bXYPKSs7B1Wo=
X-Gm-Gg: AYBFou3OyIAmyTFOIf3YaKraCf/zwfoU1NBhTRgUbobKqaH/uIIdDUTBv+DMZVuZ37f
	nHgrdwIQbtYCAIcK1L1xBv0CezoZ8G8JxGz93FAYdye3fhRdIl+3bPCaq+9zGBz3N6nzKy3XRLq
	VEkP4cVkVB3mieJZkVqJrH4HsGRnohnt20vM70p/TP2TcUdywKiy52zVnCIcLK/Na6aUm091XL9
	GhA+wyGgHMj4JV47cOHsbsuYDpQQHXnh5qI4o2XFfnMTIrKMpyZEr7Ds8L+H8h9QBm/ExDLTA3c
	uFAcWm8Pq8yoSs5KGHfdXguhhesRafMssju2sIYNM4p7glHCqL4lFXnCFC8fFNr4e0kY54m0OEg
	AxpRtHi0k3ENnli6b+hjhOsCHnoS+h2QoadeC88OpaNM7GFm3Id7Mk8I9/pJJanTTORkMFeXpnI
	mAaf/sjDppTDCD2yAyap/sBWpV1beGOaULwnX50s2uxfEMt6NR0Jf17hRCytybHgsOEaEPzVLHg
	rafkmo+j3GyWDug6OxHlVs0IPySh0rdN7cciJizJMbHtmgvCnXd0Ex/v0B9s7s3y8eQq/E9X599
	gLbnZlqNyMGStkjTiIk4DQWAi7GiNyHBprGPC6Lp
X-Received: by 2002:a05:701b:2818:b0:187:c940:21b9 with SMTP id a92af1059eb24-1a6cd684cd5mr7037612c88.30.1793269901257;
        Thu, 29 Oct 2026 03:31:41 -0700 (PDT)
Received: from archlinux ([2405:201:ac01:5300:9bc6:9c9e:e00f:4eb0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75f143cacsm12888470c88.16.2026.10.29.03.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:31:40 -0700 (PDT)
From: Anvik Loitongbam <permissiontogallop@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	Olivier Langlois <olivier@trillion01.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	stable@vger.kernel.org,
	Anvik Loitongbam <permissiontogallop@gmail.com>
Subject: [PATCH] io_uring/napi: fix list use-after-free on PREEMPT_RT
Date: Thu, 29 Oct 2026 15:52:44 +0530
Message-ID: <20261029102244.141621-1-permissiontogallop@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Commit 45b3941d09d1 ("io_uring/napi: fix io_napi_entry RCU accesses")
converted the NAPI list teardown to list_for_each_entry() and
kfree_rcu(), with a comment claiming that list_for_each_entry_safe()
is not necessary because kfree_rcu() defers the free to the next
quiescent state.

This assumption only holds while the surrounding spinlock section is
non-preemptible. On PREEMPT_RT, spinlock_t is an rtmutex and the task
can be preempted while holding ctx->napi_lock. The raw lock inside
kfree_rcu() only defers the preemption until it is released, and the
release still happens before the iterator advances. Once the task is
switched out, the context switch is an RCU quiescent state, if the
preemption lasts long enough for the batch to be flushed and a grace
period to complete, the callback frees the entry, and the iterator
then reads e->list.next from freed memory. The same pattern exists
in io_napi_free(). I did try to produce a uaf on an rt kernel
build, but it did not work.

All list mutators are serialized by ctx->napi_lock, so the entry after
the current one cannot be freed before its own iteration. Caching it
first with list_for_each_entry_safe() in both loops might be a more
safer and correct approach.

Fixes: 45b3941d09d1 ("io_uring/napi: fix io_napi_entry RCU accesses")
Cc: stable@vger.kernel.org
Signed-off-by: Anvik Loitongbam <permissiontogallop@gmail.com>
---
 io_uring/napi.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/io_uring/napi.c b/io_uring/napi.c
index 7e698720cd51..d299c89cfc3d 100644
--- a/io_uring/napi.c
+++ b/io_uring/napi.c
@@ -110,16 +110,10 @@ static int __io_napi_del_id(struct io_ring_ctx *ctx, unsigned int napi_id)
 
 static void __io_napi_remove_stale(struct io_ring_ctx *ctx)
 {
-	struct io_napi_entry *e;
+	struct io_napi_entry *e, *next;
 
 	guard(spinlock)(&ctx->napi_lock);
-	/*
-	 * list_for_each_entry_safe() is not required as long as:
-	 * 1. list_del_rcu() does not reset the deleted node next pointer
-	 * 2. kfree_rcu() delays the memory freeing until the next quiescent
-	 *    state
-	 */
-	list_for_each_entry(e, &ctx->napi_list, list) {
+	list_for_each_entry_safe(e, next, &ctx->napi_list, list) {
 		if (time_after(jiffies, READ_ONCE(e->timeout))) {
 			list_del_rcu(&e->list);
 			hash_del_rcu(&e->node);
@@ -264,10 +258,10 @@ void io_napi_init(struct io_ring_ctx *ctx)
  */
 void io_napi_free(struct io_ring_ctx *ctx)
 {
-	struct io_napi_entry *e;
+	struct io_napi_entry *e, *next;
 
 	guard(spinlock)(&ctx->napi_lock);
-	list_for_each_entry(e, &ctx->napi_list, list) {
+	list_for_each_entry_safe(e, next, &ctx->napi_list, list) {
 		hash_del_rcu(&e->node);
 		kfree_rcu(e, rcu);
 	}
-- 
2.56.0

