Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3A2364E9E
	for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 19:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784748997; cv=pass; b=gujHAekfPL9ohjpCaubOlekyvDNWyvShaU6lx3DRhtymH3kSnVyZyvoBUrag7JY+82D9Cf7dX99h5LROBTMnu7TAIZrMAoTGj/ku2vpW2pdKziBUUsvvl+SKky8TWQNHXwFVRvf+xbeGq9ET7mMfLN1TYYhl1+gSoUteeeyQw+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784748997; c=relaxed/simple;
	bh=EiJruLiXHTfayUASqh6hHsZKhodXxKj9AET02kAAvEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i9vEdEYlqiI3T3nwcz41bMwioaRn/e5KCbAXk6M2ujC+1HjgQy+W2sx21S5zJjTp2zxmaUXYdMyTNkobQij0JeOq6VN8W8zum/6F7OHbZft1lE+928MXbhKYTDpb0y3KyaXkaYuKDq1MkGxzIBxt2rbXVJpypPH3jRK+8qNjzk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mt+rTJbn; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mt+rTJbn"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cacef7d299so14235ad.1
        for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 12:36:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784748996; cv=none;
        d=google.com; s=arc-20260327;
        b=eWN07we5Xwvgn7kBC5oAZTvj/FUXkj3QkRdyYbjQu4oYCrrn9XB9HOJdkPU9FCAFtx
         FamckfC0UadlA3hok8FT6Qazft6LzSA7niWeRY/v9BOWuyBoBLqsqnn+nl4QldfxDsfJ
         oK8mOj6G7BPvw7ht1P+OnczhxRlDeY4SZ8EW2LxHxOVnxUDVkaZMK0/ptn1DqKuBU227
         jilfCah94EWWi4RuKkIUW4XCk267zNwcqkEWUuZTNcDSoT3jU96e9C/EeplYr8ZN2uTN
         gZqYL7PaKVBv8451Zf+RwAx9MKBwA1myp0t0uHXjJf2kg/HOmVIe5ht+bxWAVb7meyVO
         3P6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EiJruLiXHTfayUASqh6hHsZKhodXxKj9AET02kAAvEE=;
        fh=dSlZPusUycofQjA4HtMTbFjCkinFQeCaTDaPmexJCCc=;
        b=D9YtrcDxGIqMYVgx0L/Q6SOyyLVyvO4i8RQQp8Z7tActr7RMw5SOrhT7l62dCiMhHp
         nX+pp2k5iDdWTU5FdUj8iVIcilzu83rjNJavGC05oo8E27abYRcTIXBkxShcWtcp1L8w
         IN4LVxnRLuo43qlLZgIJ1HOaElXg72ErWBQcn9WB54bfbB4X8y1YnfTlBYQAaSG4C1RI
         9pSri8A1A1+vBNG7Vodeb2tVTpJ3avPHx9nZPYGvhAxq+vHhKyb4TeO4ZqCUx7ebTHcC
         FYOmevM45qa2a3FqQOUGZBkFexqUjH3kI51B8APO6MoV9AX0jZnU/NF9F+ZclrhQv1my
         bZcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784748996; x=1785353796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EiJruLiXHTfayUASqh6hHsZKhodXxKj9AET02kAAvEE=;
        b=Mt+rTJbneJ8KMDAOmOQFQIOfb3epyDddyOzbPUtq6ZCK6J8rffp9e9DyD0Vw9BKd4K
         GNOtRNtwrBz14vebfVOd/iK8mAhpIGJ0bBbfbkdd+YWvwfkRO7uMz+Ol+3MhWL7PKr+c
         EcYxZgNaZp2A2NhpcnM99xtimwpGXpOKk+sPVjxAjLPJrYDD5w9AD1koPWsrcoXeT+Es
         adsMLNuV7pmELIix1+vOswMMpzit83Ca6HDAMEJgzpg08M1LG3vGkbqa1p3wBAt363ok
         JJvS2z1c3Q+WDqUUyaWHfDoqFIKU971RKwwdOnMF0bUQdmSk7caDWWbhohURmKvwI/Rb
         7yDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784748996; x=1785353796;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EiJruLiXHTfayUASqh6hHsZKhodXxKj9AET02kAAvEE=;
        b=Bicy7I1/OtP9nCXtOxuRscPLdJVlGnUD6R1drdJ1gAD6UmZBBGg9V7xmuK24ljGsbE
         cOrWmIl1/Gzd9Y5H+ZNzrPM5s/P5xSE7YUliWtwaYTgTm/fxL42fms2dUmsHKbQEunV0
         ZVwTTky1lLKywYi40e9QcziMvM2Js8gGLBdEJSiV/FKNDrpNTg9GPkiCl7w4F6gfkn+M
         mbEu2JIObtaRhROdFNJ9QsiO6/75n/HyAhuJsCvc/p6vNSeIU8w+IfSPdwCHYRrD675o
         IY9X6YGV74puzssL1gZAQtyiPNwLRMrfiBFO4xUhTm1JWBaRDNz89ftU5X+HU8rmUYfG
         8A2g==
