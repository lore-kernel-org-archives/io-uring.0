Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795222228;
	b=yO2bKUpxx8Yq2uQnoCoSAaLRnaLl+PCtzmUoVvkmILBv7LC+O5KziPrPQ63Z35Uj4Qru
	 ywgzP3OLZ/AQuK9LMPfEWjx0TYvMEDr91d/FanmceHt2lXVKHETUH2K3qecfuw+QNoLiY
	 ZIJx9jeuRyBTS+QBcB5WG7Q6ErbPmCJMDfK5K89A5OSBEzHeG6jOgW4xILXUx6ssUzGNL
	 5u8DVeja4lnRHzU0Qd+REiPfJaS2jCusceZxXzX9svYNokf0NcJfFFVBWbfsYtjacPoly
	 1DAfcQekkyTLS0yAa/wKlQrf3eOSdx7UpxBpj6/unS9uZCUfxU5u/qGphJbXseyKdzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iqTE5jp3Bza3ytzjTemgIJyEzZnCoev1iwuFO5Yvh4A=;
	b=A33KeO9R7JU4NOKpScqM1EHEzy6i3mulPDstm0ER9OoBBWY49MPyL6IVRnxfAET4Ygrt
	 mSLVARVK7PqRmriyDrf161iwfAzwfl2VU+rSbHLdEdawZj3rFG0FiJTb6uBAoM4Co1JO9
	 GaMpv8wWihqBkmm1ouUg7RfaEgUw87uyMComTpp0awmt6a2BIO1UObOKaMlNYaTZJ/bqA
	 INBhQS8u5x9EEShLTQbc5dyqZYkQUhmldfFvGQTwCekT8WM2xo/Vevyj2TRystrE8NitW
	 UDKXzgvMl7eIiJ1CcEaTTpjKCPTMl+z1sjDDYZpubimCnJBXMiso6J/9W8pEKWYcanw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WTl7g/ki";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D94606A699
	for <io-uring@vger.kernel.org>; Sat, 21 Nov 2026 00:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13D94606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WTl7g/ki
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b87a240de3so1792933a12.1
        for <io-uring@vger.kernel.org>; Fri, 20 Nov 2026 16:50:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795222225; cv=none;
        d=google.com; s=arc-20260327;
        b=phXAh9oXYRc/tCYX2dNvnMfxdOJpFBuiwTENzekZ4GaNT7GCrE6f6XvHC7J9X0WN4U
         81oyrXVDUfhjSwkkgELm3R7LdjLgjVR43u8snfVgcV4DuoOxWIpDlsMjcIaBnj6Bg2pa
         0ump8P5e2eAQYCRLmvItx/K0el3/dBnusWKkNONon1srRmQRquq15sGP/QILpts3L101
         gdbMN/oZcsGsStyWGsAAt5QFALeJCc0jh9GGcxcRuEH9Vrwq0EK8gMpNoLqHwLe7IVCa
         O5XmSo+FxErQ0l7TWlquDfzeqdUC+cPEVNE9C0JCYqxpvY8PdPx9mFsOL0JELQkntQ+i
         UggQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iqTE5jp3Bza3ytzjTemgIJyEzZnCoev1iwuFO5Yvh4A=;
        fh=CvC4D7U0/fIjcy40E9CciD3Yc7wCajfqQHV62gWfeCQ=;
        b=rl9eJe9naqBN2Xp9ZvX7/PdlsM2dPVZ5XfnYTK7dfR+23y9jd7kVVpDY61PuUVPF34
         /Q8S5MgydsQpOBCXJQQfwoT2xPzM8EsdCFtwNfLzk0f1cTAfke6zKQEphWRJLLG+k9U7
         h3kiU1jUcEpoS54SrcwZhe3gn7MjVHhvlM+03Xuw7MufwyPDlPVBBw321UQxvl1mEz8K
         bikYh34w4XqVhauwjr0aC2udpyQiwP0NQJ75Ow+FLelcsOZivtVKkHCCLARU87+L+YwN
         anipcTAWVFJy4UqHM6ScU8T47/vLyVshPoqm/+l9WLlwJgKGPtexdplGJDZiY5RrMqCj
         I4Jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795222225; x=1795827025; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iqTE5jp3Bza3ytzjTemgIJyEzZnCoev1iwuFO5Yvh4A=;
        b=WTl7g/kiy+SOUYfbzX0gVDtVMdqSpTpX18xebz2fUY8n6zqvVwNnd7y+UhGjMuR86k
         cbBBAl4Rpjn6TgWuytsVnV9y1pfCHcReEcGN0INj+2J34WQawjFxCu+7pI5Xn+OV1RvC
         VZoP/J823WtANbDMRZ+RXWZqYKrIOF4C3keyH5BuCvxJQIQ+EFG+VurP/TTLLDgY+rar
         0ahOXRDeBV7sZDRHVJFPYTnOdOHenegMPKqgT3M6Ya9mpyUXzl9ErfHJJXqFzGPiyq3l
         5d+E5nbD4Ren4Dl8RmVCPJr8TsUHjDofxDm42/ykusSAD2yKZC0iEVr79wou5/0ssowK
         2FYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222225; x=1795827025;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iqTE5jp3Bza3ytzjTemgIJyEzZnCoev1iwuFO5Yvh4A=;
        b=JPk5CF28tHcdSYjGJ6huxnZW1IFbm4n6Qq2q0WEsgpPoITs0MM/bf+Oyc4YQ/8ejfS
         Avkr3dlTa9BshgUntyl3D8bMxQ9/CbIkXBm7ElO2AHRVz5yVrYbaf6gkaSYY/1Wi4Gcs
         EPFwiiHfsaybn3SDEaaDD1a4dLHZyih7kGcTOp460JxC30/6nUu/FVraVDiYzELmFMZW
         71ymUcWr1tj3YCgteAeb0pJ0F4urKpzt53G0DuyFLyLdFPNXffjqAzClx+p9sVqz9ZSD
         qlwYLM1DAccxUwmZ8ttURwEAPSnJ9R6C7KyD2cTXlypzZEPbDGUd86QxzuVVRuMrGDlM
         AuhA==
