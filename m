Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.21.23.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792859783;
	b=KsX4KOt30qjBFn/fK8nacCKasHS3htxcrGGNPX9ohl3Ate0kU1bNAHhNDVAzgguDgA10
	 Ytb5LBsXsa4ZZqM4JV6E4ujCZnyU126jC628A/fIU03lPYyfNecmIGDZL9sAmUyNm4ouN
	 jcKeJ3YOHrTOMtb7mwrdb9shR+G4FkkMUyrnqf41s+3vRHDM2due7iSbrujjkW3GZ2dJp
	 XvUumfDxqA+8OZr4iaGzWEr411MeH9GP6fSua1XLY9zvG+9OBlAosTWZovwmfSM6XjtJ7
	 KcQZCGcmMGut0XuXzNt9fFJk/6XiJR40abYqvjHYhmIRUt2Om8Judi0K1dXwC7TFzvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792859783;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=b2Q8ao3KPPdNvkbksDxlZIk1KaNO6OVy3O7qheDRp6U=;
	b=gA7sc46J//kxIpruS7nwLgyjyfrNzNAAJrHldNdnLQLNI3hFim2bKbbNl6ZYXGRia7qI
	 VxIHbKxBvHNy8sH0S/uUYnMqRDYJeYWXG84ew7nL+IzarDxm1OaRJTOnUp6CsCpLCbBVy
	 q3/9AQoPihUQCLjCdPlyRx+ynA8rrb+ctAKtp/xGqyVCPiTWEV/qBFiSClOrXlC2hv9En
	 vc8kWXKBXrLqS2diOl+RbKJ+JLI7w3kKSVIsza2cvCHVt09bj06hqWFd+K6Ntk5lwDUed
	 /V2iZiyiAIdwM1mmxJeqPMRCao39xfnU3EjRK4HDLypt+pt1X2Kodp0OKYzc77DSY4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=disroot.org;
	spf=pass smtp.mailfrom=disroot.org;
	dkim=pass header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=meUxOuTB;
	arc=none smtp.remote-ip=178.21.23.139
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4807C606A31E
	for <io-uring@vger.kernel.org>; Sat, 24 Oct 2026 16:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4807C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=meUxOuTB
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id DD25D80C42;
	Sat, 24 Oct 2026 18:36:21 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RsBCTayhA_kP; Sat, 24 Oct 2026 18:36:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792859781; bh=OSgSd0Jf53TTyHG7uCWVko6SQzR62wnAzAE7LyKUeZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=meUxOuTBb9RJhwCDVLQBqoCgK2SIAogqM3ZCiRuXsWcScxHVw6wZ/qRTIFiV/HKfv
	 hSw8dGRDLb+iSQGsEs4DFD9WSEwTOwMIkfz88AcefMCSZjtRCwkxt4aYIncX0wXqmp
	 vLRghI4Ggv41iw6FmHR2e/JWZTh+T3Q7FSUqpzgY8TgLuouBH+CCUbTuZYtxmhahCF
	 WQA7Kbxgzzp+wLi6uR2yQ4Og7a7+E7rSutPHJIKWQRAbUR3lQye3Yj2bueOM96bF3A
	 DbQIBpYPTOwDwRsfORELutsJkkp7cRze7pYWM6hkEyijXZdHME/6q/nMQOTBK67hti
	 CBYj6g4StbqYw==
From: agxr <agxr@disroot.org>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org
Cc: agxr <agxr@disroot.org>,
	Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH liburing 2/2] test/futex, test/waitid: accept 0 for a single futex or waitid cancel
Date: Sat, 24 Oct 2026 21:33:58 +0500
Message-ID: <20261024163400.19976-3-agxr@disroot.org>
In-Reply-To: <20261024163400.19976-1-agxr@disroot.org>
References: <20261024163400.19976-1-agxr@disroot.org>
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

A cancel of one request completes with 0, as io_uring_prep_cancel(3)
documents. For a futex wait or a waitid, kernels so far complete it
with 1, and the tests expect that. "io_uring/cancel: complete single
futex or waitid cancel with 0" makes it 0. Accept both.

Signed-off-by: agxr <agxr@disroot.org>
---
 test/futex.c  | 3 ++-
 test/waitid.c | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/test/futex.c b/test/futex.c
index 265f3675..1aadfc0b 100644
--- a/test/futex.c
+++ b/test/futex.c
@@ -244,7 +244,8 @@ static int test_order(int vectored, int async)
 
 	reg.addr = 2;
 	ret = io_uring_register_sync_cancel(&ring, &reg);
-	if (ret != 1) {
+	/* older kernels return 1 */
+	if (ret != 0 && ret != 1) {
 		fprintf(stderr, "Failed to cancel pending futex wait: %d\n", ret);
 		return 1;
 	}
diff --git a/test/waitid.c b/test/waitid.c
index 371b5e5e..a3828e6c 100644
--- a/test/waitid.c
+++ b/test/waitid.c
@@ -250,7 +250,9 @@ static int test_cancel(struct io_uring *ring, int nr)
 			fprintf(stderr, "cqe res: %d\n", cqe->res);
 			return T_EXIT_FAIL;
 		}
-		if (cqe->user_data == 2 && cqe->res != nr) {
+		/* older kernels complete a single cancel with 1 */
+		if (cqe->user_data == 2 && cqe->res != nr &&
+		    !(nr == 1 && cqe->res == 0)) {
 			fprintf(stderr, "cqe res: %d\n", cqe->res);
 			return T_EXIT_FAIL;
 		}
-- 
2.56.0

