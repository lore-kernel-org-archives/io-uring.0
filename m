Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206063;
	b=UK32TarRnvJM7NB2/GIxHn8NrBKpNYIwY7IODftuYgGOEpvXFvdS8JwdRl73CUW2KAjr
	 xAI+NB7OkiRJgLdF4gMazIM96IweVhvarYuBWaIb0oEkxzytYo6BHjfn+bCWHBeAs9AZu
	 NLFxuvX3V3MA9unhO+Y+j3xX+IIfZnUsgDXE8sEVI4SCsGhGnhwvjIY5BAGD4AWgDLdPV
	 k3M/8g+BqM35FMOi4urVgHPC5JaO9EHGA8zKm6Wh+7D2iQnbwrWkdl/0SBJDva2j+BotU
	 25tP8W3XwGroZNEzMsd4wFUqhOHK+ia4PnasS0QtRmkRmR7DdZ1Cf81USAPXl1f+iGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=18bBnokZY/czP4fglexUCKG+IwSfFPeC1oHIXEj947k=;
	b=Uz33BVODL+N8fJtrFGKHCqkAyXYNwfEUfVk+H+rGYajRfW6MTgs60Zaa1aHFP6fJsBI3
	 6NbjgMbBJy22MJm8thwa8GIqzofTOxy8NGWb0CaHpNBuiDCbZninJVDKZRUmEL2ahYbbG
	 LyFciUG0uByCDebW1AroVbpmhe31nkzeS59WNjolqeaKgOjEfIHwRuGsCzI6sSFbPrk6T
	 0TfZrgaJPxnL5Gq4SWs3XerXAaNlnZkT4w51prrjUukatNpnQcuVsCm7KreK5Mk1L2vWY
	 h+zzfXYKoYWP39S0e7jKLRS1r34aE8BG0U/5vQxIvz9Xvz4iAO82W/kn/zAiqMCRBrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SLqviUAi;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BB760A261D
	for <io-uring@vger.kernel.org>; Wed, 28 Oct 2026 16:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57BB760A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SLqviUAi
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-843b6f8e2c7so1413964a34.1
        for <io-uring@vger.kernel.org>; Wed, 28 Oct 2026 09:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793206062; x=1793810862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=18bBnokZY/czP4fglexUCKG+IwSfFPeC1oHIXEj947k=;
        b=SLqviUAi/nLy27Lzg4hSnNRhvWP2k0SkpOkHzkxMBPZRw/rDF64In0WyfVx512T9zS
         KVpGJf5xmrNfSCXylSjMAuzC+O0on4jwzpcazS7qvKpGp2j5UihfM2VSPjTHU1+ZHwSp
         m6s8opE8JUwRjDLDjZcPj2K0Rc6MVDdj9cqBpbtk2vnl+B2KvjYjCcZSV3MdZ9dpsWBg
         URuO0tLvpVGZIOqW/XiNOiCeQYIGHHR+dbu8ZXic0Fx9zmvXb14RHl2u/ge6DgvAysOK
         4+9TdgaTxhIo6Obqge/dGWjWUZlxzOVeDtfYK7qtLvqEeR1GDEFcst9tTqRJBx83b9MN
         b+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206062; x=1793810862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=18bBnokZY/czP4fglexUCKG+IwSfFPeC1oHIXEj947k=;
        b=GYmT4pfzU2S2DITf7b82zL8VMbHiN0wRnHL2Wj6xpfqknDZX/fLBFeRYMudS4SZYj1
         nljoVNeQu0Pok9HvG4Snt+LAOAx5r448aZ1QiI8Y7QeDqWi5AkczHoayFF9prijYFOIo
         HjdGxrugwZ/PsGIYInsde11UZ/p4dRJswzEW4WbP3qr0RcufIplW9OKM1HAIwhNBaEyL
         x4Utot31LUOT03GzD6zqYII2WyGYGwS7pslQpeP3EP4HIbzIu9xH78Snhq3SvSx5fq7V
         xUrLJPMXcofh0TQB2CGcrJIo9xdRh7JvYOZQ6TeRp/7ERAhN09R2r4m4GAQIp74XaotG
         5i1g==
X-Gm-Message-State: AFq9FYKrKcj20uR6EgxId1hBHOnw1ULEWVtjLFJW6VwgUbmK7NsQStlI
	7a0bD2NsYXUZg0AjiE8BQ3Z5KwS3XmtyJfJV2DWJqnAtlYVUcgG/UbVhi14v5WEskusMkI6ZeL5
	jLZ1Ez3M=
