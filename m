Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C011331EA5;
	Tue, 16 Jun 2026 21:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781645948; cv=none; b=QH6kwxupOycrpqmYlGU/6WHBSrfbTvVCttOfxqRHSxWPNjSbhAVw0OUkB9tJmX8eQwyB1fxazHfaIEUsC0PHeMpNOrzUZ/KVZYnqlpuFAJ7Zc8ZDyvHQOla4BQrLNgs2y1qQzoVkqpmvdwaDWa9idm/HOi10j5w4KZfsia9lVNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781645948; c=relaxed/simple;
	bh=HLoOrMjbK+z+X5ujtwxaVwvYR+POmIRsD3DRyUbVfUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jKDnEeuoyjkxeuc85wbzPB3b+RPdjqJWwD7Jye4JmXW8Ykv+m1UdAAN1GPMcZckJ/Z0boRIP8jlMtj7aOG5spMYSVT51O6lXak0iRtmjD21xxAxhuDIOGbakZjMIyq6MBJZOGp5y60RrjLrqvTw/vTcAUhsD6RkVhh8th29frWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P17/C1s6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P17/C1s6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3828E1F000E9;
	Tue, 16 Jun 2026 21:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781645947;
	bh=dyL5yE80AtwhQSv+x6dkFVR/FidjONX2v1zz33fk1eQ=;
	h=From:Date:Subject:To:Cc;
	b=P17/C1s6PofQoj1S7mbspqZ0uvcEUyyQ/+2JBXiWoYlWfAEX5ymkYnuJ9o8/wHlQZ
	 ZugPzn/GOfAS0UPWtzhas/ggNjntHVXFfhvuo8gPJ/A9b68LIo/RQ7dEIBXhnp7I45
	 EQrRH67OqZVwn9jOFyVxI+1QXo9WijrqVIYUFwHPsVoFCVshsDNjTvoODQFavzuJw5
	 G0bkxdAomNvocU1UHXCpGgUkcy/hmgdbiUUTYpS82iBghyl71VxZ6KHex+ykHtj/ds
	 tpsDPsjG48n0kHox67Fz+CnSaIJZ9Ee/yT8Gg9A33ZG9nikPIOdt72KpzxqJS42h8S
	 PkKJ3Z3dnz5Tw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 16 Jun 2026 14:39:02 -0700
Subject: [PATCH] io_uring: Use system_dfl_wq instead of system_unbound_wq
 to fix warning
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-io_uring-fix-wq-warning-v1-1-cfc9d934eedb@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM3QpAQBCG4VvRHJtaapfciiQ/g3GwmPVXcu8Wh
 09933uBI2FykAUXCO3seLIeURhAM1S2J+TWG2IVG2UigzyVm7DtseMTjwWPSuzLRFNLKlGp0Rr
 8exbyi6+cF7/dVo/UrG8O7vsBqOQTu3sAAAA=
X-Change-ID: 20260616-io_uring-fix-wq-warning-75ede0708655
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1289; i=nathan@kernel.org;
 h=from:subject:message-id; bh=HLoOrMjbK+z+X5ujtwxaVwvYR+POmIRsD3DRyUbVfUM=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFmGhypniF0sPlvxK+zK6+K8LOFFhz9nBs1Ic1DK5blQ+
 3Xp92SmjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRll6G/2HbunP1xS9USFnW
 nKm7oDU10V1zSWT2j6CStlU7Xn7dqcTwh+fhnUXbVPli5j03rUv7d3d1sditZonve2s3vFwUnHN
 8FRMA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Commit de7341ffe49e ("io_uring: switch normal task_work to a mpscq")
added a use of system_unbound_wq, which is deprecated in favor of
system_dfl_wq added by commit 128ea9f6ccfb ("workqueue: Add
system_percpu_wq and system_dfl_wq"). An upcoming warning in the
workqueue tree flags this with:

  workqueue: work func io_tctx_fallback_work enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.

Switch to system_dfl_wq to clear up the warning.

Fixes: de7341ffe49e ("io_uring: switch normal task_work to a mpscq")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 io_uring/tw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/tw.c b/io_uring/tw.c
index e74372233f40..48a9d09ef582 100644
--- a/io_uring/tw.c
+++ b/io_uring/tw.c
@@ -55,7 +55,7 @@ static void io_fallback_tw(struct io_uring_task *tctx)
 	 * the queued work) stay around until the drain has run.
 	 */
 	get_task_struct(tctx->task);
-	if (!queue_work(system_unbound_wq, &tctx->fallback_work))
+	if (!queue_work(system_dfl_wq, &tctx->fallback_work))
 		put_task_struct(tctx->task);
 }
 

---
base-commit: d9b710f683dc68b5c0b7dd0c6c64aeb5d27a1ac4
change-id: 20260616-io_uring-fix-wq-warning-75ede0708655

Best regards,
--  
Cheers,
Nathan

