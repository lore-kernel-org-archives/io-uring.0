Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48FA285060;
	Wed, 10 Jun 2026 06:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781072163; cv=none; b=bPFOADkc42cTDmoW8FY7iI5W13Yo81ggkIvHT/jRZ8Og3y96P8qMc4vupEf9X9pbKdBTKUrEoIsbI3rivfwuYp+B2ECzHNUA8aCkFnGPZDnzEa+FhWcszQie0/3OJaF+VU3yAW0kkFRf11WMSARP7npSYPXTfVsoUM0EFZE8vBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781072163; c=relaxed/simple;
	bh=md4mTGUy01HWnskT2hdyl/Jz/zUMfy/Ylb2WJ+SzRcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mD5YzrAP33cgiaLYykxuRh8PDbC15aZV9WISdE0sNT3f/fkiL0WmkZuNtLYe1wc1462xgkQeBddHP65TP8JHBlGahJzY8DW/h3SMO/DnTIQfuj7cmLWBFcSoCumq/JaiQSJyDtVaGGmtX2Cbja3I5ot0XI0y0U76rdF59fBQ+9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=O53ANJ7b; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="O53ANJ7b"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZYcfTOHydXOJAhBLYAGRX1re7dw270KkkfHrimmIDQg=; b=O53ANJ7bx7/yhJm6AXMBGgzu5q
	cJEke3nRIKODG09KcFF6CgtA2xV1kx6pQU5xEpFiMlJc0JcVexQ6tYJik2E70G9YDp20xTIjUpR+b
	2l1QqYxqWNPLtoU35jQHxgakzTREIXQrsPfdEpjEOvBOC2Tzel4WbdGR8t4cGMoUc87OtggRaoyJw
	q+5pZG+zOKPN5NbFxLQilXFdDFscQ8bPLJoTgx3Y9tDJRPFy/FbUc+WPB0ZF5CrjON0ADb2XPYGvG
	p58ESrYWhKLf+vHcZq+cwqC4trQXl8tbBy4rVoUqlAAjRSfztG90wQWUIanSbDVzPzt8E2x+3bU5h
	dharo9dA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXCEK-00000006rdy-1vdO;
	Wed, 10 Jun 2026 06:16:00 +0000
Date: Tue, 9 Jun 2026 23:16:00 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: sw.prabhu6@gmail.com, axboe@kernel.dk, io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org, dave@stgolabs.net,
	dongjoo.seo1@samsung.com, Swarna Prabhu <s.prabhu@samsung.com>
Subject: Re: [RFC v1] io_uring/rsrc: add fast path huge page handling in
 buffer registration
Message-ID: <aikBIESiJftxBdfL@infradead.org>
References: <20260608062937.804758-1-sw.prabhu6@gmail.com>
 <c924fb59-be47-4fa5-adbf-a50a831ccd7b@kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c924fb59-be47-4fa5-adbf-a50a831ccd7b@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Jun 09, 2026 at 08:36:43PM +0200, David Hildenbrand (Arm) wrote:
> I really don't like arbitrary GUP users to starting to special case hugetlb
> folios, and making assumptions of how other pages they pinned look like (IOW,
> how the page table mappings actually looked like).

Me neither, but the current interfaces are kind forcing them :P

> 
> Ideally, we'd have a pin_user_pages_fast() variant that would give you a list of
> folio ranges instead of individual pages.

Yes.  iov_iter_extract_bvecs and thus the block direct I/O fast path
would instantly benefit from that.

