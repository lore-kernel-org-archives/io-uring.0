Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206058;
	b=he5LYlOhxKJEc4WeysEXQLh+pSQDsklySWp/cwfKrI0OjGnrR4fjreDYBfrhn6wEmo3s
	 IIaNp2RDJDFAoc4Rn/u/Us9ez/OBl3picT2lBOVsIh0A8/L2+uv3netDplcKgyHpFB3Wi
	 CO4CtS8FSbx7rTDQly7Ayfkd+Xr+A2IfmQ1RQ0R3ywny7Sn7Nvmkw8Ct4A2Ds3d0jgsKN
	 1NmTHAj7D5JVUQ30SLUYpEAMU0xtMY/WPWU6zjZJm6HZMRssya9DAbb60jL4GcCC+fP/g
	 c7WssLad0RJcFDmFrBzKXnTlQ8RMjHylwE3inBit+mu59W6v+Ap1QtX0pAOhO/GHJlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=l8WVltSH1HTBnjkdmYUbVmfhDUOpPOZsDSPZHlfQJvw=;
	b=swZj9HRC8o5sF+qmk4EI99B7S0uUHBNPeZLq6GGUKiLCG0/D+Z/l+Z7iu/Oi3WiUGvHg
	 rExCv8qHKwrEgle5DsmpGtFCHY/0W0Xj4u2VTiOuRqTjCqtYovCyx90FQTLKACiOGmK5H
	 5h+gcM8wQKIR0Gy/szHDQn1XbWHt6h+atvVAZRryxVl7U07Dzk+1eDTb/bs+uUt5s3WXB
	 PuauAtexgYx0vsCz/Pzn99IItMyTZD9GTJWQEN1yRpC/h5mSx27J/qXJ5l7n4wSIR43K9
	 cG7cGpy6FndEdZJBCj3PyC8AJ9XpKTjzNwNlSLIdP7SLRwDlekfAabt5Ax5k7L5EQgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KY9DTeQt;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F2C60A260C
	for <io-uring@vger.kernel.org>; Wed, 28 Oct 2026 16:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69F2C60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KY9DTeQt
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-823e4047037so902859a34.2
        for <io-uring@vger.kernel.org>; Wed, 28 Oct 2026 09:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793206057; x=1793810857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l8WVltSH1HTBnjkdmYUbVmfhDUOpPOZsDSPZHlfQJvw=;
        b=KY9DTeQt5UzWEVg1e492nIGOSlTQaJoIRBLm0ccqRCBQGGnUnUtr5DTQZyrmniRiik
         b+QV7Ykzy9LLg6O+yjGe5gYbG68q9O+biEqfA7mwIYiolubuZ0TcYyJ2S0XvmfU8be5E
         63Bnp21jHCV6iD8SVecbwDITgC/vlRY/iMbOBaSnDpc0wO6OgssLbVtrWApgfyeEsCLo
         B4Jgv4ynLQqLSUylujutg2dRVdsVYHNTDJr61XyDo2hsM5nzpizQaMw0lnACLL/oFfc3
         rtQqLnyw5T+oI0H2iYBj00erEpeBR1F9zpxyaddIgdQCtbvgTmedZrgUNaCSEnpcDSgi
         PBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206057; x=1793810857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l8WVltSH1HTBnjkdmYUbVmfhDUOpPOZsDSPZHlfQJvw=;
        b=WJqknFXlgl2WuvcGyzhGDEJfzXgFr2cg/7vYSyI2eeQ+wUlN2dBhe78d8dwCC+ZjeF
         rEF48L+zraY7n+lfka241FuiUqNslWNlXoadI6/gqmiFehMi1v450kJ++zDeMXS3vp2b
         XN/Bv4Oheq89Q4MP0mE1D5G7kqIm4J/Q7aBayH5p8Xhw6sQKwC9ZHiwOoPlmyMUcumOP
         PIJOzXSNKCFTBxr/MtkunYWsLY68jVRSbwXVXIDC3zvVZIeQNxGKdz3fzz6EQj8Aiif2
         sSatxbYnL0QZrVXchJrNb2slBgNiwSJZY3yECLQ5fnl2POblGDqMYt9RLvu/yupWqkRD
         VYvA==
