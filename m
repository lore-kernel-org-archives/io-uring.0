Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795344562;
	b=VrXgHIjbz2q4AYv2to2GEuS6VDx6pw7ypokUKZP46jyhszB0swyQasS1WlwgbD2o2obc
	 8/4BMUpyvYE3NhWx/fJ3GhENwFZMtzi9XmpPJROeQrFOCaXuk+sVu5R9ib9xDAkLh8Kzq
	 tqB/hvA9iPHhIwXGUhhbY7V62vKxset7chA27t6Tv2+2dYonXgNfARK3Fz8hi5doAZ8PF
	 8plPJ/+jmLBoD61x+lbB5wBcjkc92jnS2l6ZqfBmr3K2JOu9tji/rntQX/nn7R3aqh738
	 uA6vOCR1TSD7V5GHh6FWCmJ+Qw6rj2NMsnSQYjM0qdAZuNPfMO54X+uv/1ozrLIk9vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795344562;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=SdPhVrPD3FLfRdA9n5gci/RQLV/kspB0OdPKdxqs61g=;
	b=0YTAHaBUjheC0sX5GLXvT67/RcpcSpCaTxJq2y6U3YQMisl+vnOXBGaD6D+Spyi9JIKA
	 mDLU7/uBmYm3ESd/OYGmz/EyMVYPjRKHt9/zL9jgOo92778MCViasxyfLpXU5VPaiGdhW
	 Ex7X0Iboz8CRD9+wJv4qh7L6/Y8YRyqelp+FpI2LtwaB0Y6fN1MLOypqKTiSb7bb69gVL
	 A0NYFm848CdciHzWQ8mOMJBAdZnD8qidVChlOS/+JWZVhKw4+htV3Tsh+IgjpgXM3pN+V
	 zVGrI+fI4kzvnkqRoJGuG/GhqSh8ZrpLZTJvEHK2dEJHqOdyfTepR1F4aXVugo0xYjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=njt6uaCY;
	arc=none smtp.remote-ip=109.224.244.25
Received: from mail-24425.protonmail.ch (mail-24425.protonmail.ch [109.224.244.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0433606A32A;
	Sun, 22 Nov 2026 10:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0433606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=njt6uaCY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795344558; x=1795603758;
	bh=SdPhVrPD3FLfRdA9n5gci/RQLV/kspB0OdPKdxqs61g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=njt6uaCYTLwQ+imeLSN37A0zq9iaPO/++XP/P6IDtELLxW1Ih7KDeHkHWY+1rURw9
	 IYVxLJXOe+Tx/vtNR16Y8RWottwqjOpJqBIaVFBwpI0rc9XmzZZ4xGb3ymbuji7pAZ
	 2rEtl/4igA/WcGth1adLfgAWOXMUxn6MfnYs50RcjEreyNxW4ZzVtJ10Qwa1/wEHAB
	 A99yCbjJAF5/QkhPjBcJ2OmU6PGOVO/afZyvWrivi0fxkCssDF5X+mL4ca8c4rMXVL
	 lVFNLCS2kqPxf0rUfxFKjFpbEUcHd0YpQvzB38IEEqGbxQIthX1O3Yg3WD7j0z20yV
	 EAzNCCQBKIzNw==
Date: Sun, 22 Nov 2026 10:49:14 +0000
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, "christian.koenig@amd.com" <christian.koenig@amd.com>
From: Falconet3 <Falconet3@proton.me>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "axboe@kernel.dk" <axboe@kernel.dk>, "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>, "asml.silence@gmail.com" <asml.silence@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dma-buf: fix leak of ctx and dmabuf reference in dma_buf_io_ctx_create() WARN path
Message-ID: <tRqxbL7txMRAzNLKylzBLQURNLpU-D0Xx5CrngGwLoYrK7V7kREharagUfgQLGIfiYFyTALR0BwL93AL_PWmFXq_MoZPhvPfUojBsyCnilI=@proton.me>
In-Reply-To: <htm5h9oaY-vk0g9JVYJmz5XCaKe_nPoWkUJYJqDulyNvv_sAWfzSMp0T6GWt5okc8R4SyvXXpJQ3VGhetKnjEa2KGem5uCYdxpmdzUFf6XA=@proton.me>
References: <htm5h9oaY-vk0g9JVYJmz5XCaKe_nPoWkUJYJqDulyNvv_sAWfzSMp0T6GWt5okc8R4SyvXXpJQ3VGhetKnjEa2KGem5uCYdxpmdzUFf6XA=@proton.me>
Feedback-ID: 48740069:user:proton
X-Pm-Message-ID: 67157a7a4555990622919bb0247c6c6c6fb36fdd
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Withdrawing this patch. Apologies for the noise.

The WARN_ON_ONCE() path in dma_buf_io_ctx_create() is not reachable with
in-tree code: the only in-tree implementation, nvme_init_io_ctx_locked(),
installs all of dev_ops (map/unmap/release) before it returns 0.

And on the only path where it could ever fire =E2=80=94 an importer violati=
ng the
contract =E2=80=94 freeing ctx directly is not safe: init_dma_buf_io_ctx() =
has
already attached ctx to the dmabuf and linked it into the importer's
tracking, so kfree() + dma_buf_put() leaves dangling pointers and turns an
unreachable leak into a potential use-after-free. Since dev_ops->release
may itself be one of the missing callbacks, the core has no safe generic
cleanup on that path.


Thanks,
Falconet3




Em domingo, 22 de novembro de 2026 =C3=A0s 00:05, Falconet3 <Falconet3@prot=
on.me> escreveu:

> (leak of ctx + dmabuf ref on the WARN_ON_ONCE path, new file in v7.4-rc1,=
 patch attached)
