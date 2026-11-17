Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794918414;
	b=3f6SF9TO1wd6wVjAz0jT7mwLw7m05rwopsIRBY9aBw+FpG04ru210MH8dQQv4V1ESzGK
	 KZQIac5qxGkn3rYFNdyTYMXtWZDtpfdoa0xADy33Fzkn4F1ZXENslGgSINfdUC9Ben8mC
	 8o9iFspkSUpn0kGPGc/EA/Z/s96RR9booba8Y1QFIFkna6ike7o0PxcLTvdZvcD6DkeGz
	 QdcPJhlzTFb4kVWdt+K2+76b4IlYZ+YWlXTiutEw9r3+qX/FKa2zBgUrJPlx8d+VeiNlC
	 gKLireWAkGpKIhkSkZxipoPl/Rwb8vWYpeMt2RzE/5CcJlUZDEw+bpzT42w+8BIQ+xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=pw66cazUIbMSivljAjFqcAVts39UUm/2ZxFC5sg/Ewk=;
	b=v49Ppch/gUaWlOKlvYdKRLsZT6kyVYpUGil7yjzX8lNa1XqdQCkrYrAxsUcTK5C4Wiv5
	 QE2A0iEDCgAPklcgT+TWJZGcKFq4HdKaUPGxUpnE+1ffMsJ7Wkl+Mp9M7TuLHGajJJ/Gh
	 BpCnFlK9xBG1lPDHJEwwE2x+0t3V9Vsqaa7jOoMTIzPug/uTqDGG6pnQX8Mo93EgpXAxm
	 G93INoofFiyranoxOOk2lFRoycWS2OpU9tbwKhg6rcqUDsFCP2CELUlVn4Dnv9Rk91Tl1
	 9xTFO9stJEN4DAlycNxeye77yhdpTzW972/TGIywK5fj58ilBJzmxLxErEGobutM+Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CclzPqBA;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09CB606A33F
	for <io-uring@vger.kernel.org>; Tue, 17 Nov 2026 12:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B09CB606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CclzPqBA
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-372bdb942dbso4172853eec.1
        for <io-uring@vger.kernel.org>; Tue, 17 Nov 2026 04:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794918413; x=1795523213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pw66cazUIbMSivljAjFqcAVts39UUm/2ZxFC5sg/Ewk=;
        b=CclzPqBAPvQNM7so5prRLiQoBZU1d2A048Dzq15q5F5qZSTMmwKP8McN5KO5UFYcSJ
         WMQWmupwmNzVX6J7nfJS2NjsGG9yQsW0X3KqWxflsl6wk64kosaxvYDEzc3k41iDKPlY
         gaYhFlF+LAw+D552SmX3Y+wF3GPTzxBksfCJjuWvIqjVZ6q31vcXkaxqLXXEozfErFWq
         X/J4QcuWEjhEUVpVEh39vE9R5OANfo3eEiVOanR6n+PrUtoqchunqZsHvLwLn6w9V5dZ
         kK1g5iHq/A6HFZKllKdXmLTmfk5+2muN9snMhkUlHqLx06ABruo10z3WgiX2jyCOqDzz
         wIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794918413; x=1795523213;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pw66cazUIbMSivljAjFqcAVts39UUm/2ZxFC5sg/Ewk=;
        b=ctB+OTDDvhIQ3g3ZyZnMp3+Ws9KJJAQo67MngxvqhIspRH1bIMi67TitRCBPBKFRrW
         26IuHSWxPNw2BSA0nk1GajgpalDosbicLgDNcoLcV71Sx2FoRggG1QpcfZUtUxKE7fET
         GarImoVfvxvdYNyqL/hDiMUaDRQBpuODo88wgGppAmNDGQ/f+dTcLPdeplZ8Ozm5WqF0
         s8jmyp/WF8ZRpbLudDqvYq3GuTHxmI7br7LTkNhAyMwgjOpKG3H2yXhgsRmvv7mnddn5
         8tgywDAECX58tLCncfhTsq8IaZ7Tz8GEbp9lATK0SHwC3gJqyYZjuMwUqGXJkUy7Gksn
         fcwA==
X-Gm-Message-State: APuU4Z9O8gySmijb+Yd+x9qMFe9jQNoizFpJFoQEXE8csCpe1Xb/0PmO
	kcsk452vx1kxgHQAQOjrkunwMME7LJNqxDqgs/7pvqXsCVCjLwb8scuhz/gQz4yvw+U=
