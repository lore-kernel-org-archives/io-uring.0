Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C962E8DEA
	for <io-uring@vger.kernel.org>; Mon, 17 Aug 2026 15:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786979052; cv=none; b=T9AXeS5w9lhz1o6Mq1DnIUAlifgQjSjvdmQg9M+HAUNuo9/j0f5LXMIYa08uzf/UaEMGm+qO95Je8T7jbp+obXCxLO+wZe3ImxKva3cIuITaAS9znsSVjw+n3zAbqHm9xMdpe08MhR/+wVb96ulDquVknBfttw5CHHfkCDJnBYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786979052; c=relaxed/simple;
	bh=Ur+cKiVbAh3ZsrGizOKH+9+i3VfuiVrSQMhUYBEr/Ao=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Vd7SXKzQMq9xpfpY0pfr0/JAkNzyvUP8CZogPL1rkQgrkV0/4FRVwv0zY643ErU5NgM7T2uyQfu2V+vo4aL/K3FTib3LSb+o3H+qhlUBRWOigW/UGm+NhRchMmuW19RwLq0e9o5GvBPbIDF3kgVvBCyEBvnM0hLrg4GdPaQWlTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=C4geTbvj; arc=none smtp.client-ip=74.125.231.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="C4geTbvj"
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-4b25c60f07cso893131b6e.1
        for <io-uring@vger.kernel.org>; Mon, 17 Aug 2026 08:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1786979049; x=1787583849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hzh00wSs4akcYyh6M7Ta6jCsY96mvygh9fJXvzCpDIs=;
        b=C4geTbvjmQxH2B2kAfKmRe8Z0qFErpeI/SbkffYWpwIiJPX/UxwqUZgQOGh2wSu9cq
         z0YisZnJEZanj1Lvs8r7k1PRcJ2jj84p4lSwHw3nTm8fRWu5MyaC1cGePxw/0awlkIKt
         fSlRTMdhcUt3C9PwrnlqH3zddCtUH+qt1vwsVZK+HeCAED8zDhf6hMm7cpnGLxRHa6MO
         EsR3Syic1aNMahrnNYj9WqQMiSiHbTf/bvCsyxL648gJLB9JUqKVsORWze3ExIUVwp+a
         ttXMP2AL6qiAIBxZmibSYoUoUafwn+ts77+p8kynYNRwVOcxCr3wJk7rTWtwxVY0ll3n
         cjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786979049; x=1787583849;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hzh00wSs4akcYyh6M7Ta6jCsY96mvygh9fJXvzCpDIs=;
        b=KDgS6xso82YspvxbYRoAnpukk7n3bYxIBlqY7WEoloX8In4PtMw9iHoOW20yzmFjby
         7Okp4RgDBnyKUY168CcKoUtC7ByJeeZIxp8xGptJXUvS13RiNZC2hnA5eJhiSTwfWqmU
         DCqttzgAYNN351t0D87ViPI+uwP7TbJrzxOp97sEg0L7CDIpcuaP8C/3/W1lua7DUm0J
         kmBw8KP9oZO2st65O4iVcps2Z7d5FYJRx7g7UtplUUFiXO8AaQROgqqoWgMWFoZP9k+u
         55I62tru9qiL8CNuxDwRwOsr4yxCtesWjn/THyJyGpTopEV+RVRFhRxCN7izh822l1/v
         Mlsw==
X-Forwarded-Encrypted: i=1; AHgh+RrMP7rpK0hzGpb4HZf5vorTeFy8oNlHkIhsLYxbUhwYtDSvt3wBvDYZSFbgDYv4m043Lj77jf95jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5YPKi6+7jwzUT0dW/VZ0dHrsLcNPVPstMPFQeV/eeS3Q7bd30
	otY0r33r2cXVxWRTdGar7Eom3I6VuC1pNPjKGTmFeBnBFhMjeRiUsKPXGQjIDjVfAZM=
