Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795872865;
	b=DltpHXYYjwrO5xBIVD33swfZj+rJulVzwOgT33TFLLBuA2gnnp9zjc4Tgmr2zDCNeLHa
	 NqSioe73S3fAXg+95y/D6A1RpsvuttqDRRtPAos2K2eU6N1iOSwD7tRGhj4ErGIzIkaHx
	 hpW638GluKdRwLYCilO1Gz6SrCh1s55tWgWRAqIAghwPAPjajh40ke/ZbbyhOu2I55lbo
	 od5R5nqzEa8DyfPOfJ9P6pKrmtaNKxIlun6IL7WK/obpoBwi3VP40BpXFxcV+6qie1QBC
	 oZikmoGFkdcYoqcFx9QQ0pPDuWR1crkX7cg+J049KFub6bBnmMCrpmJ1TjtYC4o45VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795872865;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type;
	bh=ibyN4UPqhfd0UnYPvRCvg3lzGL9+KsQkfNnJq6GWEN4=;
	b=O6/ppgH9HMEd5cZZPLucG2JBo8zLCptqnj+woedlEVpYudaThmlfkIgkzn6zW5nz7RlO
	 WGHk9ZMhho2EnN9bRFsN55KEamaes23jL84r690/K1Fj+Jetfr7Y1XW9y0ovpT7gjNymk
	 abyCp9bILsEJY90M++IlJIMitZCm4LajEqQ0ug+UCe9qhllcCmiSHLsNX7FNmGX3TVbXE
	 03pQH86q+Sr8BxeGcTptzfw7WC3+jXkBGn7fhQXxfHv1l+HQ9BnBDowJ6r/LiYtTpvLBH
	 XFS6S26YI4S9bp0lCGDaSY/ESRT/JIAspzBTUwqftCWAcn9yv0ShYrUwHn48IsKJgtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mzfr.me;
	spf=pass smtp.mailfrom=mzfr.me;
	dkim=pass header.d=mzfr.me header.i=@mzfr.me header.a=rsa-sha256 header.s=protonmail2 header.b=R6gACOIr;
	arc=none smtp.remote-ip=109.224.244.22
Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch [109.224.244.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB4B606A31F
	for <io-uring@vger.kernel.org>; Sat, 28 Nov 2026 13:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAB4B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mzfr.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mzfr.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mzfr.me header.i=@mzfr.me header.a=rsa-sha256 header.s=protonmail2 header.b=R6gACOIr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mzfr.me;
	s=protonmail2; t=1795872861; x=1796132061;
	bh=ibyN4UPqhfd0UnYPvRCvg3lzGL9+KsQkfNnJq6GWEN4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=R6gACOIrIr0yb9YygS7zSIfS5kS1yC9ilAe4m4suhpHfKmN9UbK1Iz6aDNp61vcSn
	 gvRviWYes/CLinEd/hqy4ALdBBiTYkgmVUVV2az0tDaEnaO0kCQTpnPp4uUo/ZYepk
	 yxHOP9i3lnBDmkGrWGG4Ee5Ked9Txuxpsg1k5DV4fqVOsI9jr8zawxdlbBvE3jhk/N
	 gpQil3CjOO7Obhv5X772DO2RaITPC6ORS1mkE9tYsVbD4RHPeBMkj6X9XpiJM2IIbV
	 qPvG1qdBC2pdQ5+b41IturS0KUvcqWLRW2eN45N2kJk2tE4xVBjKejV8hP/ACRlNde
	 nDGAjLtf4Futw==
Date: Sat, 28 Nov 2026 13:34:14 +0000
To: Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org
From: Mehtab Zafar <hello@mzfr.me>
Cc: Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org
Subject: [PATCH] io_uring/rw: complete partial writes from io-wq
Message-ID: <20261128133400.62759-1-hello@mzfr.me>
Feedback-ID: 37505322:user:proton
X-Pm-Message-ID: b0f532564e3c66afd64b107f7752383ae92a0dc4
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------e0fdfd6fa2f252007acc851e603bae5c0d63fee035d950ea92fbb55e82a6ce98"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------e0fdfd6fa2f252007acc851e603bae5c0d63fee035d950ea92fbb55e82a6ce98
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From: Mehtab Zafar <hello@mzfr.me>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org
Cc: Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] io_uring/rw: complete partial writes from io-wq
Date: Sat, 28 Nov 2026 21:34:00 +0800
Message-ID: <20261128133400.62759-1-hello@mzfr.me>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0

