Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793123394;
	b=5h8qmOrPmQxgxipfP6I+f4HatuDUosuYRwiqR6a0RmguRty7/7yUrUHGx8skkjdKLjkI
	 awl/b7ECsbblKQgxwXeYKSTbRAE748e5rlXAQJtDdWrKE/5d2/QyiKBZrWXydb8n/dlwj
	 5kjocVupr5eCEiMrUXYPBrjDxxZpX9JeAOJ7QiZOOqdZYs+dCfjdaKZQStrOYTlP3cdtf
	 /047xqftvIW1z6BR0ZBMH1nCNfkA/aIV/RLBuUrCJxyxrIO2RphIk5qP01c11EDV/yaLU
	 O9rJtCvM8XMzKH/CE5PEh7cV8UmVsw4WRPFgkHIZcfysk9pjmh3Z17rf3yE4B6GeCKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=pmxuATz6Q0v8YZq9eZB17JiD7ofsK6hYGMgJE7NMLyA=;
	b=4gXOvR7oawup3zq95fv2/4Ks8NUlSZqMhqNFOYtyL8SCUzFy4Ldfp47TSBsxVFUQZsuQ
	 SSgLkes9RW67hE6FdXfIrGtJPG6X7A1C7dRL3RYE9A48Jj7eFKuAREqNXjmmstRV0ItXv
	 0ILBV40N8mNprkchaM+z1zek/T5j9818QA5iBtBipJWT/ehNN/zYqBF6O3zd3cdXTVYYL
	 Kh+ya2ktFKBHOllRuPH98Jzsf0Ceu1a3LGYENiyi6FyV2uGleHdnf5ZA6NHWvPgjO0SLO
	 GWtDBjlLtDlNEeM1aSxA7QFbIso+uO9XZEKPfG4ziliE5t+fe2ufBs/wDVOERfPWxig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lJFDpZaU;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23A6606A31D
	for <io-uring@vger.kernel.org>; Tue, 27 Oct 2026 17:49:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D23A6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lJFDpZaU
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-843b6f8e2c7so155096a34.1
        for <io-uring@vger.kernel.org>; Tue, 27 Oct 2026 10:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793123392; x=1793728192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pmxuATz6Q0v8YZq9eZB17JiD7ofsK6hYGMgJE7NMLyA=;
        b=lJFDpZaUNnVFoxOeOhYAlbKxKkRmNwhX+/qrpc3NMkWeVGlys9iyAqdiaYS3VIroyz
         zrpV1Mb+cHjD8GY2AA7gOAcrckqldtzEMppf+0/BjEvBMHYfAv7RYEj516GWVuelkydN
         D4Y4RH0K325tgAL8opvxSn7ACfdSAyYsHInbzzm0f3skwOecG1YdmUrTRNSpFk+ZNCtF
         KxAyTNMaqLlyZe3QtMXli18t7lh0iOAzTLvhB+g/38vry3XWlZOsZ9jcHZ+UtqKAgXmI
         aZwcHwEJepNxxTa+i8VqO/+UVIHDlqDTRrihoCZaU6dlq0GVIeCM3JepforsoHe+cT0f
         SDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123392; x=1793728192;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pmxuATz6Q0v8YZq9eZB17JiD7ofsK6hYGMgJE7NMLyA=;
        b=SPmUFwYyEpSZwiEvWfWxQUEyl1oWv6MnYHZzDqn/9AhUvse+Xvo4LOimSR2AVm2vSI
         V4hsPCufoqmfLrbLBkcWTrMmcy+e1etnIqEbvBMNgMjO+iDHIUrAbX6hkP6kXgCXa9HO
         LAAapOQ50pDk1NlV5+D12ZuW4HLe5x6NwdYVoG3rglySPBnyWXXemP7BsKuQwbN6ik7m
         iT8EqMMJp2GPGoCooyH7Ilu7JARhbVHkrUTMeOeh/12qB9ocZMoOKwWzoN/doX8Rzm9Z
         3iHzID/eAzLxPR411qOTfsS08CYV/v6krfkxGfhbNFjyCVN39AIn2DmwMVSXD52XPFr8
         BC7g==
