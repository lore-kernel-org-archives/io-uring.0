Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F672F549F
	for <io-uring@vger.kernel.org>; Fri, 24 Jul 2026 14:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784904891; cv=none; b=kIXfqUDvATuKLN2Ib5+4AWBtPT6Pz/EeeQ6bJqkuYXfiCxfYKg6Q434MeZ1BoSpPmRqUh6NUUGHvGw8Apooai7QxGTFzfxERu1Xmn9cANFWBD8zqLj4ZfygvIh0UgZGvmd7FO+h5lobRJ3I3lvJhRi4HxzSVxi6DpD65Ase2Vyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784904891; c=relaxed/simple;
	bh=ws7pPM5pomNPXyeBV7gKA1VAwCIgldyhmLgZX26cbaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ixu/FodbeyZdUMibivK6GycWhAmsKTs1uuTDPfDuOv01WKGrt2FxXnzS0x9DJBwMj9+IHAxMsqRmqtbIOMjrhOL/6+oTvS0Bf/KQ4YHROXx/jCT4ezlSb7H2GRvDM+0lxAMJI7m0Gur3NHOCuKojjs/HJvBdi9zbl4hyl+8OX90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PVgn92KN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PVgn92KN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784904882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ws7pPM5pomNPXyeBV7gKA1VAwCIgldyhmLgZX26cbaM=;
	b=PVgn92KNhGxaj1M4Eph6Cq2+V7bwSEOLvJAhDjwHvxmuVnzN52tKv3sUajK+KuQ/QBDrTd
	ClMCWLSwy47e7e1z/FbY7iBXD1E1lGXjjlLoaDc36HYsTgaux+R1IuUax8WCWzYI4JDGe+
	c2tqOruOpYRRvicXIOHiKMuhtjGr6WI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-58-g4KwqMnTNcaYHYrg7zyxwA-1; Fri,
 24 Jul 2026 10:54:38 -0400
X-MC-Unique: g4KwqMnTNcaYHYrg7zyxwA-1
X-Mimecast-MFC-AGG-ID: g4KwqMnTNcaYHYrg7zyxwA_1784904877
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 399B1180ABE6;
	Fri, 24 Jul 2026 14:54:36 +0000 (UTC)
Received: from fedora (unknown [10.44.33.21])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 35E0215AB;
	Fri, 24 Jul 2026 14:54:31 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri, 24 Jul 2026 16:54:35 +0200 (CEST)
Date: Fri, 24 Jul 2026 16:54:30 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Breno Leitao <leitao@debian.org>,
	Christian Brauner <brauner@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	io-uring@vger.kernel.org, Alexey Gladkov <legion@kernel.org>
Subject: Re: [PATCH 0/1] pipe: only enable the extra wake_up(rd_wait) when
 epoll is actually used
Message-ID: <amN8ppPXRiUdiVKM@redhat.com>
References: <amIqfCo25rLtM2U0@redhat.com>
 <amIu5WWgTNkdvqIz@redhat.com>
 <amNvebqiG2fH0W_L@redhat.com>
 <CAGudoHGiKYfF6L1yFy+QZgQaTt5ULnp6rgRaZE=6BANkpjrb7g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGudoHGiKYfF6L1yFy+QZgQaTt5ULnp6rgRaZE=6BANkpjrb7g@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On 07/24, Mateusz Guzik wrote:
>
> On Fri, Jul 24, 2026 at 3:58 PM Oleg Nesterov <oleg@redhat.com> wrote:
> >
> > This means that io_uring depends on the "nasty semantics" too, io_poll_wake()
> > path should add the task work which calls io_req_post_cqe() every time the new
> > data arrives, even if the pipe was not empty.
> >
>
> well io_uring could set the flag as well in that case? it does not
> inherently mean random select and poll consumers definitely need this.

How? I don't think io_uring can do this. It doesn't even know if the file
is pipe or not. Only file_operations->poll() does know...

__Perhaps__ pipe_poll() could check something like wait->_key & EPOLLET to
detect both epoll/io_uring... Not sure, probably not, I'll try to check later.

Oleg.

