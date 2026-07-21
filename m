Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6128647F2EC
	for <io-uring@vger.kernel.org>; Tue, 21 Jul 2026 10:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629495; cv=pass; b=qWg9jA+gZVlBGoCElxhR/L3spMoK+j+XzQQ4W6N3RgiclgtTnDQzyHExAof9z/Y8Bew9DIWGbXvXA62VBNEhWgmo3lIpXSCjr8s7QMpOLn8OEj4goxzzKuaeXjQBfkXMoDXyaItnNUgh+1sMtEv6BZF7Y1w+a5CeOMDL+1Rgc2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629495; c=relaxed/simple;
	bh=niFtT279TmW8ySXevFvQFzJ/wBTdWSe6DHO/ckEaC8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K+DWQ1InD9E10s5JgOEz9Le1sa4tMNr7zacQUovtfA6De3IcR+lw/7j21dYhKbT23nBMjXbNOUMvM7P8mZ3jhv/GXeUPX/KbxI+xWdb1YOdUg647xlwS3tqoX1vNpa07PyLXjT+dkei9B57dE9VPSMNxTMQLHlL2roAvJRg2By0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1jsV8HW; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1jsV8HW"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c197e7e4e94so298969966b.2
        for <io-uring@vger.kernel.org>; Tue, 21 Jul 2026 03:24:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784629492; cv=none;
        d=google.com; s=arc-20260327;
        b=ckrIOMwejheX2dEWHasx3ARiN1+P3ANUdkeilBuW0Yg61I5pGkRK9vzRsbh2Yxnxz6
         eOvKsFS7HJUKINie4CJwK2uGd5NCHV6QhTJFNzx7IT8m2uTrsxMG8B7aYNVE93QNoC0R
         fHE4k42nQ5a7AKHb0BBhD1cwPolU3VWN23BCJcQFq1VDzIQ5XJeL6gfVCNfivyNNjevC
         2ox8NVirtXmlFrbEx8PYAJGBN/H4eknJiH6HgbvQLFwSZSps2vQPCBrPe5BnSuwFUMCT
         dYN6Ci1upLr/w1i+0LgWZKLKMqiFwzyIyfesXPu1bL8/pv4tZvLpap0x6SBOG+9QRh3B
         9d0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OtnqmtFg7Dx6MER3dQqruUgk06OxQyRY+EFDKNLKAiE=;
        fh=aQdPFjq5H+LVmW826s72frmxvieIMCVE/iXwBap9pmQ=;
        b=sNoOlju5+Lq3wBYa53SPUJoVAaEoBTjD3Wij/K3zTlsY4fUccApk89uvZLmOlBRYKV
         MMFRF2amWhH1bndNiKxKA06j9ahp5sI1/iRH6DWvs+nlCz6OKM9DQAaJWeNN+9TVOVeW
         FgY5CLel0/rqCQ+NUjZReuC9v4sCOZDBNUotY279Kw1epYLfCbr0yNuFUxyx6WzrhqnW
         9ZUbFTiGiugJyJozSS2lRf2CV7SDkeB8nTxwKYjLPmlO9p3ZG5hi1yBsoiIVtD/PHmmh
         d3Ka738eO2Wgr1pNjI4SlOeTC/SXkqi8FMk5XfYTGXRp4BM221SarkREnnIKQMvaZo/6
         CnEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629492; x=1785234292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OtnqmtFg7Dx6MER3dQqruUgk06OxQyRY+EFDKNLKAiE=;
        b=E1jsV8HWK0XJd3OZDAMmDCunaat7YrQ74jCfv3zVbg9WGLN+Kpwcw6Ny4vNep7zDOp
         0jfd+er8cKDWP9dbrgg+O/Bd5Aam5gs89gk7iaJ/h7M4Y6iBAvodsWnjJjQiOGK67nxC
         wNvElGma1Ow1hiEiTjSGJDQWLTwRbEsC42spwC34BJK4QFPPvgRBLJ7uNiVwP8PfpbhP
         25pK+CZvglsjj9CX/hJfxJD9gBpMFeVOskBeXjmu9hLY7ploudkYbbMFcH+D+puT31oL
         z05jgccsBpX55pUU8LBwsCL2U+Qq288PPERqPkpbFHPrA4HBFTXmNy3hnP8cVT5p8NwA
         U3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629492; x=1785234292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OtnqmtFg7Dx6MER3dQqruUgk06OxQyRY+EFDKNLKAiE=;
        b=oMX5ph1hJx4tPxLBXNrmE/070R5nG/N2lAFu9dsnL4TZDsStPvlNb0Dss7WB/mqn7G
         bId8AOHiG1O90MZJQxieQ6B9cmjSjFOT5ohMI9CONZ35kFcobaxLKNOn5nt2rCsqGn4b
         e7UYMCukq5fgRGxORc/b18mlK2QwLGpDVOlOla7x3/NMz7D0VMezLixqJOxKhxjCSKXT
         hxROHHWXqc8K8SfTqQl6fOGXyYkRNOX4FLELkv6O1ieyfeAlDbJaoTUnJphxjzGSpO4W
         LYo+l9s08xWjEPgKocOy9rSf3gJRjGcfd4IUAhym57S93IXDykDtCFaNQN8EJlXrexet
         Dp5Q==
