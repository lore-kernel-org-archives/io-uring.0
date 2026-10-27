Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124303;
	b=HJF3hV7SlIWI7S7zQctF8wvYaW7NHy/pU2yx8qGDWTKn7uH69oWt7/HH786JfGk12hKB
	 mWwXnlbrmMraWmLMHtLVsq66wxnQGs1luiUceiQGemepPL8+ET7ZRXNYEAZBGGGrcZJIn
	 Guav2nx/2gSKuhnnNbyR1K527fZlHxSwNekNaodQKH9I3xvchh4C6b115mnw4muVoF70h
	 B572IlYuVxeY+Lsv+xid2uCVy1atAwahxrZpdSabcnasJGuKfZr9zHNOGvhD2LusKoD2q
	 llMTO0efM9slUBgTwqaQPrzHpsliylyWw1mrJ696oRHpgH2uM2NyV61yQOd29nFArHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=7UP+K2CIKJLiob8ybXferq92NXaHOd6XKBVJ1ps1v90=;
	b=z4oE8kK4/hShp4BktVQMuAWbtIBKSkTiw0PZMQmLmyl32nAz3wy0dWU+r1QtOHuiEKbI
	 J9kglJY9gGB30+cRf1eYuT2WpS1FOznzClc8y5U83MUy2igEQ6X/BjbFdKnNeUIds+Jfc
	 BOf38PDKm0m41UyvUZmkfUWQKVM6/l3/VR+A8met4iMpNoh9XZxEgqWHDO03w9ym2AwG4
	 wcoMeSK/JnfkHBaV9H8ppltNNDbcxG/+yk0eZOuQsbhvceFXXVs7cAThjbuDY37r+1qjq
	 j/b8CjT36qSoWBQ+OFKsFAt0vUm7exp4yWzqBVDTUTizAJe4r5xLZhdjPQ4NmNR25jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MtzztlPx;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C110606A31D
	for <io-uring@vger.kernel.org>; Tue, 27 Oct 2026 18:05:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C110606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MtzztlPx
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-83bbcfba0ffso108295a34.0
        for <io-uring@vger.kernel.org>; Tue, 27 Oct 2026 11:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793124301; x=1793729101; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7UP+K2CIKJLiob8ybXferq92NXaHOd6XKBVJ1ps1v90=;
        b=MtzztlPxpena3EAfVqgyAz88Sbp07laf8cENHY2dlnwAIB4CXoWS12FazlnNBex/tB
         iCNwPM95GEYjfQBTshm+Z0lMaK2s/XjIJ9so7jUUZY6aYhjJjayogqs3VsJtgAkEKX2V
         XFVzXswLlVbP6h+8BPLz6m5k9eAJQjJtcu+fR3pLOMsb2siVFUlVgoQjG/bxKXYigN2v
         D6FbCsaERrJVP2rvU9WLanVHBoBuxh8QLnFqYPs/SKkPr9g+4B3JPCh5lzHApDsS9j+8
         oAYgcA34G67mS3A9ov1j6Yh4G1bU0sCMht0+OOC/mwIYWrBwNEjjGzzrp2o2wwFjW+pB
         EVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793124301; x=1793729101;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7UP+K2CIKJLiob8ybXferq92NXaHOd6XKBVJ1ps1v90=;
        b=A5flPL2cjP4oMxjeEeEzDg4rkW0jUQHsaQf7XJBmxUgtYoqQwvTaQEIjWFjJv6VZLn
         h4xhkE6A/OqipuRWFSqAQP34+81S+vA4xk0IVytWikzIdW8Q6FqkJ4BdR6RC+pd0+xsZ
         PSBfd2oaGFnFqyDrodQsFgNimEA4wX70bLYeVhdI/WbNhhwuVBXua3MsYA9pa6z+CwsP
         vo5ORxpIvczqjKqlZe4C7hcjs7dqrBAsWiWHRORojbRJMZZndySIlTcN8RRbMXnSQU55
         slzexSiKouyB3SA5qB6l23uJXM9/YUAnOYnJXOHQ9sBDg5oe59KXN/GWdmQoxUUDTBsm
         25Qw==
