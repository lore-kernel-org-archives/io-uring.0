Received: from mail-vs2-f8.google.com (mail-vs2-f8.google.com [74.125.227.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D3843F8D9
	for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 16:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790267343; cv=none; b=BKBSlXYANdrqy0Mo3C+0qcyvP19vCdYpwU1Tc3a10VHNzwTQjaYD7KXSKMzRzdHDQ7Q9maOFwnyR/UYk5zINbdF+DmQ4lVSoKRf15cZ5ss8hHD99BSTiGXEUSO5VSUX/wDc/sJYTq5l7mZxRmZBq/DCSDyH0yv439hRB4UrnESo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790267343; c=relaxed/simple;
	bh=6JAyN6KCHJkun8RaYA/N/Lkl7G4cohxxa40b/UiFDIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VefRsRlQP4t/61FyMDM0chfW0bAJ6l/VIVuYCqUpS/Jn6bAMBpNano1ZIPpQb5/aduzaC8M+lEPFYpVztpceYpeR2hV1/RTV9Ej4Iw+I42o6dGeB+X00yLFpPYV9FNFqwum5H9h+5UejqZ5Xo/1E4ibwd4iCeSvjXmDdvEse8vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MllQU6lR; arc=none smtp.client-ip=74.125.227.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MllQU6lR"
Received: by mail-vs2-f8.google.com with SMTP id ada2fe7eead31-7a059bc7fc9so1683137.0
        for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 09:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790267341; x=1790872141; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xLyYsD993XTzHjZ8D4HrQO5P8mJRUn3I9bCqJpm8IUU=;
        b=MllQU6lRf4kX5WlGzJsip5OT30JRHd+lVK7yxTfNCyREeYKK7LlhKcb9Fy4kZv+TAc
         m9uUco//Zw8iNgf6xcHYecEtB7+njYD2axCEfsZlPVkmpeV3x0rBrVP4qCneXpXSCXth
         cWzLT01gbuThxYFk/bdOA4ujfOUYwVy9+YcSVUgCwBue+pJumK5G8XeG04SW3FdRNPaO
         M4zFHlY22GKY9DXDXnD9jQCIPgsUXfyRKE5/luLWgnEJJpkVlbckrg2s5xr9sCOcqZuM
         V/jTuzooBo3aI6B4YJs1cLQYs4mC4JAs9ATiRlA1P4d1ul9xoH6GfIA05Fhk2TzrEdfU
         Y5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790267341; x=1790872141;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xLyYsD993XTzHjZ8D4HrQO5P8mJRUn3I9bCqJpm8IUU=;
        b=JPlUC0lFmGCJfRbbidCylIVtAmibDsMMr4eMp8Br4sHtS2GE9AYKOxEJQ+r1MHLAGA
         TOd90EXFTrZ8sarHdE9dsTx4Kxg8hRKxVY/tNFc4HEbVfsXTdbAl50IAN0ZmQCoZDXPz
         6s6A3T7rRAcNMSsA4sHd3tZNoU4h/JaMbUiB3zsGL+WebrgT2A72cVDg2f3QuVytFTri
         b93PncOemzUsffsq/SzehrHscksMbEqEihRWOnQJhtkultxSGz6EEPaV6WrR9vAm7i9T
         wef49mhf3fCsZPFzmN9vCQQ7uKk035hCXOCfyHHU/ThYqBXWa5OqnWsAF9bD4Nu7QW1K
         GVfA==
X-Forwarded-Encrypted: i=1; AKwUvBw9oqhIsDCiJxNQarHad9vcP5cL6ORUK5903sWipUf0Y4d2eekJ3Lpvph4eFM7R1AR/SF1+SOY4PQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lBr+kEHKU5oit3VZ6611iRJIGGTEOhIttzDcqyodynaEzKJuKB
	JiFO39s0L1P34Pu9iMZllj4LAEi6Gc5n8P95imRG6FBIw/yReANxzvXf
X-Gm-Gg: AYBFou3i1LIvLQ5p5B7RBaEjT4dJfPUro1AkOfV0Umq+RCEyr63WYa0a/L6Ikut+FFL
	1j6HUHV8AMu6mEhVPKhfttixhsR9T1midT/55My5cqToudEkMZ0gaiPEQZjl40Zbg9+1zSw8fa/
	LSrjldMXOBFKKjklEROENh2GzXldnxi3fTSeOguXXEqDrzTVKt2U9EtTfkLNyGQd2WLez3UZRnZ
	Oi7ktjGgGeEnSsDLlTZSb1fs6lUN6aEig4Hf7jbxKwxpDBRHonJrUV/8RPTD+3CWMtpQhgwNgRZ
	urn9rms34/YG6jU5BFYrT7WxaGr2GRVegSu/Mr1SQHrcviIdX5e6OahYrczV5d3ay5u00sziCh6
	59jprgIuSvZYfIceCEDAjEiYqtm5rbFYyeCTzVqkPaF1JZlOrwwjyv7CPHQCVUC/y/gpXOO0iK+
	QU1ziFlt+lySPp+99WBrn5pktxo2JOo4xJG3lwu+ETpLouURl/27fztiX4w5x/Dkx0HrmaHIWjl
	TY=
X-Received: by 2002:a05:6122:1dac:b0:5c9:a5be:7b50 with SMTP id 71dfb90a1353d-5cb0b873c55mr1456356e0c.7.1790267341056;
        Thu, 24 Sep 2026 09:29:01 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4f::])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04c2a36sm7729420e0c.5.2026.09.24.09.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:29:00 -0700 (PDT)
