Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793793385;
	b=N6rLXtKdBwyhEgQc0yTE1zwzt4bf56ZAq6nlsDJ7t9CNUBfsvtKlEw1unItcqtK83GcN
	 cZPwA2ICQ8MquTM+wZhqXMWR+zyYVm85cMkVS/lrfsrNXK4PbnWr8f2zE5iEYzcQLBV4w
	 zvpjFZLv68XwB4V11LJzyBFXo3POZH8R7WuhwkLjY4bK+KpAEf+WseIuHO8H/zX8aiRkl
	 rNr2w/mn9NLITKpQNeIVF2L10GGqXMH5x+G/OORY7y8zfvPow6cRLmiqdMdnTY6ep/LRb
	 QkO7cNdR5MCKWXOEGRbhGHd7UW6kt/mYHgY/1SzzEDBLkWoh6BLjuPjwJT1SccOF5ng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793793385;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tQbTON/T8suND0r2D/MdGpozMJnzCcv92JPxeQ3VxKc=;
	b=WBNgpPjE1274m+MBAFosVOmxPuLG1DVFDrX0YtTZM9+zlqGbknIYvikm9bLDrOx1eYem
	 9uyc9EhEDUfqUbUu/0+yuiA3AxhqbAS5zOB6xegWJ6pcogaHdnxLqAsrRYWLcYgUfaZBC
	 KRv1O9zZyd0sn8tv86bqlFVXqJ8Xr59ow/mOhtjb059kuo1/Q1UYpJaSUSEINJkTlPI6n
	 TZkSOY8ZCU3nD9vEiyTYZIb2pvjEroepxpBpJLW8QPF9/n3aB4D+JtQZKRUQM0fDbCcd9
	 1i1h5A4n5qQ4NzdTEx7N8V2irZEGcCH3pnz8IMyQfVTcCQWTE03TJMCczreBkURJ0hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CJSltRU6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92250606A33B;
	Wed,  4 Nov 2026 11:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CJSltRU6
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793793380;
	b=nny1V9dxpomARF7uW8h0cX8+AZE09DHM1fhmEXBvW/TAqJIeK43HIrqsFawvZjmon0GG
	 E5GKmRaz+/bmKeOAqFGF+WhrJCLBGsosm60SDloEI3g1Eq15UMmngdbUcjoE6t2W7V/LW
	 XT7Hupp5ZxokUIwrmGR5kb9rnuQJnQrkhGwIWPrUuUenH42d+0y6RkpcUHyRmw7sFN8hZ
	 oLIW5lBPot9v+RBDLXwoi5Aj04eBMYupqqvstMQ82QVxKlFuIgSg/hR7Ou2de8bT3ApkZ
	 ohwdwR7PuIvo7X51VcfCDYSDL1J+P5Vmkz4b3Q0VbNN5sOGmB4PaRZUknVPzHztcWNA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793793380;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tQbTON/T8suND0r2D/MdGpozMJnzCcv92JPxeQ3VxKc=;
	b=hh9Zq9deKH6fVhDnNaB24ODtp0EXBbSU9E2SV8roibr79P4ktGUTZViKT8w075xoKjPr
	 ZUM/sBc5BwnuDdaVQBw63y4ge45zCxGqU9/b7oALVooY0626tfbzKCLuJIA/EnX6ljprS
	 B3fSrtCZNJUJBrAghghd2rf7Kz01JnTVe+incYDphbDWkRToFZNeSbjH/6SVyixe5FYBn
	 0+eCsYz1JMabDwKMzH2Kbj7N+LEqpjZL9Pe1nmRpdL1Se3xpf+wPCgf8EXjDZp5uE6U/O
	 a7jY2wsyLkLdWpJTBGAUENlhZ1U++/tUctlr0TMtQ2VRNjtS7KhqnSLyDimbrrTVi3g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C4DFF1F00A15;
	Wed,  4 Nov 2026 11:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793793380;
	bh=tQbTON/T8suND0r2D/MdGpozMJnzCcv92JPxeQ3VxKc=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=CJSltRU6JVl4+3kJnGmKJ4hLmFUdlglFiMhre6/EV2vPgk4grS7ZAf6UewR3R3HZP
	 /wy5pYuK4RQ6S7L+n36BkTuHNqdXbueQag6EMyoIcYhJLW7ocvg2VuLs4vspV0MKx+
	 vu7VIzoQNBUqMXX1P3vgdvvBjDHZhf5oEPeZT4vVm1cccRaDzAo363kSSv8b7dPaGl
	 1T74b/6fBs1Rp1HrNKK3KHUriA7QAFfDWUVV+eJWEbivSYWtpmf/X2MFQIAGUyigS5
	 ZdeJQEmAhssD+tqjsGLob8idE0Xv6nh7xjPwNn1bOYiCEgYgnwfnuyj9PiSCTRRZFb
	 hAbkyMOVB76NQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5604146DFB;
	Wed,  4 Nov 2026 11:56:19 +0000 (UTC)
