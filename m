Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CECC46D554
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 20:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792096301; cv=none; b=Af1WgpVXU6LutaXAkx8eqRzXlovcLTDqGjvYikbOFNeiJLOSOQePrSd5Fview5KKqcAIcdo49HJiRdj/6hrAzk4Iponapbm2xH3Yo+6BHi7T31OoMnKXaQDrJSw8XSo13STEfQoNhBfxeNNoZAxoeMWUCJ+Owsz7zOctNR1DB5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792096301; c=relaxed/simple;
	bh=q87+b15qZumgxilbhpZuIIZ0Hl/gJdo6FUqj7b9owFY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SP58NnvLnr18ecOSSfvaYcmPhxadc8ddAsnwUdOY5/xO6ojlnY4i/Wfbyd0tFSL13QpJDk62QZ55tylAQeLbjj7qICZDIpT6q8m2n8BD3cYUbLxBFXVlPLGXH+w1YMfrEgNPtQoyxL1FIeX+JxX3NdU7NN7XzCvd9zm9BTxZZNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=NHf3KKM5; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="NHf3KKM5"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e608cd460eso31732895ad.3
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 13:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792096300; x=1792701100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h6HkBwmjjl6rrJLjC5Keb3Og2XweVhABIAXA+aC7LKk=;
        b=NHf3KKM5hc6VEeZiGoKoVxAu/AyJFbS8hKdruZRrkBiRzknQzrZwP32TqCXJMFj5jZ
         l+TXRRJuZVcnWMj/Gbu0Fdfjz5lIxVLgxqTrbImJzOEGeM0aTXRjcYcMcFyGC3xL56t6
         m0os2xFTnFyDft1JaRGqynnmhQCw37/HlnO+UWIt4VZHVg2MrK6PiQFL5VG2nDmi82kt
         dz2LtvhA4tCtTLNZybqTD206upGP8H/Y8WWGmzO8QxqGPi+CeYJtAH9NabKLl+aENN+U
         7ML8kRSd6v002cj/HHEbbyt66i76DIjcbAIY0nwBXuPp7y4Guru3fFjgcX+PFv7CtmUZ
         VvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792096300; x=1792701100;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h6HkBwmjjl6rrJLjC5Keb3Og2XweVhABIAXA+aC7LKk=;
        b=0IyUMeAwsZX3nW3sWfFQt4k74ECWyu6Hpm1chMC+9EJSHvIXqyClTSmHkkSYMl02zZ
         WPSqCTeqD7OZsaz149MZiEt1WkdqpNtep9372hDVByl1uJ3x2bP1CLYRNHrLJbiVmeoO
         MaUXWV2NYqUNFUDVOoR09kZE+ObTMfHf4jsy6ITtdOicAEPsr3XD/D1tVnTp5bJv4gyI
         WmBwFgZvo+SPHuvm892LrQaiMR4VghBPRiLzpPbpzfwckk6DserqMvXRzi1ls5xIacXe
         O4ihg5mOLOJ7Pd63Dkh7xmHUg7BqWDqrNjrnYmL8/kFRgbdhcnzB8LNMDRLFxU7xStGF
         i/Mg==
X-Gm-Message-State: AFq9FYL3bQSxwP126r23pw/j68S8YCe4qz2KJ24/0vXmUQHI6se68buN
	sU97z1gvbz/GX7gqKQ6gzlanll2BFw5HguIYnY5L9VD/AQreOdVz/YHCOsgAmyu54I7ZoDYWNdV
	qxlCK9GI=
X-Gm-Gg: AYBFou3ZshuBomjC9SFS51sAtdebc0lSVx6cOaApZIyEufOvmMTbaOnIRdvVVEDftP6
	thJNgLo2pGvLfzFk89i7b9ji17J4w4DDEkGqBUDLGWoCeO09WrYsYAxDjZeNw80lJqMz6u3hZY/
	YCDiWmpC886A8CXNLdqkRG7TSO69nglpgfLYrhHFGZTjH8VZZoUXdNuSyMdW7SYLQ8zWhLtKAcc
	DnHdKGcc0iOdQ0G9O5TVVj+uO57mSnWLLVxWgnMUQMsPo73IpzmeUrX8IQsxfFoaF6aZRQOfNsH
	zTVqukw3GtDB9bWLXygwBJb2+AqyjhZGaGmpQIdzsVn90078khWaI/52fh0cepsS3JNsvMGvEMm
	a/TcJ3OckD5NDr42ttDirA84B+wcHGoZtY0j2RzEvLfZ1Z7w9t+x6ZwNxbE/pyS9mZGqcURRCSc
	OXeWnWVNDP7HXqY9hqoQBxTZK0YO/+Oeu5unTgPvuXY8vdZ0NTdirOXEQ8PVW0/Fc2GTHvu+ngA
	wVOUhREQrIY4ajxS82J917Dbxx11q1yY9CCI3SSCxFvxvxlLnkPzlftDQ==
