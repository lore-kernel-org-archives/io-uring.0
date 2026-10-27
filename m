Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106724;
	b=raMoHuk0r1xyfm43dSVH83VtIXTbsbeeRFbZjZTWlcIIiHtcti0OedTy4svm4ebci71r
	 XM2IKu/QoZgCW07SL2AUhPIPLJ8d3FwyvZQpvQJrGIAuCOb53r2li+C7Ntsc62remB5HZ
	 tcbPp0Gg3RxEaQUgJC3UKMv9vwKte3O+YwWN+wdbgbPDFPQvkX7uFgSqOOExOVwaqJn6Z
	 7yMplBTv6S5HKDfmMqtILC1kgmkqUEp3maHQMmWCy5jD5r4tZ4ilHdreIVivSD7ejjZrv
	 bLnHz0NTISffRHp5eq7KOZnOJPyqcZS8JtmmHN951XRcWFBviPtypJfLBTBg9U3XzFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106724;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2MMXzSmivNiYm7xgnDiu+/n7gX5wknAWsvpVij8nk9k=;
	b=lAHU3ValCwT9R9l0QtuwsKs5O38clUhmXtnzCkCntMTwwIgMXPTqi2KydYirEByUz7Xl
	 GdOJu0rjAhJLeY2L+OspW3e2De5qzNxswmFlsmYTzWL8mltMR3lEHoqXuLIDHiXG9NsR7
	 2d0EDYqZcjuvQgir+7z59akfxjw8ZmwKAvV4Z9JKwLkwV9ZUG5G5YzjAR1nKouTFLx943
	 4b/2AlucQXXT1oLeasKETY8uxBgmRXiihNgCN6ogGCss3dHnonuxkb1Em5vOMSHOUKdwG
	 7yyiqQEHj4aYiNjdaY6fInXOjRuQIQvFb/3a5qUEzoDloTdra5kUParj94waB1I/9Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=m1KbTfFL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA931606A31A;
	Tue, 27 Oct 2026 13:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=m1KbTfFL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB63E1F01825;
	Tue, 27 Oct 2026 13:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793106723;
	bh=2MMXzSmivNiYm7xgnDiu+/n7gX5wknAWsvpVij8nk9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m1KbTfFLRc6URg44I7EPyv0n3lBQykW7ConS/2FmF//DD57D5lAAvGm7YoCwnlX6a
	 NQpq2Lv9L0WXiUDPKew+8VQzU660fmYwkQyBoKJbgvEb6eObZnAAWqqV+5Eq4U7i0P
	 xUxp4GsKmpTs9AyY1CUbZM/JFyZrwvqvkPYtIZf4=
Date: Tue, 27 Oct 2026 14:12:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Li Wang <liwang@kylinos.cn>, Arnd Bergmann <arnd@arndb.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mengmeng Zhao <zhaomengmeng@kylinos.cn>
Subject: Re: [RFC PATCH v2 1/1] misc: fgds: introduce GPU-File direct I/O via
 dma-buf
Message-ID: <2026102734-booting-playtime-557d@gregkh>
References: <20260908131545.105987-1-liwang@kylinos.cn>
 <20261027090853.30099-1-liwang@kylinos.cn>
 <20261027090853.30099-2-liwang@kylinos.cn>
 <f92baf52-bc4b-432b-bc0a-f39f59483805@kernel.dk>
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
In-Reply-To: <f92baf52-bc4b-432b-bc0a-f39f59483805@kernel.dk>

On Tue, Oct 27, 2026 at 07:03:29AM -0600, Jens Axboe wrote:
> On 10/27/26 3:08 AM, Li Wang wrote:
> > From: Mengmeng Zhao <zhaomengmeng@kylinos.cn>
> > 
> > This patch introduces a driver that allows moving data between a GPU
> > dma-buf and a regular file on NVME without staging it through the page 
> > cache. Userspace registers the GPU dma-buf with the device, then issues 
> > read and write requests via the device's ioctls. Each transfer is direct 
> > I/O: an ITER_DMABUF_MAP iterator is passed to the file's read_iter or
> > write_iter, and the filesystem's iomap path submits REQ_DMABUF bios that
> > already carry the dma addresses.
> > 
> > Signed-off-by: Mengmeng Zhao <zhaomengmeng@kylinos.cn>
> > Signed-off-by: Li Wang <liwang@kylinos.cn>
> > ---
> >  .../userspace-api/ioctl/ioctl-number.rst      |   2 +
> >  drivers/dma-buf/dma-buf-io.c                  |   3 +
> >  drivers/misc/Kconfig                          |  16 +
> >  drivers/misc/Makefile                         |   1 +
> >  drivers/misc/fgds.c                           | 506 ++++++++++++++++++
> >  fs/iomap/buffered-io.c                        |  11 +
> >  fs/iomap/direct-io.c                          |  23 +-
> >  fs/xfs/xfs_file.c                             |   4 +
> >  include/linux/iov_iter.h                      |   4 +
> >  include/uapi/linux/fgds.h                     | 124 +++++
> >  lib/iov_iter.c                                |   1 +
> >  mm/filemap.c                                  |  22 +-
> >  12 files changed, 713 insertions(+), 4 deletions(-)
> >  create mode 100644 drivers/misc/fgds.c
> >  create mode 100644 include/uapi/linux/fgds.h
> 
> What's the point of this, when you can just use io_uring to do
> the same?!

Agreed, I thought that the summary of the last round of reviews was
"this isn't needed at all".  Li, what changed from that?

thanks,

greg k-h
