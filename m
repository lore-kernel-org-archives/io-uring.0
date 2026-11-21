Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795298362;
	b=rKqAKk2mRhZPciwoKfoFAoW5AlGWBbH5FJm58BCP3DIEaOze0J8Zhe6IoZcwmY5Jeuvh
	 kFTmYaYdIuaEoki/hmRwqHMJKCaYPYjlusE7+QMG2p4HakwMap+D6i5wKrJS0L3+3IPse
	 rtGnciVdfKpXWPWuOq0aN9ncX9WN9wYrgDhRCnBVkgsECQWhUxJbjmbWCpZqWQjAKRsVF
	 nwKODZQZRR8gSH62aJodbWjGkLLwnfyW9bk8ntLz9QcG1jim1oKofyGaE2Nwbw0BRyOpt
	 zNtfOmHgpwWJ91bl9A+RXQrMaX1JWMS7LCvoxjVjbV8z+qHPPFZ8ASRZNrmbMOeybwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795298362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=cizSpuD6AQD7saKDCptAezv8VsgPBzDcqDJo8Km8r6w=;
	b=TjWnCShov/p+feMVNntqY7HOXTeFINdNQBa8ItbHTOISvid/rTJNtzoXVziR8jWOn/PC
	 mME6eeBoBSMHXutrYPVJYNq+NKkcX7KYfXxZ+xw+fC+mFfdvg43z0/mIJrq4NYuDcOJDj
	 Sl9gLcXggKCCccJLm9BQupujRUGO1JoWC/lAsRYeluRas7hSSrPSTROU33aWoNhz36S9c
	 +eEEa2tIF7R1s0vM3IIXvN006itDMCuB39wBeDMdVfOFui/eSdQBeEwIpHXDGKe9ybfgH
	 Z7zzeve0tInfUQVmqbO6p7/wtb9qxqWO1xh/v2trfjxl6f4xzcn1p3cnUC/fSWD8QvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=o1ddPjLx;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05AF606A32C
	for <io-uring@vger.kernel.org>; Sat, 21 Nov 2026 21:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E05AF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=o1ddPjLx
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso1010417a91.1
        for <io-uring@vger.kernel.org>; Sat, 21 Nov 2026 13:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795298361; x=1795903161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cizSpuD6AQD7saKDCptAezv8VsgPBzDcqDJo8Km8r6w=;
        b=o1ddPjLxJdJa2bMwWiU3woIQla1Jtio2NftVkFbtIJosheg7D7Jq/Wyh40e7AYheUj
         t7mBUjZ80VxMeiTMhtA6pKUmCt8qGiLYF0oRELBIx6kW8RpCEqfxufgzMqvSqGDKWFQi
         MuvFyW4zoaE0cDVcWZEj5SuhaAZ6da++28h++DN0UHTwSZCf5gHe8Ai480LBMKfBS3XC
         oOQRt6/BR6G0wSnDpfGI/zi0QgGaPbzBMHQfPrNdyMFgywnKuHk22fHwJ+t1tDxJj0A/
         Or/vc22zD55E74rQ4LzfKj1OiDIriVEVJgvtxVVC5Fip0MJDdXdkmT0dqOQ+vA1yOZXE
         Zynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795298361; x=1795903161;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cizSpuD6AQD7saKDCptAezv8VsgPBzDcqDJo8Km8r6w=;
        b=tOx1yOmsBOfC+J+FDX7NxMvH+ymUl0UA7fH+ebRBpMrvY40DgcNY5LxhcypZMa1iga
         SdnKa8K6YX2xxBaBS7phAQCxuvc+1s6E6pW2YtgNvLgSpYcbWgLYAK11VjTPo8fgVUFQ
         Wq7D+/Zem3jB2iRkgmxbec7tySZORzvpE1fYF/YuHRkxn9stdlKK98Fg2eoRJxrDRIz7
         Igi6JS2xGaxFTOp90GbuoDKUpvD/lweJzFNVXTMMcqpqiezrzTR4IiUO7MmPfa69ylqA
         JolbWdKF2tVN8huJRVDhSOcYX0kuiLTx+1zWNFt/ud3KCVi26CSZTWdTfP8Na75trbqS
         QTOA==
