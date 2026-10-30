Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793365650;
	b=WoiX5Omm+4hXrNtCgvR6jRKwdRrcdHemgZtSfMjFAVq4AOAyeCcGAPglkrog7OWjLobb
	 WQNKsAU8uatLhBXoXKaGHOB4umCueYRUyHE49MDBmk+o/PTU17U4TW2iAniC7DIlINykv
	 ZloP/JHQTuZ/mYQCxs04WxGRHoWh04k83pkONipnPNWVLYY0Nyjeg1cvzcmb/OwDyURZ2
	 YYFJAd4HgfQLOtayJZMaWH0c92QTR8j5AClIjoF5Bp4JxT1dG70oWuVdefDT+ctweE31I
	 t+aBs3HGzHM7Av3SsViM/Bt++binh78oYVPE50le1k1TWxQ75Azqb8ib1zWaqyGgM9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dgy35YKL0QXBV1sZCL+Uc2tsoFMI5Glg4M8+gsdeA5I=;
	b=vNJdmZKzwuV1AOwgoLPUVl1FDQdW6kGM9alGKRfw1EcJGfeZBuO8W3Z5YjukK2Y1uqM1
	 CwsZFBUfH0aFIZ8on4GVl4zKRWRTbzpLpY0iY+y/G2fXgB3ErmrX3pC7LZW43K2FdYeXF
	 FcI8daASsT7cuHsA0W3WEMk8hanBHa6fxOQhcy/qudxpYcVBBFuN6+PfcyCd7glkiMMlS
	 yFJkOdPXBYsBtnm91bKz5PSOTKtnWRwvUQqL3jiashNsYr1MgA7ZM9fjV4sZdE6VREXGW
	 AutKujxGeD0iCbHC8R8rJweVQB7w4gh3CuS7jmtsMaIzrWb//YRXIyDqYhZSWYYMvpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lcW4F7Iu;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74CD606A31A
	for <io-uring@vger.kernel.org>; Fri, 30 Oct 2026 13:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A74CD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lcW4F7Iu
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1846bc43c28so765205c88.0
        for <io-uring@vger.kernel.org>; Fri, 30 Oct 2026 06:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793365649; x=1793970449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dgy35YKL0QXBV1sZCL+Uc2tsoFMI5Glg4M8+gsdeA5I=;
        b=lcW4F7IuLgid/qDqelQO9UUp/XCACLUQcJCGVwPi7t17Byni9TB1h+98XRSOTg9bot
         Z4eRGYv1qldKgQTYxII/O8S3GD1Conth/N67FP6FxsPa+cmHAQVWbhNmptQKjdOkt3Ys
         lwoGC0HthhgCDpj9iSpeLnoXsLdf+bYAbQNqEwxM6lRMBe6WarAeaigUUPTNxUhXeZ0+
         NLRs7P4nxUHYe9m7dXirkMM57gTqfafhUn9g2aVX/lJlMmhVlh83T2n+cceDDEaDvIlG
         53BRrJZnr7i1BSJ25LG627FKqqWSAY3dGlIVEgFzq/u4wH2VocfE7qGD3YjwFp3omoUD
         ewbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793365649; x=1793970449;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dgy35YKL0QXBV1sZCL+Uc2tsoFMI5Glg4M8+gsdeA5I=;
        b=TfluZIE5iINKTKGclyKTPftGZ2QatGO9nqw5I0qTMdWpjXHXJ8T/quk5WIYBt0frWf
         zeDX87SBO0e3i2LHDECdk96N2UW6zyau5vhAS2qK0pFJDwI39iJpPpuB8cjDn2UEQoRk
         mpb9Zm/UAADwo0HNzk/uyJ/eKKJ+hLxJtLBgfWB6UzRH/b5cdMERNVIIRqTvB797OLrw
         TbRW8U01d3fNCNtPAjgIovsRwww/A6RfhNDK0LD5A+2QkfVUqlwVqf13QfW8METP9l8L
         lKOJrnsYVciuJeZUd8hd9rxFg8GsIfjlIxh02Pbdn5OdE0bu897KPVzK5srpXDlq/p0p
         geMw==
