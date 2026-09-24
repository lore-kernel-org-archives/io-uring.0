Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243B8357CF8
	for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 14:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790259571; cv=none; b=j2Itw3tlUQak5/ufowBq5S31oOXagfLQ2rvK95Z3pBiFAWp5zi/GbJAXSq+ibDAtt8lVfUs4fIycOfbJ/za/lBoJYUItIWFWB2NtdSl8IKsIF1cFfX7/HV5TOifYSeYvCep8YtpYIsSthvK/qpQIQv6ySsC2C9MLx/WUJlR03BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790259571; c=relaxed/simple;
	bh=TWdASb3MyAf7mGzhM1GabLO0eutszFmZKdYoyrSrb/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gHVd0Sd6eOlSWpzDk/jtPi2kie1RgdtrBVLitZM23qlJUuw8vNmYaheCsEaRTOq4nAGhEx1t4uPzCpAlg7vJfzNJZewLFefpJeavlpfZ8ViNw6zGBSzFUbG5KSliN40+I46fp70eoeIQwTV/baZBJupkVV8Nrk90vZGtmC21cdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=xUsYOoK3; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="xUsYOoK3"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-328664e051fso2373632eec.1
        for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 07:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790259565; x=1790864365; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l5t+RkrxBW/tPG0f8s8vACvjj/UzJW53i35clI9VtqY=;
        b=xUsYOoK3GAHlCcY3Apa/Z4b/UYuwhAOdAh4pYHuimBtUMwFObIHfZeSd8GtmaKBqyh
         VNScnMR2fSPIqEpCCsYjigBiLXBr3g1EaT0YYmCUJ4KugsX006BE9dQJ47nv65UnYuGd
         9sjuAXkibl6VRbaC70Z9QvL9h5eTrdkmTQvuNMfN5fYSNJgMJHRE93sGNB2ht3MowNpV
         Suq0BxBNGDyVxFPwsC7EovxYj9CmxjJds6rXnn123huZXZcJItEZV6HJZgxfykBJaFFQ
         kSUADyZ8D5ee3nUtzdtxg/8ktkfurjEmH0H0PaUUuonLrNto10o8WGMyGdjPXsR2ITdv
         cHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790259565; x=1790864365;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l5t+RkrxBW/tPG0f8s8vACvjj/UzJW53i35clI9VtqY=;
        b=XeDxRHgkFjJvrz09B9wyrLwEKxtk/nwjioKH7ixrDilGng5bA4oy351tP6UTJ8dtlv
         gOzECV1+aIiZz06CARYs+RstE96RocqhAalTuZ52O8Syz3cBVwOo10d0t6Cl67BRncqJ
         hxrYzvWrCc781sdQZGOo1oaUBTP6S1rsvlG5TEN0d+vVEo4fqF+I2VCzufaJr7Zbnsvg
         4FaQb15YqpcZ7wnGmjGfEQ3h6KDRdGuvI9Y9nl+6ytKqrgLTKfJO2q6fLcynwCeJbs2f
         lsGMZVowZJB0/6UwMX0AAL2lze7CONaaq2HzfbIoW5/YDEkoZvU8iX9h8lCEda8nPfGl
         qArQ==
X-Forwarded-Encrypted: i=1; AKwUvBxu9WExPxkdISjSUY0y8OOb9zGfC4NmJ5r0aEedWXyRBRKvkQui1eImzaT6FluEPdQgjSYDG5XQnA==@vger.kernel.org
X-Gm-Message-State: AFuF++kky7DLEagziWh8FsyZJ/JYGv7xkVg0juONFSfscAKuhbzdEFQK
	1DvNaVp8UUthl9PIo7sTA4iCMo5qIne2rgG1IeEeU4t4YcSorYamSMPzUUUvD9miaTQ=
X-Gm-Gg: AYBFou1GiAQZGUSrpo1q5dn9Kp72MEGnoXh3x6riLq2LYDhRIXS4EzuY0GG7iLAMFr7
	cTqJuRZi0SgHQzwONsEIjSRXhuuGimx6s8s+nI+rOWcixsdVxXMq5am0ob3PaicMgaFyuZrQhmf
	0D2BGc21PC03z6GHHHWrVOtHAPy0DPWC5nB6dQJM2mrZvauhEXiz6QaimyPKTqqhYRtMEiFYeC1
	3oCByL01MHcOhubk0HxcHuXbwy0x1wVuVq6B0vQm0CSoGUG42eJESllirtmpx/06DMhRY1MDoR9
	hERH9QQjmwSjR8UUy1iJ3WfTiSdzyUbIjyVYAus9M8f84sDN5lQyrNQnV0JdKe/pdWpFms1yjKQ
	r9CUcRmPyU4d4QYGTjFkRQggHflXzcsYmNgHPh0uiSlX5PXQq/ItQXRkveK/sHUT1vpzFpquLZ5
	KKzURre9/KBNSCX5rid8HX8ioakcIpclrVBxrZprcENljp1dzRLn5HsxYCqCutEDaasSN+g5hYl
	dVUiGad7cPoHbJWD1+AwNuMootnOmo9vxi4QkU2oU9TTKXRte7Iq+WeUQ==
X-Received: by 2002:a05:693c:87c7:20b0:33b:f566:eca9 with SMTP id 5a478bee46e88-34001c1401fmr2175061eec.11.1790259563746;
        Thu, 24 Sep 2026 07:19:23 -0700 (PDT)
Received: from [192.168.1.125] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9684ed70sm12529265eec.19.2026.09.24.07.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 07:19:23 -0700 (PDT)
Message-ID: <e1fb70aa-cc4c-4ed5-809a-e8babd52dacf@kernel.dk>
Date: Thu, 24 Sep 2026 08:19:22 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/17] exec: cancel io_uring requests before
 de_thread()
To: Christian Brauner <brauner@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Chris Mason <mason@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
 NeilBrown <neil@brown.name>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-mm@kvack.org,
 io-uring@vger.kernel.org, stable@vger.kernel.org
References: <20260921-work-coredump-fixes-v3-0-8e4adb1619e6@kernel.org>
 <20260921-work-coredump-fixes-v3-12-8e4adb1619e6@kernel.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260921-work-coredump-fixes-v3-12-8e4adb1619e6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/21/26 7:45 AM, Christian Brauner wrote:
> begin_new_exec() cancels the exec'ing thread's io_uring requests after
> de_thread() made it the only thread in the thread-group. Now
> io_uring_task_cancel() runs task work after. If it runs a
> create_worker_cb() item then a io-wq queued on the thread before the
> exec creates a new io-wq worker thread.
> 
> Said thread joins the thread-group which de_thread() just took down. The
> io-iwq sticks around until it notices that its workqueue is dying. But
> code after de_thread() relies on being single-threaded.
> 
> Move io_uring_task_cancel() before de_thread() but behind the point of
> no return. Any worker created during task work run from
> io_uring_task_cancel() is just a sibling thread that de_thread() will
> take down and reap.
> 
> Once io_uring_task_cancel() returned the thread has neither a task
> context nor a workqueue left so nothing can add a thread behind
> de_thread()'s back anymore.

Reviewed-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe

