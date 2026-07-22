Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D64C40F728
	for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 10:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784716103; cv=none; b=KhsnZbGaIaHYUJk1K87uEGTrDp80PAnuIlUBdfbr0ufcArCoBPPFn4nHgoXeL08KbG03Z2EpVobiznX1dRxx3C081MadOPc2eIFm5eELFW5RMaAWhnPK9ePrkuV8LuRrlRHAIVU8yx3Nwo18zFYiHr48dH6sgijEiSJC/A7FikA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784716103; c=relaxed/simple;
	bh=x+jC9SvLkkbRmEOaC4cxo1SXdeTBk77oc3xMIu9uoDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nmVgQ+Hea7mQCisPWW5T/dBM9JGoz4SI1OVaMKax5GUMky3LQrsjl4LOfz5QbldfdnwTMEINtUzqQzWCgX+qIEn22vob2EorzYAqRyZhIQuEFMVSjYeWQbva7KFNulx01B9NbHoEFNZK26EDSxPJO08sRdHLk6My76vHQ0y36rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=OO8NUrPB; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="OO8NUrPB"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6a38d7904b7so1082794eaf.2
        for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 03:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1784716099; x=1785320899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lD8ujY0ZpMamDWWFC42/AHbZ3FOtAxMxvf+xDgvcYxk=;
        b=OO8NUrPBl6Ryj3xLyBxvu9tlNqdjzqm2FkpYTPkNgzP+PzfjLvAw5Vo66lrBY3OCOB
         Vex/81DP4kSs54mAOtMBSFKlTOnw2B+ngbNxliWst54jz00pepOIXYGg7uGrqBJlztLF
         TKKI5PJ2jPl6JKCOoK8Ygm+JvJMdoh1VeQenft/oU7cQ5vnfmcbZ06Hk1Af1C9pigDWs
         GLCVyc9PvBIGwREkD2ywXAzPKvRrMJUqoeFnbmTThIrzhe3tSHF604wJX0Kzl05LR+g4
         ttx+vzCY9Wzzcl7I4OlRFxUVLcaw7KdXTfPq0PpebjMRajbHmP8jeMA0BacrqFU3qrfF
         GOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784716099; x=1785320899;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lD8ujY0ZpMamDWWFC42/AHbZ3FOtAxMxvf+xDgvcYxk=;
        b=ezXnSTVAXZHVGnJnw9xvwvGjZC2f0+GNSG+GmE3kXP8dVFnIUhM5n/NtalcZAVRdTE
         /3A/KVqeM/BJk7SlxEZqpKzEuyOBRV/OA7wt2Y/ClLEfL98966xqcg5NRPlLDqNLmrWZ
         5EL6kiD3UyOLtJvWlbwdz4jzreJYlnZhiplS/JRKeW4JnrSh4RRXd6hWuKWK9Mt2cuL2
         AhoeH4pFt7WH+qCstzUsz3h0p7YJMx+UhiaOqBKnU3fPjeQALgsbT0Yqv4y8kjMMpPDv
         wGy1dzvYQH459MqDQ3gEfomS/ok9pXpesueKCR3tvxYmAxYjPgCIbz4ZdB4l2LxM6TJL
         Y8ZQ==
X-Forwarded-Encrypted: i=1; AHgh+RpAEof97NdKbruW4ww/nR+SV/7pghuqFj1j5Tp6mkqo/jidQ6qELo3uyQ0mkal0Ask1dAnc7bYUzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGm1yFZfRkpHagB7B85MUucCiQfURrae+NqOiMhbcSPUQXVGk6
	kCELpLiSmpiSVuk7K8VE5wPnIUytYECd9+5weBSfqGGMwj91/rKQJt7sI96qYwy+UbI=
X-Gm-Gg: AR+sD115Uv/ZwnpiSWFwdB/obDng++by9MsAuWep0SCkvtsXDHcGCvP7u1aPlHBOmc6
	sXReMyc/7tnp/UxBkEUqtzyMVgnqu9XUg4aEmB/5ZU+RhOEYLSpvBOnVc6vyi0/UNgIaH+/ii7N
	/AnDdncwNIoftjc3Jr9zNnsWVCZIsB+dEdznYk6hhfn93mWn/0E/4g9VC+OACjdYI5qxM03JI5X
	Y0KNLy9bOFzObXOd3TqpoQ0UCbYJY/Zsa689Zf4xJadQeO7KQm3mfrWwOAurodi7tzi/I59tNsp
	kfeN0Tto5lpBEaw66oGsvO9QkVdawIdr+5/aFaf8ySRaZIKGqMo+2DE4NWzmhCqobj5tKEpteZV
	VIplTLJ59/nyZuK9BFBpWNPDcxZDa7OYeD4Is+ptIjYDPZ5GSYnE2GHBfakVmWA72mUeDy2F6At
	UnQUlyNID23ks96j0bvjdG57WYzW9sHQLUB9OiAPp6ALrfwMnzbDnoZ9d376z2
X-Received: by 2002:a05:6820:4c11:b0:6a3:8cf6:fdf6 with SMTP id 006d021491bc7-6a536896242mr11513177eaf.48.1784716099671;
        Wed, 22 Jul 2026 03:28:19 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aa76925a0csm1338304eaf.5.2026.07.22.03.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 03:28:18 -0700 (PDT)
Message-ID: <86d5696b-7610-4e70-835f-afff393058da@kernel.dk>
Date: Wed, 22 Jul 2026 04:28:17 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/rw: fix missing ERESTARTSYS conversion in read
 paths
To: Yitang Yang <yi1tang.yang@gmail.com>
Cc: krisman@suse.de, io-uring@vger.kernel.org
References: <20260720114116.21830-1-yi1tang.yang@gmail.com>
 <a493a932-46e8-4253-81f9-2c849c7b2ff8@kernel.dk>
 <CADd-6FwNfTcar6JRrdq4P9Pj_5y-HzqsCgythMLjhhBQyO5FCg@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CADd-6FwNfTcar6JRrdq4P9Pj_5y-HzqsCgythMLjhhBQyO5FCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/21/26 9:08 PM, Yitang Yang wrote:
> I found this while trying to combine io_uring read multishot with
> userfaultfd. I wrote a reproducer here:
> https://gist.github.com/wokron/7f75026e02792844b0bbf26b7e79c9ef
> 
> Running it with "sudo ./userfaultfd-uring -n 16 -p 10000" on
> my machine consistently produces "io_uring_cqe error: Unknown error 512".

Perfect, that's a much more useful find then! I'll take a closer look at
your patch.

-- 
Jens Axboe
