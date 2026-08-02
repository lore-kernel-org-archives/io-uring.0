Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EB43C0619
	for <io-uring@vger.kernel.org>; Sun,  2 Aug 2026 16:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785689643; cv=none; b=ld1YVAEH8JT+xPJY+xsTTsXMS9qqh3hIJpLZRmkymL5tp1WXzNfBlm2hX+ogOOCMEnbxbd8r1GWsmXuURGozVJX5f+HESGS1RRYC8Iq6/uOxYdG7C1NQhnIOTndgLvp9LbCn6PBL6B2oGXNpLRkJJ1Oejdq1b9poI+GzbNmeHJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785689643; c=relaxed/simple;
	bh=EJw+kTqGRkMI61bTiVUY9Hf2nYqFmqoxYK+qvW10i+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EWjhaYgYOOZBZhGKMi96f6DIMsrGxXjXwlXF0ZxiiOVMtes/p2oANnXUag6PPmGwSwt5XP41wr16Whq/Z0XNLTF552QuQjbr8hAPGibTSvTsNzNTqEyniqTYGBAGE9x0Qrx9zsIvSrMeX1ju1XwUlOK7ZajrKWpNHRe2qc8ejfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ez3dR+UX; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ez3dR+UX"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a8d251so2568569a12.1
        for <io-uring@vger.kernel.org>; Sun, 02 Aug 2026 09:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1785689640; x=1786294440; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+ZFmCOwSHVd+Cbwlj51Z7I8+fcWBII2I+8HftB9n3k=;
        b=ez3dR+UXspEQ+QUQNFKT+E0luRC73ilbCQUVaDaz/swDouJovnVLAARX+vczAEdvUP
         QZNoUIX+jW1KHjfKCj9yDMP0Sp/lYZlJtS1dbjTiJSqGhsryJ452TkYoaHd9p1BtIdef
         z6J71gxuE6PRrY9c/NXSTEQCgthbyHLOxbc3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785689640; x=1786294440;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v+ZFmCOwSHVd+Cbwlj51Z7I8+fcWBII2I+8HftB9n3k=;
        b=dhjo73qZnVERQbHDZjXig6K3ETIdtS2IKPGT9kUs9eouFf3IOxb0fvbJ6kPvYxIJ12
         n1Pj169mk/KemfC2rTiRIfEA90rTkpk85VwTSZJHo8DaPZqkEz9C01FT5ae65eUHWd6a
         pP/8B775hD9B4FZjnbkMJ6fZZRSgRdFLvfkahEuaH3nIGLe7dglmEgcBTnCTgAGokBDo
         tNhkh4O/mE8eJNcDHO3Oo4mhXcuXp9hDriImNszKGuHVd1GfwhOX+BNWV47FXj6FWxqD
         mGZccvYzP6VOH6bAzjz0d2Dd6MY6KbDlcnGm5ltSqba2BuyK3Fs8Y/d4X8Jk1iUT8b6P
         38uw==
X-Forwarded-Encrypted: i=1; AHgh+RqEiqZMRd9LSmWyI/UfrSBox35Ileiby20TtSZm9XEZRG9ROxIj4ovhK3ZR20KeI4N466qfFTJ8Wg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsuiq4fCyIzq0Tvc3X2ucWw5QpEOGrgvCfKz2mOKK81ds0we6B
	Aoo8j+si/sqLOAC+zG1hQpCK3i9AWaqHDQBKAg74SUpn/+yvGWN8BjSgz9cog96ZSuXCJEcPWP5
	fUs24M3w=