X-Forwarded-Encrypted: i=1; AKwUvBwThuUKNMm1fbHzh8na6oe3jw203eyC8G10JKEhTDJTRbCAl7iGPwS1mw3nV6Jxwg23afoZ4QIsEg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLtHz46HoTILNFht8/3edO7IcWiDJQ98wBCIYwtssB96jb9b42B
	ur3aTvQfjjd3LlZU0ZRX4JUt9zjhEsBXhehpQdDGBevnQgwvUc69AYs8n98q+QDT62M=
X-Gm-Gg: AYBFou1wj+U8K8jdwyQF4v0tYgae5TWxgFQtDmIhqtUkteJ58X7xQ0F15O5wauVzOaG
	r16g4gI/W9njj91d0+cr5SpMwZd+FWZsuhyOW3ZJxMRD6NiA3t1GNafrdmjwNhftrT2zr72imar
	aoaJFkY9aAwd7YUdXYaYJIRd66kzxSEHbsXGFjsg9wBayfdIyASzP5NDX0UJTUqug6llVg5n7ac
	lslBSYlmZn6il/Ffvqifu0pucwlTG6PfJxe3URAHXK24ZWIhvahvtEvEsAK4ZMNugVIyh4lsXfc
	gVp3rRXrzdTb13gx/yQEOgPADscVvcABMOZyfOV/E6qxZK7B42YczmKeZwfLJDlQzKeOSHNJ+Yb
	fwhEGHNE4Q5ciA6zP+0m77NoIM2gmAeInMNw3Vx9yjpqpKu9oZYFSfSJzzIs8BQdYznYC3fRge+
	FAXFpwrIS9sXGHlb7xIYwZzGPyBg3ARS2CyFlCiYe5933h5v3w/1T1102WI0jl6miBeWboWJaeN
	wLyJC7WtSqPE/xudbUpYGM2WzCpnbCMeso0+Z17ObD6ndIWCAPzufoj1CmZstrMagfZxFj1G2dx
	97+HD448TidTqETyugYYSgn5Dp7q5UqfpbuDyNCGVd4XZ2yjGOV5qmTmls/0VumoGWncPJdaPpU
	ActKOW40Jyn7Z
X-Received: by 2002:a05:7022:1706:b0:1ac:7044:2bad with SMTP id a92af1059eb24-1ac70442d69mr2633208c88.36.1793365648427;
        Fri, 30 Oct 2026 06:07:28 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a5fb97sm8929732eec.23.2026.10.30.06.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:07:26 -0700 (PDT)
Message-ID: <61bb0fc9-d629-4987-ad18-c5eb46074dbf@kernel.dk>
Date: Fri, 30 Oct 2026 07:07:25 -0600
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
Subject: Re: [PATCH] io_uring/io-wq: save worker type before dropping its
 reference
To: Kyle Zeng <kylebot@openai.com>, io-uring@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, outbounddisclosures@openai.com
References: <20261030042101.73491-1-kylebot@openai.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261030042101.73491-1-kylebot@openai.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/26 10:21 PM, Kyle Zeng wrote:
> io_wq_cancel_tw_create() inspects cb->func after calling
> io_worker_cancel_cb(). For an existing worker, that call can drop the
> last worker reference and wake io_worker_exit(). If the canceling task
> is preempted, the worker can be unlinked and freed by kfree_rcu() before
> the callback function is inspected. KASAN reports a slab-use-after-free
> read in this path.
> 
> Save whether the callback belongs to an unpublished continuation worker
> while its reference is still held, then use the saved result for the
> conditional free. This preserves the existing accounting and frees only
> the worker allocated for the canceled continuation.

This is already posted and queued up:

https://lore.kernel.org/io-uring/20261028164732.1264069-10-axboe@kernel.dk/T/#u

-- 
Jens Axboe

