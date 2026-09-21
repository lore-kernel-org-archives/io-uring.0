Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8F747D449
	for <io-uring@vger.kernel.org>; Mon, 21 Sep 2026 16:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006689; cv=none; b=Qgx4H7cv3tw+UrCxqXHJvZW/EDRUVhXU4y0nmJnoJqZL/HUSubIKL2uNBAc6OoH4b1giLvL5161b433zD+DmD4n2N2DSyEJMYXYamq4qyB3uyHGHCoMjGTKuKYGhHcWps0NMq+ng50vH7aW8GC2vZqh4+9zD4GKh4nUQTPtnAko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006689; c=relaxed/simple;
	bh=7JVt7uu13Ah2XaluKCn5hb6f1O6IFi/JV6dOqLnfLIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ghHuW+JSHR6r9GZekPeEObEyiEHLysK9jssuw5TAppKXsrAgb+Ukcp8GHFTJLHYUrk6RFNvqfeAfOgbiF9yvff+Hxc+Fq3ZE+hsqOAJg0L9kR3HUJdT1PR0r4sQ1cFU/LD5udflvMYSAK6JjWrryAojV9g6VMqKsXBAcawauJK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=APVgE8nM; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="APVgE8nM"
Received: by mail-oi2-f12.google.com with SMTP id 46e09a7af769-7f4f0d37dc4so1931202a34.1
        for <io-uring@vger.kernel.org>; Mon, 21 Sep 2026 09:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790006686; x=1790611486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jtUE5weCkSY/WLLXpRf5PMQxmwpkIZjuExx863auPxM=;
        b=APVgE8nMmG6RGICnmZfltdhJF/+hC3I+dVZlZUAZ9SO1qJ9NyzSfMWJDdQwLiWeU0x
         O1lwEu/2vgMbhx0qRvIY01bfboCqHb6GvbT+ng0b+Q6re74YO6plmrSLbmKjd3poghh1
         PmlbZuserdBu8MQtXym0Zn0vKag5smGrXGQkpdHfnIiaBp4E6TMhm/srHwX/qf4LeUXd
         iufgYG3sPkTMURaDTCEYhC2WlPsaM7VVksSHpZKArRIOzSFqgUuRQJoskxCwnpUPa99J
         f3AVGgsy/7V3DP2o+iXGjCDqh+FSi0eT5zFFpI/9ntmEBfmwevHpetk59Pazp7ozDrbF
         90pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790006686; x=1790611486;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jtUE5weCkSY/WLLXpRf5PMQxmwpkIZjuExx863auPxM=;
        b=Py2cyvfeCCqgt6WuteSEN54fajjVpbIFV3sa5xd1v9smQOW5MEXCFZIVFcUPwf3Lav
         +zKpuDODRuHVRU1ZXEKmhuvF26/365d6w75VpTHhLtVIQzX5wgaMZJ39RqEgsOJJ9ZnQ
         wPFlGgQjPJiWIoc/EuN81LRsgxQCSgGn/GtTJZn8JqzbLoUkGVZnWLpziuCZl26FwK+z
         PMlidbPoJCjNZdfgP3QRry/L5hEEYw0v9j1ECiknAYn+4pODqACxi7lwOeuLBypbb4ct
         tpGd4vSyLuRipr4YSeFWHwyiHOXPj/uKfazLg2QvVRgIbXsqYlsCyD8bBcYrYgXbG9ZH
         Rejw==
X-Gm-Message-State: AFuF++ll5M/2ts4fgAV3TTMIyVNHm/sAaUTDskKyrSLliPZPhQmXse0m
	QOIE5VKRsOIIscSiQWGQPF5nfY3NckNIH0F7+2YQ6m3HU1dnHZs9wNj0br719oAEkzA=
X-Gm-Gg: AYBFou2BsufvmxD0T1npvxdUeYEZqmBdRlz1QR8WwzdzIbdD4oQHUpg4pZL+IKmVWgS
	IT42KwVeQharhmPb1rO8Pv/vCpjKO/lQr085fNP/NZmoYixBfLHfJ1ElOJjB10SNCJLnpJ3mjuE
	BJPwb4OCjnvWrY717147CTx7Ad17DVNvDU93j1Zx8u4eAf1KL4EdWjipcOdB8PgkYtgDRvVBqEV
	AgStzJmsE0etr2cAwFJo8vrjtJTOVeM7jxuq6bgd6xmbFOopcL5mLrXuYqtq5dtlNyXldL/G9al
	ytAs1VN8rD8ePMMdlr2JPNkym7Qc2d2RP8oyZcDozVtDPtVyzVVzR6EWcVUgwS57LCpk78uoa5X
	r1ElsBFe4lDnqUUmbmxyGWNLpiyeIMFLnAaCxQ2dzmo7Bdaslk7kfpUfWx5HaCrBF4kri7Txu5u
	xOuoOajSAjkeoCGA38HGR+w3cjOCWlkcx/WlCcGTIKSEar343dGy8JjeGOZl9JPET3lHCejouat
	yIC4YqL29w9mPp4XPBp8o85n4lLAwxGz1JH
X-Received: by 2002:a05:6830:6614:b0:7fc:ae19:17ec with SMTP id 46e09a7af769-80de33eca91mr12678811a34.29.1790006686091;
        Mon, 21 Sep 2026 09:04:46 -0700 (PDT)
Received: from [172.19.0.10] ([99.196.129.128])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81475bbf4a6sm363151a34.6.2026.09.21.09.04.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 09:04:43 -0700 (PDT)
Message-ID: <bec7f54e-1f53-4d07-9b73-ee40300d6675@kernel.dk>
Date: Mon, 21 Sep 2026 10:04:28 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring: fix cloned compound buffer accounting and
 R_DISABLED restriction bypass
To: Hui Peng <benquike@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260919221725.3706704-1-benquike@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260919221725.3706704-1-benquike@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/19/26 4:17 PM, Hui Peng wrote:
> Fix two issues in io_uring buffer registration and restriction
> enforcement:
> 
> 1. In io_uring/rsrc.c, when registered compound buffers are cloned
>    across rings via IORING_REGISTER_BUFFERS2 /
>    IORING_RSRC_REGISTER_SPARSE, unaccounting on release can underflow
>    mm->pinned_vm and user->locked_vm if head pages are unaccounted
>    multiple times or against a different accounting context. Track per-
>    imu accounting ownership cleanly.
> 2. In io_uring/register.c, enforce IO_RING_F_REG_RESTRICTED on rings
>    created with IORING_SETUP_R_DISABLED so restricted opcodes cannot be
>    invoked before restrictions are registered and enabled.
> 
> Fixes: 735729844819 ("io_uring: move rsrc related data, core, and commands")
> Fixes: c43203154d8a ("io_uring/register: move io_uring_register(2) related code to register.c")

Sad to say, but this is mostly a pile of garbage. It breaks the current
and documented use case of how to use IORING_SETUP_R_DISABLED, and if you
had run the test suite, you would already know that.

And the two commits you reference? Did you even look at them, they are
just moving code around.

Two suggestions for you:

1) Don't send patches for things you don't understand
2) Upgrade to a better LLM, the one you are using is garbage

-- 
Jens Axboe

