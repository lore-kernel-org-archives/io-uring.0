Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.21.23.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792859781;
	b=Bj22hvTIFfbDjp88hJ9fgRID3FawuAxeT/R8wgtYrpU1d/ZkDBNOWXA2Ad/J3bJm14FE
	 U8cTrlgXsiO+FnqyLUx5s3dJ2lgfBVVNmRqLTlnLWT7fZ1lD3cpI1qL6gSqa1xUy/4NHW
	 tOSsEqiKN/kVAj4165zSgDyGOD/MlmmpPbGyMgO/du7HYFqWGR7H+8+y0xxN0kV9r3kzO
	 UI6HCv2Dd7+D8C8e2GpUBaps2j5U+O1C+JrUoADttHjwXaYdJrD3+ufGCx0RhEf+ZYNST
	 WANOM4dhohh52jvGFEURa4n6J4CyMdCGPCaU2PEoQwHvhgOVmudoSf4Hl5pM9a3OYdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792859781;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pnVMXJ+zfe86nhHuKFZnpT3uXldhZfJYMoK1sIbQzxc=;
	b=bPkzWGkOq9rOl9mktgm4y2yKqLXPcq3EriXPPBusTfZRgAm1fMSeea2aBzc66pnJH2gw
	 vVx+NsTbfvseXKmR0tT4JoS75aLNbadDrjgrur77/MCdaXVUeDGG8gIAbCOnM2/H1Ah7N
	 El+zzbtpvZwc8RRemtHh/Ud7YjR+Ii9aZvelMOipFEAXVWDNrQB3GYYJGILJrbZY6QSAY
	 M5bqZhWL0W2vRLb1BvtmQhwA+Mknws9SHP3ki4som+SfKAtGYVdVQDNMy8mgCJdNiI07I
	 +sSyHtLTc1sWvSrHMRWyAqN5ZB5gAnSkpj1t0lP5b4M/FhMCdcMm1YCt9LMWtzpMBbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=disroot.org;
	spf=pass smtp.mailfrom=disroot.org;
	dkim=pass header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=aaPZ9K7a;
	arc=none smtp.remote-ip=178.21.23.139
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CE6606A31E
	for <io-uring@vger.kernel.org>; Sat, 24 Oct 2026 16:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02CE6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=aaPZ9K7a
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C849D8836B;
	Sat, 24 Oct 2026 18:36:19 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ywdzi0B62-Uk; Sat, 24 Oct 2026 18:36:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792859778; bh=ZbUo2/XXDqli4gaei/cVdidb1V/mfb0i27O2K4M+b80=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aaPZ9K7ajaVqZQckZlMXyAfM9hyqVCxEgGQmH0fl1+vRBH3sDpcu1shB38wGYrPg+
	 rmladFFmwdKNWiSMAscZ9E56BPk5VTJMWi/mnEFzcnrEavbw2xiajotFuLMWKCj90Z
	 A5tDSUxC7A1bdxqRbNDZYsRhOszxG9k9OCPMj9qDPYnNkpCvNW07JAuNKXZtWk8uGP
	 oJMymaatI6/UT1nutiPJDhIrwTdmphZ9buLUd9ugynzRFtqUOPHzNpT22/Pdw0KlBj
	 WibItOe7r0Nkxw6WEP+LwI7dHwS+l0IFv3SaGKxIuHedXVq68CRIUt0xnq7tyHNXdx
	 up+htjFrr44Xw==
From: agxr <agxr@disroot.org>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org
Cc: agxr <agxr@disroot.org>,
	Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH liburing 1/2] test/futex, test/waitid: check the count of a CANCEL_ALL
Date: Sat, 24 Oct 2026 21:33:57 +0500
Message-ID: <20261024163400.19976-2-agxr@disroot.org>
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

Cancel three futex waits, and three waitids, that share a user_data with
one IORING_ASYNC_CANCEL_ALL. The cancel completes with 3, the number of
requests it canceled.

Kernels that lack "io_uring/cancel: count all canceled futex and waitid
requests on CANCEL_ALL" complete the cancel with 1.

Signed-off-by: agxr <agxr@disroot.org>
---
 test/futex.c  | 44 ++++++++++++++++++++++++++++++++++++++++++++
 test/waitid.c | 26 +++++++++++++++++---------
 2 files changed, 61 insertions(+), 9 deletions(-)

diff --git a/test/futex.c b/test/futex.c
index 4dc5a305..265f3675 100644
--- a/test/futex.c
+++ b/test/futex.c
@@ -474,6 +474,44 @@ static int test_invalid(void)
 	return 0;
 }
 
