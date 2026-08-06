Received: from mail-qk2-f1.google.com (mail-qk2-f1.google.com [74.125.230.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB3839DBF5
	for <io-uring@vger.kernel.org>; Thu,  6 Aug 2026 13:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024288; cv=none; b=E0Icq+1am8BTHfHpqovH/sZdJAEXfT9VRiOmOOCu4JEV7xHQ+ytOEWYkqKaJXEChHie95iyP6sz1QQh017QCn0+w/uvazCz4rI8j3yU4M58kTjz4BnKjRIPARLRGNSjL59LjWWkN7b28y/D7XJWk+pxzUc9Hd84YdOLTvNsYiBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024288; c=relaxed/simple;
	bh=wyE2OwvgbcPMdWuh2/RGAwHsFHMYx45fIQap4ZKGB40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sgEnhvriuVJUnB+SIcTFm8KsPHir3B8q5xpT7g+XOzRVrS0IaTdTHOC/Jz2OD1iCoWDLOIXCoiptCh3+WnuhoaFDgn+rIxIQiHyjz699BJTvEaTISYPewlsBFY19mXlP5XhnRvzUYltc5ujgssLdjH6nP9Ony6ZlxFBUyZuhR0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=tpWge6TY; arc=none smtp.client-ip=74.125.230.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="tpWge6TY"
Received: by mail-qk2-f1.google.com with SMTP id d75a77b69052e-51c1e8e50f4so4819831cf.0
        for <io-uring@vger.kernel.org>; Thu, 06 Aug 2026 06:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1786024285; x=1786629085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3y/EEB9p9InBKNoa8h4sTdX9gn9fYoSNLXw9IdUUuIU=;
        b=tpWge6TY+dSO1wILVKpkV8Q0atmxxoJiDmO246UMdlwVsXW6a3X5sh67utM3olmIAk
         ckB/hEYz02noNtlac7IDgjTbAvkcj4THNb3CBWe4Mg5sNt/E0BTg2lO9BgeRAK1D9EE1
         FqqXqhoV2tnB8RZGNuChM9PSd12HLmgX2h6fEWnQoZX9Dla07CDViba4uhIAr6W3SpTO
         rNPR8g572NPDbdjp+wgQZyyrtc5rucytWL0jlMjBOy2yvboXsNRt3sUXxmqoSUJxJzZp
         4R1xy6UHbAWy7wiiWjpdbjpbAxroli84ItiZzSTGVo8FsLO9FoaIuNYqRtjhmGyVMe+A
         u57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786024285; x=1786629085;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3y/EEB9p9InBKNoa8h4sTdX9gn9fYoSNLXw9IdUUuIU=;
        b=GGGLcgw0yPSzsHK+f+R5tdZjTzr9H48Xeqf3vIx2m/Y0EJju02MzH5avOOo71Kf10j
         +SyMM6+AglpbUVG60IR8UIt1c4auRuybOkIA94IQvv3SRDHGzSvSXjieRWM/T1KSMLgU
         6kuo7/xQPthLJnla6kU4mY7UfgJKzEGjhiuBRrWjiSuUfBW9mFRNzS3zU5DwDvBxXDni
         FuvsdyaixwMES6KBfzeqWPO651YA2ho5VtzL+LXcggL8lufRz1yq+yXDQeqDCDW7yfy0
         uyfWGdZhVpCZUQcXvy8fpj0ND+FnCkZNvwhtfIfJ5qoLkWq9FTYoTeQO/ADZFbJsRSZh
         Lzuw==
X-Gm-Message-State: AOJu0YzahObm62IHpoCujgmu6QggvGwq54xgJauy/WtplT8iQqLbWWbY
	ImTzEeHi6DOmrxYuLnrDuX5NRnuHOxMbO3Ep5SAbEkbKuQnVM+VxEx29NKgr3ZUC46aVX6UZgZf
	g+E+03wpA7HpK
X-Gm-Gg: AR+sD13SX/URE42NsCLAoQyxCcqFimbOKiKf68Tby+/TmtcAvN9z3zTGXjex1uS9xdy
	gRmqGi4uwQY8bHPP7/YfifNVxaLGNybBpr4gWZf19TBQa5PGtrQ6g5xohbMsFbG5AY9oWYRU9be
	1OD9xECkBM1Zf0mKVOQrGjNJ7032u3b0i0tQlr1WzvjG+TiiMrSAwk9z2trl91txO98NZKbDeRF
	UvppQRL2yphRZ5VW+bPCHtpsAFANia9JfPPMxNWV+t9b+hl5XmcKrLOaQD7zsv27rRh+FL40X2Z
	gCycsmnOTEexaq5KimqcoLXa9gduWrbwafifM+v3ecnxhSX0e3ioVXgP8AtcOLFdr9m3Iw06RyW
	nJlfp2UtZthHka6TyhcNkKA/UyNtzGhCLCv3b+uEXGWOpAbMRJf7AqzPsfUTJQQvm+zmvHF0yzE
	SNEFROfZQBb9aV2i4qmbtRWrHURzUDO3FULUUZIkpt49nnMbiS6M3ta3sg/qyuPqiDfaQ3l8khB
	t2dr6Ai/KEiT94Y2elx+DB431cXNQYcqdDi+KZbNNr2b4u8iUJzjWwzdowRiP+Wj4NSFIeGgr1M
	YdrGeK22THgaCLqR
X-Received: by 2002:ac8:5e0c:0:b0:528:3b9b:4f54 with SMTP id d75a77b69052e-52ce5f447d1mr141571101cf.8.1786024284897;
        Thu, 06 Aug 2026 06:51:24 -0700 (PDT)
Received: from ?IPV6:2605:59ca:42bb:f910:6d9f:8dfb:ae1:441b? ([2605:59ca:42bb:f910:6d9f:8dfb:ae1:441b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9087ffbef5dsm52465976d6.18.2026.08.06.06.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 06:51:24 -0700 (PDT)
Message-ID: <511377bc-7703-410a-8982-3050ad27c066@kernel.dk>
Date: Thu, 6 Aug 2026 07:51:22 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH io_uring-7.2 1/1] io_uring/zcrx: fail non-qops netdevs
 early
To: Jakub Kicinski <kuba@kernel.org>
Cc: io-uring@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>,
 netdev@vger.kernel.org
References: <23ae94da6725cac660652781b3533a20d0a1ad34.1786016493.git.asml.silence@gmail.com>
 <178601764913.2132084.3867669701970816639.b4-ty@b4>
 <20260806064958.1b9ae431@kernel.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260806064958.1b9ae431@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/6/26 7:49 AM, Jakub Kicinski wrote:
> On Thu, 06 Aug 2026 06:00:49 -0600 Jens Axboe wrote:
>> On Thu, 06 Aug 2026 12:42:33 +0100, Pavel Begunkov wrote:
>>> netdev_get_by_index_lock() might return a netdev that doesn't have qops
>>> and also relies on rtnl. We're going to reject it later when opening a
>>> queue, but netdev_queue_get_dma_dev() warns before that. Reject non-qops
>>> netdevs earlier for now.
>>>
>>> RTNL: assertion failed at ./include/net/netdev_lock.h (72)
>>> WARNING: ./include/net/netdev_lock.h:72 at netdev_assert_locked_ops_compat
>>>     include/net/netdev_lock.h:72 [inline]
>>> WARNING: ./include/net/netdev_lock.h:72 at netdev_queue_get_dma_dev+0x52e/0x660
>>>     net/core/netdev_queues.c:43,
>>> RIP: 0010:netdev_assert_locked_ops_compat include/net/netdev_lock.h:72 [inline]
>>> RIP: 0010:netdev_queue_get_dma_dev+0x53a/0x660 net/core/netdev_queues.c:43
>>> Call Trace:
>>>  <TASK>
>>>  zcrx_register_netdev io_uring/zcrx.c:831 [inline]
>>>  io_register_zcrx+0xe94/0x1d30 io_uring/zcrx.c:983
>>>  __io_uring_register io_uring/register.c:942 [inline]
>>>  __do_sys_io_uring_register+0x1193/0x1bc0 io_uring/register.c:1040
>>>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>>>  do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
>>>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>>>
>>> [...]  
>>
>> Applied, thanks!
>>
>> [1/1] io_uring/zcrx: fail non-qops netdevs early
>>       commit: cf7aa48151deb629022a8b0c61c139dbfa579933
> 
> I asked for a different fix :/
> 
> https://lore.kernel.org/all/20260805165817.7e1fc367@kernel.org/
> 
> Outside subsystems should not be poking at random fields and making
> guesses. The assert is simply wrong and should be changed.
> 
> Jens, can you drop this please?

Sure, dropped.

-- 
Jens Axboe

