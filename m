Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794658800;
	b=v2xemR+6byQuHUJ1wWpo/nEcCRwPdYUlUmGCbmTfNu6JuRIDvd4O8nNgFkqheYNIjzRt
	 nLybFm6KCAKU0+rSokDcZtTgZtcsgp9RCXUuVSkLNBnzkAzFG3LCglBCDh3CUW8BLLXEQ
	 UypmujiYKEodl3Vpkw/baoWKLAaf1sger8+iVZBLQlJFCyrNaxydGhvSPkExGWlHB56Wb
	 eMr+ylnZUi0QNrRo9qNx9eREyOAqaBowEGtjZIFnmKj0i+ujU0JUkzp3wG6z+wFaF7ywJ
	 d7B/A+AP30Ru2N1Yf8pvY4W0EKTujC7+ikFAd0oqGUJM4JdZHCCr4Sd2ZUM6dPoWP9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794658800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=nkM3J4QAu8kIsGHpB1EKb0NRF0JxtY2T/gqGpQ/nt0Q=;
	b=hxrCvPMkspx82QBsdfoclmDpU5PU2LhbZsLWx/JIUDd+bNNmTjVvI496TBNl8ErzPj8L
	 T5i565eOIoEqg09bdjj9bMtJ6Y7MRvjquNTw3lISuPUUea+MOfAPMcc5W93BIIztzgWTe
	 IGaZo5Y7yFx3nlbE/g0SVIhgx/a5bLdgfcgTTWuA2rbkWXzQXCoXxg4jaopeTDa5p+1PK
	 g7+tVw7AkUyYfbG9M0ZK2urdiXn+v3PZ7iEdFe0ndpO16zDkiofRnrWgPdKZfoT3f29M5
	 vanAmKY92uiQ+QJXOyZVxpL1gvy2NipFL6HHJ8nXNt8KVbLVfNLdgJ3b0yYHMUO9Qiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zvg2B30u;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F42606A339
	for <io-uring@vger.kernel.org>; Sat, 14 Nov 2026 12:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43F42606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zvg2B30u
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c169ae1cb26so387165866b.1
        for <io-uring@vger.kernel.org>; Sat, 14 Nov 2026 04:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794658797; x=1795263597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nkM3J4QAu8kIsGHpB1EKb0NRF0JxtY2T/gqGpQ/nt0Q=;
        b=Zvg2B30uBzOFFo54OpfHCzqSK6TOyxTRmwNZV7t2nfrBwunaCrRH+5tI09/jIosXZS
         GdYk6iMfyO0nJ3moVzjaSKnXCCWxcV1Ye+R/4YjiwdwGG8ofIv4PWH24MjP/VV4CkNiq
         nSM7j6UNEdEDdNWpjUjn43q9YL/wt1IFltOrsPhL2VYrn8g/yyR7Uz6PFelA0j1tolIT
         QTqiv37OCVMy+5oEwlNBsw2cKiejzgZGAC7AZW2QPAu9cR2dMcfIteYf8vq02JyCIN53
         /PYiFz/vA+fp7KPo0fCiRfu55fCeLd5qLFIcUMGbAUVH1mkivaDzQTprXnn5n1PDT9pn
         6ZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794658797; x=1795263597;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkM3J4QAu8kIsGHpB1EKb0NRF0JxtY2T/gqGpQ/nt0Q=;
        b=OboerjEpCTHUvsskcNXifb60anL7xCVJnCGpjI1ze4BsyB8QInLDac7WXn37JJefMK
         UcfJXSfjQivHp2ejqjzZmyYPKdeUVXWUYDqe4sjzZ0AUcVMj1jNn7IjQhBt7IDffnoiI
         yqdXV/mUWw1qqLeHCSzPptxtEqE6oj5gOe+P4Y4nWao1JtiSb+ex8LGr7Tk36eMcAaKg
         8vJHfmjpPVKS4iycYWIHAAXN25sDsu8fo4Jc750ie6Y2SfJIim5+VBQ5M1N4jvk6t0kG
         R4W0nqj2bjv1jGhBnPUIKs6nhnTY4pzXnAokxuHFktuhntMZt6qqPmRRSalYdzz/LZZ/
         gD+A==
X-Forwarded-Encrypted: i=1; AL+hErEEWbqzJi3Q2iyEBoormMBBu+3RZmNnqLpMC+tnwQTaq1KrPSJM2BqtZ8CWibQmMi/fpFMlADM10A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+BYj//2KfBxC9zLLsZdO43aJjs1Fl/hgn+LiZJaK4Hy7MIUQd4
	Vz8h2ULHg2Kp3NpVVhBXhhnKvU7Lq2IzPf3oTNubh985kd02v+aOpv+W
