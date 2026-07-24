Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304CE423780
	for <io-uring@vger.kernel.org>; Fri, 24 Jul 2026 14:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784904214; cv=pass; b=W+ozHHUOe8EjxAR98E7xcari4P3il0ZayyQtuSf12GGjJFL6R5STYUtu1eoCxcJNTIm724jrLqRyDYvTQ4vm8fTRFarsetgCYQ9Lpi+C+x6igeCfyl4l/UMSbxooT+q9nm++8XfXuNmLNZf3CjpSFUcTdZdMWjD+A8iq4ZBGQqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784904214; c=relaxed/simple;
	bh=2oZVdl+YtlMluPxd6Dzak9mezaDc5cB7B6pdlky0Xc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MbvVSlTcOoZZ2oTuv9PE2BpxbKeZnwXre0sh94cpDhZx1PORc77ojZu2vN4aqabWwmI7IBGVVSwlAxnYSTHBgMPgZ4PikQzNHK/JvjBWixYEFwvELTAD8+Q+7VLibqwzYbIXRKC5xWqKHVRnEXa4DAdfWA5t6BSMHikyVnBn8Zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M5z8GqjG; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5z8GqjG"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c160420289bso70288066b.0
        for <io-uring@vger.kernel.org>; Fri, 24 Jul 2026 07:43:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784904211; cv=none;
        d=google.com; s=arc-20260327;
        b=HXiNsPg/ahFF2OGecbmGsXfN0OWt2y1u8FxPCYP4owh1duSEr1XEDlvuhqG6N3H/2F
         QCcM/YowbHW4tff76LIK70BoJxDEA4hxytCa7ffQ06Na+meHg1376suyo5bcShYG/1+n
         2joezDwQ34ErhSKXqgdcjRTMmgljZbM0J++c+2qztfCGu+5yNAhWtSiLKOslbLSu3ybs
         Z+wLpdcuTGHtDnesr/G+tIwlp1su+/GvyG6NoEB4uaQsxz+KHcuHaj5u6L9TCl78WX97
         h4GL5UMWj8kvsjvxx4B/CYWmFhUoa8qHlY92XerElRjZifC1CDNQsWBaF9nz8Kh4yCPE
         3gag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ShRRGKujzcXZ1TiOmitsEwM71LNmyg3rqboTjurun4Y=;
        fh=0VayK2XjDeJ4j8vwBgfYcOiJ6TyEAbAhKC6uY+zORuM=;
        b=EsCV0NJpOt9fg49/akCP6D8svl3ExGZiv4ekS0Zqd27RCv8OfoLSYulKgQzEsdodce
         lFOL5c0rdWlvFXaFYzWIWqc+ZGGcKwZH5/h1cESE5diaV6crfsRVwv0wFASBOWRRHKF3
         CxG6XCXolXCii+gO6KDtXbBen7nppyqxpWJ1rELhQ2P+eMC8JB2Ht38ksfsNsHxrKrhD
         m+OL6P5zCsVNQxQbVuH13CnN7dARf0No46GZBwbuTSmxh3ASKsiVWaB40VhJxovspp74
         pf+UjQ1xP41Ue285Dl9nRY4DWZCDXQMxTmzDzpDYscBH444q8AlBkA0qJxvZBgQCvk3h
         +FDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784904211; x=1785509011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ShRRGKujzcXZ1TiOmitsEwM71LNmyg3rqboTjurun4Y=;
        b=M5z8GqjGov2YXFCf8SKEZb852HwdQY0rhfWAnFdoWGxHyg7YuMPlwKJb+/XTpN/pOP
         O3YOdjdlcwu1U08oiD8DC97F5v8yoGWWf9nx5ZApTxDkKTv05IjNo3ICmkhqA/VBZtE8
         D+io8SfDdJ7sDPHu98SFpKD9se+6U974zWNCCQRqPo7IwAMzGYEGPlwGnqIQjRwLVfgn
         4ckC6MrxPRSN6KzE6swsavbqgNKNM0ma+rqt7tNjIpMPjCFJgWt1Qwg1zEnEPcTJqN7L
         1TLJuFX1/uz23itvc1lIvJvUyy2QAgX8vkM/qRAjNbyG9OYvHwPv9fW9gRGjF+lH4v6J
         VMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784904211; x=1785509011;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ShRRGKujzcXZ1TiOmitsEwM71LNmyg3rqboTjurun4Y=;
        b=Pyp9P2GBAjKSXhePVUyDp4XG7mI5ynp4BINmZVKwnUfWH6/yzReh34bm2AFv5v/MWv
         XqLe0VSu3ZaNvAVTRdrlSLcRKsAtvn7762u8m31jnM1zR+jIoux4q35gxsJLg242yPtj
         A865C6B9TOdF2H04b66ji991fJlmLEgoTEYyL6PJqDh5Fe1I9sSvaHsREbWrh2s2eMr7
         9G93mWaM2TaWcNqQvCybuPqgmZQ/YO11zY9BscjcLgTcncZRQR1z5YSJssPiqRLE+kbY
         V3cXbHeASY4zGqTzrjO/6++Z3WSr7pLUP21Lp/goGB9+v0d648pEo9DJO21ooHqu4nTF
         Fs1A==
