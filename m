Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794859646;
	b=W1BwvNfjh5z9UMvKA2PTMwN0uQLM1Si8odYk3OZAu483IR0stzUvcRlxUJBPWY4dK9vL
	 21sthqtmh7xivXfMd8zK7VxDU1SBmt3iuxjd2ZFz6gaXTCY6/iEBeyJvZAn0kS/EVFVYF
	 YGups+nqhu6ereYey0yIOH2lS+zOLfFnrUBhpEs+a0osVZfUB0I7ewoyH2rA+Xer6TKv4
	 gUk5yAusVwpQVH20r3iPWU191do0Nqvlv6SFuDFJqmMGzEF4H9DaxaxUtptBdmoxPsGRo
	 OGwch+8Pray0YawnUP0Vzd+BNLu9GD7D+ATeMSCYXZF/zBV5aPnxxFzvB67Q1oEViZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EZDAQV8yhgMyPQgwR3U/5djFDS4+SZxlS+9+Esw/bYc=;
	b=zOz9lJL+80Z50utxxX9oPIHFMLHPBIn+ckC5HVX+rxW7opusgInNIEYERWFWTC7NJIKv
	 cH/1fAaY35QzDc5YoHhmfNd8t28pZPMHXHSotspiZUopLsqGLNSZ5BHWFVT2JYsdUC+XS
	 on15WayjngfJrnpqPqx8DJmvCuH4s7EfPThSGs/kK/lDGkrEcN1IfrRk4UmCfNEpGvgDc
	 CU9yVu0fYrbOxl3hwwUVEWWoGJyQbPrZFdGCCgfui/a+rF4iQLypITGIl6/++cDNXKht2
	 SRrOECGFaWWdc06f73H2ugm83m0SptVE3baj9f2vuYl5wtEW4SbANU3aKOhLgqqk2nA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XFDBy0c2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2856D606A31C
	for <io-uring@vger.kernel.org>; Mon, 16 Nov 2026 20:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2856D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XFDBy0c2
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso24829935e9.2
        for <io-uring@vger.kernel.org>; Mon, 16 Nov 2026 12:07:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794859644; cv=none;
        d=google.com; s=arc-20260327;
        b=WJYyjXmqlj0GFntXguM31/KkTjEPBBK1B6vSQTMzVnxGMXE/RSYQ5hpmlayq4MY0Io
         pHEUJUtG+c5HgheqSkBNbBZZpX4WcKRuoHq7W/H/RaNXDQst8EcC79qzrEZoVTAcnncK
         rdzw4D7Zbt1el8++F9EXmrY3VALt0bDPlefBLRd2Dz6O0lBjdjG01gplE8Wlv/704P8+
         nT+IHUJAcuYjCYic1VW1PzaCF94tTi4WBlU1x2cPVT3Ajghls+xKMNXR6nlgruvbyPfv
         xNAVU4D1/COYejJLjwaFyw3P+BrkiMmxJmViEt0pNzMVHVwYvTuLne6e3WpP11Kv1+PH
         AY9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EZDAQV8yhgMyPQgwR3U/5djFDS4+SZxlS+9+Esw/bYc=;
        fh=2n/EEMo/KwG3jiKL3LfVC1kXjqarbGRIvwOW56QC+R8=;
        b=jzS8qLgrtIgjHtESiV2kyva2sVrMQh+i/xoGXEYa3UQZSXOlSESkoC5qaagoqmM5uk
         j7FKFyIPpWaMAj8gMa5Uw04/CXybi4O78ExtdaPPFa9jd8FIH5dG18pQz+QdXJ30Euxi
         u3SCplsnjPdhAICn+BXvdUuAF/y2zqFMTVctCha8kT0hzhxQl9Kvua/8zd0F2RCdgRSI
         2eUTluEDSOPCWd9OSdfreBExVwCijuYFhGAWFgx3W57S1KbLt6Yg2V8m3h4zvv3aTBIY
         7RjirQoQFjViSC8qzYg5uI9jZnrz/IZBqaRMB7ZTGJkS6mjxisejucAbyEH4HrzNAJVc
         JOYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794859644; x=1795464444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EZDAQV8yhgMyPQgwR3U/5djFDS4+SZxlS+9+Esw/bYc=;
        b=XFDBy0c2q6nTYiJ4dwLENH1mguXX/IcFF58gOeYQArjps79P1XpkrhGZpUclTyZwpS
         r/ZYwRoOG8WhRg+8JvLZN08T5FQLHs7jA/CzeQCQsJeulI93s02F+iYtli/pBjYHG+CR
         W2MoU0n/+grSPpLZW83MAsn9WQiLh5CCwtBf/0GxLqRHC416IFZ4i13TeIFhLxmbz0il
         NPxDzLDOL7N17VVYsTOL0jDLDvB5woBcjlvcU+oGB0Wrnz6q9rCc3VHuwmdjl71ac6+n
         fuvYHmykPJU4vuSvTSKMetyKY9BqLddb2of0qXOJ87q21uNxSrudqkhk+T/+cyqihyd7
         2YNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859644; x=1795464444;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZDAQV8yhgMyPQgwR3U/5djFDS4+SZxlS+9+Esw/bYc=;
        b=gi/qVDSeyzG2kMqAZX2bvwAIY32aAmm2S6ZELlEyLMd16/VjS1Hd8u96jPzzgY9z75
         W5GSC9RnUezrVT8e4SNlkQWGtPqzasNfKeyAbI0LVqhLVqYJSH9xRSO/3VX9xuZY7is1
         xulgduR1JI9dajGhRLj5fnjoeXrwBd/bq0UyJe3MoJHOGIJ5H3MLH3fzQC/hOKHKtUuG
         ADqt0J7IBYweIN8hnUzXiMaGIvVT4mw2ajVYzurPCCPr+V6Sgd5PeQefL4o9gSEP8iSo
         1HQwqp7DmTq+LUz9RFaFcKJr+cKIT9PzoI2PDJCnSo3SCc58ypi08is2K42MkbSKjCAL
         BlIw==
