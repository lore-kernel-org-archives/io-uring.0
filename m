Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6BE3DCDBF
	for <io-uring@vger.kernel.org>; Mon, 14 Sep 2026 14:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394452; cv=none; b=rilvGmEhNMUwWiSRN16PFf1FGvLgR8PXvlw3ijBccTyTxm1dBuvdlqoA7zVAlH04H4+/hFPrsPd/L2gzCqUlJ/W8GwvDe7bgH/8lfCHNsJhmBntD8SG0+3D2e3tdg4VBerjSMRhAlThxhsBU5ZI8OippRrwcO+HWa/NzXViJf78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394452; c=relaxed/simple;
	bh=oXMGmsS6Ytd5IMMSrbmzSd7C0YlaZQ5+z3HLbVOw2iE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3e163iP+bL1eMi++IHia6itA9btzhUawyWgexqm6lwTz2keT4KybURr3UzvLBcOD1IQs1UppQZ0rsTLP/F7MpGTCKilKDrb8X3FPOA8deTBrT8yAQZ0atBrTi8O5wLSNboc8Zaas4mbBJQ7qjkY5gRqX8RuFY6XqFgG6+bXJpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=E8G9PjKo; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="E8G9PjKo"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4843e397f74so2011300f8f.1
        for <io-uring@vger.kernel.org>; Mon, 14 Sep 2026 07:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789394444; x=1789999244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C8rQ4wEtNnWG7AMNoujj40yCkBU87VJHpgDk71+5KS4=;
        b=E8G9PjKoic+aotsi2o7B/Bar+Blp/5zfAEllSF+wYExH9kZ2VB4OmcIewSy+D1j1nq
         AOOAWTmsVpyJP4o76h3mz5dfhTy7ufRFGbv6Jfomh6wyGd7ZRcVQhv/n05mIF7JqSLjv
         ohCTH9Z3yPEYUGP7m68CCqJp8Bhx54XDwvXbZeOqEqWzYbezgjK6VtBU/ECMTqyxF8Wp
         6yHiCYuFXpLFwJ8OT3zORWbw8L6yX9aDyi9fUjhkSzytr9S1Q+4n7z6BFkuqCHPTLR8e
         rLEAVG4IzanHGp88mIdSGNR6jWiV97L1BfRz5t5CAvWF3EE/9OB6Irw1nLscVJ4Ju3IW
         2/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394444; x=1789999244;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C8rQ4wEtNnWG7AMNoujj40yCkBU87VJHpgDk71+5KS4=;
        b=KlvFwG+6fkExB2qLWj9Wl1Tzq36059kLWwsxdnFvdBYex9dRkC9xnZKVC2KaQz56LL
         28PHqAaEUi1nGnT6OSIVqTUb7Y9WwXTG2uYiDZ6vAeVatnLTnSHrW170yV/QRskuEMtT
         /dnhN1HRgi7opI0IaEs2BFn1i5WsoRO2xW5KXTBQRV+uMpVCGkXd89DKRJmAPr9MtCQY
         nLZIwW70trnu4tF5dlcbo9IFvLP9pUOYiKlVOjKP2l0HDqWV9WAYoyhpE6SQ9V4FDc0o
         LGhQ5VGx4c8Yyiv+vy6aisphrfdamg3m+Fk4iQCqEko1JGVi7e60CeHcCIvl0rFYHQHw
         k7Lg==
X-Gm-Message-State: AFuF++lQ3EI3U1n0VCAsc3a9MXmUwPI4G8/6Q5LQzcMLq/52kWxV85jS
	aePmPVfNUmO5o5xaIXS8TFpyWOPROncXstphWvY2mpI5sW8fZ+Vc0LzsL9l++pFrLiRkd98gY+W
	27OKqwWDnIA==
X-Gm-Gg: AYBFou0bFQYUn4G1JAjh7yqfnc2W0F4hmR0rTzhBXSSMLrP/CMBka0/cj5BNXSQfAfo
	e2+JAN3Nmoqv1HdTwMTvs02S1X8mygoGPrxTOeOgBsNcjDvyjHdQDqR0XFRoKGVC87yP/04PUXm
	Eu6XUfJpwM671dfMOP6s3Xwy/ogqm4wrnXSm6syIE4AaDSxOEGIMMoqCIHF0fN/Cats/XOkgFX0
	ZLTApOrT/nI6MuSfpwPUYnVNIrPtI0ZkrNssIb2cmk4Ec7b/NMy/Yx7LXJiszSX4Y9sn0+PiOZc
	4d6a9tGNwxWL75IoIuGfe0Bue4d5phYwE7RKZpkV7GZzOpIo4eh3QHEv/IdhC33QWKWiEgDrHRX
	3Fr8gos0LUIYNyAa7ZJ1gExWxc3H1quliFVcQEgrPWWw0cnrli+RYeHHBBoD4zxGG11effbEnHf
	vOBy7u8tDFSa1/VnYn2I8OzGgkIeV3ppFtFtppEJ2KccqDrLfGnq4RdYdy0uqGZnC390VDoJI5M
	bAXlr9fvavfrL8X1me4A/6ig6AWcdpHpSppvljffBhnuKXQ1lYEvxDZR4dRzO8Nsrq0ZIxClrWd
	vz/Q4zHNj5FERjslk3fLezfH9Q==
X-Received: by 2002:a05:6000:480d:b0:484:361a:1c7b with SMTP id ffacd0b85a97d-486fc960e59mr8495354f8f.7.1789394443934;
        Mon, 14 Sep 2026 07:00:43 -0700 (PDT)
Received: from [10.160.16.196] (150.red-80-32-100.staticip.rima-tde.net. [80.32.100.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e81asm28641670f8f.7.2026.09.14.07.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 07:00:42 -0700 (PDT)
Message-ID: <73837a51-e163-4b4e-8be2-4cdc044393b8@kernel.dk>
Date: Mon, 14 Sep 2026 08:00:41 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] x86: implement thread identity handoff
To: Peter Zijlstra <peterz@infradead.org>
Cc: io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, tglx@kernel.org, mingo@redhat.com
References: <20260911154148.644489-1-axboe@kernel.dk>
 <20260911154148.644489-5-axboe@kernel.dk>
 <20260914114656.GC3500130@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260914114656.GC3500130@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/14/26 5:46 AM, Peter Zijlstra wrote:
> On Fri, Sep 11, 2026 at 09:40:54AM -0600, Jens Axboe wrote:
> 
>> +/* state bound to the task that neither side may have */
>> +static bool thread_handoff_task_ok(struct task_struct *tsk)
>> +{
>> +	/* I/O permissions, the bitmap hangs off the task */
>> +	if (test_tsk_thread_flag(tsk, TIF_IO_BITMAP) || tsk->thread.iopl_emul)
>> +		return false;
>> +#ifdef CONFIG_X86_USER_SHADOW_STACK
>> +	/* the shadow stack is per-thread and would have to move along */
>> +	if (tsk->thread.features & ARCH_SHSTK_SHSTK)
>> +		return false;
>> +#endif
> 
> Distributions are having this enabled, this means nobody will pass this
> check.

Ah good point, should be feasible just by swapping s->shstk,
s->features, and s->features_locked. Traveling right now, but I'll test
that for the next version.

-- 
Jens Axboe
