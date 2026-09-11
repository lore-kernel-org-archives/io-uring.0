Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDC9372661
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141851; cv=none; b=Ro2UfaHoHzmWgwM2Zjc9UJgLsXBcxo2Pjtfx3TrWgGsNeX3tVXlR2w8QJbJTbF0SExjhVf7V0lmNQ930Dn9XXXMczUAhVzv+wGzL8YTfHBAIdPBdalG2x+oYG6636TxsFjuTvKJUbKC770E44V0uKMLtZhwDgdhXY9Qje40+LnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141851; c=relaxed/simple;
	bh=lFx27efnX9UzeSOWHfI7BNXGclv+O1lU7S+eE3R4UoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PerfAWvl29KziOzeyMtP0scNpvYjcvgxUrjRpGyK8iNwZEyxhk9nGkT2xSPnwB9iYH+GnLpIDtH7S7TQLdIyji99FFCg4a5ojPBJUlhGfj+UsMjm2AOWUM3koyuFa7rm6MqTSMasptXtDYfOXgRscs97zYS6NAhOVmhchzyljLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=yqzZP/C6; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="yqzZP/C6"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4b21f09ec76so974922b6e.0
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141848; x=1789746648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+RXdz1vIBd9o1nlraikrE27tDySEqddQpbtBN4SlMmQ=;
        b=yqzZP/C6cRAKfE5s6hwlEYpICR1hHE4gmlyFODsckOT8j3SkCuof3+rh8JG/qq5Emc
         Ej8WCAdAhSF2uvnewDBvPtyoNgqdjxkonkgLreTzCisLecRWmW5Vmzk4rJuHxOKBY897
         h0XSbZii7izvMVOL8WZq1oZELy1gWqqRo3RN4BsOk5Zuoi+AFCYKCpN5cVjwd8TcPS8j
         7OEkB5t62L2CKV23j9J73lvxfPULnZumQSIL0NqXp0pYIgWpHj3Ueiy2iRjLgRDieAFY
         iIKkyIKhfXbf5WFddn5lYs6D3OmrD736JelIyZ1ofxgrCTzaf0sUSpMKkWN+tKzwJ2tZ
         PAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141848; x=1789746648;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+RXdz1vIBd9o1nlraikrE27tDySEqddQpbtBN4SlMmQ=;
        b=ctOERBrzOTj11o1edZ5qauIwstpjtoZVlWZkfqFtAEHwxRYS7yf37XBr2nwDz46TmA
         ctV9olPGCFU80ezZPcE9C4ZcJ2wRkE3/p6ciVyYXKzI+7NoGpGrb7ez4gZlQIWMHqYHQ
         UhOVTjh5VIDCX2eHWd9oJb+2JDLzvkrqP7z/6IMmMQ4Vh4sP+ud3WU5jz3loMLG0njvp
         sSA028aklzyRTpL3XkADPk3kBmzSic2krv1l4c2W7RDrYgGvocoPEiJ7NJWehVnb71uD
         ENBVsufpcQN/V4JFmovZwpZ4zSm03DDzfij42GisC5yPkbxbNBk1GZEDrqpnw5T+XtYB
         Y5Aw==
X-Gm-Message-State: AFuF++lt7srJksBO6eqTzmK4KoaZ1/s2TKL+7r/bTKqDZHn5JtaTf6pp
	HQrrJ8wwBunzfArj7iFcYitldA31Crbqet18mpRdMNv4bM6nznzHXUbas+czk26lg2M=
X-Gm-Gg: AYBFou2Uqw9i8VAFU0b+sT1dkHyJeVn6EtsUW06S2OtZwXUiJGBWRTmIH/vMqIutSwm
	gMEdQRBJolbQT3WlQqn1MSgUT7T7y9+rfFbT8LGVfMCDSzkP6qLhokXCbFiFcu0ngDkB825gj00
	GFkF0/Ck64Gk48wrtFay38HTf3N7Fr88K6U1gC0EeY2SrvSH8p7VSyzmsDr9jcGPB6Vr3eEM+KJ
	/aHcucIl23o1oNiYvyFErpVTLmeO0GDURpRb821/GrtMggMU8ZKexM/SV0WIyqzTb8jLkXDo08i
	o4565wD+OH3Zbf1x1NfKEjggFkFWX/EOa4zVUivMgn5+juPPJdF78PB7JY9kzTUK5u0SUiUJMyd
	RYdUJCWaZQpUqjOGEirq0bhqX8CE96Bl5bjU6Q3980r8qXK4JtoM50dF6T1h2x/ludLI7mfg+Gv
	ioK4ezjFXMMLVGJy5fMn9yoFXXuYPy3nSY5rUv6T150evgA7PZGQ46YicH5WpzUsqlJGgiyuI0u
	OZJ+sepb5SDZAvc3wYRrWZ+J2P/pwfXcBcf2sC7mF++ydvGUu4abJe7
X-Received: by 2002:a05:6808:2e4f:b0:4ab:3210:b31a with SMTP id 5614622812f47-4c31d66761cmr3843900b6e.14.1789141848604;
        Fri, 11 Sep 2026 08:50:48 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4c331bc937bsm2418504b6e.11.2026.09.11.08.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 08:50:47 -0700 (PDT)
Message-ID: <5a656a9a-afff-4309-9007-2fcb6d3ae1f8@kernel.dk>
Date: Fri, 11 Sep 2026 09:50:46 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/fdinfo: ignore IORING_CQE_F_32 in last CQ array
 slot
To: Jann Horn <jannh@google.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dominik Maier <dmnk+artist@google.com>, stable+noautosel@kernel.org
References: <20260911-uring-fdinfo-tighten-v1-1-47c62a154aca@google.com>
 <CAG48ez1dbEXQgvvAxchiiakym7KJntGFJ3f_obfnDwFouYZQnQ@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAG48ez1dbEXQgvvAxchiiakym7KJntGFJ3f_obfnDwFouYZQnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/11/26 9:44 AM, Jann Horn wrote:
> On Fri, Sep 11, 2026 at 5:35?PM Jann Horn <jannh@google.com> wrote:
>> A cqe32 entry spans two CQ array slots, so the last CQ array slot can't
>> contain a cqe32 entry. If the CQ tail points at the last CQ array slot and
>> the kernel wants to write a cqe32 entry, it uses io_fill_nop_cqe() to pad
>> the last CQ array slot with a dummy entry and make the tail wrap around.
>>
>> However, malicious userspace can directly set IORING_CQE_F_32 on the last
>> CQ array slot, causing __io_uring_show_fdinfo() to read the second cqe32
>> half from beyond the CQ array. Change __io_uring_show_fdinfo() to
>> explicitly ignore the IORING_CQE_F_32 flag in this case.
>>
>> This is not a real bugfix, just tightening the code a bit, because:
>>
>> 1. the number of CQE slots is always a power of 2, see io_uring_fill_params
>> 2. the ring_region region consists of:
>>     - a 64-byte header
>>     - pow(2, N) CQE slots (each 0x10 bytes)
>>     - optionally, the SQ array
>> 3. the ring_region size must be page-aligned because it is shared memory
>>
>> Together, these properties imply that the last CQE slot can't be close
>> before the end of a page, so the "out-of-bounds" data is
> 
> Oops, sorry, somehow I forgot to complete that sentence, that was
> supposed to be:
> 
> Together, these properties imply that the last CQE slot can't be close
> before the end of a page, so the "out-of-bounds" data is in memory
> that is anyway accessible to userspace.

I did spot that as well, thanks for finishing it. Your fdinfo idea keeps
on giving, at least this one doesn't really matter :-)

-- 
Jens Axboe
