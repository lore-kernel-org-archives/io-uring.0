Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206065;
	b=YlNmGSyPUIqBKUApR9eV0NOWEfrLcZPo5oQIsJPYD5JysLLQfx4pi9X3Gxk6YgJuoVx0
	 x6zVCbG2gdaRcfmIiOqGKkKPECvaZo+y03lm1IrPa8wE8baKdtv1jC4PJaCOkt3qVTWbt
	 MTDWVdLbxzWjblr50sD+aiRjCy4l49Jv5EJ8Qzm0bGf2KJks0XC2cYJjBCntA2QBN9BJG
	 B6wawIXLR4sEYlRD0h2wsforAyYy2NGofLXtq85FlApPdHo8eEYoqX5/wz8cpzKPjBUC4
	 8jc7IQWKpAfJAbBuGaEF6dl3ZikhxoFw5lr55TUxfWr9Q/7XKB3evJ98MpxGFAYH7Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WZkk8zPZNbvPHju3EVy6PcxPRi0fRo/qlB2MqZkrhRU=;
	b=UfW/S4ClcDxIkH486tqyrmjj1PKhzr0IywwZUOUF+ggO/+WfJJN5tpjdlBSPgBqXUoMc
	 Nf+AdslAZencr/LitvRTDys+dYJIlLUwudXoy5xcYuItx+vnm9qUt8+ATuFmeIIt8q+Ip
	 z1MfC8IVyDG2bd34YXTs1msl/MfVBZiuYr+7VLxP9MY0NxNeOWJWhIezixZVgNZxx6LcJ
	 9294AfPjRvd+jfvOUycye9v/VwwR69uG20JKHNxaN6bn1JqJ8nowv/RqPy2Qhlu+rrqWc
	 kiNv5ao9AlFnkWS4haT39RfHH9kOA7aIvcAbKPbf1qL1mM+8J0XkX4o57lg/gXN/XlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HMW2cKVF;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96904606A338
	for <io-uring@vger.kernel.org>; Wed, 28 Oct 2026 16:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96904606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HMW2cKVF
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-8490a7d6696so710925a34.3
        for <io-uring@vger.kernel.org>; Wed, 28 Oct 2026 09:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793206063; x=1793810863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZkk8zPZNbvPHju3EVy6PcxPRi0fRo/qlB2MqZkrhRU=;
        b=HMW2cKVFvc9iEvX4gaowA7pAE45/qup+ce/NoD2cx8IhPbpumotgh1whY7ZhvILsM7
         uzcHrHBnWP7A027sE5udQrgblN5ED968M+D91oo9mNA1FdaI+ZLjw3bnajkNJT5peMoO
         e0zZt7IEC80G7D7fzXibUAqA+m0VO/XlJOepSRH8V8STDJIwc/5FrQ5DDiL+Yv1LherW
         YjgpOVXmkkTIQdVP5z+WU0qn+LCJ8gtwi+zV46gakmp9Yoo830qyhhWAi+i3lft/Xx+g
         Coi2T96TTpopyuE0/2C5gfbUzx2uNV+M7H3y9HBCSL5ooypc735qI5VLny56szxYaWsN
         +KDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206063; x=1793810863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WZkk8zPZNbvPHju3EVy6PcxPRi0fRo/qlB2MqZkrhRU=;
        b=XhoM41RAHWg4KWuuBJDx7DRlYwGxcP6g9WPKPUkTFLMxDAG2WdCgxIYoaTM0AqUM7p
         h20mpSovmI3RoZaXC+vRnf0orX/4OyfH6j9ys8aBLb9inbrI2TJXc0kc+PUHF6K5ZUIk
         dE+j6fEemS5P25yJ0DMZUURRu6JYY0Mt8xnTn1mUzdu2Sb5oLIn/NRoU8ooKF/B8N8FX
         t0pxEuib5tJV8NEjnuvpQ7+MTXRxjxMOjbkM073+xQDafqXuqZNHODFCRGLO9iyA7EzW
         sqfl40hq102vXC8mZuttI3nsL+ZRoWsujD7QtTcudDP3G2v9OGIS3u6ZEPitlIt7eKT6
         x47Q==
