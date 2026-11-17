Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919302;
	b=OqCjU9gReuPz+qX5QRUjbGg53zg2qFuvRy3fouh3WSyv+/zZZ7s5xVx4i3ysc5AY2oQt
	 gtAM2SSEmoF0mpvzvABZf+9kLFPKcbe6XfeDeVtPjH+u5kDbRMFOE67NRDT9B6cBkV3+c
	 sp0Y93QxovAoM+GqJ80p2sziqS9KFCdOZMGuEErdnY13LfeZMMKMIIPZ/5cCj53LtUKMt
	 E8w5kWuNTLHaLC79REotwDIIoYqvu23ZIqwm22VEpOHEQIpu41ODu4t3MAQblV0nsTcaI
	 6wZV+lS5F82TQpSVzvd9aU28wAuSAYw0vxksdL1ScHlmfm4ogmAJwXx48J0RPKursbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1IVyeO+1a+UEoUFAEeGyg3wRuHKRPD8XKIf5x8LdRDw=;
	b=UvVV0H04cORfnBmPl4MhxJGZUusZo5vRcmlDmw+wcxPmlAdehG2pKqmrange/uX2PDli
	 OKaj6cWiJbW3Cez2gN1h6LFumiK9V6SBppg/jnn/vbrVuIHRZffEkTom9ZOkI6daY64UW
	 fzIQ+kEywK8PcyYCyJymqJWm9Lt2PUB1cnjbTpTKIkND7+RQ0yOHvHO9CFwv1lJT2Fqch
	 sPVQ4MM3IxfzqI9BJ8supLxbbz9REoDtnHyyMu3fpdbnuSnqpCkQdPmSBeSj0Fz4CPczP
	 +sNIXXQBhbFFfIBb6JNxSM8baZQ27zpod/zmN/hdHRdzbMcx32awAGHRyPVn2Rybwnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=B1ZOLUMx;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CCE606A323
	for <io-uring@vger.kernel.org>; Tue, 17 Nov 2026 12:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23CCE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=B1ZOLUMx
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a8cc11ac42so4835363c88.0
        for <io-uring@vger.kernel.org>; Tue, 17 Nov 2026 04:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794919300; x=1795524100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1IVyeO+1a+UEoUFAEeGyg3wRuHKRPD8XKIf5x8LdRDw=;
        b=B1ZOLUMxRIQZ2omsvrNF32Ingzg0YF2gYszNc0e2KYCrqOj6iVmyJ6iIU1g388D4p/
         z0zy1b+Bj9J9P5i6YnErrDZw31LzTqD2vzzej0jW0OZMSpa/v0HGRUNFDlosjnFTQf01
         f7iot5v7pqmRJaOrfqYr1CAVVFhflVoUySmNjCoUvMGwvxU0za16ejM3/azCNgaSoiHK
         xTsG2j4+4jofok2FMF7EXnkpQQICizxEguByn+vbl2oLh3UDshu9+7yOQ/bGzSP6FtT7
         3TOqvKnxLq7cIP/Kw8l5V+rPKmsE/mi9ltds7bjkbyKXroy5nZ01mI+ZBatQd3tBIp3k
         ZR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919300; x=1795524100;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1IVyeO+1a+UEoUFAEeGyg3wRuHKRPD8XKIf5x8LdRDw=;
        b=1VeCqlu5qT9oRCs9EqtnZFb8W/moCI7+fEz+v227RGOD3plZoGf7fisQ/uOxETLdm3
         QkwNrvZcqZssHdKbTbfLwhMog8QXWTHvDlGgwAWtKvzgtwOU22upWAlCmVznb64sw3Wj
         ekioBiAvuB94qdOBxYxGlMwmFAyQ45WDYdgUZ/e+zig5MmxDRamut1sBGDT/vAIp7WOE
         zz1V522GgAz8TsfOZrF7w6mM5uMWrGX4SHvq8tUTEsuRsPjlu0y6KiL5+3Uw4MhiJ+I2
         wjBP8s+h4mBhvREPdubBGnv2hrfyF9ulYxDB0QShSDFkJRE/Ov/5xsBghCgRAlAhzVg5
         qXNg==
X-Forwarded-Encrypted: i=1; AL+hErGmssjldcfYwU/ty7Cf2DInietptZllESfzI8kDj8ABrwMAbs5uYucnm0CyHoVNlMNDj/5lFIVBAw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9kODPhojplllRTiJ9Mo19hoJN6qSHvH/l+KgiFjybZ6zBeZySV
	uKOZovl2vPZWW+NPfl7sSpgSijM3RTGmjLDjuWGEphGQTUocTj4DnwuNgsyz5nwK/OGm3LimAMW
	dbmay9uI=
