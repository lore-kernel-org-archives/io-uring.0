Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BD0563FCF
	for <io-uring@vger.kernel.org>; Wed,  9 Sep 2026 13:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788962327; cv=none; b=qDG5ogjw1yCN/Di9yqtVGrvVE1nHuUhDxdUc5PpA4EUaQAk6TqeISdfqSlaYq5Kb6TFRTGHxPUr/HVtZMALS1KN6qU8LXSjm5S7kOmhfZ8QubDyuvRC3EX1UXxY6sBerIgyx6J9NoIZMb7IkW2oTdI3xAt+Vx0jJNmAVLO2yfR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788962327; c=relaxed/simple;
	bh=jmqMHMNI4kIvkiva5qeH52u8nLKPUrEYABXD2f5/ChQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=B3fd5fdMdmOi7xTr1DzJ9PSyxCpCaH9Np6TW/L86FsASDjABBwxUkoeDN0Q689Sdac54TcAj6QpVCrXGdCaZDl5rjnaeOGSZp051pE+SO3fGFtQBnKNcKWCJid6NLuZy5Z1gfSzlf0ouLwrlZscrM+1UEwVxIT5eOgJyZvu5sns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=nR+/wmub; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="nR+/wmub"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4be6057c9c1so1962556b6e.2
        for <io-uring@vger.kernel.org>; Wed, 09 Sep 2026 06:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1788962322; x=1789567122; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=61jm5fS/qMWPqQz9qs7og23C0CzXjbMZv233Vy2zenI=;
        b=nR+/wmub1HCVmjAmCx7T4Pvug3Td64JUBeV9Lg2ZYmSee+HQeyxQNe7udJSRljShDf
         CtjpuqrgS0Aj4HRTpPD6qMGdAXCYCTNGGYfCCa4VmVxKUuZic0nVOs5KxW8vQrK9/P4u
         +zLROZZO96tkm9DSvHAjHoqapFfg2ikHgvfZdOX7cLKc7uZJIbY3jUMCO0S3ZBnTMFLy
         U+PKZ0EhbC3TrgiwMSlN9HpAqR54CwhvpdcxcsLwLUfLNKquJxqYjhQlbpNjWfYd9cjH
         s+5jyZ91FAOEVavqBqcZbVfaykjmZu5KKaopNaM6J4hZGhpv6HtwGrt88QuGLZ2eTZxq
         dt6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788962322; x=1789567122;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=61jm5fS/qMWPqQz9qs7og23C0CzXjbMZv233Vy2zenI=;
        b=ObGXPPsRl1aha7CkQ+05yYqZWKVapNh05rM+Q3UjglBBxITAgqYC9TsUSZvYRza0AK
         Jj/7WknnJJ+kAmFjSv2blISf0mS3xkDx+u75DoG3f3mMpcq00qJujT7VVG0BA+xPi12X
         /9Ys9celb8jcd6SIWFq6P56RUFaxj0tQzxqcXNXpvo9j9ZwOvm6O3A6ICAz9nJYidmGI
         MwQtyXGoJqrx0jpunk9F5Yxcj96GuWH84jqEvRqhE/NhpZOPum13WK+E7Lnm3nXT4lYf
         Z6x0uJrZrEv2YImHW7tQX/6ZqCwAsuTZMsPKML4LoxUG7Eh2w7oL4Ld6gTcDhLRJOcOG
         UdUA==
X-Gm-Message-State: AFuF++lUXaNMRtkh+pYPPAGJtyd1veYn0S0Rv7QTRPTNBk92+c2lN/aa
	Fw5RnxycBMiry7aivnMTuknQmfbLVGKohZ2yaMrGf6mgqWH/VolWTrNTq9TeCYsyI/o=
