Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632291;
	b=p+mxwF+p+Pyiv13rWxomOv2PtPDtX1hp365MriVLAgTzKBhcc7WgB4D7wVnITPVktcsX
	 Oa3FA59h7HsApHTgVrfkqXoQT2fWyepUNhzSMT8c0gvIIjzkTD522pyGAKb7RCxb+Bfta
	 Da2v2ddfUsM9if6IX4VElE3mW9nxSZn9kUYk6wCXIDLKnkhnuIPjU9A1dZhtRTE0cZ37+
	 AIlJeQ+u1DqIZKVj0zDSGm5mw4xH6/o5UAmDp9tzC/evs4lsbiIEZ+2yDMlip1y1+F7hq
	 HhjJYnkhYMewXjCvfVyEq7JwtxCDfVpq4rSkVgF0m3O4Z059ZJKQ57B7ik3BRLjAX6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GX9y930NHvUDN1ePSMyDcGp/kD/aMqco3V/PK3u2L/E=;
	b=A2TEoPuJXsnwL6AaENg8IgVgqK5j49cbgOSFr2kPwHzlVS48/7zzXON3fq6/tJDesBVi
	 vrntEvTZoK8Wdr1VAZk79twPkKuLiUVmwpPTQnPz0MaKsahgroKNV6pEQOmi28cXvdWX/
	 zwJMbMbeHWeGKoiR4rE4jPRDpGWh5yRbkkW0u/KZ81lZqTg9/wNeNdZsCBFThzbyKfjBK
	 WE/4FfkW5lNo8N9XefSULk7prXmH8LVHFr5R0vU9FBKyvwzjxRGBYkK7U3xU9uXJlUHVY
	 gIoL20rDvcC2ZnDSCQTOLlpBc30tkFDDCfUG02dkBDrm86/2hL1GIG1JsJGab5WRqgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=C5kIi4sW;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF66606A329
	for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 18:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CF66606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=C5kIi4sW
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-71ad5f20016so3998697eaf.1
        for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 10:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795632290; x=1796237090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GX9y930NHvUDN1ePSMyDcGp/kD/aMqco3V/PK3u2L/E=;
        b=C5kIi4sW97NGxMFOiVun4qouXOFhSQfHKOYrrJabdNEyNf2kL7KTPnpuzzLEKcd+qT
         in4ZjLTE6hWvNLLk+LEq7+A7ubQ/0223XXl0zL0JAlB8toeoqP6XeaCBd1JHrCS4MIE1
         +r7BW7HJH78jRx5lcVER6tsxaWTs1PI/apgXgDf0Kx9/viZ2UCZGxTQl5onKd+0iCnTx
         nHOS6zva0ST/KfBFsDIw3/psYG4BryQqGGN2SrrNOWuDNgfWX2/CaLVWtALlKgkWVZuM
         M0RrKJFYG/JOj8rfRGbOop8WFUVmxVYADxNSkNWPQdXCfJ0QVC01wFjxqllF7Xw7QpHw
         aDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632290; x=1796237090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GX9y930NHvUDN1ePSMyDcGp/kD/aMqco3V/PK3u2L/E=;
        b=aiFdIgyxsRfTDVUCgn458egyKsawzzfX/9Jr0qLeqmpcImvAZOkb7Prli5U83ovIqf
         VdBQbua0HSjH7w80J8KKgKfNri76VQxl8LBMDG01snH+NS/evlIsjjtULGZr04BQgJoY
         Va92NqzBUM/No/WIB5DA9PweP0zQ1sxYDQQFbrPY5liq7GqJ3ixvTLFkjrgWvEbEgyhi
         wIe5BmewfnzOp/T4eKJo3trWU9QclizKwUtcwtFVNSCgxJqVM8bbz0qLiKMw2ZOWiQXl
         hQF1483XiQvS2WM/5j3c3WUJegMOURew2jwuiqDN4AzzmWke0HsqBTRzEPk+sRZqgtRw
         cgxA==
X-Gm-Message-State: APuU4Z/fQblvi1ocCz/LT8AgyLYxQbAx7HB8SK96dUO1M/nWGHNjfX6f
	CA9JHwqPSTy/pwuWGzQcymiGe3ZwjSXSQoyXrUiMRUT55Au4+4RuIa2CbmjJUZKip9v7QN3FFIb
	c7OYBkfg=
