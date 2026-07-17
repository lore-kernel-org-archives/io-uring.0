Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8C236D9FE
	for <io-uring@vger.kernel.org>; Fri, 17 Jul 2026 15:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784303236; cv=none; b=BVy6ZEfdCfnIeKKDOl2wmsSs07b4b28nbUQoESHR/7sqcM6U0ID1T3yBRi5WO37NxMGUe+B0lRrwgDg1aYRe1wz3y5/Lc7HRYBTMjQzjVFESSoT5ZhERIlV9qNsBnDP/qC5qgBuQHL1bfoF5iudlbhtiqioYui+rIuNTfMi4oN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784303236; c=relaxed/simple;
	bh=BwgnlKS6uoZFUIiGeKk0FrYrRpmKUyw9IXDmBKkoLt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oWpvSy8hFLhBTBCE4s+0WRAKNDOmQWyrR5NT3OGOTMGty5Zsb63BcBhrWZaH/vRx5eLN8CVHF66DeFD+Whw88V0C/sjXg1Ui9lz9TQiYV6zPdkeMZ2ErfOxFf+iIGjxKo/ML9zRiZpDkdojBk7RDpr+d4bUhUfhFcuDZXjAYZ2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N7kMwGmL; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7kMwGmL"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84830c774a0so3869969b3a.1
        for <io-uring@vger.kernel.org>; Fri, 17 Jul 2026 08:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784303232; x=1784908032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NdgUrAoD+xgbVbnJqaORUuDUuRi23WRv1kWGxD4i+hA=;
        b=N7kMwGmL8LjHFCLlewgF6nBqm7wXz/SiTlhgwM7lJ05qo4XIi/pSfHnNl0QGffCFuj
         YfNvz4GRSI+jb6lcjzy1ItrjHZjNG3quzPF/PybWan2DLKH9IXZX7aDGMG6YNoX2EsDZ
         GFIRPSj/50Q8GZ8lU9A47N8EkDukJoK4h8Cd1ojLqHRy/cRLeOc6h9gVraJ7crE5PA5G
         OVOTLk6+DGopxXc7o/98N+w/y1iv/5umkNpUDERmg16XNu1RbX/svwlwIn1UfVfRueEL
         jtv2EeCnMOAUK7Ec4arFAy70viatlbcTGJ9x02IcMDZgev3ZEEgo+y3E/wWXTccRlKCB
         MI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784303232; x=1784908032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NdgUrAoD+xgbVbnJqaORUuDUuRi23WRv1kWGxD4i+hA=;
        b=nsdIF2xZMTxgDPKnLXkpn7UIa5PoAASJERJUBtrCqT72NO9JqsHUYDvv+SA4OSR/RJ
         4WJvlrWoVSTbAIeRe4yx8N26pcRC/Sik3Efbmd11kYwCFk5jc3x9wP3udZQTaQZJWYxq
         DMHuxW9uiQx91bTY7v+cNg3W3vcoPimMTs7Xy0DeQOIjLHqymaBWsNEcDgjfr2Qk5pnO
         dwQYaFGv2+9tv3CwX9/aCyQXm/nPKkP3rLj7G254lX+0YParLSFCTm0Qmmi8Pv1C83bw
         dv6QyUxmjtfjAXJ+KlvgVJOY7urwI8L/yHo35hPbA2ZFR2S5eX7R1a0b2uR5AYk9qqii
         8LgQ==
X-Gm-Message-State: AOJu0YxwuhmVTHLE82eVi2CxwlxkzEgFJgrUPsrs5HQdt5wabyikMDit
	ZNbClLr87HynDDiE8keY2mONNT+UZoq4349U1owt/iepYFVbZA0SNojY
