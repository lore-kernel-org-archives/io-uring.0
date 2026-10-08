Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C7B3C1404
	for <io-uring@vger.kernel.org>; Thu,  8 Oct 2026 19:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791486678; cv=none; b=SdAADlg6+D8ap+8ED3b+LQIL2JJ/v+E0D0raVQE3PVjc5rVspH9TPyGEoL8J3daIwq0T/UsS3jfZQ1Y9MUrMvE5LMJHwQglv8+vUt8CBfXSTQ1b6MTQcXqJrsjMlhNjj4rGB8m9E5CDn4wms5vFD1VJOsQHkITJiDK7P0EnrIUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791486678; c=relaxed/simple;
	bh=MFI73bLJzYuC3bslZx/bwltYUGd/9Km+EomyS/QsF6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hMOFc+FEE9Ih9GKg73yZeGtKzZi4Y7Sju9z3LPWYAXIDZVqhIho07fRKCiy4v+ZpRvS3tZKJ+FsLRtNfs0HpNGGd54SUWX97ASbAP88o/aEFBuudqEJeoAC+6P59ytO6n26/bO9YEQjp6fxaQ5oqk//WOMoZGDpL0f+yzwgXq4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=sYnEyek+; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="sYnEyek+"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35115b52125so4476890eec.1
        for <io-uring@vger.kernel.org>; Thu, 08 Oct 2026 12:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791486674; x=1792091474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nShr7nk4H6rZOzPK1tKDbu27hRY+4XFOH8yhDaWQWyM=;
        b=sYnEyek+TRmHxzqqEBt20pXRpW6MO3qFYPBvZLUI+uXtzegKNqFWihSrQj2pq4x9aU
         eMqB3m3qubnJ2nY5dQwDpzjXxJEM6Nv9W6HwdW6ijEXQk/+xkhe20KFmryzPMOT7u8TA
         rlvOmIPm07YU/2qJtDPHp+InLtUGuWypYsXn7vIKBHnEPnrCMpq6KPG7W2Tk56/aKvJp
         OHSb1ovmY6rTMFfDWLbo7JGCDimlKhJd/Zh0DPq2rcTT/qAuLzzWHzbjk1KZnimQ374A
         5A+ji3/KCYJqqstR4lcHw8mXNW4eTQs5LlblTCY7SAyHlpkkJupR/D1piSuzFAywpnwO
         2Low==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791486674; x=1792091474;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nShr7nk4H6rZOzPK1tKDbu27hRY+4XFOH8yhDaWQWyM=;
        b=BxcoE2Kn/aHKtpRQx0g0rnzvCf85bxFsHEVUnI0vnjUChzO6r3aiMovZGDS+t78yQD
         lyPrB9O6YyyubvA89EAA5ceIcVbQCUTLKdzzw22TWROi0RdUL3kBpWHEncRLFTj/2beh
         HJrfmxz0edq0J4cKASzFqfklak3rvzvg3ltHhoUBNxDRaNxCkFTCwoGZwYQDqNfuqNBE
         2dx8A75C433BLiVQFM1O6azorS8zU4qwTb52PzI97QWySC1aV77snSaXqfqJByuNPHR8
         zegxFrhfqfXBEWPpypPwnW0PSN+vQ1shzfDOcGc7CpUZugnWwv7n6WTQlI+WOzaKslR5
         w3qw==
X-Forwarded-Encrypted: i=1; AKwUvBxKAUTQ8L+tmqc0lHkqrwudKErzwf5ckcF3g8R0Xy47EBU59MYTP9CbJOO8kWqk8Amlkbt6nZMD8Q==@vger.kernel.org
X-Gm-Message-State: AFuF++kbdVy+Qe2LT+2+adf9iMNW0KhQpNijmRU+s/3vgj/1Jqt65Y+M
	bhlzY+SSG0Ur8RV8mM2D2pm62bsZ4iXWLSHZkbEcSxZ2OLzU5uAE3bNcNU769Ua5DIs=
X-Gm-Gg: AYBFou239/zrXGVNlLtZvCTamGK0UMV2VW39+X/2QM77B4ujch8BVCEEcPc/BI7zH94
	D+JytopSCFmg+iXfTEf3FnqsXw0aIRuAU9VSa7TynA3nLJpIy9wDV3z0rP6vOpFs/yvi2KQOU9G
	gqu55yZuY4Qg8aPwRP4bdyTnP1cV0SAEwnI9rs82awV7fZ+deG+9eko8w9FwL1EctSuHL7oWx0Z
	lEIJepauT1Ry2U+Uv/KxUAChN6mlwWFWCOftSN8z4iWxx9rZjNyrOmpm68hjC/i3zpmUpJK1Mv/
	klEaHJmZRV76Lka2w3+Om95g6yVrSvvAGV37NRbag4GIXw618EcjGMY2I426c26q3mAagseHvh9
	JYh8TvsmKBeh+LlHltkHNNh4G5wXTSyuOR9wthDoYB92kdN0YnUg1j+bYF/zNyib3U2mxrXpNrs
	6PR7UpqhawqwiOkmKKHXQ/mbRSVAHaWt+Hzf25ZYb7a1fzs6hhaWy6UCsWPML9s4zeQjOrnfobX
	uTCmCCCAUXak/IVGoKpgRB130uUuiE9sjRT73LFTi6qeONe16Thx21uCQ==
X-Received: by 2002:a05:7301:9c87:b0:353:5d25:1de7 with SMTP id 5a478bee46e88-3535d252333mr1169990eec.33.1791486673390;
        Thu, 08 Oct 2026 12:11:13 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cad9e53sm21393eec.22.2026.10.08.12.11.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 12:11:12 -0700 (PDT)
Message-ID: <3b9d9c06-c6e8-4166-87d9-c7c220ad0b58@kernel.dk>
Date: Thu, 8 Oct 2026 13:11:11 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring: do not charge user provided SQ/CQ rings to
 RLIMIT_MEMLOCK
To: Hengyu Liang <hengyul@cs.unc.edu>
Cc: Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <b5a33433-b0b9-4231-9998-23e2a2202091@kernel.dk>
 <20261008170611.1285778-1-hengyul@cs.unc.edu>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261008170611.1285778-1-hengyul@cs.unc.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/26 11:06 AM, Hengyu Liang wrote:
> This goes on top of io_uring-7.3 (c746673517c6), as discussed in [2].
> 
> Tested on that branch as a user without CAP_IPC_LOCK and the default
> 8 MiB limit:
> 
>                                                   before  after
>   program above                                       21     64
>   the same with io_uring_queue_init()                 64     64
>   30 processes x 142 NO_MMAP rings of 64 entries       7     30
> 
> The last row is what 30 PostgreSQL 18 clusters with default settings
> create. The number is how many of them got all their rings.
> 
> The per-user locked_vm count stays balanced over ring create, close and
> resize. Provided buffer rings and IORING_REGISTER_MEM_REGION regions on
> user memory are charged as before. Every liburing test gives the same
> result with and without the patch.
> 
> Not changed here: provided buffer rings on user memory, which is what
> io_uring_setup_buf_ring() registers, were not charged in v6.13 either
> (64 of 64 rings of 32768 entries then, 16 now). I can send a patch for
> those as well if you want them handled the same way.

Honestly, after taking a closer look at this, I think we're better off
with your original patch and one on top for pbuf rings. Please check:

https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git/log/?h=io_uring-7.3

for the top 2 commits. If you can re-test one more time, that'd be
great...

-- 
Jens Axboe
