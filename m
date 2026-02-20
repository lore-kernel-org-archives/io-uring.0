Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DB1309EE3
	for <io-uring@vger.kernel.org>; Fri, 20 Feb 2026 22:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771626927; cv=none; b=YxPuBK9zqkoJkw3Mx288G5WHtkkm4Df4f54Zn8Tej8dtNA7vyPyfzSG+TzbGaNpmQ3hA8SFPhg91p8+EzJR56OG9FtEW52+bEQnAxAJ+WybzQq6XIgIgRLtB85mbIPXyKt0FRdxKTkqnsP604mHLC3KSMKHXnQIVHXPPr+BYZ6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771626927; c=relaxed/simple;
	bh=smZcoEAnOnGbWYQjTEx4wx5SsMpqu349Lu3q9NZylXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R8aCYxZ4qwM29RjifDPhv8t/m38v16bzsmnowtNMGZtMFRHnX7tw6e7m+WsS8x/nJJbrGZTC3PdHRGyErkVzxtuoFXN7mUNNLm8v6c8wyFK3YKcKovyRhCRCrpmEOmmznHW3Sl7ef9fIDnd9wpHhLRp4bcAM6smrZ6jwv+e8w4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LuMGdiZt; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LuMGdiZt"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-483a2338616so14420215e9.0
        for <io-uring@vger.kernel.org>; Fri, 20 Feb 2026 14:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771626925; x=1772231725; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G2s/8SzLr1kQgVOYkjFZAPLW+HaH7/zQRc6LGXmo8T8=;
        b=LuMGdiZtIGXiPOqiMTVh85w5df5SxWALOuHvXa8LYn8GM6OnPCRLFNrOqEuqYBXOjb
         m5nbiQfpYj3zF2Sjx9s8u3iloTRDiwk9Az/iJbKEZDi3woDcFX0rcgTteG91TJzIqCJ0
         bEZCQ0tI/05Q5Oofze0LQLj/4rllL/D5DwblPlZcgrwa8xTNoazSGy1fU9jVSeuvDCqg
         VAWM0/rUfK8HgOn2yN2V1qTjUISkKnAVy5a2IRR1LHFxQZnd1S91wZMYzWpAVmB7F5zU
         Iv/hYRtDMcTiuharygouoedW5F6YJsbu5tmvvo/7K/j4ACjuvHrKarTalwhZEWFhk2IN
         krcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771626925; x=1772231725;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G2s/8SzLr1kQgVOYkjFZAPLW+HaH7/zQRc6LGXmo8T8=;
        b=WAP+7A9IPyjYPDCVbN74Dmb1hJQ/8V/M8KbBH+2lDxxy9QegyL7zc/NBv9TT4FLE4q
         eSfTSx8y+eCLj11qXmPgZR4Lez777Xq8MTbMqPFwXQUEx141EkSM00uXHNyvCxqHp4j4
         s8zoIPEEW1WfN3FLZivHjTARcayrM/kDiZqWRE0yoJwha36RjmxFh8295kurTEp0kiC4
         ieBAELEzqKVGhY79+eAhcz2tqskK7IU6Qc/VisB90Fyj0PyXdOvLTP/TMGGEZyjbdn8M
         UpJlhGg/c8TLEd2G0FfsbYmLHh7wjuqTmKqERkAYu71NVQsam6LZwVcEmvIqHgkQrcMN
         8OgA==
X-Gm-Message-State: AOJu0YwLB072ltPqI3f6ICb5eLgeAMTF49lCx+4gGOMhfbNwr+pjblom
	XMY7sCzdYeViA/g2cSNWLSZbH5RwibLMQ6fkEGEaFbqeGWSDkJRfbvFo
