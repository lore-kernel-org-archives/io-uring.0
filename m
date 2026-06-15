Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE0436EAA4
	for <io-uring@vger.kernel.org>; Mon, 15 Jun 2026 10:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520849; cv=none; b=bvRDFyf65b4yRDV5bw3xE5j5n3GZZRV/ZWqcSI6EP54UMXYCGmrnmJBe6JF9Wums+J7ZxdimLaTyXMFq+JmQsyfwf4xn1L0aOfiByyQQxKO2XEqOJ4xsiLIo0BFh7bOgLjKnAwVCBeask/Lg/91P10w12el/g/9quPQwl5JN6dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520849; c=relaxed/simple;
	bh=4J3fSrNCPDhGA0QB+mqJ0TBAkY6A11NOolVtpoUxBJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eZb8IHz3Eoi5DgehstqSleufzU1MMNgQzj507aPBQBEK+ijrXvN+OP6cGE89gwZdgh5f1N0tzEO1rO2+PUX4qo1h7Z2af55jrEpkATtABLE1wrv0Pd5ZRX9kvhxI4fj4EAP6cNpd0iCCfTj4iW3z2w5VEkNVd/PJkQvRilrzGLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CT26Ye4a; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CT26Ye4a"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-68e5f7c1131so5321548a12.2
        for <io-uring@vger.kernel.org>; Mon, 15 Jun 2026 03:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781520846; x=1782125646; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hP70DMXPOdSRIBKba6A8xHTfphyJ3bhzhgpyBfZO6/M=;
        b=CT26Ye4a9Nsjwk17tW8uSg0q/UHqDoMSghXJaNNT6Kg8g7wJFiZ8Th7mYnqgKGqpUv
         hkIp6y9nut+KOsGZxH9no7DZ/orY0lmfphAxsaW9FFWQvDvesLRvGzxoUhEdpO/isbCn
         f+jDw1lcVAiHc6/j0k1gcbKh0jqAMPNr2J7zFxTU1db4RV8xTbDAVtSEw+FP3ksl0Nuw
         HPJPWN3f7wjDbXTa3tQao7KC5vb+BeR/hR4Vdo3RPJ/K7wgNoe5LXJLz2EbGC5yn8BRC
         ej30f6ZskjsJSGHNvxlD8lyngcWURsgxMeqrO4V1qyqu2niC/Hq+77U8azvm6vJVBgjc
         /NfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781520846; x=1782125646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hP70DMXPOdSRIBKba6A8xHTfphyJ3bhzhgpyBfZO6/M=;
        b=TxJntWnNjBLJaP19QvHVIlIB84EDc7OY2+pCh1YOVz5E7NevjbCnjjRmm35qaS8I9f
         qpTCBT14ny3H9t1b7h/edaHewq5TZEyuK59Cd7QIp0vmzCrVW2AtlIeVZ+3hj19aQUso
         EB8m2Ms1zufqGhsKYPXi94h2iQeg841H9LBY20XqnTzujopJTpnk0yjbu16tZ8EIgXKw
         ELveIz957TY585JP5oI+Hgip/Skb+IIfHhS4EUWnjPAh+YcoF0CgvtkcAxm0QIDuL2XZ
         XjxV21iIIm7siIPrePo2mA/5NmET3KAVCz5Q1OkMnM8P6zk/zGwCzMAJEYT9Rv3LQFXr
         pkUg==
X-Forwarded-Encrypted: i=1; AFNElJ/VWoCKQ0IDlkS462BDfCeWkAdB99btMgcOXbJnHnI93TZgFZ0ey5oI+29xfRZptg4uhHjTE8ar6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Ff8Dzrl4IFdEsahw4+jtLgrUqLi4l9bkeyxaUuo+GD3vDn8Q
	ivV5sc/SeW5Gb4zcDGcPNWbmda3A/Kk0ZOZfwbGYbm4E/d9MXfumMuE+
X-Gm-Gg: Acq92OHLQay7EmHVD94R8S1o1evdlVE9wt1OysD1L2Ahk3Y0oBRFbThsyn9+ytQ0CFP
	gSWYK8ven6AodBRuEmoJiA4+Rqel3G9Zq2Ffc79u8CzdH5M85aR1T0jwrx/gJvqP5Gtpo9hBy3I
	wHpNWHCg0m78rgfj4OvyR7RnHHABR/ePFepTZ2Qv10U+hgwas5YYNeC/hd7+Cl3Y1tSFwglg2lS
	aKKbsdJ+/zYI8VrA5eymNAY6ad/gAW2bDtLDGaLVoMfVqREzsZFEKk41JapJee062PwkZAq6GGU
	48PdyBFre5OJgffcel1kdA2xe5nVurMtES7pbDQr1g0FMfkFrIeqV22S/lg9cz9iu6WJaJ4jn4w
	mAcFfYGWd4xjcK4+vq6YFbK1enQ8R8TS47bimTeWXibcX7+x+gJXLaE3RXd7CsD8dDVDAiEFVFM
	NafIDOovWYR3awBqZM0e7WxQ77S1YNYzafunI+j6np8PSUvlunUZZWPnODWM4F3ltwaIEJUBbiC
	+qRQYFlsMWkrGudYVkcKKZ3ekEcQO0Fe8HK9VbNX0G3aqbNp9pe7F5jfgFkLCFUFyJvfg==
X-Received: by 2002:a05:6402:42c6:b0:686:9c15:3121 with SMTP id 4fb4d7f45d1cf-69378600b25mr6363559a12.12.1781520845572;
        Mon, 15 Jun 2026 03:54:05 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:2bf9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6940c7456a8sm1879319a12.16.2026.06.15.03.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 03:54:04 -0700 (PDT)
Message-ID: <991fd6d5-41f6-4cc7-b6f8-d56e4be6c638@gmail.com>
Date: Mon, 15 Jun 2026 11:53:49 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/2] netdev: expose io_uring rx_page_order
 order via netlink
To: Dragos Tatulea <dtatulea@nvidia.com>,
 Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Jens Axboe <axboe@kernel.dk>
Cc: Yael Chemla <ychemla@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 io-uring@vger.kernel.org
References: <20260612211709.1456966-2-dtatulea@nvidia.com>
 <20260612211709.1456966-3-dtatulea@nvidia.com>
 <d0401fab-61c5-43e7-93ae-d4757433eb7a@gmail.com>
 <b581d253-135b-4c75-a50d-2049c6d6e249@nvidia.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <b581d253-135b-4c75-a50d-2049c6d6e249@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/13/26 15:09, Dragos Tatulea wrote:
> On 13.06.26 11:53, Pavel Begunkov wrote:
>> On 6/12/26 22:17, Dragos Tatulea wrote:
>>> This adds observability for the io_uring zcrx rx-buf-len configuration.
>>
>> It might be nicer to look it up in the queue, e.g. rxq->mp_params,
>> and make it a queue attribute instead of zcrx specific one. In either
>> case, no objections.
>>
> In io_pp_nl_fill() or in page_pool_nl_fill() as it was done in v1 for order?

I didn't see v1, so yeah, I was thinking along the same lines as
your previous version. Oh, well

-- 
Pavel Begunkov

