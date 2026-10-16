Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFD34E66B8
	for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 16:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168716; cv=none; b=RypXkJQ/dUMlFefdYDJAx8LPT3tGGCJ+IrPmO9VSu3ydkuH0eqW6VSpDVvDLwN5/RDrE4GCR80bR9HJLw4s3Ej9HenbuJIORqDwzOfhaIEt7Bl9QYIeKLJnRPpCkTCgeE7SkEwbTYvEa6dVhNh4VLxWEqex54SsmKXepY63VlXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168716; c=relaxed/simple;
	bh=ju/uX9U/NAlhltY9HdkmmDTQvEvG9CWdU/oxHTuys8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AmoT92pGS4DItxnmfML1qu/F1ikDnrcjonpIUixFbs3KbthxYuA3PKpxBuU0Yps9LclTWjjI2ys71r8+b4bQfasB5vxypLq6AsDfaj0RHnRjGbGDtdglrkJLALpOrQcdz9ZamC47YjOY2oRN2jAMzLleEYlTGvElMW1yoqcVB8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=AqAvpgpD; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="AqAvpgpD"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-89d6bd67045so127044b3a.0
        for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 09:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792168714; x=1792773514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JsUD/FoChPYnmoBZ57pzyBI54fE2RVA62DgUFEEVcbs=;
        b=AqAvpgpDj59Rxim5DVLccFMpU/TJA1nQu5g0w164CVdUXXObdUj6DjhcBgf1ZwAxi+
         KFFpxAbRBg/WoNW98NGkQUbmVOqfPW274/L5bs2W+LYEk/QuCj0236wL9Iy0VIbzdJoq
         DvxZ7RdjVOfurQdDPtiIM35WLsnONTb2/R69LdI9103RfW0WKG7w1fzmcrxfEk3SNVvZ
         OxfNwNnJgO9tlTMWBO5OqEhqMDoCYrziuA2ROt6mkPsVR3ZV43SXuck9jvqkFd+04aTW
         g6n0UJNp7OQVMACOlOZPG27xgMzcKrRQoaMZIG0Y86KDxOBPYSRmHXSacXFrbd3clT2b
         nj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168714; x=1792773514;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JsUD/FoChPYnmoBZ57pzyBI54fE2RVA62DgUFEEVcbs=;
        b=20bhyYDMSJOKhsmXn+G6w15x39tmAhT2olzp6Nl6aJlY2BY53u0C0iifEPMsKG8Uep
         5e0EgBnuIZf18efnXZBBHBl+/qax+8FQVzRmfzYUZnKG2sBuTrta6B+c+EPODTpqMMEC
         Z7CUKW5r8TPnWLXBCpgey20M8Pqvlo03V4JsjwxWj0DOU44d76IbYy2UZWOko8/AITy5
         9IZqQmjLebofY2wPRl0Fvxq/KeHdNf5tfeYqFNtgUo7TcIcFE6TDFGFmM/8XM9/7WO/V
         5x0SB9yK8YR6FFWwp9lQgk+6cipeJV+PCWrrXOkTbAk7jZXVuvs6cc0Yow/wfdwV440u
         8V4g==
X-Forwarded-Encrypted: i=1; AKwUvBzYQCy0mGb1ilAGLIpcdy+E3VoqsgkYxUeBC70GfxKCSZw9ZhE7gdIYbQNMEFpDewd2N320JekljA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKSDKfBD6nRk0IWTh3Xs86dTuPvE+d5FsSE7k4iTMsBZtH/5f23
	Ypc2u89nWpAMdhpBOGdyBHiIZHKwRIiQ6BOj56wN6ZNKpC0KjsboQ1OigwvxmRQCT/A=
X-Gm-Gg: AYBFou3NBX2fVMNBmN+N6JFzmATw1A8zrAiRAVxvR5+yiQ+a1xm0FHXrlROif5q/uEN
	O+gFdg+2RiP8nKO7GnwNOXrkHQnyeEGD2TlywJIWLTWTArJVBQCawdhyiNFeeenJqtXaU93JcSB
	aM+RYhgJueL0OuMrWPA/YYdIyFX4wNKp1KABS8K9t33gZnp1RFi6ODJ3kxZ1F0rX6HzoFO4bKI6
	p24VO8PHjIKiW8Y8V8T8OH+0zUDJW6MBxdkHnPG1Jag40OYev915VkFg8a3cbmYF0z/S6cuBgeU
	MOzBF7ru7Uylv5pQGMYx1oWTIvRO4ltxgTDdxxigEChcWSxgfUe+BIgozja8uVIU5FoQTb68mJG
	TbbxFOUsXvh8ffYWDRJcuCuiZ4VRYTF2TugFs4jW5/3QRB8EDvoCeJzH4EK5QdyoyEjGRRINB9C
	JxriL7RjV94bM0CrbPnG3tbW1mprC7KytUbFiYza3/Dng3z0O5+ehPBqG0t6ZJVZZ/PokjCrnB+
	yoItUqp4agCKa/eN5HuJlkcgyyGk0/pwUZ2zDUMKTwM7Nnk6rAnbhoIpA==
X-Received: by 2002:a05:6a00:2386:b0:884:831e:d0e3 with SMTP id d2e1a72fcca58-8a04be2d7fdmr83567b3a.17.1792168713630;
        Fri, 16 Oct 2026 09:38:33 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f5735e5a3sm1391213b3a.30.2026.10.16.09.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 09:38:33 -0700 (PDT)
Message-ID: <f4a6b4f9-d3fc-4f36-8c85-ca99ae2ed0d8@kernel.dk>
Date: Fri, 16 Oct 2026 10:38:29 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH liburing] examples/zcrx: don't forget to sync dmabuf
To: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org
References: <73b2654e41519acb2ec310ba1d6dc99cbafcbdfd.1792167723.git.asml.silence@gmail.com>
 <9d696969-ecca-413c-b96f-8fae5bb469a4@kernel.dk>
 <9c7dfccd-c1f1-4719-8731-34a8d6c8ade3@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <9c7dfccd-c1f1-4719-8731-34a8d6c8ade3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/26 10:36 AM, Pavel Begunkov wrote:
> On 10/16/26 17:29, Jens Axboe wrote:
>> On 10/16/26 10:25 AM, Pavel Begunkov wrote:
>>> dma-bufs are not always coherent and we need to sync it before
>>> accessing. Use proper dma-buf API for that.
>>
>> Can we get a Fixes tag for this please? Other fixes from today
>> lacked that as well, please always add fixes tags.
> 
> There was no "fixes" today.

Sure let's argue that, I merged 4 fixes from you this morning. None of
them had Fixes tags.

> liburing fixes tags either, but if you want to put one:
> 
> Fixes: 93d3a7a70b4a6 ("examples/zcrx: udmabuf backed areas")

Because it's always nice to have the reference, even if there are
no stable trees or anything like that on the liburing side.

-- 
Jens Axboe