X-Gm-Gg: AR+sD12lrhJ3knIdoKZCrORIkKiwCvXMH6cHwFmJ+WMbrG3dOassKKo+CAuHjA+B4Wi
	dl7NRJpgxn3XCXP82r/2k767fogfFmUrAv69+LbDVpjIKkcJtNIgek8e558fMBXoDNdSlnk52G2
	S3O6NzZ+NrWE5bHcqsaMEwM01qnHx18caRuGcrGqG+cPPB+ob9zAKgXQ/9iYGjVPelg/MlQblLz
	pKxnwKTQJ9dxyYdCb1bg8RASMZbuKBCRg/cPAXq1Ux4LObEEUOfNrl3WNT18QicSGMxZ0kYKxvZ
	WCkXEHGiZcnk3JpCSP1Ztnpxc0BSJn7GdmvFcP6qY4bX+BrdeF6aQ7G3NC3kzxMRUEhOW+X/EuU
	KJc7CgtRHinNeId003BdmlotmjcSpyv1lEYRuT3ILcbQaVFbYn4zO8733clwtsjC8YNW8vqOt8/
	T/UeEyFM6Bh8Gde8Om2ysALBDkcQE2t54PzTs+6kjRIvZrdRiDZHMcUpZyBeyrZWvYCpsrUNR6u
	wbplg4bua40ERMzpYqT2j3iqT+VVe+fALLaWg==
X-Received: by 2002:a05:6402:44da:b0:69a:b38d:403c with SMTP id 4fb4d7f45d1cf-6a0a7c6b782mr4436818a12.7.1785689640135;
        Sun, 02 Aug 2026 09:54:00 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c01f7b8sm4344218a12.0.2026.08.02.09.53.58
        for <io-uring@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 09:53:58 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c1c4db7ca93so341971166b.2
        for <io-uring@vger.kernel.org>; Sun, 02 Aug 2026 09:53:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqjIwa4SEztsjf4BzZK4rKP4vrPgN0U6QHegz8em4kj5oT8k8nRI/hdYMERvyytFaJs1Fjq9vLPaQ==@vger.kernel.org
X-Received: by 2002:a17:906:369b:b0:c08:417e:3696 with SMTP id
 a640c23a62f3a-c1fe7f3a249mr466563366b.20.1785689638268; Sun, 02 Aug 2026
 09:53:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <amtbpwrhlNGJ9OK6@redhat.com> <CAHk-=wi7EccGaeo2Q5mdcvcQJ8VX7tcJWW2fHkg6vfmHGGX8AA@mail.gmail.com>
 <amueLRM-DrYbnjLn@redhat.com> <20260731-blechnapf-arten-blasorchester-4e05dd1b2c58@brauner>
 <amysHlZp6f6q498X@redhat.com> <CAHk-=wg_PtU66p4iuvzCz13P_cDCfKg2OOuV-v6wq19ua8LyvQ@mail.gmail.com>
 <am9an4HWPGaxmbcK@redhat.com>
In-Reply-To: <am9an4HWPGaxmbcK@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 2 Aug 2026 09:53:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgpt2ePzDA7Gt4JHC8uzEsi6A-3V3uM1nZO062dF_ayMw@mail.gmail.com>
X-Gm-Features: AUfX_mxTQvF14UVk0HG1pOG_w4PlWB0b4XtyzIl4-tkWu-7XIakPiTTRXj2tTxA
Message-ID: <CAHk-=wgpt2ePzDA7Gt4JHC8uzEsi6A-3V3uM1nZO062dF_ayMw@mail.gmail.com>
Subject: Re: [PATCH v3 0/1] pipe: only enable the extra wake_up(rd_wait) for
 edge-triggered consumers
To: Oleg Nesterov <oleg@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>, Breno Leitao <leitao@debian.org>, 
	Mateusz Guzik <mjguzik@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Pavel Begunkov <asml.silence@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Alexey Gladkov <legion@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 2 Aug 2026 at 07:56, Oleg Nesterov <oleg@redhat.com> wrote:
>
> Will you agree? Or should I tweak the comments somehow to make it more clear
> that the only reason is a user space legacy bug?

Those suggested changes look fine to me - together with just plain
commentary about this whole thing in the commit log, which it wants
anyway.

            Linus
