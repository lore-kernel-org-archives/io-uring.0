Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DE94D6C2D
	for <io-uring@vger.kernel.org>; Thu, 17 Sep 2026 12:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647770; cv=none; b=czhAAOKuphHut/VVhjED7MeWMdV8UHb4HdyM3yJOFG/JQ6/mk+nXykRFkc178Ws50qKY7eZNSemm5OfiPY+eyOC7JM4WMyIblAG73zH4VCn7kNraQ0BiJiVRtK6dblmjjeQ4P6RnYRW3A5G6HZ0E4pvPo9USsPI7pOG6prBrHb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647770; c=relaxed/simple;
	bh=OJmskDiFOgBotmQnXQAOWrnTyjAq3r/ZPkOzXCktDOc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gC2Adv2aiRP+AWD9KeF0vPmAPNzEHI37t8eGCIkncPk45alNS2L5Aji3CI+DWxClXrRu3slazlfC+oB93eDtSaifZLvQ5wJSZhloIi7eTgllJ14UPe6AT+6NwCe7Mb5WY5JGg5c7vrA5bsvFFy3m118ScmtONJUmZ8YuI01zxXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8MWUiGW; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8MWUiGW"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso7274935e9.3
        for <io-uring@vger.kernel.org>; Thu, 17 Sep 2026 05:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789647757; x=1790252557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p0zmU2W+3BnffNO8O4v0JPRgPOvlhktXL05mpLnU1xo=;
        b=W8MWUiGWkLnPE3LZwZMs+M6hjewk3bifMXlRxyzDreqvti1vU2oOe8kuHIJilh+a4j
         avmi0gE2ouNHVuMutBqsR46ibWdW2hMSUIg+O7ewEblQDSqXn5oywiAzmcEOAAbnHJh9
         CowIX7j0Z9oM0FI7AJhmCimPMAgxALlDijVAFCnLuHoqmAoi4nozpd09gBGC/BiDrVMP
         v8CWYPOQj7wYPLWd3xvspz5rrIP7ZmsQlXq/fr57voEYreoEfZ0jpBHODcwFTuLtahTp
         5Ork4vvRYVxbjDbbXem88rlm5er/r+K8QtAMln4o0OqF8zBcjtvMGd0fo9MP/8kOij+L
         7TVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647757; x=1790252557;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p0zmU2W+3BnffNO8O4v0JPRgPOvlhktXL05mpLnU1xo=;
        b=BST74MmnKoCQu86YIRiR4PfPi5mV6aQaYfTH/IOoZztBsgP698jYl6KbqRYzhhWyg2
         jsI1s8LB+Utdrv+NYjc7XAGgo404Ig6p0Z+emRnHP99+8P++1fK1dl/KRNggLIZ7z65m
         WK+3em0iiClJqZBmi2XHlZMJlyqN36o9mkdeKRFWpCl59SeBbIxwYRszfzmhJ3EuxQZ/
         s2l5B7FPiowgIRYh/QkPpx/qHcXojfT5r8QPNLZYyjwdIQ/DX0gN6ZaTG4q+Nm1M2srX
         9dAQwtQFcpL9Zkd2XXeNYtE/UOHMZEu1ZgwT+sdhtKZ1vovypfSp4f8DUpm+P2QJ/2Dg
         c74A==
X-Forwarded-Encrypted: i=1; AKwUvByGHPvLyLSn9Qc1AGPmpQ5QCUnx1j4oI2pBGEsVaxjFIE9l8H9ahhNGOHpMR4yMg4PDGBaqYWq0dA==@vger.kernel.org
X-Gm-Message-State: AFuF++mco7kr2oKDzuAxkdLO8k5QXDEY7SgEKlfM6YO51JTg16v2kXkR
	tPY4AJOPK+pZfwN8zzDn8Gzoggme2nalVzzKEDG+ZI877sY7HPhepf++