X-Gm-Gg: AZFdTZe6JGX0cHrpmcTvuIDEbu1v1q3dDiPiP7DcOG2optuKT/FVynxzq1lrp/BAwg8
	5H3Tncy7NA86AYk6Ple8fIZnIeqgZS3bRFk2tHe77Oe4RmkZHVEoW+8Z1xcCGHUroB/AAlhhcXC
	Ys2rNMLIfntsN6Zq87rQvc+zq1QtmRTkxBFlf/yueJNVDetOxi1d940MaQF8EHu3NnbA5er/gZF
	38NfF7FgMsXU86XpoCrMlyfkBrG5SvWHi11XHR1DTgyUkgd5OB+CcudyXZdOj5oL2ySstSxR7Cd
	6Oo6V033pYxZQeuCP/ezHlbyetVwyboHjFTb59jAd5OnDhNtyuuMxv8szgdyNYpZ4PFYDUno4gg
	vgOFWWeAllqxZQpxn7zySUIEVEGmgSsA1ffgkeu5XfWwGxVgT3ca6DzP5kmihREv7m9G/EC8LZ0
	eAIfZnyh+yK6X/cp1dSjBLgHAlUuD2RSJrXsGaHktR3kSW//xDy/zW/Mi+c5CY1YWI2OW4sOM75
	I7ONUV/ghKeqwSZR4ZX4QvyHszTiFPCYLDa7zaVBdqsV+0TafzmLOszP5id2T8cfLQhiGTiSRKm
	cRejONHl92JR9LgHV758T3g+ECmQPfRojSjPo5V8jK8/S2W3xHbeuzdiJTTC3HESjnSmBN9mCrS
	/KogyrY4rch7zS9DgJn5kmH3VybHcUcodkg==
X-Received: by 2002:a05:6820:4403:b0:71a:f64a:2fe2 with SMTP id 006d021491bc7-71b394df59cmr13155171eaf.48.1795632290356;
        Wed, 25 Nov 2026 10:44:50 -0800 (PST)
Received: from m5pro ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b37c52ae6sm12332828eaf.0.2026.11.25.10.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:44:49 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: Chris Mason <mason@kernel.org>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 06/10] io_uring/timeout: hold timeout_lock for the link splice
Date: Wed, 25 Nov 2026 11:43:15 -0700
Message-ID: <20261125184439.58077-7-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261125184439.58077-1-axboe@kernel.dk>
References: <20261125184439.58077-1-axboe@kernel.dk>
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

The exit of a single thread that races with the close of its
IORING_SETUP_DEFER_TASKRUN ring can cause a use-after-free of a linked
timeout that has fired.

io-wq calls its match function under raw spinlocks, so there
io_match_task_safe() walks the link chain without ->uring_lock. It holds
->timeout_lock, which is enough only if a linked timeout leaves the
chain under that lock. But io_req_task_link_timeout() does the splice
under ->uring_lock alone. Once the ring is closed, the closing task runs
that task_work, and with a drain active the flush frees the request:

    io_match_task_safe()          io_cancel_local_task_work()
    ====================          ===========================
    lock ->timeout_lock
    io_match_linked()
      req = head->link
                                  lock ->uring_lock
                                  io_req_task_link_timeout()
                                    prev->link = req->link
                                    io_req_task_complete()
                                  io_submit_flush_completions()
                                    io_free_batch_list()
                                    io_queue_deferred()
                                      __io_req_caches_free()
      req = req->link

The fix used here is to hold ->timeout_lock as well for the splice,
which stays in task_work and under ->uring_lock.

Fixes: 49ae66eb8c27 ("io_uring: defer linked-timeout chain splice out of hrtimer context")
Signed-off-by: Chris Mason <mason@kernel.org>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/timeout.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/io_uring/timeout.c b/io_uring/timeout.c
index db78059cfeab..46c01704b58f 100644
--- a/io_uring/timeout.c
+++ b/io_uring/timeout.c
@@ -392,11 +392,14 @@ static void io_req_task_link_timeout(struct io_tw_req tw_req, io_tw_token_t tw)
 	if (prev) {
 		/*
 		 * splice the linked timeout out of prev's chain if the regular
-		 * completion path didn't already do it.
+		 * completion path didn't already do it. io-wq cancellation
+		 * walks the chain with only ->timeout_lock held.
 		 */
+		raw_spin_lock_irq(&req->ctx->timeout_lock);
 		if (prev->link == req)
 			prev->link = req->link;
 		req->link = NULL;
+		raw_spin_unlock_irq(&req->ctx->timeout_lock);
 
 		if (!tw.cancel) {
 			struct io_cancel_data cd = {
-- 
2.55.0

