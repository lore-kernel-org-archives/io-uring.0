Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207A08462
	for <io-uring@vger.kernel.org>; Mon, 27 Jul 2026 00:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785111801; cv=none; b=km3LQUr0or8b0Jam+yUjPwP+Ephn6v6YQxmh7SRKmnHKncZFtpHjM42KyshICtnrRLLdfLGOqfRXpK2P0ncsUtnobfQj7Rbx6/nl2NdQooeoi3VTsF1lcxQfxkZlsPdyWWLRM8Ogo42KQktpK314uG72z8gl8NL/ooC/pi5/IwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785111801; c=relaxed/simple;
	bh=NlW1EmvPaOarb2AVcV7vmAzfkAMmckRhROVxPdJ+B6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EX/FStZRwy6G+MjNsVCzYJjSR4fkIAHY5lItmqrY4RCNGps498ycnNQ9zG4qFpqJJTqzcU+/zDA+0E6rRfSdjUli5sCloAKCrJJrztCALkBtzCoPqrMeC715rUa6elTsopQo+N8DiarflQ6OsBeZPIf2hlQYAW8xCNk4YYTVvzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=vxVl5i6p; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="vxVl5i6p"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-92e5d6f35c1so187879085a.0
        for <io-uring@vger.kernel.org>; Sun, 26 Jul 2026 17:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1785111798; x=1785716598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9J6RO3qFs4KnCKHpslbt/KjQKNJcKNsyI9dg6n5Eag=;
        b=vxVl5i6pYmobBKj95kBzNdplN36rpTbmi+5UkxkeN7tvm8AP8To82KmY9ALfsdTzgj
         u1eT0VQpNq7qvx0aJeOvz6gbIo617h+4KVCJbTI0GhEnCRD5R9FjJMK/BKDIBnvI53bl
         qKNXBbNmtuQRJE4MC2uGCeRuefVtRtq1nFX8LLB7q4MTIX3PO/2xSGE3thbH1NKqWYkX
         sYG1M0J5F7H/ZBSW3xaHzh2mC3fBnFlXkKm9/NwLmyrTctvn3EV+1iVw9STsDMK7nCND
         CKeXBZTFMN5XCvze22QySjcz7GjDN90qEJ1DqLzbx0dup+7xkMdc+T61MzJrxdkHOg3L
         GjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785111798; x=1785716598;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9J6RO3qFs4KnCKHpslbt/KjQKNJcKNsyI9dg6n5Eag=;
        b=UD6GV0Rb5JjOkXzSwRD7ugN9xtXRfsY0glbV7GrRJfxxX4JMRjyqqQtB5ne09U+cfe
         NvSPHWDjdjkTWFQLRMnLCHbKaW3jxkGUUwGAam+6191fQvMuYN3oiExtxcSIaqmzLghy
         n+lBBM3Nr3u1hB4xPhh5/m6U9w8GdqxIGUwM5Mv+3+mp2f0gVdaipwltaTAnqOwzjp1T
         wfPc/KzDXYDwPKZABZXn6LqB+vmGJsBRSRKO2mx0CbcxDGkjbvhTg/yOInQOAS2RIa10
         DWgxJgVoW07fNHLnp2GH9oiauylIayA4Nq4fzrNeYp6y+YbcbcTI5xP5V4P+1g2F8Of5
         c6rA==
X-Gm-Message-State: AOJu0Yw5ldzqDkPo9Tdmun1yjM9WyzEQsbyoqALUI2wSoCs5cM52mOAU
	Di0x+1G6i/7CU2MmZ42Ym3wa/W8LdJd/CUWekQimabouHxiNvkEtKM8t+YWlNgX6DyskGWn+0oQ
	GciypE0BJ5g==
