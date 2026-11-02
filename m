Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793632470;
	b=J1+HUoLv2sVE+Gjfp1pEmL0l6zc7tCQ+5pLC4qtf9rQYyqfx1hKC9MfVLkqgN/cVIWA/
	 e4dUnnFbARphEEvnGya/IX7UTt+BLMCt3X/zb3TP6SfxpAlmQBJNbY8k9hsKI1LOON5aJ
	 SlTHZu28mV5LGqJc+XREq0ICJORNx2EofqI9/A4yV/lNcMirnDm71BnOIXdoBweSdbMkz
	 YhJYZX14XzYWpjzEubMd3UztWr06rmSylH7hZbustF/BPRrW1fImk+RzRtqO8ap+75DMq
	 9EZYvWXm3XCdNJ2rEb+4rjItG0uqTagryM1dwzCikKPM/u/Mb2MQnVroxt/rbkU86BA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aOdCxZO55hUw/6I077tI6EL/o28ur2wlUbUGRR4UyJU=;
	b=BfY6zKshPFpqw9k9I0wOjUatiqzu5eX2WXYmbBc1gT8H5CeFn4EdUu1mJ+A+p06p/RzA
	 UHuOsX2XV4UqFfjNlBr4tgly3CveKUndu57E3hYuWEeP/AHdQbBe5oN/gGKe3lh9JKdwm
	 wzt1AF6Jm+QgZLpqeBQ2DgyEczd5fK+HTpvvxb/rV7Adz+vcYoGcFaphdF1+wesrHIZXv
	 ylVx49+mnX5WWo+wi0flELB6sK+SG7MA5rr/U5qfhf+zj59uZPZBupdsMa0qpNI9U+xSd
	 hzrDDhYCNrdqPSnTWP9Xspthny/KGq9gxId25EhQtznxVUdcShgo99d4rINuE3OCuWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="UK/Ov2Zm";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7288460B1DBF
	for <io-uring@vger.kernel.org>; Mon,  2 Nov 2026 15:14:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7288460B1DBF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UK/Ov2Zm
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67a2bd0c297so2551742d50.2
        for <io-uring@vger.kernel.org>; Mon, 02 Nov 2026 07:14:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793632468; cv=none;
        d=google.com; s=arc-20260327;
        b=Nlw9k4h68k2G2tyC7TSvS+ufTj7Htbiz51IX276ckDcU0+fbOY4QYxnWMWp3YMOMeC
         8e3DHVL0mvv5vrFD8Cxmq0qBOlilKcEy8gwOS+pUSLdpDDz+XtGJhIGaXfhYvAwssOcf
         4t2+vrE1Lg/Q8KLR5hJA01tSqpQl9CbTLTFUqS303jrmGvjo84Wc/cubIKO6ENc5Nil+
         2rOifbTN/SgiqlbKQEO5GiOW4Jb7A3HBR+w/ChSurVUPv9vt5UMwmzps6Pz+u3bFaUdK
         sNLkovv42WYo3G5OqXov8f/vMi5DGkoSYPBGgN64SjDns1ibBc+kjHw3vRkc6hO2xk/J
         RO6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aOdCxZO55hUw/6I077tI6EL/o28ur2wlUbUGRR4UyJU=;
        fh=y8RB4dgXtRgcX6waPTAZwLywStPs1bT0y0COxitm5T4=;
        b=joy68qvUlTvG9wyN9Zqeq/h7RR+8qk1B1a6rNmfItxTR5pqm4ThGK/cR2RubuYPnlA
         bM5alRcn7ddCUDEpE9LGKG4BH+9KhzDBvQZIO0AyASVzXsFew0i2i7Lhmk4VzXQW10Gs
         jFOii1Yf46Rz/UfT+R88mkNtwaVw1OGeqrZb5R0GKEv6vTqsnegg62OVnS5PAgPMFZhe
         0UfpGYM/9hBxEDH68bVpDhmN55DhEFsaBDpRljgvfXeSllmP6tQy8HEOitYIy6aTZnvG
         iXsPRo+Jn9ImD1zX0Sgzyfhcf10x/iPj9ITAjN0L8Ca9STcsEE8t7v+QvdRA98iP7+KE
         0s8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793632468; x=1794237268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aOdCxZO55hUw/6I077tI6EL/o28ur2wlUbUGRR4UyJU=;
        b=UK/Ov2ZmZrdzn6wtpyN4IuP0s2NI94uQI7yYBJibP6aHf1CPcffmPVYaLkzYSc7pZm
         Q+awmbVw7SIAx9igzH2GxMbpkJkUZWNm5FYtB1KlYDTmR1d4BJDrwn+eZuXuDN3hfkKi
         wic6ZSVgM3Y1UqylgTszFO6RuIHOCzlfX7DyBHr6w+fBZfeaHkL3L5lbBc4iRYJCXspt
         9pzWytIy2fjqQ7RVqjA8Iyg0vs6YCR+ISjcat8IZewOZC+HDkTF+GC7SBwr94lTftIlb
         iXOhyfTyOpSiHWGkM8CQhvl9wo0AmvYC/zHu1qJMn7diEAHe+U1q3JmLq16spCqaJO9l
         ToNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632468; x=1794237268;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aOdCxZO55hUw/6I077tI6EL/o28ur2wlUbUGRR4UyJU=;
        b=RaunwZxyEyJLqzEVVKiLnHqbxkOl4SoeTKDmOnKXi1VVuUCdmYENXDSjLOSCLX6jDu
         Bu8ZbHgUJ54iIhksyvZu+grYfLaYUjxEw0Ss6y6b8QoP3rtLf2dumtmokl+gDkaptkXp
         WkuvfsjdPitlM1jYf5cwOTs2iyzvX+1n6z7pTNKgZNaaTh74lV0ce0F/orCUQd3clwl/
         49bYhu7rYlSyCyVYnASeNDg12M0zxE/q8Ab6myT50MvqBUo9WR3VBRKEuKbJJoHaPkK5
         c63GLZxNAOwVBL8vzrrRmLlSuERC9t0Zez7vLHrZqdkMez5lwnabfuJ9ryP5WJXGFBlM
         HOsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzf0307vfm0L+2pD4gNCpXXvaQMatlTDQiufeOimpvzMwCC+Ps4CFYqyPnq/oqRZArtyxiZTtKnqw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9UKHzyMi3RIG+SDT8G70nWQ1wB95SVcsj+3oVMXO597X34z6XI
	PhZOVj5OuViJY+Hi9TEbRm4qFBYhEGFHLYY09wSRYCC0kWQT+vjAijRpBs7PXFmLCRufyLC9s+6
	w+QzlmqLH1G25dP0Q/0655nogGsrNmM8=