X-Forwarded-Encrypted: i=1; AL+hErHIFiJoU3g2rPp4nWyuyVGl4zV3yr9Glal97DwZasHKTassuS0f2rPoijAy9PjZkIXMypMPwzP1HA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8wBQlKDrUJgcovsXmQJxmAWPe0Pnf5HObdapUXAVdazUKGPkkk
	vdsfqwAXXxSCzrhv0PB5pByTmIFrasLtYe0xB31SnR7PCFkkL09o6WC/UpvYcEtUX0AsQJAdbMz
	ggIFB/RsBvopfAOJrLlNGJo3YJRYnkHA=
X-Gm-Gg: AZFdTZe0Jo1zj28BkdUob2duL7r6eQyK0X8rKA0RrRnly7mvSbaj1UJ7opKOIAw/1t6
	OZOccLeEBNCNlV35037uf8opWt2KPYS/CPV7DORgjn4MYLvRN4ImVzi3Yi2zYTGxnvkHJzpGBY0
	QO3Fo1v80ub1QhY/xAy8ybFrtK/KhxVjq5eQEeRsJ8KRQNOG3AzDOmn/b3Lb9rkH5eFpgbdJ4hb
	uT46n78d0h4EfLmzeQKoDgjPYl2FZtT3AOje/m4DwS+uxnWhfaWwEXE8LkMIJgH1DRqq9lCWXi6
	VQzrbnFrPnbQBExziWV2BkNWeC22n6D3+tCnJUjL1xzop0DqH3xDIl3rxXe5wgicthUO7VCxy3R
	YoD2YR7GdeKOJACShtYkzwlXxUo1ZyT6jiHZtkirJ/Hx9oaCtRzcoPwPYbnoD
X-Received: by 2002:a05:6402:2046:b0:6b7:749:4bff with SMTP id
 4fb4d7f45d1cf-6ba37e81887mr2868207a12.26.1795222225243; Fri, 20 Nov 2026
 16:50:25 -0800 (PST)
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121003356.290201-1-technoboy85@gmail.com>
In-Reply-To: <20261121003356.290201-1-technoboy85@gmail.com>
From: Matteo Croce <technoboy85@gmail.com>
Date: Sat, 21 Nov 2026 01:49:48 +0100
X-Gm-Features: Aa3M54riaCEWFwXTktSbfzqeuT3IodXupdwqKrEwzt88Kf_vZI7TBflZsHqS66s
Message-ID: <CAFnufp2uT0D8-5jw3DLhQzdfpB=eSuzhmGdmDqoB7arExaw9jw@mail.gmail.com>
Subject: Re: [PATCH v2] fs: shorten I/O that would extend past the maximum
 file offset
