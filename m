Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699900;
	b=JUNBt/xW0HuQtXJdzvhfk2Q23AJ0Jkap9ceDyatzCnHAQdViuMRK32A1SVxQuUCHBh36
	 dTPjNW9CLE4j3EcXDPox74YoGLa3cD2pG2cAdPAYVHryZCnjjOPnh3OQlEvCRblFdtV+b
	 Hiwk5uyQxK+QXjwV6rReQr459RnygzIWW2yNNebT40Cioxhpa/ERm3odvVXXTROpVEl/e
	 0JTkQl58HnHXiVUzLSancV2hex8ILVIOJfKOWvKfr31Les72Rri7pc1ES+h9u11JxQpMA
	 GavAsy6pHeUQOru2sxiQRD2jxBZWJg3xTnFQjAdaX+CyC4JZlNQIamPMrmbFZl0utJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=6LmKMgXrqF/ULUi5qPqCcdHajMqpBhbFT3p27Cwzfn4=;
	b=INKGB/xZAX92+QflgcGhgDUFWrvulHTmqldO1lfSzTgnFx/XTy6DU0LAjWufby4x27UX
	 buGRI/wjC9HEVBP7q6pvYpa7kXBgH2pmkznFtHtCnVPo4dVsDk2aRuAm0Gs+BRtwoGsGM
	 XKH+gGKpfD163jE3mu3ek015HwrA2Z84SdLINIi9UMoejzOIPyDwpt9zk9ZSBd6pO4X+4
	 X1yvwW2/51euKugUXTRtgABrS2337qasz3OxZYORAiLN8Y68ghqJ+HzqSaQ79iwFaF0pA
	 D26h/vvMseYowK461GFRMSq2zuYgckn2M6APDQAt7+55e17pg3vlZhVa+LtWfskloPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YqzZOUKt;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18C3606A32E
	for <io-uring@vger.kernel.org>; Thu, 26 Nov 2026 13:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B18C3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YqzZOUKt
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a32576da88so4043345f8f.3
        for <io-uring@vger.kernel.org>; Thu, 26 Nov 2026 05:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795699898; x=1796304698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6LmKMgXrqF/ULUi5qPqCcdHajMqpBhbFT3p27Cwzfn4=;
        b=YqzZOUKthL2sjZ0VADdk+MXwXhyPWPDzMfSAXdGlb3l71Lfg72EADy8PEATUOzNoiD
         sPHy+ho/QxQnPQDT0hCic8bkWk7y1+IafJv/2/IOJjfWi+AhbaP7gKOsAZrVP+erIpmz
         3+W77ivY9gUH1TrdPs9QPbOu1Wp2KGMCejhgrsIxjsXjh28lbl9bEfwKXBY8YtJRgLhh
         iLIfdMZuCcSPV8FnQHanTyswjh9wMsP66GM4bCQKyQk7ppAMIXcsv18fZ7q5I6wR+L/g
         ssLWa5zrwSCaUPXzea/6mCcBnCNKQPNV91tfHCdOL1Elix6AOs6SJNMx9gTn8iM0xZmn
         UB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699898; x=1796304698;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6LmKMgXrqF/ULUi5qPqCcdHajMqpBhbFT3p27Cwzfn4=;
        b=tp63POLLj4TChizCCMGXjmD46c5vfBGIzsgbQ49c7XzpAOVe/fPTOxqQRt2Kb7FQLf
         IheOA8GjUxO7GdMqejVGzvW29VuijiL8RxFnearBmMkJ1gs7/Bysdc0hXE6sU8Y7AoQ6
         mHzLshjxuUfqCdiL8dnk6QsnDPxT1yni6k4tgnbuU3w+nP+TgiCh3wqqyybFC6GRPknE
         o0+K9OgCIdmWkJPhPlQBSqcsMvoIq1Rd6RhatmXUdsZuaQqZW2oCzvz2NfvX83d5taPb
         WdpbqCugl2IIDxsCZyd7Fj5LSZJd+5F8DuEtIEixj6GGbfsUbRsg8zGj3PcRQYIf6Ucy
         atPg==
X-Forwarded-Encrypted: i=1; AL+hErE9MD86bNdUDhAHbBpkmWa0l2YvQQaME/JqoNmGkE3XdTzh72g8oHC1Ns9U2ZTGhtPeIZzg6b7KUA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8pL8kkWftpCHm9RBTfWnToCXMplMxB8d3qbQBCWY/v29r96ni3
	Af/k37PwXOci/3aiMfNNCYJAlU8CRbU0hsllfB5AJcmqMhnr4ja5pjd5
