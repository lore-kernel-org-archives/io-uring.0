Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB964F797E
	for <io-uring@vger.kernel.org>; Thu, 17 Sep 2026 12:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648202; cv=none; b=KApuptFL1LSe3r60vkhz4wqySDJjd+teQ2rjFsJLiORQdtCtpYODzbVSixBF4g63+IVZQ1ze+rlP3eBmlo5pDoeAEYfOcmgLtYaOaJzqGVAHRfxYHCipvP/F4dNXWOzudjyy3PGq3tPo46m2z85kd2xna8k5OCBnHBbpk028g6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648202; c=relaxed/simple;
	bh=NiBLOa+Ivz/MGMdtQtUORvBhVtPqCwg0j5rxwwVjFZI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BVmjMo+7AGQfQ2LRSeNAoSczvP5Y83AvmeSdHO7rsHCnD9GyN9opNq9/WV/wDgydEuaYelpGVNN8rzaBOyI41y9tVMwPqAs2chPbVqojZVBO4LugLhbFO2CMWjvcDkoF6dns4rb9mvL7B1dyiFhwsWD/SykB5ATSe4Jb8X56/Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gU+5HCb6; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gU+5HCb6"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so4893635e9.2
        for <io-uring@vger.kernel.org>; Thu, 17 Sep 2026 05:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789648180; x=1790252980; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dtz+Uqi8FvhezfQGwgUreP+CufNocr9p+NqbDN0Xcok=;
        b=gU+5HCb6NEhmBQLVaLIqnXzYCbuW3y+9zP3j/sbrylZD7lHYyFw9pFNkQiORNKn2+9
         ecpocjM18AVXqhmb2SxpKUeXm8j+Y5YY0eqe95Ju9PSzoqQDNVvagBBBRiHmAyaNxoSO
         yrF2knA4eFqyBkfUVMqfIAaC170alJV/Ke3NfGe5vcT8LsMUz1AkGiyw4nqOt58DrBeH
         edFMUx8EXzNK34fToowfRsGPhAcUCtwcD78tvPUV2sxZL80o7IO0qH+1j5wD8x1fouxk
         3I6nNpgWk3sZfc3RW+iF7VrURE/zt9+KM6ybjY5XT/davL5nsM4B5Uuztt8JxBvsRJbA
         86GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789648180; x=1790252980;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dtz+Uqi8FvhezfQGwgUreP+CufNocr9p+NqbDN0Xcok=;
        b=mgQDOI5ryaqK7wqQDJtMFMGUNo9DlsX+2EovwqfkaTFh8c0zMPAFzsoiZshzuXYyLG
         7cjc3l91JC/ZrFb8hmCDHIk1B9/OM4zG33X9enxxySWZlXUKpE6B40cdLbxrktDVgOn2
         rZuSu/AzsqBDq1LayoDPOFEm6yZ5IV++//RkgKBIb60IXyU8IkpD+NCBx2lCaZe6KlKm
         8hySdwdOk+dfMJlX/OsfQvT6yxxT81TGdz+k6HLwTS0N3BmzQSXy/yEbOvIa5n1VBSCz
         dgUvoQNlnxuum8JPGvpI2712Gcmo2KQHtSME8C0AnVVjgW07MAoBd/yBmqzKjdg3XVXA
         6pbA==
X-Forwarded-Encrypted: i=1; AKwUvBxVd3FmluduY7+G68XmX/4C23IRRHZrM7MB6ZeoIFKbpv+wRWbTwUy8m4E3pzkOQO0UTHciD/QouQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mVM48UA+UG/fZI/aLaaiZtUPe7wCLaQZTT+lTAmmW2wWh79i39
	LAl/UBuQWTLAxX9A5B0c5sUodEI9mB20nsV1TFEQz9Kyny/ZITrdwecc