To: linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Ding Feng <dingf3ng@gmail.com>, 
	Jens Axboe <axboe@kernel.dk>
Cc: Paul Eggert <eggert@cs.ucla.edu>, LKML <linux-kernel@vger.kernel.org>, 
	io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno sab 21 nov 2026 alle ore 01:34 Matteo Croce
<technoboy85@gmail.com> ha scritto:
>
> rw_verify_area() fails with -EINVAL any read or write where
> pos + count would exceed LLONG_MAX, even when pos itself is valid.
> Such a request should not fail: a read should return the bytes that
> are there up to the maximum offset, or 0 at end of file, and a write
> should write what fits and return a short count.
>
> This breaks ordinary programs that read a file up to an end at or near
> LLONG_MAX, even with ordinary buffer sizes. For example, dd fails on
> the last block, where it should get a short read, and cat fails where
> it should get end of file:
>
>   $ truncate -s $((2**63 - 1)) hugefile
>   $ dd if=hugefile of=/dev/null bs=1M skip=$((2**43 - 2))
>   dd: error reading 'hugefile': Invalid argument
>   1+0 records in
>   1+0 records out
>   1048576 bytes (1,0 MB, 1,0 MiB) copied, 0,103536 s, 10,1 MB/s
>
>   $ (dd bs=1 skip=$((2**63 - 1)) count=0 status=none; cat) < hugefile
>   cat: -: Invalid argument
>
> The same happens on a 100-byte file:
>
>   preadv2(fd, 200 bytes, pos = LLONG_MAX - 50) = -1 EINVAL
>   preadv2(fd,  50 bytes, pos = LLONG_MAX - 50) = 0
>
> With a large count, the range crosses LLONG_MAX even far from it:
> splice() of a 20 MB file with a count of 0x7FFFFFFFFF000000 fails once
> the position reaches 16 MB. sendfile(), aio and io_uring fail in the
> same way as read() and splice().
>
> Files with FOP_UNSIGNED_OFFSET, such as /dev/mem and /proc/pid/mem,
> have the same problem at U64_MAX, their maximum offset: a read or
> write that starts below U64_MAX but would end past it fails with
> -EOVERFLOW.
>
> Add rw_clamp_count(), which shortens the count so that the range ends
> at the maximum offset, LLONG_MAX or U64_MAX for files with
> FOP_UNSIGNED_OFFSET, and call it before rw_verify_area() in the read
> and write paths of the VFS, splice, aio and io_uring. Where the I/O is
> described by an iov_iter, truncate the iterator. This is what
> filemap_read() already does for s_maxbytes. In io_uring, also save the
> iterator state again after truncating it, so that the short read retry
> loop does not restore the full length.
>
> A read that starts at the maximum offset returns 0. A write that starts
> there cannot transfer anything and still fails in rw_verify_area(), as
> do negative positions on files without FOP_UNSIGNED_OFFSET and counts
> above SSIZE_MAX. For files with FOP_UNSIGNED_OFFSET, the file's own
> read and write methods still decide how much of the shortened range
> they can actually transfer.
>
> rw_verify_area() keeps its check, so callers that are not converted
> behave as before. copy_file_range() already clamps the range in
> generic_copy_file_checks() and is not changed.
>
> Reported-by: Ding Feng <dingf3ng@gmail.com>
> Closes: https://lore.kernel.org/linux-fsdevel/20261120051457.47753-1-dingf3ng@gmail.com/
> Suggested-by: Paul Eggert <eggert@cs.ucla.edu>
> Link: https://lists.gnu.org/archive/html/coreutils/2025-12/msg00097.html
> Link: https://lore.kernel.org/linux-fsdevel/20251219125250.65245-1-teknoraver@meta.com/
> Signed-off-by: Matteo Croce <technoboy85@gmail.com>

Forgot to re-run get_maintainer.pl after the io_uring change

Regards,
-- 
per aspera ad upstream