X-Gm-Gg: AZFdTZcsGqju2Fq1iK/MgXrwi+4F4pFIPxJ+xEJOvgb+paakEvKI58kZDeHf6nTY4sw
	vBEpxef/yZ7y3AtaOCdHFQJ6NIDfSkMN2tAbChbyfDrb1Bz6C033pNojvg14r5pjtgo26e+hW1P
	pcrxz/kQsraQCIDAStbyoXwW9eqhLtFdP5l8J9p6nOHVBqpg3Wkf6QHLdVHiT2WPwG0an4PoWRn
	65L+tFqaQ3vrWX+gzAA53uzX038wxdaqAvEhicvLFBwEAE/M+NlJozqDu4IJSZLKiXM6yq1INwh
	4T5SSQB98Kf8AhjujSZ4fkZ6/iw/uV55hFosnWsn/Q5xz73aBL/uNaDZdQDEgcWXd2C/yBGBNYs
	s0bDW9XhaW01Gw159XQOgzlAO5L7MpDE8vQ9KP61Y6gU/jfaoJXuVyqb4ACbVvZmfrOI2dm6wx6
	fWgYhaU56vgTRFZw4laznAAvBWamXIEt9bncZYqDx5mDu1x+6gdgeQ/3zpp7gfqVkILq8rVDD+e
	cXYlsy8P22phYDg4VP1nBRh06J/oqD7wIVSNb4+tlUtvTgj4F4AuWo0Al+cixr99DAmHvpTxd4T
	i9FubsRa+34SOwFEYmB8L5+Aw4atl2po30q4SEIo4DggfvYz6xxWpwSEsU6ty3MgH5i2j/NC+aM
	OUJ4+IVWPkTJsa8/IpDvEgGU9gSgqB6JiKwG//yKb5CR+yE77IoCpOgcq7yA=
X-Received: by 2002:a5d:5d08:0:b0:4a6:4f91:284c with SMTP id ffacd0b85a97d-4abb83116bdmr47012360f8f.51.1795699897829;
        Thu, 26 Nov 2026 05:31:37 -0800 (PST)
Received: from [10.54.182.141] (82-132-213-247.dab.02.net. [82.132.213.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm41778008f8f.2.2026.11.26.05.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:31:37 -0800 (PST)
Message-ID: <e7655061-2b71-439d-a933-09fa54fa96c3@gmail.com>
Date: Thu, 26 Nov 2026 13:31:32 +0000
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
From: Pavel Begunkov <asml.silence@gmail.com>
Subject: Re: [PATCH io_uring] io_uring/zcrx: don't sync for cpu dma-bufs
To: Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org
Cc: netdev@vger.kernel.org
References: <2cf944dd571364e249af5fefcab07bc670bce842.1793623006.git.asml.silence@gmail.com>
 <1a338198-527e-418c-9e0f-2b619ea84e71@kernel.dk>
Content-Language: en-US
In-Reply-To: <1a338198-527e-418c-9e0f-2b619ea84e71@kernel.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 16:14, Jens Axboe wrote:
> On 11/3/26 5:11 PM, Pavel Begunkov wrote:
>> dma-bufs follow different from normal memory rules, we don't need to
>> sync it for the user. If the user space wants to directly access it, it
>> should use proper primitives like DMA_BUF_IOCTL_SYNC.
>>
>> Fixes: a5c98e9424573 ("io_uring/zcrx: dmabuf backed zerocopy receive")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
>> ---
>>   io_uring/zcrx.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
>> index 6d7abb1636e7..17e554bb774f 100644
>> --- a/io_uring/zcrx.c
>> +++ b/io_uring/zcrx.c
>> @@ -1425,6 +1425,8 @@ static int io_pp_zc_init(struct page_pool *pp)
>>   	if (pp->p.dma_dir != DMA_FROM_DEVICE)
>>   		return -EOPNOTSUPP;
>>   
>> +	if (!ifq->kern_readable)
>> +		pp->dma_sync_for_cpu = false;
> 
> Should this clear ->dma_sync as well for this? That'd bring it
> closer to what devmem does.

It can as well be that, but IIRC it needs some extra apart from
just setting the flag. I'll resend.

-- 
Pavel Begunkov

