Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793811104;
	b=KnhCnVat9incIuE6hdw9r2ovccMZjbYo3/jeodkO9cLwo5e4Y0htPClEjoYBzmz2HTq6
	 WjGc4uFtV93uEz22HjebPkJoOPIvHeMBhbZhoJw9Htfr2h722Lye+cf8Qy40w8Zc+BV6K
	 BJW8Z1sC0LZenycGQMeVh7+NgTuxpz34QQ0WKq6fS8VujTkNRbPL4kRWht9qcln13i79L
	 wPfPB3KdWmcEA2B7kwBW4/MGOMA08KOlUZxXpQQjNsY2Vplz0U0IauAekOf3B9xJS8CZI
	 fF0+WkzdQvBGStfAb+jZreIE6kK9QQ6PyRb6mGSkFRpiWEQLr0jfr7mLpt4vq6srPEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811104;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=p7OUoDHzO84rd3SaIkAYTOyNkjctPr1wXuEFD+8X+3A=;
	b=5OfoxSMxhazSbeRZe5YPYvLE+rIZT6b252ECltY5ds8nITcUqW4twwNPZsRB/oYgxLbz
	 tFVfQRBGQ0pYPBBhgWrLyuFSFLIf91fln9NNuvLtIW/tisbTRcd8nZ+LPEmFdQhZBkCDH
	 CpdzVPkh4DRnpePWin7fPV2kW+g53Bl4dFLx/G1NqLLAsriOuxZZAE7AaJpdOapxfuRJ3
	 VX8lqMY44CnIHYwJTVnUf7DXroKFBZO8fNznX3/lPq8zCqKyXXq//DxVMxzOIv32jMtMt
	 A/3ESCQAHIRsowIgAgj8ET65GSvMtKaZGbf7f5sbqDeyOPZjVUpHSHuksRripx3NwNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="jrJH/jDl";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA21E606A326;
	Wed,  4 Nov 2026 16:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jrJH/jDl
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793811103;
	b=U+AU+9t8nPQh01n/93KipqEI7ANKepaBoAI5N7ghPzts+Ti9yIOj9HtX6ZtXEl2dc9xU
	 TmgYQA7Xwzhs6eSZlpzkpC2yZU7fkeVb/9UehvfTyrqn09vFwOkWSYApdwQVX2Iq+HkI9
	 4spiWG8BJc3xh/y9qAmFHyWaVd7B5c3Pc4AUEduFi3iPhE2/0gx+O4LUl2R3vnV3nGkMe
	 sipAc8jl2vyicntaN0JOy+CARXC99eA6SsmsrAiVvtwwR6wCM6KG7WrQbsYwfA7ezYa50
	 uWuVPl1JPGN8JilZ4dRmFwaBnGfjR7S7FCcgp6IBlLozHS21qF9nYSb/rEEHS5hMo/A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793811103;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=p7OUoDHzO84rd3SaIkAYTOyNkjctPr1wXuEFD+8X+3A=;
	b=p1JZrD/j6vZC0rRcWdacWxsy5mXO+qHFKclTRJJEjjFmza2UWAMvzft3mT0j0FrRHIZ3
	 rvWxY9YK9YFFNAagM6xXfLoQJiz9EvVu4k0kktHPe3BQ+aR1aQ354YBQSczHuYS+4Y2Bu
	 u21NfNYMmP09KUj30cG+djkBBkm7LRQk/aOLeDidVJtpltbjco8tMq9i1nOkF//d1yHIs
	 fQoj2QLQYRxtd4AAUVU2mFbapUcZl/06rKtEaFm9oclNn6Tv1KzqhrNDF9pzASQSfCj2d
	 q3pcdGr78WqlVyot6nwTt6goSGqcZlzmuxuFlgDPRIa0/nnYdV7wijxGLG1O2VmR+xA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D13161F000C1;
	Wed,  4 Nov 2026 16:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793811103;
	bh=p7OUoDHzO84rd3SaIkAYTOyNkjctPr1wXuEFD+8X+3A=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=jrJH/jDlyMB5M3+0j3FDSxLfRxBGzW5YQFz2erNC3x2fXq6eLnTBk/3V7eaB4WnDr
	 lYk/sYDX2B6hOwz+1H1HsTifA4Tfj8Ra7ZbrI2tbwmIUud6oG466pfi42msXxEWqcP
	 zTRb5ZbLzSVCaY/NTlkE6XeNz2xG7cEPhhO9N3qTHkLbEEqSzgujrfWZJwMNjAco7w
	 Oh94K+DW0Yu+VtWJGeqUF+d1DQtJ8hIEdgDkqNYnpeTj+MDXRcN8L5GSIAXdWweGE8
	 B87379Oa46L09EnzIVDbksPQcfiPSmySB4ERhOwhTfPDGKOha9VTIRu1H1T9JmWV7H
	 srn8MnHfutjbw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2C67146EC9;
	Wed,  4 Nov 2026 16:51:42 +0000 (UTC)