X-Forwarded-Encrypted: i=1; AHgh+RrPLsYJFpAJdZz/Kcy1Lz1W7bmAiXyfMdTOQxJnHhESjlODhW5ZtcSE0WOUJi84v+RYLiayRbYgNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAHSTMx3JYFno3X6AGblwac50JKb73czLRpMhAr3/TBWUUsNmn
	VeAPtRllBADMjBIc14jI5eTsczMqkOhis3wSy4FK3iQJ+jzus25SVISLFlZkCpg6zOjZYOhT/NK
	gv5OloWID1wey9AWKWAE6UZI3s4InOGQ=
X-Gm-Gg: AfdE7cny5H2rEqunq1YjDjfJvXEw3e70zOBzuvqSCapN1kXtTZ7W8t0JUN7fCXaSR0b
	21uMQeu8roHoHvHfcfI1EvYt+BRHNNF3FKEnmvJ9hLVrWUeuexnFEblB/043/r4UY7GCs6j3oUG
	crFcXJU1xwTuFZ/5DRf+vfOXDAebY7tzZEzIwPv/Kw6XE4c4X7Gpu/MkbEmLJ4ANkpiBddVWFQW
	ZdjO6IhC6Z+iH6u/ESVFqxuXJwmji11euMBZ1BXNWX5I5CSrjAXz+b5//EbQ2cEg5NCH3uZ0wcK
	WfYunr7UYwuDrrWnu5M=
X-Received: by 2002:a17:907:1c9f:b0:c16:9af8:c77e with SMTP id
 a640c23a62f3a-c16b46b642bmr662468766b.1.1784629492265; Tue, 21 Jul 2026
 03:24:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721085458.2716-1-aditya.ansh182@gmail.com> <20260721085458.2716-2-aditya.ansh182@gmail.com>
In-Reply-To: <20260721085458.2716-2-aditya.ansh182@gmail.com>
From: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
Date: Tue, 21 Jul 2026 15:54:39 +0530
X-Gm-Features: AUfX_mzqk-L-WvEDQguzwkbHi5MCK4ajCmKKcgUYZRs9rNFCznygmRA3lbFhwKc
Message-ID: <CAK5ssPNpr1Htx5gq--vjx=JM8_ZpXiD5eoSk_8cVMiCr5y2WOw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] fs: make file_listxattr and file_removexattr
 helpers non-static
To: Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Jan Kara <jack@suse.cz>, io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 2:25=E2=80=AFPM Aditya Prakash Srivastava
<aditya.ansh182@gmail.com> wrote:

> -static
> -ssize_t filename_listxattr(int dfd, struct filename *filename,
> -                          unsigned int lookup_flags,
> -                          char __user *list, size_t size)
> +static ssize_t filename_listxattr(int dfd, struct filename *filename,
> +                                 unsigned int lookup_flags,
> +                                 char __user *list, size_t size)

Please ignore this patch series as it has some redundant changes on
top of v1, sorry about the noise. Will send a v3 by removing the
redundant change.
