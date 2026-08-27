Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B687F377019
	for <io-uring@vger.kernel.org>; Thu, 27 Aug 2026 20:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787861134; cv=pass; b=BB6/CEIX5ArQK/4KxyL4IshKwwjNittFmJux3KhaT4hfhxrxGU8uneoaizTdf2oORi2aamzXnKy4LR7IIJlqvEZKpxlLluhFbQOrmyVVu6X5JbfLGaG8VX5MAbWo+AvcxuFlj1u8Dbt5Oq0MK8PfVr5uwAIq1n79BpMyxqcjdcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787861134; c=relaxed/simple;
	bh=Amq2Nq7g4Rvhi+A8MmnZy28GeuV84bebu12tbajvslg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GkR/30dY4eFJpeVS7RHh7Oce7KkRzlaEzcl0Omv+B6mmrKcJ2E5aIPjxlgwIUCVV/SQS+gDKDBDD6snp/a9CAj5VUxNd/+q1vaqUk9VEvbKC9dmKgwSGZaCueT33aPDdGiIFHZTsuuwJ3Ln09R9qd0f0IM+Q2qBiMUbF1jvghII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBTcaEmd; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBTcaEmd"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b8f86c6deso922355e9.0
        for <io-uring@vger.kernel.org>; Thu, 27 Aug 2026 13:05:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787861128; cv=none;
        d=google.com; s=arc-20260327;
        b=YIDZOJOm0A7VbprglUofU1sNZoNAaQaqrwBdX7VoR17pK1u0benHQ43zicWF/g0VeI
         WFveEdIo2Met6So3YQeQatHN4HInp1tCymH/zvpcFk71c/jvCgdLFMkg+YFLRxejK41o
         2shewstTlHyfy3MQs9m1L8TAGBcw7vewMGiks6HONUFt3aHC22DmpGXR6orec90QXW9a
         FyqwuXcJ3oRqO5eQFHySBjc1LSq4oX2sG27YQgIf+SEAMRSUlnT1IRU6oiO539EYjFdc
         nF3PToJm7l7TNDkkZbPPew+zkPc21wlb1/Q7qehvw2pHg7nDb9nThWmuCwWfin3Yh71c
         Ha8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BIsnd6xgeWrgcQT3jCCMdd8DVWxNR+Gr3QkvZG2o5wQ=;
        fh=McyQUwpAgc4tzHla4AUOfK8kBGKxaxQhecCWreo341Y=;
        b=pJzMY/s9zAQgh0aDA4soaGZ9tTSjKIWH8iN4g2ng0Qfxu7pMYFOnM9j2aMAV0bO6vk
         tCqhRKgfo7swAa/ntqPEwq7kswuriP+UqwNFeoWBKjxlABbNMw7cnKm2AJWV3+u4m9WT
         i1Zvoy0KqiYQJ+oRQaRbf+Lvc7GCB7ZBJMlrs8qXtHVvlP6Sst6guj7lqkkrSpclP2WN
         p17LR9T9D4j7VLsbfpN6gS0/a1J64xI4c+5wz4p6aiS1QOEZ5QPDJH74bYu2YY/VMQN1
         66YhorAgKpESBCj6SAcQcFx2LmAL/VXD6V6lw7svbTifozOyiUS9cl+jiveckoc103Hs
         3rBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787861128; x=1788465928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BIsnd6xgeWrgcQT3jCCMdd8DVWxNR+Gr3QkvZG2o5wQ=;
        b=jBTcaEmdwdW1DRedprV3w9bCe6/SEJs/DHjsy+D+PHot4C/PbHh5tD3BM6AzYCRCi6
         pWnhe7FihJi7qfBJNS+BVYisD9dMsX12faXTjzTw/9IRGDEtAaH35EU+ihqp2Uu33ynq
         uhZIwC3LG35wBKRoLsXUPWgEl4QAOtGU46rOl9i566IVSK9phMB5SNzdSqaXtnnPIoqQ
         H9sy42ymjOdy+f63Je0waSafi6q1BeCdb6uW23+Y+Sv6XzOv32pHLYs+qlaK6knAMBza
         CkfyYJEVtbS/VyPG1h9ao2I1/CL4JxF13UInCu9/qA+jqeRjk3uNvG3ELapCPsDwbqta
         iJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787861128; x=1788465928;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIsnd6xgeWrgcQT3jCCMdd8DVWxNR+Gr3QkvZG2o5wQ=;
        b=ALIjlkDHk6lxQ5laU+XAzc/+ojTmX+L1NOZXusDMJMjN8hkgXtSapY0pUpmfq0CYgh
         E+IhhHTUg8wx7t4XM+GEom9zbaYUyJAOwp0EmKYEbxjMSEkwNUOtxI4jsnwxS8vKSDjZ
         HlZvrNW2IXJszEZalBgs0L7B5jTEFU1WBjTrKlsKztCf0dac43fmGR+m9OyTs3EniZ5o
         1L71kaUcImPYAbQJ/WRHtoC162pcrmaahJKpY0DzGI4/3jlQMEkWTZFvixh4MZBw/c20
         cOYPj8tXCFhJ4/c9kFcb+sP62a/7CaDbxjsTozL2pu1412MIpGxLRjuzVdi1jztq3fVN
         pkbw==
