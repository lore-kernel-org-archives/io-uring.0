Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794882102;
	b=GIuopJ79eqDcbzT3abL+PssyOEK8eGKIZmEGkkk5X+6UqmxCUDRslBtqxiI2AktO7uOH
	 i+xyKh/mBdjEW2w6RVETp7L9jH5nDmYZF8YIW2mCAOE6znyEiZq5RNLd3YDM9hr2TUttH
	 gwiLOlwMy1d5l8NsiueTmvt1UhGSppjg8UvDiXhytTXqgvlwASbbNLg67ArcxQCGydbYV
	 +7nOx7Ope4RkQxTCqN86l9ARWtKqF7gAIOTDWAckm1irsEboZXTczZ3VW2SJrpFMH70Kj
	 GMEA534Bn4t3M9GgbszvH0hHO/T5NM/cdmx7C0JIrw46v4GpBtNIZLvXQ1siEB+bkQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794882102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ncld42tDn6XcKva7+KFXwbd1kjlUpIEInfIcN7jos5w=;
	b=GcLand4YDB6/GEK32hDlirJRIBQQ4t2lyxHh33SevCNy3h2uOURDmyU/dwwYAYhmrI0j
	 +nQ1cNnyxdtKl8QawfQF03Ff/aNb6JShG6VjzyEeNKXFgNeCjghwRQ2+Lc//zf9JVm/Kb
	 os8RIfh9zrE7FMEj7YlPIiAt/xQx5HXDWgM7sKMBr+6OOgtRtkr11qO4MguVB73D98y5S
	 3lRm7yIdoxzd7DOo5/9t7HcmC5FmivHkih4Ke6p145PEq6GPro3e9dEtXBllBzYhdwWfj
	 cD/e17oRNzpBZIFekZCzZU4LNCIzM29oHgTxQLlYtI0MUhqtl0HLXwrmERtUQGDGzTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ap+DPoBE;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE23606A323
	for <io-uring@vger.kernel.org>; Tue, 17 Nov 2026 02:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FE23606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ap+DPoBE
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-38133db970bso701562eec.0
        for <io-uring@vger.kernel.org>; Mon, 16 Nov 2026 18:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794882100; x=1795486900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ncld42tDn6XcKva7+KFXwbd1kjlUpIEInfIcN7jos5w=;
        b=ap+DPoBE17krcJNjdiBru2o3KKfNUg1GqppeX7H87tHY0/EgdFC55amn498E/TRGjI
         XOkt/8dRiA2ZEWoKm2mXahBPIGJj5CP1RNfob9xIUSEk696eyS7bboReH0vs53MS3pxC
         SlQVJq7Jp5mHiDczDMSuyDBXFvNVWASOX83rt7zkUtQIoJIxe74zqjP3gH0SIdDj8A6L
         hMX9qTAAGxgqVJ1o7lfHqnl68D0hhTnPhsFqFWopSkWRl55CbFV3SkcrsTgXu7z2jtTT
         Qj7JHCgSMoyjMokpywBA6Fp3/5cD1ijtcBTMlMdvVgBdt4lYdZDEz8BNu25oJt7J1SVV
         cv/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794882100; x=1795486900;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ncld42tDn6XcKva7+KFXwbd1kjlUpIEInfIcN7jos5w=;
        b=26RBQnTjyh1NTXVWBmq7uTw42KPdyvs1hhtZNfq2qhkKcPY5HIIEctboPZbabuIwaD
         YTs7Yowh+otDgy/Dwjf1nlUgpmiMTIcvvJnoJJKEJzNF1UcgwHSY7QI9AiCfacS3X2rb
         4yKw1bN43L/vPHqEgDgYeR7WXlan6zc2rKp1d+oas5nzj0dLNQCab+bNqr37nx4M55eL
         LcqL0a7cSdwxJTGSpou8Tna9K19X0SY3jhfxpDJfqloOmwUhSSvELTPf6AvIwFMpIJEd
         2D83qrQ3pyUZdULuo8/YqPTo70sU/t2p8gEt7ctKDc0tJmt0aswyDH56URTirN8Q42Au
         o8zA==