X-Gm-Message-State: AFq9FYL6dE3HObCEj2Lxb6m8gYyOoMUiSyQ/x0uSFFQ3le0rRdIZAH5L
	uKznfYhd3JjNP14CL/R9Wfv/8rPSqiL4AdQjPlYE3LNR22rjsFqvkLxmBuf73PPS6tYt4WiZNJ+
	l+dKi8Ug=
X-Gm-Gg: AYBFou2XMuSAFrCIOkhO0Nlo/Yr8oSu/HgXQumwok2bbU2YHWgVi/AMTDdHIPrGgmvo
	EUlr7k9Ka8ki0mec2yq2QVmvcblkgnacltUJUkilPDKvL0rPqP44teuq1y9ZTHM8yiRvZzJgtfu
	Xq98s2TV5txFlNWgxQpHDblyEZfMqkcNZFAc9rC7cGqxEGa9Q4sfaaF5Bfz7N3mIOdgeFQq/6E/
	05NqqfHyAcPv/Kg8vpjd0n2NihVKuR40P/6CnJ3KBA/zgEqMzNQAg3jJi7Zz7RJgd40Hm8iW94J
	3N2QrfTbmpFjdOnjGE/Vj26bBtE3AgspzEdKYC4K/B/4/xYoirAziPR9hlHsYWIxiJrER4lMsfk
	x7edY+jd6wlNXWtD/nRWSaKPk9htxuToYcJfF2d1tcQLse7ByMz9ZS1QD694kny9v5DDgqOExGz
	T3TkgLgEfBL0AF71fkXln+awKNyXFlPtuK3H9TXqnLriSPutYcQPduq15ocn+J+sQR95CwvirhQ
	fR+GIj91JIAnDDdsd25EYq49GLRTGcat0HkTb666C+wZhLzy6iEjKxtrAgcDeuTjqMIJV3vpTHA
	Q4EBgihbaV6AiSQ2dD0s5ritgQQsRKYLpqV5jRG6I60d7qvdDJQb+8Buna5aufmmofk7Y8aJ3w=
	=
X-Received: by 2002:a05:6830:680d:b0:830:43b8:72db with SMTP id 46e09a7af769-85ab81e111cmr2680956a34.24.1793206063526;
        Wed, 28 Oct 2026 09:47:43 -0700 (PDT)
Received: from xps16 ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b206f8a41sm2019182a34.25.2026.10.28.09.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:47:42 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: Chris Mason <mason@kernel.org>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 07/10] io_uring/sqpoll: don't wait for the thread to exit
Date: Wed, 28 Oct 2026 10:46:55 -0600
Message-ID: <20261028164732.1264069-8-axboe@kernel.dk>
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

io_sq_thread_stop() wakes the SQPOLL thread and waits for it to exit.
The thread belongs to the thread group that created the ring, so a
SIGSTOP or the cgroup freezer holds it in get_signal(), and the wake up
doesn't change that. io_ring_exit_work() then sleeps in that wait until
someone continues or kills the process. iou_exit has 64 slots, so 64
closed SQPOLL rings of a stopped process keep every other ring from
being freed, for everyone.

Don't wait. Set the stop bit, wake the thread, and let it exit when it
gets to run again. The sqd can now outlive its last ring, so give it a
second refcount with one reference for the rings and one for the thread,
and free it with the last one. The thread can't reach a freed ring,
rings leave ctx_list before dropping their reference, and the io-wq hash
is refcounted.

Fixes: 16efa4fce3b7 ("io_uring: allow IO worker threads to be frozen")
Signed-off-by: Chris Mason <mason@kernel.org>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/sqpoll.c | 28 +++++++++++++++++++++++-----
 io_uring/sqpoll.h |  3 ++-
 2 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/io_uring/sqpoll.c b/io_uring/sqpoll.c
