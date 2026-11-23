Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441395;
	b=bDNmV5OlUhUTizpp6qiPVZKkYgD2GVHXNHoaNZYxDrShUncSVL30WTrJFyXT+jxZK0Vd
	 wNbP0Pu9LuYLuFiur+KJ81ipshaowUzENsxBfU+hYNrtkotOhKD9XYoSC/W1d3qGjjLfl
	 q+b3drvQ92Zf+ol/KD3xhar3J3B/aP/ERPMT/s3/mR67cddrk3xTCuuO02RxtsAjlZp0l
	 S+EiyOpUpCCDZgBGGwZ+tGmRhtPp7OYGiMyVG8mlxu8TRWxk33BSxoYihHTyTkwhprf9v
	 /9IE72xOVWyM9vk9RaZgTd1aI3qcNVZmYmpb7qiWZvHK0GeK3IX0u5v9R1Qkh+T+Qtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kqCL8yR438jqEfqX8sdAOmG8GdM6o1iX2qDOd73H3eE=;
	b=QsNm4J/3ewLKaFCt9OIt4lnH7hDB0/ZkuODWuorHlr7knz1C2V/WkcHZN7iCwHMgokXh
	 tQz4YOOJijHrNdpD96IL3Ykfvoo/yyMBZIck5ZqKIxQKfEkfdb7R9UEA5c0UG1ShSvSQa
	 mdTGkWq5LyW48e0MfHlrjMbxkqI4vq6DbP1tPn0yLG05s22GE8h1Zh8vkNq2M3ySjc3HY
	 8zkWMBcWzQOZyf13Us2amHR/Rp08GnYgJC+YmBnrcHtqi6GiCZrvUWr4HJDvApN/ZEyWJ
	 vxnkkELHZutB9YNvjMRAYIToef37Yf95l04F3U+XCp402JQIm7NUyNBENAAV+bbTZWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tSQq84S/";
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EE6606A31F
	for <io-uring@vger.kernel.org>; Mon, 23 Nov 2026 13:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07EE6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tSQq84S/
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c516a194350so149446166b.3
        for <io-uring@vger.kernel.org>; Mon, 23 Nov 2026 05:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795441393; x=1796046193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kqCL8yR438jqEfqX8sdAOmG8GdM6o1iX2qDOd73H3eE=;
        b=tSQq84S/1UMt0IuanHyasApDHPmNpDwhzVwotDPkeVq/SQyYZhFtggn3Cq/Gk/1tCk
         h2cA1OEReS/CYPQpS40RC7oB08MVqUd7hmoO2j5ugvGQeh1InNKeFitZ+YOOi7s7VDVk
         kyDC14iqfVs+yv1uzySejV0P+NH+PFQwPOU+3jS3mTPfmL6qomnI8+BCpKJhq3+wnmK0
         /3c4tviGXnzIz6iHoW1QhfVYLYZTEEUWmKBd+iYSEEDhv2iVJJ3HF5eOOzXLPrYX1BfL
         bAi0dp13I8lbGwD8qBUh4z2IGeZE250GZYAMy2MdxG0g/K6rOzOXfmCJZ62/M2fgsumP
         2CPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441393; x=1796046193;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kqCL8yR438jqEfqX8sdAOmG8GdM6o1iX2qDOd73H3eE=;
        b=D5JX4Yd87C63ZU4+zqeqCEmp9rvO3kWo7XKizO6rk/7u1zIQIS4KMbmbGu+EVVEWCn
         GbLPdgXPZXh6mmk1hivCVbrKLdb8zPDJ8hPnf4HoCNm+3x4h5mPbKYprTmfGPBhkxY1a
         XxtCVXEclLqOu3lcU9hWDaG5PA4Hb+RWXqvPSDEvifnIIr+FPNiSFJq2gRjMVeqcma8Z
         8lOWYU6OaBmSeNfycr4Y1RTBDKhXAVI6fQ9ajPVNkYbnPcTLeNKo2Sp1wIpSS9ORfAk4
         pgD39i8p4Q0wUQFnqzIqN3TXmnRyf8JpIgTTVsKl6XC8hDeaEnM58RaLmCTEeCYr0ZKg
         bGIA==
X-Forwarded-Encrypted: i=1; AL+hErHJznFRiGenS+65pOJrQ3WZl4q/nMf4hInE2k4CzS3QPL7baAcS/gi3FdwhP4DRZD7uDVRZq6kshw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+lQHwHMIKZLmapAqPRLdIhbfwiT+mOxEsMavBLm3/ipQ+RuAYK
	+bgU3hLt+4QfX9jTlz4q1oU1jRaiWEMYU19/rSYm2a5muBX3r8mVNwIP
