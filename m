Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105767;
	b=xqVMbjUBpbkn4N+uimIzFJHD5JsvsFctHc84tv1jWqPArxil9JHXSBMaMAx8IzpKiLMg
	 hJ+kxIv4fWDIjJaudwG1eLfHdI2uHl4odWzbIVDmdx+O5JNMVLaysh2J8f/KibLyjjsWB
	 ddaqpRY/WMKoo2QjFTE6KH/w9hfmtH1Q8rYv29S1/XC5zuoZOhjmn8GAh0UB8rFmo7Ccv
	 Nkip/uBY/kZOMQ1+n0dFJ/mQk995xaJrMhjHmcbHMYhNlm8Eo1CD2PRS1hE+5yer7cuK2
	 LZkVfBrGme7vk7dX7Z7Rh7OGwtdZHzVS7LJDGqelvgcoFZ2vMwVmkov5ZGAzO1WLhCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=lcXO+Vd8p/zIO/CVoOpxlqwT9gefkkK9PohzmT8jAVo=;
	b=bO3tCCBobdwT4cQjvHvqB4Zu9ztY5pqz/fpSCZeaSSPGo/SplEO018VIrSIzNKPy75lF
	 kouWeEPZZdRFCYdnVwVZcgKtoEwCs+be9c9ytbEok0tcOSak4YohpDQiMB/F3tI6Ye7B0
	 fr0sYAaF+yfi6I+S9p5ZfrRvHmcMcJSLbYn/krU8/2DCr1wqY4pn7BE+rLM3L6auAFGst
	 FXRUPwT47R8YV6sqiVWVrB5VnnPrWkSDEqGAgh2eY+b5NT4neNn+2OmjeXRSPFNK8EMWx
	 jXKu9+NtjgvYRDAKX6GIgydntx8c09iR0und41VrygfFM0zCKuqVV3od/hEvNXz17rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286A9606A31F
	for <io-uring@vger.kernel.org>; Tue, 27 Oct 2026 12:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 286A9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a2761c69fbso3116983c88.0
        for <io-uring@vger.kernel.org>; Tue, 27 Oct 2026 05:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1793105764; x=1793710564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lcXO+Vd8p/zIO/CVoOpxlqwT9gefkkK9PohzmT8jAVo=;
        b=oBNbWBMqejrGY89fgbOt84PDcmNTYTRzwo7dXYm2kKYVugiTtHm2ZRf6xPFRETFchB
         e7Bfe7EplJmnyZJHxSmEqnqLF0apjP9r8aTHoa5QeUL+bAlPMFtQ9KPjpctTYhkk48Zs
         GuRD3ZJsnpqhQipbgNlbQtgHjz9SJSTDtrtUbMHj1rIHCMUdr0En8+WSNRORvJC/skfp
         jakziGpSo9AEuV1mNNVR2uCI/3+MrUf/EdOW5tpzCv30bFbfQJ9H6QO7IY0eS7+pnb37
         LQN18Vq4yUx8IHSZdyAQgT0jxb5HH7S3m6Ds4Z1SI3FeBf2i7Hwcp2UBmQNVZq84Tyl1
         AO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105764; x=1793710564;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lcXO+Vd8p/zIO/CVoOpxlqwT9gefkkK9PohzmT8jAVo=;
        b=0un7x01nfLBM4A8F732qR8B85p5eb/HAOaPgVgRHdMCZ0n257RoDCmei5O6pyXoDkF
         IEOpS1GTcYklXbLPOF3v5xrKthGtb8uYF/wHGweiEK8IM2F2Lyq03q0aa13kYcEB5iiw
         fu+Plh8L6D8fQR81PdkJ4zlTJRoKimA9044/EtfiUUplKLElNEdY/ioZMaAJ4RkIju5w
         YNW12pfpkzyQrFjGeavcjHHTm8ct4jmKJy8HE6v+pfGUdJeaBMn8iXAP+0MOs9bwT8vo
         Ml663fOEKPrDoE5bQC3OFmamUIapvJcs9lrQyPD5Nl+9H6ZgF4wvLPfyOJ7S6BdXV9Zq
         BnVA==
X-Gm-Message-State: AFq9FYLftw5gqkvarWcWnNKfqJ1oYqLuhVmF5lkHvWplBN15izvcA0j8
	GAJIpOL1pvfRwrByiy3MxVlUmk+wTldJaKNZtxCfOYXwAn7Y5PZwicNvf3WO/4JNeQ4=
X-Gm-Gg: AYBFou0/Y6f52dwIgGjwOzdKC7PZyJQ0lONol97D/DdzLzAPfX2i7hlra1TaVc6b5CG
	rCPupcmjIB1ZTfRNSw1lV051lmljAm29huZlHir6lA+TJcNtDqETeMOkOJkkftNvS0QeuyDEAPO
	juhIG75BBdR5rrF2HWWbtRSNwSe91Tq0PLG19dzC8Q09hYDxXDnVZpKkJsFcBZB7x3hGxB87etD
	m7H7Slm005sNm+20B26bfS3eVb9omHgQ3Ei37q0dQsgS9BFygKo2N0Hgj27yGtwnjcz5N4iOJsJ
	KFK/slpdmLUsofbCYpuoE4Nbf+7qqUj7wL4gvQJ/TAIB+Ae/u0jqfuI9CNkSar4fK4STnk44Kab
	AcE2ttE+gcjsO7vWoi6t1opTiM+qVaDIxHn70htts5VhEjIRTJJSC/f70a/eO38fp0aLnxGjuFX
	1nuyj9OVlUIxD6mpPa16NrSUiYV74DEOU20OxHoalUbC0uVKF3iaf71TMjf7r7mYARskmfZjJYE
	apj9ubUyIVJVR5239Er71w8jOvKTD3wCnKVTeQyFl3mGf5rw1uTL9136Hh7+lejfTlJVKbybTIj
	hmzMSSEVdWLn46Qurqn0kHdznYCoyH6R/5GklOw=
X-Received: by 2002:a05:7022:90e:b0:194:3a84:e67d with SMTP id a92af1059eb24-1993f6d2c4dmr19379065c88.44.1793105763829;
        Tue, 27 Oct 2026 05:56:03 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a58093678esm4301247c88.18.2026.10.27.05.56.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:56:03 -0700 (PDT)
Message-ID: <5f575079-a2a1-4f42-ba1b-204730a5402e@kernel.dk>
Date: Tue, 27 Oct 2026 06:56:03 -0600
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
Subject: Re: [REGRESSION] io_uring: requests can overtake consecutive drains
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: io-uring@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261027043323.98916-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261027043323.98916-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/26/26 10:33 PM, Karl Mehltretter wrote:
> Commit ecb6817b769f ("io_uring: end the drain when the drain request
> completes") lets a request submitted after one drain overtake a second
> drain that is still running. This breaks IOSQE_IO_DRAIN ordering for
> both standalone and linked drains.
> 
> An LLM helped with the review and reproducer.

Please have your LLM also make a patch that you can send out,
then you get credit for fixing it as well. Same goes for the
other one you sent out.

> No privilege, special device, SQPOLL, or unusual setup flag is required.

Puzzled why this is necessary to state.

-- 
Jens Axboe

