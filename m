Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA633CEBAA;
	Mon, 20 Jul 2026 08:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535790; cv=none; b=FEYU54hoeEPTId2zMv5b/va/C99yZm1BR0V5AA6c/+lVm1kPO9HrbDwqPzkoK0FlAV725YvCXsh3Iy5SOM4GMuojbGdFyLfwLhFZIq83S5bVpiGGrB0JgairQxmLsOZsNgAhYK/4ye4tB53WnTsPMnNcLN36p4gc505HUkhmPg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535790; c=relaxed/simple;
	bh=T6KChy6g1ufYDg81NBJS6uBkDSrx7ISjslF+dRBgVDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P3O4Q7jdSYvrsShC6s2Nq4z78B7mAAbYo1iPDZo4flB+BnzJqoN3AuHRWxn+iJwG+/nUH1gDxFiolIpVTKuoZnQDkR8wwQX6S2H3EhMCErLSh8AHxB1kmX4jc49LnN3+dYR5CjStZj3neSEMSDou3tDAZhTt8fCFygXBDs9x8wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=wcgTwz1N; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wcgTwz1N"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=t/bwpgFO/+Dv4GpdKuHTDb7Gs/nL3KbpcV1H8740EhQ=; b=wcgTwz1NWCaF+GU2yhwWk08zVD
	pIVSgoBob08Ju5Gw9pHRpVqfkLt0WgUfhbhzCuFdidjhh0ZTrqzSsMRu4wbaBxjsjMNZq7GIM8h9Q
	Z0VGCCnf8i312t2QU29beLQeoeRzWbHQ9Pw6sQhCQZltiPXXmGfIRxQKD/lpcFVJpRH4N9KmoW9oU
	S6fGwAPOcnTktORyDR7HdQfOrn530zG8KN7/1WVil5RAI0ZvrGcjYlEL+EC4sTUw6P6PdeVJXp324
	r2N0l2hg0sy2Q6DhDPz1S9Vi5/Yqn06+bhVLSQgi7l0WO9LAo8PkDYmIASS6f6YEOP1QfD3u8R7Q9
	1bNiU2EA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljHG-00000006BUc-0H4f;
	Mon, 20 Jul 2026 08:23:06 +0000
Date: Mon, 20 Jul 2026 01:23:06 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Yi Xie <xieyi@kylinos.cn>
Cc: axboe@kernel.dk, io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] io_uring/sync: check unused sqe fields for fallocate
Message-ID: <al3a6tHCjwulnrog@infradead.org>
References: <20260717021312.50558-1-xieyi@kylinos.cn>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717021312.50558-1-xieyi@kylinos.cn>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Fri, Jul 17, 2026 at 10:13:12AM +0800, Yi Xie wrote:
> Zero check unused SQE fields addr3 and pad2 for fallocate. They're
> not needed now, but could be used sometime in the future.

This is the right thing to do for a newly added command.  But
d63d1b5edb7b8 has been around more than 6 years, it's too late now
as old kernels won't have this check, so you can't ever use it for
new features.