Date: Thu, 24 Sep 2026 09:25:20 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, hawk@kernel.org, 
	ilias.apalodimas@linaro.org, asml.silence@gmail.com, axboe@kernel.dk, sdf@fomichev.me, 
	bobbyeshleman@meta.com, almasrymina@google.com, kaiyuanz@google.com, 
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] net: devmem: use memory provider helpers
 for net_iovs
Message-ID: <arVOvjCdkOKDoq1L@devvm7509.cco0.facebook.com>
References: <20260922204348.717198-3-sdf@fomichev.me>
 <179020718952.2160803.820732555059297637@kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179020718952.2160803.820732555059297637@kernel.org>

On 09/23, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] net: devmem: use memory provider helpers for net_iovs bundles a
>   real bug fix into a patch whose commit message presents it as a…
> 
> --
> 
> net: devmem: use memory provider helpers for net_iovs
> 
> This converts net/core/devmem.c to the public memory-provider helpers
> net_mp_niov_set_dma_addr(), net_mp_niov_set_page_pool() and
> net_mp_niov_clear_page_pool() instead of open-coding page_pool state,
> switches the net_iov array to kvzalloc_objs(), and now rejects DMA
> addresses that cannot be represented in net_iov metadata.
> 
> >  	Zero the net_iov array because net_mp_niov_set_page_pool() ORs
> >  	PP_SIGNATURE into pp_magic. Reject DMA addresses that cannot be
> >  	represented in net_iov metadata.
> 
> [Severity: Low]
> This isn't a bug in the new code, but should the "Reject DMA addresses
> that cannot be represented in net_iov metadata" sentence spell out that
> the old behaviour was a silent truncation, and should the patch carry a
> Fixes: tag?
> 
> Before this patch net_devmem_bind_dmabuf() dropped the return value of
> page_pool_set_dma_addr_netmem(), which is the "this address does not
> round-trip through the compressed net_iov metadata" indicator:
> 
> net/core/page_pool_priv.h:page_pool_set_dma_addr_netmem() {
> 	if (PAGE_POOL_32BIT_ARCH_WITH_64BIT_DMA) {
> 		netmem_set_dma_addr(netmem, addr >> PAGE_SHIFT);
> 
> 		/* We assume page alignment to shave off bottom bits,
> 		 * if this "compression" doesn't work we need to drop.
> 		 */
> 		return addr != (dma_addr_t)netmem_get_dma_addr(netmem)
> 				       << PAGE_SHIFT;
> 	}
> 	...
> }
> 
> Every other caller treats a true return as fatal, e.g.
> page_pool_dma_map():
> 
> 	if (page_pool_set_dma_addr_netmem(netmem, dma)) {
> 		WARN_ONCE(1, "unexpected DMA address, please report to netdev@");
> 		goto unmap_failed;
> 	}
> 
> and io_uring/zcrx.c returns -EFAULT. Devmem was the only site that kept
> the truncated address and handed it to the NIC for DMA.
> 
> The path looks reachable from user space on 32-bit arches with 64-bit
> dma_addr_t: netdev_nl_bind_rx_doit() only checks is_power_of_2() on
> NETDEV_A_DMABUF_RX_PAGE_SIZE before niov_shift = ilog2(rx_page_size), so
> a sub-PAGE_SIZE niov size is accepted, and the bind loop then advances
> dma_addr += niov_size producing non-page-aligned addresses whose
> compression fails.
> 
> Given that the next patch in the series ("net: devmem: decode DMA
> addresses for TX") does carry a Fixes: tag for the other half of the same
> 32-bit/64-bit-DMA problem, would it make sense to split this hunk out
> with its own Fixes: tag so it can be picked up for stable?

I do not think this suggestion makes any sense. We do need to check
the return value of page_pool_set_dma_addr_netmem. Whether it's this
patch (I think it fits better here), or next - does not matter much.
