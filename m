Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C983548F824
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141340; cv=none; b=pLRQ2VfcglKH9SNWb5/07JMFOmvPg5Rv+Rp0A900L8L5mR8civbXsTJhxa31p8Dj4GO3byeIlM9Zb95sut7Wi9oVRpiJ53UdTX+DcEUFWOCHL+gx4xsgrX+eUTeFSQeO8yeZHJkKt3aeqYW/b8WjJJyJII6oTFfj1pVdMRemsJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141340; c=relaxed/simple;
	bh=5A1wu8NEeK9mJoM9/OY+CglS8dpgeZrlo6DgdNg46HM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dTQoYbpVAKq6Dj/qulAbfnOKf/JpHEiENewwVHIzUl6GJT2zBJ4PMuo0cTIyftSEO9ZFOC34AXh6QLiyGUvfuB0s6vykYJYDytNPPJhFSkb/zS7PlJaIH5dYeGm+C21XbrGVSPST5wtA+lgtawGMRW3KbxVWEQe3m8ouj99EK2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=GdCuJ436; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="GdCuJ436"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc9ab650so4806fac.1
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141336; x=1789746136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UfA4gKLRjMNP2H10G64YdooBaWutPGm7Kf7SsyC2UwA=;
        b=GdCuJ436yBQPGmZmv0GkA1LKAVy0QL/LDG1+alUkOkMSCpTPAhG+dKJPJuNkbCQyge
         vQk4wFjY8CFZXuXB6VVANodNvSNNRHNnlw4pf26ZOWq6E98n7o5oDEQqU1WNwkjSiQjm
         olNH8hDPutJiP2MDuKB+Ti6NF1eyZ4DK38nQXW+agzjJaAhc8cZML7+kSv2oRO/PIYAK
         LnfjFm+vhMu02NiBVZXc6qCw7leT3hsjaIpI8pca0rGSYCHNn3Wb0OWIAfTTY1untzVF
         uIAypQj7+5jjIXYGptlEBXPBDaBS9hWpffmyvGXJkpLkWIQIG65qVS6zIAg91rKhgwcs
         olPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141336; x=1789746136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UfA4gKLRjMNP2H10G64YdooBaWutPGm7Kf7SsyC2UwA=;
        b=tPQtTvbdaEDnRbgrD1Plk3AVJ+sED3siqUXHsagaQG528MYoQokKH5CDwMaawnPgI+
         qG92OUFVTVTD71n/ZQ1mT+ez07zbAGdWqolsbG6qRH/eTlakT+xhkSSzRTCEMNySBDMa
         E1x8eRPBhRL3dtMr8vlfwGQSvYH0JlLaDpVsFLSka93q4HBAbCQR5Yy7y/R/mgtWZZFY
         kT38V2s811s0US69HKgnGtQnn+rW4Ut28tt38jjbA/XKTTn8CZ5KcsnXiD/XOMsbnTea
         Gk92KdHM3bLwmi1Md2fZJSVVudWt126hCrP4Rt6Nev2LIVA+CkZbfoEuwwgnkD4oq9/S
         bLoQ==
X-Gm-Message-State: AFuF++mWrGEbmieJR51AyM5BRaxNbXWzWePkQN+/AXdgeTTqe1vBX5Nt
	6U5OUtFqEDVJSMk3lMQ+kaRoDBuQFjzr1QWu54KSTDFwtRT+3AjhtPLMDP59T9b3p66pAifHFjw
	GXpW6CSQ=
