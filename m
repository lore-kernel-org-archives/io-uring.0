Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B7B37207D
	for <io-uring@vger.kernel.org>; Wed, 12 Aug 2026 15:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550158; cv=none; b=Ms2uobIg3PAyQoMH8AczWCHnnWGJZ/1Eh8nwQyLLnkse1/e8tAl8+BtwQXD6hpjo53Tu9qo+I0jeiomnJhIWGzj7GT8fxgBnJoppQe8iISNJqmjQR3FqvwBsZkeUhJdhBLuhjS4EcgqFIglw7hPc/U/mRHtrQjBB4cFxVVY7xrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550158; c=relaxed/simple;
	bh=I0hYxzm8ESCCUv9MREtI7X4Q+JtGw8cI7QyBai9qXrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fvvb5is4bK/2qU+JoywJEMIAq/TLTeT0r0mYt3eX8aY3bgsBlqDIlkO6887N2I2oslw0++BqzZu5NXbO1pe7c4L5QVwbhqB0OrOR8EyVWFKZ9GgohJacrJVZcEp4p0iV8sJAMowF7KatTmXL9aIYSq2SeViadnfhh4Z/DqGhwNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id A6B5968CFE; Wed, 12 Aug 2026 17:50:08 +0200 (CEST)
Date: Wed, 12 Aug 2026 17:50:07 +0200
From: Christoph Hellwig <hch@lst.de>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Damien Le Moal <dlemoal@kernel.org>, io-uring@vger.kernel.org
Subject: Re: [PATCH 3/5] liburing: add io_uring_prep_cmd_zone_reset
Message-ID: <20260812155007.GA10483@lst.de>
References: <20260812131255.258582-1-hch@lst.de> <20260812131255.258582-4-hch@lst.de> <CADUfDZoGWymYvu43voXCFuO_1_bZwte=wFhKVUKfzmM9M7Dr3w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADUfDZoGWymYvu43voXCFuO_1_bZwte=wFhKVUKfzmM9M7Dr3w@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Aug 12, 2026 at 08:43:16AM -0700, Caleb Sander Mateos wrote:
> On Wed, Aug 12, 2026 at 6:17 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > Add a helper for io_uring zone_reset_all commands.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> > ---
> >  configure              | 31 +++++++++++++++++++++++++++++++
> >  src/include/liburing.h |  7 +++++++
> >  src/liburing-ffi.map   |  5 +++++
> >  3 files changed, 43 insertions(+)
> >
> > diff --git a/configure b/configure
> > index b953eddd6ddc..8c5ca801f487 100755
> > --- a/configure
> > +++ b/configure
> > @@ -469,6 +469,21 @@ if compile_prog "" "" "discard command"; then
> >  fi
> >  print_config "discard command support" "$discard_cmd"
> >
> > +##########################################
> > +# Check block zone_reset_all cmd support
> > +zone_reset_all_cmd="no"
> > +cat > $TMPC << EOF
> > +#include <linux/blkdev.h>
> > +int main(void)
> > +{
> > +  return BLOCK_URING_CMD_ZONE_RESET_ALL;
> > +}
> > +EOF
> > +if compile_prog "" "" "zone_reset_all command"; then
> > +  zone_reset_all_cmd="yes"
> > +fi
> > +print_config "zone_reset_all command support" "$zone_reset_all_cmd"
> > +
> >  ##########################################
> >  # Check idtype_t support
> >  has_idtype_t="no"
> > @@ -797,6 +812,22 @@ else cat >> $compat_h << EOF
> >  EOF
> >  fi
> >
> > +if test "$zone_reset_all_cmd" != "yes"; then
> > +cat >> $compat_h << EOF
> > +
> > +#include <linux/ioctl.h>
> > +
> > +#ifndef BLOCK_URING_CMD_ZONE_RESET_ALL
> > +#define BLOCK_URING_CMD_ZONE_RESET_ALL                 _IO(0x12, 1)
> > +#endif
> > +
> > +EOF
> > +else cat >> $compat_h << EOF
> > +#include <linux/blkdev.h>
> > +
> > +EOF
> > +fi
> > +
> >  cat >> $compat_h << EOF
> >  #endif
> >  EOF
> > diff --git a/src/include/liburing.h b/src/include/liburing.h
> > index 0188937b0de4..214c7778d6a7 100644
> > --- a/src/include/liburing.h
> > +++ b/src/include/liburing.h
> > @@ -1685,6 +1685,13 @@ IOURINGINLINE void io_uring_prep_cmd_discard(struct io_uring_sqe *sqe,
> >         sqe->addr3 = nbytes;
> >  }
> >
> > +IOURINGINLINE void io_uring_prep_cmd_zone_reset_all(struct io_uring_sqe *sqe,
> > +                                                   int fd)
> > +       LIBURING_NOEXCEPT
> > +{
> > +       io_uring_prep_uring_cmd(sqe, BLOCK_URING_CMD_ZONE_RESET_ALL, fd);
> > +}
> > +
> >  IOURINGINLINE void io_uring_prep_pipe(struct io_uring_sqe *sqe, int *fds,
> >                                       int pipe_flags)
> >  {
> > diff --git a/src/liburing-ffi.map b/src/liburing-ffi.map
> > index bd7bc64416d3..fc9701b63907 100644
> > --- a/src/liburing-ffi.map
> > +++ b/src/liburing-ffi.map
> > @@ -275,3 +275,8 @@ LIBURING_2.15 {
> >                 io_uring_register_zcrx_ctrl;
> >                 io_uring_register_query;
> >  } LIBURING_2.14;
> > +
> > +LIBURING_2.16 {
> > +       global:
> > +               io_uring_prep_cmd_zone_reset_all;
> > +} LIBURING_2.14;
> 
> Mentioned this on v1 too, but I think this should inherit from LIBURING_2.15.

And I do remember it now that you mention it again, not sure why it
splitted through sorry.