X-Gm-Gg: AYBFou1VmN6ILqJY1q4a3nUhKAo40RHWb0nMeVNKP6Jyj9dD/M8QN8BAlfyCE/ktBNr
	BxjVVt05wyQoE0RYX/DxBXizosJVGxAq/XUk8bx8gZhzOAT09/u0hMW5BvL/U3j2vW7MSsjNUq8
	P9Amxmg49HqqVowTeYVYQyYruJ/CY8P6CPuDdLwUDcjivwooJ+gHWHKvlrIx4nG5f2yiF6e7TNs
	9N1ts3YJR3DXpybdIjY86c76x2Kc69IjLsSNDV6WYsmDzLGl8K94i902Aj5rzI/T5Kdf2MnNNpd
	yawLGlOkKnIDGKohGeL4XPytBDBdNbVQoN32JDrAyYQjAiHiSmDC20o4SpcmgUHjhJCzfp0BRgo
	F90WmpeBIA4IbtrovHGWDUDHKuqrfzeH25zmncQYys5Yu2PNiepUhf0Xs7uL4aNsvBrEYmv2UnE
	r0I7w4YFnsVMkm89oaBLv2QGf+7zB0niM4AiYmVlSoKPrHxBH0ibImrLRX8pER8VVg1gnzzt+Ja
	XLybZ7liOPRXN/2ilpyTIScNHLkCdo7mtGE
X-Received: by 2002:a05:600c:4ed4:b0:49c:de80:b833 with SMTP id 5b1f17b1804b1-49eac462571mr73688225e9.2.1789647756735;
        Thu, 17 Sep 2026 05:22:36 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7678sm15969081f8f.2.2026.09.17.05.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:22:36 -0700 (PDT)
Date: Thu, 17 Sep 2026 13:22:31 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linuxppc-dev@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, wine-devel@list.winehq.org,
 linux-xfs@vger.kernel.org, io-uring@vger.kernel.org, bpf@vger.kernel.org,
 linux-mm@kvack.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] file: declare the FD_PREPARE() variable with
 __cleanup() directly
Message-ID: <20260917132231.26314015@pumpkin>
In-Reply-To: <20260917-work-file-fd_prepare-v1-2-b87534ca49f3@kernel.org>
References: <20260917-work-file-fd_prepare-v1-0-b87534ca49f3@kernel.org>
	<20260917-work-file-fd_prepare-v1-2-b87534ca49f3@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Sep 2026 11:09:43 +0200
Christian Brauner <brauner@kernel.org> wrote:

> The whole CLASS_INIT() detour isn't needed. Use __cleanup() directly and
> give the destructor a private name.

It also makes the code enormously easier to read.

David

> 
> No functional changes.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  include/linux/file.h | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/file.h b/include/linux/file.h
> index 2b864f457211..926cc58d0b7f 100644
> --- a/include/linux/file.h
> +++ b/include/linux/file.h
> @@ -146,9 +146,6 @@ struct fd_prepare {
>  	struct file *__file; /* do not access directly */
>  };
>  
> -/* Typedef for fd_prepare cleanup guards. */
> -typedef struct fd_prepare class_fd_prepare_t;
> -
>  /*
>   * Accessors for fd_prepare class members.
>   * _Generic() is used for zero-cost type safety.
> @@ -160,7 +157,7 @@ typedef struct fd_prepare class_fd_prepare_t;
>  	(_Generic((_fdf), struct fd_prepare: (_fdf).__file))
>  
>  /* Do not use directly. */
> -static __always_inline void class_fd_prepare_destructor(const struct fd_prepare *fdf)
> +static __always_inline void __fd_prepare_cleanup(const struct fd_prepare *fdf)
>  {
>  	if (unlikely(fdf->__fd >= 0)) {
>  		put_unused_fd(fdf->__fd);
> @@ -199,10 +196,10 @@ static __always_inline struct fd_prepare __fd_prepare(int fd, struct file *file)
>   * @_file_owned: struct file to take ownership of (can be expression)
>   */
>  #define FD_PREPARE(_fdf, _fd_flags, _file_owned)			\
> -	CLASS_INIT(fd_prepare, _fdf, ({					\
> +	struct fd_prepare _fdf __cleanup(__fd_prepare_cleanup) = ({	\
>  		int __fd = get_unused_fd_flags(_fd_flags);		\
>  		__fd_prepare(__fd, __fd < 0 ? NULL : (_file_owned));	\
> -	}))
> +	})
>  
>  /* Do not use directly. */
>  static __always_inline int __fd_publish(struct fd_prepare *fdf)
> 

