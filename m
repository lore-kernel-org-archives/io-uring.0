Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C6E1E32CF
	for <io-uring@vger.kernel.org>; Mon,  3 Aug 2026 13:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785763298; cv=pass; b=HvKxitiqCzqBU+ncPVPjSe7D9B+wBV9Cg8/1iRKpbOI2IfMOx+kBujGYd4R78QzRXGBuiIBBUqw9ZzEuf83s9FpNCJpEefqneXKbWrA80sbu0wu7/jimTk3/qscU+NMS71jMZs+pUaUGEP1WzIRGTLaTuEBaFHnU/tgaPioxo6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785763298; c=relaxed/simple;
	bh=Pgl5mTcqFOqWGOQn2TZduStirxwuSm2pRwIjZSucJwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RlfM0nkcv5aWOJxZ0UT9DWg6cs3ziEyBp1rp+DO0ZGoIvWThy7U9Djygd9pJWhAezHmha5+lgR3QX82kt5d5UbXtCCZhNA57FNUXiwSE3Y1pkssmuh8QhLU25kDYy+QSITiwnsYV0m6vD3s/6/wn6lNdJGc3sS0cQBiMSAaaBIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvxRm/Zc; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvxRm/Zc"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso5522346a12.1
        for <io-uring@vger.kernel.org>; Mon, 03 Aug 2026 06:21:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785763289; cv=none;
        d=google.com; s=arc-20260327;
        b=AjIkxj5b1jzFLMbP9Bip5slIVoxwX2lMgSYf6r1a57UcX/DrZDyxlCx2fMH4yqR/Wg
         LnVCK1NyUULv6AGIc+maAmQzfQgJUp9Qtx3RfQZqpQI+vKjFvXhJpNL+JYqZZzrLxTvu
         ngVG9U5Vwh737hscvrdftBpnv5p1EwYjLqLwayi/gv4ztZe7cAPxNJsTGVN5NfBv8fRQ
         KfPcrjLQFvxu9mzdL36z0pzvLpMKGWYR0L8aKMsq6d0Ra/6f2cZNuoYy4LY+tTsxPrFc
         2ZIa/i85QBINgSJlBGcbKGggw7ixhP1YtdPlsaNkims7Xf/PpskI7xL0RF2ONEfJFLdk
         Xc0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y/+lXFVTL8yRFLlIHwc83PXR9zbnjKq/x3zTQK5cH9A=;
        fh=kEJrfonfEr/ZL44twxYCxLpceF+fgboFwa1DrrXf/tQ=;
        b=TRtt1ZcMMzqBxLt/7DHIk1AXLphhlGgi2CDityQybrCl2Ne10/W3Di3THbBShdEb/9
         UT02zFKqsGYZC/BdQcHEH+IoZAMlruJ6lwQvmaJBeJVYOBh/pHiSmJk6pl/6bGCwDR7L
         piea7SMF7GZypgSALic4AkJ1MmwidoV61qmmISZ0SfApZ7qKu24BYMU1ceAE/XTpmUTu
         yE6GkDrRq45ikZzi3CYY2F7xu5/Cit2WU5XCnlpJS4tvRogOp74f/UOCdjA4U7CxvaLT
         E3IF3o887CYOvaUBet8kSLO29y9IIEmTD4x9qh/eaAhPUxd/0ypjrbTFN5gnJ3wPkBc7
         B1AA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785763289; x=1786368089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y/+lXFVTL8yRFLlIHwc83PXR9zbnjKq/x3zTQK5cH9A=;
        b=dvxRm/ZcGYR2VElqHNvrbIbP9OvHsQkpvLJObV5wRx/fXOfUt29OLPtE+JvxWK2AOQ
         3VhaxWdK9wr8VU9F7OpdHh93UyXYln1zJIFeKxpY8byuq8uH5aOk6evZeGjO9IkqTptd
         6pqSXC4iIsTM5Q5hI3ihgFCpFYQmHAIH17jBmK2nWesFrnXCN+cLlB30cVLoPE7iBxPq
         YNZUhtvw1JycZThdfbfdyNVwsIyNlqZahx8PqEto4vhXRgRne7m4fkHUxVzQMxB0N/A0
         77oJ0UDkdALZBQIED3QKAmbqVImouGpGGwdcCJe4RsLDjGD4I5xyy4Jr8+HbjvOIgaqa
         GxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785763289; x=1786368089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y/+lXFVTL8yRFLlIHwc83PXR9zbnjKq/x3zTQK5cH9A=;
        b=bb6FmeiBLncDYHbP3PZrZ10EmN6UAPFFaEOXSCS1tdwtjgBri0MQQR3H24T+UdXzUW
         OWX6C69Q+gN9bAKV3jzziNz0/Z4EvEwqqHAbPStKKUJZuimJi+zT1r7TMnDhelCWoJ5t
         vJumGos2/NFZQDmZ9QW856PTXmH78FtfqxuXYd+CIc5JE7LXQiCqn3gpxq7CocKhLWUl
         DCSKsywW5Z/kbAfOIOFZzHY/56fZcOEJAFHe5hF1NKjqIWgyE+gazgWxTG5PfchPS4Qx
         uCdqLYLs3p4TKQLFJWK9OIQGKNpOAR1ShvJKt8LdG9mukx95LkJc5o6F1UJrTaqm2PRV
         ILuQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7iFTnPIxRZaJVZ7Dj/gdYUmEYJwStT50il5IqBMV6ZONXtTngdgkruslCLlQ89t+gELT4RRSb1A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Fn9bQiSOWZavYJUFIWt50k+Jw3LwZxC9dhs3as6idfQ6dhYo
	MqaZlScCefNlMQf8yFAjhF6eOw7UHyaRnTjJ5Lc9CZNb5tNWsXr5/IBXjQTzYfLV2zZ+O7fsn0h
	8zoTHd/9be6DTke/Rif6oWVITwh3nbQ==
