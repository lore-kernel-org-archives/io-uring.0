Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9391E5B68
	for <io-uring@vger.kernel.org>; Wed, 15 Jul 2026 15:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784128206; cv=pass; b=lFLf8/IZNHEecQQpiYvURhSNt0GwqRSvyBoW25Sz7HNSvr3hwL2q8vN0ZYmVUzg88ZV5iYGeEzqqZV+yjyRcQEzjtUi8fyHyqI2i/Hg+jOssjkvC1MdO3sfMGn6R2XaG74zPNGBCg26JGr4/W20iW7r8T+TPdIz6iKDhbmp35Gg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784128206; c=relaxed/simple;
	bh=AApLk3T1QRvp5S77GeKl2WzQsaHZbKUJIqjVeqxnPpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PsiRp/yX5CBMSdobJle53L0lJ+yrbbp69m2A7wu69sRmPdlxaCWnsliaIS16lk8qTdZyjcuEj1mFinoMVArATB0JhrlWbweVZlucYTF1UBiK29hdWAopQ9+G4oF/cCKLJaJsWeWboyNJTkhY10vMW2Uto2xeG/vvjNzVj3FtAJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=bTqDYvE6; arc=pass smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="bTqDYvE6"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4a475bd9ff7so394931b6e.3
        for <io-uring@vger.kernel.org>; Wed, 15 Jul 2026 08:10:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784128203; cv=none;
        d=google.com; s=arc-20260327;
        b=UJMbi/sgGl7OmBZHgUKZZyKeOUImi9HNFwoLrN2sjUfrbLKT2yhEUDdYNNMAI0Byvb
         BC4CixEpe4IGcsMM6Z9+TNbYOw4cOAPblZV6a7aogLoXDdUPZT5MDjSRpflxmtNZDDTs
         3ZmnZP4F43L30RbsQX2r+tkT0ZDj5Hyz5dEsONrZ87Pc9oj2xt5YgJZcbZFSbU+KftrW
         D8UbBB1RCi9LLOz7iP3jQDJyEyjB+NEiN9d12ONRHYq7g8t/gLk4rkyab5Ia7ZOERJKO
         rHCQaf5t23Jn0O9Kd2wliusKOvD3bEa58S6W/+mGHU9PIIaJDYb4mXNNpflZvECTwZy1
         VcBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TZ2ulk5BnGMrljY0mY/eB0CZBAruuucgqs2xAPoZmMQ=;
        fh=8hHMXvtfZae1/tJGN232jA8/WTI28Ua+Gm/kfREn0Tw=;
        b=I16uc9XyXa70F8jr+eZX+4vWFLR3OSJtXhrs5g5KptJqc6pmsXG/V1SkyQ3KCsf8sF
         cuuOI6isdxM+bjBwkxPOekpZgJqjiAPMTJ0rzjFnOP6HUw5BL2C8HuTID13GomsSuLnv
         44bbcKMuU/bjeSxfV1FPdY/DOs3hqbA52QFUfkzjGGEugxy6Pc+ZpdCHvbOMdgJckn3c
         cUhh0AAS0peNp4d44pE7bi/tRSmrqIxO0H/akz8NI3wiw3rZcK8kx92StwKOqB+wLUBZ
         T4us6sTAKBDFlPX6JNxTUeVmx6xsdIZPlzN2gceIAgmB68MfoIlk0uY1Y9XbStlmPeyh
         5qCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1784128203; x=1784733003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TZ2ulk5BnGMrljY0mY/eB0CZBAruuucgqs2xAPoZmMQ=;
        b=bTqDYvE65ONNfNXwCODYIxctdNorJkA+G/N6Kvk23MnWIKOkFWxRzXcrRWkyl09Egd
         9mH/loyIaOqSL+kgVmxZjYltxjhlNjpo8G9cM3r6Z4UlQ6m5rtMmiL1CnTk9wh+wrA8r
         VQjczyLx2V6BwaSMdERW68pIfg0vr1XybUeot2kSoDgwseMVqRFMinqgIvCvsCV3+kRE
         AclVGSeHkgafeOI956qHpvhikqyjF8IN2rfica5QSNvjJ11/ACMDw1z/qs756ChyDVcU
         J5ueU/wk6aUAgCTdeKTq/N/DJGd3XPEvI0KwsyLwWwp1HiqBi+Q0X/X8kLoMV3fN11aF
         QdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784128203; x=1784733003;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TZ2ulk5BnGMrljY0mY/eB0CZBAruuucgqs2xAPoZmMQ=;
        b=BL/7Bx+q45rABNP/ZlYeDSDWzwKRzw/9YjWcaXEaDPaWm+TNaXDW7C9BEaIATm9m5P
         B6rr/BOV64jF2IhblaKdR3J7DHzNwnHqDdggjACQ0Z5VOEczBqoo08AouwaaV3sLxQLD
         kr4x/kIjbts39HHb5mNVW3EL+kMHBIXJztBtG0gok46PgrSbUkIjZuAYD1bsC6fZSQIJ
         NRpPjhcbgt3HiM/ed6an1+jiEU9zZj3NQKqbsKN2HItAHdMfxL///7K7E3Yc6rkDUZA7
         +QvXGqWBy90cuyLFxrZ/AV5Bk54El+clSpElstZ9WwPreF0+2N6LPsPqSzJMFBLIX9wb
         jgLg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2PdC+XYh5iJ11fGFjKWrOWcHaMuHY7mP4HKvlWCjNH4pXJhMUapC5slX95ehakizClog0YH1qJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOgD9Bp/6TQOydc16dTp1SBvRg0GGP1UndNMUdJi+YcIfZLDTG
	zgiZBYKpkq6zfs2jG9xqqQ3uMrrmKa3U6KSTfYvqnFgHTH8OtvjbLrEiCAacdEi7h5U0tconGw1
	w3pAGmVS7TsWvJQOIuMv8AavGKVT4qiGQhrTPUZ22Mw==
