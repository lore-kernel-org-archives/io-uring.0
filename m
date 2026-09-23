Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EFB126BE1
	for <io-uring@vger.kernel.org>; Wed, 23 Sep 2026 17:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185042; cv=none; b=sB2SJVd/tZv8whRJipbk8fJLL8Pm0e1Kci2BbH0eItKvL1PaH4Lx3C0f9fZNZSxS0gvtyPJibfU14MO5PMXOhEeBTQGWGTExCoHOX8ieKStRd6qbC9NxIcN2J/pwG+8AocvWhoc+HVH15HWx27Y811k8s3MGXI4pCDfF6nw5tH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185042; c=relaxed/simple;
	bh=L8YBuTzxCFsGJDiFQSbZ8ONNMAwnyDJH3HxExyU4ry0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RFN1n9URtqtnwipiQIIR0a/4s0ppQMw2/nzmAuZRlvvVnILugDYid8Tr4gqXsbmbrcq4xVWvO8WsKPOAthxwD4TruWArDkupFz3oq4CAPMIZE19Budmqj/vmpxH/iECGl8qAvtVndKBaUs7nLtqvH4ULGyV66P7DvncF61HA1x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=MgcjuyG3; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="MgcjuyG3"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-47be948a50fso879216fac.0
        for <io-uring@vger.kernel.org>; Wed, 23 Sep 2026 10:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790185039; x=1790789839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TVQsj4jaJtoAVqzXpmw/AEBGK5pSmcp7fERfpMGZybE=;
        b=MgcjuyG3luTlDrR9MeADP166C6+9+dZ1A1UiHLlqSbqqqYKCUJXYoP7pRMCt7GPvCa
         2VytWarGDRgbis57Pd4iH0JMt7HWlkuiBliOb169dUvSdq364RBQPHdF925yIo/uWUch
         /TqwY7kdLFvh642Y/Uzhaut6e9SU3QClIv50nLcGsWmofuXm5dREbC0GBdw80MqUJLvd
         5wyfXFsFrnEHV1T5GqScIeuPh5eNAn6x0IQ0K3+TfJk057mGHFqSE9/OlLXJyuQY0aoV
         3WheAeKWaZKhnIAqiqcwVilsJitGrTG0iHVtHz9qW8xITRWA9xR6mlAjQR/wA/SNCvKo
         o48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790185039; x=1790789839;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TVQsj4jaJtoAVqzXpmw/AEBGK5pSmcp7fERfpMGZybE=;
        b=BnHJKVrgE2D6Ro3ff5p2DUci2Jgz+UkoVqZK/39YOvlbxYx3KTe22OIeVlThVhT6to
         Nih0WpKJKG0xuKEEvECnWMAeBtN6tXLRH+I3GJGZMqpYTjkBkQWysnv/8gN28rcanrV3
         bGj0n/me4YblfueLNxzr5RwCO3Rlm7grEGzU6hdaHx8dd9JKkaxOnjVn0jQ7I6AbXnKR
         CIUdPHwVngYZ9dmPjEZxPlFkttbfJ31w1Vt1tWtfDgplDcJkfiTlVdl2HWaDJgG7f7PK
         0vHcij3tDdRh1qHO+BJ387ZPF+6D5saCDkutF0syRLB29DmyZDLsQ5sEct3PkLjMfSlB
         XRww==
X-Gm-Message-State: AFuF++mpNMOjaLbDenWX32mQ7wDen2jjXczlGnnDZemoftrL81Q2fN59
	30PPnNJeWWLlkzMIenRVE2ez6w/qj5YBCRNiWM9rctNZDugyJKaeyhl0XnHQ3dUQ7dc=
X-Gm-Gg: AYBFou2B3/N2sPEapb3+eU23qe308sxOXaVgUFqXmy47GcRPjdon32OdjAS2BWT0AZM
	mM6P5SlWuXjDr6ppfJYCtxzKlMPtf1PjxPyyajCErrtR507XR1xgbbpOlVrvOrTViBK5/rmz4Xx
	lnJfTD1G0a5UU4jHj+XBkXCwSEC6TZW/agScBiAXZvj/xpKSojNK0BBsWEFpjN824jB2FmCcMbM
	Jr413NTzxiQnKO3wC+Ho1DAG55e3Bqc9+4e/leab6v8VuuNJC4bZIJyX8lnnxuYsBpPm0OdyhM9
	Jag2k6+82ZnXKWiMRSMa96+pBl0pAren99/J5rJXAJN5sjkreXAeezMWe2L/+sBqnPWtIMYHL7i
	oXI8/qfVlp94xnk8xQwNGo/nGPbxikNYABxwXMFv3nG0hvbsXAT5N+9DtWr17KygvljnPtkkptr
	8rGR4PYX2kfy9GspfXXksqqOktwumBmDMr82/XMR+DmOvFyBtRu+z+HtWdx8WnH768qmhR4eWrG
	lFltq8FDOHBAVl5pJAoRGq320PV+TwUQtQ9R4QQapJgOHTI2P8bm7T/yt8TWfwkJA==
X-Received: by 2002:a4a:e904:0:b0:6bd:7732:adc6 with SMTP id 006d021491bc7-6d2cf849ec3mr3167012eaf.17.1790185039103;
        Wed, 23 Sep 2026 10:37:19 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d2ce763f72sm3440756eaf.7.2026.09.23.10.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:37:18 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Xiaochuan Li <chuanx2070@163.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
In-Reply-To: <20260923172032.11057-1-chuanx2070@163.com>
References: <20260923172032.11057-1-chuanx2070@163.com>
Subject: Re: [PATCH v3] io_uring/lock: Keep spinlock release before
 wake_up()
Message-Id: <179018503811.141390.8170241609331802900.b4-ty@b4>
Date: Wed, 23 Sep 2026 11:37:18 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 24 Sep 2026 01:20:32 +0800, Xiaochuan Li wrote:
> When CONFIG_PREEMPT_RT enable, raw_spin_lock() will preempt_disable()
> -> raw_spin_lock()
> -> wake_up()
>   ...
>   -> spin_lock_irqsave()
> 
> which will trigger:
> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:46
> in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 985654, name: iou-wrk-983605
> preempt_count: 1, expected: 0
> RCU nest depth: 0, expected: 0
> CPU: 3 PID: 985654 Comm: iou-wrk-983605 Tainted: G        O  6.1.83-rt28-g19631eb82f21
> stack:0        ppid:977479 flags:0x00000008
> tgid:977553 prio:120 preempt:0x100000001 rcu_read_lock_nesting:0
> used_cpu 3 wake_cpu 3 on_cpu 3 on_rq 1 migrate_dis 0
> arrive:17423426040675 queued:0 prev_sum:33955300 sum_exec:33955300
> Call trace:
>  dump_backtrace.part.0+0xdc/0xec
>  show_stack+0x1c/0x30
>  dump_stack_lvl+0xac/0xc4
>  dump_stack+0x14/0x30
>  __might_resched+0x13c/0x170
>  rt_spin_lock+0x34/0xc0
>  __wake_up_common_lock+0x68/0xd0
>  __wake_up+0x1c/0x24
>  io_worker_handle_work+0x5b0/0x600
>  io_wqe_worker+0xf4/0x310
>  ret_from_fork+0x10/0x20
> 
> [...]

Applied, thanks!

[1/1] io_uring/lock: Keep spinlock release before wake_up()
      commit: 8dc68de64261e599631aa7ed6cdf3aec07c7ae3d

Best regards,
-- 
Jens Axboe



