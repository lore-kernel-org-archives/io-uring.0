Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861220;
	b=21q8CkfRLwEu/FrMa8vIDoaxhBAXLLt3jljpAjuw7W1TA6rNniVxvg/NKYjBQiqbDZ6t
	 L9byIKucjXt2Ex5789QtSHt8JtTJUqIXTMUj6amBhlE8Vs0etFKJGwjGAYDWTChUc1mh0
	 fK6/flnVEVYst0/b9PadaJEz/R9srqcxGe9tNlYhpcDVsCCoLbyy3aGveg3QEo5R/oj6e
	 VuxeRpMoNhML8esgvZ3BjpO/bioZfnPHmKIvZzJOhlUM1OVF7I890qtTJf2h+J8xZFyFV
	 AmFi+UdPGkV2dcQoqHJENTgiLJ+/beMTk+zjz7fYl2G/Cu7r4SyeQFn7j1AXrrn99rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FRUBObM4vFL1TGf3o6s1ZDBsKZdTJ/3jimI0MzXw8Fk=;
	b=RHgAiVKQ35f/piCL3YNd+QVPemWhEAQbjwp0u5swc/B1g9DsWT86YubvYOD5y5SahkkR
	 BarSAZZsIn1+cgA4HX+Oufew+MbFk+AoKQwRoFbdvRHdvuErj6BBktOQpQ2hWTSMFhygX
	 o4ejcJ9+YUJ5GO+TKCnCRil+Me86s9vCdusspSBW7vob7j5yYMsX6F0ZJdkGduYVgi6J0
	 KdxzFG+H3df+o2SMq67Ov0eAVLrJGciDbwLq4lDYUB950k1bB+jHaOurzbwPXajjQodAI
	 YFD/VaBjunoY0SaDzzGllw9hp7/mIIi8AuwJ42CCE37dA9X8C08SfHbR+bqwlabR8+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=W8qlgedU;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244AB606A339
	for <io-uring@vger.kernel.org>; Mon, 16 Nov 2026 20:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 244AB606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=W8qlgedU
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93f3c616c84so367356685a.1
        for <io-uring@vger.kernel.org>; Mon, 16 Nov 2026 12:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794861219; x=1795466019; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FRUBObM4vFL1TGf3o6s1ZDBsKZdTJ/3jimI0MzXw8Fk=;
        b=W8qlgedUXT2a/t6lhLP87IFTcy14JLKYa/mLodRolDlr9xZZQGxtW5Noy7E031dblU
         MZyTiD0CS6csrzNdM/y/kT9cZThOJzBfJnBjyuudT36134JK9rL5Y+cJlR9PkLw6In16
         I1GQFmpXC+GQjLACTJo0WVW99izKDBVRyEpioO38WVT6BB7yoB56iiO/mZo9HLJwUqYy
         WRepiT2m5sdFzS0WIaIky8pQ9PM9gsPwA3F1oZ8AlieRWNRm9qrQr3NdwmjMdkz0t3US
         NP5znb8aU6kvol1hpUX4T2gg8E0YcF+imIMZKWdgwp2eC1/JJZ5bvYf6eHZddNlll3GG
         nyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861219; x=1795466019;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FRUBObM4vFL1TGf3o6s1ZDBsKZdTJ/3jimI0MzXw8Fk=;
        b=LAqpxYTpY9cjMbb0HSmBPjmHoqSTHl/Cd5yoxqyLtoKtToYFg36wjjTyjxRux7zeNQ
         WbpCIPnWX3VBxQKRkf5BqmFaFpzZiyakNIIDZV6FRbaKKaoYvyoJGvl4CQbZTnVBsTV6
         iaK20zDSOdP4eLS19Jn2IwHyFBMwhVJAAY6I2L1WC6AbWEBp4KHXEvniRNbALCZJ101K
         0hiWS/MF+uNPXB4CpPxXfYdmzGuLvolozjbizKC7LaWhN5D8cdi1pA/eTEYyOlCFVOqH
         xlaiHuDiMaenwGk7Wi3pdOtq7Sfi9ORcRL5wEwerbT7eflHweOiaA+YWm2ewDlbN20Gr
         fjCg==
