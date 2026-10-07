Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C1D386C12
	for <io-uring@vger.kernel.org>; Wed,  7 Oct 2026 21:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791408832; cv=none; b=dwOg96OzxiaacssSuEZM1QvoNZVrWcOF6atNBJ7UneFyGCGWt6am4S89F24BXuUD0SYLmwskY1WSkvKZ5WkEry7YFHwsqHQj12hpJBuW7M6dFLu9DoITRWuS+sJ2m95Tkn8Tb+gMpAc4fdeP4lebV5qyYOL8Qkor9WbTB9xZBxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791408832; c=relaxed/simple;
	bh=0IBrQRHDXpXfEAL+Af3QlRWyyE6vjJo10MeJ6BSZqQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IZE00TD5pvLW9nLbGGcHLpr+zY1TWwtWVn8erDjXKE2H56WohxEmFEaE+VmF6mUyZdxQ3Niiz/5GxjC/gVlIkEoDuDHwXiBjzLPXlRT7Toib7Ah+gkhPtaJk3AHc2+xUCzSoawQCXrXEPhSCMV15KZ8OzvqDc6HQBvAh5r/feDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=EaZJ/6/g; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="EaZJ/6/g"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e2de97b4d2so18737345ad.2
        for <io-uring@vger.kernel.org>; Wed, 07 Oct 2026 14:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791408830; x=1792013630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ejNm5zDoqEZOb5AEzB2Og3woE3yReJTHR9Y3jYqn8pg=;
        b=EaZJ/6/guqGNuHXzHLbR0P+DDXnEm55/KzO4rT9CyzTVl3Y00nc9jL5n5xhQg3rgPu
         6jeZ9jCcMDdU5RJZaOk41BhHrZ+DnYM1vM0Ssh2dadNR8xgPwMvEHEmC+i3nYJKG7clq
         KGlB19PZVGyRQh5YbbO3a70F6XmOgnO1z5MTdfeOhFORAbXG2IOx4dJOFl6TempWDsCy
         7i35AnizM9dYimOoX4uBQx49PyKX+WAXAaYltAO+/CfEOdSPVfxuTivxIoAT2J5CxzOe
         Wz1v9T3MpP2Xk8Bqqp/+Dzm3NnN1ebfsRjjTwGmUH97IZqCXDysImmeRoF/zsvDINtCI
         ju3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791408830; x=1792013630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ejNm5zDoqEZOb5AEzB2Og3woE3yReJTHR9Y3jYqn8pg=;
        b=ftEW7ccljc3eoqYAnJGVzZxxwawCMgfppJaHOmJ5H9p+Qk93ixeepFVyrlfCT2NaR0
         BQ/cZCs7lt9OqSKqUwjRAzBjt4Fhm6b8Brnp275KOm8JH8BmpDDKvl6ie2hRbnPD8I6A
         /sXu8XuHJJA8a/j75DHkL+GiXCTBRMmkzBrMnFHfgtC4saCyHF7+SWWEhCoUnlBeLfnb
         I5kH9XHuKPAESrZVYilJP84U4rT3a6sfAdNWVMD/Z0P0DDpJ0uPYYYVfxGzZvMcqk/Ol
         VqEvwV+BZjkejAnwPz9tOh0p+yg6IxeMxNxoiA6yVajYqbYpmrP+o3MghF+NF3IVtV5y
         9HRg==
X-Forwarded-Encrypted: i=1; AKwUvByd0XDSDnrzGc2VpPF8mfolhc/pok4Icw8qQdcM0zcxmB29tR+AjZAhw0u1zWL1N+pPdO+0ZAH9xA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJTDcCsb6RqnAikmlkG60BPUVP6jEyMV+ol1gWrz2vdozLBv0Fg
	Kb6zIRjdB21LoYIe8YT228SAD2cRxIlGsb5ximXMeQKjQD06qy22O/6ObvVy8+p5X2w=
