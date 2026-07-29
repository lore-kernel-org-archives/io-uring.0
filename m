Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE94469836
	for <io-uring@vger.kernel.org>; Wed, 29 Jul 2026 16:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785344013; cv=pass; b=h/fCO29nbg0ZduJjduFtdV4NGcyWsGLDc2UYqs4TyLWJqUnp2WKePltGywibsm8Ze9oayTd9efdnniETfkCupY5myJ8Yo7GEjRfzC1nUkdC8en/DFI2ElooqoW/r5j4VJ0t8NdBsJQ7r3Us0DR+sE8nGImD6recyUHzS1HDjxAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785344013; c=relaxed/simple;
	bh=/YYV8EJ3uAY8vVlHWLu4xPFSaaoxJidP5IaWXw3aYyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qPK/ede2tgN+1tuX+5oa+I7nF5UvTSn7RtKGSLv80gx5Cw+klC8wmgOF8LRmGyKU6xkkgCAOBBvpCH0Fjy41rixy3k10JSnjfSLGv7alu2240KN7gJy+Y4BBY+KXj2Q1tgXukB+JeoE/3PnQCx1pR/4g0MtPF5qL9WsNSgO5sjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZnLVGTN; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZnLVGTN"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso1789414a12.0
        for <io-uring@vger.kernel.org>; Wed, 29 Jul 2026 09:53:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785344010; cv=none;
        d=google.com; s=arc-20260327;
        b=TLX0ZELW7oWAnvmnNQQo79Svx8hMpguYoL9uWktwJnea2Nw4Ch7TWiXCbDKaQ8ijzm
         z5WIElFFT0QOe3eKYnjuuuOp85I5HlXZ8Ps1e88ivVNFe1QbTh9zf4bRDkpkM6AbmR9N
         ZoYyu4e7cG19Kl9vZL6Wqbt5z8bvFUIsfM4Llj9oXBzqRbCMjSOnE1+Ey/G+hHQH3O5L
         gP826HaXzap347c3bOAyOApCK/hPRE2GgJdK9jLLAxE/7bxMryTc746n30PXkAr/vvUG
         Mn0J320f4I/m+I75qCPzKY/zZHRfDbtFiUQaRjxMb6VQPS6r66mtusrkmresbrIbXPI7
         xfWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iRO7Ed4PohyaBZ/SmZ+npcgI12Qnh1MLhDgk3TF8jow=;
        fh=uTLg6Bhfko3JxXcv3hpL9BSGmQB7Yb+xaPfxsU/Y4+k=;
        b=mE0/bgvs/xTrWK21BZLifkI5x+UvNPdu5gDy6eAy7APUmiolRRdC0Tih0CgWZm3XyI
         IvMziLTtuN7yeKAvqX8nMuDPZpODwClrUZwmaSAoPr74HHCkjyNaCC2KBow8sYuHO239
         Y1WSAWPc10HHNFtRMVKpykQmtBGKHYy7HfECh2ADf+3WrfU8k2P8mfa9XwWsx5mefW4N
         ZR+t4gSKPqCkCx/1sCJaNDOywLxgmmPZN16Huti4T1PIThMzPRhfZ7F44DGiqV+sF4QS
         d9/yH7ZsvHQXNpTaZ0nvWvxZsdTmibtAcLTCre0AISIRunmZ2GRS2lCSJ/OLfviT5sfS
         bmVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785344010; x=1785948810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iRO7Ed4PohyaBZ/SmZ+npcgI12Qnh1MLhDgk3TF8jow=;
        b=bZnLVGTN71+6rOGUEDOF2KKfsBoVzgPc+6KjOtUaxwoQVgAQmK+bgtKyqFpFZyFtJq
         nJFEqB8j7YlMnW8bUNEzJRfJdekDJcM3xXyXgWJfL8WDAjIA3f+W8yZPcnNdDQX6YYPs
         zt8TRyVY0NOcpOxJVRgxQ3PtjdnE21ULXhmra/XwVXzB7WWEeWKmgccKwMgl8IfnmX9e
         NcmoVChs0wbWpUsGydeoisKkkxMd3DGcCAK/J5JcBvgO1tu0OLStdS8VZccIfwTe6wFB
         My0l1BLssPp/A1RJ4FF3WmwVQ3SdB6FnYUo9UJmt9ZOwzK9HEYfhV0xxZNVb2TFtv0WA
         WvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785344010; x=1785948810;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iRO7Ed4PohyaBZ/SmZ+npcgI12Qnh1MLhDgk3TF8jow=;
        b=Hp1riJGtsSuJXRF3fiiQJgmCYGBRQgZ9Grm32Dki/CsU6WQpCdg3sFrE6kP7klip33
         5JXqySdj0a0IHJLY8OCFwRPuNzAmtAq/xL2l4AK/pEFW4X164PJPhN2LxnlpZ8KXfK62
         kZK1VGjZPxgjua3G+xiw4s8qKtU9FomnXh73zpckVr3IciqvmstH3Skdoqng2QfPOBGz
         77EekhQaBAq2LoIpAqrJ0nqiaIywMxWDMvtaO6yZ/f4Uawnr5Tn7RxEQEiIozR1l/pGN
         eyMo8zF2bVmpJmoub+2/WWx4yA3465O+Vdj/k7FpfK+vHtAPfhwEs0KI0DCy6hBPc6kV
         nh6A==