X-Gm-Gg: AR+sD11huT+ZA/9xByLFG/ISbo7H8+EAaGLS5VO9ONb8vRLUYpFIlaXzaIdtECsannL
	P4RrARterUKAPJCzGZACrys4IThcudLGO4uDfd9jJ05VoeZl+YZyB4gQ9lxf3WtFoHVjFSHRZ6b
	BrEkmzDKEgvCxcPsdev4nQxKTBhtrOz+VOYLD3WOyTJ2wkAsinrZidn5u6wQVGiNRx/Dm8qt96X
	KTgR47yhoAxonI72W5BQLSo2KAWVSPziKvcVTr8b2CUQKQWzNxODm5WEq5QyOAqi7EkhuZXWbAC
	LBuJI/vTg5gA8FlWfjJ8Rbm6/I/9mF0iBR3z/1ZLpTtGbxfWBgouAJ0ipmh4pEU9rf6i6k4qSOm
	wY9AXGfmuFZLDlQM=
X-Received: by 2002:a05:6402:21d9:b0:69c:794d:4862 with SMTP id
 4fb4d7f45d1cf-6a0a7c614f9mr7875783a12.7.1785763288576; Mon, 03 Aug 2026
 06:21:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785596451.git.asml.silence@gmail.com> <c1ab6c0db3853b339a89aee0b1a9c5ac0c48b79e.1785596451.git.asml.silence@gmail.com>
In-Reply-To: <c1ab6c0db3853b339a89aee0b1a9c5ac0c48b79e.1785596451.git.asml.silence@gmail.com>
From: Anuj gupta <anuj1072538@gmail.com>
Date: Mon, 3 Aug 2026 18:50:50 +0530
X-Gm-Features: AUfX_mwnLWCAPfRurFp37qU73Xc2KDpD6en6Q3cA2kgelroMq6uNFVC_YKEZqSE
Message-ID: <CACzX3AvwBF32_ODomei3XHSZ=KtRaWLN-_Tfkwv7sV3Ssc3wmw@mail.gmail.com>
Subject: Re: [PATCH v5 02/16] iov_iter: add iterator type for dmabuf maps
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>, 
	Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>, 
	William Power <william.power@intel.com>, Phil Cayton <phil.cayton@intel.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Damien Le Moal <dlemoal@kernel.org>, Alasdair Kergon <agk@redhat.com>, 
	Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>, 
	Benjamin Marzinski <bmarzins@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>, 
	David Sterba <dsterba@suse.com>, Ilya Dryomov <idryomov@gmail.com>, dm-devel@lists.linux.dev, 
	nvdimm@lists.linux.dev, linux-btrfs@vger.kernel.org, 
	ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 1, 2026 at 9:19=E2=80=AFPM Pavel Begunkov <asml.silence@gmail.c=
om> wrote:
> @@ -841,7 +857,7 @@ static unsigned long iov_iter_alignment_bvec(const st=
ruct iov_iter *i)
>
>  unsigned long iov_iter_alignment(const struct iov_iter *i)
>  {
> -       if (likely(iter_is_ubuf(i))) {
> +       if (likely(iter_is_ubuf(i)) || iov_iter_is_dmabuf_map(i)) {
>                 size_t size =3D i->count;
>                 if (size)
>                         return ((unsigned long)i->ubuf + i->iov_offset) |=
 size;

dmabuf_map shares the same union slot as ubuf, so this reads the map
pointer as a user address. gap_alignment() below already returns 0
correctly for dmabuf - this should too. Checked the rest of this patch
(advance/revert/restore) - none of them dereference the union pointer
for dmabuf, so it's isolated to this one spot. Doesn't affect the
current series, nothing reaches this with a dmabuf iter yet.

> @@ -872,7 +888,7 @@ unsigned long iov_iter_gap_alignment(const struct iov=
_iter *i)
>         size_t size =3D i->count;
>         unsigned k;
>
> -       if (iter_is_ubuf(i))
> +       if (iter_is_ubuf(i) || iov_iter_is_dmabuf_map(i))
>                 return 0;
