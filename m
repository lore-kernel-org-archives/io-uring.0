Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF16248F72
	for <io-uring@vger.kernel.org>; Tue, 29 Sep 2026 01:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790644556; cv=pass; b=F2EAPIhL9LMejCMuDoYjeKMf0RQLdPHdLQg1R0M/cMFJwbqW5wXEBtFgIQiKkqv01sPhEk3PbaOcFYjZ3Yz7iFdvxod+PwDmOLOsTO5wemvDvKJgIwdCnd5ZtvBinVggXVdsPDxZ44YKjRnmG4mgHF1Yvc6MnO8ekgysBLYX4Mo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790644556; c=relaxed/simple;
	bh=6KsV4rDAdDxcusMqf5nBXP8iJDyqcK6OlXAetdFDhjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r+PCk3g9DyN6woiZpGG2RSWSLIQPFYbAj0u2Dsuz23wZ4Mtg6rJZU+GTSndVLIfnW2Eyrx/++OHZxj7Mlhqd7mQB+TndQegN/J8bsxkmYXUYpqvaiVLPc8/J2IVhcUMM5q0vlFl4B4uIzJTX5MjeTj8EOyF/fBjkGjcrCP2apQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=WLLPde6Q; arc=pass smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="WLLPde6Q"
Received: by mail-oo2-f41.google.com with SMTP id 46e09a7af769-7f4bdf2e95fso645811a34.0
        for <io-uring@vger.kernel.org>; Mon, 28 Sep 2026 18:15:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790644552; cv=none;
        d=google.com; s=arc-20260327;
        b=CqPKXQUYrxJpXnQB3NWGZdcw19sqqxH/B9KgPzcN9RUM9odH+E18v9HsEElgE3owih
         R9rsEoolIv3jayi0MGDz8JxPCBjWhAeOGR2+0sgAGrH+GfzNbpVu/+/ajR+ocaFnR2yk
         s99mSxJvnCg251L1Haqcl5bXfa3S1lH8Bzpp05j8xP+amvf72MxGgva07xRoduoxOXk3
         cT6lK88amQdHP5wHtwLUMjLbBKTclIpSqyxpefrjXVQEKqIMu2EMFaIDC7UvRITWQnjK
         HrW5r7OUyiizf6MMH7/q0FXEIrvy8BzQglsawUo7hfY+4Ix6obfUpll9r67wursHUrCo
         IPkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5pLeu4YqgZECtiedNQxbKwtzen0HMS5vwbUNTX6n4u0=;
        fh=hJROiCKSsobYXvBWdsx9vCl8rg+UD/eNGzQ3u1bvhKE=;
        b=ZJh4BqpyNYzQ4W6vxoEdK8jAk03maSYpDvLcOPDfHSKdciIxsER9IMmH7hFqPOQC3U
         1A5KZq+77uEv0t0j+f5sS21OMloN/uNvLFxNE+Hpy1x9CGTSymtOs5gTLch93rOm5p+h
         eqCTbt+62Rd1RVdv6uWOTxuKgDoNa0M1+bOwBD0w3wNr1fRKzTgZAutM1jELzNv/uLf0
         Vxk2iDUiyHjzOiIksbLzH/3ZCVEOKIXhUa7mgjkM3QfN612Exz0Ga7pwtiBJYvVKHyeR
         zUb+QYhlSGPWuY7KFxukPSVEFyrc9DkXnzRGGRNyJ8/kzbztVg8HaLg//kIRjmnMphvS
         KIQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1790644552; x=1791249352; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5pLeu4YqgZECtiedNQxbKwtzen0HMS5vwbUNTX6n4u0=;
        b=WLLPde6QqrGEQ7TlZnh6GBtwyEECzYPwNnwovqyCfe1nP6Rtl6cWfxOeP3v27T7+P3
         JO0RswXenQ3JCaWZLyrCZkHn/AqJHIeWnIVkVqqK7Bh4ONqjh6AJ3ZMIxqKxOF8tTBYs
         DGVx/ZdRRA3ng/3HZmmZD/Ugj2AGjzLyF8HdvvxasSWEujXdLZ4nUmvCXCRYa3RE0yRC
         URNtGEhe5UkwBmRgEecwiBRJ1kmnjqbw95t4pkc/S9muhj+DYZzBdnsaKKtNyIfLwjLH
         1D/kEnjt7dUyOT5ifyQp6U/0PPYcmijYeqVcAiqlt9Id3+2ViYXJFnlMm7rxBisMolUG
         LaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790644552; x=1791249352;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5pLeu4YqgZECtiedNQxbKwtzen0HMS5vwbUNTX6n4u0=;
        b=IyREQh1+bAF+3ZeevHLxTdBI6JRNtkXpWFPOL6/zpiU5KHg41ms1KEyu3ioZkweUvi
         +nepGAp1u4oxW5GHLcPA/zIFm79y3vBokx7/6S6rCAm3C/3kJfNweuRDeSpwHo3tjG8s
         +DvGwloBkTzuEra5eME3DT2oIRvztLHH7eokuSXmPcWSh1SzH4L7xHSzPS/BqotAiDYR
         Uv2NOb0EU9y9xN7yJGkqova54qST3IUwnJmyi2oavTQ16OirDjn93wxH7mgw6pRY5u/R
         KfPiN8kGPG7sG/s2VWdxYIRBTkx9dCZEUy7FFcSLyhwLstqzYBPqSlsbhzINQN8bPCMv
         O9jg==
X-Gm-Message-State: AFq9FYLJlLvoYYHK3w3kA6bq9Hb8rb2zKHgDTNbB2k+3RY3DUxhxHyiA
	Y4Bww9hJH46TN8gh6AQxFPxVCJYXlcLuxiil6WszKQFdUe1BsQqep5o/Tz/BUcoHEF4BCb1HA7N
	Ssc2xCcVDElI2R8mKqAX3igoFJ3wYZHCwFBT/ETTITfuen+6a23nliZo=