X-Gm-Gg: AYBFou1JWALqt+/5Inh7SJdRkSO233+QUh2Dmun37QaIMQmvgL65iT/jHxc9nE/Bl0h
	P96kapwRELHpFopBDBwHm4uqVoMqLIMjAnNPeRzizqTY9W9gdlAHhVmqFK6DnIe+2az0FP15lyo
	rjFcAnUf9erEAMQh3hrSpKEXFoi8SN8g//jkJLOjg3HT4IsiT6+SI/96ustmnkB4+hPPQ8qSaB0
	I75HIBegwvQ79ghr1Oo1yRiiK3grinz+g1NgkwqNHDLOeQJyCT2NTPTihbPWyWRmcFitUJ4imYd
	q3soFifNq8asxVJb/MVOsGXepMKDP1HfpkNa4FAltynv/Z7DPAkwuCqVQYzzKoN+9YFbZGGlHGF
	aCNr0Em+CYCLR/v7o4xwtSPdNf/lgi2ugqkITKB09K2mqHMmAPxhYXQEiglXpKW8Zxg4Yg9W+hR
	iHK8LxnGeNETJMCsogS7bylx/rCP2Oj0/CuqOBRfoprOYgsAoVFc8/sJLttalKAH+EuBVrFTr8C
	zDjwcC5w8fudYdvm7HPylIYQFsK+MRB3E9o
X-Received: by 2002:a7b:c35a:0:b0:49f:bcb7:8e9 with SMTP id 5b1f17b1804b1-49fbcb70a1bmr64001725e9.9.1789648179633;
        Thu, 17 Sep 2026 05:29:39 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd1ce79csm82621135e9.0.2026.09.17.05.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:29:39 -0700 (PDT)
Date: Thu, 17 Sep 2026 13:29:37 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linuxppc-dev@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, wine-devel@list.winehq.org,
 linux-xfs@vger.kernel.org, io-uring@vger.kernel.org, bpf@vger.kernel.org,
 linux-mm@kvack.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] file: make struct fd_prepare const and kill its err
 field
Message-ID: <20260917132937.5a15904e@pumpkin>
In-Reply-To: <20260917-work-file-fd_prepare-v1-4-b87534ca49f3@kernel.org>
References: <20260917-work-file-fd_prepare-v1-0-b87534ca49f3@kernel.org>
	<20260917-work-file-fd_prepare-v1-4-b87534ca49f3@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Sep 2026 11:09:45 +0200
Christian Brauner <brauner@kernel.org> wrote:

> FD_PREPARE() releases the fd as soon as the file expression fails. The
> fd either holds the descriptor or the error. The separate field is
> redundant. Make fd and file plain members and struct fd_prepare simpler.
> 
> Callers of FD_PREPARE() get a const pointer to the guard. Simplify all
> users as they can now easily access the trivial struct.
> 
...
> @@ -191,35 +175,39 @@ static __always_inline struct fd_prepare __fd_prepare(int fd, struct file *file)
>   * was allocated. If fd_publish() was called the fd and file are
>   * published and cleanup becomes a nop.
>   *
> - * @_fdf: name of struct fd_prepare variable to define
> + * @_fdf: name of the const struct fd_prepare pointer to define
>   * @_fd_flags: flags for get_unused_fd_flags()
>   * @_file_owned: struct file to take ownership of (can be expression)
>   */
> -#define FD_PREPARE(_fdf, _fd_flags, _file_owned)			\
> -	struct fd_prepare _fdf __cleanup(__fd_prepare_cleanup) = ({	\
> +#define __FD_PREPARE(_guard, _fdf, _fd_flags, _file_owned)		\
> +	struct fd_prepare _guard __cleanup(__fd_prepare_cleanup) = ({	\
>  		int __fd = get_unused_fd_flags(_fd_flags);		\
>  		__fd_prepare(__fd, __fd < 0 ? NULL : (_file_owned));	\
> -	})
> +	});								\
> +	const struct fd_prepare *const _fdf = &_guard

Since the struct is only written by its initialiser, can't it just
be 'const' ?

David
