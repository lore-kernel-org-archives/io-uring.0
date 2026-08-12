Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC783321A7
	for <io-uring@vger.kernel.org>; Wed, 12 Aug 2026 15:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786549412; cv=pass; b=X2Q37d40bx67VQi0lQ8dgLKZDIIb4qA1+2IYe/Da2LjlJfIZgYgtYSSYTe3QT2mannsIbFKsa8odw+SchgIpsK4x2Eqjlq50xujdDjZZfwPGyHdAAciuEcim84q2PctnFV0Bu4PTUZQKNrYqQLN0hZz7kSMQwlhkMBDggBoYWEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786549412; c=relaxed/simple;
	bh=ScHDScDNMlJ5fTamuzPWs9wRccu7Wb8nIAYp3gFKnDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pgI22zZtCN4HgMcbH6D7AVk3gf/N+zRM4aA/EZFb9t28qtZr8iZXIpP/15YXP8bev+8wgvsK6cppO6uN1LC1Cxv8PA8rUatvelUQ+3WRyKDpA4x+NcoDpvGkxZnkNRNbE79korS83xd40eMkPSIhOBPbLCRjTvlmdvzfkofQZvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=broXVNHi; arc=pass smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="broXVNHi"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-455f99ad59fso99647fac.2
        for <io-uring@vger.kernel.org>; Wed, 12 Aug 2026 08:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786549409; cv=none;
        d=google.com; s=arc-20260327;
        b=bSEnd2RMl0SMZnsnyViHSPGz0EAnV+JvPGu3d/6a0KfcKJfrEKZasDXSDqfC1N0FtA
         IdsgtvrahZrRffp00vujVvGP3T60ngQycZ12zW5EUMGR2zPd2K/fdqRiSc7yRLTY0DqZ
         H8dCS9FqeKUpZJ61v+0JwqRvWlP687xNfJoRJFKOfNZnQFxyDFD513f6BcVuUvhtutAy
         RbMSsGQWMrmRv3ntXXs2EroafU1pt8aM+kFpGahnDwxLjNSySvpDve3LGpRXQxWGW7Zl
         6OilJyQkFvVAjjbXEtzruOMx5Lej3KN4pVjfbwRRdRpXdw2er2mjHZamTHT6UrGcWiwt
         O/kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sdsaaTXW9RzJN3MY3F/eQgCjMERzKMOmlE77UxLdPmA=;
        fh=S+Rje72JXtiA3fSsIfDagYq93uXy3m0gSMBW1gR/Jv0=;
        b=Xk6Or4gZOX5yx2sMOuc6P5o0fchX3oUf7SKCoUZOD69SmuFj+1XHo9Di7bzIlKild9
         e1hmShR7cYtxvKbJamg3t0Zo3IvYQM+7CqOvTqOLIFuYkyzrVA0Wu/XTlTnnUHrZ8uTy
         XC1ix7ouX+wOSouyxsewcKFV8G7sejrcNdGDUC3RHMbJ9H7bLtrlmxGa0RobJcPQvq+4
         4gW2exul+IsIS7CmxUql6KE6ObQ2QOf0SxDl5zHqC+U3VkXRz83VHRu/n5VzkV3mWJFN
         0KnyAyTJqIvLkvRZb/Z+X+b8NXTt8nVBotWIc1IoNs/JOYk3yUGrpqBCtqYt0cJtKmXb
         mUwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1786549409; x=1787154209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sdsaaTXW9RzJN3MY3F/eQgCjMERzKMOmlE77UxLdPmA=;
        b=broXVNHifNzZHVxaXKR790F8gWscbc5s7/tP3LUyCtDMUEqsLCi8Pul+qhqIUHWjjK
         jlhC2jTzLxEIdzp6MjfYJQ2kmeQjJVnEUME5y5+NVXp4igontoaosElYiTZeSzmwQ4yr
         qhAFEINgeCcMGnY7WGAP0rgZCokkl05OqCT9O0F0gJT+z9iJrgS4Ck5POm1J1dYXfDgV
         zqRXTd0ZWHFSVtqCNhnrLJM12gsk9mr4yUFIaNSETiXKC8WGoxxkPaShdi9AEIhlSsrM
         I6wd3/h9h+EXxgklUR9U816a6MCgAuD5dLhjwU6fymQ5qBwGvLq8d4KmYpoRl6bQxDsH
         kRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786549409; x=1787154209;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sdsaaTXW9RzJN3MY3F/eQgCjMERzKMOmlE77UxLdPmA=;
        b=ocHz4tGXlHxOXBdsLDEwHHD/rlp2MWLqPPqV96v10KXsT1ZXDba/D9I1XJR23B3aDz
         ZY1ES/S824OIVxGk2s9fbobTYQga+zabqVOnQ0u1Oa0sUec/AR16Wx7v3zlTwD59AU07
         G/c/Bn5PIKEsp6WxzXlsldzYwmugjyuexjPp09fWfh6We7rKRCC1UQRTjtKrdGIYfEYJ
         YsW1m+KEGOwKneffJT+PkoSfxlDjpaOBcXgLe5aJ6W/nOdv34W3h4ohz0O8M5ezcN0v3
         nIIRt/IL1/NtAPiMGmeBCeFKSy/+0aydDdtCy84/0EMWU5Y9G7mxok9LFI8JLXEp1am/
         v5wg==
