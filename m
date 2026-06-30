Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9BE261B8D
	for <io-uring@vger.kernel.org>; Tue, 30 Jun 2026 09:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782810667; cv=none; b=lh9+f/LL1lRq/a3DFmup6TA1lI+m+Z3QUruFAIiZkA6MTwTgf+O/1rLT20vTh5NMojLYURsKIVMeBzwnoDFuuvLGwg0kcEbK5Qtmt8ngZ0/BSYzvd71pxp3AJ1/q7oKbjHUOlt8PoVihh4YRvBlJuipdPFKN0S5v3axN+aWewzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782810667; c=relaxed/simple;
	bh=nKQ6l91PIJzZhKyKinKW8v/oM+jEdCEC/HgrZY2A19A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bySD06DBuhIFRY72VLlA7tV72VIXQhv8MSm4c9bFLp4hPfjux86EDfiL66/ogGv8PJGmV6zlrEMQPAwOZ0uzmXW7fj/beU3pLx5GNmH7xZOGj0ukCxEoBSc9r1YrngrEZmhExFkZzVRIVVGLmSsdtyQpKqJbmVxjpwDkJVjRUcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Pcks8zuF; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Pcks8zuF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Wa
	lhfPxv7+dqsGRk46VFpbPHDrgaAPEhEA/oldE5bBo=; b=Pcks8zuFhItHP7EK/6
	UxrJRnTjHmPZKk2Hs0RF5zafoUPGzdDIQ9Jr/TFnfwYnknpTsqV+28o1LYOsON4U
	o3Wt+3FLMRCb/XoYRNHWFE592TNiTGi4cVL41xyqblx+GA+Y1awC0Dd+0c/cyhMV
	RDLIZ3yg7vXK0bgejEIXe5tx0=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wCH75EZiENqEWaKGA--.13722S2;
	Tue, 30 Jun 2026 17:10:50 +0800 (CST)
From: Yang Xiuwei <yangxiuwei@kylinos.cn>
To: xieyi@kylinos.cn
Cc: axboe@kernel.dk,
	io-uring@vger.kernel.org
Subject: Re: [PATCH] io_uring/rsrc: bound io_coalesce_buffer() page array allocation
Date: Tue, 30 Jun 2026 17:10:43 +0800
Message-Id: <20260630091043.522534-1-yangxiuwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260630071017.100436-1-xieyi@kylinos.cn>
References: <20260630071017.100436-1-xieyi@kylinos.cn>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCH75EZiENqEWaKGA--.13722S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr18tF1kCry5tr1fZryrZwb_yoWxurg_uF
	WkAa42yw43GF47Ga1qkFWfXFyDtw43Wr4xuFy5uFsrAFyrXFZIvw18Xas7Zr17Kws2yFZF
	yr9a9a1jyryYgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRGZXr7UUUUU==
Sender: yangxiuwei2025@163.com
X-CM-SenderInfo: p1dqw55lxzvxisqskqqrwthudrp/xtbCwRqTJGpDiBoRagAA3s

---

Hi Yi,

On Tue, 30 Jun 2026 at 15:10 +0800, Yi Xie wrote:
> kvmalloc_objs() in io_coalesce_buffer() does not check for size overflow
> when nr_folios is large.  Mirror the check used in memmap.c before
> allocating the page pointer array.

Thanks for the patch. I don't think this check is needed on the current call path.

io_coalesce_buffer() is only called from io_sqe_buffer_register() after
io_pin_pages() succeeds. io_pin_pages() already rejects:

	nr_pages > INT_MAX / sizeof(struct page *)

io_check_coalesce_buffer() only increments nr_folios when it walks across
folio boundaries in the pinned page array, so we always have:

	nr_folios <= nr_pages

Thanks,
Yang Xiuwei