X-Gm-Gg: AZuq6aLNYZcnWnN6pxM0b0GdauxIB6hFfOMXphyahUe1bxC8J/JLBDj7UriB3f199jU
	84VTxxM8AI7lF0MJ9YXcnO9ROEpPA5aM244zobAuXIy+LVYpMvvYPH1pGPhrOkgDrch8O4d1wwb
	Y49u/bVlLJN5Q31klprUdyQYuC7B5OTs+EFvrLuzGgjb6Du5Tx6sCQuw4exGANzCMPgdHA4L711
	whFm4NDi7YPV7AIcvwH4F2IXpnYpfcktbJRpAfacupFW8MpngNjKOCOHzpJJoLYVECCT4F9UcLp
	KFpnspIOWqdpkD04YSFSnJdEF655LAdATHcA/SLK2GzO9q0ojW/moPuyJIH7vW6w69pAyKz3mrt
	+vvfR0UHoEq4pDf2baJOu4UqWnYk2pd6si5kejkHWcHTwI+ApUFqt+eSorzdDtS8n25dLXUvIMY
	5WdVUiBaF3vCzbbdQNpTnmN7ko/HMntXcxOyADmyFpgYRJ+dZaMwQ9nHp3FWHk1JLr8edI2uYDo
	wG5YpgOvzur7i5+Xq67b2AZkGxcDY8XclzGa26NAQWTC571aqDwI2ykLusBWyssc5VgCkC5MH4/
	bQ==
X-Received: by 2002:a05:600c:8a0a:20b0:483:7903:c3b1 with SMTP id 5b1f17b1804b1-483aaa168b0mr1609075e9.20.1771626924446;
        Fri, 20 Feb 2026 14:35:24 -0800 (PST)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3dd7sm101429365e9.2.2026.02.20.14.35.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 14:35:22 -0800 (PST)
Message-ID: <591a7f0e-7b78-42f1-9486-163249f5e306@gmail.com>
Date: Fri, 20 Feb 2026 22:35:21 +0000
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] selftests/io_uring: add a bpf io_uring selftest
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: io-uring <io-uring@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
 Jens Axboe <axboe@kernel.dk>
References: <cover.1771327059.git.asml.silence@gmail.com>
 <7cc147a959ac068c55dae4f540e38e9e4ab121e0.1771327059.git.asml.silence@gmail.com>
 <CAADnVQK0RaOA9ZYZdYyQxOzLde9MR8HpMM0SexcW59A9u7X2Jw@mail.gmail.com>
 <84e2f3ad-28f0-4e9a-804f-2647cba9b30f@gmail.com>
 <CAADnVQLSEoZ0V1m5j3ggX0o0gzVKyiDHL=J6F0wRXB8qk-MCGA@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAADnVQLSEoZ0V1m5j3ggX0o0gzVKyiDHL=J6F0wRXB8qk-MCGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/20/26 17:45, Alexei Starovoitov wrote:
> On Fri, Feb 20, 2026 at 3:41 AM Pavel Begunkov <asml.silence@gmail.com> wrote:
>>
>> I had such examples, but selftests is not the best place for that.
>> It can use abstractions, and I want to make them reusable instead
>> of people copy-pasting from selftests.
> 
> Sure, but please still post them as extra patches so it's easier
> to see what's the end result.
> 
> Also please reply to that thread:
> https://lore.kernel.org/bpf/CALTww28QMg=YXqKWpWLZrLO+xiqOe3LGyput8dx68-dnQsxg=g@mail.gmail.com/
> 
> It's not clear to me whether your io_uring+bpf setup will work
> for Xiao's use case.
> I don't think we need 2 ways of doing it.

We discussed this with Ming on the list before, that's one of the use
cases I target as well, there is no reason why it shouldn't work. The
difference is that this approach gives a flexible framework for
extensibility and covers a good bunch of other needs, which is exactly
the reason I moved from a BPF opcode approach, while Ming's proposal is
more specific but argued to be a way easier to plug into ublk servers.
If you ask me, we need a solution that covers a broader spectrum of
use cases, but I guess it all can be argued in either way.

But it'd be interesting to discuss how a BPF abstraction around
registered buffers should look like. E.g. passing an index to
all kfuncs like that, or making it a KF_ACQUIRE/RELEASE object, or
maybe something else. I'll reply later.

-- 
Pavel Begunkov