X-Gm-Gg: AfdE7cnLThbOoBdV4Ro99NmCGRfXu+HKu4VlKts7fzcqO73bStOe8kN8p2755Bc1KkE
	Z61TmW9tSDLNEJ762wDJoE3bxnrIMaI2QxrrxlGIyPzvkBTLk+v8fXRlzmmNi2R7TdZaWFjQjWU
	DYQG8MnDb+6iVQtvkqKDoljj1SuzHDRADcTMkfLUXcuH3nnIi7AK7ttbOb5MJFqva9scvmylud7
	lphX7nn7/01l6Ycrqsd8vRB8GW5FxGW1uflW3q6I/TNBbsQSFWgKRmK7KWfhoh79eXNDTh8
X-Received: by 2002:a05:6808:124d:b0:496:10b0:2114 with SMTP id
 5614622812f47-4a42afbeaeamr7021310b6e.8.1784128202504; Wed, 15 Jul 2026
 08:10:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715063947.2933606-1-hch@lst.de> <20260715063947.2933606-4-hch@lst.de>
In-Reply-To: <20260715063947.2933606-4-hch@lst.de>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Wed, 15 Jul 2026 08:09:51 -0700
X-Gm-Features: AUfX_mwZ-Z4CloFMnkcy93kyDgelTJkxVFEgol3cOlJWGEzrrX2-3U4fTm1w01Q
Message-ID: <CADUfDZpOmBJvr=C_DmRzn6rWTincKZVCsjF9CorWG3MHYQok3w@mail.gmail.com>
Subject: Re: [PATCH 3/5] liburiung: add io_uring_prep_cmd_zone_reset
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Damien Le Moal <dlemoal@kernel.org>, io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In commit message, "liburiung" -> "liburing"?

On Tue, Jul 14, 2026 at 11:44=E2=80=AFPM Christoph Hellwig <hch@lst.de> wro=
te:
>
> Add a helper for io_uring zone_reset_all commands.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  configure              | 31 +++++++++++++++++++++++++++++++
>  src/include/liburing.h |  7 +++++++
>  src/liburing-ffi.map   |  5 +++++
>  3 files changed, 43 insertions(+)
>
> diff --git a/configure b/configure
> index b953eddd6ddc..8c5ca801f487 100755
> --- a/configure
> +++ b/configure
> @@ -469,6 +469,21 @@ if compile_prog "" "" "discard command"; then
>  fi
>  print_config "discard command support" "$discard_cmd"
>
> +##########################################
> +# Check block zone_reset_all cmd support
> +zone_reset_all_cmd=3D"no"
> +cat > $TMPC << EOF
> +#include <linux/blkdev.h>
> +int main(void)
> +{
> +  return BLOCK_URING_CMD_ZONE_RESET_ALL;
> +}
> +EOF
> +if compile_prog "" "" "zone_reset_all command"; then
> +  zone_reset_all_cmd=3D"yes"
> +fi
> +print_config "zone_reset_all command support" "$zone_reset_all_cmd"
> +
>  ##########################################
>  # Check idtype_t support
>  has_idtype_t=3D"no"
> @@ -797,6 +812,22 @@ else cat >> $compat_h << EOF
>  EOF
>  fi
>
> +if test "$zone_reset_all_cmd" !=3D "yes"; then
> +cat >> $compat_h << EOF
> +
> +#include <linux/ioctl.h>
> +
> +#ifndef BLOCK_URING_CMD_ZONE_RESET_ALL
> +#define BLOCK_URING_CMD_ZONE_RESET_ALL                 _IO(0x12, 1)
> +#endif
> +
> +EOF
> +else cat >> $compat_h << EOF
> +#include <linux/blkdev.h>
> +
> +EOF
> +fi
> +
>  cat >> $compat_h << EOF
>  #endif
>  EOF
> diff --git a/src/include/liburing.h b/src/include/liburing.h
> index 0188937b0de4..214c7778d6a7 100644
> --- a/src/include/liburing.h
> +++ b/src/include/liburing.h
> @@ -1685,6 +1685,13 @@ IOURINGINLINE void io_uring_prep_cmd_discard(struc=
t io_uring_sqe *sqe,
>         sqe->addr3 =3D nbytes;
>  }
>
> +IOURINGINLINE void io_uring_prep_cmd_zone_reset_all(struct io_uring_sqe =
*sqe,
> +                                                   int fd)
> +       LIBURING_NOEXCEPT
> +{
> +       io_uring_prep_uring_cmd(sqe, BLOCK_URING_CMD_ZONE_RESET_ALL, fd);
> +}
> +
>  IOURINGINLINE void io_uring_prep_pipe(struct io_uring_sqe *sqe, int *fds=
,
>                                       int pipe_flags)
>  {
> diff --git a/src/liburing-ffi.map b/src/liburing-ffi.map
> index bd7bc64416d3..fc9701b63907 100644
> --- a/src/liburing-ffi.map
> +++ b/src/liburing-ffi.map
> @@ -275,3 +275,8 @@ LIBURING_2.15 {
>                 io_uring_register_zcrx_ctrl;
>                 io_uring_register_query;
>  } LIBURING_2.14;
> +
> +LIBURING_2.16 {
> +       global:
> +               io_uring_prep_cmd_zone_reset_all;
> +} LIBURING_2.14;

Does this 2.14 not need to be incremented to 2.15?

Best,
Caleb
