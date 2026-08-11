Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A851925B088
	for <io-uring@vger.kernel.org>; Tue, 11 Aug 2026 13:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786454197; cv=none; b=ksyvQ4anYwJaZdnhEajb9jiOKid/LDOQWh2njqe2XHGcnk0MnFo+dYSRU05wSp4dPYFd8WRMOoHCMsfKSZ8qXZGARZoNDTMnYXYBEdft8rNDt/0FgGrphDvrGpoKJ8j4Cqjb+CkcN/gq6ABu6VhAHtqmgD72OURNAR2GmaqZdws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786454197; c=relaxed/simple;
	bh=EV61FYb5D/7ZN7WKyu4faP8LVXNRQBmvH2wEtYT2LmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LvXy+TCAlPo/miitGRQ0vMs/920ZyHZ8cHUdDxZYCEgo2XA8chZHf69hL9CBskNecNxYBxNm5LVCKwjxCb4qvtbaphVFImqh3b67nzz1Ag56zFZaheI9AxnJviI1BfBe+oL2egV04+qyWNdMQliLJdyNXLnbCJHp2KWJN6UBxas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFj2Oo3i; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFj2Oo3i"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c167aa9500dso104624166b.3
        for <io-uring@vger.kernel.org>; Tue, 11 Aug 2026 06:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786454194; x=1787058994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eytp0kWHTMpraBTsJPqytmrRy48FIzv9b11elB9I5zw=;
        b=gFj2Oo3ih2LWB9sX0cOs8ZSvucFrigSyLmQI0TWju/RM/kfml1Ql1JheN6p1glvO8N
         ghvzi735tveXrnStYtlDuqvDVxQKWV3iMEJwS/C6fSokLKo1Bh3N0bWtAdsByN0LZ6WS
         U5mQBmRHFRs5FSwBBwFVKLyhuHZFMs7fSPTFdB+8IAGRqglaZo9RDDJSCNxuOZsN9msK
         j47LdM4ayOpXbiqVfqhsG5DxNoBtUPYOhiT72gqXQ7h7R181ilzV5sKbjcAXlM/srOY6
         uuk1Vot7Y+/s9g8tH8nX2ZBhyp/FuNxKvk2RZ1OnVO7vQWDV30GlL4EE4mTneoz3tqGA
         K8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786454194; x=1787058994;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eytp0kWHTMpraBTsJPqytmrRy48FIzv9b11elB9I5zw=;
        b=M90d0GxJ9aXsrOWAbodG5rSz6idXfoKomi1j/eJ5HyGLoSVKEsT83SgHibJUuziHTT
         I1ExAP66MpdBP//tSEzFfMQ3ikNAqTelyHxhQ0Vo5Vr94cCi+Z3cdCKE1OJaNi8YyCfK
         0nD+WZ/YQOoK6CZhzh5h9/0CLKrft2kfwfyn9lv0C27wPMiPwBdGQjpUMpvwkRF9qeGD
         iQDAkRObol3iZGp7tIWokvAdNnRX4KTW8bj26hNUonEi8vHh/C/9eyUp4HEd49ZtVwqM
         Wte5ynaJ1mbPwBV295awj24S1g8yqNBNKFHuu8ZqF41n4x/1T6eUFZAG3Ykmj+gy/mZS
         gowg==
X-Gm-Message-State: AOJu0YwQarowCVQtOWHwNneBXEfqu6Q9fGiFiY6IFh2tVRTrf5Jfz9lK
	8QIYv5IuuFGH/PbodSCmkkA/arMM2mawQ5uF5juyEMRH8o5rMO4PRGqgmRcXRLsN
X-Gm-Gg: AR+sD13cFDYNbEFOYkA2gA75a6ROxhM1Nke1iIE4bFPIniRmfiZRDhT3whEuHmxilCN
	yBJ/Z3ViP9n74aT320+zCQFzZAmoay4ffEBwPQXhYrPQ/yohTeiKp8C7QsW7mwhK/AQsnxSpiSv
	nuXU+zOLuzmrDZcX+KmZ5QaC7MUEkS5FiFEnuhuvrwSLYChVzGFP7/COSJPx8I7PBTaFkQHvXun
	fIkxie8RVhQZP9UdiBOIZiUXubXBrLOVRbkxM0QwmPbvwbG+T3K4UD/nmRs42PUhpYPTsRftLEj
	QMv2ILRErEs2wl0bWgYN35XNuMDTMVGDVh5Ur7LiHwPpFAG8Vw7VfYunvp70Rnw3ISBrr3753HG
	04St/jQijuuMMiPUwFoyEXHpFyvGlXFfReKL1yjrHcJ/XyBE7rjJPwC9VIUmMT0SDOpQSNW0OUI
	55M6lH8Uvo7qY06ep9ByHMj5KDKkWm5rHy4wvSHEc+sYj/1ix1ILta0reVyL35C9bhMR9cWi/J0
	fO4GAb8iXVuPIgyDYDOWva/sDXY35HsOxhbvAf5KiGW0Zrf4Dxj06ab4P6iOVzrh8C4bZQP++UD
	c4T7cOC6SY9rZkeQMahCdywfy/luq8kpu0G84p4=
X-Received: by 2002:a17:907:d08e:b0:c1a:5d49:f99d with SMTP id a640c23a62f3a-c20ec8d8396mr17558566b.7.1786454193602;
        Tue, 11 Aug 2026 06:16:33 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c20e431f414sm50782666b.36.2026.08.11.06.16.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 06:16:32 -0700 (PDT)
Message-ID: <70b36cb8-bcb3-400f-a3f6-d038bff88723@gmail.com>
Date: Tue, 11 Aug 2026 14:16:29 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH io_uring 02/16] io_uring/zcrx: move RQ head/tail to
 separate cache lines
To: Mina Almasry <almasrymina@google.com>
Cc: io-uring@vger.kernel.org, netdev@vger.kernel.org
References: <cover.1786108672.git.asml.silence@gmail.com>
 <f769116a3f5267f06cb9a9a819d482ddea2e0852.1786108672.git.asml.silence@gmail.com>
 <CAHS8izN4SAUCUQySd+VTbdayX-Stj+eYOqAof+Vhi=EsRb93_w@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAHS8izN4SAUCUQySd+VTbdayX-Stj+eYOqAof+Vhi=EsRb93_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/10/26 18:35, Mina Almasry wrote:
> On Fri, Aug 7, 2026 at 6:25 AM Pavel Begunkov <asml.silence@gmail.com> wrote:
>>
>> RQ head and tail are currently put into the same cache line, which can
>> cause false sharing problems when refill is run on another CPU. Put them
>> into separate cache lines.
...>> +struct zcrx_rq_hdr {
>> +       u32             head ____cacheline_aligned_in_smp;
>> +       u32             tail ____cacheline_aligned_in_smp;
>> +};
>> +
>>   struct zcrx_rq {
>>          spinlock_t                      lock;
>> -       struct io_uring                 *ring;
>> +       struct zcrx_rq_hdr              *ring;
> 
> Is this not a problem in general for everything/most/a lot of using
> struct io_uring? Should you make this change to struct io_uring
> itself?

No, io_uring headers are usually accessed by the same task,
that's unlike zcrx where the consumer and the producer are
two distinct entities.

-- 
Pavel Begunkov

