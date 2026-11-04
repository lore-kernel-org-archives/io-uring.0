Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784501;
	b=KR8f8s9GN28OlxDlIYYX7jJDyiow7QMOEq55aQM27FWF5Axrn5UGqwCbDy3v4tq9B6c4
	 bCZmG6LUgUgSxYAUG/fnnwcf2QC7XWIM3sUayzTbiSECww5WfG66Vs+85e+mY3/fa/eqt
	 xn/0YYxrt7YcVvwSXp++/AM187wgX/WqoPu3pwRAGMHWSWzp1Vzb0H2rnACIEAvjlHeSV
	 QpUCorMJbA+SMJapSvIzVKKEPjPgCcA1nuOtQo622KUqfXjsBRoldA4/qfQpKg3qto6Zx
	 WcdaNxbjeWqxvzplqiit07iGgNzKHfXo1gnBGuwfCUzcxn1Hf1lyq3ryxwjVrzXkcdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0zHGo93qYde2frWTAur5t25p2qoSOlYOpu/HTcWKz3U=;
	b=D0SIfbxZd+N4GRsNpTcwR156t+w3aRMRmo/5Olh86Xhx1cDRaV93++g0f/KtOtaqWhtX
	 J//a5Z1bBuXMF6exY5p1WdgaQVheiwVWtUnAJWyX3gywbxSiUbcoaVGb/zDRxF5ErIjsF
	 r84doStPWFKsaLJoeT1FNA8sU96LM/lnl9ABUGA3qkvW9r/0OXfhnld6a/K+U8yuuqJ2w
	 bA+DJ1UvdDbkN85p5oVX5rBES575VLUARk0AGlgGW8Aw1IjcMtyRWR6CTcD+K2MgN0Au7
	 cBw+h8FOWlH0apVF9coE5cxdM9Iz0yYptKstacvrIEiZmGMOhEvFleMnD3imfHWXAPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LWL7aqvP;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A82606A32C
	for <io-uring@vger.kernel.org>; Wed,  4 Nov 2026 09:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38A82606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LWL7aqvP
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso330230a12.0
        for <io-uring@vger.kernel.org>; Wed, 04 Nov 2026 01:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793784500; x=1794389300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0zHGo93qYde2frWTAur5t25p2qoSOlYOpu/HTcWKz3U=;
        b=LWL7aqvP6LaqdzMTfMUpGn9j9eLYA5gPiEP62xfsus00vX7MEXTOicTxhlrRjozI2k
         A5z3JCAASgMTH//+E37mdxAnMo0Udx7b0A+/7arNCJ8bRQzJk1YHsAMHHhrOLqcqsDZA
         CUucVKuelVaIaw/Utzz/Xtn230v1i4KBjIQ4I4yDFUwqUlvjaZpoQfQ1IDi5Nu7c8jWh
         8DpVWWw7agWYWqMC63e3mxgnPyHyM4/jaxbagmWDlLRpxVn2LqHBq6RL6H3UvpyVhHuH
         MwnkEDFGTJX+d03mXHWj8gqI5HSlkS28HYB43zUwXlCNgR3/G2cTESGR197ET+vgstsk
         qJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793784500; x=1794389300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0zHGo93qYde2frWTAur5t25p2qoSOlYOpu/HTcWKz3U=;
        b=dw4n8lLMYjQE3Af/G7EaoAHlzUQIx6pneu0Zmnuu2SnyFGOjHwVF0WJTDvGBTx25Rf
         7hiHKlbQgaPXhuBGWw43pRLXWIoeRqH+CfyBa9GX4dOYVrtup8IiAfTqUFXIQCHFVg8C
         g8FN3N6FBqV0A9Yx4po9XojNEGUpLk6lu1sm8T0LRygzfwCAxUN1aub8qjfmQ0aC82w9
         H11iLp8XQnOhleAJQoDbPdkB3YLK2r07q1ACYTfX3eX3wQmrfevqWxe19k4mEFtqUDq8
         9sZZ+Xw3/O0iHiXZQ21/mmXSqi5Og1Tfrnu7M6VPBslXBbfayKG/tOnJo8CpedOW4qnE
         Gqxw==
X-Gm-Message-State: APuU4Z+SCYzB+7jH7IDP7EUONvgBZLGfespyo3EOX/IdZpibioDvxtKO
	Y4SmVUd2OvQ6rOM/dlT4YV8wAfIggf/4SpwtWetctG1rTn3Q01wGJlIARTP+Pw==