IORING_OP_WRITE with an offset of -1 uses and advances the current file
position. A partial write is currently returned as -EAGAIN so the remainder
can be retried from io-wq.

That is only appropriate for the initial nonblocking attempt. If the
partial write already happened in an io-wq worker, returning -EAGAIN ends
the worker attempt, drops req->file, and reaches io_rw_fail(). The CQE is
fixed up to report the successful bytes, but kiocb_done() never updates
f_pos.

Only punt partial writes from the nonblocking submission path. A partial
write from a blocking worker then completes normally through kiocb_done(),
which updates f_pos and performs the usual write completion accounting.

Keep the last known-good position for a partial nonblocking write. If its
later retry fails through a normal completion path, commit that saved
position rather than trusting ki_pos from the failed write.

This bug was found with AI assistance, which also helped
prepare the fix, tests, a
nd description.

Fixes: 1939316bf988 ("io_uring: kiocb_done() should *not* trust ->ki_pos if ->{read,write}_iter() failed")
Cc: stable@vger.kernel.org
Signed-off-by: Mehtab Zafar <hello@mzfr.me>
---
Testing on x86_64 against axboe/for-next at e00ba7334fc2:
- Three fresh KVM boots per kernel, using identical userspace binaries
  and initramfs, with no guest disk or NIC.
- Baseline: a 100-byte current-position write limited to 10 bytes returned
  10 in the CQE but left f_pos at 0. Patched: CQE=10 and f_pos=10.
- Wholly failed writes remained -EFBIG with f_pos=0; complete writes
  remained successful with the expected position advance.
- liburing fpos.t and read-write.t passed on the patched kernel.
- A partial-read control returned 4096 bytes and advanced f_pos correctly
  on both kernels; no analogous read-side regression was reproduced.
- W=1 io_uring/rw.o and full bzImage builds passed. Strict checkpatch
  reported no errors, warnings, or checks; git diff --check was 
clean.

 io_uring/rw.c | 43 +++++++++++++++++++++++++++++++++----------
 io_uring/rw.h |  1 +
 2 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/io_uring/rw.c b/io_uring/rw.c
index 3ecb842147a4..e658a9b2e1b4 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -200,6 +200,7 @@ static int io_rw_alloc_async(struct io_kiocb *req)
 	if (rw->vec.iovec)
 		io_req_set_flags(req, REQ_F_NEED_CLEANUP);
 	rw->bytes_done = 0;
+	rw->partial_pos = -1;
 	return 0;
 }
 
@@ -551,6 +552,24 @@ static void __io_complete_rw_common(struct io_kiocb *req, long res)
 	}
 }
 
