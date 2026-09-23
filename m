Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C1A443A91
	for <io-uring@vger.kernel.org>; Wed, 23 Sep 2026 21:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790198127; cv=none; b=lrV8BHu7zjtSdzIWDfHw7CNhkEd4E7W6ZSJB3SvlR2hOK0govubhTLZIzp/iCkwvZzhh5bKbyzZBYC8SAz43acb2BWmyegylDTIlld2MOass6BLFyTOzL6NvAzzkwT1+GXE5OBymm01F93O8yiJiy5TcqW9uHIsyxQyTl60x3VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790198127; c=relaxed/simple;
	bh=QZ+gkZx8tRSal+D98Z1zyd1nQU4mdy4IUssMdZlDIBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WhDUL6inZ48VAZuNHu3obunsi4m6Rzb6mEZlTQdAoXzhHqwNduI1BUNt2uuMBj2nb1TOWkT0xD3MqXvPf92rYi50B9Djj0GC7nVE+HJhHdf99K/ak+yofz40In74GqV2bUtdzFNTOoeKP1csEIUpsy2Z6LAfALTolYWowA0f/ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=VLCTEytW; arc=none smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="VLCTEytW"
Received: by mail-oo2-f40.google.com with SMTP id 006d021491bc7-6c72bd8a02fso689153eaf.0
        for <io-uring@vger.kernel.org>; Wed, 23 Sep 2026 14:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790198120; x=1790802920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kg7IwIlD1kntpf1eauWWXgt0Gca3DfH40H5I52PyjHc=;
        b=VLCTEytWTxlNSWyPtsXbL/hkKWe3414ZIt+qUX8h+VGRlg2cVoZ+FLKD5xJxQmU9HJ
         vqIr7FF5Kt129NXwnU9xMiaXKjhzfSprXpqN4XvDPNBothmAezjFF2vP3cIUcTNyC8OF
         9IyNMjGkN91Eb72z8J9naSKB/aeJn5vn1Y1b5z/CV2rcYmdJ8JyftUoAAqAniaVzI4yf
         mUDQ5bnz7qloApdSvkk9C1SOedk+gieh/8NuGDrzXUgr9lY13wm5qRkKL+TL7c6Lbd6v
         r2zP2gjmCgtx6Bw2JEDz1cKVpKzk1cxUrOo7B2xcXh2yq2Kb/Tnizh0lCzo4ehZ/vXWg
         /wEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790198120; x=1790802920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kg7IwIlD1kntpf1eauWWXgt0Gca3DfH40H5I52PyjHc=;
        b=j03OTIiM9UA10q5PDWOa2z4oF/Zj7cuUGkC6dFaJ84l+W0C5nU1C/Ks0woHzOY9R0H
         t2WtrMGVP67gYXFrTxFw8cE+VJxruD4OblPA/77IjtnF5tUFFAbuHLTz0txT21MJlO3Y
         Z7g8RfPl4CqM/KTOC48rG8uGXit8RaAwlo/IN2ebG1HkzYZh3TH4QaA5AqnoP56kiJGR
         RHAnxdVta95jV9iDnExwFgp/W88zYf6favEAkvUlKA+pR6X8+DngNndMUoRp4CNvxxux
         kXHKVp7fl2HJ+C8bQpjHBozJceiwg60s1kdcADkncphneRHnvEaAogLqY8Gii7VRDGY1
         N+Zw==
X-Gm-Message-State: AFuF++nR/WhKgw+JzNCIBVnV5AoxjCNGzEhSgO0o6fRQ2nz5ywH+QRLc
	5Xg/EDQ1UPNy/IOHuKxiW8ItoVsh8Mu0erLjIB8I7sbXy8crlrQsxSUnwtq4LiaRyBE=
X-Gm-Gg: AYBFou2lA/eSe8rHV1yvQqKmok/9KgFu4CQ9Z1ifdAoL6b3W+muXGo40WayhtQYvYA0
	HosmkPs+Y9xINXhy0UQOKSohYecBMTsdV62zuAgTQeA6m+FFLG39MPRPMWXo+Ge1XrEf81/32gy
	kifZdMUknqz1U2faP2d+7PXjIWDU4DQSz9FVLeC1ulv7wz2xrxUI9j4VI5g755EFDmBquX2k8TK
	dQHh9mBDFSPifBwdeMY9k8LMOT6743T0iYWvW++s4K86nxaAdbx1Uji3FHKbs12juXvpK7FLMSI
	9bLfbq2eMZj/U6oFrWoqkhlStbo+FIowOSVZKSc+a7S/Lspvlexr+eSug1t485zmT+CutKUD7R/
	4PjWBmgioNUlPLUjFPWlCaLZiAaILgJdZPb9qcgIiyHgL2DdxJ5yjA1BMApT6ayxPeQ3PS9pi5i
	GlGTK405SkHWSexq5vT8LClO7LUgo0zTLD6Wa8tI/Xd/TF98Mu5o8WiHF5aq5Fi5l12+sBMi614
	L4npuubHi/TnDd3sc0+yMP5inKDKoXT0vCM/yWhNN30DKpAgY2rg2Q=
