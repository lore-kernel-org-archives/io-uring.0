Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794629515;
	b=SBLMwIncfAB9S+jsafNF2aBjtvN1jm3JArPIu2Wq52XP+OKcyLFu07b05MF1pQ7b/9Dt
	 L7aY5tHAP6godlnnFBn+uogKyW/um113hBZkdylELfDfovaSQcG8AA7P28zgRxMG84s4r
	 rer3yYT2EiYWlJFRqEadl/x+6ikAfTjNLKn0b5NOZ7Nla4qwoZt4iXZytPmrjHTzu2iSG
	 3CaoJ63u4X82+mLeDiNwYMN+dxQFbfLJP7WO6E4j2fMkQusJhxmTHAvX52PbmjeG7i42V
	 2qlBu/8nw6YP0Z0EDrBZMemq6Qsk61yyYWVswYfNZ53rZib6SXWvdB8dqxtCxmWCMUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794629515;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:Sender:X-CM-SenderInfo;
	bh=4UJvOL4sCe43jvcgqxOVMPKm3ZWW4j+CZgovTLX54Gk=;
	b=foPIxEoKVF+gxFQ6pixW/emBv52SruApw5FYJ0BU3+XqLbkqRdS0atPs+utbY4M7doAG
	 tWdAdE4vFMHdWj8FXRXRNroz6gKU1nPrAlBqMyjmsfnK7YtD5QxPbJ8TXCdL1YtbncYh3
	 JwYjVskKZXGi9rnfSF7blVTnOYmD46FnVKBMxRpFPwI21DIUlKYFAAxM5jn5eD99lx8aL
	 AGFr7vcECMixnG4qCjU3RLK3okGwI616zBHpagpVCUrc+CparAePJfBMtOToQ1y2gdsjN
	 IUxEeURl61fH8W0trpAJCdTDQtqiLswJxheBOQ9w39TFfmWOSC3Di6DD/TyKs7SDsog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=bAEsEq7u;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034EE606A323
	for <io-uring@vger.kernel.org>; Sat, 14 Nov 2026 04:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 034EE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=bAEsEq7u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=4U
	JvOL4sCe43jvcgqxOVMPKm3ZWW4j+CZgovTLX54Gk=; b=bAEsEq7uRQ14//p7WE
	66jzRqbkcGH7JTru1wt/2JNlvI8rMIRqW16w3HS14oap9Wd6V0nVKtB+fG3cAC6X
	jXXgiZtL4GQOJM9GKlNryjwXeiDt4pNFT5ydAoOTov5QU4XXwd4sgDBfthvd0fp/
	OuzmzbHwnT441KLlhQyoGiMxQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3X9Rt3_dqNezSHA--.53092S2;
	Sat, 14 Nov 2026 12:11:26 +0800 (CST)
From: Yang Xiuwei <yangxiuwei@kylinos.cn>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	Yang Xiuwei <yangxiuwei@kylinos.cn>
Subject: [PATCH v2] io_uring: fail soft links on negative IOU_COMPLETE results
Date: Sat, 14 Nov 2026 12:11:23 +0800
Message-Id: <20261114041123.109163-1-yangxiuwei@kylinos.cn>
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
X-CM-TRANSID:_____wD3X9Rt3_dqNezSHA--.53092S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF48Xw48AryxZF1fAr13Jwb_yoW8Gr1Upr
	y5GF1UKFZ8CFyIva17XF4UJa47CF1vyFWxGrWI9wnxCrn3ZFySqF4rtF1F9F12g3s2v34a
	vw4xtFWDuFn8Aa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uymh7UUUUU=
Sender: yangxiuwei2025@163.com
X-CM-SenderInfo: p1dqw55lxzvxisqskqqrwthudrp/xtbC6Q6rPGr3326dKgAA3r

Handlers such as fsync return IOU_COMPLETE with a negative cqe.res.
The old io_req_complete() path called req_set_fail() for res < 0.
After completions moved into the core, that check was dropped,
so IOSQE_IO_LINK dependents kept running after the head failed.

Fixes: 97b388d70b53 ("io_uring: handle completions in the core")
Signed-off-by: Yang Xiuwei <yangxiuwei@kylinos.cn>
---

v2: fold the negative-result handling into a single block as suggested
by Jens.

 io_uring/io_uring.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 5db57bf675f0..5ee314ab100a 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -1537,9 +1537,11 @@ static int io_issue_sqe(struct io_kiocb *req, unsigned int issue_flags)
 	ret = __io_issue_sqe(req, issue_flags, def);
 
 	if (ret == IOU_COMPLETE) {
-		/* not all handlers take care of the internal restart codes */
-		if (unlikely(req->cqe.res <= -ERESTARTSYS))
-			req->cqe.res = io_fixup_restart_res(req->cqe.res);
+		if (unlikely(req->cqe.res < 0)) {
+			if (req->cqe.res <= -ERESTARTSYS)
+				req->cqe.res = io_fixup_restart_res(req->cqe.res);
+			req_set_fail(req);
+		}
 		if (issue_flags & IO_URING_F_COMPLETE_DEFER)
 			io_req_complete_defer(req);
 		else
-- 
2.25.1

