Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FB33BF67E
	for <io-uring@vger.kernel.org>; Tue, 21 Jul 2026 08:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784623679; cv=none; b=TSMnysDq0zwpPhjCj9SjDGPcaOYyyv2zD5NYTpKb5D+Tq+YfKxkImhgcoxtJW7qZTVDzrjA6teuDoIeFrBZbfU/PytHPBTPyy5SF36Roiw85C6XcJWO+1JjNTN94GSnIb7j+QVn6Q8wxb6C4dhjn04Pk+ajFeACUzPFBLS93qOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784623679; c=relaxed/simple;
	bh=GfEQ+OwxXQ1nHICDvlfRs2eTprljHrRRY34VzbIVR1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XtIOhGj40EHZ8rl3b04bLJ/25q1j2TL4pghXihOOCuXZ6zPZCcQVruLYgNjnrcVqXeKcL1XNuS0b/2pYzEVRWy/5UN4E1YZH9JsUqyn5CXgtTPQVL48IKfUm0GEjeG7M8QrBUuwpZdwcB6CEDBHcWTP6nW/wGTuph86U8OP1nJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQjTxS2S; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQjTxS2S"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-caf45fc5202so7731221a12.1
        for <io-uring@vger.kernel.org>; Tue, 21 Jul 2026 01:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784623678; x=1785228478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nV3q+eHhbCfmvIKYJNzhZ7doa4w8F1rofh6XZPW6Qlg=;
        b=NQjTxS2S9mjydB0pyasom6b5emXFYMfM/RMIN//65Uhncd127sdURN6lLmcJLQbt/L
         nC8d8de16dIeYoNEWoN3sILRC3dJiGGsi6mFIFwmKKLJlN7CdmYr2hjE3j68TZJhfITn
         pGzF7OP/DZkQ4rGP9pWxFk57HzpFAWcBPxrNs6ASWKnTjsJTAS1/A564U59GZElDcuyl
         Hd7eCKf+4NoLl2o1EJ8Qq46Xqvx2H64BqHDVGsXQFlkfVMxF5POzyrRaV0Z3zmX8Pyae
         kcFd+JDCwAfsl8hrhgCSq2QJDY2+x+mN9PzdSzTMluRZBq+jTBqSD0q1iX4KDgmpUpIf
         SLQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784623678; x=1785228478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nV3q+eHhbCfmvIKYJNzhZ7doa4w8F1rofh6XZPW6Qlg=;
        b=FbeUPFnfVBckq6UlURy4gaLyAWATyUUb1fZOcdx9eVICb1c4M5qEnIAPiCGboB88rd
         fcZzWmlHWOtg+h+Ss/XCAs4Ci2Oan6lZRx7RTvrlvJ36GOLTW/axYgigPoTcuMfBLRkb
         P4rWWmUeqOAmWM1ymAbAIMu09Xeh8kz8+6OMMh/XDhcePRTRPjdWwHeorAgrCWATPrt7
         /Ijk/vgVinXxUhr5PdCK5erTsvzjlrjnrTj95HSBgbsJ+h+L1tDAzhLFXXkjGyJmoY5n
         WhHJV1HIrMuJOxrHvm51W1/eLbr8Rp0SarJ5tgUJtTYJVipLzPCjmMEZfFAZd16yqbxA
         Mamw==
X-Gm-Message-State: AOJu0YwvqpEhsiri3jNt1hdRMJa5B/Dr/UA97G/CB2nIO1ThrF64HvAf
	Loih4lp+zjIbo7bmPy+U7KBeelHeW9lE4MCfEkZkcVHA9mQ1nL+4bRJ9cwo1e5q5
X-Gm-Gg: AfdE7clXIMdj86LJs1pwXx/ssmtn6yD5DdHLhNspmhS3mgEugqFk9UHelcKkJ8oFM4e
	z1mG8HjlpM3dRpN4yEgYAvtdE5dxMfVVRHo0zBedIY0rkFOPuUfFhrdbky8MHnomOJoNT8AXIK/
	2YltZz67XXEdkGQoASaQhK6jcgwzWOqmQoEaeLPrKazXVKb4ptjQr9UKkjE+r+VJNqAxkl2YGzM
	OBOcUSSZ5AhqNKNf0mmKLhgfp63rVjoBA4mwJ3WaC95WDBoenllaFQchC33jyi8Yx2ejydKSjmN
	ZTuyp7/Mziwt1ulsW0ygi7/p0bL4EHlKTW9YJftDrmeIlj7X83b0KFn4y+YYgc4iXOPTMmKkgW6
	nCUTEcbN1maE/rCg0SZvWdluNDpHHwBwKfqbfNhN6Ug/XgryqaRlBsDLGZCQlOkTpcDZYyDANjg
	doB2G6f2hzCWfIOsnChGCBf7oFCgbq2FLzyk6at94KuaoD0dU=
X-Received: by 2002:a05:6a20:d52f:b0:3bf:aa1a:d2ef with SMTP id adf61e73a8af0-3c3ad938d60mr19800362637.56.1784623677775;
        Tue, 21 Jul 2026 01:47:57 -0700 (PDT)
Received: from localhost.localdomain ([125.20.165.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1ddeb6sm50740915eec.20.2026.07.21.01.47.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Jul 2026 01:47:57 -0700 (PDT)
From: Aayush7352 <aayushdixit924@gmail.com>
To: io-uring@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>,
	linux-kernel@vger.kernel.org,
	Aayush7352 <aayushdixit924@gmail.com>
Subject: [PATCH] io_uring/kbuf: fix UAF in buffer selection when access_ok fails on expanded iovec
Date: Tue, 21 Jul 2026 14:17:52 +0530
Message-ID: <20260721084752.79346-1-aayushdixit924@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In io_ring_buffers_peek(), when the buffer ring is expanded
(KBUF_MODE_EXPAND), arg->iovs is set to a newly kmalloced array.
If access_ok() then fails on a buffer entry, the error path kfrees
the new array but does not restore arg->iovs to the original value
(org_iovs).  arg->iovs is left dangling and will be reused on retry,
causing a use-after-free when the caller retries the buffer selection.

Fix by restoring arg->iovs = org_iovs after the kfree on the error
path, so the caller's state remains coherent on retry.

Fixes: b3e0216c97e3 ("io_uring: add buffer ring support")
Cc: io-uring@vger.kernel.org
Signed-off-by: Aayush7352 <aayushdixit924@gmail.com>
---
 io_uring/kbuf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/io_uring/kbuf.c b/io_uring/kbuf.c
index de0129bce..eab4de8a7 100644
--- a/io_uring/kbuf.c
+++ b/io_uring/kbuf.c
@@ -314,8 +314,10 @@ static int io_ring_buffers_peek(struct io_kiocb *req, struct buf_sel_arg *arg,
 		iov->iov_base = u64_to_user_ptr(READ_ONCE(buf->addr));
 		iov->iov_len = len;
 		if (unlikely(!access_ok(iov->iov_base, len))) {
-			if (arg->iovs != org_iovs)
+			if (arg->iovs != org_iovs) {
 				kfree(arg->iovs);
+				arg->iovs = org_iovs;
+			}
 			return -EFAULT;
 		}
 		iov++;
-- 
2.55.0