X-Gm-Gg: AYBFou2SgQ1JwDW3jwXUf1mqdnCb97x2HvKXVWi2jgH5y93f3nvZobyG2XKWaOem62J
	3oZ+2RQ9Fbn55PxhybYHklLsdQfMa77WSGf/igkSaBShsFRssBIh8+PccjAQxybkfhWvmUlv768
	DPSMFS/zobGqILmftttnEbFJdzzLZZTjw/6pXZa9AoF5r9mngFzBv8XZdsc7tfVEc2kC+peeNd6
	/+Qpdw1iow68nnxtI27SUuwZTCK69YRpxO+8sOpSyIEuAe/qLEOZZDN1wPXHQRzWKoo+Af54f+p
	HDFkDuQwk7ELuuIYgmnfI3yw3xeLuGUlf8RwGKWAk5VEKLsKs/paxV1rXhR7ssDcRo+rhQwvExD
	H9PMGCzKJSwYdi7DDJ3jlvNpUOAVQJAH4E858qYTkkfxaNEFT5lNf/dMKKUgIyZbwqOE8Sqrg05
	Wd2dzfUZ6ieHaB5IlQYN2MY2ykTYq+VCKNQ+dt3dHbUlVDJA6J+9j3oxtw077YZaLHivDsgZp0o
	kOSSN94W2XktB5pAcMSiLx8nXcQ8Aj/VerzeI2p1wvklQZ4tNTJluuh1g==
X-Received: by 2002:a05:6808:ec3:b0:4c0:a03e:59f5 with SMTP id 5614622812f47-4c0a03e6380mr2114531b6e.37.1788962322440;
        Wed, 09 Sep 2026 06:58:42 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47989a71ebbsm7049860fac.17.2026.09.09.06.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 06:58:41 -0700 (PDT)
Message-ID: <01c58aa2-005c-49be-9d18-64d56d6fbb4b@kernel.dk>
Date: Wed, 9 Sep 2026 07:58:41 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] io_uring/net: don't overconsume buffers when using
 MSG_TRUNC
From: Jens Axboe <axboe@kernel.dk>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Cc: io-uring@vger.kernel.org, stable@vger.kernel.org
References: <20260902230041.1320658-1-krisman@suse.de>
 <20260902230041.1320658-3-krisman@suse.de>
 <0f5e8693-dcba-4fa8-87d1-570ac08e2d83@kernel.dk>
Content-Language: en-US
In-Reply-To: <0f5e8693-dcba-4fa8-87d1-570ac08e2d83@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/9/26 7:56 AM, Jens Axboe wrote:
>> When a recv/recvmsg is issued with MSG_TRUNC and the incoming packet is
>> larger than the provided buffer, the net layer returns the full length
>> of the packet rather than the number of bytes actually copied into the
>> buffer.  As a result, io_uring advances more of the provided buffer ring
>> than was actually filled.  Use the actual filled region size to consume
>> the buffer, but still return the full size to preserve MSG_TRUNC
>> semantics.
>>
>> Take care with multishot, because that seems to already truncate the
>> consumption based on the available payload size.
>>
>> This was reported in https://github.com/axboe/liburing/issues/1619.
>>
>> Fixes: ae98dbf43d75 ("io_uring/kbuf: add support for incremental buffer consumption")
>> Cc: stable@vger.kernel.org
>> Link: https://patch.msgid.link/20260728191454.1850326-1-krisman@suse.de
>> Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
>> ---
>>  io_uring/net.c | 38 +++++++++++++++++++++++++++++++-------
>>  1 file changed, 31 insertions(+), 7 deletions(-)
>>
>> diff --git a/io_uring/net.c b/io_uring/net.c
>> index 647156c9331a..f8110dc9f860 100644
>> --- a/io_uring/net.c
>> +++ b/io_uring/net.c
>> @@ -853,7 +853,7 @@ int io_recvmsg_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
>>  static inline bool io_recv_finish(struct io_kiocb *req,
>>                                   struct io_async_msghdr *kmsg,
>>                                   struct io_br_sel *sel, bool mshot_finished,
>> -                                 unsigned issue_flags)
>> +                                 unsigned issue_flags, size_t consumed)
>>  {
> 
> Not sure this is correct. If consumed is a size_t, then the comparison
> between ret > len is an unsigned comparison, and every error will then
> get clamped?
> 
> Will need something like this folded in.

Can you check the current io_uring-7.3 or for-next tree and see if it
still fixes the issue?

-- 
Jens Axboe

