Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793625222;
	b=NV9p90FepVxefDxg0tSwvsuQc46j3UBn8ulEsK1Iv+N1OUsrnfMriArMjOTXFS6Tl5Yh
	 /2/ujtrhL+2l/5CZ1jJfsOaJf+QzJk+MGEhQiLBHgsVtbXdyh33bdXVUucdw5ZasoJEo1
	 qdN5+aJj2g4VNnCSuif4lTJvWCs2bRXIiIcWZxQkZpG0e0AMBM3OUG3jhwC8p1Qsk46kx
	 xgTpRZHYEn/ZQM3tHTt7mRG1DEJdYYcfqDLZsQTf+XjknoYPARNLYEMN2uUZPBiapUNjR
	 ivkv06LyYxaSb97CplJQapHJ3IYeltGFS73fyeAGea6BgFa9VPBFFcRsWRZ7AzJISlw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rC8xVMt0ftVC1MA0/AxMx0dm+YERO32RQqLOxWhbSdM=;
	b=NuYdXZOQOnA6AbeyJhOVGv1ZhSRq/U9j/coB8ikxcgNeFvgeuIphtsTkBxhtftK1+MPJ
	 mRGseBwy6WbzwWQaSF2ILDPKbL9Iy25HKIBqILclAHm9ncTs78GXhbxTa5V5QAwPb4L+R
	 fK0YQR9M4i3Y4KZ06KuR63nUhjwQ1NJmkLpnIMjDw8a8eSoZ2hJqG0TcCENVIMFLnjNDJ
	 vmT9X2TSqA2/ptEkupoIK0ZFypjqEEZOR8VXziYC2iBinL3B+rgFHgsxS8I7ox9312Y41
	 k7DbHUNDp9um6Z7bdekVkMiKAZKibHrydCU23nxymKoY5zBWX0+ENKZzSwbpbp79uMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o9Bv0lrt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D8D606A32F
	for <io-uring@vger.kernel.org>; Mon,  2 Nov 2026 13:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45D8D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o9Bv0lrt
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15ea896ddc8so5071084c88.0
        for <io-uring@vger.kernel.org>; Mon, 02 Nov 2026 05:13:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793625220; cv=none;
        d=google.com; s=arc-20260327;
        b=dv7S0eDKqC3liaELAp9NqZmtpC2491lnOBDm37k7ZCg0PmFJ6isMBfH8kK4bTMXJrS
         YZrzwK+bRV6vPtKJ8ZUzM9bYVG8y7RR3Af8t3TRx8Iu10ydYQIuXEv8A3xIA6Qxcdaeu
         hnvAosg+ThNnWE5LpSquGzjXhqwJZHYyapV1BiDGhLGdy9w98wPQkuOw2rQEchA+IpLa
         0ENHdYuby8ZscuoCiu1J96frSJ4Qoo1Ju/zZQTg1xkERsf1uFCSkBNgGSiVW6XaLuLVB
         9MdxC9yambmAwBPJpIPD4uxBqSXrCJBOJOE0dHnDmA3kqfS7Of6IdGYHjL5wU5/RW9RY
         36wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rC8xVMt0ftVC1MA0/AxMx0dm+YERO32RQqLOxWhbSdM=;
        fh=QjMBX3nFSqVd1uAACijGgqlo2aR58hd1EjlgjbJeaOM=;
        b=EOBCF+OQa3liXM6ucKMUNEmFpmfXOgSprrwL6LJC8uj+R3+FnIbqs0jqY5/In8wu4Y
         bHJAu6sEnXlTVrdaIyImoAuQNP+2oWG3QOX3S7PdttcHRThStaPwXO/4XRZylfqGy0kJ
         CWVNxzLJlGWPKhbHc2sA7X9eId6q4XZUSflOOeMy0eoU+HjI3yVbIdxLf2xHC3ml3rWY
         MmM7J3z/nLf57AWFxPS2aFtARCUXvAHiIjvGzxFAc4EHl3DLj0bn++AqfLCBCO4DmqFd
         s9DK6ZTXcpcEH/aDvlbVEwmUaedsA0jypgAB/KmUF/kJ5yp4lKaSoKYv+r8jCZ9BZb9U
         jV4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793625220; x=1794230020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rC8xVMt0ftVC1MA0/AxMx0dm+YERO32RQqLOxWhbSdM=;
        b=o9Bv0lrtHh2cwTJJVMUH4k06fPh+ZUF1Xl51YCyt5LSal/HMFyjV6eP5ndcJg+7iVj
         WTAY3phbzSA8x/6rfLnLvb4bDnZ8Y4PG1EA0o2RPOfRyLwq6jcyjm/QiNRIf9j5AQQsJ
         l2LCkDlG//3sWy/odK1wwz5yKvgETNvSW47fduZrW/zlPZQm2Hr6OF9occ90dnwda9pH
         15peHnhylM0gwl1DeCkmpBva8CbqeJR2lmvPc9gUGtCRkIGAVwQC32c4UK+T3jOODMWv
         8UTKrgc631symoPetFblG9qRPrnzh0NbDQA57q01cYj3VhCGGF8OfpP+shjngzwAm22m
         UCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625220; x=1794230020;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rC8xVMt0ftVC1MA0/AxMx0dm+YERO32RQqLOxWhbSdM=;
        b=0NIdY5GTqoYAgbqHDdHuTNzmnxyFvt5AnfKIV947m88/GrSnBKuv93Qbu62VXQQQ5b
         BQ17WI6yzyqZvbeD/qyhz3at1o/8M5vXe6q3NyxiAkhE0L6FPI1ni0SlDZAn0BU/kAD8
         7/suKxuIDlwHUu3kqJtna40tkzBDgKhFMmAx9yfLohx0VaBe6Xd8nGTR0hmO2aYDOLfD
         b6VEpV4RApFzf2kw5LLPoNXQAHuWC7UvTpjDUBVO2Jk2HHWcQcH/mQ2iUfz2KRApboZ9
         NQU+GUUd4EV49ws42iwNcTCRYInVaovFUDFfFS0c6AUdQvza5szrIbMECxUZwVVZJlfU
         AfeQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9k/BVgPcO2r4OPXfQhLXUp0PH3p4tzn9KemZrvhNcWpFiIP+LM9dUUgNJngo++qxwl2LEqhxosw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJasUUbsGr4GaanOl3oZsF8JX6YTdhu7enrleP0DyaWrn3m2XrB
	D8zjkaluJIIn1svj2COxmiwk79PGGfbtPSSqpmUBzuA/Ye+9iiGOfpcRQ+iEvvBa/e/8gTl1nZB
	2VEaJ0nLtBSV693eT9PBz8KEepXje4XA=
