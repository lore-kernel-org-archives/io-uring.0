Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632288;
	b=enuOb+DffNX4Qq66KpmAKBHxP+Yf/qLeSM6YJOqCrG/5kyrlN7SP3w7vIKRxizn/uvl6
	 IzdOKr0rC5q/hrnDYun+LPGaYZ/KKgIn4xJd2Buc4FZ1GUJNp0Q0hKfjlKyWfSFJowBUq
	 +c9s8rmUxvRXx4/PYkfA6MiEIdRXdvGgoX8E/zgA1UYYSKWzjejvRK523HS173W/S/n9x
	 hakS1TBxqLZg1gd6bAHjjgj69lrDcp1nwUP9ytqaYO5BdIvXnBRKlFRdG/s+PchvrQxz5
	 oq9GORe9LzsNgT277AVvcGeEIfgrItMFQi0hloHDlc7sTQviL1tbbhcHUt8DjsiH3DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XInVH8hN7AhXnpY2TtVBkF8S3yX0rGTuUkWZ1FjtQxI=;
	b=fcGwa/MQycvvmeNLbM5qrECtqni0k1z2jAATj8AezYoU7Tl/7xY718miZr00KssjmywT
	 eR9W+iPGNDVdGqisRtMwSIDOCjuVL+9/pYzZCA9v3MZDHNz5FHObs5t8IWPau6mojPMOP
	 xLi7iHEJ9hjexup/zseSeRo7Cs8XTIcFzbmkN2FfNr0b0NB/XI7QNj+X4Z6LSqGwSn0RD
	 hQTOXxVFyBIjcVY06Ds3b6gKscOQWSOzAChDuw/IhpKIiJkYq4uOX96SZ4h+BIQ/+b0lx
	 t3cPxkg5HyJCXbglL9IddPQBnxwXxQev1DztFqoBhJ7cNZgC1EnLEmY0AkegcHlyuxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=E58DRHUQ;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB61E606A31E
	for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 18:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB61E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=E58DRHUQ
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6b19e291cc6so5311169eaf.2
        for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 10:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795632287; x=1796237087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XInVH8hN7AhXnpY2TtVBkF8S3yX0rGTuUkWZ1FjtQxI=;
        b=E58DRHUQzeQQk7SE8HMsFu5dUc5rN2c1wtEh5EZYt8BW6upFd8D6nGoPMUWFPYn2oG
         YTMsqiKos20rJOYUjYPAV2o4pylIFfohrDhYAkGW8idDzJxTnj4KUQsFxoUdjpx3sfhQ
         SfcSP3lbJKXlwXIIkE0AMb8+vpLpXyW18axqcw3Eta63wQzGW0JtWvQPbxEbEN9emhMz
         Jktv+Jec/R6ySKqdu56ktR8xco4R2a/u995MfK7VTZ1m+VBxA/iNvRmTBmMQiBvkfIeG
         GTvUji5ALABteAvUJFGUUGsLcmCpkFyDnnvL2ZsJcOthlWoLTJTPz2jIDWI7pIdqH6qR
         X7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632287; x=1796237087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XInVH8hN7AhXnpY2TtVBkF8S3yX0rGTuUkWZ1FjtQxI=;
        b=h1zs3wGZUZnMvxDWtOvyU7wcYcOpjHDjiCSbF0jsSyqZqC1ycfxt6HDkoYmtY6nwj4
         6/uxsPxQW1OTwUxqkPEXBEkwzqiBQqtqHxwVvWbGG6Z6SJ9gQ+MKRYgzrsH3geNWMMvT
         GNkvIp8ABIGBxAefjyCJ16tzyYAmyJa74KGOyHlfgt63DKobW8skSX6HAVvUAHLRmKKU
         uCm4gxFcIPEBP6QP10gHCYSoK3y9z22Kj4BCIDFwQvjzMNKa222pI8A9FcJAl/aVflyI
         fiEX0Pahwzc86931NivKcYHZsCMTDOCioTOl/KEATsHe0YkNItTEAhn6NXfceIr9LjXG
         avqw==
X-Gm-Message-State: APuU4Z8UkSKYRnE0cWobpysS8xRkCAjIB0krO6QFBrHJBPGfwEAl9RTX
	kxqP/HE/CZtU99why/xB3GRknCnYD4pws2tkcxw40WsyelBDtIdNtNoShXSdLVLWsqAcGbBHHGk
	YuritjLo=
