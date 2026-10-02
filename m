Received: from mail-oo2-f35.google.com (mail-oo2-f35.google.com [74.125.231.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E983E3158
	for <io-uring@vger.kernel.org>; Fri,  2 Oct 2026 14:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953097; cv=none; b=GhjMDANkQg2FmtQJvbtrVHW52gH/6Lf/vFR83BStA6Q9uK8pDW1VhLi2M6YfAvf03ajgpQiAgZtdWaonVGSbj3JCrHuPAclXWmx+ffI+oHrkiSB1v9aGAyJczcF/WXIvmGyp9ofQShDcNj91euIOmXYgIJK8cMzgBi3YDYYkoPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953097; c=relaxed/simple;
	bh=JFdEDO7BbhNdAAOffGyLCj3da0YdfoH8L35xaZiX5f8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gjiVZYwdiSisIrkVfUa3taTKoOzP+ZpmXXAJo3sTzpCB7fNHmDM48rjYypK+1RNgSVU7UZyF1fa7f9ZYkG9Pr/pr9gRU8ZpYPJOa47T1KjVJQLltTtx69Rd+W+YCshAvsNDXZ8odXHfQyiS/sTgrxJwf2/aTRwfcd5aaJYrtCeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=bcSSrTlw; arc=none smtp.client-ip=74.125.231.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="bcSSrTlw"
Received: by mail-oo2-f35.google.com with SMTP id 006d021491bc7-6dd4ce68e4cso1454550eaf.2
        for <io-uring@vger.kernel.org>; Fri, 02 Oct 2026 07:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790953094; x=1791557894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8CfKy23CAsxmzAyk3IRCXSKSPIwOrCPeolO+SYZHN/Q=;
        b=bcSSrTlwut1raL9YU4EnmQwDPvE/jgSzkrSviilqYCOBPNyCMr9xOdT5MELYe/iOSR
         ldDDIXj3m8IWwYcifdy2gseABpsYvORXSTITWwgFBCjVlnGrG0LqZMIMgCHL3uRi8TXZ
         w68+ewR/CAZRm/RNcskJLwjcD7Veg8OSnryYtCyHLnuDQt3jwyVM6/HzlLaDnqegXfhb
         KCuDM5YArWbyViZdbylXlfqQUnmcgTvKiqSiQ6O+l0XWMWVOZrN+40UylOsd8XShs0PR
         B7iGHXu36bwHCsuTYGnDcMCYLrqKQD0e5g5eqMwxGpPiJqF9/S4TjwbYqvE1rWxUChIZ
         azJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790953094; x=1791557894;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8CfKy23CAsxmzAyk3IRCXSKSPIwOrCPeolO+SYZHN/Q=;
        b=dMdo188NqfTZxRgbbu37r/ZhLrtgz2V6gB36OD2cEg87XRwZemzrj95RvVpv1DcgDA
         FosM9SGo70Y6X8pb7fZZ2cs8kyF766c65+1h+ZMG3m95utF/4JrpYBeQqvFiM3TFR/9Q
         kWAhWp3ubjT2AHolxJZV3g865cMfjlrf3QCchu93PEgbliL0vNm91rugipO/3a7afOO/
         0SkuiLZ6KEHXhQ2dV5qfp2w+AU26ihO6wC6kdjgFNCj1j18kwpDemBWE6noyZopisRmW
         7hlK5LUJaR+BKHTIqs+6wK+fG2ZMAN+9JqEdHiH/M7UMhgDuKx6XWs10cI0buuh6h13R
         tgEw==
X-Gm-Message-State: AFuF++nHs4ux6ycf60QLsIxpiqiXlK4IBild+AvrpBG0xNyP+mKUJjrZ
	o78m1OqHR3raML8xJwiLJ/3wRQR8zcWOf8M5d2xfvI20+6hW0QljpWQ/SeYc6u6BX622AkI7qcJ
	CkPer70A=
X-Gm-Gg: AYBFou3QIc3lH7Hi/M7fGhPnvucQjT/6w5U5blMf9CG/O/qrJymfsQ9ZE6mhik5s+UL
	4lVNwlv4aj7OP3KjiI86Q7d+lfjt09UHIS3B+v1BwIz8s7mhyQ0ZePFfkDduuUFyoZ4s7HVrBTv
	0T5N6DPqSQtUilamM+X3xbSp7ZoHvDv+rL9Uw0U0o3hbJZPZ+EdZoiZSqXDDjFhfY0M4xApfhEV
	scrTTgQ45BjGS6Xcy+BFaeTogV2aYSJLF4pAPJmZ0tKrdWM1dKqXoiLgiyNXXl1FWp9LtTk4i9q
	NG3FK153t/pQ6ca+4xYj6sUkl4oMB1uDxW/RRR8LfZVUrJ9+FaRn3Nbrp3TDvee7eXahHHNzI/A
	Ek4tVAFYzGI35DiXcfLvr27hr5B/sGQznd+Dy3OSqFldWTaYLFFvyh+/q6XTOzooU5Zhkizd4+B
	I/tEVd9qpxKAxPLtTb0+GkZOWYPQk1j/Ks8cl5FKhi1kd+fypneMVvLXh06xEhyQiXnomVGyoHJ
	DJ7K6AIrhNjjBovuceDuu9Dk++Bo977y+129Rxz7h0hhW5vaIOkVQk=
X-Received: by 2002:a05:6820:4c84:b0:6df:224:2b48 with SMTP id 006d021491bc7-6df2f4f9587mr2369568eaf.10.1790953094043;
        Fri, 02 Oct 2026 07:58:14 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82279d738bbsm3089722a34.15.2026.10.02.07.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:58:13 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, David Wei <dw@davidwei.uk>
Cc: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261001181752.537767-1-dw@davidwei.uk>
References: <20261001181752.537767-1-dw@davidwei.uk>
Subject: Re: [PATCH] io_uring/memmap: fix non-compound alloc fallback with
 memcg accounting
Message-Id: <179095309317.42551.8653165171642480328.b4-ty@b4>
Date: Fri, 02 Oct 2026 08:58:13 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 01 Oct 2026 11:17:52 -0700, David Wei wrote:
> io_region_allocate_pages() first tries io_mem_alloc_compound(). If that
> fails, it uses alloc_pages_bulk_node() to allocate separate pages.
> 
> The bulk allocator does not support memcg accounting. __GFP_ACCOUNT is
> unconditionally supplied, so when memcg_kmem_online() is true, it only
> allocates one page. For a multi-page request, io_uring treats this short
> result as failure and returns ENOMEM, even when the memcg has enough
> space for all pages.
> 
> [...]

Applied, thanks!

[1/1] io_uring/memmap: fix non-compound alloc fallback with memcg accounting
      commit: 68477e4c562e3ec1333f64e010d75b3a257e7997

Best regards,
-- 
Jens Axboe