From: =?utf-8?q?Orkun_Emin_Sar=C4=B1_via_B4_Relay?= <devnull+sariorkunemin.gmail.com@kernel.org>
Date: Wed, 04 Nov 2026 19:51:42 +0300
Subject: [PATCH v2] io_uring: only wait for in-flight requests if the
 closing task uses the ring
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261104-io-uring-wait-inflight-v2-1-f38f29fe8018@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNSw6CMBRFt0I69pm28lFG7sMwqOW1PAOtaQtqC
 HsXcAEOT3LuuTOLGAgjq7OZBZwokncryEPGdKecRaB2ZSa5LIXgOZCHMZCz8FKUgJzpyXYJCmO
 qs6p0qduCreNnQEPvPXxrfhzH+wN12mqb0VFMPnz250ls3t+TSYCA/FQKxS+8QMmvdlDUH7UfW
 LMsyxdeRv3zzgAAAA==
X-Change-ID: 20261104-io-uring-wait-inflight-5ff78a7c6cd5
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Orkun_Emin_Sar=C4=B1?= <sariorkunemin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793811101; l=1703;
 i=sariorkunemin@gmail.com; s=20261103; h=from:subject:message-id;
 bh=2zAkFtlRAbKoTeetYy4EAFWZ/r67JeI0vLajPk/pxyc=;
 b=RtbouLjW9ofs3DQvgitpYlDXkyFY8PtA5hoa0+z1rlR9uW0kpvA51MXzujS+yCgydwx0R3FEt
 5LxnsoqxBh3DvSp1QBiEehpF1vnVQ2C4db2GpQZYtTyqTBgIzMfcT7X
X-Developer-Key: i=sariorkunemin@gmail.com; a=ed25519;
 pk=MJ3Y3somkGDQVAXOSR189QAqWOcfzYCRkL1cSQgJXnE=
X-Endpoint-Received: by B4 Relay for sariorkunemin@gmail.com/20261103 with
 auth_id=1408
X-Original-From: =?utf-8?q?Orkun_Emin_Sar=C4=B1?= <sariorkunemin@gmail.com>
Reply-To: sariorkunemin@gmail.com
Content-Transfer-Encoding: 8bit

From: Orkun Emin Sarı <sariorkunemin@gmail.com>

Since commit 13d3783a55b7 ("io_uring: wait for in-flight requests on
ring release"), the task dropping the last reference to a ring waits
for every request on it to complete. A process that only received the
ring fd, e.g. over a UNIX socket, can then block in close(2) on
requests owned by other tasks, such as a read from an unresponsive
FUSE server.

Skip the wait for tasks that never attached to the ring and leave those
requests to io_ring_exit_work(), as before.

Fixes: 13d3783a55b7 ("io_uring: wait for in-flight requests on ring release")
Signed-off-by: Orkun Emin Sarı <sariorkunemin@gmail.com>
---
Changes in v2:
- Shorten the commit message and the code comment
- Use real name in Signed-off-by
- Link to v1: https://patch.msgid.link/20261104-io-uring-wait-inflight-v1-1-4361a0905e20@gmail.com
---
 io_uring/io_uring.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 03724419c4..5db57bf675 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -2547,7 +2547,10 @@ static __cold void io_ring_ctx_wait_inflight(struct io_ring_ctx *ctx)
 
 	if (current->flags & (PF_KTHREAD | PF_EXITING))
 		return;
-	if (tctx && atomic_read(&tctx->in_cancel))
+	/* Only wait if this task has attached to the ring */
+	if (!tctx || !xa_load(&tctx->xa, (unsigned long)ctx))
+		return;
+	if (atomic_read(&tctx->in_cancel))
 		return;
 
 	while (io_ring_ctx_inflight(ctx) && !fatal_signal_pending(current)) {

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261104-io-uring-wait-inflight-5ff78a7c6cd5

Best regards,
--  
Orkun Emin Sarı <sariorkunemin@gmail.com>