X-Gm-Message-State: AFq9FYJi5wBz0s4RhLpk8zQWeTeOj55p/EWPjwL3tw+DVnAglS9T8Eb3
	ube2+0nzmYYL/blqyiyMN/3hLGBV3tmsouAcpes3/G1FU4YBtpKKWGk9/MiA+wf1WhQhz5Cz/0y
	xe0pS4S4=
X-Gm-Gg: AYBFou2sDBZWIbYH9dihfmU8YjjVpKB9wvlGzdLjqyNZCnbJscdG7jSQeJKmWhtmYxJ
	ACnCKd5o8qXGCI4fr2Iv6tKUqUaz+1sLIE0SzC/V8vriXBKmWF2GgjnVUX3tVdn/seGbmiNVMEs
	iJozTyEteaaad0az9GhkSRybnUP3mKSArBx/vKMW5UuKTnd29NsyjFc/A0V2loBTZS6iaxwz/xk
	Hk0Lj4g4VjI+39P323YL/4hB3c7uuDeAzHZ5BWGdIUxp7/kndLdWI0N9tPa+n/FI3/CSfKn8T7b
	jE77uYe5K170zRfx8iaR0DM/EKpbKm4croje1AW9I9E8L6rvI6bKqFdiYNiTCDILa2xA36z368T
	ufDEhfFhNmW/2evVifepjRM03sc1BYSdiCt99TkaVa+dw88qYp09mPXwlZZjsPPtb7blkfrxrI8
	l31gXR+NUNxihxiQPQCC4f0zQw42uxaofT6vQ3dVhB1es7mR5LEu1yvz2ZPd7PJgzxBh7mYle2F
	ZtndQSqfonMwYbZdAcDaFU2GejyS7UyNclI+kZmk0UNqdKkybj58XHLLYQbrnPupkFDawSiho3M
	FcNEVznI1J+/skL1dnT1vTBDpScFpEH2sVqrJUMDlkzxqG6Q9BoGGlJeKg==
X-Received: by 2002:a05:6830:4110:b0:843:98dd:84e4 with SMTP id 46e09a7af769-85ab4e21711mr351411a34.3.1793123391741;
        Tue, 27 Oct 2026 10:49:51 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850f8458a4asm11484186a34.3.2026.10.27.10.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 10:49:50 -0700 (PDT)
Message-ID: <fceefe1d-c513-4cc2-97be-ee2919601f88@kernel.dk>
Date: Tue, 27 Oct 2026 11:49:49 -0600
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
Subject: Re: [GIT PULL] io_uring dma-buf support for 7.4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: io-uring <io-uring@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>
References: <b97140d2-df87-4cdf-9f0b-d5ca404d50da@kernel.dk>
 <CAHk-=whLg-od86aV4HU6yC8EKh6zsVWyyvWVOcrVshvxoQ9dAw@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAHk-=whLg-od86aV4HU6yC8EKh6zsVWyyvWVOcrVshvxoQ9dAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/27/26 11:45 AM, Linus Torvalds wrote:
> On Sun, 25 Oct 2026 at 03:30, Jens Axboe <axboe@kernel.dk> wrote:
>>
>> This adds native dma-buf support to the I/O path
> 
> So while doing the trivial resolution, and looking at the code, I note
> that blkdev_buffered_write() grew a
> 
>     inode_lock_shared
>     ..
>     inode_unlock_shared
> 
> in it. But looking at the two call sites (in blkdev_write_iter()),
> _one_ of them already has that inode_lock_shared() on what seems to be
> the exact same inode (bdev_file_inode(iocb->ki_filp))
> 
> These all went through you in the original block pull:
> 
>   1b1be9ea4e34 block: take the inode lock for buffered write fallback
>   2fec4fd97cc3 block: take i_rwsem for the direct I/O write fallback
> 
> am I missing something? That nested locking looks not just
> unnecessary, it looks like deadlock city. I'm surprised lockdep hasn't
> complained, but I'm assuming hardly anybody actually uses this path.

Someone did actually report it recently, after it had been in
for-next for a long time. There is a fix queued up for it:

https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git/commit/?h=block-7.4&id=21b88cc8bafceee6c6c82503e3b2cc6f1d0c78bf

since this morning! It'll go out later this week, pre -rc1.

-- 
Jens Axboe

