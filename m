Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793284106;
	b=rr/ocg/0VTTuKUzwtfMJhmwElAtOUH57yHlxcI0Xh3aidmLxxkh8Z5FA86g7L9mrUCpt
	 1GZviuUlRBOhwOi+ON3KEM2d2qkfK7eqIfA/re4BE3DnXwJwZ+Dw2y9iMUHl+zvrPEFwt
	 VlpYBFPpbv4ICAu/UGE8KNEtIP/YsoVmXRqDT/vIpBTCr9ZfsHjNNYpjqFW45ueLesMEG
	 YetFItZOj6LPwdHAKqk1f5CyA2ouCzrT8qNW/dmb0a+QF/MYV9JO1SFOuBwchRFQy2awr
	 nl4qBxorJWIk9oQuah9qO5aFBgbxeZdFO12f9BMzKpZy59xUfSLBg+SI2UD+M6VTjpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=bpV5gcaWSkWHUEBL8Okr5cQ7G/7G2sdwutpL6bB3z4g=;
	b=QiENPw+UqBNeoX1OblyJEYUwocYePjUTyEbEHUJzgKBuOqpXqP9fTs997ktrlBXutnBK
	 lhwoZ0UMaU7Pxp9/ieb5RuZ5TNU+JI/lzyygmbUGKpxAEUSSxyb+juJ5JDQzGJcEukbAI
	 sFkT2pH6nbwHwgWpGx+2sfJyaTJqVSn0Zn6xzzCKgnckvXA8KHmJXUjgQ6Xot+x0Nc0NB
	 Pt96U8GIlgt+ZjWQ9Ljj7LYuuXwOLTJ4E84aNPga4aWqkqgKEE0PPhSpS2aFNtFjqMXEc
	 uI0AKuH8sGntw6A0ojW+scPN31KNl4mXg1eutrFIHFRNVc23jPKXsLKuUsUvUnDkIzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26114606A31A
	for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 14:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26114606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso4077807eec.0
        for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 07:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793284096; x=1793888896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bpV5gcaWSkWHUEBL8Okr5cQ7G/7G2sdwutpL6bB3z4g=;
        b=YTQt+RsKeGeqRm58rExDSoJf1LlAzH2oCnoB6dsZh2p3RdPDyv9eA+0gM0Q85L5gGY
         ASaci6PrkVxZ3D/x7UoZwLVV28Ezj2rrRKeMUzCK0JLVJEyzFG6MowICYMIDIVMf9V7n
         ga+WGghQpE4yEid7EUHieMjIWXqyp9DoCi9XVTo6S8/ztLQoEiYRbcvjC1rEATl/+4PS
         C7cdu01VIPpXC/ii8r5aGm1fQfw4TP452dLvUx8P74DYmM0ELrjlITCYY6OL90tSKQEB
         Lji+omTSPYgsxilVbQb/RXl/wWRGfMoW+KASWpqnxwyrcKJxhvG+bquhbw0KgCuR5KZN
         B8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284096; x=1793888896;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bpV5gcaWSkWHUEBL8Okr5cQ7G/7G2sdwutpL6bB3z4g=;
        b=K3g/bgGybD6yugeFsNGJzPdPUKVZK7e0v172RMSLq2vSv6sv54/JVXwEy6r9v+cOBQ
         HD8B5QwKalw3CqgjyMa1+gMa7HCs0ZdKl4WU5Zd+72P0GGqW+lBqWJIlymgPNvjLxd2B
         hAe0QUnMqeOpYNXLW1HE+1oL6sMFmi6MA7ZWphoCayBBKke2CjxWfN/8heXl17NdKedM
         jq7CmfOJdJl2kybJDqFaeXbR69ciIcDSKSiEau8w+O5dSLLI31mDTZQFlu7h88pQ0For
         ArDjFOqWaJadJ62JT/ryaPVY0/cUN2vYsBqD6ALt8V8t08W7y9uq8wZm+o0tMzT9vAc5
         zNFA==
