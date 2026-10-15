Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C84248F001
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092704; cv=none; b=oEdjrzqnI0SeDGa9otVkdGjT/O5vtS6+7GXiGQc2+0jvEirocLqB606i2/Hnrtff5TutnZi+r6L4Jju9oVy8/Gj5mHIEXaISvONYnRCeDPm/IHY9XNyFFiUpHa8P5na99d6Zn7fhRa8rp1jnAxOKWmJEFj1wiZFHrS/2Ddx8o8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092704; c=relaxed/simple;
	bh=VkWiivn014sYAPKgWKzsud6e5yDQKhwJcVy53HXfOQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GMETwbqdsHBLB6RMRDbt4k9qMBJ7UZWDQW6zJAUfFGmvWZFnuLK9ZXjYJ+zue428fQjS/0nclQvuXPD3XNBY6OtyanjSqvfAImJVA44dDeEFo4JseeB8guF6Zu2joTveileCzNzDp5p/El2YjsS6FeRBHp+Idg5DaVaaCxrf19o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=cg+EOV9A; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="cg+EOV9A"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91b813ac020so69687916d6.3
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092702; x=1792697502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKzojIIHn4CIHSICyS05FbZlgZg+fPXWMS56a5lWGb4=;
        b=cg+EOV9AZNFDZSel8E1FeORn5+KE9D2ILMMNI9hR8tCM38q5WDGqp+2lgdqGt6Vti6
         2x8rvFcY9Ess3NMx9TnOfC9g8/nnpcgrnbwuupGwYy1XxtNlFHZT60KSLyaCZxTrZNcw
         tjCzszdi61mAumI8mJ+4eXJMNXhDs//f7dwAdXk8HNRJmm2BjePbqIqA1wkeQ4SMXPIm
         zGT+xDEBl/6KJMru2n+aBLbqvNY5ry/OWcVoshYXH59uE0e1dh1Tju2slIJO8er/XoFP
         Loc0CTDwkIbw5ULXqtZHCQiGsPIcxglt+Vs4qfwdVIFXqC+XVLiERyiNRLQVVSmu87uJ
         5Sxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092702; x=1792697502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yKzojIIHn4CIHSICyS05FbZlgZg+fPXWMS56a5lWGb4=;
        b=VucNUVVY1T52GrXQYjB30FqXKV6onfAYlSJtHCw9/UFGf6ySH15JBAHR7dK11ONm8O
         qTu3l6kVKWat2YrqzFOaYMNBEMrp7MwH/mKBnHHYhBm1QSjW8cVkiK6rwN2ExZ9kuY+0
         x1NaLJcE9ogl6hp8FYJ4iq//q9TZUROuRK0KZ07/zv9y1lcTmYodZs2PddZSFP1yQRFx
         Vl/LjOYXiCsHfWDCF8ykCBeOCoZv4T5bO7huDDE2CcqqIN0GM5euBNg2o8Nu5R46HTRM
         TY2EFVXlHfJGK84LwEiEeIMduGblPz6wOqZhdKhaXXSXOsGUYTj1reS/b8rUtkNt3D1N
         UfKA==
X-Gm-Message-State: AFq9FYI2L7GoBvElFBUAYJ83qNWrJ8pa0UpGOIJUoBaYyIj/sOc4f5qc
	Pe1iHjLTin+SUhzvqmJ0+x4EWxC6awPgppV9Mgdrb6ryEgUz2cMpLDgYG8pdWaf2nMoh5fzsImh
	jmeXh
X-Gm-Gg: AYBFou0RtgPOGTfLvOQ/B4Guhc9v53ojGX2dFD5VFmqkTL79DHeAs7zGxjOeNWm8dhO
	DttOEeGCAH17niz0xPaEsJnUVkPnMBKXcLIgY8MmXZg3qvAORChXXo1rVgWnhH6HK4uwlUhT/4S
	dFuFE4mv20tw3Ut5n4yPyCjGJSgqLOHa8YeMS0ebXSwq/n7iNLEzsSQBkDse2poduAtljwFqqGq
	VLAwYap8M7CNCJRedxelRPDf+IOg8KmmNmUrYU0U+bQkVy5LV121VhYe8BpHlj7XowcXtdKk1gv
	hCcDPepdtRgeqiJEdCzcf5FPF8zidwLRDZUxE72VVpH58R+za2dswSgzE3bgzb4xMS5eJJnyP0D
	pFy931H9pt8Z+P3m2iOWiGWrvXgVxzZFL+NSAx72bwvHWcg1NT6mBil7qy2bAoPZvFRv2j78GuJ
	A40vBTLepgJvfSN3XshyVET7wWRgJ/DEXvHJLNDgbxnRr5q1gb4H4lbQ5Ijn1yyY4DFag9ARiDe
	dRnj99fbl4YNVsOc5AGKKsqvA==
X-Received: by 2002:a05:620a:46a9:b0:93e:4d60:d389 with SMTP id af79cd13be357-93ebd2257c3mr3408387385a.25.1792092701971;
        Thu, 15 Oct 2026 12:31:41 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.245])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a18176esm12952185a.20.2026.10.15.12.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:31:41 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:41 +0000
Subject: [PATCH 17/43] io_uring/cancel: recognize "no timeout" on 32-bit
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-17-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092658; l=1521;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=VkWiivn014sYAPKgWKzsud6e5yDQKhwJcVy53HXfOQA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMuI9hFPZBt8Ry3V52itlPWpEnIg0jtBzB89EHBj+e7yCxBG+33YtrqmJchhEytVy63h5EmyzWU
 3oWxKstJtXg0=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

IORING_REGISTER_SYNC_CANCEL waits without a limit if both fields of
io_uring_sync_cancel_reg::timeout are -1. io_sync_cancel() compares them
with -1UL. They are of type long long. With a long of 32 bits -1UL is
4294967295, which is what it stays when it is converted for the
comparison, and the fields are never equal to it.

So { -1, -1 } is taken for a timeout. ktime_set() takes the nanoseconds as
an unsigned long, so what becomes of it is -1s + 4294967295ns = 3.29s.

If the request is being run by io-wq and can't be interrupted, the call
returns -ETIME after that time, rather than waiting for the request to be
gone. On i386, with a buffered read from a null_blk device that takes 4s
to complete a request, IOSQE_ASYNC, that is what each call does.

Fixes: 78a861b94959 ("io_uring: add sync cancelation API through io_uring_register()")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/cancel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/cancel.c b/io_uring/cancel.c
index 290ce804c868..14d6ccf57668 100644
--- a/io_uring/cancel.c
+++ b/io_uring/cancel.c
@@ -319,7 +319,7 @@ int io_sync_cancel(struct io_ring_ctx *ctx, void __user *arg)
 	if (ret != -EALREADY)
 		goto out;
 
-	if (sc.timeout.tv_sec != -1UL || sc.timeout.tv_nsec != -1UL) {
+	if (sc.timeout.tv_sec != -1 || sc.timeout.tv_nsec != -1) {
 		struct timespec64 ts = {
 			.tv_sec		= sc.timeout.tv_sec,
 			.tv_nsec	= sc.timeout.tv_nsec

-- 
2.55.0

