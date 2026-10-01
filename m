Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D551A43F08C;
	Thu,  1 Oct 2026 15:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790868990; cv=none; b=Dwv+gB39mt2TIbLqqzvPMQUM964Nmb1lPY3W7caXr0pO/PDDdwhPsGwi/gqcFRAD4PB5jyKs8AvEUvYS7EEg5BAiMLUtjojPi7LzZo1Ra0r/kPzvIsR07Hi/eCT8HvGK9P4ZrroHJ+VYLDJoxnon2B5jmecLIgzCJeY1n40wSHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790868990; c=relaxed/simple;
	bh=yJ/LhFqPl8CjtIlZHtaborY4hBzMtXGYUhD5qs/EPWw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=r63lRGq4Vem65k0nh0O1zajhMwae6nBmemfP0ajBzatd1k3GUImcrHXGVn4mtT0XXZo/qbqZNTbL21Pl9A0BDKcRnO7y0HMZV+Dlxygiz1KVo4IOSCINP4C6l1OExaRBuy4VU0RLanPQYT1Xfu+2Odqo9OV5KTN3/uUsuynRKA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krisman.be; spf=pass smtp.mailfrom=krisman.be; dkim=pass (2048-bit key) header.d=krisman.be header.i=@krisman.be header.b=f9KGlwlK; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krisman.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krisman.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=krisman.be header.i=@krisman.be header.b="f9KGlwlK"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hwbc71KyJzKpDS;
	Thu, 01 Oct 2026 17:36:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=krisman.be; s=MBO0001;
	t=1790868983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vi1fnMnSyEd4oeHJPdGtovvWeng1BWn+XwgU/ARKPko=;
	b=f9KGlwlKfy0bPgY5BN8KxY8ZAPZSu9BzZ4bvpdhaVzgHViPw0+QCcGVLbOAx2w1iP+2lGp
	Y27P7t+lazC6sq6dh76mvxdNnqHgG16LaeIxCSGcXiRnNnUnkgDeX6QclTchHs2fZdcFu4
	C+O0/yJyI8CzJQoZLWYvunWr4GPFB7jThDmIj34HOUuOBNnykhhHiTyak57AwKIv+6qZG0
	Dvqz47m+2rWiugbDVx3jX2Ui4CjH5YkxujlDjeRRkelwGcU9o/JFO5BkaQn8Cdac+pDTVZ
	QJkln+qldQTv63IhmL1DsxhLyTQ4FwpU087AP4yd4vzrszjpWJGAyysFUjeypA==
From: Gabriel Krisman Bertazi <gabriel@krisman.be>
To: =?utf-8?Q?=C3=96mer?= Mete Kaya <omermetekaya0@gmail.com>,
 axboe@kernel.dk
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?utf-8?Q?=C3=96mer?= Mete Kaya
 <omermetekaya0@gmail.com>
Subject: Re: [PATCH] io_uring: fix out-of-bounds bvec access in
 io_vec_fill_kern_bvec
In-Reply-To: <20261001143003.755790-1-omermetekaya0@gmail.com>
References: <20261001143003.755790-1-omermetekaya0@gmail.com>
Date: Thu, 01 Oct 2026 11:36:18 -0400
Message-ID: <87se2pwhzh.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

=C3=96mer Mete Kaya <omermetekaya0@gmail.com> writes:

> for_each_mp_bvec() dereferences src_bvec[bi_idx] in the loop condition
> before the body is entered, with no guard against bi_idx reaching
> imu->nr_bvecs. iov_kern_bvec_size() stops iterating when i reaches
> imu->nr_bvecs even if bi_size is still non-zero, so the fill loop can
> walk past the end of the bvec array and overrun res_bvec[].
>
> Open-code the loop with an explicit bi_idx < imu->nr_bvecs check before
> the dereference, matching the termination condition in
> iov_kern_bvec_size().

Do you have a reproducer?  This should be checked in iov_kern_bvec_size.
We make sure it doesn't go through imu->len which should match bv_len,
IIUC.

>
> Fixes: 1045afae4b88 ("io_uring: support vectored kernel fixed buffer")
> Signed-off-by: =C3=96mer Mete Kaya <omermetekaya0@gmail.com>
> ---
>  io_uring/rsrc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
> index 51b46e624..3d29a0c7b 100644
> --- a/io_uring/rsrc.c
> +++ b/io_uring/rsrc.c
> @@ -1614,8 +1614,13 @@ static int io_vec_fill_kern_bvec(int ddir, struct =
iov_iter *iter,
>  		struct bio_vec bv;
>
>  		bvec_iter_advance(src_bvec, &bi, offset);
> -		for_each_mp_bvec(bv, src_bvec, bi, bi)
> +		while (bi.bi_size) {

bi.bi_size is the first condition of for_each_mp_bvec.  Do you really
need an open coded loop?  If there is an issue, can we just add the
check below?

> +			if (bi.bi_idx >=3D imu->nr_bvecs)
> +				return -EFAULT;

> +			bv =3D mp_bvec_iter_bvec(src_bvec, bi);
>  			res_bvec[res_idx++] =3D bv;
> +			bvec_iter_advance_single(src_bvec, &bi, bv.bv_len);
> +		}
>  		total_len +=3D iov_len;
>  	}
>  	iov_iter_bvec(iter, ddir, res_bvec, res_idx, total_len);
> --
> 2.55.0
>

--=20
Gabriel Krisman Bertazi