X-Gm-Gg: AYBFou0H84oDZzyAAwTfOj0WDGnh1NwMT6/6y0nflwa9F2zYShOx01yZ1JVRDxb/yWs
	2YyDOwS6ft3gKOoI/yOXl0VhmipCYsmNtVaTFaHKf54KPBHLrVn2ibHR3GEUpRwpn+WCldBAtmv
	v7V5Sj8zLUJc7i3Z9bRacQlN6ORFi5edvyJIyibaDOZFF80o87wnoK/vtP9MQH9cqz0BQA2XJu7
	DKxDLtOOkA0sfJtzD56oAl7J6hANZSewMUlBjwk/5cV8gMADCS8+RWWhzIOSo/+BJLvlE2UqhDp
	5o/xaTNatCKr+4xVnIP2tZyR0E46kYhNjH2Z16oCrnKub8mJ03NgJQ6G0Dlx+tcHflCzbErUERw
	2DRuW/F/Dj4d3eW6f1yHMzpSWYUhT6JCFkS7/KpjK18QTkB2EcLFHa8QVBss4h8vLr6LxI8vbpt
	L2p4OznYcjw8RhP8ZTWoClPnukdsvU6J2JW8aGKwXm+Mgwb1YSk1EFZL1hvA==
X-Received: by 2002:a05:690e:1201:b0:679:28ad:d8d8 with SMTP id
 956f58d0204a3-67ba5118897mr8055833d50.104.1793632468374; Mon, 02 Nov 2026
 07:14:28 -0800 (PST)
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102130540.252894-1-omosnacek@gmail.com>
In-Reply-To: <20261102130540.252894-1-omosnacek@gmail.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Mon, 2 Nov 2026 10:14:17 -0500
X-Gm-Features: AclHuK_S3LwuvSZEIcs1e2WEC4WgX3S0M8bKoabDzHzf2mxELuht56K17Z9rPEg
Message-ID: <CAEjxPJ4hxdvV-r8chmF3RAi9RJX=-4AqntG01=fWUhh4-xP+ew@mail.gmail.com>
Subject: Re: [RFC PATCH] af_unix: introduce MSG_CMSG_SEALED
To: =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>
Cc: Eric Dumazet <edumazet@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Simon Horman <horms@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	netdev@vger.kernel.org, selinux@vger.kernel.org, 
	linux-security-module@vger.kernel.org, io-uring@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 8:05=E2=80=AFAM Ondrej Mosn=C3=A1=C4=8Dek <omosnacek=
