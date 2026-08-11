Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D8144AB73
	for <io-uring@vger.kernel.org>; Tue, 11 Aug 2026 20:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786480988; cv=none; b=aAQc2RhRL7p+BuTfwgOqqghDMoWcAXef7Gg8iYmWwVEcbqfNcl6YmgJwgHPn29GtdhFc0F74Smld65Kp0ACGb9O0/x/mE8Rhi8XPbrBgKg50q+FqTgBnvf+RzUfbcV1tx37yTpG63O08x7rw7N1y7ChhmYJYiH1YuSzxNYTieQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786480988; c=relaxed/simple;
	bh=sHpa5fjeGnCP/yQZunKQW3d8rmujSYCW/f7sc+jrXRs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jeeAPgZWbgMd4fI8GSewNkBrogXfMUewEld3h8i1rMIrxEm+bAjN8C14Tht8PFarxxJlmFqm9B1SrFUUYe1cdavg86WRu2csjW26EkQ6QPUWzwNM6RJV8BY6lxBavcJnkxkvDtDnqS1QxMjxa/i4m3MfkutGmxAIzg7pqhRSUR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1abMFk0; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1abMFk0"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47db714766aso902317f8f.0
        for <io-uring@vger.kernel.org>; Tue, 11 Aug 2026 13:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786480986; x=1787085786; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bYHzlD8AP97+5gPoTHx0Gjj8ze70RRZtR6DtOoDWTFc=;
        b=T1abMFk0Stwcvs2j921kU1f3kL309hxjHbRVkWiBPfp0B8fPwpQsaXv26gvA0LiLlZ
         BosDCc7V4z14TZzaGsE7nOTuS7x+YyXiGGoGpR3s7ue4GmfcIHYkS1SXz+atLyU4b5pU
         5veYwx5OwsEPiVF+blAwC3LaU3GCCJ/2X7KNzUZIftyVEAOqEvk9Mo/qpA57UVweFgr1
         cggSuCN/Mt/ImdqIkXCZv+dVKpDlDvltNrVvMicDQMsv8Okr5PIoueQeY7h3inWI4Lzg
         PRTVVFtuwL0nTcmKwUAS0VWwQVMhLpLZLGE31oo6xsQNBtIZCHVEXk9r3We/mqKonhnC
         /ujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786480986; x=1787085786;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bYHzlD8AP97+5gPoTHx0Gjj8ze70RRZtR6DtOoDWTFc=;
        b=W4txPW8Sh5ubAnujMF9Pa5Ir1prBxZWSBWVvLnLO8ZY2CwQZsx9SAhEC+AmB5SYnss
         ZC8bhmeKLTzefZA4wAIJ4BTVo4P4qVkdPKMPOb9Wtr+twXqywu2kewPVaRYLAgJfzASN
         V+BeIYzHSznW77PZ5EVlvKB7JQvnluKoc1JCDgGF7XdkSBB7kkPZ+XOpz+isqxFTJSEv
         DTZVy4NF3UsvoHMcMwyROWaO1n819+gkitq1Ts+MwFmEoP78nsLeyBCxyNIvIy+duH5V
         qALDPaE563UH8y9JvMNYhi6Y58uv5Xo/15tFh3/MIso4ReD71bo5lydA04nl+bBmzKMt
         Sckg==
X-Gm-Message-State: AOJu0YyupebQNFMfN30LfJTZSdq7DQAP2IOaNT5a9E8h87GjeLXipj9H
	GiUdYWk/HxFRro8r2c05aPDCbXEW1liY++lxDTING6NrgD0ycHmmBpP1
X-Gm-Gg: AR+sD12Ar3N+b+6THYvtDL9Gw6wPgZyPJ8koYgSNzUbYafO0plipCV7I81poYU9E7SX
	9+JW2QTtwJ7N1p2VowmR8l8Wn1uZk44I8UFwjjgR4dOyKk5rY74ZUQ0Gug625XLuvLFIrfB86Io
	f8L24vDi4OEKCs+KlvkABBNjaTeDfMOo09mhVIklejxYk9Yx/cLVg46odQGxmF0VtDT3BgottGK
	5Ps5RES1XAHxU26Se9+yJU6g6m+VxS+kfbuYr21uemRC7Hr+ojbX7ar17ySsl2smkp7weEFttMJ
	i4Md3fPTQlnD4kGxIOyH2GtB61yWCjh9VRZNgKC+XTD9fEsTBKnzfTFPfxsqhhEO1HP699eKGCO
	2JS7URKYlhj5I/4mUdFI1aZg+5BuroayuQ7FBcRK6rjeE7f4bzAkZty/UIOmgdBFUcBOvJ0cheh
	KrnN1SdjSSpmQiJq4OtpWndwf6o2KhDDgi/ttIRE+xs2T9dgxPKaIZmjtPrEtS3hC7hvf1mZZYE
	BwIZ+HpvB6Hqr4lQ/XQaaL2BASc9DMbSRM+yjKO3CzNGaF2flnnLHD/GKV5UwYt
X-Received: by 2002:a05:6000:471d:b0:481:50ae:df9a with SMTP id ffacd0b85a97d-48150aedfe1mr1752584f8f.9.1786480985615;
        Tue, 11 Aug 2026 13:43:05 -0700 (PDT)
