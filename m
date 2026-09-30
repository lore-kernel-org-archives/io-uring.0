Received: from mail-244119.protonmail.ch (mail-244119.protonmail.ch [109.224.244.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7DB4A92DC;
	Wed, 30 Sep 2026 13:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774167; cv=none; b=Qe+gqcrK1MXnPJuBpmJ6VvIrnUFwkVHNnKjypV561xXg+UtOnpOsJTOOK4Bfpf4LcCie5De2Q7LZMa5fD3YB7MsMOApeJmM61Ckz9E6jMEOOBQZqAfth4E97ueEyn2YTD3fdp9L06zgSBD11lvJUJ5e+GNB5TTjBtieCEBrQRS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774167; c=relaxed/simple;
	bh=+nmyDT/vAE14pe2SdVMro9kS9KpIlW/SlKFd40pNJ6s=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eKfqvBUMQnUgzbPxLyFFwYz/KdvaNudyW+s3ZfXO0a0gcsfHT6BX7aOSCeQIXE9XlDqWTopXwliqKAN+J53J73vVnJMVjQ9FOnj5KqzLCpFgyh5hTThyTJFOvn1b9sGt3bp+GpiLX1rFZ3AlkNKoWKw66JJ7J5nsMniRq6pr/Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pgray.dev; spf=pass smtp.mailfrom=pgray.dev; dkim=pass (2048-bit key) header.d=pgray.dev header.i=@pgray.dev header.b=p63pyT4o; arc=none smtp.client-ip=109.224.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pgray.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pgray.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pgray.dev header.i=@pgray.dev header.b="p63pyT4o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pgray.dev;
	s=protonmail2; t=1790774140; x=1791033340;
	bh=K/KpVE2vwajq4KerKHo5R/x4bY2UmBRcyxLx2loGpsA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=p63pyT4oXLZgb23oSNbCSL3T48AZ79tj4ZoELgp4efT9S/5igxFA7NqDajGO8PSBz
	 7reyI0l1q39+TGE3u/SgWxQXZoFjK4GY6+rd/xSS0NeX+sTOq16ga9c+Z9t2GF+uef
	 PKUqUlbmBv/MunYklx9iWjCjgjpj8kj05LZiDt/LYbxIM4AnMvWey/qtGr/5GQ2JZK
	 ntGs1XCBY5+j9WpLI0dfACafR1JwJjHwjjJ0tfQRrL/GrsV654ufZ2IWLDJfFmObyb
	 LB0+8IqF/Wqii0naVOVXCkNRAJQCKNGFidA+tbm8SswJJV/chbGTmfJLfjidJ0JT/3
	 zcLN/8/QYpMaA==
Date: Wed, 30 Sep 2026 13:15:35 +0000
To: Jens Axboe <axboe@kernel.dk>
From: pgray <hi@pgray.dev>
Cc: Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, pgray <hi@pgray.dev>
Subject: [PATCH] io_uring/tw: avoid local task work starvation
Message-ID: <20260930131446.90741-1-hi@pgray.dev>
Feedback-ID: 11681129:user:proton
X-Pm-Message-ID: e3b567c6afaee7ebe3930a8ff423919bbc2174ea
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

IO_LOCAL_TW_DEFAULT_MAX (20) is too small for massive backlogs

this patch fixes by:
* not counting passive completions against budget
* add a ceiling of 512: IO_LOCAL_TW_COMPL_MAX
* clearing IORING_SQ_TASKRUN when local queue empty

Link: https://github.com/axboe/liburing/issues/1645
Fixes: f46b9cdb22f7 ("io_uring: limit local tw done")

Signed-off-by: pgray <hi@pgray.dev>
---
 io_uring/tw.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/io_uring/tw.c b/io_uring/tw.c
index f573bcc3af6a..236ed01fcfaa 100644
--- a/io_uring/tw.c
+++ b/io_uring/tw.c
@@ -16,6 +16,8 @@
 #include "wait.h"
 #include "mpscq.h"
=20
+#define IO_LOCAL_TW_COMPL_MAX=09=09512
+
 static void ctx_flush_and_put(struct io_ring_ctx *ctx, io_tw_token_t tw)
 {
 =09if (!ctx)
@@ -287,17 +289,23 @@ static int __io_run_local_work_loop(struct io_ring_ct=
x *ctx,
 =09=09=09=09    int events)
 {
 =09int ret =3D 0;
+=09int nr_events =3D 0;
=20
-=09while (ret < events) {
+=09while (nr_events < events && ret < IO_LOCAL_TW_COMPL_MAX) {
 =09=09struct llist_node *node =3D mpscq_pop(&ctx->work_list, &ctx->work_he=
ad);
 =09=09struct io_kiocb *req;
=20
 =09=09if (!node)
 =09=09=09break;
 =09=09req =3D container_of(node, struct io_kiocb, io_task_work.node);
-=09=09INDIRECT_CALL_2(req->io_task_work.func,
-=09=09=09=09io_poll_task_func, io_req_rw_complete,
-=09=09=09=09(struct io_tw_req){req}, tw);
+=09=09if (req->io_task_work.func =3D=3D io_req_task_complete) {
+=09=09=09io_req_task_complete((struct io_tw_req){req}, tw);
+=09=09} else {
+=09=09=09INDIRECT_CALL_2(req->io_task_work.func,
+=09=09=09=09=09io_poll_task_func, io_req_rw_complete,
+=09=09=09=09=09(struct io_tw_req){req}, tw);
+=09=09=09nr_events++;
+=09=09}
 =09=09ret++;
 =09}
=20
@@ -342,8 +350,11 @@ int io_run_local_work_locked(struct io_ring_ctx *ctx, =
int min_events)
 {
 =09struct io_tw_state ts =3D {};
=20
-=09if (!io_local_work_pending(ctx))
+=09if (!io_local_work_pending(ctx)) {
+=09=09if (ctx->flags & IORING_SETUP_TASKRUN_FLAG)
+=09=09=09atomic_andnot(IORING_SQ_TASKRUN, &ctx->rings->sq_flags);
 =09=09return 0;
+=09}
 =09return __io_run_local_work(ctx, ts, min_events,
 =09=09=09=09=09max(IO_LOCAL_TW_DEFAULT_MAX, min_events));
 }
--=20
2.55.0


