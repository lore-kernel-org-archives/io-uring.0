Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEE5EED8
	for <io-uring@vger.kernel.org>; Sun, 11 Oct 2026 08:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791706151; cv=pass; b=gXzDWpBA9z8xgP0pJbyjyx3k5mHXHpRQ3FCt3J3ODSKdwu7/8iMggM5bxtjisn4ytzW7RtGOwBFATtm8a2R+JaH1hv+K/yBPw6VP5TnDG4G9HgkuzgUZr+o5YkShmQHpdWZwrsytio8IV5aeHpZCK9w5JOft9N+f2b+YpN+JAtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791706151; c=relaxed/simple;
	bh=456hjJXzLfO9u8LggP21BRuzL0marTjopkVuGLtdsuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OWeXDF9e5TjriuyzG/uGrz2p17NN4bL6la5657rtngz33lA15yQFR2B5A7iMnGWDmm2cR3x2bvCgGHghqlEozS7H1D1EXICNJ4a3mtMhvG9zBCq+QGVWR4ogZwQ40PLBI+79+kgcXlWqo1ej0LKZHmOTGfT6DE40prTeMf7EsTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lCXHjei5; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lCXHjei5"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-8198a3a54d7so3059953a34.1
        for <io-uring@vger.kernel.org>; Sun, 11 Oct 2026 01:09:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791706149; cv=none;
        d=google.com; s=arc-20260327;
        b=EBLBjGJ4ueXe1KzzMqEyR9PXMqnqLhWAYq75UkQJXxhQ9hx5urHCaRUTLwHyN1v/f7
         KLp0hRcuyvRYLGvBrhjH55TyRXyrhm7wY2FR6mYVbwXHz/3EnA9a1jozGU4Ymmk8tYwA
         Aol4gE5VZcvrKudIJOU9FC/QV21ZK38LJ5gYPan+NCjrni4dRwFi4dHkzKHWxq/PK7Oy
         cBEQ1pq0JjgdPIBE9CmuvnpsYI0v6UDDHm9FMm294jl6qrCX2iiXKQe54MGbNt4s/2nO
         kKW3mJ9Ddme2GIX2UJzBp4bpR8mcx9GupFKe09vRB99HhAZUNnGmOg7O7ppgCu5cQNwd
         rieg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TrfDN8QCSDnrD5swZB+fuUwhF2n+2YKrUm1LOsS6ico=;
        fh=lea8KOi0Az2BmnbEzYojz362JyZ9144XL2cWakuV1vg=;
        b=nNR+fnk5hwoAFPOk9Hqpt0RB/wQBOUtT89Ru4Vy1mu2VwV0d4eOHCvZ33VKt7B4aHB
         ZYJNpyH97DQua/gnAIuRSZkTEncD2oCTVT+Uz/lQBbotPS0cE6tUYaFEX5nfe29G8Hbv
         jfowrqFGs0VEjbRgixEoPR7aHZ9KX6SDJZa0sFzv8LNiS1PvEmYelN3xk1SDFg3UepMh
         FU4BYu/rpQqiFe6hmYw/EmIZuauYIEe5No0kArfggr1RYDpSQoJ+XicO7Viq935uORMt
         +oMR9Kcqb3RBmNnivnRL+KiYUPgi5xPu2QCfwS21VZYxR56MO98jAj4itHHXVm6UC4gg
         pp6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791706149; x=1792310949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TrfDN8QCSDnrD5swZB+fuUwhF2n+2YKrUm1LOsS6ico=;
        b=lCXHjei5h8rfofg0UdBPpanWkxuLd6TTxDP+yOzNXp+vQ1JNJTngkuxZAYrmrp5Ao1
         hlAKcVs1N5C3u5BBK1luN5wXXN+/+pksH1yd9SqLO65Xu3BJFpSZgRZZ6GfmQlLhZu8Z
         hACu0KJ4nb1JNkkxwN5E+kmNZRFz1tAJpzRmn1R6Bj742RMslzwsUJG3K/EsiXROYEMF
         ydffyuHpjbx4MMtRjr+HBXnyJgiCZ3Iet0P3l7WpIn996PMhp1UklTNSSoEj2W+WZpIw
         3AWCvdUYoMFc2A1lkivNeoFH1wAwa4//olkCUcNtZ5znWAG2NIciE6DSFupVUUKeYaUB
         RFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791706149; x=1792310949;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TrfDN8QCSDnrD5swZB+fuUwhF2n+2YKrUm1LOsS6ico=;
        b=Xb4W+wvq9R28NmPIvU+Xn4t+lUrZazdJHHkxO5B403YHTbNIC9R9Xvk9BtwiKDsT+q
         P+OifDbEDzi0LIM4QgdkVzyTQaUNj4OFoIPmr+aP2O86a2eL9fN1h+eCrbmGi/6vavVS
         76SCszP7xh7k7LfgwoFu0t5e0ebUO5PQzIx8avUsKc/HNm1pC6o9Omie6rOZ91kk4p/d
         cfLq2vtktWmFWe/4paI/IkW0cc+ti33HZpSlo4eTUSecJ5P0N9ggKuIO6QrjTCDQ7ab3
         6+EkOa2/ZnWwYdaRcGh0gRzK1kzopWf6siqeTPXtWvS4aRjYxrZrRjvVEDJG/YJ6WMnm
         0GKg==