X-Gm-Gg: AZFdTZex2J8KakZCAInqYt9id7cxbeUnEzv29ZjdVx+EUxg43cpfbTHUCnCznH2BWt3
	JF9m8k9zjcv3iXnURSyVMSjEfipxHX+jszBopYO/BoEOlv6tu47ucBbTbzVfryKyFbLBGkYngtE
	EqQAaegKxNkePyqnxxzGI9XnjhE4/UiSxBVW0aTQIKKp/O1z57y647bzh3WFR/kZg+ueYteItTE
	KTjIA9aiqj0YzVDTmUPixK22wqtFlb+fgHn9UXSjvYcOaRSIpLTGRqgLhM1wyySM4ONin18kLZI
	lvYUoQNfhVRbAJvUIRQyB9ol2zJVn0mGPRFyzYPDDHYD25gKTOnsf9oWimmcNwYi68ekRqkkJ7D
	FmWt+X6V27nrINZdWWerQqMZTLN4/6jkbewHWQ8lpIcGY4DnLUvdJ3+T1Ka2aZf9owo9Grc6hsH
	eJPre1vnkQH/TsJR2Uu5cZj9N4Fnj+k55VWMM1/KugrLYBbSRzqjNz/79bJ9gpszD3fF04i2o2k
	jlEVw/9Uyb8Fv0T0helVhytD/+gIfxTBeZxWqN64il98wwgoam8Kxc6Zuio4NdImYgEmbr0qF6s
	0IIkynDJMJRy9OoXwBMOS97vSOMj08ZIS/VGZiuqDlEehcwukDSnmv2JEuyh4KpWmUe59cp1PK9
	Rrvlhx0LyWA5le6TM9TdLmv8HAWVqwyqaiQ==
X-Received: by 2002:a05:6820:821:b0:71a:e9eb:6b9a with SMTP id 006d021491bc7-71b39260968mr16619845eaf.11.1795632286624;
        Wed, 25 Nov 2026 10:44:46 -0800 (PST)
Received: from m5pro ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b37c52ae6sm12332828eaf.0.2026.11.25.10.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:44:45 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: Chris Mason <mason@kernel.org>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 03/10] io_uring: free the ring after a grace period
Date: Wed, 25 Nov 2026 11:43:12 -0700
Message-ID: <20261125184439.58077-4-axboe@kernel.dk>
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

On !PREEMPT_RT, a task that removes its tctx node on exit or exec can
race with the exit work of a closed ring and cause a use-after-free of
the io_ring_ctx.

A mutex has to stay allocated until mutex_unlock() has returned. But
io_uring_del_tctx_node() holds no reference on the ring, only its node
on ->tctx_list keeps it, and io_ring_exit_work() frees the ring once it
has tctx_lock and finds the list empty. If the exit work has queued as
a waiter, it can get there while the unlock still needs the mutex:

    io_uring_del_tctx_node()        io_ring_exit_work()
    ========================        ===================
    mutex_lock(tctx_lock)
    list_del()
                                    mutex_lock(tctx_lock)
                                      lock wait_lock
                                      set MUTEX_FLAG_WAITERS
    mutex_unlock(tctx_lock)
      clear the owner
                                      __mutex_trylock() succeeds
                                      unlock wait_lock
                                    list_empty() is true
                                    mutex_unlock(tctx_lock)
                                    io_ring_ctx_free()
                                      kfree(ctx)
      lock wait_lock
      waiter = lock->first_waiter

Each node used to hold a file reference that was dropped after the
unlock. Commit eebd2e37e662 ("io_uring: don't take task ring-file
notes") removed it, and relies on the exit work to wait for the nodes.

The fix used here is to do the unlock inside an RCU read section, and to
free the io_ring_ctx only after a grace period.

Fixes: eebd2e37e662 ("io_uring: don't take task ring-file notes")
Signed-off-by: Chris Mason <mason@kernel.org>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 include/linux/io_uring_types.h | 2 ++
 io_uring/io_uring.c            | 2 +-
 io_uring/tctx.c                | 3 +++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
index 1468bcb02893..1b85872bb7ea 100644
--- a/include/linux/io_uring_types.h
+++ b/include/linux/io_uring_types.h
@@ -517,6 +517,8 @@ struct io_ring_ctx {
 
 	/* ctx exit and cancelation */
 	struct work_struct		exit_work;
+	/* the ctx is freed after a grace period, see io_uring_del_tctx_node() */
+	struct rcu_head			rcu;
 	struct completion		ref_comp;
 
 	/* io-wq management, e.g. thread count */
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index be5a4f9505e0..06ff99921871 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -2368,7 +2368,7 @@ static __cold void io_ring_ctx_free(struct io_ring_ctx *ctx)
 	xa_destroy(&ctx->io_bl_xa);
 	xa_destroy(&ctx->hpage_acct);
 	xa_destroy(&ctx->personalities);
-	kfree(ctx);
+	kfree_rcu(ctx, rcu);
 }
 
 static __cold void io_activate_pollwq_cb(struct callback_head *cb)
diff --git a/io_uring/tctx.c b/io_uring/tctx.c
index b4fecea3ea47..c6b7f5647f79 100644
--- a/io_uring/tctx.c
+++ b/io_uring/tctx.c
@@ -231,7 +231,10 @@ __cold void io_uring_del_tctx_node(unsigned long index)
 
 	mutex_lock(&node->ctx->tctx_lock);
 	list_del(&node->ctx_node);
+	/* keeps the ctx until the unlock is done, see io_ring_ctx_free() */
+	rcu_read_lock();
 	mutex_unlock(&node->ctx->tctx_lock);
+	rcu_read_unlock();
 
 	if (tctx->last == node->ctx)
 		tctx->last = NULL;
-- 
2.55.0