X-Forwarded-Encrypted: i=1; AHgh+RorGsulW5qDOrzlIZqfv2IEZmuBqzj95DaL7uip3VCnZLTVsjfq4OXOQKLOm2ga2RAlE+3WTfDfQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDoNkpolGHtTRPKMzD6PXIISquoEgO++uTK3QNk3lmESVTsoec
	7APurBnhWLEzVlv7S27PHVeXFeICTO1nIQlyM0gwGwzXan4QYrKlmZxcadc3Uqo8sGjAscNReZj
	m/O3DprzOblKZgVyZmiPgjnfwb7W0X1c=
X-Gm-Gg: AR+sD13J9qv7ePwvlCLLyb+zPADzp2AutkIHanyYS2k+ZBPFRcweaSJ4+PtP1CmZNkF
	dU/ARUgQGUD+0+FcrqnH31bSBgUGfyhYRBT+o4b89Y9efE0U43b9R3ANd45D9qzaH2C6lFOrA6Z
	xlaZpKqzKv4VWoVaQutLmE1rELavSl9ImF5/lyte6fhNFbhxHVsFmvsHa2hw33YCVM1mAUMrQLI
	mT/nu/CDCoUzCIRYq4wQBS9+AvKby3P14ss98FAFtfInMeeCCCNLl9VQ33RQOFN0EHpBtfpmTPX
	AKuYoOVrOmA9dYN82g==
X-Received: by 2002:a17:907:7ba8:b0:c15:d422:3bde with SMTP id
 a640c23a62f3a-c1c50d1c4d9mr375136166b.32.1784904211164; Fri, 24 Jul 2026
 07:43:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <amIqfCo25rLtM2U0@redhat.com> <amIu5WWgTNkdvqIz@redhat.com> <amNvebqiG2fH0W_L@redhat.com>
In-Reply-To: <amNvebqiG2fH0W_L@redhat.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Fri, 24 Jul 2026 16:43:18 +0200
X-Gm-Features: AUfX_mzn6tikByLwhHYWsdsQESjwRlCjD9AOkTBfYp8Z2SIwO-rx0kjpSwhwJEM
Message-ID: <CAGudoHGiKYfF6L1yFy+QZgQaTt5ULnp6rgRaZE=6BANkpjrb7g@mail.gmail.com>
Subject: Re: [PATCH 0/1] pipe: only enable the extra wake_up(rd_wait) when
 epoll is actually used
To: Oleg Nesterov <oleg@redhat.com>
Cc: Breno Leitao <leitao@debian.org>, Christian Brauner <brauner@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org, 
	Alexey Gladkov <legion@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 3:58=E2=80=AFPM Oleg Nesterov <oleg@redhat.com> wro=
te:
>
> On 07/23, Oleg Nesterov wrote:
> >
> > OK, sashiko has some concerns
> >
> >       https://sashiko.dev/#/patchset/amIqmbbZx3NlzUsX%40redhat.com
>
> Let me quote:
>
>         Does skipping this wakeup for non-epoll consumers break io_uring?
>
>         Applications polling pipes via io_uring do not attach an eventpol=
l context,
>         so pipe->epoll_usage will be false. If a writer writes to an empt=
y pipe,
>         io_uring receives the wakeup.
>
>         If the writer then writes a second chunk before the first is drai=
ned,
>         anon_pipe_write() observes was_empty =3D=3D false and
>         pipe_get_epoll_usage() =3D=3D false, skipping the waitqueue wakeu=
p.
>
>         Could this cause io_uring to miss events and hang permanently, wa=
iting
>         for a CQE that will never be emitted for the new data?
>
> and I am starting to think sashiko is right (damn as always ;) and this
> patch does affect/break io_uring.
>
> Jens, could you confirm? If yes, we need to update the comments in pipe.c
> (I've attached 1/1 at the end, so that you can see what this patch does)
>
> I know nothing about io_uring and io_uring/poll.c is not trivial to say a=
t
> least ;) please check my understanding.
>
> It seems that IORING_OP_POLL_ADD / IORING_POLL_ADD_MULTI is edge-triggere=
d
> by default! Like EPOLL_CTL_ADD / EPOLLET.
>
> This means that io_uring depends on the "nasty semantics" too, io_poll_wa=
ke()
> path should add the task work which calls io_req_post_cqe() every time th=
e new
> data arrives, even if the pipe was not empty.
>

well io_uring could set the flag as well in that case? it does not
inherently mean random select and poll consumers definitely need this.