X-Forwarded-Encrypted: i=1; AHgh+RrwlKACbEfpM2NYNWhEbBsvc3eA7QEgmlRpxWunCAdyQsBl3m2+LiuKfJ8JFc5MwPM7RVz4OVLDJg==@vger.kernel.org
X-Gm-Message-State: AFuF++mMRHY8uX/vO27tqs/UGFydc7bIs+pvOw6yfwEgGniL4Dk03qce
	dCkZS5EGSwrlBQnWmuO3KQk0jUccjwqhc5i2DkA34aXMRtLX9o3jbX5CMYjjD320Mza2z094bwH
	xNSSOdYB9Br4nisM1zvE5v7YqwOlgbOE=
X-Gm-Gg: AR+sD12+7ntvTkrS19tgDqrLjEygRAikzjO2ppeweoqEn2oYiwFFvCneDc1zLh/qFs5
	OSxjt7QGPtfumJXk8uVgAcFkhdVwVFzkCrFvjuxjMdLmZPsMWD54YSQEPYLTUrbro1+aJFbh0AU
	N9OghtEo+1A/ZsdKjeratN7Qr90F3QrXIDWjaBpI8TseEaBthuZjlIAp+uh1CUwPi4+hMWdk6mG
	K5BfvcG7BEJhgCcsqrtiaRdIfxhW1oUw7bGXbAliP5qU2rg88nJinFsEXtnTWTI+unTjAMP+h26
	6CisYKGX+cplr6CGAD+T6PaB0yHsbS9TbNbzHtXyFkjcoNHhv6+UqqNnousnW/iYiuVkw5FD6Xi
	UjuyNkPEd+i4HE2NMYsFHapb04Tc=
X-Received: by 2002:a05:600c:c4aa:b0:499:d513:e507 with SMTP id
 5b1f17b1804b1-49b91c17d72mr16962265e9.2.1787861127504; Thu, 27 Aug 2026
 13:05:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827185722.3234622-1-csander@purestorage.com> <20260827185722.3234622-2-csander@purestorage.com>
In-Reply-To: <20260827185722.3234622-2-csander@purestorage.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 27 Aug 2026 13:05:15 -0700
X-Gm-Features: AcwNN1UExlY2vL2SpJh0tNQapsYMiZcr3z5sWaZZFYGrbWrJd63x35h50FR6wzE
Message-ID: <CAJnrk1YfTg-Lz+TmM+c=Asc8N4QGuY9_g8zUXtaNr4O7hG1Djw@mail.gmail.com>
Subject: Re: [PATCH 1/2] io_uring/cmd: split io_uring_cmd_set_res() from io_uring_cmd_done()
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Jens Axboe <axboe@kernel.dk>, Ming Lei <tom.leiming@gmail.com>, 
	Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, 
	Bernd Schubert <bernd@bsbernd.com>, Miklos Szeredi <miklos@szeredi.hu>, linux-block@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, fuse-devel@lists.linux.dev, 
	io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Caleb,

On Thu, Aug 27, 2026 at 11:57=E2=80=AFAM Caleb Sander Mateos
<csander@purestorage.com> wrote:
>
> In preparation for setting the io_uring NVMe passthru CQE results from
> the blk-mq request completion rather than the task work callback, split
> out functions io_uring_cmd_set_res{,32}() from io_uring_cmd_done{,32}().
> This allows io_uring_cmd_done{,32}() and __io_uring_cmd_done() to be
> consolidated into a single CQE-size-agnostic function with 3 fewer
> arguments than __io_uring_cmd_done().
>

The conversion looks logically correct to me but the interface feels a
bit annoying / fragile on the caller side.

Is there a way nvme can get what it needs without changing the other
callers? Would it work to just keep the existing
io_uring_cmd_done{,32}() as is and add a separate API for special
callers like nvme, eg:

  void io_uring_cmd_set_res32(struct io_uring_cmd *cmd, s32 ret, u64 res2);
  void __io_uring_cmd_done(struct io_uring_cmd *cmd, unsigned issue_flags);

where io_uring_cmd_done{,32} would then just be inline wrappers over
those? afaict, then only the nvme callsite would have to change and
fuse, btrfs, block, ublk, and scsi_bsg could just stay as is. Do you
think something like that makes sense to do?

Thanks,
Joanne