X-Gm-Gg: AYBFou3prQ8nLRkLroQMflXwFJ5dy4qGr///Y2FUy0ytquRRCKjf9vD7KiCBMksBBW+
	LUvhDlRlWyvarAApWCZhmkHjZ5yoNF+tWYyUdxk651NOe9jH710nP6AQdF7rGaK0vJUiA/oEeQz
	BG4pD/dvVp9aHLzeK5Rlyztd09No4vWYWmB8OnuW0j0b5FvmoVLADabieH0UXGzFkhBHB/927uQ
	pGjstUV+h3LMi/YLK1CHdNkyZ62SkV7gVF/COD7C545ja5ypnQ7tFsgixMkKPN8USn6Gab6Ax0i
	kCsJ1K8VE7/ahZ0n5Rx4UCbU79kjC9iLSPC7h3AZgmfPeCMNWLr/Y0MI8mHNB3uueIdP5nXPr7g
	RQ/M1SLWLZhK7muQUElL2BSXDj8e0QY9pKW6DJ7i94pAZRkfUULXxVyvJ5/mrk0vqd9HWW/NJdE
	bVv/9V/6nYR0+bhfJNdG8WkkA3tlk3t/CKbgh4Z20KjPtOhog5n2HXffHH5DWS6flZgRW5kIyUg
	JYQL+QZqRCWY0LeWwpBUj90p3NXcHC8M9aOy0utaLu6wxluSLE1Pjok5r9jwxu3CJYIUcL1/LEk
	pkVdnBxEa34n0ikFMtqnjTb+FoqGXoZdjtu+0Wd02FosvTo=
X-Received: by 2002:a17:90b:3b85:b0:3ab:188b:c5b1 with SMTP id 98e67ed59e1d1-3ae897e4182mr13402636a91.56.1793784500419;
        Wed, 04 Nov 2026 01:28:20 -0800 (PST)
Received: from ubuntu24.vpn.host.chaitin.net ([124.77.157.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b094453532sm3139161a91.3.2026.11.04.01.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:28:20 -0800 (PST)
From: BeaCox <0xbeac@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org
Subject: [PATCH] io_uring/rsrc: hold uring_lock across index-alloc put_user
Date: Wed,  4 Nov 2026 17:28:18 +0800
Message-ID: <20261104092818.70521-1-0xbeac@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_files_update_with_index_alloc() installs a fixed file via
io_fixed_fd_install(), which drops ->uring_lock when the request runs on
io-wq, then put_user()s the allocated slot back to userspace.  If that
faults, the error path calls __io_close_fixed() by slot index after
re-taking the lock.

The slot can be closed and reused between the install and that cleanup:
another fixed CLOSE plus open/accept/pipe/socket, or a FILES_UPDATE, can
put an unrelated file into the same slot.  The error path then removes
that file instead of the one this request installed, ending an unrelated
file's fixed-table reference early.  This is a correctness/DoS issue, not
a use-after-free: fixed-file requests hold an io_rsrc_node reference, so
the node and file stay alive until they are done.

Hold ->uring_lock across __io_fixed_fd_install() and put_user(), and do
the failure cleanup with io_fixed_fd_remove() under the same lock.  This
is the same class as io_pipe_fixed() (CVE-2026-99265); faulting while
holding ->uring_lock is fine, the registration paths already do it.

Fixes: a7c41b4687f5 ("io_uring: let IORING_OP_FILES_UPDATE support choosing fixed file slots")
Signed-off-by: BeaCox <0xbeac@gmail.com>
---
 io_uring/rsrc.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index e0345c3e76..6c85eb50f0 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -570,13 +570,14 @@ int io_files_update_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 static int io_files_update_with_index_alloc(struct io_kiocb *req,
 					    unsigned int issue_flags)
 {
+	struct io_ring_ctx *ctx = req->ctx;
 	struct io_rsrc_update *up = io_kiocb_to_cmd(req, struct io_rsrc_update);
 	__s32 __user *fds = u64_to_user_ptr(up->arg);
 	unsigned int done;
 	struct file *file;
 	int ret, fd;
 
-	if (!req->ctx->file_table.data.nr)
+	if (!ctx->file_table.data.nr)
 		return -ENXIO;
 
 	for (done = 0; done < up->nr_args; done++) {
@@ -590,15 +591,28 @@ static int io_files_update_with_index_alloc(struct io_kiocb *req,
 			ret = -EBADF;
 			break;
 		}
-		ret = io_fixed_fd_install(req, issue_flags, file,
-					  IORING_FILE_INDEX_ALLOC);
-		if (ret < 0)
+		/*
+		 * io_fixed_fd_install() drops ->uring_lock when running on
+		 * io-wq, leaving a window where the slot can be closed and
+		 * reused before put_user() faults.  Keep the lock and undo
+		 * the install under it.  Faulting under ->uring_lock is fine,
+		 * registration paths already do that.
+		 */
+		io_ring_submit_lock(ctx, issue_flags);
+		ret = __io_fixed_fd_install(ctx, file,
+					    IORING_FILE_INDEX_ALLOC);
+		if (ret < 0) {
+			io_ring_submit_unlock(ctx, issue_flags);
+			fput(file);
 			break;
+		}
 		if (put_user(ret, &fds[done])) {
-			__io_close_fixed(req->ctx, issue_flags, ret);
+			io_fixed_fd_remove(ctx, ret);
+			io_ring_submit_unlock(ctx, issue_flags);
 			ret = -EFAULT;
 			break;
 		}
+		io_ring_submit_unlock(ctx, issue_flags);
 	}
 
 	if (done)
-- 
2.43.0

