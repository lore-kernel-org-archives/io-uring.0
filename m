Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794858736;
	b=w2QuJz8u1HoChUgiOqiX35tqrURBZJ3DT3FTotWr2dj0KBrgIp1eIajIhKq1K7uzIyjZ
	 OTusL3FODBINzNavOwCXZz7i14/rXNKdGU9DyH9bpGD9/vONAFA82KJ+dAdFrrgNU6ViL
	 P+XE8bHiEn6CjHnn1uLHPfAIZdRjZBWInw6wvlJKFk9vgH3tWzFCaSGsAOqiJiJqvhpgt
	 5/7um2oZD/BCLzeZ1cuvauKYKd/qBj3dEFWvo46EDsjzNJCCYGOkF89/8eSxhuEOOqPaG
	 tuiIREN3JhoSbiceVMxWH7B5xRHO4517ZOB8NBxy3BzM72SGB3bUB+ioLXx+lgHL8Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jqnrRoTh5TcWr/Py+gEgzzX7wdMhzTlFxFkfLcpGuJM=;
	b=Xy96CVjY2A27hD1Sjovp/vZwzIRbilGX02Y2BAl4rAyM2WMBi++i48kSOfbSRlaGoL7k
	 ebinSxvSGAxGm0IT43VDodqnH2KWr+l8uFGooXKUPx+kR0UHoii2NznQZSGASsudlEe+4
	 0FbdDXLBBqFZkOAniq9aYm/f0zyBh6VL3VQvYSJebufbvgqmzG3A91cf7KP7Q8h3HCXvM
	 LXfUaNgGjmRH4nAAYhVuEIURqytW1+Sw1/lJ71onSlwI3q57ouVCVe1QcqymNtxpBF4m2
	 FLhQWZlzRry4cZBI2cqboPSMGc7LZwL75nH9oaBgUnaZSRyRAGlE03SssqqbXN78M0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YcqWJI31;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BAE606A331
	for <io-uring@vger.kernel.org>; Mon, 16 Nov 2026 19:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18BAE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YcqWJI31
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-55d2dcbb905so19718911cf.3
        for <io-uring@vger.kernel.org>; Mon, 16 Nov 2026 11:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794858735; x=1795463535; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jqnrRoTh5TcWr/Py+gEgzzX7wdMhzTlFxFkfLcpGuJM=;
        b=YcqWJI31Q3We3zqNvL52aNkFr++cowdUSJ0aOSCLtCZgOyPTfxfZMV4aawKPfLKj7g
         4m2sGeUiA0CXGadMrFuMRIl89TE0lacup406nbrhvwqwPIX8FxoVlYidwE8/s7P7Wszm
         OrbfdLGk33YGmzpkBYmsq4F3Mxnt+4Lu+TymHPjdbgW2SfeAeQs52uRWqh/1XVhhLOxn
         GvpMlDfLIXvCkNJG/BKPMpLBeKmXfFzSUPrKKeUURMUv+fsornqCLKr9GiRTo2LK7Tab
         rlciZWXd7u0mEyCoyMVRbS74CtgQ2ZcTLr22IpH7H7u3DgVnSQkVWAwVkGPORAQHY8UQ
         R7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794858735; x=1795463535;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jqnrRoTh5TcWr/Py+gEgzzX7wdMhzTlFxFkfLcpGuJM=;
        b=XYjH7uDxVYDIGIRFQWScvWj2YEkZte7vFSpRZLLTYZeDqSazp1ZeI9ZZhtOc9HbRzj
         cE1CnanJy7A+lbOI9Kjdyv6+HQrBlekT0lgm0t/3JvLjsWVu2jaBeIx9nseTcmJTztZe
         8srR9HmyKmFUe+j7j2jwnMTfdryru2KDbN12/SuyrxhQ4PXOXI7X32jIqW0MwaqoAG7S
         ewEjIYh5eL25x/wiU5FXKM2pUwkTYece6MtBhqKr/57J/dJ7RyHysvR84iT5K34QUPlO
         TD7zXBLncN3gwWMRgF2ikYTM7+hA/eqllc/AXwRvXVycAZco3D8b3PcEIQGoLTOZH8fD
         JSbg==
X-Forwarded-Encrypted: i=1; AL+hErELblEyciPTYjwLs61zJpw5j5pekxJzu2a4K/FZERcDVh5t23vM+mfZsoC1fhG5qfJSldCPO6N4zA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/lAPOp5Vj78RxHc8wxuA7bZw2DW52cPvp53sxZkauJ+rdgjucx
	eL24zM6/rPlOIBtsqsjQ2lciB47z6g61aLsGxJWKZaSgUnyBvukifG8VYSWrbwupPR8=
