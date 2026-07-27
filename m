Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98322D63E5
	for <io-uring@vger.kernel.org>; Mon, 27 Jul 2026 14:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161101; cv=none; b=E0aQQBiAs8PbiI5Lv26WtTLczhaQfe/WM/cjWGJrWRanvYii1Sa0qwOIXHGITcPnnRbj4LgVXzuSDIxX/gUyI7TKLXqwHtVnaFAbDhsrVvXkXuepPfU+GmBIUM0fTj3KsdJVGtTejujoReSTGsqcwpypuGruB6y8mQ+M2vjiYSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161101; c=relaxed/simple;
	bh=EXOdYXHw75zfxg+q7xHR2jjl9RPxb28uZH7EZmnrJUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=qBCYI7Gfx/eoNgxZyh06boBJuEtkzLsulNhxJr0Y/4WbWcbmOhGSHZXiRUAZrq3f1MfEBHEOTvkOdB2klYxP3QCXS/D0wpnqJDOqgig1KG3UOdV/HscJD//+mbYGgHKMdfUJcCG7qk+9Ym4lEk+DNfXe9JfehQqFtrKAIRm3rjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Z6V+Q34o; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Z6V+Q34o"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260727140456epoutp01e9648586ca440e2f373ba258c7a1c06b~GKo8XktTJ2275522755epoutp01_
	for <io-uring@vger.kernel.org>; Mon, 27 Jul 2026 14:04:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260727140456epoutp01e9648586ca440e2f373ba258c7a1c06b~GKo8XktTJ2275522755epoutp01_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785161096;
	bh=EXOdYXHw75zfxg+q7xHR2jjl9RPxb28uZH7EZmnrJUY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Z6V+Q34o6UyNSsRk8taTYssG7rU5X9UW36fT1sbdQlVGYOL0oEGCyc+VQzyucqcsw
	 yLZcJd4S+pxkezUQpVa+WGeIY8qd3AzHgHrOTknFda76MIDIF4DbE49ZF3GxbqY0bu
	 IsF3afBeukJv7KjWZdxSNd7B4JK9Cu+FpsxEVjKA=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260727140456epcas5p15916393a49349d3d3df0c3fa14d9e7f4~GKo8LNJow1538715387epcas5p1A;
	Mon, 27 Jul 2026 14:04:56 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.91]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4h80j33V6Sz3hhT4; Mon, 27 Jul
	2026 14:04:55 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260727140454epcas5p1a2306b5a87d2ff6d299e89b0af320213~GKo7BN1LE1538715387epcas5p16;
	Mon, 27 Jul 2026 14:04:54 +0000 (GMT)
Received: from green245.gost (unknown [107.99.41.245]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260727140454epsmtip2bf7c3ffd4cc44357add109098da5a9de~GKo6i4ke_1710917109epsmtip2y;
	Mon, 27 Jul 2026 14:04:54 +0000 (GMT)
Date: Mon, 27 Jul 2026 19:34:43 +0530
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring <io-uring@vger.kernel.org>, Sung Keum <kambodi127@gmail.com>
Subject: Re: [PATCH] io_uring/kbuf: cap buffer selection length at
 MAX_RW_COUNT
Message-ID: <20260727140443.hskeltnt75lx5r4m@green245.gost>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aa826e79-ddc5-4a82-9863-a5edfdce709f@kernel.dk>
X-CMS-MailID: 20260727140454epcas5p1a2306b5a87d2ff6d299e89b0af320213
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----U9Lis3DTxLv4QHEbRCenRB4HCArvGtQAFyS4Dv-9dse07Ud-=_743d_"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260727140454epcas5p1a2306b5a87d2ff6d299e89b0af320213
References: <aa826e79-ddc5-4a82-9863-a5edfdce709f@kernel.dk>
	<CGME20260727140454epcas5p1a2306b5a87d2ff6d299e89b0af320213@epcas5p1.samsung.com>

------U9Lis3DTxLv4QHEbRCenRB4HCArvGtQAFyS4Dv-9dse07Ud-=_743d_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On 26/07/26 04:28PM, Jens Axboe wrote:
>io_ring_buffers_peek() builds an iovec array from provided buffers, and
>that in turn can be handed off to a lower level provider. Be prudent and
>cap the total size to MAX_RW_COUNT, which is the Linux default for how
>much IO do to in a single call.
>
>No bugs here, but it's a good preventative measure to avoid truncation
>issues.
>
>Signed-off-by: Jens Axboe <axboe@kernel.dk>
>
Reviewed-by: Nitesh Shetty <nj.shetty@samsung.com>

------U9Lis3DTxLv4QHEbRCenRB4HCArvGtQAFyS4Dv-9dse07Ud-=_743d_
Content-Type: text/plain; charset="utf-8"


------U9Lis3DTxLv4QHEbRCenRB4HCArvGtQAFyS4Dv-9dse07Ud-=_743d_--
