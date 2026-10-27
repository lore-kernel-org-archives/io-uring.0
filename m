Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124582;
	b=ISNjVEl8Wn1sllSA7xaUYb8Z3bX62YDfdmuSmtQ1JdmDlvgq1QtaD6+PYiP+9KoJjHbU
	 U99xBLE+JHVbJNSXanF0IKHnkgI+8ChnEKT+9uLnEHYbVTLTM53vQo+SCizZXzALxLvYQ
	 anZ2bNcLLd/ydcLl63oTNJcp1aQZztS5eIz+LHCUJ/oPQaUbgeGL9CXZQc4H8RtHAXX9Y
	 0Edzb5ODopGAj7WOH/uohlXq1abOAQhWfrAz1jNEtukkLGe9cvVQ+gA3ovhLz3037UPlX
	 /QGeBwjnzUvmrStEGIMOYpTwzNg8hxcoRDQQ3B8oqXguiu7RZCxnrTOOCAAMgC1JU/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Content-Language:To:From:Subject:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=0L6hqmsrPD8uEY7+/+xUAqa2FGZG6fsy+esHVyS+KFY=;
	b=tXMw4/Qr+d+fqU6rRI2MagDa2+hjREpAEQwTCKiCCWdOfTN6a658bf5E83BoadVmXJlN
	 XjXLao/OSyp9a4+jo190EfH02Pn/XZmGb8A4KEg9hmk109mH7QXdwq2CFWyZZ8k20lJc9
	 WjmZ/W68126Ys9TyOG+WhtCzeTfsmzp2hYkIfHV16JHNVf0OIQUxwRaiwGdoArL8BjJlc
	 9O2b1ZOE1HCJcHJ6UQj4kvygcafJhUnm1QP167Qr15VfaDnOuaerGVOXaj+FtrLFgppuM
	 XxXeAhX528TdGLOoLxljpFcENw9xJHovaAwdtqyjGrqNHkvKVAJUY3PtQvC2NJdoSUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rVIZYJAB;
	arc=none smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B5D606A31F
	for <io-uring@vger.kernel.org>; Tue, 27 Oct 2026 18:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08B5D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rVIZYJAB
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-49429181ce9so133043fac.0
        for <io-uring@vger.kernel.org>; Tue, 27 Oct 2026 11:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793124580; x=1793729380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0L6hqmsrPD8uEY7+/+xUAqa2FGZG6fsy+esHVyS+KFY=;
        b=rVIZYJAB9+r8PdfuTtWGk+62ARgrT81JcOGnk9YMDXIcrZ26XRd2gAAYMMY0ARC0WL
         twsm4DKPfmrv0Fo7Kpz4Brp7g9LM/wS/pjy6B1jYybvSAhaPsGeEDk3BYcmMiV3ZPY9d
         jGHycGx4iuaefyBiKlGiL9am0Pji+FJRc/XWL5qLmgLINkwHGZ1BrJfB4WBJjye2r2Ne
         PvrirMRsuSnQ+Gqd7JZ/l9vnR4VyJqhb9uT7Gx3lh3+VqC9Pef8b5Jad2eJGYvim415J
         8UhXh83P4SDyKXVxGN9ha9PXcRmIqByLqq+iZfjVlJNtXVAuSiuDjWUU5MIy+pfx2OWx
         LJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793124580; x=1793729380;
        h=content-transfer-encoding:content-type:cc:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0L6hqmsrPD8uEY7+/+xUAqa2FGZG6fsy+esHVyS+KFY=;
        b=2lFNalkUmsHdMZ1hCbmK5EP/ZmpuGQlecU8jxfmkYt0pMQhVV8YvGR9YeHGLDcyfH1
         B7ON35mdCd1pzNc+mcRhPFADG1UqaXkgBlwoxzFUQ04F7hm71nrL+/56FBuZ917J8VyG
         hr5yU/ZCNM9k112jEWAx6Tl5RIRP17DKJRUAVKmt/RG7bsGjoEtKprDTDGqW5SgNKnxj
         J8vR21Qn0I6SQfFqLGomfNKtQcXcsgU0JxWaNeC9EM0OhZ5ommM1bB9O/hXfmG8Lf/bB
         C0691MLhRK8epbOFSCnuESMM9r4DRM+5SBQ97He7nxoPa5zPLRDLk6rq6St9g6+a8SPF
         vPgA==
X-Gm-Message-State: AFq9FYLz90zxcXHFlkx0Zw3z+wf9ICngiIMFl78rNBj96k/e9aOVO9F8
	4gX1q1FsqFVZ2Go7Eci7P7mi69jT/2rB8yM43tWX7aNUeXYRBLFIo1jpQtklkwYlj6sUumMkoLS
	56EiOKHk=