X-Gm-Message-State: AFq9FYLz1pvnZ1Cp2tOJnMWqJaxISBL+RqcD9Z+REajPabM+MofAYYpe
	1KaVtGnO3b4HuE1UiZMzpU2VS33zqdZZJZx/j66NOB6sW4/ztRiSo4qOZsYIHWKk1id5+zPtj3R
	r5IEogpc=
X-Gm-Gg: AYBFou1TK65npqE8UzStS+4ZMUHMoF/UQvYU2Er7Wu61Q5a0DVbX9ZeJHqKcT8pjq9M
	ptEJsYNbCHR23bfwaAf6OfZWGy576hNXturWgCwacsigLhNCoyziDvp0ZM3XyMcXS5I1dPW+GE5
	8RirZ1Vlu9xnyaX2EStgg4oT1UcNmArNKPNrb+uFVbCgPuhrDx67RusQZVYlnUz+WoayjVvdnLD
	NUZRhM1IuTP/lOp4aOWyMB/jGDMMhZNiIdBQv8amwTerKnUt6a0PwAx9xnlXIwG3rWn48rRLIH9
	sYdmw6fZrs8y26MijhMmOJ6wXdG+SVZVJ/SY+gNVKGkciOTPa0qKrrQYi5slu3y5K9fPx2NxU25
	l3CGBBrH06+DqYQkdZL8/Oi0gu2lANpgTXJQpS6foU+w2RB7+X0mzyBHIm2kywwvLHHsv9aeA6g
	k4wiI1WCQLB2tt76tADZdm77X70gErbkUBlZrm0DKUKq7yTt6N5EfEemTqJMGIlqUFgs14DigY+
	zqEjOStZuRBOLvjq8bUcKOtOrj5G5x0EFeUgWo5rCUQMQg4u+PZP7gQ+KTGoiddjczY9vgGDEeK
	INv+GhLL9qREbiVoXcOFmv5kIbClcpNX1DTu2STfRNIbWWxBWRvHzzYfRQ==
X-Received: by 2002:a05:6830:2b22:b0:84c:85e8:f922 with SMTP id 46e09a7af769-85abe8bb899mr253687a34.26.1793124301049;
        Tue, 27 Oct 2026 11:05:01 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fc005bd7sm11949803a34.24.2026.10.27.11.05.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 11:05:00 -0700 (PDT)
Message-ID: <b50196b6-cc04-4d3e-965a-28c4f75ef263@kernel.dk>
Date: Tue, 27 Oct 2026 12:04:59 -0600
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
Subject: Re: [REGRESSION] io_uring: final close can hang on a stopped
 submitter
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: io-uring@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261027043521.99446-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261027043521.99446-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/26/26 10:35 PM, Karl Mehltretter wrote:
> Commit 13d3783a55b7 ("io_uring: wait for in-flight requests on ring
> release") can make the final close of a shared ring wait for task_work
> owned by a stopped submitter. The close does not return until that task
> resumes.
> 
> An LLM helped with the review and reproducer.
> 
> #regzbot introduced: 13d3783a55b758a9fa05b67835afa7e216476c61
> 
> Last good: v7.3, c03c1a14507dfaf8b856c2608f9ac216021fc222
> Tested bad: d135ab453a7400a34930bdda1ef4bdc8acfac80e
>             (master as of 2026-10-27)
> 
> The reproducer uses a default ring and three processes:
> 
>   1. Submitter B creates the ring and submits POLL_ADD on an empty pipe.
>   2. B forks closer A. A inherits the ring fd but starts without an
>      io_uring task context.
>   3. A unmaps the ring but keeps its fd. B drops its fd and mappings,
>      then stops itself with SIGSTOP.
>   4. After confirming that B is stopped, controller P tells A to close
>      the final ring fd.
>   5. P resumes B after two seconds so the test can finish.
> 
> B keeps both pipe ends open and remains alive until close returns. This
> excludes pipe HUP and process exit as completion sources.

This is working as intended. With the change, close() waits for
requests still in flight, as otherwise they keep files pinned after
the ring is gone. If you SIGSTOP a task, then that task can't run
the required work to complete it. A fatal signal will still kill
it.

Unsurprisingly, sending SIGSTOP to something may prevent it from
doing work...

-- 
Jens Axboe

