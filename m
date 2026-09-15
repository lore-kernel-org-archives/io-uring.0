Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0264247604A
	for <io-uring@vger.kernel.org>; Tue, 15 Sep 2026 23:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789513356; cv=none; b=iAxQVWV6si1aboZuKgJX6w5dQxN1FMwQUEPP/bEdCdpOlrm5TR9Qd+1JcNsULbMzoSY5ZrYTS/+M3SzAHC2hkL0KxFLtSNiiPOsibnyzh7FFBZiRc6s1YyE41KYXVS7zY2Z4W38dY56Rw7CuiJCM6VDGmj9gt+h/a1uydtT9J4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789513356; c=relaxed/simple;
	bh=ITz7hBythv5OWTbmQ9c4e1mzRPysX2+YTMbCrseTj6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=maLRk0ihyobsuQetQytuyGYEfBsdd5PDA1p67MJYWTgaMtQ62Ade7o5Po4CemvDnEfRpygYEjU9onwNF2K1/0Z69MZKysw+N7eA6F47Hqm/r9ss9SVjPwp2LU7VgfHWgFrSMah/CBFEeQnk+MyLSGZc4Qzc6CcW5gJQ4TEqJJWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fnUP1NX/; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fnUP1NX/"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1744fso433203e87.2
        for <io-uring@vger.kernel.org>; Tue, 15 Sep 2026 16:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789513352; x=1790118152; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NEEN5klK6sYQ7k8fj+V0z2WeSFVNwjy5fJJIdfiMPQ=;
        b=fnUP1NX/ZyLjWCZ2QnAx7dHYR2DNRK6NijEf/3+aKFLFlGaJmlRbL7tJ2lILNJunmC
         lTm7vktQfRMszesuuHtjyTbQJdOtxgeU7+WjotxXixoPGr17PstIXuV8mXUqgMOOif51
         M/pUwxB0H3dpSRHTputp2AZ6jBNX0Lap3jrtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789513352; x=1790118152;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7NEEN5klK6sYQ7k8fj+V0z2WeSFVNwjy5fJJIdfiMPQ=;
        b=Cir6XWtiiiiz6557iOXd2KmEICOyJoeQ0/GK25ftgzcaKJXoRAqKUjc0o6U+9fXNsP
         +vBagJ2XWk5zKuUBy0BdfUbCEIzgsYqNhgUsZg6yjgTlUlXN17EtuIPizZgygsrEhm4s
         yAiztINaWyod2WdNFYLULJA/lYYClAvDOXvdLFdvMifhV+NZoC55NvLR3HkHYA7KRpve
         5cvI9d9DB15p+oGqIOrQiVHaooI4sbNjVvkOyGxbkQddORF484BSqRrIdsUym5XpvHg+
         g4Lp0sKI6szXyfvuY0i4dgtOQz5xr9DehmhtN63nWMUgnoSThYLnjOEg472E6+JtQsV1
         /P5Q==
X-Forwarded-Encrypted: i=1; AKwUvByxyT9mh14zxMX5lnJmk5PPilzlvIPNDIM1L1Ikn6HqMLadVS8dzUEKnEausqm9PRzJWOKqkTqrVA==@vger.kernel.org
X-Gm-Message-State: AFuF++kvPJzI0RyLlvSWWD+qg6gTcpPMNgsqo5iGAGDZhhxrL7u5MEEs
	AxF5QYpISrY36WeBaPoqTOF7+aeCZusl0YzLhSSuHjUqZNbqL2UAXhRQ5KugdTYuyBFE1a5i3gf
	h/03t2OKnsQ==
X-Gm-Gg: AYBFou09TDtBSfglwOUz4KYgi1OWZxu6RY8v+Ih1K4S0Y7+L4mYxHTzm3gMhNwYchEv
	KvZ/G1QVcr/4gJ3W76ToTwFWZeOlDs6dBkyet4PDaDls/uB8HmYqSict2epT1kIkGX7UC9ts6jp
	bGbAxNTrQFhs26lo6S13k13MpIqUx/kjF9C/r8zW6TCSd6xcjaKhmzRtVs0zV73B6smuB1g2o9X
	XbOzcbT9ZvE4eeIaF7mxY0/n0zMUhcHhQx4CNtAplKnRIoUJb8s/xLag+aBqlczPm07YP9RKiCA
	wHP97zILRp1HD/NtFGs3oJ9kELpZI0DdlyJWRxXsxzepCN5zoLlFgl5mqB8tTRGzi3Eib+nQ7Lg
	BwU3lFY47ztmUubxOfPBJDV5CdpImUNkAlifnLSBZClxOT2I2Ro6+gaUrsahuJi0Yj7uiAjejYa
	Dpa2kfrB4NrueCDerxDucGlEASqX3WbI0B5pje0xoK5bgWjFAMqlokZ3YSIhBGHrhg7a+k/J6pH
	zav8VylG3CT/YuwYeJhtlKQlo0lpK8jOUKWQMwbpxuWacZAZYzeLz8BFtVW
X-Received: by 2002:a05:6512:2398:b0:5b6:177f:b86e with SMTP id 2adb3069b0e04-5b8b6615f1amr41537e87.19.1789513351828;
        Tue, 15 Sep 2026 16:02:31 -0700 (PDT)
Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com. [74.125.229.204])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57e0bd1sm292652e87.59.2026.09.15.16.02.31
        for <io-uring@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 16:02:31 -0700 (PDT)
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f17452so244696e87.3
        for <io-uring@vger.kernel.org>; Tue, 15 Sep 2026 16:02:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw2OV9xGeVkdVIIuO1rRLzn8E7eSUPz2gjv9VMTQ9OAQLbGGucwkNSRLuNMANt7wtoGrhdAL6cqRg==@vger.kernel.org
X-Received: by 2002:a05:6402:5d1:b0:6a9:a6c0:e5ef with SMTP id
 4fb4d7f45d1cf-6aa2244ef06mr218172a12.37.1789512913950; Tue, 15 Sep 2026
 15:55:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com> <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
In-Reply-To: <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 15:54:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjhJF91TCO0Zqeuf+caG2tQZ4AzbLr2qFmRmnMM4dbh4g@mail.gmail.com>
X-Gm-Features: AcwNN1Wx2MaYDtFtmeOlL6MnzYY7doY_FEPpziKatTBWbLOeKsjmritQ5JuAL3M
Message-ID: <CAHk-=wjhJF91TCO0Zqeuf+caG2tQZ4AzbLr2qFmRmnMM4dbh4g@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: rob.clark@oss.qualcomm.com
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jann Horn <jannh@google.com>, Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, bpf@vger.kernel.org, 
	David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sept 2026 at 15:21, Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>
> With fd's it is more than just about error rollback.. exposing an fd
> to userspace mid-way thru an ioctl is an easy security bug to write..

That isn't very common code. It's something that is done by a few
strange cases, and yes, those cases should just do it right.

But "those few cases should do it right" does not mean "make a whole
new subsystem for this thing that makes a simple "open" actually be
slower and stranger".

             Linus
