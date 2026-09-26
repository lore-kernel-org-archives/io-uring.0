Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDE63115A2
	for <io-uring@vger.kernel.org>; Sat, 26 Sep 2026 22:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790460367; cv=none; b=N8mYKYt/DRawoCRere2V3zmExr6sh+4WSEZETTJ8n6tNZpK/SI80+RFQm7Z0Oc8b7mKfkKXHOaDRPztp0KcIW1SnXBIZEvDq0mVubD5xPCBWEwQOcb2hgC+7VotMLmlfIvQinkVSjiEXF1zFD9JzdwoCOj0Tm0EA4lDJEnU91Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790460367; c=relaxed/simple;
	bh=N/1i0aW1odxhGXfEf4EXAt4qOVmlLhrC/9Z7m3r2V7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s+32EUVwc/OFUcea3gjvS8IlW5V2o6kobzgFVq8UzNY6Mz4xoAD8+1wTqgmOsCHrpMmDQCpByMURzBuUHU3JvGY1ZhIScLuennPUwaJq6cgP6jGWrSavUAMaHKKZFHb6iVUaC52lVNP5mhKrrr/pLLcodB7dFde1rBL/gsHcgI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=AQPBvn/p; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="AQPBvn/p"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3411e0ace58so2555640eec.0
        for <io-uring@vger.kernel.org>; Sat, 26 Sep 2026 15:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790460364; x=1791065164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZOSmoR2B28yyOUfdoDxFKrF9d5+8BJe7EzDO03OaefY=;
        b=AQPBvn/pN2ckQHUYF3WKC5CK0M9uckDQI/TQQoOD3s6tJB5yrBPQ00Mr2Zkfzm0Zgj
         D1ktdPg6qL9HxY6bBm2IXTLhh4pio/5++FV7VCGwGbJUDmfZT45P2N7zs5/a8nBmPpXZ
         96a02dZfOUYJhw/HJZI/tT8MUo57mLV8XoIaVxiFzJu2YDZbmdjgPXskbZGzEc4GB/I6
         fECiYOP6rS/Bg6SPM9pqpkojLdju4ZIVc7G3ulbIXZcDHrcowF5TKfDOHauKl1bKi4On
         ovez7ZXMYnPJIJo9njJQysEF0rieln5SazT61lgmGC++kOhFcwSnLbTxvd2nVdbL8wOv
         SKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790460364; x=1791065164;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZOSmoR2B28yyOUfdoDxFKrF9d5+8BJe7EzDO03OaefY=;
        b=RXeLCHWAqas1Rfm6hU1Q+pQUfoLwxj/FihU4KfdkkAaLsDfP1i5Mv78dTPWkFsSpmv
         nybZQnBvEL1nG3E5YxY0NG+JuIYW0KAb6SrSegRJc2gCmyqjuv3195V12T/cS845Fp+Z
         aDEPIoryJjiX7OHx2XkfpHQ+hjKX1jCQexhs0/SNfJEyZ4D+fnCU62kHkm3xeWSfzuwv
         HibFzey7ABJ44TGl6gveKsLfeUY6AyYaxcKQSFaFuV0Y7tz0IKs4PI5vgSVRRKoSo2zj
         zI8NxmYyrx/1n/d88Wxoh7qjyQXVpLk50E1Ug8jPaOyFwyREQKdn62pt2LrbpwjcytQ7
         6YnQ==
X-Gm-Message-State: AFuF++kGjJ+I1U6+gbmYMxC0IUd/8L8/v22PO53f/sBo8f/mmYJPT942
	TjENhIqsFWdaJw1m/NSs1qOGbwpAmJgKUJFt9NjgetfN5+dQXxdoV7kcGx1mXFd4wro=
X-Gm-Gg: AYBFou17NIYKuOW9kElcrAtocskSCTCpSgC9LQ8G3efhoW2MzjtWI46lUjNR9sXqVwc
	5PwQtxTvRFBWrriE+NgKMt3/YNpVX0oN6vn/PpvdcSMGvW6C9k8ckDu4OAkkHxsj+RuAcIuyr6j
	TEqUv8uV68yQ7QK5QqnVFGdoo4/TXqLVfFvfWCVHNuuRXR6KxHc6yqnp8PH6x1qyyQKvUpXAmep
	7JJ7DiRaxvz/ypXT59MH39UNJAkoBWhE6PGfhPsqc7uaTyCC7VaRNLAQvA07d5RHVfiab8+TJlk
	zy8GT1iUhsJCLyTNY4vJ9XU/YsUbfMAb+CEoLTh0+KIX0e/GlW2Y8xVdMOWtI1oTPdp+lEd3pLD
	91okO33De0okgV4YgA2Yn76n2KdDevAlooiPeIB+ERavH2i4R2FDI+PIfBZVFj5cmFs2Qci+2+5
	1VpzF0aLKI86bjFYr871xs196BtkxfSNOwiTTsuWryrmgtKkFc7B77998h8KBbvR9Pj0Bx0MyJa
	mCLVl5T9Z2Izy+xma3kTUdzSqetHoGaEgESYhboX8hZSNWIjMUgl/0evjg=
X-Received: by 2002:a05:7301:1f15:b0:33b:bfb7:31cc with SMTP id 5a478bee46e88-342710ae1f0mr5938887eec.16.1790460363804;
        Sat, 26 Sep 2026 15:06:03 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341447576b9sm19647203eec.15.2026.09.26.15.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 15:06:03 -0700 (PDT)
Message-ID: <0367c089-a2da-42ad-ae9f-fc61dd220d1a@kernel.dk>
Date: Sat, 26 Sep 2026 16:06:02 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/15] io_uring: thread identity handoff for blocking
 inline issue
To: Ming Lei <tom.leiming@gmail.com>
Cc: io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, tglx@kernel.org, mingo@redhat.com,
 peterz@infradead.org
References: <20260911154148.644489-1-axboe@kernel.dk>
 <arfs_kX_gkH1o_S-@fedora-laptop>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <arfs_kX_gkH1o_S-@fedora-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/26/26 10:04 AM, Ming Lei wrote:
> On Fri, Sep 11, 2026 at 09:40:50AM -0600, Jens Axboe wrote:
>> Hi,
>>
> 
> ...
> 
>>
>> This is obviously an RFC, in terms of what I'd love people to take a
>> closer look at:
>>
>> - The scheduler hook and the identity move itself, kernel/thread_handoff.c.
>>   Is the set of refused states complete enough, and is moving
>>   thread group leadership this way (the leader must stay first on
>>   ->thread_head, like de_thread() keeps it) acceptable / kosher.
>> - The x86 and arm64 register state handling. x86 refuses AMX users,
>>   and arm64 refuses SME.
>> - Whether anyone relies on a task's user identity staying on one
>>   task_struct in ways not covered above in the series.
> 
> This way may break ublk server given 'task_struct *' can be changed
> because the server issues blocking OP(fallocate, ...), then the
> `current` check in ublk_dispatch_req() can be hit.

Yep, which is why is isn't enabled there.

> Also there is risk in 'task_struct *' keyed bpf task storage.
> 
> task_work queuing could become tricky too.

Like the above, the series does attempt to handle that.

-- 
Jens Axboe