X-Forwarded-Encrypted: i=1; AHgh+Ro2p8xY4KIposUsxUnCl6C1j5R7lRc1AMXzh7hg8VG9LfLmzOqaC6hN3SsTB9ZTqCY8LEpt3RKDTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YydkzJpfq3IuzvMF8uwAc0KLAzo6FktkCyuRLkhxADyWBza/4ge
	382UdhkaEYMhEd9kLTInkZ7vRjV4T3TDW/zgRCi/K2xtqObJxQUU/KmzmQjpL2JYiYwpSpQrgyO
	vSRW4JBzpY4Sqq14hBoAu2xNk4jWiSw==
X-Gm-Gg: AR+sD13I+uuJaP0a2GqPFg0e+v7eLp6qGE4VJM6fFtUgFG7FCqaIcNlR2Aq9GwsfFy5
	3U/HLFsEJ5NJR6AW3G7afLHNTyOQc8GickE6Hh+FBAOGYE55MMe6O6ieDy6DRhBfO/C1cpQBB70
	5uWazBEkekW57TjXkoEpsQ/dfDxwduMg7hGx2ojYNWdtQSJYX9/SEikrugQDCdRJoj4tJSg7+Ex
	yi5onZzQpJ7T6GjIyXjDjMViIiD7G0IWrxzTpzVkb5lHgRt2ZQNfnU/ETU5C2A3O302y7zwWCAY
	vh6/D6SyCLhzwO9FzYf5VucnJywJvkLXG/9wzzxQ44RfCsIZx58YaHd6e71e2fW6XCd1q79aFyE
	2favSFmqPrhMLz427oQ==
X-Received: by 2002:a05:6402:5018:b0:698:ae69:3992 with SMTP id
 4fb4d7f45d1cf-6a0349ec697mr4404066a12.16.1785344009469; Wed, 29 Jul 2026
 09:53:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785274111.git.asml.silence@gmail.com> <CGME20260728213020epcas5p1721e72ba5544abf0b61482da005120d9@epcas5p1.samsung.com>
 <26dcd0ae5c87a3ada5710b14b6894ef343cec6fe.1785274111.git.asml.silence@gmail.com>
 <583fdfb2-5368-467f-a388-6d388859c995@samsung.com> <0df2f832-e8a8-4fdd-a5b6-e08657c2891f@gmail.com>
In-Reply-To: <0df2f832-e8a8-4fdd-a5b6-e08657c2891f@gmail.com>
From: Anuj gupta <anuj1072538@gmail.com>
Date: Wed, 29 Jul 2026 22:22:50 +0530
X-Gm-Features: AUfX_mw2n1ETd8ASN5Vcu4oMSqcqp6oKyV0zFdoD8l7zvxibNrqO80gPOx-5lV8
Message-ID: <CACzX3Atj+hJmF+Au1Yw5KMk--EHy_J=7Yof1aQNkUV0hCrdVEA@mail.gmail.com>
Subject: Re: [PATCH v4 14/14] io_uring/rsrc: add dmabuf backed registered buffers
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: "Anuj Gupta/Anuj Gupta" <anuj20.g@samsung.com>, Jens Axboe <axboe@kernel.dk>, 
	Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	io-uring@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Damien Le Moal <dlemoal@kernel.org>, Alasdair Kergon <agk@redhat.com>, 
	Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>, 
	Benjamin Marzinski <bmarzins@redhat.com>, David Sterba <dsterba@suse.com>, 
	Ilya Dryomov <idryomov@gmail.com>, dm-devel@lists.linux.dev, nvdimm@lists.linux.dev, 
	linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 7:37=E2=80=AFPM Pavel Begunkov <asml.silence@gmail.=
com> wrote:
> >> +static int io_import_dmabuf(struct io_kiocb *req,
> >> +                       int ddir, struct iov_iter *iter,
> >> +                       struct io_mapped_ubuf *imu,
> >> +                       size_t len, size_t offset,
> >> +                       unsigned issue_flags)
> >> +{
> >> +    struct io_regbuf_dma *db =3D imu->priv;
> >> +    struct dma_buf_io_map *map;
> >> +
> >> +    if (!IS_ENABLED(CONFIG_DMA_SHARED_BUFFER))
> >> +            return -EOPNOTSUPP;
> >> +    if (!len)
> >> +            return -EFAULT;
> >> +    if (req->file !=3D db->target_file)
> >> +            return -EBADF;
> >> +
> >> +    if (req->flags & REQ_F_DROP_DMABUF) {
> >> +            map =3D req->dmabuf_map;
> >> +            goto init_iter;
> >> +    }
> >
> > O_DIRECT is checked only during registration; we should recheck
> > (file->f_flags & O_DIRECT) per request.
>
> Nobody should be able to clear O_DIRECT, unless I missed something?
> And fwiw, io_uring wouldn't be the right place to do it.
>

fcntl(fd, F_SETFL, flags & ~O_DIRECT) on an already registered, already
open fd succeeds. The consequence is that subsequent I/Os switch to
buffered I/O and cause silent data loss. Something on this path needs
to reject this combination.

> --
> Pavel Begunkov
>
>