X-Forwarded-Encrypted: i=1; AL+hErHhqWmmdGzuTg0FC2gH4s/io8VQQfb+X9OHZMiGAzp7M1i8dC6+xSqcYsQa9N4KC05MPJafHzC4XQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z81/vt8ZPM96egSWRKnvTTkP618oi/mtDNvSyoueUXMSKVX/IS9
	i3GRZ/VlCqrn+TFpYAgMFS9sAa5ud9kK98LKwLQpqyWwbiOp+EMH0l8zFxVN0sx7sMc=
X-Gm-Gg: AZFdTZfU4oQfoIH7NIpmstSMpXzvu/bL6s4nxepgOBcTTZNzuHK3jk1rG0RuK63smjF
	iBht0Ak6CijJydj3EdQo1VhmKV1SGZxKO/PK/bV52xvoM/qOAkrgreGGbM6w23TRcHx46aj9EL7
	PYejGWckEx/f6tJQMOzPlmsslIgbAa542LnKDwC3gTc61P2ypsb4OcGhfBmBtnFVCg0zhJ9rTlj
	R7ItrCDHE4PBJcW3PvKrExPMuncvkXsShexvEfskZXxqWH4KvK8wbaR0Pa06xXSySyHpuj2jt4V
	E03bjHklw3zLJoKfbVw5e4oFMpYtvFctEMI3n8tA3EfZ6MvWX02gtrRI29LWkq6wbiqxn/Mn0q1
	c8XU5NSvZm7JtD+wQqTDlBC7qcQrcPuomDYwK91DkgdYAlGG6xqMFj/KKdTuJJtuhZV2RFpRnju
	VwA99hQu+z407G7y2RYd1ABjk07UWq6Q0TUF7zFe//PV0hY2U6+OSG8A+hCKawmhIuqowUPRtIX
	2NUxauiuuOcxOlkxm9BoDbg4mtxMavqILPj7qazXRb8D4Q7YvBbSI28u+8t1Ms52GkK4umB0G4K
	xVDmXzO6w2Dk1CzC6Xm0TzoysPK0Hd81o3W4j0pzaJ1Cgct18+Uy73GjEq1d9+foly19dyp2tqs
	YIJNGNhN/pSyIlL2vnQF329eM3SKx4vT/rbujJnJtu8wHJA9d
X-Received: by 2002:a17:90b:288e:b0:3aa:f875:3385 with SMTP id 98e67ed59e1d1-3b41c907e21mr6285185a91.26.1795298361220;
        Sat, 21 Nov 2026 13:59:21 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b6fe711sm2622799a91.1.2026.11.21.13.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 13:59:20 -0800 (PST)
Message-ID: <d1a1bfcd-234d-41a5-a0c4-16065e5f4857@kernel.dk>
Date: Sat, 21 Nov 2026 14:59:19 -0700
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
Subject: Re: [PATCH v2] fs: shorten I/O that would extend past the maximum
 file offset
To: Matteo Croce <technoboy85@gmail.com>, linux-fsdevel@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Ding Feng <dingf3ng@gmail.com>
Cc: Paul Eggert <eggert@cs.ucla.edu>, LKML <linux-kernel@vger.kernel.org>,
 io-uring@vger.kernel.org
References: <20261121003356.290201-1-technoboy85@gmail.com>
 <CAFnufp2uT0D8-5jw3DLhQzdfpB=eSuzhmGdmDqoB7arExaw9jw@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAFnufp2uT0D8-5jw3DLhQzdfpB=eSuzhmGdmDqoB7arExaw9jw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/20/26 5:49 PM, Matteo Croce wrote:
