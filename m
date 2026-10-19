Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792436721;
	b=vunq5TJY71zOFqNbnCnpj01P9qv2//ebROaXfhClPcY3CFItQlhkbYrsvzpGN56KhuJU
	 U7y4+iaAUEVkyXLRaAcuiUfNNTBFcbLypAt3DTxCyGKeSIT3zRHODB166YIm1z+EBebB3
	 QVrxoNBOrZ3kzLVorMaaeLqRltnamKq4qA0sLl4VrORKL/2o04nDP8ini2ntMB793z5dP
	 mxk0RXvxt8fU5pNF8VCF3TYedavyItS2nDYCC+lJJmalsANGp471cdPX78rj+GQyyQP6n
	 GvYnO8bbS5fvLE6QHKFhZoEutk1S3iyEyrsvhg249upJaFF3R70FBvaqiMtCQvlsSMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=zpmbKGaFEA3TJR1yUi9WhNM/6RoCWpD5DQ4UC5ezlj0=;
	b=YY06bClpCKf6NVF28lZqIkXCiATty4HlpeBH9acWJ7qb117LpPRh1rLUTGzmcBd7QqwL
	 0jgM7BCFUMB4U/IaGoL1wgiAucwTEumF4VO3NAGSWCgilJvUXmuXUp6P8bwzSc8fqgWvk
	 UEZi3cel9ZUCXvfv1FAvZOQ+MazPMCuYwbOihTZs5S5cXaRj8eKDWj3vbgGdpDHGhg3Kx
	 PdYt+qLhBXStaGqfWXr8nUcCW7WX5uOTIYREwleJtn+3l040Z5Ze5Tvy05RSUYqvdvrv0
	 Y0Tu2CTfHWC+zDVYYW0eZHNG49HYLrlY/EoWN26GeXC29xoD5nJCh063V/xICnukZGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB70606A31C
	for <io-uring@vger.kernel.org>; Mon, 19 Oct 2026 19:05:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AB70606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7f48c750afcso1247136a34.0
        for <io-uring@vger.kernel.org>; Mon, 19 Oct 2026 12:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792436709; x=1793041509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zpmbKGaFEA3TJR1yUi9WhNM/6RoCWpD5DQ4UC5ezlj0=;
        b=DGtPOJN6BeFxOnGhsq2QFxfh0Yf7BDTFRSvDUn0rV5YpZRES6jO/jjwcFkezj61q+a
         O0m9K8/Y72aznD+vkPSrKngelQM+agk3IK5hDisvtWH+fN8Re3jTeUzrovdjRZixlFug
         ZSftLFNiE7wFX8I8C9tmViFAzr/cIlDvpM8zVaYiTcmxAKUIjDivqHPmqCb8m/pdB5Sl
         p4vxlvE+RPCwg4bay7Ilm7ZI5e7zzaY13bgmwk37YAdDF3MIprAw4F8tLiemP0d1FKsB
         3ENRqRwtccPQjYaOsVIdTO+9sI2RGmOJKWQ/3GoXjeUWrOA4eXjlXRSZ6UkW28938ETx
         wIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792436709; x=1793041509;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zpmbKGaFEA3TJR1yUi9WhNM/6RoCWpD5DQ4UC5ezlj0=;
        b=CxDdZhJRaSlmeeetFXsSbq71fTZylkQ34dz7t3h8fGsOdP+1SqiSxqBr+yupuQ4uVz
         cFekk11XOI7odf5MTDPA6AdkafJCtBmPwaiFzd8n5S2U+s0jrTDovygV3enaSmjCiN+v
         sh7nfSkv2k3EKELiE16rHQi+RVDFyHjKFSGsEuUjPxSiUGS2MB3ncYKYSzM9lIlJVN2C
         8qc1IaggSr3bJ/YnlNZYrox34lqkIHHGGyJ63hIMDjyHp84x9pcHPjWWXwwYkDjDTtr7
         grLgLf18g8mq7PdMbty8Y79SZt0zHZ07sumSJDIxA9kXXE3X96EL0QiIxJMQaKz4+wa6
         hWPQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9TchF4zTuswCJ9ilWsbSAxH0vIESKjf/6DGWKH+7HYGyiA9K9nIKo/26eejp2nFosjwAxoRzR/w==@vger.kernel.org
X-Gm-Message-State: AFq9FYI8U3vc7GoSkSShqOw72JhwkRbfBb/IEPe8F9N3pDJcBq2VA/Ec
	yFd7oqCNUmQFq4bQS7k0TOgpj5Iu8RlPd/bC0e2ySV+XYxifeDe1NYcR7Nvtl3ZGTNc=
