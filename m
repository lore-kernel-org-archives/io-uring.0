Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793646411;
	b=dtDlheHi5nh1Zw4L4SVznDwadu/lvtva7K+v5wC9GTS0E9Jk5bQhcwrxKeyfDK/17POW
	 X9lFAxav7r6au1QDyRPBB2e736RKMzLhgCaarzA1cW4aK7xJ3dAuUOxhZjrfoGUTL8bHM
	 EQHL/u2pSSKZGMoyX8w7jaG2BDMb+4HiOqhlLKwUv5Mfi0dqTDLXM0Yr7WmT2Z/1Ftian
	 0eC/aYGpVrPAja4o5uOxyKAkDNsZgIp/PldBuAzLP9cBRG0QmfcRGFWLubGptbbQaDniu
	 y0HOInLrsFLSrBdFUyd1hYd1CsQbUPP1SVv2FTTnq5ko0Y0I1M6xhuzVRi8Xiwgxfcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CoGzdrvvaViECSeg3PiBflj+0qzs8BGFy96FG4d/cj8=;
	b=HhvbJJWT2BSLTQ6MsydeowOIlBa+wbiAA9anKHzS2rb0WwVFkEInl/pPFt68OEjCMPpR
	 Eq31wNFCqvGGzu0PO1No0AN+ufQbUEEupeTs9j5f3Ca+iPo34W6EAXfxSyoqxQLjPANCE
	 M9SOqtrCNOz06Rb6p+udhkvjcorwwJjBruT/EAzMGdYhtybu96QBzlcKA5mMjIdYkXQun
	 H7zI0bMLk8is5W1PdTkH19mVAYDDZl2S5rbVIseOgsYsP1GIhJRvCTSogk/LNapY0xqIS
	 4ztbP4sWRhBs3Uf8IBx5BSLvXG1/t9ItqDD7EZ7rtf8GnGnPMrJv1HiPsWYkFdm8Tjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tnNnjlYE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F01606A326
	for <io-uring@vger.kernel.org>; Mon,  2 Nov 2026 19:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8F01606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tnNnjlYE
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67a2efec15cso3072988d50.0
        for <io-uring@vger.kernel.org>; Mon, 02 Nov 2026 11:06:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793646410; cv=none;
        d=google.com; s=arc-20260327;
        b=p4Gy1JvZ+Ry6jyZSLrsDUEVzuK+GudoroEgfBty4N1TH2EGHX7/mkuS0+yaVEoS8hy
         vlSfxb0w84XHxsCZGNgGcxZNwhujwfLeDnURNB0gmmXTm4jVIMpy5n41R59fNAtxF24D
         pTd13IBY2EFoy4t1LPvn4PueQyok8SFzZ4yf/eB8YmGCWAJoc15N6XTz3hdiuYIDu/m7
         aLGxj07eNukX15CyEbjmktQiaHWqIMf+97YTFxsdQpY756M/gyUsRop0ubA1Sb6lqRXn
         QdsppM/U4b8Y0MZ1EkRtLrn2oNY54HpYvME2Gql7DVQHpMjc8dy8Tgj8lQj21FnMmeAB
         vfGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CoGzdrvvaViECSeg3PiBflj+0qzs8BGFy96FG4d/cj8=;
        fh=JXiNUgq4m0L6z6nUN+Z/GtlyjWwh/sYOGrherJD1CVw=;
        b=JnHoRl4l8vXK7NRrne8lyjuKl0ffj/mRGEg/w3SkpFc+SR/YJdU3RA+VLy/JxWC1Dt
         SfEjCvygvUZ1AJXWwQEOhpHwZSVeXTHviJSzmXKBqGU5p1LVdaeeIwPmbbjXZCFq9ToV
         FaheH6tPXYv3IDi4PFoS+A3awe7ItYMGL0+s8b0PifIjMbcTFZKYs+6+/k5LWG6ayXWr
         09h+POVlxgQLA91RJupwxBW2S0FNENEAermKfisj1AU+O/Ro6DEyXw7vRn7UH28cbAEX
         Ivl7n6jJGEb0gGm0sGCVQrZCunVdmoLFFmQ1jonKHChDakTp4ZuwU7XJnj54sVG0tUOl
         QFYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793646410; x=1794251210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CoGzdrvvaViECSeg3PiBflj+0qzs8BGFy96FG4d/cj8=;
        b=tnNnjlYEC10sRjaX8VVbgcAd8IKKiRclExe8oUiilq9oJbJXGXPaFX7svfDWA5VLcT
         dOrwbO+NBopmy9Rrtc6LeuIOKlv9sNYHZeMG9OC5fE9TOe9mWgw2wNWZQtspd9LRsAK2
         C6/Fd8cuZZCW6A0ONYIN37BzGXlDL9/3Cq419MKJAvuV+BEd67LaqKQwLsTh3j9I0VSq
         caiKXG/Jt2mJ+QGF8dd5beMFmncSCIGhzIqJjv2AeR6ntBD/ovF5X+Z9WgKo7D5LXKy7
         EJ1DiHzkPdusb/TESQq1QJDbStCB4CUmD/ziqBshYiv2TZsxjLh0ZHwxzhWc8cEUWunN
         yyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646410; x=1794251210;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CoGzdrvvaViECSeg3PiBflj+0qzs8BGFy96FG4d/cj8=;
        b=knSK+qimCWf0p9SMlvM38WCC1syPVpxH/qBW1J0Ejnyasv8naQNKsDW0Y++pgVy6Tk
         rFB9rOOBT3m+8TnvrGhluk4R/o/RWV44/3QhQFIWjBY2KbH1UaraIhbpiTgorB+/vC1W
         tCZEzAHVhzOID2rC1NWRbWMJP9yGri5x3Y7TApQ+6m1fM1oGqlxADhq7Q+75ycz0lPu7
         4ylPH7+107W6guRSrzIg5sE+Z9/fhO4GQxDNPp+/JhG4u6V5W4R46adF7kGPJsFipdss
         KJ6rH83CzQZZafSzLCALpCLywX04F8krHcoLtC7jf1JqdDAZYld0iBU8ntX2mAMCId3B
         XG2A==
