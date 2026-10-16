Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E49925B0A5
	for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 16:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168568; cv=none; b=Ubv7AyNMsBVVlbxXGEjdh2oT3HiwrLi/qCzEdBHzWy6gLLTJL3VCye0OLc5inOm+vzkuh477qX4lfeFlg7x6OdJbR59pl8/DAOFSkQYTpEW088Ery+fN5pd3CKxNVi2fUvmA//FIKSZX6zgLX8oGaISJ781BVMeahJ1/soAs75s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168568; c=relaxed/simple;
	bh=pphfWOmnG+zysZqqjwcpzXLkSSyXj/5Q69RRu7PUxCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=d12M6evzAQ3oR5IHa2HhvYCmQle7wY87v9xfPjH0PBInNhTrfbRJm1Z8acIv1P9P4emcjtodaron3BGfOZ1UuhbnNwX8TGEzll1P+6EdlF+IeWhn6XmVTNG/0kv1tOZRhlyR6fhIxNlTybr87vYfwwntvt6APWQV/uZ5Kvjta74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tAsdZVsk; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tAsdZVsk"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so1731305e9.0
        for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 09:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792168565; x=1792773365; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3xoB1/52UJAF5felym/vHIb/TIYY9mtzEjsyjdTfV2Y=;
        b=tAsdZVsktzjQR2xcPKQbbR8kvwTYlVD0DurqaqKG6gVROffHR/CPOc+cGLdDJ2uFQH
         q3Da5nqaYLOdMtrJbnnV3TgY8B/K55FSHT29st5OuF/ZR2T9Jmaya3rrWNJst9Mnm8mz
         IUew6x8gbTl55mLILrTTRrUju2jEkTrhoy4NcsAYB0S8gwazgxwlRkj3n+1CHtq8noEo
         Z9Vl+8e822TXYp4las+z7BV5/zRTqpBOe+2Faprn8kCw3IiJ9kELcnq8uaEWN4kxY4+f
         AAobzd683CsawhXMyh03U3T0sqKb5i1D8pIl6aorADmToJIJ9QPTR9duOxl5w2X+MZvU
         2GTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168565; x=1792773365;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3xoB1/52UJAF5felym/vHIb/TIYY9mtzEjsyjdTfV2Y=;
        b=mldRVrVZbiVVBMAGq6tJ5iZXBPXxvb2jd6eKUm1YvlBoYuy+vkcIfn28Rvf+v01HRs
         ZlutHbo6q3XR2q0jRdO8jSFbogLstNYUPVhH4UdxKNPf1PGG2mviZUXOZ/mH16ryEov2
         YbbALQvtH7yulPaz9/Gq6yUbMkHSv/GkFYM2ZQS1ICVe/oueI8lUab/iDZG3xpjXLhk2
         xCiubticXLQA4foVmikkTq4e20lsSz1MZ3eP+bN2IUoO6DF7J+V+Pkscl/4Dr/cCyS8G
         /44kAPgQbLxsb8VbRcrZLzUN6muwTRx+7kv9XaYKvee72P5WtjsouuvdLfKtpr8FgQfb
         +PvA==
X-Forwarded-Encrypted: i=1; AKwUvBx7ThEXWXLEE6zOgV/4Z8Ow7Sn+hXTyu7YoGFQTotgU24S4+ePLkrShIbVzi8kYE35Uwtw20kSIuA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIv00b864rBzA2aPsxkJuPOYyPJVs7y/6AGkC8/S1txso3WwrgP
	y/azWDZyK5Ybc0PlNi9LzBVpKxirvZKlaeW+C0QpCKZ1W7iq5alodHSDXyljBQ==
X-Gm-Gg: AYBFou3LrxikG7s0o8HOn4sZfJBCkaDEtAX/0f+OO/JjlO13/dbqAlptYUQ3G5WsncC
	DDVI7tyR/Gka8yMRwaVnRPn6zr6Azo2N8CDLeKIh/GkWlkjTa5jEPEzBwvcLxMUj/KdiLOmYzx1
	JsNK2GmNJ+9mZczTonvbLYWcv39wCXHkP89Sv/3R+w5RdGpTSKaemPxGKJz7wjlF6ioh8jXmk9f
	+IBtjCufFCjg+XoKz4e07JRn3fmQC2etla3wtOyeC62x3C+sMXiPRqyCvUMDMgGzutfSCB1K3pk
	qBeeCGCFbtDHEHB00N4YhJJ1mJLLf3VEew5O5A17u6j+CjuuOOeNrPSrURe0t6oBRYcG5uG52JH
	RWYmEIDOd+WBGKil3VlSbpzOSj6Tbi1KBdW6DdVUvOLIBg7U4OKCk2BwSO6v/3LAg88sy1lyNiK
	dPHhWnFWwvr5iIiguIWTv5zbVtHKH0cgoCfKkZfAteQCbnbEe1R771Wzoyhvw2eL8rk0ix3qdiL
	XA+NqSQ5NR+PmVPbwyp3zHlxqzd4MIi9EfvHDNYkrkAL6UFYNdzjBONJ3i8haq6qsRmgXBVevKa
	Ikms3mhMofH3ljZf8dLxgNEmcxeXjWhyq007bmth9wdoexYn
X-Received: by 2002:a05:600c:4f95:b0:4a1:7bae:d80a with SMTP id 5b1f17b1804b1-4a1d75e3c9amr7678785e9.9.1792168565296;
        Fri, 16 Oct 2026 09:36:05 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b8ebdsm184807085e9.10.2026.10.16.09.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 09:36:04 -0700 (PDT)
Message-ID: <9c7dfccd-c1f1-4719-8731-34a8d6c8ade3@gmail.com>
Date: Fri, 16 Oct 2026 17:36:02 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH liburing] examples/zcrx: don't forget to sync dmabuf
To: Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org
References: <73b2654e41519acb2ec310ba1d6dc99cbafcbdfd.1792167723.git.asml.silence@gmail.com>
 <9d696969-ecca-413c-b96f-8fae5bb469a4@kernel.dk>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <9d696969-ecca-413c-b96f-8fae5bb469a4@kernel.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/26 17:29, Jens Axboe wrote:
> On 10/16/26 10:25 AM, Pavel Begunkov wrote:
>> dma-bufs are not always coherent and we need to sync it before
>> accessing. Use proper dma-buf API for that.
> 
> Can we get a Fixes tag for this please? Other fixes from today
> lacked that as well, please always add fixes tags.

There was no "fixes" today. I didn't know you care about
liburing fixes tags either, but if you want to put one:

Fixes: 93d3a7a70b4a6 ("examples/zcrx: udmabuf backed areas")

-- 
Pavel Begunkov