X-Forwarded-Encrypted: i=1; AL+hErHquCwslhm25gJnTKZyS/F0aUln708O11UV+tBTYf30SX9XCpponBukDLOV2cCBzdtJuHjoEFpNCQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+BhPKO/08+qn8N+ibWXJHzmjAwuvu0ErWIHX4Mpk4PFSWzZSlU
	U5hrCODIpH/U9mcvyQcmGLgT/Ku7SAW1pDpECQDm3fRHuMOvdGn7ISffHhRDg7Jtfh8wJffECCP
	zou/9e69UyvaskXqWax8Nl0WIJTsiMks=
X-Gm-Gg: AYBFou0UH6o60O47eQw0MkU/WOw8Rl0j2aIVQJDqamOfbTycx+r5qJTBewiEDxPa69E
	WmtQ/uI1C/UuuT5mMV4xx4Ep0TobtQyERsg+yc+cy0SHqAu4cxMpKIt6+lZ+80xRt+E4TJkPNnK
	TU3408yQzxKmelld6OF+WGtkx1dnWGTO2kLLiiJ/oc2cjiJtd++oY10Ywu/RxtFr8ZT5CoQKePC
	VAtDyBNxn4kBiyxkyQU/i3t1ruP0Xjue2FVcSQwxg3/yKd2H0NawM+JpqwGm9Wku2ZYNQwcxRPn
	XVw+lIIfTbPHZ8Ex/bkFEs4GngLKjoMy/AlZAEnGxYiyVYRrEOup1gfu6r4NPPPgX9oC1tiGKh6
	1laPb9+LGcuvR9CpTwtj/7FSFfHTd8P7vizt1zyc+2J8jPAyOqKwWpZwtslvjMx3JrPAQmzjoMU
	roS8QkWbIRtivNc5gHvA==
X-Received: by 2002:a05:600c:506:b0:4a1:f377:5c6c with SMTP id
 5b1f17b1804b1-4bb55a5d6bbmr165067875e9.10.1794859644313; Mon, 16 Nov 2026
 12:07:24 -0800 (PST)
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-work-fs-frozen_writes-v2-0-ecc4a2aac40e@kernel.org> <20261116-work-fs-frozen_writes-v2-13-ecc4a2aac40e@kernel.org>
In-Reply-To: <20261116-work-fs-frozen_writes-v2-13-ecc4a2aac40e@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 16 Nov 2026 12:07:13 -0800
X-Gm-Features: Aa3M54rpWiCplKeR8o5TX-NbYGDID_36BWk-3VAyUzdEoXSYZ7J-t8pfWvm9Fcc
Message-ID: <CAEf4BzYANM9vtQ8L9-rJPQC-tTcw3YUGsw=qnCaoym3+EU=DBg@mail.gmail.com>
Subject: Re: [PATCH v2 13/17] bpf: fs/xattr: take freeze protection in the
 xattr kfuncs
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org, 
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org, linux-nvme@lists.infradead.org, 
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	linux-unionfs@vger.kernel.org, bpf@vger.kernel.org, linux-nfs@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 3:13=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> bpf_set_dentry_xattr() and bpf_remove_dentry_xattr() go through
> __vfs_setxattr() and __vfs_removexattr() which leave freeze protection
> to the caller. BPF LSM programs call them from sleepable hooks such as
> file_open where nobody holds it. So a program can modify a frozen
> filesystem.
>
> The hook may already hold freeze protection or locks a frozen
> filesystem would make us wait under. So don't wait for a thaw. Fail
> with -EBUSY if the filesystem is frozen.
>
> The _locked variants are only used from hooks that run inside setattr,
> setxattr, removexattr, unlink and rmdir. Their callers hold freeze
> protection already.
>
> Fixes: 56467292794b ("bpf: fs/xattr: Add BPF kfuncs to set and remove xat=
trs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  fs/bpf_fs_kfuncs.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>

LGTM

Acked-by: Andrii Nakryiko <andrii@kernel.org>

> diff --git a/fs/bpf_fs_kfuncs.c b/fs/bpf_fs_kfuncs.c
> index 35ccd98a4de64..7f61e2efa08ba 100644
> --- a/fs/bpf_fs_kfuncs.c
> +++ b/fs/bpf_fs_kfuncs.c
> @@ -295,9 +295,13 @@ __bpf_kfunc int bpf_set_dentry_xattr(struct dentry *=
dentry, const char *name__st
>         if (!inode)
>                 return -EINVAL;
>
> +       /* The hook may hold locks or freeze protection already. */
> +       if (!sb_start_write_trylock(inode->i_sb))
> +               return -EBUSY;
>         inode_lock(inode);
>         ret =3D bpf_set_dentry_xattr_locked(dentry, name__str, value_p, f=
lags);
>         inode_unlock(inode);
> +       sb_end_write(inode->i_sb);
>         return ret;
>  }
>
> @@ -323,9 +327,13 @@ __bpf_kfunc int bpf_remove_dentry_xattr(struct dentr=
y *dentry, const char *name_
>         if (!inode)
>                 return -EINVAL;
>
> +       /* The hook may hold locks or freeze protection already. */
> +       if (!sb_start_write_trylock(inode->i_sb))
> +               return -EBUSY;
>         inode_lock(inode);
>         ret =3D bpf_remove_dentry_xattr_locked(dentry, name__str);
>         inode_unlock(inode);
> +       sb_end_write(inode->i_sb);
>         return ret;
>  }
>
>
> --
> 2.53.0
>
>
