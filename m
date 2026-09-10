Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8952E2D0C75
	for <io-uring@vger.kernel.org>; Thu, 10 Sep 2026 20:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789072956; cv=none; b=tAPeXA1RNii9GKNFZ0V4Dq8H3Yswd/4S+TCJaSPcg8bwMtyOGAL74pQkTzMSnaqqIsToQ7C7iCDyRsXx5UuF+EbpfIgw9b/6Sc7ae8oq7g5VMqKcGue5TMa3tBpFQa0K3xMtyASmZ3AZw9yhmvVYRyu2tS9TmNscwj35LIXrG+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789072956; c=relaxed/simple;
	bh=T8AI6zz98YT2XvxQexh25jUz8hb2aezWsx53Uje81zY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hlnXnqCKya+c3ZGp7SZ3Pbd22lJEcBmZJg7WRGXfedMHZcHLcvMECKGr0CiHju8dwXQFzuFfAbO5G/Ap7WaZ4sd/2Bcn6feryeI3ouv8lVGQ3gYn60NmOjwmNM2VR6O+n57DWVuCMocm7Qn9wEUsgHHVdbUIoVto6C/8RwVrew4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=w+w50t/D; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="w+w50t/D"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4a483a552efso140104b6e.1
        for <io-uring@vger.kernel.org>; Thu, 10 Sep 2026 13:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789072952; x=1789677752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EJeMjEnGwE6YfwsB0ZWzUhZX7pW6U3oN/OTqHwlEwzY=;
        b=w+w50t/DcUyo5Idks+n9jIiWfXcV7oQ7XbleirNFB1k3EmBg2fS1m8KGBt/jn15U8B
         wNST0Nf9+lp6PQ+vkzR7zvzbxIjzZ43ImJ2QZi0rFDGxFDZnBVq6Pq4SILlGOkLLnEBo
         NvSlrNT3dSO/gKCWzCRX01zHWyAy45SrnPHxxSe8ZMK73UINvqKJ4Uz3pvTNJhpH4z19
         W+WRADR/Oq2fd9St5Q8cOnkJCkYAYexWpXpoHIdR8UnovjEM2sHuIWyy1GAUI/jg4qGa
         zv4dmG76bO9yW2PXEHED7kICYDnrLtkriI0ww8qKLAswR4SLH1qToIbs0VRwkWXmnsbX
         /qXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789072952; x=1789677752;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJeMjEnGwE6YfwsB0ZWzUhZX7pW6U3oN/OTqHwlEwzY=;
        b=nF6C0vJaHSeCU+NR7hi5ukDpY6f4dbWW+yWIeLJXe4mDraJjzSaleIqEXsF9OaAzbr
         b42Cb2SYBAAWLvehXclJXL3eQ4CMRsChhGNCNVLrUhFU+xuP/Jidq0m3tV3X6GnbX6GF
         kEDyPweL25TwUUTKJY23Z8wFtitKWzPOTV6KpLfIBX8x9uOzZ7F+PKVJ9EnZWzNr+IKv
         9jposlP/tvTjMhhZYYbxKCZIj2kQtUV0BprjJV9wVWGrKW2KXULYDB2AmCy995YYTbkB
         1ENHpAnzdPVhO5WL/Fj80fyLK1j6STbLW2MV1IUARoadeBEMeIiyyPSRgaKmlOT16huh
         ZpGw==
X-Gm-Message-State: AFuF++nu0L125M/kxlGTGteJISoUqin3Kp527nsdyojLDmYymKftaq7j
	j52CDvOHmHOaUFFIQbTGfcWiyB37pgoz/1u27ASj/OUQuf+EgS7e+d0YfZg6ZJmBrbo=
X-Gm-Gg: AYBFou0hB3BPeVGhAVSpMv2J/Vnet+/nk2mwBF5Jim47RrZcqCC22e9RTA3WT7URJHO
	2d+uPVmhd9eeRC6p+3hLAhE6hcx3q49fFgUy+8mWGXEipTh4zcUFuKdmhMwAAKD4bPPLCfzGg9V
	dk/7oQaCzsYL+YwbI9ppIp04VBiewweVUZpxBecyicBKjq9LU2duEYLs/i3gzGulFygZkCrTfek
	o6yK05xQ0DmwBbQl30vPEL4fOujmFyKzh6FdNAy0j3jRH65oMGRRunILbEI7o3yoMtts9xxHfBO
	ROgOKJMvZWOIYE2TwaubYqRdv8EUQCMAkwPbA7KlcWv1O/F9PPP6tOYi93/497O6lQeUZjShfMh
	VfXHoHVOMLeWQQuvAb0F8V8GX4UayLqKWYOELgpL5YIOcU0ltCqexkxhvnaKDDOnbFSUSzYeg9I
	pg3ksRUjQb1yPPgWC6/pKWtekJ8YJOASnvQbDNa7/NZg0pCk1J29kOP0dpCRXd/QGDXNs607T1h
	wW2lMNIhqsQkUL025UOQ5HTAEyMlaSUvyPRAk4oAPkM+7EuzIam35I0
X-Received: by 2002:a05:6808:6d97:b0:4b9:a88b:8882 with SMTP id 5614622812f47-4c31bceee11mr683144b6e.24.1789072952050;
        Thu, 10 Sep 2026 13:42:32 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4c330daa69asm265238b6e.5.2026.09.10.13.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 13:42:31 -0700 (PDT)
Message-ID: <f62ed378-6dc7-4574-80fb-54b07f7bcf31@kernel.dk>
Date: Thu, 10 Sep 2026 14:42:30 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] io_uring/net: don't overconsume buffers when using
 MSG_TRUNC
To: Gabriel Krisman Bertazi <krisman@suse.de>
Cc: io-uring@vger.kernel.org, stable@vger.kernel.org
References: <20260902230041.1320658-1-krisman@suse.de>
 <20260902230041.1320658-3-krisman@suse.de>
 <0f5e8693-dcba-4fa8-87d1-570ac08e2d83@kernel.dk>
 <87a4pp2iog.fsf@mailhost.krisman.be> <875x0d2ij4.fsf@mailhost.krisman.be>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <875x0d2ij4.fsf@mailhost.krisman.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/10/26 10:11 AM, Gabriel Krisman Bertazi wrote:
> Gabriel Krisman Bertazi <krisman@suse.de> writes:
> 
> 
>> I'm folding your fix up in the v3, modulo a compilation error.  It only
>> changes the error path, the bug is still fixed on 7.3 with your patch
>> folded in.
> 
> Please scratch that.  I misunderstood your previous email. I see you
> applied it on io_uring-7.3 with your fix up.  Looks good and the
> test still passes. I'll turn it into a liburing test.

That'd be great, thank you!

-- 
Jens Axboe

