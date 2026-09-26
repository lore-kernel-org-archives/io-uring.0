Received: from mail-oo2-f36.google.com (mail-oo2-f36.google.com [74.125.231.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23836372B3C
	for <io-uring@vger.kernel.org>; Sat, 26 Sep 2026 16:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790438668; cv=none; b=j8j6mAM0OUbCALZjWRwXXw9TfHvuCg46eIGi8ZGC0L4OTcGZz2xLRrVmOkYnZdbpQ+V+jJjIYzjJ6W45Zs6MP72vf/zjXY/V3Yfa0g2P2lZFKr+BY8AYqsfbhdX4Ks1JpTtNbYfhVtxc+eudfBMS9kxxXFdUEHIKkYWLpl3o6iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790438668; c=relaxed/simple;
	bh=NWM4pJtaX/q1ZBVgVlo5UZ32wLfKql6vva2eEs2zGJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ivtZSP9ZHreFL9r8f0fOy8t5RtEXFuEDRtnzkpSmgMV6r6ok3Umhagn9t2l1ECHTHmjQa1OPCE8ur18NbysdjH8JjMRdrit3oBw3jPi8bZ/uJlNyTk8ZdsJIBGCqEozjzZ/NJWVE3Ywh5N3IasDP7zkt7kux/w3cnS902rVgsQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUgvEG8E; arc=none smtp.client-ip=74.125.231.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUgvEG8E"
Received: by mail-oo2-f36.google.com with SMTP id 006d021491bc7-6d73f71a49bso204858eaf.3
        for <io-uring@vger.kernel.org>; Sat, 26 Sep 2026 09:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790438666; x=1791043466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=04CycRj95YLfmA7hA1DhHUf9OsDpKgTDD3cyHvnkUEc=;
        b=VUgvEG8E9ZgQsj/yLzKvn2Lu5Ac301B9rZDlQvQZwHCKWimZIgGqjr2I7E66RSzmEW
         lIANXQf8daSl2P85tS+SBh3X3p6XlQWxoo87ZSWti3UmLxx4B3h1WEfUM0byLTX4w3d5
         chcyo7BEW4bIdTCZMwOyv3DVVOgLQfSGpJvsO4XWv+eqM7npS2XtZWtZgK4M2EpwMiND
         bwR+5FnG1LXnHs3PA7GIdko56JsAj0BOjrMF1B9yYp3f0MfRbBm9C9uElmTU6m9glHTj
         4iwFQTgGuGKaLgU3Egsjk/49KTIlJf2TuQsadhpj66B37xsBp60xzflhW7yQZ0uoejft
         ypLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790438666; x=1791043466;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=04CycRj95YLfmA7hA1DhHUf9OsDpKgTDD3cyHvnkUEc=;
        b=sjZGCM7Fax2MFJWyWmeH50DBeoGWl7M4Fs0Ltd1b0X4j1iwV56cKP0IfI73DxEqyoT
         55J+rYduYycOWVlc47y23gKuCVRyEqHA8mVBdKyNAA+LqY6X363hV5UW6ZJ1FfGmi2Gu
         7FbOV1vmRcvneSjOHRt+9NU7SJHuCoalDVLvCRaZkCOwQQBmOXtliDhrEBTmF7OIfuAH
         TQVGrH9nhNjJuBtAXa3DrsWnv4NryaC9I/1YDEst6d/NXTSCkX8oDLnGMV95JgRKlxqc
         EA3tFAtt5wo4RmLLLWXtBSW9H2SinETYdY+0CQ7AKSD1CJ85JKQ9KSN1eTc+Zaa/ot3q
         0IDQ==
X-Gm-Message-State: AFuF++kKvuqKdxXwIYl5AB3upGon+6mYvRMDgrKXwhFKPlOYvRAk2fmT
	45OreLOVXThrQk41vojrZ3udH4IeBqjvWgRDjJTn3PRjnm8bHmTEuELQZ0/cYA==
X-Gm-Gg: AYBFou3rBKkKk86W+fj1dapmIGL96h8CugiMAtldX2GgFI+tq7Ocx+6Btn3YxkOL2AU
	2Ds77Znlyc5NIeihlilKzsQK/kZARdkXp51eM7DqfWtR1tYKCOWRQLGeXyR5PTw4OqmoW1etMmk
	0Dg9idGgi5lW4SIIiT+0mSlJbIFqysJczQNqmYiVzr7Zh09JDEuK1K5huNzOLVJkc0pulQF0mVw
	AS9jxi52BxclCSPgzl3yds20Ex0U4kkPj2+qXRlHclfal3okHVCmsUAoRWscJ9BidcGGg2NJSX/
	3Q0aQrMkTXQ0kjkd1DFhn+hXfNdFQ6I4YdBei1Y7O1izogucDTVlU8wyI8mAHmJFi1RZ3uBdINy
	44wyDi9McAVyo6tb/Lqqgs5wqlrf/nuAY/2GzHvT+LDMDJVFn/4fdpXXm4H/c17eX4NdDMbXfdT
	IIXVt2MteQG5iAlKPqZp6UVjT9E38PNaBgh6OMUl0Pr99h8j1ydzD/GuxinluPj3AB30cmdB73G
	YsYRrMYaKXdmO5WRyLMin5pxzQBXPIWuZSfKxJGUdTn+4jfOMnMZ2Nf7+7Jj8BZi3GZcuQ6k787
	oUUnemdbQbo1rA==
X-Received: by 2002:a05:6820:4b08:b0:6b1:afc8:3162 with SMTP id 006d021491bc7-6d43f2c6fd5mr9089210eaf.7.1790438665895;
        Sat, 26 Sep 2026 09:04:25 -0700 (PDT)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d581dc58dasm6182919eaf.4.2026.09.26.09.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:04:25 -0700 (PDT)
Date: Sat, 26 Sep 2026 11:04:14 -0500
From: Ming Lei <tom.leiming@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, tglx@kernel.org, mingo@redhat.com,
	peterz@infradead.org
Subject: Re: [RFC PATCH 00/15] io_uring: thread identity handoff for blocking
 inline issue
Message-ID: <arfs_kX_gkH1o_S-@fedora-laptop>
References: <20260911154148.644489-1-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk>

On Fri, Sep 11, 2026 at 09:40:50AM -0600, Jens Axboe wrote:
> Hi,
>

...

> 
> This is obviously an RFC, in terms of what I'd love people to take a
> closer look at:
> 
> - The scheduler hook and the identity move itself, kernel/thread_handoff.c.
>   Is the set of refused states complete enough, and is moving
>   thread group leadership this way (the leader must stay first on
>   ->thread_head, like de_thread() keeps it) acceptable / kosher.
> - The x86 and arm64 register state handling. x86 refuses AMX users,
>   and arm64 refuses SME.
> - Whether anyone relies on a task's user identity staying on one
>   task_struct in ways not covered above in the series.

This way may break ublk server given 'task_struct *' can be changed because
the server issues blocking OP(fallocate, ...), then the `current` check in
ublk_dispatch_req() can be hit.

Also there is risk in 'task_struct *' keyed bpf task storage.

task_work queuing could become tricky too.


Thanks,
Ming