X-Gm-Gg: AYBFou2TT4rLMjhxmvPb8bb1lCe3eQe6UlZn958XrJaHVxLEb8q3DlMJaojLIHZAB7R
	cqFSp8BZCdURFV7s9uz4ep0G/OnXT0fPob72o1Ol4/WVOpLu7yYsm48rC8UnzAzJwHofG+n3ko4
	gsQR5a3tT5GmpBme3bY9ZzVGAI0LEWKRWe3+0bbhr6paf5KFWL7EFkTy4pMyy9HJQKN45zAynuN
	GpxvupzhiRFIpzy0O+pICeFmhrHHqR8qUIXmD6C6kXq+ItHf72rRrTMcy5oqfn3greh6f25fAeQ
	mg4jDuPRx+4i0HkmDYuWWWPeeXZ+FYc46rDgnLr0vpxVl6E0IVsC/Y8=
X-Received: by 2002:a05:6870:f114:b0:47d:4630:5998 with SMTP id
 586e51a60fabf-4930a82b841mr16313646fac.4.1790644552340; Mon, 28 Sep 2026
 18:15:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909222836.2475352-1-csander@purestorage.com>
In-Reply-To: <20260909222836.2475352-1-csander@purestorage.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Mon, 28 Sep 2026 18:15:41 -0700
X-Gm-Features: AclHuK9y1BkUmfj2CwBKzqVvJvr4htN1Ij_BtBFRlnLw9fnPEz3avSjdBXHF6AQ
Message-ID: <CADUfDZorm3WsYxvKQkqr1DVAps=ejF7M4U5PLD4O-94GzmYt1g@mail.gmail.com>
Subject: Re: [PATCH 0/6] io_uring/nvme: support fixed buffer for metadata
To: Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>
Cc: io-uring@vger.kernel.org, linux-nvme@lists.infradead.org, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, any feedback on this series?

On a 4 KB io_uring NVMe passthru read workload with metadata, we
measure 14% of the CPU time spent under iov_iter_extract_pages()
(called from bio_integrity_map_user()) and bio_integrity_unmap_user().
Using io_uring registered buffers for the metadata avoids this
significant overhead.

Thanks,
Caleb

On Wed, Sep 9, 2026 at 3:29=E2=80=AFPM Caleb Sander Mateos
<csander@purestorage.com> wrote:
>
> io_uring NVMe passthrough supports using a "fixed" (registered) buffer
> for data, but not metadata. On high-IOPS workloads, the pinning and
> unpinning overhead for the metadata pages is significant and could be
> avoided if fixed metadata buffers were supported.
>
> This patch series adds the necessary plumbing to allow NVMe passthrough
> commands to use fixed buffers for their metadata. The metadata and data
> fixed buffer indices can be specified (or omitted) independently.
> Supporting separate fixed buffers is important as metadata buffers are
> often stored in separate memory from the corresponding data buffers. For
> ublk zero-copy I/Os, sharing a buffer index would be impossible as the
> data buffer is a kernel registered buffer while the metadata buffer is a
> userspace registered buffer.
>
> My main question is which layer the metadata fixed buffer should belong
> to: core io_uring, io_uring_cmd, or NVMe passthrough? In this initial
> implementation, the io_uring_cmd layer stores the metadata buffer node
> and the NVMe passthrough layer defines the UAPI.
>
> The main argument for moving the implementation to a more generic layer
> would be to reuse it for other io_uring request types. For example,
> IORING_RW_ATTR_FLAG_PI could also benefit from a fixed metadata buffer
> option, though this series doesn't implement it yet.
>
> On the other hand, core io_uring_sqe and io_kiocb space is very limited,
> so it may be undesirable to dedicate it for a somewhat niche use case.
> The metadata buffer node storage could be pushed to the NVMe passthrough
> layer after my in-flight series [1] to reclaim nvme_uring_cmd_pdu space.
> However, managing request-scoped resources from a ->uring_cmd()
> implementation is a pain, as the same request can call ->uring_cmd()
> multiple times and may or may not complete when ->uring_cmd() returns,
> depending on the ->uring_cmd() return value. io_req_uring_cleanup(), in
> contrast, provides a single cleanup path for all uring_cmds.
>
> [1]: https://lore.kernel.org/io-uring/20260909155848.2069290-1-csander@pu=
restorage.com/T/
>
> Caleb Sander Mateos (6):
>   bio-integrity: remove dead bio_integrity_copy_user() error path
>   nvme/ioctl: remove struct nvme_uring_data
>   blk-integrity: pass iov_iter to blk_rq_integrity_map_user()
>   nvme/ioctl: pass iov_iter to nvme_map_user_request()
>   io_uring/cmd: support fixed buffer for metadata
>   nvme/ioctl: support fixed buffer for metadata
>
>  block/bio-integrity.c           | 51 ++++++++++--------
>  block/blk-integrity.c           |  7 +--
>  drivers/nvme/host/ioctl.c       | 91 +++++++++++++++++++--------------
>  include/linux/bio-integrity.h   |  1 +
>  include/linux/blk-integrity.h   |  6 +--
>  include/linux/io_uring/cmd.h    | 12 ++++-
>  include/uapi/linux/nvme_ioctl.h |  5 +-
>  io_uring/rsrc.c                 | 28 ++++------
>  io_uring/rsrc.h                 | 17 ++++++
>  io_uring/uring_cmd.c            | 30 ++++++++++-
>  10 files changed, 160 insertions(+), 88 deletions(-)
>
> --
> 2.55.0
>
