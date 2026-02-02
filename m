Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3349B4A3E
	for <io-uring@vger.kernel.org>; Mon,  2 Feb 2026 15:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770045248; cv=none; b=DRf/ziY9C6m6VmmbQny1SmecIbGZhSAYvTML2TfHKGwcUbHrTNZkUQNa6tvna7jugEHmxQiP6vmXHKo0qtLTspOZ49wKTGvX+kPO4z+vUfrl2jIDyjwTmV/tGn4Q6+6ikh2sskZZNE7o+q6mmUgbDdnHJd01+DzbCap+wN2KreU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770045248; c=relaxed/simple;
	bh=ZiBEjYVQ9M0PEE3B2ufXiCV0Cdly5BdWFEUv0X3/XuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rOa8dB2XV0unU3zHkDSS2xyE57OzH2ExH2rSFwXfWAH9/1qKFXrvHgxtbZI8En+2c+ZSBnm/GTlN80sjvmpUQTlCIpwOE2vHa6aJ4+3mJ4tTdcmdYRtlkU7NjxX2Saud2GOZ9Z8CZtJDVD3dZrv3p7UUUVrogn1yp05Bz9+j37s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=alK/lEMF; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="alK/lEMF"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7d15b8feca3so4418554a34.3
        for <io-uring@vger.kernel.org>; Mon, 02 Feb 2026 07:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1770045245; x=1770650045; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lMaY6Qok85hs+JSmCQPPpCVaeZbf5+UuEw+347Ggqks=;
        b=alK/lEMFumS/9yzzmhcEkiK/5F6CyAybIXb12DbUjwHUM9fFGwpv1oxlBYbPxNwNJy
         s7RHp1BMODE16tdgOy+Lx+seJJB95+5myHRTm8ieVJrKq0u/shZaOYFCPzCkoHDZUi1v
         VNr697cL87xdxwNOdW3cxsnXOFKJiejfsEWJ8UJERsgrD3qEo3apqycCy3taU5cumI8n
         WtEOOUf5aU8Ic1gajwphis9gef2LB444+uM3dOJ+qDxJS+VeBac/TdlrNAMO2l60J/Wu
         FjivzLLNytLrMhC366GlzqylFEGtTW+D38mpyCoQwV/1O3zayN1zR+rQ+1AzXWx6eoQe
         Uvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770045245; x=1770650045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMaY6Qok85hs+JSmCQPPpCVaeZbf5+UuEw+347Ggqks=;
        b=FxwHDljdS2GQfCUmx6HTYtNirAklw8bGdHe3Scs3Ig1LElwpT1MfUiLIS8vSfxrpnL
         +bOiOGzBGKFWOjxIX2woDRtrXuz6hy4ND/uoU1xB9lCl/xJ5VTJVNeQ9SdBRZ6xnBcq4
         JAl7O6HO8w8hz56c0hPJoldNem4LIIITZb/jI1rDDyV+HnMv56L48hMpluOPYHugIJpN
         8YclhhFWBYW3xlgvSGBWip3CLwCmhSOZgi8QgOzPWZTM5SXurTr/gI2gG0jDHJNoMcAC
         AS1ER7Eu2/QjmOWktIKPgstEm3uHzoNqIpmF66t24ksC+tAN+3VIIlX6BrAZ3cJinBYS
         cNkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZUBOOA8Bze8V0BqPoYjZbgydh1MZjRoJzHN4zjrEWyuMDd2XEwprAQ27ojcR6pv0dpMX0yF1xRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0iYKjfQVHMLiWc3uEpkFlDh8Mzo5HryrFSwMPa9AZA3gy3Myc
	i3dTJSG88r8jiSWK/Hv24JbM4lsoBrFK5AR8gsYf995cEpPBBuNq10jul8gXtMlZDMRGJ5gz9pP
	Sb7n3RqM=
X-Gm-Gg: AZuq6aLPNVA2MbwCybVXGzeou6Hm5uvSRqDHGa8bFxq5XdI5AoXn//ti75zylBQmXpn
	rlSxwEAIFG/JR3fZsS4ES5XfMwamLvXyzTFGINFBQXKg/0ccwQALNrGJQYCvJZN9mOk2M+ag1fM
	n+rxtXCeKD7sH19sWhghB30nU/yaN03CqdJYrZ0HuTfjkBhU+rncw4oxahCOhh8QT2DKzaLT1WA
	AQ869hgAmzdCIT8ZQl1reQdD75JclaMpHVgaMX39lBeoENjoAR3xm4ti2YVvOkmHtq2tQSYTkoT
	3KGN6HQ0Dj2+L35f1LzVuGovhZX13Z+BXcYKxp6/XO/J7ZBiEXBTmgVUmnQZBQrIS7ELIdD57/b
	LR9D4OCRbUkcwLJxiEnIwwoRlnG5vAuZTfTrkD0sud+gxzh8aoAvJYqISfhtiWtq4x/g6+yauz7
	lkhlDVV6/V/PPr+3V43evBF03tMU4ModrGasoJ70GFoJEWNvx6SfaSLHy6zQI5mazRda2vtSLMF
	slhkAdH
X-Received: by 2002:a05:6830:67e8:b0:7d1:49a9:6b53 with SMTP id 46e09a7af769-7d1a53910e2mr6429290a34.33.1770045245048;
        Mon, 02 Feb 2026 07:14:05 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d2e5aaa82bsm4332783a34.1.2026.02.02.07.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 07:14:04 -0800 (PST)
Message-ID: <8d675e0b-346d-44f1-b21b-e6c36d9230e9@kernel.dk>
Date: Mon, 2 Feb 2026 08:14:03 -0700
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] io-wq: add exit-on-idle mode
To: Li Chen <me@linux.beauty>, Pavel Begunkov <asml.silence@gmail.com>,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260202143755.789114-1-me@linux.beauty>
 <20260202143755.789114-2-me@linux.beauty>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260202143755.789114-2-me@linux.beauty>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/2/26 7:37 AM, Li Chen wrote:
> diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
> index 5d0928f37471..97e7eb847c6e 100644
> --- a/io_uring/io-wq.c
> +++ b/io_uring/io-wq.c
> @@ -655,6 +656,18 @@ static int io_wq_worker(void *data)
>  			io_worker_handle_work(acct, worker);
>  
>  		raw_spin_lock(&wq->lock);
> +		/*
> +		 * If wq is marked idle-exit, drop this worker as soon as it
> +		 * becomes idle. This is used to avoid keeping io-wq worker
> +		 * threads around for tasks that no longer have any active
> +		 * io_uring instances.
> +		 */
> +		if (test_bit(IO_WQ_BIT_EXIT_ON_IDLE, &wq->state)) {
> +			acct->nr_workers--;
> +			raw_spin_unlock(&wq->lock);
> +			__set_current_state(TASK_RUNNING);
> +			break;
> +		}
>  		/*
>  		 * Last sleep timed out. Exit if we're not the last worker,
>  		 * or if someone modified our affinity.

One more note - just add this test_bit() to the check right below, then
you avoid duplicating all of that exit logic. They do the exact same
thing.

-- 
Jens Axboe
