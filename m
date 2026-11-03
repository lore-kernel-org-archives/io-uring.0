Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711404;
	b=jpeU8CcpS32mRCUW6mQO+A5ouYnCF6nxaXAbN1oaUjGzfzKiWZqUPUo8LMX/TjLYs5v2
	 W1lmX0TduVsiHEMAae/LI3rmOa73/x4V8UWUECT8z7AYQ67ikGU9k2D+taDs3+OORfSz+
	 vmu7c93aP17BA1po2f11NDPXX4Vbli6WBaLK7i/YKFh7QO4HphnoKZbXxxUvYFdEHQso1
	 CtGc5Yim//ONlhaIJX/ObS+XuhrSLRZ4eurWE5joQGXmnu1v/qHtgduri6q+mxxvv8qnk
	 9uvbB8REg+7XoFCgIn55F4Os8+09jCyftsU+fKlX+bMisu8ITFeZWS0csBmutZkIXjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711404;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=w3H7blSooLszPMxpdrt6nkYHGz8mEQiZ6Smc95l6Wxo=;
	b=0jIuLrp9iR/CcM0/aR/G4+yA4PXFLOGrQQhG4cQEWCxtipQJ6dBBjJ88pcQzjHM1noxg
	 uuR6sopMxQvZ6khlLFLb+/uEi0NG0DPDUUDhlGHj62dNBQy+uOvfVUlSczh12XUZviXPD
	 phb2zLou38Y9y/I+v/VqQiFPG1PD0KmmOHXQ3mt1CqaTX/NqpkRyf2gFADieOAYymoaVK
	 TLbJ/36H/Oxd3V4sIFOs59RSJdZCnFjLUpi1jA35qa6DNKIWc3Jkf8DVUZVQAVVeDwH6b
	 I3K1z7PD3j/7vgFf0cQsofYmjaN9lYl6F2pBuQj3ZkFdACG8frPrPJMphhF2EVCa3IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=cxWQCZlZ;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3DD606A326;
	Tue,  3 Nov 2026 13:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED3DD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=cxWQCZlZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=w3H7blSooLszPMxpdrt6nkYHGz8mEQiZ6Smc95l6Wxo=; b=cxWQCZlZV2IvzjmfRq2QtTPOQW
	54CSCbMtbNhCCuKN6nHKoXxgcUwzTC0AYb2d0QRHp+H+TCxCuwohIRrVe3qkyAkkupoKiw/6FJBtE
	9TOlPD6/4vliE8F81UqEAxHlp0NVe6nkdgmlSQUYQCBqvQjPrKRfv7OVY8OVo6FbKSNc2Cvc6kx8Y
	kWDEACaM/DNLJhLq0xqE3SnmoTR+ZGU0+Zbun6Puct5FSQ86QhSDtXXIEB/9yEvPkJyDgDrHVUUSh
	ue7jZ7QTQsKB6lsp5Jw/SVhY/s8yebdz6dQB9qINT7t1AwljGPNd0VQIDsFeEDG59m7+Kox52PMza
	n4x7LEig==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xOEH1-006xOC-2a;
	Tue, 03 Nov 2026 13:10:00 +0000
Date: Tue, 3 Nov 2026 05:09:55 -0800
From: Breno Leitao <leitao@debian.org>
To: Shuai Liu <847807867@qq.com>
Cc: Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzbot+675af112519ca34f5502@syzkaller.appspotmail.com
Subject: Re: [PATCH] io_uring/sqpoll: don't set IO_SQ_THREAD_SHOULD_STOP on
 thread exit
Message-ID: <auncyphG6lXI7rvo@gmail.com>
References: <tencent_BB08960D79E0261B5C1EB1E589787734E907@qq.com>
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
In-Reply-To: <tencent_BB08960D79E0261B5C1EB1E589787734E907@qq.com>
X-Debian-User: leitao

On Mon, Nov 02, 2026 at 04:05:42PM +0800, Shuai Liu wrote:
>   WARNING: io_uring/sqpoll.c:88 at io_sq_thread_stop
>   Workqueue: iou_exit io_ring_exit_work
>   Call Trace:
>    io_put_sq_data
>    io_sq_thread_finish
>    io_ring_ctx_free
>    io_ring_exit_work

I've started seeing this issue on my debug kernels.

Not sure if this is the right approach to fix it, but, I've tested this
patch, and the warning went away.

Jens, feel free to add my `Tested-by: Breno Leitao <leitao@debian.org>'
if you decide to get this patch in.

--breno