> Il giorno sab 21 nov 2026 alle ore 01:34 Matteo Croce
> <technoboy85@gmail.com> ha scritto:
>>
>> rw_verify_area() fails with -EINVAL any read or write where
>> pos + count would exceed LLONG_MAX, even when pos itself is valid.
>> Such a request should not fail: a read should return the bytes that
>> are there up to the maximum offset, or 0 at end of file, and a write
>> should write what fits and return a short count.
>>
>> This breaks ordinary programs that read a file up to an end at or near
>> LLONG_MAX, even with ordinary buffer sizes. For example, dd fails on
>> the last block, where it should get a short read, and cat fails where
>> it should get end of file:
>>
>>   $ truncate -s $((2**63 - 1)) hugefile
>>   $ dd if=hugefile of=/dev/null bs=1M skip=$((2**43 - 2))
>>   dd: error reading 'hugefile': Invalid argument
>>   1+0 records in
>>   1+0 records out
>>   1048576 bytes (1,0 MB, 1,0 MiB) copied, 0,103536 s, 10,1 MB/s
>>
>>   $ (dd bs=1 skip=$((2**63 - 1)) count=0 status=none; cat) < hugefile
>>   cat: -: Invalid argument
>>
>> The same happens on a 100-byte file:
>>
>>   preadv2(fd, 200 bytes, pos = LLONG_MAX - 50) = -1 EINVAL
>>   preadv2(fd,  50 bytes, pos = LLONG_MAX - 50) = 0
>>
>> With a large count, the range crosses LLONG_MAX even far from it:
>> splice() of a 20 MB file with a count of 0x7FFFFFFFFF000000 fails once
>> the position reaches 16 MB. sendfile(), aio and io_uring fail in the
>> same way as read() and splice().
>>
>> Files with FOP_UNSIGNED_OFFSET, such as /dev/mem and /proc/pid/mem,
>> have the same problem at U64_MAX, their maximum offset: a read or
>> write that starts below U64_MAX but would end past it fails with
>> -EOVERFLOW.
>>
>> Add rw_clamp_count(), which shortens the count so that the range ends
>> at the maximum offset, LLONG_MAX or U64_MAX for files with
>> FOP_UNSIGNED_OFFSET, and call it before rw_verify_area() in the read
>> and write paths of the VFS, splice, aio and io_uring. Where the I/O is
>> described by an iov_iter, truncate the iterator. This is what
>> filemap_read() already does for s_maxbytes. In io_uring, also save the
>> iterator state again after truncating it, so that the short read retry
>> loop does not restore the full length.
>>
>> A read that starts at the maximum offset returns 0. A write that starts
>> there cannot transfer anything and still fails in rw_verify_area(), as
>> do negative positions on files without FOP_UNSIGNED_OFFSET and counts
>> above SSIZE_MAX. For files with FOP_UNSIGNED_OFFSET, the file's own
>> read and write methods still decide how much of the shortened range
>> they can actually transfer.
>>
>> rw_verify_area() keeps its check, so callers that are not converted
>> behave as before. copy_file_range() already clamps the range in
>> generic_copy_file_checks() and is not changed.
>>
>> Reported-by: Ding Feng <dingf3ng@gmail.com>
>> Closes: https://lore.kernel.org/linux-fsdevel/20261120051457.47753-1-dingf3ng@gmail.com/
>> Suggested-by: Paul Eggert <eggert@cs.ucla.edu>
>> Link: https://lists.gnu.org/archive/html/coreutils/2025-12/msg00097.html
>> Link: https://lore.kernel.org/linux-fsdevel/20251219125250.65245-1-teknoraver@meta.com/
>> Signed-off-by: Matteo Croce <technoboy85@gmail.com>
> 
> Forgot to re-run get_maintainer.pl after the io_uring change

Maybe send it again then if it's something we shoudl see. You cut the
patch out of this reply...

-- 
Jens Axboe