X-Gm-Gg: AYBFou0YPDwvCJJu1GoECBNBSvLmC66znCZqY2LmfKbjbb7LZWD1U8oj4Jv4BDBuJ8N
	wQ0Ia0bYx77SUcWZJkACxHXaBB8uJI+lCqJtD70pyGRSZueZJx8vqyeQlUInp+Cdtngc11LDe6t
	VF/OvT0FsI9kNgutLGTm5+brMv82Q5nl2lnkp1kilUK76G62J9lQ4ubIm4UYVil6o7XDk3b/yN4
	k9RKW4W9mTsyLFjuhX8TucCn8s+9SoP5WmYplLRWbwO1WKyxVs65nYOmHbfJ1Ad6cSD4+UTMKmd
	Xn3swA6LcbzDI25CqMrpJts/FCaHvb8b1TMyPZv69q3e9nzQE8t/fcm+rM5ZF6vPOlVcfrlqY9X
	RhQUHWIfnIY+NtS8R74NH/eCwqA7zhV5vgjlLmMG9CqKXEBYMwZIxH83eMufDRdWdR0cSpNJGrP
	6VidPlytd1pREac5/Laluxs2CTdtqUE76ZLE+K1cb8D//UJljIXzShmBOIHh2D5dMKOHaDJq5E9
	mC2jKqzbaxAqquCH0w6f8pCVIYYBe9wRQ7L/sGpbilOENYhN2bBa9s=
X-Received: by 2002:a05:6830:d0b:b0:826:b77:adef with SMTP id 46e09a7af769-844fe96d6b2mr8373623a34.14.1792436708807;
        Mon, 19 Oct 2026 12:05:08 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8498d1a4bfdsm3423495a34.20.2026.10.19.12.05.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 12:05:08 -0700 (PDT)
Message-ID: <23ea58c1-0692-4f11-80d1-8845971902be@kernel.dk>
Date: Mon, 19 Oct 2026 13:05:07 -0600
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
Subject: Re: [PATCH] io_uring: don't sleep on a claimed DEFER_TASKRUN wakeup
To: Daniel Byrne <daniel1.byrne@intel.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261019150607.4026170-1-daniel1.byrne@intel.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261019150607.4026170-1-daniel1.byrne@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/19/26 9:06 AM, Daniel Byrne wrote:
> A producer that stalls between publishing local task work and
> running the cq_wait_nr wake protocol can claim an arm from a later
> wait cycle than the one its work belongs to. The waiter may already
> have drained that work and re-armed for its next sleep. The claimed
> wake then fires through wake_up_state() while the waiter is still
> TASK_RUNNING, before it has set its task state for the sleep, and
> is a no-op. The arm is spent and nothing restores it in time, so
> every later producer reads a non-positive cq_wait_nr and skips the
> wake. No producer wakes the waiter, which sleeps while the
> completions it waits for pile up on ctx->work_list.
> 
> Three waiters arm cq_wait_nr. io_cqring_wait() and the BPF loop
> waiter io_loop_wait() arm it a few instructions before
> set_current_state(). The third waiter is the cancel wait in
> io_uring_cancel_generic(), where exec waits for all of a task's
> inflight requests and exit waits for its tracked ones, such as
> futex waits. There, io_uring_try_cancel_requests() arms cq_wait_nr
> at the start of each cancel pass. The task state is set only after
> the whole pass, so the window spans the io-wq cancel, the local
> work run and the cancel walkers. That wait has no timeout. A
> stranded exec sleeps until a signal arrives, and a stranded exit of
> the last thread, which no longer receives signals, can sleep for
> good.
> 
> A prototype that busy-polls device completions in TASK_RUNNING from
> io_cqring_wait_schedule() while armed (to be posted separately, as part of
> the io_uring DMA copy offload) widens the io_cqring_wait() window to
> tens of microseconds, and those completions push local work from many
> CPUs, so what is a narrow race in upstream io_cqring_wait() wedged fio
> reliably within seconds there. Every ring was parked in
> io_cqring_wait() with exactly its queue depth of completions stranded
> on ctx->work_list and cq_wait_nr at IO_CQ_WAKE_INIT.
> 
> Add io_cq_wait_arm_spent() and refuse to sleep in all three waiters
> once the arm is spent. io_cqring_wait() runs its wait loop again,
> and io_loop_wait() returns to the loop in __io_run_loop(). Both
> loops drain anything pending and re-arm. The cancel wait runs
> another pass, which re-arms. Each check follows the setting of the
> task state, so a later claim can no longer be lost. The cancel wait
> checks only the rings whose deferred work the task runs, because an
> arm wakes only ctx->submitter_task. wait.h documents the rule next
> to IO_CQ_WAKE_INIT.
> 
> The check relies on nothing else restoring a spent arm before it
> runs. The min_wait timer stores an arm only during the timed sleep,
> which starts after the check and cancels the timer before the
> waiter checks again. io_uring_try_cancel_requests() also arms the
> ring when io_ring_exit_work() runs it or when a task that does not
> own the ring runs it, such as the creator of an R_DISABLED ring
> that another task enabled. Such a store that lands between the
> owner's test for pending local work and its check hides a spent
> arm, and the owner sleeps on work that no later producer wakes it
> for. Arm only in the owner's passes, the ones that also run the
> ring's local work, as the owner is the only task an arm wakes.
> io_ring_exit_work() never sleeps on the arm and runs stranded work
> itself, so it needs no arm.

This should already be fixed by proper ordering in my
for-7.4/io_uring branch - see:

8257f6ec45ee ("io_uring: don't lose the DEFER_TASKRUN wake up")

and

76a82c666abf ("io_uring/cancel: rearm local work wake up before sleep")

Please take a look and see if you agree.

-- 
Jens Axboe