X-Forwarded-Encrypted: i=1; AKwUvByPhjbs0mEbXajAmFvjU9WmnWSjvrwZN29a+yLXOJWoGMWCPDlat3gP0vi9epvK0wKVqbUNBhItiQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+JwC2K6wpWNZJI4Xua8Uh9Xl4F0BK9v5WokMgB+dbga39zJA1
	ZWnOShxAYOEVL4y1l1pheibYoagC4zfKkAyidR9EbVdS2KqkPG577aLFKFaPK9E6+mg6rsoy8Xn
	w5Nxi7TQCqETCy+oqlA7KZCVXJRUfMZ8=
X-Gm-Gg: AYBFou3iwn9F3B3noTLpjVN3lJVTsHeOCxtcOH05zFeUfJ50DoKJLorGNVF/gmrBdj6
	+J2hCxQwKyxQ6S7j86po4U8gaMyk8yEwAqhVTChF3L7U2iP0Fc90PaNhn0OiZqfzdXzdjT+Q3U0
	K5GbOzaxfNZyES45NdYVzaagicwv9zOW0GXM/lkMNGLBU2wfGKDjfMlMwrznL1ZpMEF6Ia9sPbx
	mJnQGWpUlqIgF5YKeKhMJkIvS7kM5dXwO7gGOLqec0RsJKREjs2o2AOUCF+p1+xiha3XqbnNm+S
	tm214DxBjeY27Raw9B2lh2jK/m24KzEpN3oIrrmhy/yMUW7WJXd78i18+lwDlOfx09WH3mY91rX
	DUSqCYgxX8219q+7d+ixNC4T+cFwMAfjnv+xR49qHCr1IRtWsfbcp4hg=
X-Received: by 2002:a05:6870:263:b0:494:7af4:955e with SMTP id
 586e51a60fabf-4a2a49a8588mr4438684fac.17.1791706148658; Sun, 11 Oct 2026
 01:09:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALkdYjXcbwUW0=Eb52Fu1X+kLyVxVYZC0D3iEL-E+BmH6C7FkQ@mail.gmail.com>
In-Reply-To: <CALkdYjXcbwUW0=Eb52Fu1X+kLyVxVYZC0D3iEL-E+BmH6C7FkQ@mail.gmail.com>
From: Ming Lei <tom.leiming@gmail.com>
Date: Sun, 11 Oct 2026 03:08:57 -0500
X-Gm-Features: AclHuK-ypxXVNwFF7jTrm1j0rPjKUoeQKvy5nhuzAp9PB7YTYo1QnD69PKj8D34
Message-ID: <CACVXFVM7_HPUEnjvZY23zu1kwtbw=kwm87FzcNjtpDzRs976Bw@mail.gmail.com>
Subject: Re: [syzbot] [io-uring?] WARNING in io_wq_put_and_exit (2)
To: Eugene Siegel <elzeigel@gmail.com>
Cc: syzbot+b0d54b9e81de55179e47@syzkaller.appspotmail.com, 
	io-uring@vger.kernel.org, "axboe@kernel.dk" <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	linux-kernel@vger.org, syzkaller-bugs@googlegroups.com, 
	Nathan Gao <zcgao@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 6:18=E2=80=AFPM Eugene Siegel <elzeigel@gmail.com> =
wrote:
>
> Hi (hope I'm cc'ing the right people),
>
> Using an LLM and a deterministic hypervisor, I was able to reproduce
> one instance of this
> happening that occurs sometimes with a process submitting
> UBLK_U_CMD_START_DEV and being
> killed or exiting shortly after. It leaves an unkillable process around.
>
> The process did the following:
>
> 1. open /dev/ublk-control
> 2. io_uring_setup
> 3. send UBLK_U_CMD_ADD_DEV with 1 queue of depth 4
> 4. SET_PARAMS
>
> The process did not send UBLK_U_IO_FETCH_REQ. This way the queues are not=
 ready.
>
> 5. send UBLK_U_CMD_START_DEV, since it will block, it will get queued. A =
worker
>    will spawn here in the idle state.
> 6. do_exit is called. io_wq_put_and_exit will set IO_WQ_BIT_EXIT and late=
r calls
>    io_wq_exit_workers which will wake workers with
> __set_notify_signal. Then this thread will
>    wait in wait_for_completion_timeout.
> 7. io_wq_worker will get_signal while still idle and exit the loop becaus=
e the
>    IO_WQ_BIT_EXIT bit is set. Then, io_worker_handle_work is called.
> There is work on
>    the queue and this worker thread will call ublk_ctrl_start_dev.
> This will call
>    ublk_wait_dev_ready_and_lock which needs ublk_dev_ready to return
> true. Because the
>    process did not send UBLK_U_IO_FETCH_REQ, this will always be false
> so it will keep
>    waiting.
> 8. no progress is made, so the trace happens after IO_URING_EXIT_WAIT_MAX=
.
>
> This race depends on the worker being idle and not having run earlier.
> If the worker has
> already run the item on the queue, then it would be waiting in
> ublk_wait_dev_ready_and_lock
> and return -EINTR instead.
>
> I think this is just one instance of this bug, there might be
> unrelated instances also
> in io_wq_put_and_exit.
>
> LLM-generated test case (7.3-rc6 (3857c2fe5449), KASAN, 1 CPU, needs
> root and CONFIG_BLK_DEV_UBLK) below. Note this will leave unkillable
> process on machine. If you run with an argument of 400, see dmesg to
> observe the WARNING.

The following patch should fix it, and I will try to improve it into
mergeable shape:

https://lore.kernel.org/linux-block/20260930042335.16199-1-zcgao@amazon.com=
/

Thanks,