X-Forwarded-Encrypted: i=1; AKwUvBw+3+Uu9oWF0qmugGzo2Q21mzKBph3WQgMfRo+vLrgHnM7p1Za7j3wAxUgPN1KTjUAcx7cv69S8Wg==@vger.kernel.org
X-Gm-Message-State: AFq9FYL8aHjSDY+SWROgW4BNenirDeEc6YfAHD6MsP86Z2Bu+S//WMI5
	XJYKdF6Uf4v8EFKE8T7ztT7LhlqxNHeGk7LguisCYKzzowxQbkxfJgfZGi/YWmEPj/E=
X-Gm-Gg: AYBFou0bFo7C8cnTNI7dIaAoyghHVasmnHoo2k8rK+b9AA9gA64b4snWr2VO8wWwRk3
	4SX7BNqnNYYyChnY43J/wj/rRyg7eWeVjyR5uhnECobTK0U1kwJ1Bq9hw9fWW4Ezo2lUV+rHxYS
	9Bcaz/CjHcSCAoDxcCKFdVp9OgRn5CjjM3EYSv1LsqLg/o5faxFFzmfTjNyi7/V8M5RP3k7gGya
	dZiRx22BBLaeE4zOilUtQGL1qy6/PjbPFHXER7YQfT9X/ko0hZhnTF9HQWTRqPrP5+X/cTubviS
	FHawo27fh3bRkXh4UqrKklmvHNJFL7l+XVkBD2Cxnxnsi7SIv966+AEKSP/7MmdKDC5rvjWw9kZ
	2jxyt9xvW4OwY8JZsTZGW7CwziD+03E3eovdnZy2ZQ9Dcql6UxVnbaq+WGXwxYYPn++T3geC2Dt
	0IH5iMx7L4f1dXomUw4ajje0bN0UR2cT387z+VPePzelGDm7bB41ua1b44pJdUacoZFl7PvxF5e
	eCqcFvEA/uOk0MPHbUFNKJ4cmNCiwh/Yl8jv44RScJADRwvcgDEl4UvF6j2oS9QhSALrFDx7oHA
	eLK6/K4xRw/mUVfGQ3HQKSaVi4vTmp8LEAy1QgAYZcDiUKZMVn3ibYg6g/TT5NNw2g1sRr4fXpX
	ddJgf1oQt3cFP
X-Received: by 2002:a05:693c:62d2:b0:368:40c6:3a01 with SMTP id 5a478bee46e88-36a1ffc5574mr8656318eec.2.1793284096076;
        Thu, 29 Oct 2026 07:28:16 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23951e00sm22271573eec.20.2026.10.29.07.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 07:28:14 -0700 (PDT)
Message-ID: <3fa26fac-5317-4c09-a181-c9c15e124972@kernel.dk>
Date: Thu, 29 Oct 2026 08:28:13 -0600
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
Subject: Re: [PATCH] io_uring/napi: fix list use-after-free on PREEMPT_RT
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Anvik Loitongbam <permissiontogallop@gmail.com>,
 Pavel Begunkov <asml.silence@gmail.com>,
 Olivier Langlois <olivier@trillion01.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
 stable@vger.kernel.org
References: <20261029102244.141621-1-permissiontogallop@gmail.com>
 <502f31ed-dd70-469c-b433-577ccee36c3f@kernel.dk>
 <20261029094842.58dc252d@gandalf.local.home>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261029094842.58dc252d@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/26 7:48 AM, Steven Rostedt wrote:
> On Thu, 29 Oct 2026 07:42:09 -0600
> Jens Axboe <axboe@kernel.dk> wrote:
> 
>> I don't think your analysis is fully correct. On PREEMPT_RT, spin_lock()
>> should still be an RCU read side critical section. __rt_spin_lock()
>> calls rcu_read_lock() after taking the rtmutex, and then
>> rt_spin_unlock() drops it at the end. There's even a comment on
>> kfree_rcu() callbacks in there too, it should not be able to run until
>> napi_lock is released, which is post the loop.
> 
> Good point.

If even the preempt rt people can't get this right, that's a little
worrying :)

>> IOW, I think this patch is unnecessary - there's no bug there. The list
>> safe change could be done as a cleanup, but it's not a fix.
> 
> I agree, it should still be applied, but as a clean up and not a fix.

Sure, like I said, as a cleanup. But would need a resend as the
analysis in the commit message is entirely wrong.

-- 
Jens Axboe

