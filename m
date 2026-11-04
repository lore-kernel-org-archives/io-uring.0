Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793754465;
	b=wCQWt0Q+MybNdUS95wXnYDUe7KrD8BM8AqNp67roNHxcCVHpwgqC7EJAGcrDbK7LFOGs
	 Z3ohLrdh4vdjQ2KYJlbpH2wWquIz0/NT4Zsb2mgT5b0BAbBSeo137zjfQDyFgAF5mvX4s
	 RbA6QppxiA4lv35o0tCrYXu6+EhxDs3LXrmJ8uCB/tdKcVwHnzZS952i58h1U9CWeIO/9
	 5VaNue4j4y4NQBBDryE2veZuXPdK7cteGmjaj2d+VWBxJasxu7RVzMyfZ6ldAQDugzenK
	 e1Va6XhED6tFSth0oorbJ6/AJ9oIR0BDLI1ckf/4yhIF/uoOTPsQlv3od7Z7RgNj6EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=IkoTUr12d3aBSwhfLu9j73ajMyz1vUUn+p4JbB9hc1c=;
	b=rmNgbycC97M3Kt3+vz0CN917AAnH4ojxiFjowfqO3TjE+0n1tD8AXlZy9ZtVxiuaWRmn
	 J8G3urnc6BAuW8ZFe5ujItFaTeQJgfQwqc5CWjYb+5hE2SXlpI438RTlmZUgOEAOZTGXk
	 uaP2MGxGvE7f+3BFpR3ntKm/7HBaH38eL1OcVrZ3HBNQ+GuRA+2zm9cxWNVahafyaNYNW
	 QzKaAeUZ/LJ0N7CdrgMjx2WKLfq/ciJgdCtgy8SyzhV4CZLywUC+53gwxu2U28CN6q09u
	 60IgPFCWiv7oz9sxes3YsbRPNEL/9Nd6lFXPET56WaP2VVKcilDC5WKtzwgiHZeIWDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x74JWfN5;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B7F606A329
	for <io-uring@vger.kernel.org>; Wed,  4 Nov 2026 01:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15B7F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x74JWfN5
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a208d93758so1173645e9.3
        for <io-uring@vger.kernel.org>; Tue, 03 Nov 2026 17:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793754463; x=1794359263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IkoTUr12d3aBSwhfLu9j73ajMyz1vUUn+p4JbB9hc1c=;
        b=x74JWfN5h8ikXShPfz4EZ8TGJByCm/kix2rdXXQg+GWssuw/Jmx8f+11kO1OJKvkQx
         P6ptJKKG3pnuMuTPYPcUvf1vPG25sSvkhfc4LHjL9sVd1CfzGwxcVL5dcm/LvNH2jPOL
         /AmWRtRIk6qpwVompzpiz+IrXvZnsuZmuCwNb0pk6Qy8S5ozLPrPqFYDC967eEUffyHu
         TMGNHaORHxAaDKrpKfY1cTVaY3znb8Q4iEu/WK/SdK0X2Q87qsT6/fNNLkq0dyJVJDO2
         HW1tUYmxA9m/cy3GF94xTfSR2hUQYr+M/OuLs19JAv21wQZ/wtY2qI6cL5BGRn5xqyAZ
         tVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754463; x=1794359263;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IkoTUr12d3aBSwhfLu9j73ajMyz1vUUn+p4JbB9hc1c=;
        b=FN3pZqVhmzmzwa0EzS2jZZcsHXK3T3QjzjaUMMStH8K/F3rhdofw0QSkrY0Nzw6xkF
         iq04m5tb+inoXVpdPUOl5eo7b3WxMg3oaJjc0FRUMQXM4x1WgDxpd6K6wHvaZPPgUKRM
         J4vij1g9KrADE0QP9ALymleExhV722EWZU1grW7jm+4h8LfG6nZfabSVF/5wVBl3MAQA
         IztYDxv8WFDnH/4leg6xgKNvNYVMYKSHRj35jpIDITIz3P64g9I9C+nw8Pz1d1gZ61sq
         BK6tRaML0zSA3/Ywz7Ly100a9Fw7QkBIm9aSseaysHBdtAeqbkBVRTO9AujgsVkI+SK2
         AYEw==
