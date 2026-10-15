Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF29A502D50
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 20:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792096144; cv=none; b=LQAOpltvfsmJY7bdD5+uMr1gHppU6/+2IiilXsUpqfwK6RZEWtYqBQGTUcMjJM1F33ul9IJftdkvUh+6u+dA06AaTdyEgb1ZPwGHe30wgOp9Ed0+xMJO1SQcunZbtOlX0y19JJiNU7Lig3Uk5YMNF94bB7lIXlHolYEkZsPGPXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792096144; c=relaxed/simple;
	bh=KDB/Yb3W6ngSXYPAsBExqxlp0nf1qFjv2yaefrZZOZY=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=tbGqhzKXD6TbxnswSZnCpnQGIsfPWQ0F3YhJoZTlY+WbDbQ9IyJN+VJ9qsiK/DnmelrzYa2zM0Pv6DtxwESgHpaTyk9z2uZOhTW3HR6ydjUCXLJRPhm8LGAXruDvtoExdJjOkI8zQ89JbKVwSV1kWd/Zs6VqE/vz+wvez/lVMjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=psUNTuzI; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="psUNTuzI"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-504ae5941faso1159930b6e.3
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 13:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792096142; x=1792700942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9+iGTNdlsL2Gzoa2lCWPPsfh+IFvJrl2BTZ78ZAlNRY=;
        b=psUNTuzIrCS9aq6H2IUHraUI/niJwSv3QcdP019XY2t8jIeTINfNlhmuAsUdaqTWcQ
         X/9mTf6MgAKOI0ZBj+BpMW5WeN61sasovSk4teLzHv5hbhFqgWlWwVWsy1HTSyixGLm2
         WFPzkSVsuhIkVpVdQ0EzK2BE5+X8bg5Bm7nwcOG0u0n9Sp42QFZBHi26WFjw6MqtExfJ
         23+foai4Odzo0QM6HJW2PlCgykIMThklOrXQh1IEfCLVHKC3ikfbkEXNgAEDwyQotujK
         6c94UhKsAYOlsdI6Kin1HeZJ5Bw9UwRNltMtfCbJBu6h0kDyQeJ82nE/9GX0k+gnmiPj
         oMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792096142; x=1792700942;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9+iGTNdlsL2Gzoa2lCWPPsfh+IFvJrl2BTZ78ZAlNRY=;
        b=CNCoitwiM5uc31O+TqwSrKl5x4qi0sjfMTmklDQZosrxTl/WGyvprMffWByhlBUOek
         R14WZ4YaNrqwzrqMtOwPMGPZMKglKoEf7UE2uElPgxHDxDYO9MEqgER6HpHe8zSdSwov
         nJ2sRPaGguFkv0ZNoVnvo6cbDZ2ozk0Zn+5vNDkqjiOmPQa6WjkIabRknAAKdvWO6rqc
         GUq9qPeJ1bP0DI87JRjERC1xZGq0gQakZ83/N5oA+quIZe+rdNgPaFF4+AbXa0IOIAbU
         jXQnU+k+M0xbB4rxkh1LjZdWyzVSIkVt7kgjcDCai34P1MglebDmG7eLODInFIBiAa2S
         OH7Q==
X-Gm-Message-State: AFq9FYJ8GDFKM0xsRJlhD3Jl7axuR+BTTbHILHSi0Befwct3KVQ5hEdj
	rhcnFlY078/4OA08ntW94lk0HVwUPDXqrCA+2PA/k5C7GUhInlGulIFex/S0QkDrXOET9bUr8zK
	wT99cDJY=
