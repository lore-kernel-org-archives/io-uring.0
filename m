Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738BB22AE48
	for <io-uring@vger.kernel.org>; Sun, 12 Jul 2026 14:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783866445; cv=none; b=CebTNmYY6Vizf36WGA578QbmAAmhqJMg5IrLhrswgG+0snKyMyEJTSS+KXSvtOKpQECl8NswaELZOhiwerHxrUS9yI2YABub4SfSutSx9sfHMotmnKLfB9Fp3P6rTINoGYaj6vjGeWsMMeyz7FGN7YoG8wCC2s7GRmkRFe5Ouqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783866445; c=relaxed/simple;
	bh=RFREUUJQmQWdgY0SFW5TvAzo56uLKZIPbzE5cvdGENI=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XNQbqTOkuh0ZcWKhPi76A9zvc6tmgaChVtNp+hr6Vwn66P3/ScAWJNnb/cSzuHRLReOdt0QjT9/HX1uhqS4tGVxTNZRmbHGudFkEgUkS5X0GJvNWIU8ITTWuoArXuHnvWp9mod1/X/pPx2mMgnK1OqT7mdcCddYi4yUspD3+pjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=jfYd0wYg; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="jfYd0wYg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=qpyzhihmw5chjncwqtdyqhmbba.protonmail; t=1783866437; x=1784125637;
	bh=RFREUUJQmQWdgY0SFW5TvAzo56uLKZIPbzE5cvdGENI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=jfYd0wYgwkf8IPcuNbuXYsHEpCFY79IsZJSripv6YlxjTJbBTYDyOHvDsMBQyb1nx
	 w4H4p4SK9qLEarUybRPE4MPPgyz7YFFUSXAI5JiW6z9+9DF2ur4czUD8GYG1iM4tgn
	 AuPAZm3YHZFQyYh77lHv6W+A210rUKILKHHo8i8LQ/A9OKKq9EJgQw5wiP2sQFmkVu
	 u7uc6QxXrcD8I0YqjuYsbmgk59OQtZ/U8epW//uD4xDUuHidzzTAOoCx7wW0ZTnKTs
	 I104Z7LOWW664RsECzP0KI2kNz4rdtPkqlqeoafsBgA1oUzKw/BxNWuYqER2isbtXJ
	 bTl3s5dQueAEA==
Date: Sun, 12 Jul 2026 14:27:12 +0000
To: Jens Axboe <axboe@kernel.dk>
From: Jaeyeong Lee <iostreampy@proton.me>
Cc: io-uring@vger.kernel.org
Subject: [PATCH] io_uring/kbuf: free the replaced iovec after a successful grow
Message-ID: <20260712142612.188695595-iostreampy@proton.me>
Feedback-ID: 96968035:user:proton
X-Pm-Message-ID: 7e470cc1af18254810af9362e774a5e38c4ba2bf
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The provided-buffer validation fix deferred freeing a cached iovec
until validation completed. However, the deferred free uses arg->iovs.
After a grow, that points to the newly allocated array. Without a grow,
it points to the cached array that remains in use.

This leaves the caller with a dangling iovec in both cases and can
result in repeated frees. Only free org_iovs when arg->iovs actually
replaced it.

Fixes: cd053d788c3f ("io_uring: fix dangling iovec after provided-buffer bu=
ndle grow failure")
Assisted-by: Codex:gpt-5.3-codex-spark
Signed-off-by: Jaeyeong Lee <iostreampy@proton.me>
---
 io_uring/kbuf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/io_uring/kbuf.c b/io_uring/kbuf.c
index b6b969b55e12..de0129bceaba 100644
--- a/io_uring/kbuf.c
+++ b/io_uring/kbuf.c
@@ -328,8 +328,8 @@ static int io_ring_buffers_peek(struct io_kiocb *req, s=
truct buf_sel_arg *arg,
 =09=09buf =3D io_ring_head_to_buf(br, ++head, bl->mask);
 =09} while (--nr_iovs);
=20
-=09if (arg->mode & KBUF_MODE_FREE)
-=09=09kfree(arg->iovs);
+=09if (arg->iovs !=3D org_iovs && (arg->mode & KBUF_MODE_FREE))
+=09=09kfree(org_iovs);
=20
 =09if (head =3D=3D tail)
 =09=09req->flags |=3D REQ_F_BL_EMPTY;
--=20
2.43.0