X-Gm-Gg: AYBFou0lRI+f2+xI0Pbs8aHFZax5nU1IHGNhxyd/aatjsBWbzRol/jhcv+X1duANhw9
	V1bAddGbEGnhSeCu7IZ/H3EOzq7o9XQI8xPP0SitY3IV7zUy9CWxYnFAN5yywvarl1ki85fnOPM
	F+YJnCL3ZZ15K5veyVrVitzGK49Bcmn4nKxivUUWJku+HPN6el7V5ztpnlyVd+HCi8HsjO3+RTI
	HU0ZOVnH8uzfeptwpMM47FHlBenNhiSvgcwTBqQKk6k+ncqL0YJimmPS34FSj+16vFpShGiZat4
	+GleDNqZwYbYhZm/M9jeBNDoQNsZ82V9SqlLK/5+JDBctUwTm3Ij/CDJvuHDzhW7m/sSlQXH/6F
	MQ28QmypxdgD1sBx7MXsaJJc+MDYhaHsApi3giJmqmHJIuUK2x6ZIpoxGvyr+O2WUXylnyT2EP4
	rBGHvl+VSDUdZRsyVsJL6XmOkKaLRB6P7H0WHGfIDAar11NcCz0eeCyJmWh/p3Sie9Yb8f6eOW0
	SJQ/sWMXrQLzp7K47Z67Jzsm+Kb9Vw5oj5JiI5RPUiW4h0HCYryGjcgrIQ7HojA/udHspqj6Pnh
	Jjr1+uu0qdBFFGXNmmMs5OuQLFX7KmZbqRxqAvpifnFVbHD4eH/mFsjP9q3m7zzHTe6bh7ybwg=
	=
X-Received: by 2002:a05:6830:254c:b0:81a:9522:f007 with SMTP id 46e09a7af769-85ab704077dmr3121722a34.5.1793206062296;
        Wed, 28 Oct 2026 09:47:42 -0700 (PDT)
Received: from xps16 ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b206f8a41sm2019182a34.25.2026.10.28.09.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:47:41 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: Chris Mason <mason@kernel.org>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 06/10] io_uring: free the task context after a grace period
Date: Wed, 28 Oct 2026 10:46:54 -0600
Message-ID: <20261028164732.1264069-7-axboe@kernel.dk>
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

A task other than the owner can free a request, io_ring_exit_work()
running the local task_work of a DEFER_TASKRUN ring for example, or
io_do_iopoll() reaping completions. io_put_task() then takes the else
branch:

    percpu_counter_sub(&tctx->inflight, 1);
    if (unlikely(atomic_read(&tctx->in_cancel)))
            wake_up(&tctx->wait);
    put_task_struct(tctx->task);

The first line is what lets the owner leave io_uring_cancel_generic(),
and on exec it frees the tctx right after. Nothing holds that off for
the remaining three lines, the task reference only covers a tctx freed
along with the task_struct. It used to work out because
io_uring_del_tctx_node() took the uring_lock that the freeing side holds
across io_put_task(), until that moved to tctx_lock.

Free the tctx with kfree_rcu(), and enter an RCU read section in
io_put_task() before the count is dropped.

Fixes: 5623eb1ed035 ("io_uring/tctx: add separate lock for list of tctx's in ctx")
Signed-off-by: Chris Mason <mason@kernel.org>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 include/linux/io_uring_types.h | 3 +++
 io_uring/io_uring.c            | 2 ++
 io_uring/tctx.c                | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
index 2e5a786f2a2a..8c51ce903671 100644
--- a/include/linux/io_uring_types.h
+++ b/include/linux/io_uring_types.h
@@ -161,6 +161,9 @@ struct io_uring_task {
 	/* drains ->task_list once the task can no longer run task_work */
 	struct work_struct		fallback_work;
 
+	/* the tctx is freed after a grace period, see io_put_task() */
+	struct rcu_head			rcu;
+
 	struct { /* task_work */
 		struct mpscq		task_list;
 		struct callback_head	task_work;
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index b09859c6e8ab..615933a6e8ff 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -634,6 +634,8 @@ static inline void io_put_task(struct io_kiocb *req)
 	if (likely(tctx->task == current)) {
 		tctx->cached_refs++;
 	} else {
+		guard(rcu)();
+
 		percpu_counter_sub(&tctx->inflight, 1);
 		if (unlikely(atomic_read(&tctx->in_cancel)))
 			wake_up(&tctx->wait);
diff --git a/io_uring/tctx.c b/io_uring/tctx.c
index 291e30e00e45..b4fecea3ea47 100644
--- a/io_uring/tctx.c
+++ b/io_uring/tctx.c
@@ -64,7 +64,7 @@ void io_uring_free_tctx(struct task_struct *tsk)
 		WARN_ON_ONCE(tctx->cached_refs);
 
 		percpu_counter_destroy(&tctx->inflight);
-		kfree(tctx);
+		kfree_rcu(tctx, rcu);
 		tsk->io_uring = NULL;
 	}
 }
-- 
2.56.0