X-Gm-Gg: AYBFou2/7JXYUtvVy6WSpC1pIUoN5fuwXheYEnwKTfmDUOrqGyPiwtwp4JIJMdcJ9nH
	Xd/uvAHzZsuLs69UnZK2j8Q4isuWh4CXrTJUSulD6xvFQjKP6NmJZ4fF17PWkQRje0s49+3L7pv
	chTtWcYKPZ0XD25EBtZAaCwnst8ypjdd5Mabk6i14b5Fm27vi9IKSYJj6k8najsUZyKhUtTJQIs
	Yr40dTIOc3Cf8AgrFQWp91Rlzb51cbUdgyQCslmqdH01WXuIi9U8pTWaUBMP2MPY/laQYUM9y8p
	fqT5bGrkUspmPcNXSJ2H40RgkBdFizIo64y7ZvK6HR1nZGfSll9j3FzSU6S4nwfc7qdyPVQzFlg
	upcPPlc1J2xTnm5QBuv5wyHgWogsnj3H/LCTXkj/tKm5Kdn0pBxCCfMvWqWeAeGb62gH02ckYbJ
	XiV2ByHc203mRrUVq5ws1JbcTRV+OX4HOnp//HwCOQz/4J6XevbOCnMTZYQ2lzx9bE9IkevnoAs
	3yUe8vqt2NlGdOkFItL0bulIajHjuqUYXKNUvRg9GEOvSMarzG3KvjWFOPjv0TeGzYH8g2nikNW
	bKgIEuHyoYRAW1IBHHvOWcDHbaBu+5wV3BvkcCyt5UxbVe55/VPQ2qBuluLCCcriznyhI4/SUpP
	UQFP8k9bQl7A=
X-Received: by 2002:a05:6870:b28a:b0:4a7:4d5f:c0a0 with SMTP id 586e51a60fabf-4a8bb546303mr267462fac.38.1793124579857;
        Tue, 27 Oct 2026 11:09:39 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b77ac4e4sm614022fac.3.2026.10.27.11.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 11:09:38 -0700 (PDT)
Message-ID: <4e08d7b9-95be-4b04-8d52-ec9a6e6b293e@kernel.dk>
Date: Tue, 27 Oct 2026 12:09:37 -0600
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: io-uring <io-uring@vger.kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] io_uring: keep the drain active when a deferred drain request
 is started
Cc: Karl Mehltretter <kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

ecb6817b769f ends the drain when the dispatched drain request has posted
its CQE and nothing else is deferred. But the deferred list is processed
in between, and if the request it starts is itself a drain request, the
drain is over before that one has even run. A request submitted after
that point then runs ahead of it:

  1. P0 in flight, D1 and D2 (both IOSQE_IO_DRAIN) deferred behind it
  2. P0 completes, D1 is started
  3. D1 completes, drain_done is set, D2 is started, the list is empty
  4. IO_RING_F_DRAIN_ACTIVE is cleared with D2 still in flight

Anything submitted now bypasses the drain. The same happens with D2 as
the head of a link, as those aren't tracked in ->drain_req at all.

Have io_queue_deferred() report whether it started a drain request, and
don't end the drain if it did. Starting non-drain requests and ending it
is still fine, they were only waiting on the drain request that just
completed.

Fixes: ecb6817b769f ("io_uring: end the drain when the drain request completes")
Reported-by: Karl Mehltretter <kmehltretter@gmail.com>
Link: https://lore.kernel.org/io-uring/20261027043323.98916-1-kmehltretter@gmail.com/
Cc: stable@vger.kernel.org
Signed-off-by: Jens Axboe <axboe@kernel.dk>

---

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 8ffe0c9a4e29..e9c65cf0cc51 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -474,9 +474,9 @@ unsigned io_linked_nr(struct io_kiocb *req)
 	return nr;
 }
 
-static __cold noinline void io_queue_deferred(struct io_ring_ctx *ctx)
+static __cold noinline bool io_queue_deferred(struct io_ring_ctx *ctx)
 {
-	bool drain_seen = false, first = true;
+	bool drain_seen = false, first = true, drain_queued = false;
 
 	lockdep_assert_held(&ctx->uring_lock);
 	__io_req_caches_free(ctx);
@@ -490,17 +490,21 @@ static __cold noinline void io_queue_deferred(struct io_ring_ctx *ctx)
 
 		drain_seen |= de->req->flags & REQ_F_IO_DRAIN;
 		if ((drain_seen || first) && ctx->nr_req_allocated != ctx->nr_drained)
-			return;
+			return drain_queued;
 
 		list_del_init(&de->list);
 		ctx->nr_drained -= io_linked_nr(de->req);
-		/* it runs alone, track its completion unless it's a link */
-		if ((de->req->flags & REQ_F_IO_DRAIN) && !de->req->link)
-			ctx->drain_req = de->req;
+		if (de->req->flags & REQ_F_IO_DRAIN) {
+			drain_queued = true;
+			/* it runs alone, track its completion unless it's a link */
+			if (!de->req->link)
+				ctx->drain_req = de->req;
+		}
 		io_req_task_queue(de->req);
 		kfree(de);
 		first = false;
 	}
+	return drain_queued;
 }
 
 void __io_commit_cqring_flush(struct io_ring_ctx *ctx)
@@ -1263,7 +1267,9 @@ void __io_submit_flush_completions(struct io_ring_ctx *ctx)
 	}
 
 	if (unlikely(ctx->int_flags & IO_RING_F_DRAIN_ACTIVE)) {
-		io_queue_deferred(ctx);
+		/* a drain request started from the list keeps the drain going */
+		if (io_queue_deferred(ctx))
+			drain_done = false;
 		if (drain_done && list_empty(&ctx->defer_list))
 			ctx->int_flags &= ~IO_RING_F_DRAIN_ACTIVE;
 	}

-- 
Jens Axboe