+static inline void io_save_partial_pos(struct io_kiocb *req,
+				       struct kiocb *kiocb)
+{
+	struct io_async_rw *io = req->async_data;
+
+	if (req->flags & REQ_F_CUR_POS)
+		io->partial_pos = kiocb->ki_pos;
+}
+
+static inline void io_commit_partial_pos(struct io_kiocb *req, long res)
+{
+	struct io_async_rw *io = req->async_data;
+
+	if (res < 0 && req_has_async_data(req) && io->bytes_
done > 0 &&
+	    (req->flags & REQ_F_CUR_POS) && io->partial_pos >= 0)
+		req->file->f_pos = io->partial_pos;
+}
+
 static inline int io_fixup_rw_res(struct io_kiocb *req, long res)
 {
 	struct io_async_rw *io = req->async_data;
@@ -590,6 +609,8 @@ static void io_complete_rw(struct kiocb *kiocb, long res)
 		io_req_end_write(req);
 
 	__io_complete_rw_common(req, res);
+	if (!(req->flags & REQ_F_REISSUE))
+		io_commit_partial_pos(req, res);
 	io_req_set_res(req, io_fixup_rw_res(req, res), 0);
 	req->io_task_work.func = io_req_rw_complete;
 	__io_req_task_work_add(req, IOU_F_TWQ_LAZY_WAKE);
@@ -604,11 +625,14 @@ static void io_complete_rw_iopoll(struct kiocb *kiocb, long res)
 	if (kiocb->ki_flags & IOCB_WRITE)
 		io_req_end_write(req);
 
-	if (res == -EAGAIN && io_rw_should_reissue(req))
+	if (res == -EAGAIN && io_rw_should_reissue(req)) {
 		io_req_set_flags(req, REQ_F_REISSUE | REQ_F_BL_NO_RECYCLE);
-	else if (unlikely(final_res != req->cqe.res)) {
-		req_se
t_fail(req);
-		req->cqe.res = final_res;
+	} else {
+		io_commit_partial_pos(req, res);
+		if (unlikely(final_res != req->cqe.res)) {
+			req_set_fail(req);
+			req->cqe.res = final_res;
+		}
 	}
 
 	/* order with io_iopoll_complete() checking ->iopoll_completed */
@@ -1178,15 +1202,14 @@ int io_write(struct io_kiocb *req, unsigned int issue_flags)
 		if (ret2 == -EAGAIN && (req->flags & REQ_F_IOPOLL))
 			goto ret_eagain;
 
-		if (ret2 != req->cqe.res && ret2 >= 0 && need_complete_io(req)) {
+		if (force_nonblock && ret2 != req->cqe.res && ret2 >= 0 &&
+		    need_complete_io(req)) {
 			trace_io_uring_short_write(req->ctx, kiocb->ki_pos - ret2,
 						req->cqe.res, ret2);
 
-			/* This is a partial write. The file pos has already been
-			 * updated, setup the async struct to complete the request
-			 * in the worker. Also update bytes_done to account for
-			 * the bytes already written.
-			 */
+			/* Save the last known-good position before retrying. */

+			if (ret2 > 0)
+				io_save_partial_pos(req, kiocb);
 			iov_iter_save_state(&io->iter, &io->iter_state);
 			io->bytes_done += ret2;
 
diff --git a/io_uring/rw.h b/io_uring/rw.h
index 1179506f929f..63c53cd21286 100644
--- a/io_uring/rw.h
+++ b/io_uring/rw.h
@@ -12,6 +12,7 @@ struct io_meta_state {
 struct io_async_rw {
 	struct iou_vec			vec;
 	size_t				bytes_done;
+	loff_t				partial_pos;
 
 	struct_group(clear,
 		struct iov_iter			iter;
-- 
2.34.1


--------e0fdfd6fa2f252007acc851e603bae5c0d63fee035d950ea92fbb55e82a6ce98
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

wsCpBAEBCABdBYJrCthVCRBCkCzGpVLSJDUUAAAAAAAcABBzYWx0QG5vdGF0
aW9ucy5vcGVucGdwanMub3JnpaIRLUsWCjUIE8wIkN6PshYhBJC8NTVod5IV
Rdc7/kKQLMalUtIkAABdzggAhV0Vs4jx2eztN1HMrjJOQx5mbOvyn9YTYc0H
ARUTSKm+oFWzG4h6f4xYf1yG+dPWAfWHV3IxFq04T4HLo2JcK0p9kxmvg28+
UhA5cICObWSzVNjPfWtRynLlC0lzvqLgKgxVAxVDjNN0zpien+ZQcudIApGe
GEwzdRqYL9d0nJJQVjIoreto4QeOeimACldP22WTpo4bO/oHj/R4wQDLhoiK
SsTgSHLuto2CRFhtD6kGPT7bFQPw/EQROQpgUm4/ltdgy117DY7qvKJ+1Y38
Czy3Pxno2eS1S3WhfLgQgEwaiPi46RHmI64NQeM73UPVSfxnOdVPxhV/iLlW
BaH8aA==
=Gsvd
-----END PGP SIGNATURE-----


--------e0fdfd6fa2f252007acc851e603bae5c0d63fee035d950ea92fbb55e82a6ce98--

