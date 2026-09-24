Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1EA3F104E
	for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 16:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268530; cv=none; b=AjOdPhbScSWpL+D1tFJLR0zT668l6mFbJ7y8JV59oHQg7ZM+eSCMc6EgHRu7/csdbxJUg/Po2zWwi4BU6CDJ/bGmcrnDvnuAHng9KQLOaEgWKD6vlxbf8dQt5AAOiD3HUzEVJ/ptwnwEZtX2GFZEpDPftObbozSGZfyBzmGgQ2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268530; c=relaxed/simple;
	bh=js1kQuOA/gb46R/ssVVtUAmW7+NWA5UKw9EKfTa0DQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/Uh3Evq55QBSdhnpVf7LidW0g67pZy4xnnb7bdCzOdNMkA4rd7sZpYUQAgYHr4WIpxqCCYlLA9gltNI2nkGtqG0U//RCwII6TiHvoyR1obq8HGlIdbeAK1QrVUiDnoQMifqnttqNO7uVV4YbAaiR3tN87pYc1RuDXEaZLYqoo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3P+6k1x; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3P+6k1x"
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3964e7720afso65889a91.1
        for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 09:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790268529; x=1790873329; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sPebfTs6ngqD5omPTzpXrw1OQUhp16wQuhk2z6XCEGE=;
        b=U3P+6k1xv0Huy31ud+FelFCMUdDvEnrNiKi3ueskGDc3q0vsY7XOkd8R9t0BgDDWFI
         6CYJbobY6BFoG2t0S/YcycgmvpbKOZ/J5KKnOHSoovx8QvPkqIrRzJjdVrpsLa81zL7D
         L4NKi+9Yip8y4MLH6uK4iX35hmhPdh8gmwGDaW1Y+jZdAUSTah25cgI2Nyy2LXX6Fwns
         O1ACj/50ErTyc4TdRmbao028hWBeYJtbaZUF4wTSTcXCTBosTU9fZfuXWPo62/ulOu53
         x5oCwak0xNF8vheLjeXhwGPROPLNvxzokJY3VicReHojXZlDHMyOtp04zoTrI8vF3POw
         KwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790268529; x=1790873329;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sPebfTs6ngqD5omPTzpXrw1OQUhp16wQuhk2z6XCEGE=;
        b=D7xewlpS/iExwi/a7lYEevdhuTR6cOTogWKxwarmFutVxCo5d/o6CCoVN27SVdS3IP
         +rcR4kiexD3m8pK4euFl7yLcgdtrI0qhpbpEjgOjkAehDrWD8zexzPnYwBlmjTZYHXYH
         YfMbnJP1pg0vmII9xU9IP7LtPcpdo558VTaMyg7FbvGFhhoZvESkbfl7IMwAJwn3xIE8
         MjbkT7oxrkf1o3j2JLVSdsGFWmdUubZxH2ompD76+oNkT4blyGUWk4vA1kBG7vif+DPR
         v55YrJ1x33q5/ZjqXvzx4BC1EG58jhwL6ik+rH4P4yQ9Chk5jFaIXX049MY+9Eozcx2O
         gt9w==
X-Forwarded-Encrypted: i=1; AKwUvBzzPTtSWVID4Fp+yjogxq+yg+6iVF3+/CVd80yca1zmOOxG59/oMzzCN+Ppsziq503Tzat1eNbyRg==@vger.kernel.org
X-Gm-Message-State: AFuF++n4Pe7JBeL2JK6aZvebz0D8cYFhxG+pbufT+pgRgTW74t2Jng7s
	ssXxpnOW0w422cCvsM+gyKfnyka5LAgAhC9gQcnsTgCix8OrhJ5cY02q
X-Gm-Gg: AYBFou22baeYN7PE3rqgCYm3oNRb7DYm9sAbhwQ6VQNfDh2utTQya4yVeC3FmCwJawl
	JCvRjIhyRWO+lTQt47u3b/YVcB4FYg+s3lybEBEJb99T6ssJIvNsllKrnBxBzmJ6V/W102jw8Zw
	Mpz0RiggTMerwYUzeOzRq2wYCIF/QNGFjDxU/+6Rj1T6uBSDilTFHi+KAJf+nX5Atjq8mY6kqOT
	MLNrvisDwBwd3K0Qut0uHBgFGTCkKtnPV9qak4R8oIaXcYHQWU8hzOQcfo9YWboeigUAzzy/+1a
	Av8jtkNmvOp9Y4/pM3k/h6E+9WoBDcHvsguw7Q3KC83Zjs4w5wTbF+SvxwurFGv9On4YODWEpFZ
	AMQfKvIqIUNsu9lbB5b5dOZaP5Xab7ceFPbVcc7KgahDk/GoapgNUrKM7p7eDrWs/kjs/l5PuZb
	DpVh4i8arybFuI35l7mjAnNkV8j6NWJcHaf1xh2WNU1kzd0N4Ihb6KkiNi31wC+K+g
