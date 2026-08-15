Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE2539479B
	for <io-uring@vger.kernel.org>; Sat, 15 Aug 2026 23:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786838119; cv=none; b=rT5HAzRcAeBUo9FOA3II+IbVrp5RLF6tVqWPsgxQ2mfs0+Kdnu/sMupb/MA4O6HxFLc9WpotQZdjHwXjIVQxDPsm9XmeODBKI4wK1n8GN5+GhFdGFh/jTY/8m3pi3NkYe9gU8qIQ2Q74hwL7AAgMoV9FCzbv5ZSEZysVKbbJZCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786838119; c=relaxed/simple;
	bh=uiVG5BRdF6wzl8UvphuXngxBH2FNZvDichimYbuOoz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lje4lq+i5RZPLrpZBeCq+KM6G1sKswnxi7vyEUVkybgsXhmm9QY2txlhdFsn5Ell/y8N8QcSl29qn6CPT3QlXADlhpXI0S5gweleQFsdf9Rb0fMtTHtxb7GW3rdQnWj1ul+9koPyySwUX8WwzE8rd5OOuY6uVdf/mgYw37Y4ROo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=R8uTlUyi; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="R8uTlUyi"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6ae88f4e4f4so1172816eaf.0
        for <io-uring@vger.kernel.org>; Sat, 15 Aug 2026 16:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1786838116; x=1787442916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7E6S7GKQ2s6hYsvl3nMmesFf6iKPwnzHvGBsoQlHOFQ=;
        b=R8uTlUyixEIWg7FiA9IKiVrEMAjPInZDOyuTqsRGyRXZtugy/YbUmrFDJB/Ngp/o1a
         nCx+Tsp9A9pneiALZNGaFb0MxLnH/EDmrmfCYzaompFE+c+R9cZ8QcPALWMXZdf7bsNu
         G+8oqdPCKtC4Rk6J4kpMhjb0NWv15ez973Wq0KMP9e21o+mbXBoIStNy2OJfRfowcJp7
         9zOD54Fx7/KIBVbeOQiBLNJ/HEbdDnE+AbV979DD5ZWCXX7fmBmI0eA4PMTeQcKNA8V4
         cjFY5WYgowEhbpPInM00942zzG/IoDiM/ITR0HvgV9J3JaY32k3P0bH37460ta35y1ck
         EGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786838116; x=1787442916;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7E6S7GKQ2s6hYsvl3nMmesFf6iKPwnzHvGBsoQlHOFQ=;
        b=mY4HmGGzpBPBAjSygArDPdMyYl5pGjFJKZZHW9tDmj40+k2Vp4dx/GZTSWsOg62Icm
         vazj00GUVzkbZ8S6i1fWcCpQXoqL6UAiGPfxSBm0QCqD/L+QUO/YlEXvv9WhGScStwOD
         pRzs02FToKEjyfRCsWOzM8T5FOaimCK2sJTtYq7yimy16s4c/hTcH5tmjeJq0nP75mxo
         VnBYWXbqXieidiwBV/k/2/yW4OkUR985XgFnWjx2BcRpV0+XIM5sG7CQbDxfYbVCo/Yr
         iBgKqnjvwremzh4NV00hlIcCsMkPnvUv+caYLx8zVzuFJxZjTHMKxQ+PrrvRbVQSbJzz
         DIIg==
X-Forwarded-Encrypted: i=1; AHgh+RoU/wIhFGKvuaFnbji1tcjdN3tMrJ60j+KGSVvyjQJYUkkAfJkgO2feOXINXdLGPLLnu2NYsE6Baw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFkapoysMM7BJpdauJhEQN87EndpyAYmve5FZ+aMWae/93nlyU
	fEuvPKDied+aS844k52FRTC7v9afaHUBtuaw/jWpm9ss4zOaSA7D4xhy0oHJHav4esI=
X-Gm-Gg: AR+sD135oQ5K4nN2NcE2wqqEjNCLZBUt3Rmrj7J/tPxa0mdx0ATZ7GKQv+GhNZjG2fK
	Fp2UuxPLTyyJAtI2A3xuLl3IqcsdODQABUgJlHIf1Eu7EWmjut+iDibX11Q3SrjMv1/2pNbFOQC
	MWhgpUH6wo6HOG7IYi8u/L4fg1Hat8Rm6m+qlRKrn+G4Zqa69QyELAtdtYvGgAmhdRfjZgY9M1B
	aXPonwmmBNTtXK+o/Bs+8uW+XlC1YC+zcWTeg9InERWEGlhu/GxFGG5sYKtIEOFHxjjRcVyYwtH
	efwEZeKfVSX8NQ/SUKWYiRs7aJWyX0WMGHM71as43/MAx1xUAnyjKVO15LliqLHL19mhEb3wJsw
	XYDLBxvYRITQMDrm8rpCq2PWaLRnHMl66Uhs/lfbyZidlc8Bee8yTsgiW06PodpSc2RcrDTel8n
	93uZD1tfcggtUDAFnv8SGj7TwH3lKjNqr9/0IMrd46CnKl+gdA9P7e8PP2T1xo6rNmpo4hns1Bt
	pf2QncHzbzf0KNJeRwKTAoB/saiPDmOnUJmU63iFA57Sc8=
X-Received: by 2002:a05:6820:a28c:10b0:69e:97da:285a with SMTP id 006d021491bc7-6b0d68b8cc4mr10502310eaf.29.1786838116007;
        Sat, 15 Aug 2026 16:55:16 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b0d96643a7sm5806359eaf.8.2026.08.15.16.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Aug 2026 16:55:15 -0700 (PDT)
Message-ID: <e2e4fbf7-60bb-4e31-a85e-6c786ea43ce8@kernel.dk>
Date: Sat, 15 Aug 2026 17:55:14 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/memmap: account the pages a compound region
 really uses
To: Ali Ahmet Memis <ali@iusegentoo.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
 Gabriel Krisman Bertazi <krisman@suse.de>, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260806180044.275543-1-ali@iusegentoo.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260806180044.275543-1-ali@iusegentoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/6/26 12:00 PM, Ali Ahmet Memis wrote:
> Fixes: dfbbfbf19187 ("io_uring: introduce concept of memory regions")

Should be:

Fixes: 1e21df691ffa ("io_uring/memmap: implement kernel allocated regions")

I'll fix it.

-- 
Jens Axboe