X-Gm-Gg: AZFdTZdglY8aNMaP0Rdwq6MQ6UUCIeJiE9gujjMLZX9gl9PbjkBNaQ0AQYy58NhPaPS
	11N245eMymRUXKjg6nA7FJrSrx6WsQrC145AKcZqb5G/SjL7jUU+HB0+LPRQ3tPuK4xrnAwVWW1
	rSM4l5zwqxFRMbVBjG8PyKRyDekBhFsyArFoKCR8/+fvsdtkN74/GSZnEJH+rIX3LM31ngkSdBc
	j29buBs6UvOCmW568lnHYBr6lPLXi11p4tlgEzFlo1ZX7aEHmRGdJVYpnI7xCRZEIZGCAjxK8dj
	fk1IGp2hERO14gB+Fsr1eJTNi5uIhwxz9ll7iQ8Mxohpml4lbrZx6epq2cEOGECSD9kPYlkDcvs
	nFr/fOH9gBy7D/nRLK/8vQSf4jF2aTPEO9nWEBMGLmaDQlm7iP5hKmrPXnMs+vnnNfujtID69Z7
	oJptyqE4iHe4ZuPafgvnWfnOGt4/A0lPohjpBQfRMHXiprJq2xYSbzjA2VS6V5QVMPefO4QXTh/
	P3F72siebXqnfSO6S2LwaNE6xck2WkorKYUK9hjCFheWTrQPFtXip5d0+8yWLh5YSJs4jWFtAci
	+vlpI15lrfhk18O7xcYDA5L0A17ljd+K+USUg/Z/6V+KYgU88rZsNdwnVrRFizr9l76jL0rnO0m
	7lheqZLHQdd+me/wg6bFXQ4G5Mxosawi59DD4OPkC+akC08aJ
X-Received: by 2002:a05:7300:e9c5:20b0:361:167c:2364 with SMTP id 5a478bee46e88-37966e3ab7cmr14780189eec.8.1794918412639;
        Tue, 17 Nov 2026 04:26:52 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380d5135221sm9026343eec.24.2026.11.17.04.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:26:52 -0800 (PST)
Message-ID: <9e96afba-66cf-4812-b14c-faa2958caa06@kernel.dk>
Date: Tue, 17 Nov 2026 05:26:51 -0700
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
Subject: Re: [PATCH 2/2] io_uring/net: Add bundle support for multishot
 recvmsg
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@meta.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261116111744.702159-1-cleger@meta.com>
 <20261116111744.702159-3-cleger@meta.com>
 <19c6db06-d63a-4dc8-9b0d-11fba039b714@kernel.dk>
 <e29f42de-64df-4c38-888c-64d7c89a81da@meta.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <e29f42de-64df-4c38-888c-64d7c89a81da@meta.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/17/26 5:06 AM, Cl?ment L?ger wrote:
> On 11/17/26 03:45, Jens Axboe wrote:
>> > On 11/16/26 4:17 AM, Cl?ment L?ger wrote:
>>> IORING_RECVSEND_BUNDLE was disabled for IORING_OP_RECVMSG because the
>>> envelope and control-message sizing was not implemented. Enable
>>> bundled multishot recvmsg by reserving its metadata in the first buffer
>>> and accounting for payload spread across the selected buffer run.
>>
>> Patch 1 is fine (though both need rebasing against for-7.5/io_uring),
>> but a few notes on this one:
>>
> 
>> 2) Why not support incremental buffer rings?
> 
> I deliberately left it since it required more wiring/modifications. I
> can add it in the next version though.

I think it's much better if it's complete. As a user, there's nothing
more annoying than having random features only work with a subset of
others. It's confusing!

>> And the usual, do you have a liburing test and man page updates as
>> well?
> 
> Yes indeed, I have liburing tests, just didn't to send them right
> away. I'm missing the man page update though. I'll add it for V2

Great!

>> A minor note is that the commenting is a bit excessive... I'd prune
>> that for v2.
> 
> I'd usually remove them but they mostly seemed useful to me. I'll
> prune that.

They seem a bit LLM excessive to me. Just something to keep an eye on. I
like them to be shorter and concise, leave the bigger explanations for
the commit messages, if required.

-- 
Jens Axboe