X-Gm-Gg: AYBFou01bWUH0wZXjjRY/gzAcodc/JhD3D5Su1iTm1X6H19ntXVoHCIwhYa/TdrcxFg
	Xpts6fPS/J9+UqrDQ8iDFXifDKv6qcEhbSX9qmTpJsw07ohLOuf2PXLh/8T+n1OVloOtR0lFKHb
	FEAZv4tJ/zr/f7Mim0B2O0+L6FAjuEIrPxC4ZiWn/mJRdOErN1vKiQ4trQLgAHH7gIPKw+UuEzd
	AEQSpk9BG7JmQJZi7uUvy1241+zHpYwvJAwWWsNV0EDydefyAKjedCYiplBOQ3G+nj/4G8U26er
	hGw/XoE8WkiQPcbh9jfWfzqDAMBRSY8A//WWJv1FiqaXnj4sIiIy7uD4uUvTjrl3hAbQEEGNz9n
	eCkhYcK6AN7K95bsyMjhVpEmb4MZvO4AtnNAPpgQgnHsmAQWX2tdeBfPAfAyf9Srwyn+mAxEnX2
	WOaJjHB3iOrYPXqqWOscp/W9dhJ+L/e4GtEJczGssJeQJY5s4EOirCQwfBcJGi9OZq1FqozSCEA
	x0s9oO4mO0FjGTj+vME9mJ9uzIakeC3adUVE7tE2tfKGH+Ou5k+9JK4Ww==
X-Received: by 2002:a05:6808:1983:b0:4f9:595:b80c with SMTP id 5614622812f47-50c56bf8a1bmr21323638b6e.41.1792096141688;
        Thu, 15 Oct 2026 13:29:01 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a73b7741desm14498fac.17.2026.10.15.13.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 13:28:58 -0700 (PDT)
Message-ID: <45b1937b-5468-48fb-9b75-a606d4ef46c4@kernel.dk>
Date: Thu, 15 Oct 2026 14:28:57 -0600
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
Subject: [PATCH] io_uring/timeout: don't flush with the sequence behind the
 last flush
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

io_flush_timeouts() measures the events since the last flush as the
distance of the current sequence from ->cq_last_tm_flush. A fired
timeout bumps ->cq_timeouts before its CQE is posted, so until it is
the sequence can be behind the last flush, and the distance wraps:

  last flush: seq 100, cq_last_tm_flush = 100
  Y: IORING_OP_TIMEOUT, off 50, target_seq 150
  pure timeout A fires, cq_timeouts = 1
  task_work posts A's CQE, cached_cq_tail = 101
  pure timeout B fires before the flush, cq_timeouts = 2
  io_flush_timeouts(): seq = 99, events_got = 0xffffffff

Y, and every sequence timeout behind it, is ended with -ETIME although
no event happened. Two timeouts expiring close together is all it takes,
a completion with IOSQE_CQE_SKIP_SUCCESS after a single one does it too.

Nothing but those in flight CQEs separates the two, so count from the
last flush when the sequence is behind it, as io_timeout() does.

Fixes: f010505b78a4 ("io_uring: flush timeouts that should already have expired")
Signed-off-by: Jens Axboe <axboe@kernel.dk>

---

diff --git a/io_uring/timeout.c b/io_uring/timeout.c
index e52ba4ad53cb..c92d1363df81 100644
--- a/io_uring/timeout.c
+++ b/io_uring/timeout.c
@@ -171,6 +171,14 @@ __cold void io_flush_timeouts(struct io_ring_ctx *ctx)
 	raw_spin_lock_irq(&ctx->timeout_lock);
 	seq = READ_ONCE(ctx->cached_cq_tail) - atomic_read(&ctx->cq_timeouts);
 
+	/*
+	 * A fired timeout bumps ->cq_timeouts before its CQE is posted, which
+	 * leaves the sequence behind the last flush until it is. No event has
+	 * happened then, see io_timeout().
+	 */
+	if ((s32)(seq - ctx->cq_last_tm_flush) < 0)
+		seq = ctx->cq_last_tm_flush;
+
 	list_for_each_entry_safe(timeout, tmp, &ctx->timeout_list, list) {
 		struct io_kiocb *req = cmd_to_io_kiocb(timeout);
 		u32 events_needed, events_got;

-- 
Jens Axboe