X-Received: by 2002:a17:903:19ef:b0:2df:9556:6847 with SMTP id d9443c01a7336-2e842ce313fmr150389135ad.70.1792096299711;
        Thu, 15 Oct 2026 13:31:39 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e5d98d9sm1060325ad.2.2026.10.15.13.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 13:31:38 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Josef Bacik <josef@toxicpanda.com>
Cc: io-uring@vger.kernel.org, Leonid Ovchinnikov <teiny.work@gmail.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
Subject: Re: [PATCH 00/43] io_uring: Fix hangs, lost wake ups, missed
 cancels and ring corner cases
Message-Id: <179209629581.1859568.7553901179866411347.b4-ty@b4>
Date: Thu, 15 Oct 2026 14:31:35 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 15 Oct 2026 19:30:24 +0000, Josef Bacik wrote:
> We've been running a large LLM driven audit of the kernel, and these are
> the io_uring fixes that came out of it.  Some of them were found by writing
> models of the task_work, poll, io-wq and CQ code and running those through
> a model checker, the rest by reading the code and then writing a reproducer.
> It's a lot of patches, sorry about that.  They're standalone fixes, I put
> them in one series so I didn't send you 43 separate emails, so take whatever
> subset you like.  The ones that belong together are 7 and 8 (the same lost
> wake up in two places), 14, 15 and 18 (the same lost cancel, 15 and 18 close
> what 14 says it leaves open), and 25-27, which touch the same two loops in
> the resize code.
> 
> [...]

Applied, thanks!

[01/43] io_uring/waitid: own the request before clearing ->head
        commit: c254eec4364b9f4b4cbdce43be3fb4df5a651a70
[02/43] io_uring/cmd: don't leave list poison in ->hash_node
        commit: 4c83e39f4d1944d7146fd06094f2c8053238d55c
[03/43] io_uring/wait: don't spin on a stuck overflow list
        commit: 34f5a664c34d3cb62f6bec7f4156754594a7d25b
[04/43] io_uring/io-wq: don't lose the signal that ends work
        commit: 63c103279a95e82280092f2f4232e91e8117a252
[05/43] io_uring/io-wq: don't hide a link from cancellations
        commit: 436d48a2ed13112d2d27085325838e5bce6b4507
[06/43] io_uring: don't flood a cancelling task with task_work
        commit: 22e643e61b9b6299b42ff7d88bab48bccada8a5d
[07/43] io_uring: don't lose the DEFER_TASKRUN wake up
        commit: 8257f6ec45ee07c6ed933c59d8982b03cc7bc1ca
[08/43] io_uring/cancel: rearm local work wake up before sleep
        commit: 76a82c666abf155ad52d5f41043eac77dd3e41d8
[09/43] io_uring/mpscq: disable preemption while pushing
        commit: 68a95c3968895cd198f42baadb23e635fecc5a66
[10/43] io_uring/io-wq: don't go to sleep on pending work
        commit: f19c38feb96802ee53a99649d740d2bf630bcce7
[11/43] io_uring/io-wq: don't strand work when a worker exits
        commit: ad41f325be1271b22d99353819c90f0d5e45acc8
[12/43] io_uring/io-wq: don't exit with a creation pending
        commit: e231d2e8f80d3649ecd3851b7f2abdfbe606c04b
[13/43] io_uring/io-wq: let cancel find picked up hashed work
        commit: e9efeb4fc97b0879512a3c3b995ed448f2487e12
[14/43] io_uring/poll: don't lose a cancel as io-wq arms poll
        commit: 6d2d4c2530e95ff6ddeb98195d49d99dbca14369