X-Gm-Gg: AYBFou0g144z294BQlRjbjW35y2grMNFH5/HZ4iBgKvbQ/yqqSCfvxU+XADMMdw6jB1
	kQfJKdBwEF8Z+7L4ixmLbCQ0OXNzBoEY+X9PaWjzjaxs67pE8gUSPZqLLrIFDJyyYy3GtMwtmra
	HXgIghrz+OCGddV3++BLAiXIUmbvVXyEer/uUtQm5M373pPWOxdg9sUbJ4ES8sUbhTv5pnvml7E
	nVweIEsyGoPcqfDZzZv6F5tccD9uAh3tYNouf/gUCtOkRdu7Wy+ts72kAtU0PuWR2WAvBg1IUz2
	E9Fal7Q8wGSU7sZj0QmAalRhtXB2tUZ7fgTewp3p9tlcAct3aYPjXs3cH447Xw9TH0EhOzt/MtZ
	DvSQgItRubg8wVMvOKxbEQCn1pXAtM0ZuVYCkAMLLFVBy7C9fkWLtqyHtTq/8SA+XHYjr89r0Wz
	e9Cy/oI78z1QZf6muQ4mUDwu1NW2/jqkQWOdWbPPVrRVvREGrWH6bR8Hag8f5be8OeA3Ir98Ow2
	upq0mG0p600yYQHIzhL6NSxNdviNQ+r2nMDGIha2vEDPrNwVEkyqsy8zd3Jfwe1WVriUzosVP8R
	J5WQTOxg0CVnNZw6J6OlZgUdpGxmLJaV7qSjjEYsmjUvtYtOyEN6dVuN3MdkTqKb0dWuXs+aK9T
	UXTw+3zXEj6JT8WKjMv8kmVifzDkvDKa1j1l9f8YS3WEgIgZ3z2lmN6qjSD5tZqtgoq6u5Q==
X-Received: by 2002:a05:7022:3f0b:b0:1b5:58e:b544 with SMTP id a92af1059eb24-1b5058eb8a5mr12673146c88.18.1794919300160;
        Tue, 17 Nov 2026 04:41:40 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm41932955c88.11.2026.11.17.04.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:41:39 -0800 (PST)
Message-ID: <1baa1686-1dc7-4df6-b61e-e43cd5de110b@kernel.dk>
Date: Tue, 17 Nov 2026 05:41:39 -0700
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
 <07947062-2974-4630-90db-1556e25b50bb@kernel.dk>
 <2026111722-unfocused-ride-065c@gregkh>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <2026111722-unfocused-ride-065c@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/17/26 12:42 AM, Greg Kroah-Hartman wrote:
> On Mon, Nov 16, 2026 at 07:21:38PM -0700, Jens Axboe wrote:
>> On 11/16/26 2:52 AM, Greg Kroah-Hartman wrote:
>>> On Sat, Nov 14, 2026 at 11:12:40AM -0700, Jens Axboe wrote:
>>>> On 11/14/26 10:42 AM, Sasha Levin wrote:
>>>>> On 2026-11-13, dev@rebasedinc.com wrote:
>>>>>> If this is correct, a backport of 04fe9aeb4f3c to 6.18.y and 6.12.y looks like the right fix; it keeps the CVE-2026-80920 fix in place.
>>>>>
>>>>> Queued for 6.18 and 6.12, thanks.
>>>>
>>>> Yet another bs CVE - Greg, please invalidate this one too, it's NOT CVE material.
>>>> Getting a little tired of chasing these.
>>>
>>> Now rejected, sorry about that.
>>
>> Not sure how we improve on that, it's really annoying to catch these bogus
>> ones after the fact?
> 
> How about we make the "rule" that we don't assign any kernel CVEs to
> io_uring things unless you ask for us to?  We do this already with the
> xen portions of the kernel, but it requires you to remember to ask us
> for an id "manually" if you want one.
> 
> Or any other ideas?

That'd probably work. I do the stable patch series anyway, could note it
in there if a CVE should be assigned. It's a better idea than the one I
had, which was to note it as a tag or avoid CC'ing stable on patches as
the latter seems to be a key criteria for you guys.

-- 
Jens Axboe
