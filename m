Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728D95CDF1
	for <io-uring@vger.kernel.org>; Tue, 17 Mar 2026 20:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773779790; cv=none; b=EHixj+GfennQgJgmg6m4jb07eqIQk1aLvG8Scme8XtJsm0km/Im1Tf+Su4mEff3IlbPASyY0+L6hYi0aV1mUNfaBV4HSUxAIogmwSVqVaerJwjG3sEVBFwYrA0iaoqVALxK0oLvCta8Z9qndwzcW7MQAdT8XFZSrmDqGu7otO4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773779790; c=relaxed/simple;
	bh=2HaZMnq/QTYKndSHmIwGrm9Byqros5huz1jA5C7c7Tk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K42eQ+QBMmr+AbNBsHg+fqcNYO71xQM1UhiMI6E+dDKTV+cX3ti5WyQtriRfm3gJqzxldS95g6I1lAOjxcRR7gT21yyGN+nZJqRwjoJBQCD/GX3WFxMd83/dZxVp6o8A8qJQvyLnyF6De4e2RlV80MzpOSB/s9zcu54a+vun4sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=ixFCmFqL; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="ixFCmFqL"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-41708f6c3feso4023631fac.3
        for <io-uring@vger.kernel.org>; Tue, 17 Mar 2026 13:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1773779788; x=1774384588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yod3nwg94XfLJAJkxmlsx3h0nvU+Jtl5APJHRhwBDc8=;
        b=ixFCmFqLb4I0M0+wZsnIanDNjQdIOmYJfo0D7rdHK+kEZBIHcC3ii1jBd7IEcx8FST
         3SJksiLESdZ/TPpBJFh3+cWb5bDYSYF+zbOURQ+iPKJc+hM06CAKXFtVbzvSaOKu0L5K
         dsgQzvlmVIUD04eJP8NTj11kyGzOiqLUV7mplv4y6Me11uT5QHhWixWlo4GUSAuXOOQ4
         JbOlIAa1xCga50GKf4b4xkuKslvGA3v2M84VRmXXxr3d2eWhZekKDjZxJvW2du5JLmGz
         U4pmTzHUpywUKO90KEH1BZJFnawxItqq6WeAEDeiUyWA+I8mkN4u+VoDkYIM+006TmyY
         T1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773779788; x=1774384588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yod3nwg94XfLJAJkxmlsx3h0nvU+Jtl5APJHRhwBDc8=;
        b=iSqIuFAPFYlYxHjJVIC6Y9iz3LEjXKziggpMJ9h0YO9bUjaOPQP1HzaMSVbZIPSN/y
         bJNip5Yx4brbbIVrNBSvSvoTJrbRmaxTTTE4BKLJr7ZKoOvvQs6BRr1WPtOY/DyUWfr+
         FMw0z1dlEjPzB8vv5NKDYApa2PF1vZ2UmyrCoBCdRxjkMi4bBQSd0/AB+ih2YWKnim7n
         u+4R5u2+DwyRzrGqv4TRFq17s4UHPSd+W73+ycwkqH13432Z46BTMf2EMgz9fRi56Gi1
         Sj41UGSLxdAJ3f0KHnNq7wNIzKiLn4wCyXHGLGOk4M8GgOkytmSJbJQBoD9c9VZaY2EV
         YY6Q==
X-Gm-Message-State: AOJu0YwnEM0MwdBDezJtk4PdMe4x9ku26ODlFzR6woFnT0fYI33oKMcn
	xxvdjmCylVCYAIxTVcFieJ5/k3Laq+tE6tHjuU/OvJwoj4Vz3QuoHRjNOXvcQMWjlIi/20xDqHY
	09LVVJiE=
X-Gm-Gg: ATEYQzw4W9u9hUlhQPHFH6ob2Hu9k+6lcKQSh1midJ9zDtTO6tSD0emcy1IwiB1mVBJ
	ZJ0r56bMrQFHnGlVYPkquhX/Q4eSEBDg2jiwjSQ1E7Zo7DMFSm4XyqSaVKQyb4UyntDQagxpEQu
	FN2rv9CxSBQU04963nSZOTh4Xth85ApUtxhyXjxNGSP4h5H73y7YcbTj4VuX5cT7GCnBQeOo3W9
	NPSfwoqZiFDiy7UNVQ0Yqu80jkQxph0wEriH5Pe4hguoQxorSEM5+cEpWHiKL0z41x7iLqB7Whd
	hrKh9RtUj+RPjs7HKaJk9unuhvs4jSXxcrxvPWvyY6aUypl31hKzN79cPZqxk1x2Y8sc6vs3fU+
	SySD561HaqdAGqlu8LGfM0Pp2TR5EVAyOnUpDoQsrZ0EOWPvqw/P93apF0lYMNSORM+gM7Ukiqf
	sYoL+rNfld9WxkK5/zvcb2h2Fjanfvn1kfmYQSUvgftzcUa08gSV2/H/ebVLWYSE/IphA=
X-Received: by 2002:a05:6870:5b9d:b0:409:7e70:299f with SMTP id 586e51a60fabf-41bd3e3625emr582266fac.9.1773779787965;
        Tue, 17 Mar 2026 13:36:27 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41bd2cc1015sm670885fac.14.2026.03.17.13.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:36:27 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 3/5] io_uring/net: use 'ctx' consistently
Date: Tue, 17 Mar 2026 14:35:16 -0600
Message-ID: <20260317203622.1007183-4-axboe@kernel.dk>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317203622.1007183-1-axboe@kernel.dk>
References: <20260317203622.1007183-1-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's already a local ctx variable, use it for the io_is_compat()
check as well.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/net.c b/io_uring/net.c
index 3f9d08b78c21..b3f73883a24c 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -1375,7 +1375,7 @@ int io_send_zc_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	if (zc->msg_flags & MSG_DONTWAIT)
 		req->flags |= REQ_F_NOWAIT;
 
-	if (io_is_compat(req->ctx))
+	if (io_is_compat(ctx))
 		zc->msg_flags |= MSG_CMSG_COMPAT;
 
 	iomsg = io_msg_alloc_async(req);
-- 
2.53.0