X-Gm-Gg: AYBFou3JXKs2qL5CVIsyhQrDwyCeuy2QITSujH470Wsct1akjNvYRjILycQW8JCH22N
	R+iQUwe8msbqFgfNpBpzM92BBr22ln+MxbT0PkfuHrLjUSa9wZxRiKN+fh3u9PqcKdvzzwluxFy
	Zy1qHnKPujYFmy3I8wcGMxO7Yum9AmzIzUnrIVXGzgVv9f1h4/kqAfTuHQSKli8IVOi3wsJwAKt
	UcJ3UpW8zUQMPWXssJeQyIkTvB838jwPW8rfEDuLi5vfdzw7O7I9HQdbXcP7EX+bq3uXvCjmjPW
	habGXO7ckje6U59up+Rt4d3BstiucnF3gc+kmC+E8clRPUMOU64sUmBXrY8EqwGuyziHqS0+36Z
	e9gCGzwCCPJNnz+6vlh+PeL6cSdz2WDtq9p9JQhoaPAjN1at1+k9ZucPWEJKdWZpwZuH3
X-Received: by 2002:a05:701b:230e:b0:14a:8cff:fbb8 with SMTP id
 a92af1059eb24-1ac5bbb5053mr14722111c88.28.1793625220279; Mon, 02 Nov 2026
 05:13:40 -0800 (PST)
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
From: =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>
Date: Mon, 2 Nov 2026 14:13:28 +0100
X-Gm-Features: AclHuK9Lk_3jmZnqSr1tjOillycrUr-WcgCLTZN6r2TRwhWtp1BoaHKbHJvYD28
Message-ID: <CAAUqJDvsDi5ceO3ri5cJP4WJbZeUdpJe9F4cv8OU4=wBzVeBAw@mail.gmail.com>
Subject: Re: [RFC PATCH] af_unix: introduce MSG_CMSG_SEALED
To: Eric Dumazet <edumazet@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Simon Horman <horms@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, netdev@vger.kernel.org, selinux@vger.kernel.org, 
	linux-security-module@vger.kernel.org, io-uring@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2 Nov 2026 at 14:05, Ondrej Mosn=C3=A1=C4=8Dek <omosnacek@gmail.com=
> wrote:
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
>  arch/alpha/include/uapi/asm/socket.h    |  2 +
>  arch/mips/include/uapi/asm/socket.h     |  2 +
>  arch/parisc/include/uapi/asm/socket.h   |  2 +
>  arch/sparc/include/uapi/asm/socket.h    |  2 +
>  include/linux/socket.h                  |  4 +-
>  include/net/scm.h                       |  2 +-
>  include/uapi/asm-generic/socket.h       |  2 +
>  io_uring/net.c                          |  2 +-
>  net/compat.c                            |  3 +-
>  net/core/scm.c                          | 81 +++++++++++++++++++++----
>  net/core/sock.c                         |  9 +++
>  net/socket.c                            |  2 +-
>  tools/include/uapi/asm-generic/socket.h |  2 +
>  13 files changed, 97 insertions(+), 18 deletions(-)

See also this RFC patch for selinux-testsuite
(https://github.com/SELinuxProject/selinux-testsuite) that I used to
test this patch:
https://lore.kernel.org/selinux/20261102130834.253605-1-omosnacek@gmail.com=
/
