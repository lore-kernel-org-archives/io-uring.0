Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E379B399018
	for <io-uring@vger.kernel.org>; Thu,  9 Jul 2026 17:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783619165; cv=none; b=V/kb5S8mTosb3b7Zjuwx19vaBJWuhHRLUixXJzJAJ6mroNRvcvGcRy/cMCqqZ6gRWEJsIlhe3cxBvxfWxQq7PdX0A9j6ANH+qSG5wA7EZB/Od6gHqCQwJrq0oI1s/d8cp1sVSttbwXP6bKIOKnKoFJVdNdr+zWUs+b7Bly4khzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783619165; c=relaxed/simple;
	bh=dvEHcYtrs200nwnhJl+wCzBCLZYWr3gH5nFa98epNCA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Y0ng7wFcVC4K3tIg5nsax1Q4w7AoaJj0dxNwmGnMGg1Jt3Ex+q6nfRCGtUWvJUQ37YWZK8X0NmwkRIreZV33fbFbaGD2JLJufUjGeWqh5hKeKD4rO643E+Xp67MewkFHgKttUCFpXHjuLc5GOoogNolJa+nE9dY/b8AXRjNg1Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=jP9kq/Lv; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="jP9kq/Lv"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-43b7e186a0cso14291fac.0
        for <io-uring@vger.kernel.org>; Thu, 09 Jul 2026 10:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1783619163; x=1784223963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=heUK8+btISfNpPBQ2SfSJQinBdPI5pw2UcyK83gRUfA=;
        b=jP9kq/Lvdc0U/JX6FSBsgIiofwYTiZU3ll4NJ3dE9p96oVCb1EL4Fj0k/mrRzz384v
         7IfIj4SZiAusVYEdaSGa7CPCRZ4KnQMsKYXgwC2DyXV8iZYzzdDUo6jmiiQiGhUNCU6B
         VDYxhT4UqnZ/+IQ3l5J8vNqyrSN+pDEHHAdFD4tRDoYeua8HlksxNNMLHSUPPQmdOcqO
         NZJeyQf6AMcsAxzY1r7pLTBrhnx9Mms5oqN+7nbTZjUDKfjR+7pqubz9QKHHc19P+oO5
         s0Dep9xU01VnW/CDea0EWoc04OkCYH4RAdmicI0Y/9R10GBjmAqY+7Z4qtlBmWjNO6Se
         UH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783619163; x=1784223963;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=heUK8+btISfNpPBQ2SfSJQinBdPI5pw2UcyK83gRUfA=;
        b=SkaYNYUOVuGXHPZnO6wBf5SrIr2/NG7arlwlJcu3NeBIw281i65FyZzf+4BbB+15Gw
         v5VWydOL1za0lRxgAaGx6GSZ2wEjQS1+mkh42R4+yyMjXTVUtn/2LvDV7lM/aHxU+Snj
         aepyh6VZ4LhqrqU9cyh+gEkTGEWIaydup7LnhkHGtfRijy88aFxfW+C/GJJsV+cOfVuf
         aXfUpBWfr1Dvj7cx1fAsKB6lGpaHqoiH49d1cg1fcACGEIP5itbIxhNJKye7O5ghvDb2
         LQSRbnHpqyonH6rj3so/5+xeDWWbYR0lsGAtA6BvusLKKnlJnAHmtdULN3kvPB3eZqYT
         OgBw==
X-Gm-Message-State: AOJu0YxG5kK5/DviDHrh+ihCuFPeoxGyKoLn9/QVU83YJAqOgmJuueRY
	HtPcVryGB+x2FUYbZAi3p0um3lalppVmVyPqWYD3N/QcXqMGM4oBiwPNqMZBaOIkguOv1EIWW0l
	kuDBZx3w=
X-Gm-Gg: AfdE7ckvJBmHBMlR2B4d98e7JDKiPO+fGk9RjeclayB01QjX86e77eR98INyGkM6r81
	932gjljOBUTtLHs5lfZziAJ5/iNoJ/wq/roKm55yoahlY2EcrfQ+Z8PSvntajMKYeG1+Tz1sE2x
	SzXBacdkZVirNSWEnu+PU7p7A3zHXkld1N/D7UDqqBDdhxE/9a8fviEP0XG0WseHKi4jsv+ln4+
	fHnuvfMEOMuV3sT1HbvyxthwjwzrCwQwRzYVVg3AKXkxzcaiQ3vyOJBwrhC0yJpRQxVnH9G9yk1
	vdY/oLb86rrR35ouELDDGsBK8b0nikJQ3nImXGOgULKx5KCMVIoi+2mcj0BOjHlu7tP1CP7P+JK
	nK7dxI5mkyewnzH3PaZ8MkRETANzbzGwlFzf9Es8o75vBa/60wRO1GmSofxmouv9kLVflKDE05A
	0A5j4mAH67EuNnNUqDo3OmvcvZhAYhNWKHpOOu8B0KBeIVR3UJTPc73IaIedZf9wVyI83duqo=
X-Received: by 2002:a05:6870:e413:b0:448:c753:b0e3 with SMTP id 586e51a60fabf-451636f1a67mr5502959fac.5.1783619162887;
        Thu, 09 Jul 2026 10:46:02 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45191244618sm2595615fac.4.2026.07.09.10.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 10:46:01 -0700 (PDT)
Message-ID: <87cedd37-0f88-40c0-90d9-65b78d4f69a6@kernel.dk>
Date: Thu, 9 Jul 2026 11:46:00 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring: restore RCU read section in
 io_req_local_work_add()
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, Woraphat Khiaodaeng <worapat.kd2@gmail.com>
Cc: Jens Axboe <axboe@kernel.dev>
References: <20260709035100.2269-1-worapat.kd2@gmail.com>
 <178361907941.14321.2989447050307137432.b4-ty@b4>
Content-Language: en-US
In-Reply-To: <178361907941.14321.2989447050307137432.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/9/26 11:44 AM, Jens Axboe wrote:
> 
> On Thu, 09 Jul 2026 10:51:00 +0700, Woraphat Khiaodaeng wrote:
>> The task-work refactor that moved io_req_local_work_add() out of
>> io_uring.c into the new io_uring/tw.c dropped the whole-body guard(rcu)()
>> that used to cover the function body.
>>
>> For DEFER_TASKRUN rings the ring teardown still relies on that RCU read
>> section pairing with its grace period:
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] io_uring: restore RCU read section in io_req_local_work_add()
>       commit: 648790e0952789527ec68548edbedbc0fcff43b5

Side note: with your patch applied, we can also do:

https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git/commit/?h=io_uring-7.2&id=f3176c8ac4217c88fe1147ab084c47092921ffc4

as io_ctx_mark_taskrun() is no longer called outside the RCU read side
lock anymore. So I did that on top.

-- 
Jens Axboe