index ee97808a065a..49c52284ecdd 100644
--- a/io_uring/sqpoll.c
+++ b/io_uring/sqpoll.c
@@ -63,6 +63,24 @@ void io_sq_thread_park(struct io_sq_data *sqd)
 	}
 }
 
+/*
+ * The sqd has two holders: its rings, as one, and its thread. Neither waits
+ * for the other to let go. The one that lets go last frees the sqd.
+ */
+static void io_sq_data_release(struct io_sq_data *sqd)
+{
+	if (refcount_dec_and_test(&sqd->free_refs))
+		kfree(sqd);
+}
+
+/*
+ * Ask the thread to exit, and don't wait for it. A thread that is stopped or
+ * frozen exits only when a user lets it run again, and the exit work of the
+ * ring would keep its place in the workqueue until then. All rings have left
+ * ctx_list by now and have no request left, so the thread can reach none of
+ * them. What it still uses is its own or counted: the sqd by free_refs, the
+ * hash of its io-wq by hash->refs.
+ */
 void io_sq_thread_stop(struct io_sq_data *sqd)
 {
 	struct task_struct *tsk;
@@ -77,7 +95,6 @@ void io_sq_thread_stop(struct io_sq_data *sqd)
 		wake_up_process(tsk);
 	}
 	mutex_unlock(&sqd->lock);
-	wait_for_completion(&sqd->exited);
 }
 
 void io_put_sq_data(struct io_sq_data *sqd)
@@ -86,7 +103,7 @@ void io_put_sq_data(struct io_sq_data *sqd)
 		WARN_ON_ONCE(atomic_read(&sqd->park_pending));
 
 		io_sq_thread_stop(sqd);
-		kfree(sqd);
+		io_sq_data_release(sqd);
 	}
 }
 
@@ -160,10 +177,10 @@ static struct io_sq_data *io_get_sq_data(struct io_uring_params *p,
 
 	atomic_set(&sqd->park_pending, 0);
 	refcount_set(&sqd->refs, 1);
+	refcount_set(&sqd->free_refs, 2);
 	INIT_LIST_HEAD(&sqd->ctx_list);
 	mutex_init(&sqd->lock);
 	init_waitqueue_head(&sqd->wait);
-	init_completion(&sqd->exited);
 	return sqd;
 }
 
@@ -424,7 +441,7 @@ static int io_sq_thread(void *data)
 	io_run_task_work();
 	mutex_unlock(&sqd->lock);
 err_out:
-	complete(&sqd->exited);
+	io_sq_data_release(sqd);
 	do_exit(0);
 }
 
@@ -544,7 +561,8 @@ __cold int io_sq_offload_create(struct io_ring_ctx *ctx,
 	}
 	return 0;
 err_sqpoll:
-	complete(&ctx->sq_data->exited);
+	/* no thread was made: let go of its share */
+	io_sq_data_release(ctx->sq_data);
 err:
 	io_sq_thread_finish(ctx);
 	return ret;
diff --git a/io_uring/sqpoll.h b/io_uring/sqpoll.h
index fd2f6f29b516..024a51dc3069 100644
--- a/io_uring/sqpoll.h
+++ b/io_uring/sqpoll.h
@@ -2,6 +2,8 @@
 
 struct io_sq_data {
 	refcount_t		refs;
+	/* one for all the rings, one for the thread: the last put frees */
+	refcount_t		free_refs;
 	atomic_t		park_pending;
 	struct mutex		lock;
 
@@ -18,7 +20,6 @@ struct io_sq_data {
 
 	u64			work_time;
 	unsigned long		state;
-	struct completion	exited;
 };
 
 int io_sq_offload_create(struct io_ring_ctx *ctx, struct io_uring_params *p);
-- 
2.56.0