X-Gm-Message-State: AFq9FYLPO8igr/AkRSh+z7BVnC1T7i6OeHI1TezXhOVJDwgyZT7XCUf3
	+avWdZ8Ep269ONlaMO+MpfriYjV9rThbBT9i5/ZF7Id1cDjDOiRT0LLhld5gk5+vPVyd25LHvyq
	0++3QDRY=
X-Gm-Gg: AYBFou2k/0lfBQ6ovIPGp83AzScqJ2o1VuMF4c5BQ3Z/54HrfRId0jxaPd8wFrkp2es
	AfZnYQBQ6yXfnNo7nHed+GEF9ECQGgSOiOjFeOR5P9N0YGmubAqeHmwJuNhfC0YCLpT1g5loGha
	AQXzRLsxd8OoOrddH+GAJPS9+9qZpdkO622y0WOmtwgB4/HEoHM+Z1lwxS1nXHyQ2H/z+fF/iEL
	/vhlpipBFyMfi/Vg7rFwXhzhC6T74DVLPN94J31Lm0QEDzalWHAVKivpvwceDkMIzcnyVVr5n1x
	hkWdpyRqDyNbHKw1C9Nr5WMtnJlvg3bWtdBbLe60Nl4wwP/agIcMgP32+cAAvDNDpgsXMlmDHbX
	QJpuS8IblSYO+XM+OiU6uPWzwYsNH0jfSLYal25rpEwUgO6Lj3chju7X3J0J4qbgPujnFdLU57M
	VlQMfDKOAYbZ7Uk5MCfoclV2SSFxczlNdNTC23UEpUm7G34f82gfvG0B/p9yQxBLHxDhFcGg1cB
	L8PXNanCSZa8GG39iwZmSG/ShDunw+jUqquVURKeXMryh6v54xIScihJmXSpsuzKFlnYeIZ8R5s
	HxheAl94/vMNO8Y5YJlWlkN+aa3J27g+wXE+xdUjeclvkfwiPz4B3Ax2jweRETXTP/zON2+epA=
	=
X-Received: by 2002:a05:6830:44a3:b0:7f6:ec23:7956 with SMTP id 46e09a7af769-85aba80b487mr2409854a34.2.1793206055877;
        Wed, 28 Oct 2026 09:47:35 -0700 (PDT)
Received: from xps16 ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b206f8a41sm2019182a34.25.2026.10.28.09.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:47:35 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 01/10] io_uring/io-wq: no new workers once the exit has begun
Date: Wed, 28 Oct 2026 10:46:49 -0600
Message-ID: <20261028164732.1264069-2-axboe@kernel.dk>
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

From: Josef Bacik <josef@toxicpanda.com>

io_wq_exit_start() sets IO_WQ_BIT_EXIT, but worker creation task_work
queued before that stays queued until io_wq_exit_workers() cancels it.
In between the task runs its task_work while canceling requests, and a
worker can still get created.

That's a problem for exec. begin_new_exec() calls io_uring_task_cancel()
after de_thread(), when it's supposedly the only thread left, and
io_wq_exit_workers() only waits for ->worker_done, which a worker
completes before do_exit(). So the exiting worker is still in the thread
group, using the mm, files and sighand, while exec replaces them. Easy
to hit with a signal pending when create_io_thread() fails and the retry
gets queued right before execve().

Cancel the queued creation task_work as soon as the exit bit is set.
Pending work that isn't otherwise canceled now ends with -ECANCELED when
the io-wq is destroyed, rather than depending on whether the task
happened to run its task_work first.

Fixes: 685fe7feedb9 ("io-wq: eliminate the need for a manager thread")
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
[axboe: the barrier is already upstream, see 0e5663856b69, only the
 cancel is new]
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/io-wq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
index e93cfa82b850..28533174d0da 100644
--- a/io_uring/io-wq.c
+++ b/io_uring/io-wq.c
@@ -1420,6 +1420,12 @@ void io_wq_exit_start(struct io_wq *wq)
 	set_bit(IO_WQ_BIT_EXIT, &wq->state);
 	/* Pairs with task_work_add() in io_queue_worker_create(). */
 	smp_mb__after_atomic();
+	/*
+	 * No more workers from here on. The caller is going to run its task
+	 * work, and on exec a thread that is created now would still be
+	 * around, exiting, by the time that the caller must be on its own.
+	 */
+	io_wq_cancel_tw_create(wq);
 }
 
 static void io_wq_cancel_tw_create(struct io_wq *wq)
-- 
2.56.0

