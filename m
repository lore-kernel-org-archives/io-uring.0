Received: from mail-01.1984.is (mail-01.1984.is [185.112.145.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129342EFD9B;
	Mon, 18 May 2026 17:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.112.145.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779126664; cv=none; b=ue9SzoU7GMYAJRlTUUsEkVsd7Ls98Z+6W5OCLNhApmufUJpb4+pZTyGVlOc6WFSyr0uR+jo+7xJstFMbWNvtcwundYkUodmygeTIER2502F9n2TmSymMCkmwhGzj7nItWKCXvpkhQkp1oPON7hceb3suhdD7wn2EdWdzx7wEGww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779126664; c=relaxed/simple;
	bh=crXW9bx10A5BNDD+/SwWixkiVVCXIsfBolkeE2Vu2Ps=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=DI9EjZHS4Vwm9F7uO6eJd/hOPEMoNr9nFMEGsIANw7qgGcRGhAAZrv/TLX9c8ud1nuoJqHCfmfg/ZPkApPqvCB/MedeEp7VAt2ZbHjM821gDhUPkWdv9uIXbkZ+MGFYdvmlW2K/N0cq3TgU6FtvVpWL7sSmvgPdrUGbD7Wf/XNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=berkoc.com; spf=pass smtp.mailfrom=berkoc.com; dkim=pass (2048-bit key) header.d=berkoc.com header.i=@berkoc.com header.b=hCVCWtkm; dkim=pass (2048-bit key) header.d=berkoc.com header.i=@berkoc.com header.b=NeWCjOKd; arc=none smtp.client-ip=185.112.145.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=berkoc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkoc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkoc.com header.i=@berkoc.com header.b="hCVCWtkm";
	dkim=pass (2048-bit key) header.d=berkoc.com header.i=@berkoc.com header.b="NeWCjOKd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=berkoc.com;
	s=1984; h=MIME-Version:Content-Type:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=crXW9bx10A5BNDD+/SwWixkiVVCXIsfBolkeE2Vu2Ps=; b=hCVCWtkm3PzM5WydTVqokeLtQF
	HH4hJqs7Dg8/9gZ5hRE3bOPqenZqKs7CuCX/L/+gviLPx/KW3zM4wtlYxIGJhFRr1C2mZKvSbWgi/
	02nLyh5VQj2ImbKPRIJhKApKze9i1JpWgywWVfR+Deju5o8JZjPrOaOPFBB1DosepZ5105WHM4r1B
	syiucJThUr7ZjfzJXw3LUWuYdl1xY1GQQ46F0LSskhCZmjMcr/frtJ6sOzLlFPktGiABAMatd+Lar
	EfSbZihNfDNJaSO60a9yqPUUa2CziiKvtI/yK8HT8n11ApkM6pDng9o9p0X95R3MhOGfkJKYZI1vY
	z9zCPlTQ==;
Received: from localhost
	by mail-01.1984.is with utf8esmtp (Exim 4.96)
	(envelope-from <me@berkoc.com>)
	id 1wP26z-002Dv9-0V;
	Mon, 18 May 2026 17:50:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=berkoc.com;
 i=@berkoc.com; q=dns/txt; s=me; t=1779126631; h=message-id : date :
 subject : cc : to : from : sender : reply-to;
 bh=crXW9bx10A5BNDD+/SwWixkiVVCXIsfBolkeE2Vu2Ps=;
 b=NeWCjOKdC3+iioqNg5dYNrUCR2rMF9FOcC4laR99W9rRB1sCtrhR0I9KPMC9FRIL4Z+2J
 hXwzGwmVQOlcfIqw4YcqK/0GmfSWDB0nPRCOezCR24D20Fr/v4czjWfmz14D0rwDC4/rgsR
 CSEdoVT/VwsI5ALI9Y9jTFttRbh9zIDciph/jZcKf+avjSJ4waDPHxZM3z5vdAKzPGcH8ho
 7TWCfaF9dOa4hrAvYmChspBMWe9RkJOsZ1egUtkMwMFJ89q+zPw1qOHabKxnS6zZ1TGxopp
 9VTIGNFVwxSplt8aMXzEUjXO8kS591rVGgucoRA1cDyKVZ9YE0Quh4Ya+IOg==
From: Berkant Koc <me@berkoc.com>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Bernd Schubert <bernd@bsbernd.com>, Bernd Schubert <bschubert@ddn.com>, Greg KH <gregkh@linuxfoundation.org>, Miklos Szeredi <miklos@szeredi.hu>, security@kernel.org, linux-kernel@vger.kernel.org, io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>, fuse-devel <fuse-devel@lists.linux.dev>
Subject: Re: [PATCH 2/2] fuse: wait for aborted connection before releasing last fuse_dev
In-Reply-To: <CAJnrk1YjShKKKgTox9QQ86Y7zzRWUVscvWRCuetHEqv55bdh6A@mail.gmail.com>
References: <20260517-fuse-uaf-patch2@berkoc.com> <2889c98c-21e8-47eb-903a-ea40bf5c8c04@ddn.com> <20260518143218.7c7c1689.clarification@berkoc.com> <0e4f0d30-7ed0-431d-ac9a-874b046337cf@bsbernd.com> <CAJnrk1YjShKKKgTox9QQ86Y7zzRWUVscvWRCuetHEqv55bdh6A@mail.gmail.com>
Date: Mon, 18 May 2026 19:49:47 +0200
Message-ID: <20260518194947.joanne-fuse-ack@berkoc.com>
Content-Type: text/plain; charset=utf-8
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Authenticated-User: me@berkoc.com
X-Sender-Address: me@berkoc.com

On Mon, 18 May 2026 08:35:16 -0700, Joanne Koong <joannelkoong@gmail.com> wrote:
> Yes, on mainline the references are meant to be ring->fc, eg

Confirmed, ring->fc on mainline. Reviewed-by recorded for Bernd's v6.14 backport path.

Bernd has since published the full 4-patch series via B4-Relay at 18:37 CEST, rebased onto Miklos' for-next (base-commit 040d71ac6470). On that branch the fuse_chan abstraction is in place, so the teardown path uses ring->chan / chan->conn rather than ring->fc. The series stays as-is for for-next.

Your inline diff is the basis for the mainline stable-backport once for-next lands.

I will run the two-arm Tested-by against for-next-base 040d71ac6470 (KASAN + lockdep + kmemleak, async-teardown race + baseline) and report numbers on-thread.

Assisted-by: Claude:claude-opus-4-7 berkoc-pipeline
