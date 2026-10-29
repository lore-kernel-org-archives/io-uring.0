Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793285825;
	b=XYNGZCCytU8Z1pSahIC+CLAMucRdCxWkEPw4ex+uus/evzOptRuLR2RTTSMW7K0tDHvM
	 mfHMPvfn4xtiJlDVxpGXC93G0TjxKNEjXmG+8YSvtKiis/DUWQXrQTs2NSgSqplNbVC6Y
	 6fcBSO5O2H6HxxW7XS+WFtZXEfjjMtyu76DpKLai7nk/9oy2EdXJhPVkm5amAYuBNqTEU
	 66VQKlXq2QcsphJY/SwLEwCNl5DUEer0FIHHAmZ226EVe0laW6WXC+szo5B9xG6bEJj/x
	 tL/rkDJ4gUVZIr9aNmiXlg9m5hBo3lGY3pKY5cFvvQWMyCM+tcO4D9I41LlrKskB4UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mA7k5sPJlxoToBjzm3tFJNRMVw01HsxJ0brlZT2Pnt0=;
	b=r8SUtg1b+p5HYfZl2Iusr7+YJkmFwf6JX0DrE7SCio0VlVjhtMtUsvY7vErCvndtWAJB
	 Z7asvslJw6shjmw5X+PBAJMWuVEoDvEJ026oqQnq6naMJ7rdmL9a86+nFX5TCy+Cg8bTP
	 +HZinrO46C7uJ+yrW1gp9ytXE0Ewpo+hsGAI0UpikeaWbCWP9HM03yASFXNHbEVeHUkTl
	 55KSdwwGPWR0YXCxDaXZ5bKmCCanEnK8JDxtDVMIhcPcy3Z4VjEgWDBll14CJYwCnmuNr
	 4ugvlPVzFoEHPkDGBrUFgVCJ7A+vPcrJPNbVUic6nBS5Xgn2Ao8W1ajId/3VUtwl3Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V8fd55D+;
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF69606A320
	for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 14:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EF69606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V8fd55D+
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-14345ae29c5so1121331c88.1
        for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 07:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793285824; x=1793890624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mA7k5sPJlxoToBjzm3tFJNRMVw01HsxJ0brlZT2Pnt0=;
        b=V8fd55D+/HEMHsW7RYUEt2g2wOfdJsv0hxmj3lwlTOtbN3mPIyzX3pSv6fw2FMGq9n
         HAbN/wac6+VnIjLWeX/L1ZA/CZkS2jZtT01vCzTBuLbEcDUZRYf/IqhfsZhTgn8YZFOh
         KRtpBGajuM8KSXGQklRLAVQgtND15xESWX38Wco96OY3SPDNx7e8HeMbdmqdweGBbqut
         has/yFbDHbxt9ZgVHaiokS2oMzXVKzLoNIoZxX3o44BmHbNFawZPXLWxWZLm18ILd1H7
         1EnjrVNF0v8KTpMx8WkkVSuQkHjL5zsNx+RaAM0HiYLyvThulWIpenzMvXTFbgymiISb
         U2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285824; x=1793890624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mA7k5sPJlxoToBjzm3tFJNRMVw01HsxJ0brlZT2Pnt0=;
        b=XWZwqUJq6O7/k16ie6QQGQk0qxU0UoVhlhXFNz5eWdLZNk/EfR2IfI7/rX/sAROQtz
         HXB6RTF3QV5reeqgcR/sU+O80Vx7Z+2nGejcVVgqAEvqLGTJljzjKWNol1XYvUCy0zy6
         fS7hSL0jzNvHAPnZIlXC8R/FjiSPMdcRpvu//N3eYB+uHlEkKhgvhmVO/28dwh/zh4P7
         mTiGNa+SgfEJBT6uX4IW77Hg0ZZpR9wAUi5Lp11rVqX93b7qDYbJQ3Tzi1TvpdctU6Dz
         giG2ZCd/7jOUuZrU1H4OyDnMDaYbBWRt9z1pQVbXkqd+NdilB82tPzbNcD0UDD8aAEI9
         h9hw==
X-Forwarded-Encrypted: i=1; AKwUvBziUV/98tqp1ufwr1eaxRJUCqbCxPadIptIu3+WoCrKXLVR/NHc7fHJq/KtFbCoYoCQ8SVKf1aRaw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKtYkQ8Frh2iqSFRvWlgb8g79PlIdqSHJwFxGcxT9lOPWbGD71T
	R/WJdh34j4qS5aCqrqdLstX9Tq1JFp3m9QHaIiQm27AlOuRIwdaZ65MGxip8e6EqJA==
X-Gm-Gg: AYBFou1EokTfOq38MRd4xQwAshElkqg+PruL8T/d3VVaojLZYMzE6SOsis//n2zYEKq
	d1FvxOw431BPrDoPr8nMLGaytQMDlTKFO4wxZSNpV/531W8jFJSVPj2DFj6IRj6RW9eyPWg8GvH
	x6bZbMwrof78R4JR3SHs5C7h1pr/M/Ty24Zo3U91a2i42QegS9oIvfxkg4zWdIJ933ED44nqGXD
	Qz4tzlzOaaRJhO02Q5t02NSqkusEVKAp6nRfLXXwbO/DiG54R4HC6cWjLkOyG3ZXCsYcUujSDwO
	LxMi5B6cOfLsvs12mDwtNspybEuUCID9N1T6+v5baR23pkt7w0zB10vjFfuKgNIg2t6Psjn0QMO
	TRxEQvJzlwFP9ycAd5EnKN20+ZjH4AOQuDWHOmylrVECUn1wOgRVZ3q5Ycnv0iXwG9slEE6ucPp
	1iPne4vdfoxVqxJDjz2N6z7wWwyJLzZJtqXs9yT4DC+wHW2p6S5hF4p47DvZBs7NCyuOuYm7YCt
	rm76mu4HY2aykwFcrvdFQaV3GfGbdRkel177tV2XoBKEMvPjfLb1IVkBFR6YEK/APIDX7dDbK5Z
	nV0dqYfDBESQ3h+qpa2IWsGlrk+FIsk6yQ==
X-Received: by 2002:a05:701b:2097:10b0:145:4ef:e8de with SMTP id a92af1059eb24-1a6c7e2166bmr7927223c88.6.1793285823529;
        Thu, 29 Oct 2026 07:57:03 -0700 (PDT)
Received: from archlinux ([2405:201:ac01:5300:8:4c2:8722:36e0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a7549528ebsm14275350c88.0.2026.10.29.07.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:57:03 -0700 (PDT)
From: Anvik Loitongbam <permissiontogallop@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	Olivier Langlois <olivier@trillion01.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anvik Loitongbam <permissiontogallop@gmail.com>
Subject: [PATCH v2] io_uring/napi: clean up list traversal with list_for_each_entry_safe()
Date: Thu, 29 Oct 2026 20:17:45 +0530
Message-ID: <20261029144745.23792-1-permissiontogallop@gmail.com>
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

Switch both loops to the standard list_for_each_entry_safe() pattern and
remove the explanatory comment.

Signed-off-by: Anvik Loitongbam <permissiontogallop@gmail.com>
---
v2:
  - Resend as a cleanup rather than a PREEMPT_RT UAF fix.

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