X-Forwarded-Encrypted: i=1; AKwUvByAzelDV5iLRQk0mhqvoeBFxtMfdASKbSYE9EHe6qvg1FSEpNP9pvujT/daGQY/ve+MhaxBUBLmIA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9qYlxseaHD1/KkO+zmPo34p8PP8xXpZnhw/VGX8M3O5HB6kQ21
	BAB9i/rGO78jVbo8SfMmO5rMX9rdpMbmY4Rz81i4vJ/3qgsr7LPRaR7yL7eMflBmDGw97fNKbH8
	g3WtT5nL8TAWY/PdjVWLymQ28KGWwG1I=
X-Gm-Gg: AYBFou1BYgVqINBpP08XUYkXery+CaBs6bLMQpmP6o0MEzLr2TqHHVTBEGrEIDb09L4
	Tw7pg+ZYPEj0jJ5Wn2YUwtBrZ/zh3po4+14bxBV52HX8YhjwpvMwenB28bAE3jL/PJS064ZN/jH
	f9RnajqtDC0ar8Rcoh58hFNwRe+LlFKXP/IffVnx5m/PIEm2Q42qByvwanywQN6x5yxe6SxiZJu
	z6hGYl2KbP0/wCsQB046RC1BMAhfTZkUC20nDkIhCKPuP8h3o4NcBBcs8N1ES10SfOpkVEanOXh
	zFQnFZX6w7hfySjLKtzpIego3kAX+HrQtwgURASIoWyzPRaR4b0uZC4M4rGrYOV/fJVxUmTCTie
	/Q6tXL960SOHJXCSsd5nH/PtBbyO6BuO9jGE/tWy3JxF5hM4SIFaZNOgAlYnLRo28hxTSyuxAga
	T9jzcaM/fBbQMssYkpqcCstFnhyA7rmCdiWhOvx7baLn7fXQeHIiyGwG757A==
X-Received: by 2002:a05:690e:1c20:b0:679:90f4:3223 with SMTP id
 956f58d0204a3-67a8d3987b5mr8777022d50.9.1793646409776; Mon, 02 Nov 2026
 11:06:49 -0800 (PST)
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102130540.252894-1-omosnacek@gmail.com> <CAEjxPJ4hxdvV-r8chmF3RAi9RJX=-4AqntG01=fWUhh4-xP+ew@mail.gmail.com>
In-Reply-To: <CAEjxPJ4hxdvV-r8chmF3RAi9RJX=-4AqntG01=fWUhh4-xP+ew@mail.gmail.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Mon, 2 Nov 2026 14:06:38 -0500
X-Gm-Features: AclHuK9UEiLULgDNF_R4Op6pxR3pAD5yp_wmeU60kO8Lo7f2jaleNkGh11hTlfk
Message-ID: <CAEjxPJ6X3Hvd5eOCxmqaNWi-vqbGEj6rULHiFJGgD41uPxAm7w@mail.gmail.com>
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