X-Gm-Gg: AYBFou1CJ++rIkyE1dHB7zxHkJvvKvasl5fbJm7T3vNPBn9WBoWqK7lI6qx3BCrepsN
	2cWQFSMc9qOpqneR1f2t1a1jmZvD3N7/Lt7Xj+Aqa1DBvduMo9taBrUhy+abUnGRGhFk1uC85dr
	lxisVMYqS29wWKkwUgsDfL3mB1wDqqA9rbCnGgAuA1SA+5td36F8JO+YOLxe9jOVkB6cS7yOdUC
	NJmb8+4vnezPOlqfvUSy4+kP22FK7JryxZbL/jaeQZh6dTznh7fnYdwPCb2vWzHJrBgm2GLwGaz
	7hmx1xa6r/WscRnIvQXchUbS/qmzqZH9wcmIWm8iFGf75hiiTO3Cgd9BhQXQz08FcIJy9Y6axJt
	PT+aEE7oNtV1kY5Xf2zEJiyRUSnn0Yu43B/bJdhXLAUnIy9r6lG+IqaYyTYr1Y2YLWpWyouzf9f
	Ak5vUslNSNDhWn9FNCD9Vp2i9xgDZuX7+dzgUQA88mUebh8EYUuX935zhAyyXXjBKAR9yaW1oB8
	oWfXNmQZXJXn8B0nIiNb7rl1OeQ1IZOmKXbF76ZfNJUNQ3iFURQvub6IuG1TcOWADIm+RQJecbz
	LRrbbA==
X-Received: by 2002:a05:622a:13c6:b0:55c:c7ab:4445 with SMTP id d75a77b69052e-55cc7ab469bmr121785021cf.29.1794858734926;
        Mon, 16 Nov 2026 11:52:14 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f8319d44bsm48973876d6.4.2026.11.16.11.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:52:14 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT2kP-0000000ALbT-12cG;
	Mon, 16 Nov 2026 15:52:13 -0400
Date: Mon, 16 Nov 2026 15:52:13 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Tao Cui <cui.tao@linux.dev>
Cc: akpm@linux-foundation.org, dgilbert@interlog.com, mkp@kernel.org,
	loberman@redhat.com, jmeneghi@redhat.com, kraxel@redhat.com,
	vivek.kasireddy@intel.com, mst@redhat.com, jasowangio@gmail.com,
	eperezma@redhat.com, stefanha@redhat.com, sgarzare@redhat.com,
	rostedt@goodmis.org, vdonnefort@google.com, mhiramat@kernel.org,
	kevin.tian@intel.com, axboe@kernel.dk, linux-mm@kvack.org,
	James.Bottomley@hansenpartnership.com, sumit.semwal@linaro.org,
	christian.koenig@amd.com, phasta@kernel.org, joro@8bytes.org,
	will@kernel.org, linux-scsi@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, linux-trace-kernel@vger.kernel.org,
	iommu@lists.linux.dev, io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org, bobbyeshleman@meta.com,
	mathieu.desnoyers@efficios.com, robin.murphy@arm.com,
	mason@kernel.org, aesteve@redhat.com, tjmercier@google.com,
	harry@kernel.org, vbabka@suse.cz, cuitao@kylinos.cn
Subject: Re: [PATCH 5/7] iommufd: account the hw_queue page array to memcg
Message-ID: <20261116195213.GF2452510@ziepe.ca>
References: <20261106131829.3228926-1-cui.tao@linux.dev>
 <20261106131829.3228926-6-cui.tao@linux.dev>
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
In-Reply-To: <20261106131829.3228926-6-cui.tao@linux.dev>

On Fri, Nov 06, 2026 at 09:18:27PM +0800, Tao Cui wrote:
> From: Tao Cui <cuitao@kylinos.cn>
> 
> IOMMUFD_CMD_HW_QUEUE_ALLOC pins up to max_npages pages just to check
> that a user supplied queue region is physically contiguous, and the
> page array for that check is plain GFP_KERNEL.  The size comes from
> cmd->length, a u64 that is only overflow checked, and the array is
> freed again as soon as the contiguity check fails, so the allocation
> can be repeated concurrently: a 1GB region costs about 2MB of
> uncharged memory per attempt.
> 
> Every other iommufd allocation that scales with user input is already
> charged, and the pinned pages charge the mapper at map time.  Charge
> this array like the rest.
> 
> Signed-off-by: Tao Cui <cuitao@kylinos.cn>
> ---
>  drivers/iommu/iommufd/viommu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