X-Forwarded-Encrypted: i=1; AL+hErEYG8rdK8nmsUVKC46L8Z9OyJsIZ7ne4nMCt36XtdfJhZ7ULe1olwh/VUbZgObzzGtPjmQFdlClQw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Pp+tjmpplb+Vnb3eFeUqlyuF7+kvs0jYYDFfn7jQL+rNxvhC5
	pYYKp9BzKOFL841bI05DcYN5/eLtH7nThNIXfVVdU4UDexLrB+1CrtZN3Y0TDNxMbFI=
X-Gm-Gg: AZFdTZcsmo9mtGKR+guMlUn9ZOBBD2Hr5H1oe8Ns8IiLMS3qccf7u6li+06/45a+Qob
	aHUMc5p/babzZPXMLAc6CZeAfY4S7lEj34gwTwlnD43OW2cgNEW1hvSC/TZ8GtFxSuOmbtiU3W8
	GBAO5mvgbM/E7D1X5foZvpRmeanzvaKheaaFv9edGI67XMgc5fkqB4fzEuROoTASwuzGqnY8ixz
	D5sQefStwB5AG9JpNT5tLyn6eQESInIOKiukgTpCtBbhpLNxpcC6mxkvi4gYOlMuKisXk4xOdze
	amElEPYKDvPQMH/DnOKoo60GSQ2os1DjfEJUOFbl51L7w5Lj7287rsnVBbsoSnl6p59pIrueNyu
	wyjwhRrDzSDS4RLABLIo91ooTmJoYDrxTiKgRj+ioZArND6Djy6itNqX70ygdKe37YM/3uAy4eo
	y3JbLCFlrcfxsgXc9pEwomJwMhcxMXDcN4+ZCXgscwP4H3orUgdRoagGsfGuQGNg7KMzWOHX7yt
	+3/Th4MbKrlxpu/7UlNvI8MksSx4hZ1/WNrW9NcAZ+t9eJA9Ee+Hjk4AIDlQsZt7L694AGR/4hR
	pTLdY7075Nw01cD9b7MTWIWd1Vy2zL3DasJ9xNBa9/ILKhxBnBkz48xm5RYJkKIYLpiwfyD00RY
	a7yzNgljgRsnG
X-Received: by 2002:a05:7300:dd03:b0:351:2958:1740 with SMTP id 5a478bee46e88-379681c67bfmr11608907eec.37.1794882099628;
        Mon, 16 Nov 2026 18:21:39 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm47264660eec.27.2026.11.16.18.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 18:21:39 -0800 (PST)
Message-ID: <07947062-2974-4630-90db-1556e25b50bb@kernel.dk>
Date: Mon, 16 Nov 2026 19:21:38 -0700
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
Subject: Re: io_uring/eventfd: registered eventfd signals only once after the
 cd305ee3633a backport (6.18.y, 6.12.y, Ubuntu 26.04)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sasha Levin <sashal@kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 Yufan Chen <yufan.chen@linux.dev>, dev@rebasedinc.com
References: <oMhla8VwCWoihfrmgn8znIy60W1QXI8g_v2OyB9i6sWESIDlVJlwoGGOLylJgIHRARNoieXUVRGqzeB__KvHMdXgnCfPPovs8vLMOzaMPEw=@rebasedinc.com>
 <draft-agent5-0001-re-eventfd-signal@kernel.org>
 <5d92861f-9a4d-4810-8700-b9e457ed9c86@kernel.dk>
 <2026111605-deskbound-clobber-a4a1@gregkh>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <2026111605-deskbound-clobber-a4a1@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 2:52 AM, Greg Kroah-Hartman wrote:
> On Sat, Nov 14, 2026 at 11:12:40AM -0700, Jens Axboe wrote:
>> On 11/14/26 10:42 AM, Sasha Levin wrote:
>>> On 2026-11-13, dev@rebasedinc.com wrote:
>>>> If this is correct, a backport of 04fe9aeb4f3c to 6.18.y and 6.12.y looks like the right fix; it keeps the CVE-2026-80920 fix in place.
>>>
>>> Queued for 6.18 and 6.12, thanks.
>>
>> Yet another bs CVE - Greg, please invalidate this one too, it's NOT CVE material.
>> Getting a little tired of chasing these.
> 
> Now rejected, sorry about that.

Not sure how we improve on that, it's really annoying to catch these bogus
ones after the fact?

-- 
Jens Axboe