X-Gm-Gg: AYBFou3W+9awefZ+7E+zjaq9g7BgIGM3yjXxcG2Lpe0XYnahdBIb/K2w3gKi0lrtBjG
	9hSoPAW/NU9LxKxCtEcDztZJZN62ugnUKYu02e+rxau/wz8LDJMbbA5lTyw0H9Oo7wp+2lQOsPE
	tDNrws8aZCQw33EsBsDjGGC2xVOs2vE4ZwKjH80JhhB/0Pzoh+e+cAiiR+mozjlxqvMy+r8U5RP
	BXs7rXjwFabZXUdPwaQM9lhz3Zsk0+ZTxOuhOosPQ28qrGLwZ3RyrVOFV18qbZRxGyoCqJ65se4
	X5DEBIaEaDjNe1mRvjwPkXq79PnEJCLPABLDJLYgM/gnVgZsXVAI+m+ZtohxmXTQZysiRSYlduX
	kE6KWYLym/tsSqq5S4YRut6sRBWP9A249BRvoCA/JfMeZqvDW3+J05p13LSzuu5YRPNwwSc7oUg
	okQSvGEmKS7geWB2TSKweMBtoynAeMwlqgsZl2VpYk7VMpNrR4L2lZzrdFL7bp4ER1iTpGpROux
	+fOVg3omK9i1uBq7nTPMYlv9SOiwNckeRfwUi7fiX8=
X-Received: by 2002:a05:6820:f00b:b0:6bd:cd33:b885 with SMTP id 006d021491bc7-6c0bc4c8a27mr3367535eaf.42.1789141335900;
        Fri, 11 Sep 2026 08:42:15 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:42:15 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 15/15] io_uring: issue IOSQE_ASYNC requests inline when a handoff is possible
Date: Fri, 11 Sep 2026 09:41:05 -0600
Message-ID: <20260911154148.644489-16-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk>
References: <20260911154148.644489-1-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NOTE: undecided if this should be the behavior.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 include/linux/io_uring_types.h | 3 ---
 io_uring/io_uring.c            | 5 -----
 2 files changed, 8 deletions(-)

diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
index 37c56ad37e05..dadbe3655138 100644
--- a/include/linux/io_uring_types.h
+++ b/include/linux/io_uring_types.h
@@ -651,7 +651,6 @@ enum {
 	REQ_F_IMPORT_BUFFER_BIT,
 	REQ_F_SQE_COPIED_BIT,
 	REQ_F_IOPOLL_BIT,
-	REQ_F_ASYNC_USER_BIT,
 	REQ_F_HANDOFF_BIT,
 
 	/* not a real bit, just to check we're not overflowing the space */
@@ -748,8 +747,6 @@ enum {
 	REQ_F_SQE_COPIED	= IO_REQ_FLAG(REQ_F_SQE_COPIED_BIT),
 	/* request must be iopolled to completion (set in ->issue()) */
 	REQ_F_IOPOLL		= IO_REQ_FLAG(REQ_F_IOPOLL_BIT),
-	/* IOSQE_ASYNC was set on the SQE, not just by prep */
-	REQ_F_ASYNC_USER	= IO_REQ_FLAG(REQ_F_ASYNC_USER_BIT),
 	/* vetted at submit for an inline blocking issue with a handoff */
 	REQ_F_HANDOFF		= IO_REQ_FLAG(REQ_F_HANDOFF_BIT),
 };
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 7c2aa0cfacc8..04e2fbdcb3dd 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -1771,8 +1771,6 @@ static int io_init_req(struct io_ring_ctx *ctx, struct io_kiocb *req,
 	/* same numerical values with corresponding REQ_F_*, safe to copy */
 	sqe_flags = READ_ONCE(sqe->flags);
 	req->flags = (__force io_req_flags_t) sqe_flags;
-	if (sqe_flags & IOSQE_ASYNC)
-		req->flags |= REQ_F_ASYNC_USER;
 	req->cqe.user_data = READ_ONCE(sqe->user_data);
 	req->file = NULL;
 	req->tctx = current->io_uring;
@@ -1919,9 +1917,6 @@ static bool io_req_force_async(struct io_kiocb *req)
 		return true;
 	if (!(req->flags & REQ_F_FORCE_ASYNC))
 		return false;
-	/* userspace asked for it, keep the explicit offload */
-	if (req->flags & REQ_F_ASYNC_USER)
-		return true;
 	if (req->ctx->int_flags & IO_RING_F_DRAIN_ACTIVE)
 		return true;
 	/* the file decides on pollability, resolve it now if fixed */
-- 
2.55.0

