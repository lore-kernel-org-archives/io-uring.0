Received: from mail-244119.protonmail.ch (mail-244119.protonmail.ch [109.224.244.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B765B339383
	for <io-uring@vger.kernel.org>; Sun, 18 Oct 2026 04:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792297369; cv=none; b=baGMfK1KMeWryDh/zBOKs7LPVLutdb1LMDUY9tEEFc5JoUEp5Yiq0pXVMWYCj0vbq8W/RYePfj8W2jfH23DcMagk42WCmNbEnZ/N26U2NsdbmCUcLYEZgmfLnIsUFsz2a/X7tKAWzQ+yrAU7Odu6vTJdCSBpM+bIoroXljdZrcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792297369; c=relaxed/simple;
	bh=uZSf6wqOBedWBy3Vp57B9Oce/4sQNPzq5Fmyz/S4i48=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JEXSpPak6jKGx4zTwuL14T4uejO7EQxHso0OTutbR7nk5fUx6mwRbCW5kgkqlfX3OmYaTBKGQR0iydr+Qb6HQIJy1FtZVVopu1Z+MPv5uUycPX7griFMt2DUb99o4QRX3VH6P9cJumQ+Ks/2FUBpSW7KkWKzR5vjuz06O6uIH6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=000ty.net; spf=pass smtp.mailfrom=000ty.net; dkim=pass (2048-bit key) header.d=000ty.net header.i=@000ty.net header.b=u3OTAr6h; arc=none smtp.client-ip=109.224.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=000ty.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=000ty.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=000ty.net header.i=@000ty.net header.b="u3OTAr6h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=000ty.net;
	s=protonmail2; t=1792297357; x=1792556557;
	bh=uZSf6wqOBedWBy3Vp57B9Oce/4sQNPzq5Fmyz/S4i48=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=u3OTAr6hJTYPXfJ9eVC7cNG2xfxIhAADZSQE6CWx3+LnqWI9OaldsOQOzKLnKy9CA
	 99cgkNDb050lNc19Vtt/gioqZ3Luoo7vKUtLW66JIJPTnPOM9uwEMt6ZEFmcpDKz4j
	 KzxYAN7PZ4wNpdIyZqgZ1uvTZ1IFmlSCpoSQ9jQXhn+c3lOycajITtsdB1q9bEAKWy
	 0yJsSXsivDNviwXzW0uVh90ye5xpLkrh+Jp7FRLFI3LFAlRTnlQB/3wyCiVZ39WPUm
	 lykVKp33/r1h4/rgoJ/lyDPHdFNMSjgRWw03hf0PumNPXHf8d8C9QDBxHO84WC6+wG
	 lIunwgO4wU6ng==
Date: Sun, 18 Oct 2026 04:22:32 +0000
To: io-uring@vger.kernel.org
From: Tamaki Yanagawa <ty@000ty.net>
Cc: axboe@kernel.dk, krisman@suse.de, ty@000ty.net
Subject: [PATCH] io_uring/net: keep recv buffer select length within MAX_RW_COUNT
Message-ID: <20261018042227.1105-1-ty@000ty.net>
Feedback-ID: 168296199:user:proton
X-Pm-Message-ID: fb0241a6e7fe3fa6d7e94fe35b1a473eefb05837
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Since commit dcbd1c054848 ("io_uring/net: let io_recv_buf_select return
the length of the buffer region"), io_recv_buf_select() returns the
selected length as an int. For a non-bundle recv with sqe->len =3D=3D 0 the
length comes from the ring provided buffer, which can be up to 4G, so a
buffer of 2G or more makes io_recv() fail the request with a bogus
negative result (e.g. -2147483648) instead of receiving into it. Clamp
the length to MAX_RW_COUNT, which import_ubuf() limits the transfer to
anyway.

Fixes: dcbd1c054848 ("io_uring/net: let io_recv_buf_select return the lengt=
h of the buffer region")
Signed-off-by: Tamaki Yanagawa <ty@000ty.net>
Assisted-by: Claude:claude-opus-5-5
---
 io_uring/net.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/io_uring/net.c b/io_uring/net.c
index f5f4f3ce6e..c82ea46cf5 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -1178,6 +1178,8 @@ static int io_recv_buf_select(struct io_kiocb *req, s=
truct io_async_msghdr *kmsg
 =09=09*sel =3D io_buffer_select(req, &len, sr->buf_group, issue_flags);
 =09=09if (!sel->addr)
 =09=09=09return -ENOBUFS;
+=09=09/* ring provided buffers can be up to 4G, keep len an int */
+=09=09len =3D min_t(size_t, len, MAX_RW_COUNT);
 =09=09sr->buf =3D sel->addr;
 =09=09sr->len =3D len;
 map_ubuf:

base-commit: fddcf4c5321b3ea5f72166c3fd36a9d1c34f80c7
--=20
2.52.0.windows.1