X-Gm-Gg: AYBFou0xoZDiw2sZDp5PNs3q2KY9dkhD+B27mGIG7MM778oEUpbONhdBfJ9kxJEN7li
	oLBMYV/0WlPiIgS5s/xirtWEgpQ/+gbjV2K/+xB+hA1lwNbQc162lD+oBg/mSm3XjDBivrzR92+
	8VaFS41tlTsHWF8eZQvXSyy1DLR+O8TOWa0NfWFf9pifwxd1rS+oRhTixSijrTnMZSN/r3qYm3e
	ALCwevcCun7Vk7NkpbCje4W8ooSFaxBObO6xPU455xdr+5dtsb42LvP3WShuqo7wu86eMCv9zJy
	EG1KXz4ims5O8WdCj9SiW87JtrNMIsDWMgM9qkMJALf2YAJpH2Fb5KKawMaV+lscuvYqponKdLz
	NjsvN/tzOLDA8/k912fK2YX1WgIg3+qEpqYmqGGMoXYo7S3E10NtIFV1vYJGYeDo1y9Zuaykh+j
	wpx6xUhiA47cEK59EMHM4iiuc3pTYLP58zauXCFvmZwSPL4N5RRAjSEk6X9Cr8HqghnX4afnQoL
	+5PhiWX2YqksJBXsnghL8350iGBdJZ7MELGj+HyhjT81bffQDDb49IZb3YEO2DHohg3bkpfCW+p
	UzXnpJZNAzg2mYKzKctk1XzouRnJ0XFVI+irjn4Bz8pBCrq2A5zWMnBRdqi2j4zjCyPHanWvdip
	u9yjXX/s5/Rqh
X-Received: by 2002:a17:906:1001:10b0:c41:4512:560d with SMTP id a640c23a62f3a-c5096387b02mr309942166b.16.1794658797424;
        Sat, 14 Nov 2026 04:19:57 -0800 (PST)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b5ac2asm211518966b.55.2026.11.14.04.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:19:56 -0800 (PST)
Date: Sat, 14 Nov 2026 13:19:56 +0100
From: Amir Goldstein <amir73il@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>, Shakeel Butt <shakeel.butt@linux.dev>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jens Axboe <axboe@kernel.dk>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org, linux-unionfs@vger.kernel.org,
	bpf@vger.kernel.org, linux-nfs@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 10/12] ovl: take freeze protection when storing the uuid
Message-ID: <avhR7DbNbVDCyPDO@amir-ThinkPad-T480>
References: <20261114-work-fs-frozen_writes-v1-0-f5ae61c898b1@kernel.org>
 <20261114-work-fs-frozen_writes-v1-10-f5ae61c898b1@kernel.org>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261114-work-fs-frozen_writes-v1-10-f5ae61c898b1@kernel.org>

On Sat, Nov 14, 2026 at 11:47:17AM +0100, Christian Brauner wrote:
> ovl_init_uuid_xattr() stores the persistent uuid in an xattr on the
> upper root. That happens after ovl_make_workdir() dropped its write
> access to the upper mount and before ovl_get_indexdir() takes it
> again. So a freeze of the upper filesystem that lands in between lets
> the mount modify a frozen filesystem.
> 
> Take write access to the upper mount around the xattr update.
> 
> Fixes: d9544c1b0d9e ("ovl: store persistent uuid/fsid with uuid=on")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Thanks,
Amir.

> ---
>  fs/overlayfs/util.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/overlayfs/util.c b/fs/overlayfs/util.c
> index 521717209b2e4..67aa7b71e9c83 100644
> --- a/fs/overlayfs/util.c
> +++ b/fs/overlayfs/util.c
> @@ -829,8 +829,12 @@ bool ovl_init_uuid_xattr(struct super_block *sb, struct ovl_fs *ofs,
>  
>  	/* Try to store persistent uuid */
>  	set = true;
> -	res = ovl_setxattr(ofs, upperpath->dentry, OVL_XATTR_UUID, uuid.b,
> -			   UUID_SIZE);
> +	res = mnt_want_write(ovl_upper_mnt(ofs));
> +	if (!res) {
> +		res = ovl_setxattr(ofs, upperpath->dentry, OVL_XATTR_UUID,
> +				   uuid.b, UUID_SIZE);
> +		mnt_drop_write(ovl_upper_mnt(ofs));
> +	}
>  	if (res)
>  		goto fail;
>  
> 
> -- 
> 2.53.0
> 