[15/43] io_uring: don't lose a cancel as io-wq parks a request
        commit: 5cb049d2203d7a81a1c1a737c8df4575e71078e3
[16/43] io_uring/cancel: don't forget that the work was running
        commit: 8aa0e5db4845fb5ac11abe40d7b1cac0656c3ee3
[17/43] io_uring/cancel: recognize "no timeout" on 32-bit
        commit: 3774e4d4c8533da2caae95556c4d635c7c4f45b8
[18/43] io_uring/cancel: let CANCEL_ALL find parked requests
        commit: fe6ca13c98b1223f6005f32913ebd32e4df64b77
[19/43] io_uring: wake ring pollers for local task_work
        commit: b88902d8745a701d24275d012f0830e3628e2a22
[20/43] io_uring/wait: look at all CQ waiters on wake up
        commit: 356f92f2412686f822383b784fa102924407457a
[21/43] io_uring/poll: drop stale double poll entry on rearm
        commit: f2dbe87968a3aef74a11c025776d293b80964d3f
[22/43] io_uring/futex: allocate private hash before waiting
        commit: 3eff68bce25584cded3fb6ec033ff9a1c9913d04
[23/43] io_uring: drop the CQE cache if a refill fails
        commit: 78f9c9cffef02a290b6e97672aaa9c75df0d21da
[24/43] io_uring: don't split 128b SQEs at the SQPOLL cap
        commit: 79956bb39b4d372eb146955ea159ecb6fba37f5b
[25/43] io_uring/register: don't wrap 32b CQEs when resizing
        commit: 0edf1930b8ed3c398d3cbdbafd8f72dbd1a3d9e4
[26/43] io_uring/register: handle index wrap when resizing
        commit: e8dee8d5498c710a22a84076d8ecb661627032b4
[27/43] io_uring/register: keep 128b SQEs intact on resize
        commit: 0feb5bcd2d4261d656729892aef4d643461ea5ac
[28/43] io_uring/fdinfo: fix CQE dump of CQE32 rings
        commit: e4507a62c247081fffe299622c04c6f7c3d98e92
[29/43] io_uring/timeout: don't skip over reached sequences
        commit: c6c0b3eba88c3b13ca11ea112404982e86d58f7a
[30/43] io_uring/timeout: keep repeat count on multishot update
        commit: 3dc2a32cd356ee382aa4a8c7d844c53b2c0ad83b
[31/43] io_uring/timeout: use the right clock for ABS updates
        commit: dad82eb1805d76c555224e4030319e3844642b64
[32/43] io_uring/wait: no early -ETIME if min_wait finds work
        commit: 83cce67298ab1f4d2e9205a49f56975475cdb154
[33/43] io_uring/napi: make stale entries time out after 60s
        commit: 9c151648780d89e5446e5f89f3fa2e416c3bb911
[34/43] io_uring/napi: don't busy poll past an expired timeout
        commit: 21ed976c12f6b77d7ea028a4fe9a08e69a56179f
[35/43] io_uring/zcrx: fix buffer offsets in areas above 4GB
        commit: ab4536bf2e5617b04f2d9396f06393c7bbfb071d
[36/43] io_uring/kbuf: handle index wrap in last buffer check
        commit: 6e773b5161506a4d0e739eb3aa4667d28f20219c
[37/43] io_uring/sqpoll: let the thread sleep on disabled rings
        commit: d492dcbb3b81c1c2d0aabef41fa1307093f3a556
[38/43] io_uring/openclose: keep the lock in io_pipe_fixed()
        commit: a3d7ee11289f657aa9af826d8f0844221292a27a
[39/43] io_uring: don't pass restart error codes to userspace
        commit: e1a64bc64897f4c2fe460922c345f2ed8f889b5f
[40/43] io_uring/net: don't retry recv on uncommitted buffers
        commit: 8444de681a179e41a4eb92d5bbe770a0677074a6
[41/43] io_uring/timeout: no ABS update of multishot timeouts
        commit: b088ae34d4da730dc647261b893a6eb622fe5e1f
[42/43] io_uring/timeout: don't end a linked timeout with 1
        commit: c74193430febdd120e35936dda3e5aeec3a54405
[43/43] io_uring: look up the file before queueing to io-wq
        commit: 98bc044d5a5374f8d3605fe55a8e2df6d6fc3f82

Best regards,
-- 
Jens Axboe