X-Forwarded-Encrypted: i=1; AHgh+Rpt4MJuePKbAmwPWnY3eBe/MbbFz+unyvg8WT7A2Wz00PfiUZb587cQQC/0OejFU7WjADBL7re3tQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUCeS82v5L+buXQPEzXl7PHNASOpJd+xMpsqXxgEzU75R+pDt8
	URcpx29+3H7AB712m2IhXxjdqhZyakC6wQtI0rM4qwFKGCh+XaiFESEqae2VXjIDcyeuWyAz4Z/
	iRGMqwSto7TFWXgZcHLjT27of2SyPQTTeIev7lU4Jfg==
X-Gm-Gg: AR+sD138cnHboYv9lFdWsy+JT9MUi1XjxRahxABbVS0IG7nsxNxIN/JjoIal/lUiPOx
	4qPJvL6mJLNKkiqX6Zk821uWD6gFwDQXTgWM1M1e6/t115PZTntU5rhAl1n98PlWWrBJ+HJp9AY
	s1iw60lrwv9GiDSuu2J39PZg9lCnVjqUw1qF6Zi54W5qEUBEkLJ50Yq9kGNbt3Y27z2jZ4RjYt4
	4GebZpUoqMzD+9W1yHi5rGHR4C2avlTEPuj7obtG4CdJ+7lVnK7pQ9eCus3JonYGnyAAZXCFCyH
	PlGsQOinMlIWPgFwMHvIEnm9ZmhFp2ibOjII1QC7s8UiAg==
X-Received: by 2002:a05:6870:334b:b0:43b:5127:7511 with SMTP id
 586e51a60fabf-45e3ecc7b35mr3001141fac.4.1786549409199; Wed, 12 Aug 2026
 08:43:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812131255.258582-1-hch@lst.de> <20260812131255.258582-4-hch@lst.de>
In-Reply-To: <20260812131255.258582-4-hch@lst.de>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Wed, 12 Aug 2026 08:43:16 -0700
X-Gm-Features: AUfX_mxpKDAu-AfHc-jWmhysyidWziOSX6tW06gUXwKBkGLLDguAFbcFWZIs9LE
Message-ID: <CADUfDZoGWymYvu43voXCFuO_1_bZwte=wFhKVUKfzmM9M7Dr3w@mail.gmail.com>
Subject: Re: [PATCH 3/5] liburing: add io_uring_prep_cmd_zone_reset
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Damien Le Moal <dlemoal@kernel.org>, io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 6:17=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> Add a helper for io_uring zone_reset_all commands.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
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

Mentioned this on v1 too, but I think this should inherit from LIBURING_2.1=
5.

Best,
Caleb