X-Gm-Gg: AfdE7cmFlPX1PyLWjyhJwrFI0AiTV+QWOUBLKNWQQcjbSwqS3/pLwoJAT91HmM2THuu
	69nhX9HRMwazI7PkdNSi0xqZ+3Rq2b06m8FJMDiw6CQIM3xRkp3v6C+PYsdFw9XzMKSg9AP9HIx
	Qg1AAvt6LPKABCcbha9vs6cc9FbAQXjTgcCAwEycrsOUw0sNbVUwKgiShzMJriYdCneE5r56W5j
	dEFwZ3pgclSaAZ2vhKIeFygAfhoYnXQVr6Z3OnU7bFk8cf5YqiOkWYQBcd5yS056xk6R0ym/Huf
	63edARoXc/R9CY5cdMxpXOu3FTKw2kBS/bpnW0B52KtPTfAkDFw5JFfRVowrJ2w+zgTTJPJRIDl
	eDDXijt8jJx8aA7P7lTLdNokPSSdgFo3h1r2GexRLcvY2SW5CNvi6RsrPbeSRwREyB2l3Ymv9F5
	lBOjRMDKBnpl1wOfo1kVbrVjL5O/fuvnNIYQ0CkkYlW4Fp1r9YJoaOyZRLTKAAEYZQKbmk9ULqQ
	i8w
X-Received: by 2002:a05:6a00:6ca8:b0:848:5821:9489 with SMTP id d2e1a72fcca58-84c294c4e18mr3442329b3a.68.1784303232372;
        Fri, 17 Jul 2026 08:47:12 -0700 (PDT)
Received: from DESKTOP-4AJO944.tail156a05.ts.net (ppp-49-237-188-102.revip6.asianet.co.th. [49.237.188.102])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af6e3e0sm1366674b3a.43.2026.07.17.08.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:47:11 -0700 (PDT)
From: Woraphat Khiaodaeng <worapat.kd2@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>
Cc: io-uring@vger.kernel.org,
	security@kernel.org,
	Woraphat Khiaodaeng <worapat.kd2@gmail.com>
Subject: [PATCH] io_uring/bpf-ops: reject re-registration of an already-bound ops
Date: Fri, 17 Jul 2026 22:45:37 +0700
Message-ID: <20260717154537.129736-1-worapat.kd2@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <PAVEL_MESSAGE_ID>
References: <PAVEL_MESSAGE_ID>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_install_bpf() only rejects a second registration on the ctx side
(ctx->bpf_ops) and sets the per-map back-pointer ops->priv
unconditionally. The struct_ops link path never advances a map past
BPF_STRUCT_OPS_STATE_READY, so the same io_uring_bpf_ops map can be
registered more than once, and bpf_io_reg() re-resolves the target ring
via fget(ops->ring_fd) on every call. A caller can therefore point the
same ring_fd at a different io_ring_ctx between two BPF_LINK_CREATE
calls.

The second registration passes the ctx->bpf_ops check (the new ctx has
none) and overwrites ops->priv, orphaning the first ctx. Teardown
(io_eject_bpf()/bpf_io_unreg()) only reaches a ctx through ops->priv, so
the orphaned ctx is never torn down: its ctx->loop_step keeps pointing
into the struct_ops trampoline, which is freed once the map is gone. A
later io_uring_enter() on the orphaned ring then calls the dangling
ctx->loop_step from io_run_loop() -- a use-after-free of freed
executable memory, reachable by a task with CAP_BPF + CAP_PERFMON.

Reject registration when ops->priv is already set, as hid_bpf_reg()
does for its struct_ops.

Fixes: 98f37634b12b ("io_uring/bpf-ops: implement bpf ops registration")
Signed-off-by: Woraphat Khiaodaeng <worapat.kd2@gmail.com>
---
 io_uring/bpf-ops.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/io_uring/bpf-ops.c b/io_uring/bpf-ops.c
index 5a50f0675..cf2bd068e 100644
--- a/io_uring/bpf-ops.c
+++ b/io_uring/bpf-ops.c
@@ -168,6 +168,8 @@ static int io_install_bpf(struct io_ring_ctx *ctx, struct io_uring_bpf_ops *ops)
 
 	if (ctx->bpf_ops)
 		return -EBUSY;
+	if (ops->priv)
+		return -EBUSY;
 	if (WARN_ON_ONCE(!ops->loop_step))
 		return -EINVAL;
 
-- 
2.43.0