X-Gm-Gg: AYBFou0CK6326Sq4Bc+5q6Xv5/QQeYDU17+8n06I15js5KJwhY5tJZTITS6SE3tM7Kw
	O5dgsKIFWqW7cbXXB5/Mj9WGV3Gxvhs9UtzjjzfEA3oS2wYRWRSyOkvWkBgE4uQoM32BXafC09o
	Ji94nYxKaVpuLUDudcptgEFKQGuBgRffo1iDshsLwPbprhkP3KXZYgDLFrbfLhFXW75MeR2ptFb
	5T/ia6QGqdHqvT+UZV7Qo7A50Vs3j/af6kvEntq0Wi2PMuy79peWHA2wvnZaSspyWFF8cqMDDkr
	XenVbhIv5GZ8elLr/wuW3MsULuwUe4CtRz9dleRQIYcp8TKmx4vTw8vuOn5DHoLPseEBL0+Ixjn
	h0xljnLLojFHAtvBTzO45kmUKrrDsK+KjZGo5hO62063QrTM/AzlrVwWQfGWIvBChMRsCHA0guA
	Y8UEZNstrjZQZsmvieLum0QB3vlrYTEWj0Ze7KHoxtRH667Hybw5yUoDZx2dYZFpBv3KGzmy5GO
	X81sXRREkjt2kCohZf1NAN0hhidjAA09vu0Du846a4Sflk+TtCEoR8bVA==
X-Received: by 2002:a17:90b:528f:b0:3a0:50bf:d497 with SMTP id 98e67ed59e1d1-3a89f648bc6mr3019099a91.3.1791408830162;
        Wed, 07 Oct 2026 14:33:50 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9d94d9bc5sm1220849a91.0.2026.10.07.14.33.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 14:33:49 -0700 (PDT)
Message-ID: <71f45e7d-6e3d-4b9f-af44-cec354745ea4@kernel.dk>
Date: Wed, 7 Oct 2026 15:33:43 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring: do not charge the SQ/CQ rings to RLIMIT_MEMLOCK
To: David Wei <dw@davidwei.uk>, hengyul@cs.unc.edu,
 Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261006125732.3425762-1-hengyul@cs.unc.edu>
 <01d75013-9eae-4ec6-93b5-cc1b2b83b791@kernel.dk>
 <33f685a9-1140-4b4d-a40d-8250ab93e500@davidwei.uk>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <33f685a9-1140-4b4d-a40d-8250ab93e500@davidwei.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/7/26 2:17 PM, David Wei wrote:
> On 2026-10-06 16:59, Jens Axboe wrote:
>> On 10/6/26 6:57 AM, hengyul@cs.unc.edu wrote:
>>> From: Hengyu Liang <hengyul@cs.unc.edu>
>>>
>>> Commit 8078486e1d53 ("io_uring: use region api for SQ") and commit
>>> 81a4058e0cd0 ("io_uring: use region api for CQ") made io_uring_setup()
>>> allocate the rings with io_create_region().
>>>
>>> However, io_create_region() charges the memory to RLIMIT_MEMLOCK, and
>>> the rings had been exempt from that limit since commit 26bfa89e25f4
>>> ("io_uring: place ring SQ/CQ arrays under memcg memory limits"). As of
>>> now, a user without CAP_IPC_LOCK gets ENOMEM from io_uring_setup() when
>>> their rings exceed the limit, which is 8 MiB by default. PostgreSQL
>>> developers have already hit this in their io_uring tests [1].
>>>
>>> The issue can be reproduced with a simple liburing program, run as an
>>> unprivileged user:
>>>
>>>      #include <liburing.h>
>>>      #include <stdio.h>
>>>
>>>      int main(void)
>>>      {
>>>              static struct io_uring ring[64];
>>>              int i;
>>>
>>>              for (i = 0; i < 64; i++)
>>>                      if (io_uring_queue_init(4096, &ring[i], 0) < 0)
>>>                              break;
>>>              printf("%d rings\n", i);
>>>              return 0;
>>>      }
>>>
>>> Before those commits (v6.13), it prints "64 rings". After those commits
>>> (v6.14), it prints "21 rings".
>>>
>>> This patch makes io_create_region() take the user to charge, and passes
>>> no user for the SQ/CQ rings.
>>
>> Agree that this is a bug, stricter accounting may break use cases.
>> However, I think we can solve this simpler, and actually kill more code.
>> How about something like the below instead? Only apply accounting to
>> user backed memory, which is how it used to work too. Would be great if
>> you could take a look and also run your test case against it.
> 
> Tested in a VM and confirmed that with the patch below the reproducer
> correctly allocates all 64 w/ a 8 MB RLIMIT_MEMLOCK.

Sending out a new set since I haven't heard back, and would be nice to get this fixed. Would be great if you could test those too.

> This change is really helpful for me as well, thank you for addressing
> this Hengyu.

Indeed!

-- 
Jens Axboe

