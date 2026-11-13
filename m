Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563304;
	b=s9dwjLLojVCRya206Xe0+XTiQHTJfmdExu7eJpC3x3sDY5eo7lu/2GFzILLG+LHD5vwW
	 mIFOj/bVoHJcCCGhd+LbYGpKEKSCLZaJlBnjJcPsvz69I0gsVSCiMfLf+vIekwfbKbOp1
	 OZbvCJfBjCIfA5iguZVStcdoS7eQkRGkYWSIyEvYKL+nvX/60BZ2Q5PNXnwb2Z/sPyUiJ
	 jg2MkReE606i6KyknN9MxKb2nxr9ERiSclhAO+2Vqz3Tspc7gx96YCKWs5LSV9PL5McKC
	 MWKCXZPussYo8oCeQxpeZ3H2uSWLHE9ezRBybIUn9Ivg6ZfXc5T445AnO9IbExJIusQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563304;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:Sender:X-CM-SenderInfo;
	bh=Vbrw/hgEJ89ENx91VM7zY7bjJSaKHbnm/J2cWxM7MCw=;
	b=xZiMKMSPredXfRhE2/K7zYfADLJrzRUvGQx9ZzD0n+iJhb9vX6ALt8vB6WSXR7QsVCOK
	 2uk3gtCe+8GrPV0r2kIpNLGpvzUZhABdI0yZzG1N7Xo2dIV8NVuzQAOlv2w/tGHStPb65
	 WfxphpiWSHqDCA2v1r/SiR3hCXWviUJ5oLM7+0tSrZUht2VTSQvmQDdbUvV27tk/D8VHI
	 Q6Qst041P8I/SnjAeCr/nG5DMurLZLjxNxkNe9gS8Tl4xgr338HGZgyQqFfb90duerrHm
	 ZmoiBm36n2OpOQ3MGA85EDfUst8jLgOmbx6CficextpLBSwBX7URUpBs2BL41ma9Q6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=cJYYByZ5;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDDF606A333
	for <io-uring@vger.kernel.org>; Fri, 13 Nov 2026 09:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EDDF606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=cJYYByZ5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Vb
	rw/hgEJ89ENx91VM7zY7bjJSaKHbnm/J2cWxM7MCw=; b=cJYYByZ5OIhHGyrDBa
	Zd1lvXUCZ8nJawY3AskPfWGyBR4iI9gv76XOhN7LJNj4lh4Q31SkXeZSaws6faqB
	v1JWx0ltLMJsRYAfm3tEbO47jgrvQogF8SCSlVvvEWMuba0JvJpIzsWdn36HDkc8
	XQeGwwHsDAHNyuru5O0WNCc9Y=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgCnZA3X3PZqVP9oFQ--.14349S2;
	Fri, 13 Nov 2026 17:48:08 +0800 (CST)
From: Yang Xiuwei <yangxiuwei@kylinos.cn>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	Yang Xiuwei <yangxiuwei@kylinos.cn>
Subject: [PATCH] io_uring: fail soft links on negative IOU_COMPLETE results
Date: Fri, 13 Nov 2026 17:48:05 +0800
Message-Id: <20261113094805.1881266-1-yangxiuwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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
X-CM-TRANSID:PSgvCgCnZA3X3PZqVP9oFQ--.14349S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF4DCF15AF4UAw4DuFWfZrb_yoWDZFb_Wr
	y5A348Z3saqFnIkFyUCr409F1IvwsrCa18WFZ3Ja4xJFW3Za98CrWkArZ3AFn5XwsxXFnx
	KFs8u34xKw12vjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbwvKUUUUUU==
Sender: yangxiuwei2025@163.com
X-CM-SenderInfo: p1dqw55lxzvxisqskqqrwthudrp/xtbC6RjFVmr23NjjjQAA3U

Handlers such as fsync return IOU_COMPLETE with a negative cqe.res.
The old io_req_complete() path called req_set_fail() for res < 0.
After completions moved into the core, that check was dropped,
so IOSQE_IO_LINK dependents kept running after the head failed.

Fixes: 97b388d70b53 ("io_uring: handle completions in the core")
Signed-off-by: Yang Xiuwei <yangxiuwei@kylinos.cn>
---
 io_uring/io_uring.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 5db57bf675f0..742322c1fcc3 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -1540,6 +1540,8 @@ static int io_issue_sqe(struct io_kiocb *req, unsigned int issue_flags)
 		/* not all handlers take care of the internal restart codes */
 		if (unlikely(req->cqe.res <= -ERESTARTSYS))
 			req->cqe.res = io_fixup_restart_res(req->cqe.res);
+		if (unlikely(req->cqe.res < 0))
+			req_set_fail(req);
 		if (issue_flags & IO_URING_F_COMPLETE_DEFER)
 			io_req_complete_defer(req);
 		else
-- 
2.25.1