X-Received: by 2002:a05:6820:61a:b0:6c9:80d8:a205 with SMTP id 006d021491bc7-6d4415b5912mr500249eaf.66.1790198120452;
        Wed, 23 Sep 2026 14:15:20 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-491ee3c96a6sm321113fac.17.2026.09.23.14.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 14:15:19 -0700 (PDT)
Message-ID: <6ceb9e88-c209-4b4a-963b-385199d91e11@kernel.dk>
Date: Wed, 23 Sep 2026 15:15:18 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] io_uring/lock: Keep spinlock release before wake_up()
To: Gabriel Krisman Bertazi <krisman@suse.de>,
 Xiaochuan Li <chuanx2070@163.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
References: <20260919123021.21318-1-chuanx2070@163.com>
 <20260923161622.25737-1-chuanx2070@163.com>
 <87v77vzn6j.fsf@mailhost.krisman.be>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <87v77vzn6j.fsf@mailhost.krisman.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/23/26 3:13 PM, Gabriel Krisman Bertazi wrote:
> Xiaochuan Li <chuanx2070@163.com> writes:
> 
>> When CONFIG_PREEMPT_RT enable, raw_spin_lock() will preempt_disable()
> 
> The subject prefix is wrong.  It should be "io_uring/io-wq".
> 
> Also, It might be that I just didn't find it, but was there a v1 of this
> patch?  I can't find it on the list.

There should be a v1 and a v2, off the same thread.

>> which will trigger:
>> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:46
>> in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 985654, name: iou-wrk-983605
>> preempt_count: 1, expected: 0
>> RCU nest depth: 0, expected: 0
>> CPU: 3 PID: 985654 Comm: iou-wrk-983605 Tainted: G        O  6.1.83-rt28-g19631eb82f21
>> stack:0        ppid:977479 flags:0x00000008
>> tgid:977553 prio:120 preempt:0x100000001 rcu_read_lock_nesting:0
>> used_cpu 3 wake_cpu 3 on_cpu 3 on_rq 1 migrate_dis 0
>> arrive:17423426040675 queued:0 prev_sum:33955300 sum_exec:33955300
>> Call trace:
>>  dump_backtrace.part.0+0xdc/0xec
>>  show_stack+0x1c/0x30
>>  dump_stack_lvl+0xac/0xc4
>>  dump_stack+0x14/0x30
>>  __might_resched+0x13c/0x170
>>  rt_spin_lock+0x34/0xc0
>>  __wake_up_common_lock+0x68/0xd0
>>  __wake_up+0x1c/0x24
>>  io_worker_handle_work+0x5b0/0x600
>>  io_wqe_worker+0xf4/0x310
>>  ret_from_fork+0x10/0x20
>>
>> Signed-off-by: Xiaochuan Li <chuanx2070@163.com>
>> ---
>> Changes in v2:
>> io_uring/io-wq: fix lockdep warning by deferring hash wake up outside acct->lock
>>
>> The stall wake up path in io_get_next_work() holds acct->lock while
>> calling wake_up() on the hash wait queue, which creates lock ordering
>> acct->lock -> hash->wait.lock and triggers lockdep circular dependency
>> warning.
>>
>> The previous approach of temporarily dropping and retaking acct->lock
>> is racy and juggles the lock unnecessarily. Instead, add a need_wake
>> output flag to io_get_next_work() and defer the wake_up() to the outer
>> worker loop, after acct->lock has been released.
> 
> what previous approach?
> 
>>
>> This preserves the calling convention that io_get_next_work() returns
>> with acct->lock held, removes the lock inversion, and avoids any racy
>> sleeper checks outside of the lock. Drop the wq_has_sleeper check as
>> bare wake_up is safe and the optimization is not worth the complexity.
> 
> Either way, these paragraphs should be part of the commit message. By
> putting them after the ---, they get dropped at commit-time.

I rewrote most of the commit message when applying, fwiw. You can find
it in my tree.

-- 
Jens Axboe