X-Gm-Message-State: AOJu0YzoX+W21J8uQ8c8oaBy/Tre2M0v60uAal1QbyvpDfPQn1XvXFF1
	FmFVLDyOP5lKr3wCIQz7GXxjhfZi9+wpEq7RR0ot8jlIl91nwBEBRZjgJ2ddn0a8jH8mgdvOaeP
	NZxVRMnoKMtWbaGvHBob/X6OLG/PmNipAvyc77xqKQAKPA9qNJns1ZYsz
X-Gm-Gg: AR+sD10mvKM50NQMP9s53AwHkqyBOjsa3BkpITPPq3OoY0JEdOvCHoc4+porIQk8cRE
	owRgn0HiBhi199o2h6QVNlYgFB3wF6qZ854QWb1IpkiEzZ5vo3kfjU66txemfWpw2kv5dBrX8i9
	BP/5qr556Qt66oQ6NVcfBwDeg9yU0bXnOw6KJm73dqE3bwOYjy/2KP/9aekcjqtyBuAtB7PbWLc
	0NrjpI5UnErO07ybMn+mPSMo0YbB4Ra9NueiNhqeHwl3DzyqBQwntNRFfOlV5ex8diYsj+xmQCL
	I5Ek4kPhsWQUgYzS
X-Received: by 2002:a17:903:1aaf:b0:2c9:b404:b55 with SMTP id
 d9443c01a7336-2cfa4ceb478mr1045345ad.6.1784748995228; Wed, 22 Jul 2026
 12:36:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1784726895.git.asml.silence@gmail.com> <29bd4fc069bc89691868beba0627ffbe570c2722.1784726895.git.asml.silence@gmail.com>
In-Reply-To: <29bd4fc069bc89691868beba0627ffbe570c2722.1784726895.git.asml.silence@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 22 Jul 2026 12:36:22 -0700
X-Gm-Features: AUfX_mzcuelw9SCeU9LLkBiRe_JuM68jGvxrXASgyh-gCe9WcYipjorhBZQSx8Q
Message-ID: <CAHS8izPxL_YP7jrwGESHpcEQChqYo-ehNr4_RygcUbeHBF7D9g@mail.gmail.com>
Subject: Re: [PATCH io_uring-7.2 2/3] io_uring/zcrx: rename ZCRX_NOTIF_NO_BUFFERS
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: io-uring@vger.kernel.org, netdev@vger.kernel.org, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 6:50=E2=80=AFAM Pavel Begunkov <asml.silence@gmail.=
com> wrote:
>
> ZCRX_NOTIF_NO_BUFFERS tells when page pool fails to allocate memory from
> zcrx. "No buffers" could be more confusing, rename it to
> ZCRX_NOTIF_ALLOC_FAIL.
>
> Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>

Reviewed-by: Mina Almasry <almasrymina@google.com>
--=20
Thanks,
Mina