X-Gm-Gg: AZFdTZcx+otzw51GdhjRJwux8/2HoBZbgFdd/v9rs2O8JHR8H8nK+zGsL5/sMaNsoqH
	IAlc5lP9kNjHrDT8N4EIRihSZ6wYk5/Ao3LS+fw6IRLXz4Y+oRpP8WAbRiJw7kWzKIxQ6JLoRu/
	fHmMve1keeL5wsinsOLndrF8CZVEplI5ZlEORbo6We8Uw2MttNlHjw/1xbtSvrWgEk+2ngr7X4Q
	gTh+/AOzUgZ/y77KLwAVXNDYcWo0fSYnnFWQCUT0QoxTKiLz3HjeXlykkWdHkyOLXiiD7MlFPwJ
	Lur7eKM1z4bgM4uJJyNXW/F5yHyqZokBIpwkA/qDmXJmVMs5yUyHp6Wp3MVr/QA1x+Mjg1CmJjl
	7vQijziNzWL7zQ+HlPUk2ZLDHHPEPS/Ez1g50KYkyVnzQR3680ZIpXmnUyGXKHytBpVsdnvzPqr
	TaDVpbajS8PxcvrnUfQLZQ+E+lhItObLtb3pFT8x334sPuspUztjEYi1ASFr/G8pO3G8sJpGags
	8hCP4j0XAAzdCeY4ayKkxSCXHs1ltBJMrm/CYrwkJebztZkOgeDs2WUSzK2+xBtccM1H6FxKWRl
	tyIqA9W+xOklkjM24p8lq5OraBORT2AZskR4OpOsvLsG1XSvlyContVxlz2nrtuzGNaroGjJCfD
	tojUvyRNOZt9WbMWGR0ANRXZtOns2W44A3cBFNTcW1HZvkJiOouCUq7Ect4kr2ss9mEiKF/l20v
	88XYg=
X-Received: by 2002:a17:907:2d13:b0:c50:ca93:19a0 with SMTP id a640c23a62f3a-c513aab9bcemr968102666b.40.1795441393323;
        Mon, 23 Nov 2026 05:43:13 -0800 (PST)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aeca720sm409336466b.53.2026.11.23.05.43.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 05:43:12 -0800 (PST)
Message-ID: <664a18cc-24d8-4140-9c3a-d522945cd2cb@gmail.com>
Date: Mon, 23 Nov 2026 13:42:49 +0000
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
Subject: Re: [PATCH] dma-buf: fix leak of ctx and dmabuf reference in
 dma_buf_io_ctx_create() WARN path
To: Falconet3 <Falconet3@proton.me>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "axboe@kernel.dk" <axboe@kernel.dk>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <htm5h9oaY-vk0g9JVYJmz5XCaKe_nPoWkUJYJqDulyNvv_sAWfzSMp0T6GWt5okc8R4SyvXXpJQ3VGhetKnjEa2KGem5uCYdxpmdzUFf6XA=@proton.me>
 <tRqxbL7txMRAzNLKylzBLQURNLpU-D0Xx5CrngGwLoYrK7V7kREharagUfgQLGIfiYFyTALR0BwL93AL_PWmFXq_MoZPhvPfUojBsyCnilI=@proton.me>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <tRqxbL7txMRAzNLKylzBLQURNLpU-D0Xx5CrngGwLoYrK7V7kREharagUfgQLGIfiYFyTALR0BwL93AL_PWmFXq_MoZPhvPfUojBsyCnilI=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/22/26 10:49, Falconet3 wrote:
> Withdrawing this patch. Apologies for the noise.
> 
> The WARN_ON_ONCE() path in dma_buf_io_ctx_create() is not reachable with
> in-tree code: the only in-tree implementation, nvme_init_io_ctx_locked(),
> installs all of dev_ops (map/unmap/release) before it returns 0.

Right, it's a warning for the same exact reason, and cleanup considerations
for it are different as well.

> And on the only path where it could ever fire — an importer violating the
> contract — freeing ctx directly is not safe: init_dma_buf_io_ctx() has
> already attached ctx to the dmabuf and linked it into the importer's
> tracking, so kfree() + dma_buf_put() leaves dangling pointers and turns an
> unreachable leak into a potential use-after-free. Since dev_ops->release
> may itself be one of the missing callbacks, the core has no safe generic
> cleanup on that path.
-- 
Pavel Begunkov