Received: from valmpani.valmpani (cgn-195-14-219-6.nc.de. [195.14.219.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d72232sm1069253f8f.37.2026.08.11.13.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 13:43:04 -0700 (PDT)
From: Vasileios Almpanis <vasilisalmpanis@gmail.com>
Date: Tue, 11 Aug 2026 22:42:52 +0200
Subject: [RFC PATCH] io_uring/cmd: don't skip completion for a non-armed
 multishot uring_cmd
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-io_uring-v1-1-1dc3dd50e0cd@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEuJe2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0ND3cz8+NKizLx0XUMzS2Nj82RzEzNDcyWg8oKi1LTMCrBR0UpBbs4
 gsQDHEGcPpViIbHFpUlZqcgnINKXaWgDGAS7KegAAAA==
X-Change-ID: 20260811-io_uring-169337c74617
To: Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzbot+a4ccdd7ebf452e4d4701@syzkaller.appspotmail.com, 
 Vasileios Almpanis <vasilisalmpanis@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786480984; l=2985;
 i=vasilisalmpanis@gmail.com; s=20260731; h=from:subject:message-id;
 bh=sHpa5fjeGnCP/yQZunKQW3d8rmujSYCW/f7sc+jrXRs=;
 b=nY7nDsC/IrTl/1kj140qwPTE61hVItgdLqqhD5PLa9YeZL0bgjxEvNehUB9JGifzb7wLLGcoX
 ygcOadn7XKjD1L2KzpPa32b0fd9FSCPzYMlTsZLQ8bsjNO2FPA2a4Xv
X-Developer-Key: i=vasilisalmpanis@gmail.com; a=ed25519;
 pk=gn5Uo6yL8Tlpq5uATxA3nqoq+U8eWLRbjD+bOk0qSpU=

io_uring_cmd() treats any uring_cmd carrying IORING_URING_CMD_MULTISHOT
that returns >= 0 as "multishot armed, completion deferred" and returns
IOU_ISSUE_SKIP_COMPLETE, expecting the provider to complete the request
later. But the flag is user-controlled and validated only against buffer
select, not against provider capability. A ->uring_cmd() handler that
does not implement multishot and returns a normal >= 0 result then has
its request skipped and never completed, leaking the io_kiocb and its
io_async_cmd:

  BUG: memory leak
  unreferenced object (size 248):
    kmem_cache_alloc_bulk_noprof+0x272/0x3f0
    __io_alloc_req_refill+0x4a/0x150
    io_submit_sqes.cold+0x16e/0x20b
    __do_sys_io_uring_enter+0x56d/0xd60

syzbot hit this via ublk UBLK_U_CMD_ADD_DEV, but it is kernel-wide: the
same leak reproduces with SOCKET_URING_OP_SIOCINQ on any socket fd, which
returns the queued byte count and never inspects cmd->flags. No in-tree
provider of multishot actually returns >= 0. Both io_cmd_poll_multishot()
and ublk_handle_batch_fetch_cmd return -EIOCBQUEUED,

Only skip completion when the command is really multishot, i.e.
REQ_F_APOLL_MULTISHOT is set. Otherwise fall through and complete the
request normally with its result.

Fixes: 620a50c92700 ("io_uring: uring_cmd: add multishot support")
Reported-by: syzbot+a4ccdd7ebf452e4d4701@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a4ccdd7ebf452e4d4701
Tested-by: syzbot+a4ccdd7ebf452e4d4701@syzkaller.appspotmail.com
Signed-off-by: Vasileios Almpanis <vasilisalmpanis@gmail.com>
---
Questions / Notes:
- I put this in the core io_uring_cmd() rather than in provider specific
  code because the leak is independent of the provider. From my research
  so far no ->uring_cmd() rejects IORING_URING_CMD_MULTISHOT, they just
  ignore it. The flag is only validated against buffer-select in
  io_uring_cmd_prep(). So any handler that returns a plain >= 0 result
  with the user-set flag leaks.
- Instead of checking if it has been really armed should we just drop
  the >= 0 check? The in-tree code that supports multishot returns
  -EIOCBQUEUED from what I have seen so far.
---
 io_uring/uring_cmd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
index c14c22cff49e..a2899a852879 100644
--- a/io_uring/uring_cmd.c
+++ b/io_uring/uring_cmd.c
@@ -269,7 +269,8 @@ int io_uring_cmd(struct io_kiocb *req, unsigned int issue_flags)
 	}
 
 	ret = file->f_op->uring_cmd(ioucmd, issue_flags);
-	if (ioucmd->flags & IORING_URING_CMD_MULTISHOT) {
+	if ((ioucmd->flags & IORING_URING_CMD_MULTISHOT) &&
+	    (req->flags & REQ_F_APOLL_MULTISHOT)) {
 		if (ret >= 0)
 			return IOU_ISSUE_SKIP_COMPLETE;
 	}

---
base-commit: d58772d8520c7ef247c4b95c9bd76d3a25da9ff5
change-id: 20260811-io_uring-169337c74617

Best regards,
--  
Vasileios Almpanis <vasilisalmpanis@gmail.com>