X-Forwarded-Encrypted: i=1; AKwUvBzuUHTvQAG6/1UZwIXB7vcEeezfV9Xonm9mnEMdxBEoBeTsjqHEhAFLFKTI+F7vV1VAesX2t/y/bQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+EN50ErL/Tq+8YN4wxAwDaRM0+3DrKZwWg4+Vc8HAzjTzYo8fZ
	FLaz4WfXWv6ib2++7/f6cObYQLO16bJ42JXGB8PCnNA/h0lXFXHTJR/g
X-Gm-Gg: AYBFou2xEGC7T0tAJz/vmEeFLQWQGZohyCOclFROyJPhpS0F4M3Al6rAJNbILtqTvM5
	2zSinL5CUnq3rJekLhdbVQiT33cg3c9HcNert2fShfSC0olvY/43Iomdter6ZjPoeflVIY+FvQx
	QJpPIkqmTdxMAGXP0FZ5N62rgEfUXD4uwZVWqDMWJq9pjK16U79v4/Lbzs305/zARP+BAUSuDr6
	C8SoMXCYDiSIQ4gP5MqQSZbtPq0yWVdGlEGMM+Ki5l0aM4utDxuRm6dPoksumRvI9AHyzd/t/3g
	ETXNJayBX8hQVW7MrQqEoNJaLaRsZfvVMOV/hWC3cD2AOQyZOb/n6Fle6uHam24EPltKBQ8maZr
	DZe8yN0VF+xXdCYy2o9Xy4J30zUKPfFtvtggpoNynTre0ysixeWakfgpjC5SbkokNcNwbCwMGFR
	zX0vZ2yIBUhoouLpJBaNJEvgimpW4hRW1Tqv9Fl5Dx5ZzcL3xc8SUPECnw1KUUe0pyWolAvC6vw
	20JQOwhisJSIm5Q3JySRssDx7jIff0/j1Ra8tQ9vhh047CJyToJQDdLQLGmnskRj5y3dP0+T4T9
	ZGtF3i0l1iaTrFZOuHRJjGPv/JMsRFuiXGmli2kEUh/sYbo6f33cYiOV+euDLZaeXP7ykhz8MIu
	P3IKAtw6wX+MFZFYpo2SGNUHHZMW370ZeEsGmPghf+rtB3y5eoJdLjLgBQeqfh7XdD/yS+N7YuB
	MJAw==
X-Received: by 2002:a05:600c:4f0f:b0:4b3:ad9d:e21 with SMTP id 5b1f17b1804b1-4b3ad9d0e48mr50657685e9.12.1793754463523;
        Tue, 03 Nov 2026 17:07:43 -0800 (PST)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab00ff3dsm181749615e9.14.2026.11.03.17.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 17:07:37 -0800 (PST)
Message-ID: <50be53a4-0136-4c8e-97bc-2cdc1caf76fd@gmail.com>
Date: Wed, 4 Nov 2026 01:07:35 +0000
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
Subject: Re: [PATCH 0/5] allow dma-buf-io ctx reuse across files
To: linux-block@vger.kernel.org, io-uring@vger.kernel.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Philipp Stanner <phasta@kernel.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Jens Axboe <axboe@kernel.dk>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, Nitesh Shetty <nj.shetty@samsung.com>,
 Kanchan Joshi <joshi.k@samsung.com>, Anuj Gupta <anuj20.g@samsung.com>
References: <cover.1793751001.git.asml.silence@gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <cover.1793751001.git.asml.silence@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 00:18, Pavel Begunkov wrote:
> Currently, dma-buf maps can only be used by the file they were
> registered with. This means that we can't open a new file, even if it
> comes from the same subsystem and point to the same block device and
> use it with an old dma-buf registration. That would be too restrictive
> for upcoming filsystem support, so lift it now and allow reusing
> contexts between files pointing to the same NVMe, even if they refer
> to different partitions.
> 
> To do that, we add a tag representing for each file, save it from
> the file passed during registration and use it to reject files
> which tags don't match it. Tags are set by subsystems creating
> files, should be unique and represent the instance of the
> subsystem.

Fwiw, sashiko raised good points, I'll need to address
them in v2.

-- 
Pavel Begunkov