From: orkunsari via B4 Relay <devnull+sariorkunemin.gmail.com@kernel.org>
Date: Wed, 04 Nov 2026 14:56:19 +0300
Subject: [PATCH] io_uring: only wait for in-flight requests if the closing
 task uses the ring
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
Message-Id: <20261104-io-uring-wait-inflight-v1-1-4361a0905e20@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSwqDMBRG4a3IHfeCER+lW5EOYryJfylRkvgAc
 e9N2+E3OOekKAES6VGcFGRDxOwz1K0gM2nvhDFmU1VWrVJlzZh5DfCOd43E8PYNNyVurO3uujO
 tGRvK8RLE4viN++ffcR1eYtL3Rtf1ASYhsHB6AAAA
X-Change-ID: 20261104-io-uring-wait-inflight-5ff78a7c6cd5
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
 orkunsari <sariorkunemin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793793378; l=2611;
 i=sariorkunemin@gmail.com; s=20261103; h=from:subject:message-id;
 bh=rQjol/LPkMVu62dXGlOPXlCfjI+XemuiRWZSMmo7src=;
 b=5PjPbkizTDH9QC18dQaOuU/zlDs99/qdedC5HPYSwnnn7xu5G0a0zJmuwde5JUJ/9WSp+JOMi
 H7Iswq6AR7bCSTo9tfyNAm8ivkZoyQEd7DNKmcATRsB2PLu7LezQyMy
X-Developer-Key: i=sariorkunemin@gmail.com; a=ed25519;
 pk=MJ3Y3somkGDQVAXOSR189QAqWOcfzYCRkL1cSQgJXnE=
X-Endpoint-Received: by B4 Relay for sariorkunemin@gmail.com/20261103 with
 auth_id=1408
X-Original-From: orkunsari <sariorkunemin@gmail.com>
Reply-To: sariorkunemin@gmail.com
Content-Transfer-Encoding: 7bit

From: orkunsari <sariorkunemin@gmail.com>

Since commit 13d3783a55b7 ("io_uring: wait for in-flight requests on
ring release"), the task dropping the last reference to a ring file
waits in io_ring_ctx_wait_inflight() until every request on the ring
has completed, and only a fatal signal ends the wait early.  The
requests may belong to other tasks and may not complete for an
unbounded time, e.g. a read on a FUSE file whose server never replies.
A process that merely received the ring fd over a UNIX socket and
closes it then blocks in close(2) for as long as those requests stay
in flight.

The comment in io_ring_ctx_wait_and_kill() states that the wait is
meant for requests owned by the task closing the ring.  Only tasks that
created or submitted to a ring have a node for it in their
io_uring_task, so skip the wait for any other task and leave the
remaining requests to io_ring_exit_work() as before.

A thread of the same process that never attached to the ring no longer
waits either when it drops the last reference.  A task that is attached
can still be held up by requests submitted by other tasks; that case
is not addressed here.

This was found by AI-assisted code review (Claude Code).  The fix has
been build-tested with W=1 only; no reproducer was run.

Fixes: 13d3783a55b7 ("io_uring: wait for in-flight requests on ring release")
Signed-off-by: orkunsari <sariorkunemin@gmail.com>
---
Regression in v7.4-rc1 only; released kernels are not affected.
---
 io_uring/io_uring.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 03724419c4..04e3da5de0 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -2547,7 +2547,16 @@ static __cold void io_ring_ctx_wait_inflight(struct io_ring_ctx *ctx)
 
 	if (current->flags & (PF_KTHREAD | PF_EXITING))
 		return;
-	if (tctx && atomic_read(&tctx->in_cancel))
+	/*
+	 * Tasks that have attached to this ring (created it, submitted to it,
+	 * registered its fd, ...) have a node for it in their io_uring_task.
+	 * A task without one owns no requests here, e.g. one that received
+	 * the fd over a socket, and must not be made to wait for requests it
+	 * has no control over.
+	 */
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
orkunsari <sariorkunemin@gmail.com>