X-Received: by 2002:a17:90b:1cce:b0:39e:6c6a:6577 with SMTP id 98e67ed59e1d1-3a098a935e8mr2892457a91.58.1790268528450;
        Thu, 24 Sep 2026 09:48:48 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:45::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a097663fdbsm8126754a91.10.2026.09.24.09.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:48:48 -0700 (PDT)
Date: Thu, 24 Sep 2026 09:45:48 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, hawk@kernel.org, 
	ilias.apalodimas@linaro.org, asml.silence@gmail.com, axboe@kernel.dk, sdf@fomichev.me, 
	bobbyeshleman@meta.com, kaiyuanz@google.com, linux-kernel@vger.kernel.org, 
	io-uring@vger.kernel.org
Subject: Re: [PATCH net-next 1/3] net: netmem: add net_iov_area freelist
 helpers
Message-ID: <arVTC1w_VRwH4yV5@devvm7509.cco0.facebook.com>
References: <20260922204348.717198-1-sdf@fomichev.me>
 <20260922204348.717198-2-sdf@fomichev.me>
 <CAHS8izPwLBCJXM_0Df8P6S-FVwAq+TaRKn3uTh1h=33Ffj8VmQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHS8izPwLBCJXM_0Df8P6S-FVwAq+TaRKn3uTh1h=33Ffj8VmQ@mail.gmail.com>

On 09/24, Mina Almasry wrote:
> On Tue, Sep 22, 2026 at 1:43 PM Stanislav Fomichev <sdf.kernel@gmail.com> wrote:
> >
> > io_uring zero-copy receive and devmem both maintain a bounded LIFO for
> > net_iovs in a contiguous area. Store the freelist in struct net_iov_area
> > and provide common push and pop helpers.
> >
> > Leave synchronization to area owners. Keep devmem's area adjacent to its
> 
> This could be a follow up change, but I think synchronization should
> be provided by the netmem/niov infra, rather than the area owners. TBH
> the infra providing an unsynchronized data structure and letting the
> area owner use it and shoot themselves in the foot feels error prone.
> For now we could use a comment.
> 
> I also think we should not provide _push and_pop functions, rather we
> should provide _push_bulk() and _pop_bulk(), and the caller can decide
> to only push and pop 1 at a time if they need to. The reason is that
> in allocation paths, we almost always want to alloc in bulk. If the
> infra had the lock it could lock once and alloc a bulk.
> 
> The free path is more nuanced. I think _push_bulk() is actually not
> currently that useful, because page_pool_put_netmem_bulk() ends up
> internally looping over individual calls to __page_pool_put_page(). It
> seems like there is a very low hanging fruit optimization possible
> here where we change things such that page_pool_put_netmem_bulk()
> actually does free the entire bulk at once, and if the pp is using a
> memory provider, it uses push _push_bulk() to free the entire stack of
> netmems with 1 lock acquire.
> 
> But these can be future optimizations, so,
> 
> Reviewed-by: Mina Almasry <almasrymina@google.com>

Ack, let's discuss separately, this is probably a larger refactor.

> > lock. Use u32 indices and counts, which halves devmem's freelist storage
> > on 64-bit systems. Reject devmem areas with more than U32_MAX entries
> > before narrowing the count. With 4 KiB chunks, the limit is almost 16 TiB.
> >
> > Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> > ---
> >  include/net/netmem.h | 28 ++++++++++++++++++++++++++-
> >  io_uring/zcrx.c      | 25 +++++++++---------------
> >  io_uring/zcrx.h      |  4 ----
> >  net/core/devmem.c    | 46 ++++++++++++++++++++++----------------------
> >  net/core/devmem.h    |  7 +++----
> >  5 files changed, 62 insertions(+), 48 deletions(-)
> >
> > diff --git a/include/net/netmem.h b/include/net/netmem.h
> > index bccacd21b6c3..da885d95ea63 100644
> > --- a/include/net/netmem.h
> > +++ b/include/net/netmem.h
> > @@ -101,10 +101,15 @@ struct net_iov {
> >  struct net_iov_area {
> >         /* Array of net_iovs for this area. */
> >         struct net_iov *niovs;
> > -       size_t num_niovs;
> > +
> > +       /* Stack of free net_iov indices. */
> > +       u32 *freelist;
> >
> >         /* Offset into the dma-buf where this chunk starts.  */
> >         unsigned long base_virtual;
> > +
> > +       u32 num_niovs;
> > +       u32 free_count;
> 
> Why not keep num_niovs a size_t and make free_count a size_t as well
> (so that essentially we can support anything up to SIZE_T_MAX - if
> that exists - num entries)? Do we gain anything by converting these to
> u32? I know in practice in really doens't make a difference, but since
> struct dma_buf->size is a size_t and that's usually the type we use
> for memory sizes we should use it unless we see a reason not to. Tbh I
> don't think the size of the freelist array is a big deal?

My reasoning: 4K * UINT_MAX is ~18TB which should be enough for a
foreseeable future. So just saving a few bytes, free_count was already
u32 on iour side.