On Mon, Nov 2, 2026 at 10:14=E2=80=AFAM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
>
> On Mon, Nov 2, 2026 at 8:05=E2=80=AFAM Ondrej Mosn=C3=A1=C4=8Dek <omosnac=
ek@gmail.com> wrote:
> >
> > Currently, when a process receives a file through AF_UNIX's SCM_RIGHTS
> > mechanism, the security_file_receive() LSM hook is calledto allow LSMs
> > like SELinux to validate the receiver's access to the received file
> > (similarly to a process inheriting file descriptors through execve(2)).
> >
> > However, there are cases (such as dbus daemon/dbus-broker) where the
> > receiver doesn't intend to access the received file and merely wants to
> > forward it to a third process. In this case the forwarding process woul=
d
> > need to have the appropriate r/w access to the file in order to receive
> > it, even though it will never actually acess it. That leads to the
> > security policy having to grant the forwarder access to a potentially
> > wide range of files (in case of dbus-broker basically all files), which
> > is not ideal.
> >
> > This patch adds a new CMSG flag MSG_CMSG_SEALED that, when passed to
> > recvmsg(2), wraps any received files into an opaque anonymous inode wit=
h
> > the name "[envelope]", skipping the security_file_receive() LSM check.
> > The returned "[envelope]" file descriptor can't be used in any
> > meaningful way other than being passed forward via sendmsg(2) with the
> > MSG_CMSG_SEALED flag. In that case the original file is unwrapped and
> > sent via SCM_RIGHTS to the receiver. The receiver can then either
> > receive the file as normal (subject to the LSM check) or again "sealed"
> > in the "[envelope]" anon inode for further forwarding.
> >
> > Note that sending the "[envelope]" file is only allowed with the
> > MSG_CMSG_SEALED flag set, to make the unsealing explicit and avoid
> > unexpected behavior. Attempting to send it without this flag will fail
> > with an error. This also avoids recursive nesting of "[envelope]" files=
,
> > which would only make this feature harder to audit for possible issues.
> >
> > This patch also adds a simple read-only sockopt for UNIX sockets that
> > allows userspace to determine if this feature is present (passing
> > unknown CMSG flags unfortunately doesn't lead to an error currently).
> > The minimal code to do so can look like this:
> >
> >     #ifndef SO_RIGHTS_SEALED_SUPPORTED
> >     #define SO_RIGHTS_SEALED_SUPPORTED 88
> >     #endif
> >
> >     #include <sys/socket.h>
> >     #include <unistd.h>
> >     #include <stdbool.h>
> >
> >     bool MSG_CMSG_SEALED_supported(void)
> >     {
> >         int sock, ret;
> >         socklen_t optlen =3D 0;
> >
> >         sock =3D socket(AF_UNIX, SOCK_STREAM, 0);
> >         if (sock < 0) {
> >             /* handle error */
> >             /* ... */
> >         }
> >
> >         ret =3D getsockopt(sock, SOL_SOCKET, SO_RIGHTS_SEALED_SUPPORTED=
,
> >                          NULL, &optlen);
> >         close(sock);
> >
> >         return ret =3D=3D 0;
> >     }
> >
> > Related: https://github.com/fedora-selinux/selinux-policy/issues/3286
> > Related: https://github.com/fedora-selinux/selinux-policy/issues/3287
> > Signed-off-by: Ondrej Mosn=C3=A1=C4=8Dek <omosnacek@gmail.com>
> > ---
>
> > diff --git a/net/core/scm.c b/net/core/scm.c
> > index ae38f3c1165c..08822b2a1f22 100644
> > --- a/net/core/scm.c
> > +++ b/net/core/scm.c
> > @@ -114,10 +127,29 @@ static int scm_fp_copy(struct cmsghdr *cmsg, stru=
ct scm_fp_list **fplp)
> >
> >                 if (fd < 0 || !(file =3D fget_raw(fd)))
> >                         return -EBADF;
> > -               /* don't allow io_uring files */
> > -               if (io_is_uring_fops(file)) {
> > -                       fput(file);
> > -                       return -EINVAL;
> > +
> > +               if (sealed) {
> > +                       /* Only allow sealed files */
> > +                       if (file->f_op !=3D &envelope_ops)
> > +                               return -EINVAL;
>
> This leaks a file reference.
>
> > +
> > +                       file =3D (struct file *)file->private_data;
>
> This fails to take a reference to the underlying file but will later get =
fput().
>
> > +
> > +                       /*
> > +                        * No need to check for io_uring files here as =
the
> > +                        * underlying file had already successfully pas=
sed the
> > +                        * check when it was first sent.
> > +                        */
> > +               } else {
> > +                       /* Don't allow sealed files */
> > +                       if (file->f_op =3D=3D &envelope_ops)
> > +                               return -EINVAL;
>
> This also leaks a file reference.
>
> > @@ -365,18 +398,37 @@ static int scm_max_fds(struct msghdr *msg)
> >  }
> >
> >  int scm_recv_one_fd(struct file *f, int __user *ufd, unsigned int flag=
s,
> > -                   bool notrunc)
> > +                   bool notrunc, bool sealed)
> >  {
> > +       struct file *f_received;
> >         int error;
> >
> >         if (!ufd)
> >                 return -EFAULT;
> >
> > -       error =3D security_file_receive(f);
> > -       if (error)
> > -               return notrunc ? put_user(error, ufd) : error;
>
> Design point: I would suggest adding and using a new LSM hook that
> allows security modules (like SELinux) to still be able to check a
> (new) permission that governs whether a process can pass along these
> sealed fds so that we do not entirely lose control over their use.

One other design point: you are creating the envelope with
anon_inode_getfile(); consider using anon_inode_getfile_secure()
instead so that security_inode_init_security_anon() can give the
envelope a labelable context, which SELinux could then use to label
and control envelope use directly.
