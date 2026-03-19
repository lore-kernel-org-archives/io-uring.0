Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393DD34D383
	for <io-uring@vger.kernel.org>; Thu, 19 Mar 2026 10:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773916076; cv=none; b=rK8vTWRAkmJVMOqeZ5PhGMXO8fGhOBhC43CoYSbrVGiyRUxVR4ELKKizxGa4z0DKEDLoz6aVtXJAXQPHr0oFAQghUq54cDCR7XvS7Rs6Nk9L2hTIj4o2rBCKkAR8fOgEoLFhti+qi1SlHptItervBXZrOsI9hAnz8YQmEa8EkXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773916076; c=relaxed/simple;
	bh=yKl8SsopM1Hbtl5K1FEnr9+JSgnLq4kN/Wq7Pa16OLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJdXEJb0MuBumcpjC/lluNTyieEiIGCLf12P1l1N5RF9Wu4xOh7/vIy1c3MfkaXAeG7j5vgI7ueOG7CRQuba9OV6gRcEtrrmXBN2gtzGXLeTdTqkCuKidXsniyH4pXsRv6omcPtp72yITIDKMAR+xLrWqCFAgRFZ7DWNU/ui+TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H9Pp3aOU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H9Pp3aOU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773916074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2ME/flKx2UnJnQsyPnjoLGiWj59TPfb1uAAWvAJapZk=;
	b=H9Pp3aOU951iWZ8zg/nU9EqhHJm9v7YYQGDifq3tJgJXCYY9pQPTTjjc22Wi8+73CjRv/8
	LBxtRLPIKpPaRmzPqlbpgzkXdLXqJbDmGIi/U4INtyjMwQ8VEG8j4Me+hPpYrv6Xwx6sdF
	ZTbOUrM+DQA6W8FuE5ibZtTeD2e9eP4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-48-LLTKNhq_P5i3Alu7hkHb0A-1; Thu,
 19 Mar 2026 06:27:52 -0400
X-MC-Unique: LLTKNhq_P5i3Alu7hkHb0A-1
X-Mimecast-MFC-AGG-ID: LLTKNhq_P5i3Alu7hkHb0A_1773916071
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3F5B619560A6;
	Thu, 19 Mar 2026 10:27:51 +0000 (UTC)
Received: from fedora (unknown [10.72.116.152])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3002D1955F21;
	Thu, 19 Mar 2026 10:27:46 +0000 (UTC)
Date: Thu, 19 Mar 2026 18:27:41 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Stefan Metzmacher <metze@samba.org>
Subject: Re: [PATCH v2 0/13] io_uring: add IORING_OP_BPF for extending
 io_uring
Message-ID: <abvPnUeugDc5ndpL@fedora>
References: <20260106101126.4064990-1-ming.lei@redhat.com>
 <8dc16ad6-f329-40de-b7f8-6bf051df3d35@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8dc16ad6-f329-40de-b7f8-6bf051df3d35@kernel.dk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On Wed, Mar 18, 2026 at 01:04:23PM -0600, Jens Axboe wrote:
> On 1/6/26 3:11 AM, Ming Lei wrote:
> > Hello,
> > 
> > Add IORING_OP_BPF for extending io_uring operations, follows typical cases:
> > 
> > - buffer registered zero copy [1]
> > 
> > Also there are some RAID like ublk servers which needs to generate data
> > parity in case of ublk zero copy
> > 
> > - extend io_uring operations from application
> > 
> > Easy to add one new syscall with IORING_OP_BPF
> > 
> > - extend 64 byte SQE
> > 
> > bpf map can store IO data conveniently
> > 
> > - communicate in IO chain
> > 
> > IORING_OP_BPF can be used for communicate among IOs seamlessly without requiring
> > extra syscall
> > 
> > - pretty handy to inject error for test purpose
> > 
> > Any comments & feedback are welcome!
> 
> Ming, can you respin your series against the current tree?

OK, I will post V3 for review.


Thanks,
Ming