X-Gm-Gg: AR+sD13vfrw/k+FbDysHeTiuXsdqFR58IwXfo1NCMaSksIVGovmJPxTsdg82unphU/T
	RwR9ULFkIyKAyZjuabk405TJDleO+NZ5g+9uu2XuB7oVrie+EYdfOnaNo6DYpLKvlLQweco/cw3
	+2xwGZpE3kHQDZjRO5WOcUFTWMFw0i2BLvZuP1+7tz4gaYhOQMSuvCCPZF731MlHfwDyzeN1wBc
	eDB5lTU1E9cZ6qR6PTkLUCduK+QHC8mHylomfv5IL0/WSeF9Nh3oTVk9jA0wGGafTw3j04ga4QK
	5RPCEzte0W9oK/Ya+PGtSaqifxNKztHSfKqXUJec//zmt7qjLaB/OkHAhjYqMaZgUhZWOc331Fj
	X+xJKRD3njGasLvud7FIQkH4/VY7euXFecqpDFRoNVdCfhBLAKUv2aCsPRiRFdmdKBwXzf+XKrg
	AM5CkTtLfJoA9YCKvHOAiFExqFM1w3mqxH8XXTa2ynOnLfxWNEpb1fesuVY+Q11Sc04YxmgpXBm
	8xZOjT5F9hIAS6dbFnyCosAdt1rlwZlzBp2jTd3pTT3sOs=
X-Received: by 2002:a05:6808:238b:b0:48b:1e49:24a8 with SMTP id 5614622812f47-4b241cbe2e6mr24394079b6e.11.1786979049030;
        Mon, 17 Aug 2026 08:04:09 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b290a3d048sm1165264b6e.1.2026.08.17.08.04.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 08:04:08 -0700 (PDT)
Message-ID: <7c6ce54c-ec12-4754-a36e-d5550f8337b0@kernel.dk>
Date: Mon, 17 Aug 2026 09:04:06 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in ep_open
To: syzbot <syzbot+df9e891bf8ea586f846b@syzkaller.appspotmail.com>,
 asml.silence@gmail.com, brauner@kernel.org, gregkh@linuxfoundation.org,
 io-uring@vger.kernel.org, jack@suse.cz, kartikey406@gmail.com,
 kees@kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 mjguzik@gmail.com, nogikh@google.com, stern@rowland.harvard.edu,
 syzbot@kernel.org, syzbot@lists.linux.dev, syzkaller-bugs@googlegroups.com,
 syzkaller-upstream-moderation@googlegroups.com, torvalds@ppc970.osdl.org,
 viro@zeniv.linux.org.uk
References: <6a830fab.dbb3a75c.20434b.005d.GAE@google.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <6a830fab.dbb3a75c.20434b.005d.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/17/26 7:42 AM, syzbot wrote:
> syzbot has bisected this issue to:
> 
> commit aa00f67adc2c0d6439f81b5a81ff181377c47a7e
> Author: Jens Axboe <axboe@kernel.dk>
> Date:   Tue Oct 22 19:47:00 2024 +0000
> 
>     io_uring: add support for fixed wait regions
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10e60679580000
> start commit:   9a143525f62b Merge tag 'ata-7.2-rc7' of git://git.kernel.o..
> git tree:       upstream
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=12e60679580000
> console output: https://syzkaller.appspot.com/x/log.txt?x=14e60679580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=c44651ea7dd2f307
> dashboard link: https://syzkaller.appspot.com/bug?extid=df9e891bf8ea586f846b
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=120defb9580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16323fb9580000
> 
> Reported-by: syzbot+df9e891bf8ea586f846b@syzkaller.appspotmail.com
> Fixes: aa00f67adc2c ("io_uring: add support for fixed wait regions")

That looks like nonsense, I strongly suspect it's a race and hence your
bisection ends up being mostly useless as it sends you in random directions.

-- 
Jens Axboe