X-Forwarded-Encrypted: i=1; AL+hErF6/LIBcb7jzEwgBke9Aeij2tWVc/2+9bo+EKgpDCrcLOYEWnVvyay0WT+ZfLCNKqpWH01s/44t0A==@vger.kernel.org
X-Gm-Message-State: APuU4Z85VY2Dr10LxyJ4Y/hIILsVH8fckOgzs9mLWBGipOlF+7/Z+8Dv
	rXLOW3mo4RO3/qdH92tPi6dcGZFpdhDEKqFxBJbZuSga1rkTxcYj6YJOefcoa1pgFaA=
X-Gm-Gg: AYBFou3XA86kb7PmHvwG4VFNQwXs5JIKA0ahx2hYzolLyhFKY9dI+trbTEaUvsgO5Xf
	w9UpjQ/qI8ZAljwl6PQg672OnRfaGOO8wgC85U4rLcn8mZlb1xccA55MsrQZCKovvUmvvleljHy
	mfd7CJk2YFlMXlUgX910c1aVyXrxW5kWBVvIoHnLjz3kZEhzZIYbHPlNzOpg4zI7aC1P8q0c2ty
	+yrsUK9/uWCOqHHNTIMKTu3+L/KIWkvisJbzeprutb5JiPEBv3cd21xcRd0sVNe5d7bqClUYGoP
	/T2dHw2P//LovpHcdY8qEQIgo9H2ReWeNYmivTIw7AHItcqpxXil61O8z0KnW3gvOBjOfcnQsxk
	SE+um5/hMSXGk85ZRKIhdziPk12gZQW/r0zRWKRUrzNE2pQMPoPSmCUTGy5UZfaTCFBb2qZ0pAz
	1y/NWf7Y/GesmbK+EBNJzTKs4JF4QxZvDQqSpFsdWeXVRZmUxVGfv/8scpuQENiS0SPQvB+kmVn
	6BKYZaDEgtrb74Lt2eTtqmgYenLZdMfHI8LsJx2HGZDOjoWm9Ab8DLyMiggCrbXDDOJzS2sm0zZ
	/ACSjA==
X-Received: by 2002:a05:620a:46a6:b0:949:733e:ddd8 with SMTP id af79cd13be357-949733ee766mr1034555085a.54.1794861219140;
        Mon, 16 Nov 2026 12:33:39 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c804f9esm930800685a.11.2026.11.16.12.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:33:38 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT3OT-0000000ARJs-2rZa;
	Mon, 16 Nov 2026 16:33:37 -0400
Date: Mon, 16 Nov 2026 16:33:37 -0400
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
Message-ID: <20261116203337.GA2481588@ziepe.ca>
References: <20261106131829.3228926-1-cui.tao@linux.dev>
 <20261106131829.3228926-6-cui.tao@linux.dev>
 <20261116195213.GF2452510@ziepe.ca>
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
In-Reply-To: <20261116195213.GF2452510@ziepe.ca>

On Mon, Nov 16, 2026 at 03:52:13PM -0400, Jason Gunthorpe wrote:
> On Fri, Nov 06, 2026 at 09:18:27PM +0800, Tao Cui wrote:
> > From: Tao Cui <cuitao@kylinos.cn>
> > 
> > IOMMUFD_CMD_HW_QUEUE_ALLOC pins up to max_npages pages just to check
> > that a user supplied queue region is physically contiguous, and the
> > page array for that check is plain GFP_KERNEL.  The size comes from
> > cmd->length, a u64 that is only overflow checked, and the array is
> > freed again as soon as the contiguity check fails, so the allocation
> > can be repeated concurrently: a 1GB region costs about 2MB of
> > uncharged memory per attempt.
> > 
> > Every other iommufd allocation that scales with user input is already
> > charged, and the pinned pages charge the mapper at map time.  Charge
> > this array like the rest.
> > 
> > Signed-off-by: Tao Cui <cuitao@kylinos.cn>
> > ---
> >  drivers/iommu/iommufd/viommu.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

I'll just apply it, thanks

Jason