X-Gm-Gg: AR+sD13rpJxSrc9OQR+e6kEx8KEYk0md9UMEV26LXrxtDhMBeFJytm0xWZqRTZYfXEW
	NuFiv2Y2ehpewqIIpzVI3cCnNKXH4Dn/OMR+0OjyXOja1SfEgwEj1n0B135EJVsYV5y8IXLRlpB
	Z7jmS5v11Io8lXgRmBvIbidDfZ+Qtv5oB93sO2j+Gdj6oVbvywsaF68IOCJIGvJGxBDVAh4GTCJ
	/ZILNKoTMHnglUyun3RL2iry4DlJ5j54lYi6rzl2cRrQJxbY2tgBlimJEZ9DJcf+FozcrbrB7LI
	vUrAeiiNGJDOtBG1gh075NrUPziikjlOOh3D2ch0eKTvO21x/2i9h6Ozheff4L9f0yMACA2/ifj
	QFnx+IbAzzxQaK7XOM0wxe+nMdJx3p2DNS93gF12ywHPkD/EiVF56oR13iAMhnHBjabM8hl0rdm
	q+OlUrYOWx6xLajZk7vx/8T247Ue2DcXFhvZqAN0+dD2qWYQzhOtl7VSaoDoMt
X-Received: by 2002:a05:620a:d85:b0:92e:c118:18b1 with SMTP id af79cd13be357-932df72fef1mr693256985a.80.1785111797962;
        Sun, 26 Jul 2026 17:23:17 -0700 (PDT)
Received: from [172.20.6.160] ([50.234.234.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e8522e7dsm52782116d6.6.2026.07.26.17.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 17:23:17 -0700 (PDT)
Message-ID: <dc7df695-c891-4cf9-b124-d595a94facf3@kernel.dk>
Date: Sun, 26 Jul 2026 18:23:16 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH liburing 1/2] test/send_recvmsg: Preserve msghdr until
 op_recvmsg completes
To: Gabriel Krisman Bertazi <krisman@suse.de>
Cc: io-uring@vger.kernel.org
References: <20260722181710.79099-1-krisman@suse.de>
 <20260722181710.79099-2-krisman@suse.de>
 <6f31dd5b-639e-4018-815b-0fa04a39b337@kernel.dk>
 <87fr1aeqwm.fsf@mailhost.krisman.be> <87cxweepdj.fsf@mailhost.krisman.be>
 <87se55cmry.fsf@mailhost.krisman.be>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <87se55cmry.fsf@mailhost.krisman.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/26/26 6:13 PM, Gabriel Krisman Bertazi wrote:
> Gabriel Krisman Bertazi <krisman@suse.de> writes:
> 
>> Gabriel Krisman Bertazi <krisman@suse.de> writes:
>>
>>> Jens Axboe <axboe@kernel.dk> writes:
>>>
>>>> On 7/22/26 12:17 PM, Gabriel Krisman Bertazi wrote:
>>>>> msghdr is allocated on the stack at recv_prep, which means it may go out
>>>>> of scope before the kernel has a chance to complete the operation.  This
>>>>> results in spurious test failures when we reach far enough into recv_fn
>>>>> to reuse the stack space before op_recvmsg executes.  I found it easily
>>>>> reproducible when compiling with '-O0 -g3' to avoid gcc from optimizing
>>>>> further local variables out of the stack.
>>>>
>>>> Hmm, but that should be fine as long as a) we submit in scope, and b)
>>>> we're not using SQPOLL, where it does need to remain consistent until
>>>> completion.
>>>>
>>>> And recv_prep() certainly submits before it returns, and we're not using
>>>> SQPOLL. So I'm curious what issue this is?? Same questions on patch 2.
>>>
>>> Hm, I assumed it was submitted via iowq, which would explain this,
>>> because the execution in io_recvmsg() passes a pointer to the original
>>> memory:
>>
>> So, __sys_recvmsg_sock during the inline attempt throws -EAGAIN at
>> first, which makes io_recv return IOU_RETRY, which punts to tw after
>> the socket is ready.  By tracing, I can see the tw is executed only
>> during the io_uring_enter from io_uring_wait_cqe, which is when
>> __sys_recvmsg_sock touches sr->umsg pointing to an already out-of-scope
>> stack variable.
> 
> Hello, do you disagree or did I miss anything?

Still on vacation and sporadically available, just haven't had time to
look at it yet. I agree it looks fishy! I would encourage you to dig into
the kernel side and get to the bottom of it.

-- 
Jens Axboe

