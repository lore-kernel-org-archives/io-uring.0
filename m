Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8441E3B27D1
	for <io-uring@vger.kernel.org>; Wed, 23 Sep 2026 16:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790182371; cv=none; b=WcD2KeJ3V2QQZiiQ60abtj2M2rrnR4JFikSAUVh4bWnot/MJgpEVT1apgWRPNJlRFF7+WRvmL80PV/gY//8MFTKbJvQBCgyJNkHLhNhNk85PVcSdRKydlVm1Pq4LkvLlBV2moHfTckrwXFiJjdkVxrPYdzn87lpKPL/jYP6mS/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790182371; c=relaxed/simple;
	bh=ZsB+iNtZ996/IRzwqCCTAIPrmIEIkRV+EK4V1lIlZc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gdJLFj8KyvhboBLKWHlldNhpagVrHvHiTA9EQ11h2xZ2zazoiq7/c0YTO4ZWFDf2LuqD3sKhgYnPAm/JcOXq63yM961srHJtQB6SxWMERZAQZi/LZMN3wXTNR2UP69XsI8lET42apKHqulQxtCU6IItnN0rJqHCWa0TK6qzdrRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=aIUt7wJj; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="aIUt7wJj"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-805010cbdebso41381a34.1
        for <io-uring@vger.kernel.org>; Wed, 23 Sep 2026 09:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790182368; x=1790787168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YIExK7C+1gjxck9oYfNX38MM4fuWrgyse7e3gdiUnPQ=;
        b=aIUt7wJj/574RO80uOCIXCo5gUmXk5OmBl4YJDmIQD6OS2Q9Hkc28nKs+tCiO+CG/A
         Db8oleF4h+0WTG/4UVcOqtDOGuSWI+XV1qMDztrXPaom0sz/+jbgQUzn1WS3OvtarSPj
         V2S0enXCVm6mL0kDLTdMLz3iuROVUlRWcJKauPd7rdx0l4h96rtmW0GbH+ai5/EpHBps
         Cuu7Fop1DN0QP8lddkZZfbkJoEowTKRd9gvNvf/2AxSRyH87DL1CMZo8eTyjGf99bHiq
         mEGzNlZ6A1jKvP6hpIepESanRGok1ytupdIn6LsnKH7fIi1rozCvaR4JAiT8B5cApiO9
         THdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790182368; x=1790787168;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YIExK7C+1gjxck9oYfNX38MM4fuWrgyse7e3gdiUnPQ=;
        b=cYqcg0N1p1yRAw9Jf+ECykuGjpAIPjGiDbi1qucji1tQPkU1FKTEoU3DFRvxkgDw7I
         G3xuW05HwJ7Ao662ixN7tnrupwGUIJdO59YZl8ohenwdB++Pm+0tAc2jOmGKZzDvnnAv
         j3gTsqIPUCeKogsk7oL3LJiLjwmYLnEKeyz/0eKBUjhQk6OvYDzCkCJKHZSWwh/zU0nU
         4oZxYCgQRqO3AxTX0RRA1yu9gsucL+eCVOFI5uYg+VdvrGlWP1K2RjAamC3KAjet4fDk
         hs3V2MVkiVnVngJNMcmmxj1oAWtoInPklnEQRNEcxef8m1h7eFLfSQzZsHtuH3RlFnks
         17IQ==
X-Gm-Message-State: AFuF++lbJBi71rkPaHhpqLgzc9dWa90+aqbQ6pQrBj3m1I71bFYe6stF
	g8g7UL5MkOUbd0nCHivOIqVGUUXI4KT34jAhA/V3++nxvSb72x6VX+zINIfJltQ1gj8t29HnIuz
	BnuxFvME=
X-Gm-Gg: AYBFou2VrWo2dJO4ZTy6BzZVuRoDCtIe2tvPKkqANstiabsrhZNvilJrNbtFCKxY5H3
	Ucd2y226zfLtGrZJT8fIeO9Nq/n9aKJ63HC4lSnCgZUxebSawAoBQSbkM8dGw3td2KCC7tN4mRB
	IKqzxv7XDUUQN6xw1eYbkRq9mT+7BIe6V1kjuCnmu7DCf16Wd+Bt3p/y4Fcn5YwkXoj044fk2Wl
	9DgCPePKLpMnjzi4e0Ld4ynLsp61zJFSvUsL66d8sAITYuMwuoYeC8EJUtIS38GPqoaTolx7LNS
	4UMOklpBfh40pvt5QQWEWHr8fFSq15eGd9s0D8k4U8N4S+3vFo7YWS1xXAtDIICe8WBFMGSvM1/
	QGVaa2tcc8hOh5VIR5OzRkXxBmLrp5jIUxP+F3vz6zKbcWiJebyrV+xhoHfS9jHWlzhwUeBC66e
	Nb1eze/AUMZ6zWM7ABuQE4eDn+agFezC1HbANdeetrDGBeNtWoFLeV/YDYpURPEuvOrbkm1GBtq
	I7k6Lj0lxhJ/Wp1UzqVfZEC8+dkH8yvK7oI0FqAgzWR6g0HCEEVkaw=
X-Received: by 2002:a4a:ee06:0:b0:6bf:ebd9:6cb4 with SMTP id 006d021491bc7-6d157d8a169mr5153217eaf.8.1790182368245;
        Wed, 23 Sep 2026 09:52:48 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4908efd9a67sm2238154fac.17.2026.09.23.09.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 09:52:47 -0700 (PDT)
Message-ID: <35640d8a-4a6e-4e86-b553-5d5bdcba6e1c@kernel.dk>
Date: Wed, 23 Sep 2026 10:52:46 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] io_uring/lock: Keep spinlock release before wake_up()
To: Xiaochuan Li <chuanx2070@163.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
References: <20260919123021.21318-1-chuanx2070@163.com>
 <20260923161622.25737-1-chuanx2070@163.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260923161622.25737-1-chuanx2070@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/23/26 10:16 AM, Xiaochuan Li wrote:
> @@ -574,9 +575,8 @@ static struct io_wq_work *io_get_next_work(struct io_wq_acct *acct,
>  		unstalled = io_wait_on_hash(wq, stall_hash);
>  		raw_spin_lock(&acct->lock);
>  		if (unstalled) {
> +			*need_wake = true;
>  			clear_bit(IO_ACCT_STALLED_BIT, &acct->flags);
> -			if (wq_has_sleeper(&wq->hash->wait))
> -				wake_up(&wq->hash->wait);
>  		}
>  	}

*need_wake = wq_has_sleeper(&wq->hash->wait);

? And probably retain the sme ordering with the bit clear.

Apart from that, I think it looks fine. The lock shuffling is somewhat
annoying and inefficient, an unfortunate side effect of the raw vs
normal spinlocks.

-- 
Jens Axboe
