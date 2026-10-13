Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2FB344D91;
	Tue, 13 Oct 2026 12:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895524; cv=none; b=DrQzAiRj4FGdM4FbqrannvqhPWrU/iAPoKoKkMFlghebcMRlfAB7LJnPUTIlQEsNnc76nqWsaVQDW6ZrtSr1mb/qh4fVFcTaNMuewGx+j/i8dcKMJs44ES9oDvDY1y66YJ/COx07L/ZLGWJbJimrFMQ3CauLnppcouit8p0ner4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895524; c=relaxed/simple;
	bh=4hLP26aES8qrQBUqpEN858+DfJbhFIlH5B9vfpCpUxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JgkJMe1SWIphCe0/G1UY9xwdfwKFEzDtfjkX2L8gdg/xnDWvzR4zGM2SuxtRqcut4c5yp1vlAKy0hnq8hXYg1eQjaCiO9Sj0oLlwb1T73tdXWlXKYo+w2UJzJw71t07UFTz8kr1YHqjv5wsMrkJF4qn7U/D2zaUrlLcHXddG1pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD0701F00893;
	Tue, 13 Oct 2026 12:45:21 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: sashal@kernel.org
Cc: asml.silence@gmail.com,
	axboe@kernel.dk,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] io_uring/rsrc: fix build without DMA_SHARED_BUFFER
Date: Tue, 13 Oct 2026 14:45:14 +0200
Message-ID: <20261013124514.2364554-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013122417.3-1-sashal@kernel.org>
References: <20261013122417.3-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Sasha,

> io_register_dmabuf_desc() calls io_register_dmabuf() unconditionally, but
> io_uring/dma-buf.o is only built with CONFIG_DMA_SHARED_BUFFER enabled.
> This causes an undefined reference to io_register_dmabuf() when linking
> kernels with CONFIG_IO_URING=y and CONFIG_DMA_SHARED_BUFFER=n, as reported
> by KernelCI for i386 allnoconfig and ARC haps_hs_smp_defconfig builds.
>
> Move the configuration check from io_register_dmabuf() to
> io_register_dmabuf_desc(), before allocating the resource node and mapped
> buffer. This lets the compiler eliminate the call when DMA-BUF support
> is disabled and rejects DMA-BUF registration with -EOPNOTSUPP. The check
> in io_register_dmabuf() cannot handle this configuration because its
> object file is not built.
>
> Fixes: 4bb797852328 ("io_uring/rsrc: add dmabuf backed registered buffers")
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Closes: https://d.kernelci.org/i/maestro:0c0fb2ae8f67a98485b9c0cd122f4e5d5156c481
> Closes: https://d.kernelci.org/i/maestro:c4ceb57bdf62b29a8c2fdc83e22c1d5594f06460
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Thanks, this fixes the build on a variety of my test systems
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