+static int test_cancel_all(void)
+{
+	struct io_uring_sqe *sqe;
+	struct io_uring_cqe *cqe;
+	struct io_uring ring;
+	unsigned int futex = 0;
+	int ret, i;
+
+	ret = io_uring_queue_init(8, &ring, 0);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < 3; i++) {
+		sqe = io_uring_get_sqe(&ring);
+		io_uring_prep_futex_wait(sqe, &futex, 0, FUTEX_BITSET_MATCH_ANY,
+					 FUTEX2_SIZE_U32, 0);
+		sqe->user_data = 1;
+	}
+	sqe = io_uring_get_sqe(&ring);
+	io_uring_prep_cancel64(sqe, 1, IORING_ASYNC_CANCEL_ALL);
+	sqe->user_data = 2;
+	io_uring_submit(&ring);
+
+	for (i = 0; i < 4; i++) {
+		ret = io_uring_wait_cqe(&ring, &cqe);
+		if (ret)
+			return ret;
+		if (cqe->user_data == 2 && cqe->res != 3) {
+			fprintf(stderr, "cancel all res %d\n", cqe->res);
+			return 1;
+		}
+		io_uring_cqe_seen(&ring, cqe);
+	}
+
+	io_uring_queue_exit(&ring);
+	return 0;
+}
+
 int main(int argc, char *argv[])
 {
 	int ret;
@@ -579,5 +617,11 @@ int main(int argc, char *argv[])
 		return T_EXIT_FAIL;
 	}
 
+	ret = test_cancel_all();
+	if (ret) {
+		fprintf(stderr, "cancel_all failed\n");
+		return T_EXIT_FAIL;
+	}
+
 	return T_EXIT_PASS;
 }
diff --git a/test/waitid.c b/test/waitid.c
index a8c3488f..371b5e5e 100644
--- a/test/waitid.c
+++ b/test/waitid.c
@@ -211,9 +211,9 @@ static int test_ready(struct io_uring *ring)
 }
 
 /*
- * Test cancelation of pending waitid
+ * Test cancelation of nr pending waitids
  */
-static int test_cancel(struct io_uring *ring)
+static int test_cancel(struct io_uring *ring, int nr)
 {
 	struct io_uring_sqe *sqe;
 	struct io_uring_cqe *cqe;
@@ -226,19 +226,21 @@ static int test_cancel(struct io_uring *ring)
 		exit(0);
 	}
 
-	sqe = io_uring_get_sqe(ring);
-	io_uring_prep_waitid(sqe, P_PID, pid, NULL, WEXITED, 0);
-	sqe->user_data = 1;
+	for (i = 0; i < nr; i++) {
+		sqe = io_uring_get_sqe(ring);
+		io_uring_prep_waitid(sqe, P_PID, pid, NULL, WEXITED, 0);
+		sqe->user_data = 1;
+	}
 
 	io_uring_submit(ring);
 
 	sqe = io_uring_get_sqe(ring);
-	io_uring_prep_cancel64(sqe, 1, 0);
+	io_uring_prep_cancel64(sqe, 1, nr > 1 ? IORING_ASYNC_CANCEL_ALL : 0);
 	sqe->user_data = 2;
 
 	io_uring_submit(ring);
 
-	for (i = 0; i < 2; i++) {
+	for (i = 0; i < nr + 1; i++) {
 		ret = io_uring_wait_cqe(ring, &cqe);
 		if (ret) {
 			fprintf(stderr, "cqe wait: %d\n", ret);
@@ -248,7 +250,7 @@ static int test_cancel(struct io_uring *ring)
 			fprintf(stderr, "cqe res: %d\n", cqe->res);
 			return T_EXIT_FAIL;
 		}
-		if (cqe->user_data == 2 && cqe->res != 1) {
+		if (cqe->user_data == 2 && cqe->res != nr) {
 			fprintf(stderr, "cqe res: %d\n", cqe->res);
 			return T_EXIT_FAIL;
 		}
@@ -510,12 +512,18 @@ int main(int argc, char *argv[])
 		return T_EXIT_FAIL;
 	}
 
-	ret = test_cancel(&ring);
+	ret = test_cancel(&ring, 1);
 	if (ret == T_EXIT_FAIL) {
 		fprintf(stderr, "test_cancel failed\n");
 		return T_EXIT_FAIL;
 	}
 
+	ret = test_cancel(&ring, 3);
+	if (ret == T_EXIT_FAIL) {
+		fprintf(stderr, "test_cancel all failed\n");
+		return T_EXIT_FAIL;
+	}
+
 	ret = test_invalid_infop(&ring);
 	if (ret == T_EXIT_FAIL) {
 		fprintf(stderr, "test_invalid_infop failed\n");
-- 
2.56.0