@gmail.com> wrote:
>
> Currently, when a process receives a file through AF_UNIX's SCM_RIGHTS
> mechanism, the security_file_receive() LSM hook is calledto allow LSMs
> like SELinux to validate the receiver's access to the received file
> (similarly to a process inheriting file descriptors through execve(2)).
>
> However, there are cases (such as dbus daemon/dbus-broker) where the
> receiver doesn't intend to access the received file and merely wants to
> forward it to a third process. In this case the forwarding process would
> need to have the appropriate r/w access to the file in order to receive
> it, even though it will never actually acess it. That leads to the
> security policy having to grant the forwarder access to a potentially
> wide range of files (in case of dbus-broker basically all files), which
> is not ideal.
>
> This patch adds a new CMSG flag MSG_CMSG_SEALED that, when passed to
> recvmsg(2), wraps any received files into an opaque anonymous inode with
> the name "[envelope]", skipping the security_file_receive() LSM check.
> The returned "[envelope]" file descriptor can't be used in any
> meaningful way other than being passed forward via sendmsg(2) with the
> MSG_CMSG_SEALED flag. In that case the original file is unwrapped and
> sent via SCM_RIGHTS to the receiver. The receiver can then either
> receive the file as normal (subject to the LSM check) or again "sealed"
> in the "[envelope]" anon inode for further forwarding.
>
> Note that sending the "[envelope]" file is only allowed with the
> MSG_CMSG_SEALED flag set, to make the unsealing explicit and avoid
> unexpected behavior. Attempting to send it without this flag will fail
> with an error. This also avoids recursive nesting of "[envelope]" files,
> which would only make this feature harder to audit for possible issues.
>
> This patch also adds a simple read-only sockopt for UNIX sockets that
> allows userspace to determine if this feature is present (passing
> unknown CMSG flags unfortunately doesn't lead to an error currently).
> The minimal code to do so can look like this:
>
>     #ifndef SO_RIGHTS_SEALED_SUPPORTED
>     #define SO_RIGHTS_SEALED_SUPPORTED 88
>     #endif
>
>     #include <sys/socket.h>
>     #include <unistd.h>
>     #include <stdbool.h>
>
>     bool MSG_CMSG_SEALED_supported(void)
>     {
>         int sock, ret;
>         socklen_t optlen =3D 0;
>
>         sock =3D socket(AF_UNIX, SOCK_STREAM, 0);
>         if (sock < 0) {
>             /* handle error */
>             /* ... */
>         }
>
>         ret =3D getsockopt(sock, SOL_SOCKET, SO_RIGHTS_SEALED_SUPPORTED,
>                          NULL, &optlen);
>         close(sock);
>
>         return ret =3D=3D 0;
>     }
>
> Related: https://github.com/fedora-selinux/selinux-policy/issues/3286
> Related: https://github.com/fedora-selinux/selinux-policy/issues/3287
> Signed-off-by: Ondrej Mosn=C3=A1=C4=8Dek <omosnacek@gmail.com>
> ---

> diff --git a/net/core/scm.c b/net/core/scm.c
> index ae38f3c1165c..08822b2a1f22 100644
> --- a/net/core/scm.c
> +++ b/net/core/scm.c
> @@ -114,10 +127,29 @@ static int scm_fp_copy(struct cmsghdr *cmsg, struct=
 scm_fp_list **fplp)
>
>                 if (fd < 0 || !(file =3D fget_raw(fd)))
>                         return -EBADF;
> -               /* don't allow io_uring files */
> -               if (io_is_uring_fops(file)) {
> -                       fput(file);
> -                       return -EINVAL;
> +
> +               if (sealed) {
> +                       /* Only allow sealed files */
> +                       if (file->f_op !=3D &envelope_ops)
> +                               return -EINVAL;

This leaks a file reference.

> +
> +                       file =3D (struct file *)file->private_data;

This fails to take a reference to the underlying file but will later get fp=
ut().

> +
> +                       /*
> +                        * No need to check for io_uring files here as th=
e
> +                        * underlying file had already successfully passe=
d the
> +                        * check when it was first sent.
> +                        */
> +               } else {
> +                       /* Don't allow sealed files */
> +                       if (file->f_op =3D=3D &envelope_ops)
> +                               return -EINVAL;

This also leaks a file reference.

> @@ -365,18 +398,37 @@ static int scm_max_fds(struct msghdr *msg)
>  }
>
>  int scm_recv_one_fd(struct file *f, int __user *ufd, unsigned int flags,
> -                   bool notrunc)
> +                   bool notrunc, bool sealed)
>  {
> +       struct file *f_received;
>         int error;
>
>         if (!ufd)
>                 return -EFAULT;
>
> -       error =3D security_file_receive(f);
> -       if (error)
> -               return notrunc ? put_user(error, ufd) : error;

Design point: I would suggest adding and using a new LSM hook that
allows security modules (like SELinux) to still be able to check a
(new) permission that governs whether a process can pass along these
sealed fds so that we do not entirely lose control over their use.
