Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC9F2D9ED1
	for <io-uring@vger.kernel.org>; Fri, 24 Jul 2026 22:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784933962; cv=none; b=rDUxVEpEigelOyJiMTPQmD8h00UHF/YTT+5taY6SveYrnUCTCCbErB04bb+uQAMZT75xD+nMd/o8VyCi2ovmC0uxzXeoAIelxQwOqs6N/WDUzn1YhA/KRP2wBzIgDIxZ+bu3k2V+kTkt6YpgFC7eyfSFo8qS/qbzhKnSyYDmquQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784933962; c=relaxed/simple;
	bh=GwqxZAsoiy1SIGnoIviuBEkbGTHa+8FNeuC/Z2LU2Ks=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gg9L1Yo7rhzsAdsI2bniJ1TB+CwB5ptxix+M6MjFC0NUjd9I8MSWT05BznG5EdvBdIGOEq51iueqkp+xQde7DIDwzYIkoqly7dErWTPYY/rYnnH3Bg6d0/Lx7oa8Agk7kKc/aqERmMisS+9vE239YlLfkpWoKrzeMzWKDiJUsHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com; spf=pass smtp.mailfrom=openresty.com; dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b=CYqk86YP; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b="CYqk86YP"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9e30214d8fso798162a12.3
        for <io-uring@vger.kernel.org>; Fri, 24 Jul 2026 15:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1784933956; x=1785538756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AwC5a1XZY8w1tFphHR0XELUArL3mP60muC4otPFcI0U=;
        b=CYqk86YP1aWANAXWaclIfELexuZyW6oT85au6nWgtLUgzSWOWR3rZtXfaOU7cetipK
         mVrPRv08b+eR0ZcEQ7R7bDYgPLAZmhQiXlZFW6THeU8LcBeuow+2+NmLeajtYX9wr9T/
         WXl0D7OpKhNs8Uktsm1hvVw6i9KzgF4nt8pP3NkkR4lST0bqJJkzSoGHnKIHbL71PaXH
         GHrJqEqUnZVkGOk6wG6KPphAO4FRLSa+EbXwOG+FAIWb0N1/Uol7jjgMUhsdBfPsO+rT
         LdE0uHDRRjuJI0u397SG2ZrNtLoqp6tIZhUFYtCV5o4Svg67k4aCr5/s+GTgYOMX68Yc
         no/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784933956; x=1785538756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AwC5a1XZY8w1tFphHR0XELUArL3mP60muC4otPFcI0U=;
        b=H/t0zoL+rXOz/G7mmwwMjTjABPAvC/hMQ+qIH4cY7trEDAsoff7K769hIN0Cxdo1Tu
         qgztCaFWig7iVLRu6uL2FOZMxede6YpR6nJl2WFPJlfvUGmO3Ux9DiyNAGOwxdx9zupm
         li2b/OS8Too5aDHdfbOLw6bCZNh/5jmIfYyyfrUeh9RyD8gKDd+Wc4JbYtcjcXoQ9uBX
         iY5KAveE8mCMyaajLHMsDZjFOgcI+Q9lCv991O3aL+4slEttPtXcdEr1wcj0yuGLTbR0
         MVFBRZQrBNyR2bBb+BAt+5QTTYdURHnLBpIxWYDttkXjyuK8IjZhgjlytluysGOJeII/
         NiWw==
X-Forwarded-Encrypted: i=1; AHgh+Rq5sSC+tghebo6oqLn7PkO6O3l0RWn2raO7vHGF14DDaxBVqVm+GYB6WbO6PmwxXOgmV6j+t7dnrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLNBvWvYTRJBeby5uhiJ1CFvL+HwNhoO7s6Ej9Shb641/kK3S6
	Lz5aNyceioXKQOxuWvhPWidXfZh4qM231vvvRVAXzECoCYZX50BmOdj4qjVRupyvmsYi65sze5Q
	i3lbqtJD5eg==
X-Gm-Gg: AR+sD10CumXxww4pIW9NT51zjL8oHqj5Tbk9sg445GFCWnYCCUNX4iPrMEM4ZerdZlr
	QqNAyZBpie6tkoSzEE3rhJeiJWU0o4lvxbaPsxw0NRAibyOdPBZ2M5H3jwOwhmBRUyUmm7+v4UM
	dVjfZJFtw6NIthURbszkI48PkAH71qf3UL3558+XA09bhp/uUM2Dj59IgSq9YXJMMbNCQfsbGe3
	FjqArmGqWnDEwYSiPt7mf167/n8bkgpDZkd6sEMGImN9OXM77IwHKpryF3uuhiUx3OyK2Qypese
	qALkyZHnatZSRFqhl/TNYdVmsNvX+YfbhsGO37CsqiZZtpi/m1YErr7l/auy4t1pDkHVVXH5k12
	oShzq5h3JV4QCg4w/jazZ7HJ8lCEM1jHpfdD7e8IyswBg1jJ6JOiHJ68xGcoGhSr2EoCo/kGrJf
	tKk/EmjS+DeuDAqg==
X-Received: by 2002:a05:6a20:748a:b0:398:7ed3:a001 with SMTP id adf61e73a8af0-3c67d9b1d8amr282597637.2.1784933956196;
        Fri, 24 Jul 2026 15:59:16 -0700 (PDT)
Received: from integral2.. ([2402:8780:1329:2779:beb7:3f70:1f02:3159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc584433sm2910930eec.23.2026.07.24.15.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 15:59:15 -0700 (PDT)
From: Ammar Faizi <ammarfaizi2@openresty.com>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring Mailing List <io-uring@vger.kernel.org>
Cc: Ammar Faizi <ammarfaizi2@openresty.com>,
	Yichun Zhang <yichun@openresty.com>,
	Christian Mazakas <christian.mazakas@gmail.com>
Subject: [PATCH liburing 1/4] test: Remove unused global variables found by clang-23
Date: Sat, 25 Jul 2026 05:59:02 +0700
Message-Id: <20260724225905.747718-2-ammarfaizi2@openresty.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724225905.747718-1-ammarfaizi2@openresty.com>
References: <20260724225905.747718-1-ammarfaizi2@openresty.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for upgrading to Clang 23, fix the following warnings:

  iopoll.c:26:12: error: variable 'no_hybrid' set but not used [-Werror,-Wunused-but-set-global]
  recvmsg-inc-tail.c:66:25: error: variable 'no_recv_mshot' set but not used [-Werror,-Wunused-but-set-global]
  reg-wait.c:26:13: error: variable 'has_kernel_regions' set but not used [-Werror,-Wunused-but-set-global]

`no_hybrid` has been unused since commit c5eead2659ef ("test/iopoll:
fix over-eager no_hybrid check"); `no_recv_mshot` was never used since
it was introduced. `has_kernel_regions` has been unused since commit
30ce99006af9 ("test/reg-wait: basic test + probing of kernel regions").

Fixes: c5eead2659ef ("test/iopoll: fix over-eager no_hybrid check")
Fixes: 3891a21ffec6 ("Add test case for minimum length left for incremental buffers")
Fixes: 30ce99006af9 ("test/reg-wait: basic test + probing of kernel regions")
Cc: Christian Mazakas <christian.mazakas@gmail.com>
Signed-off-by: Ammar Faizi <ammarfaizi2@openresty.com>
---
 test/iopoll.c           | 5 +----
 test/recvmsg-inc-tail.c | 3 +--
 test/reg-wait.c         | 8 ++------
 3 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/test/iopoll.c b/test/iopoll.c
index 98230657a2fa..d68fde10e3f2 100644
--- a/test/iopoll.c
+++ b/test/iopoll.c
@@ -23,7 +23,6 @@
 static struct iovec *vecs;
 static int no_buf_select;
 static int no_iopoll;
-static int no_hybrid;
 
 static int provide_buffers(struct io_uring *ring)
 {
@@ -372,10 +371,8 @@ static int test_io(const char *file, int write, int sqthread, int fixed,
 		return 0;
 	}
 	if (ret != T_SETUP_OK) {
-		if (ring_flags & IORING_SETUP_HYBRID_IOPOLL) {
-			no_hybrid = 1;
+		if (ring_flags & IORING_SETUP_HYBRID_IOPOLL)
 			return 0;
-		}
 		fprintf(stderr, "ring create failed: %d\n", ret);
 		return 1;
 	}
diff --git a/test/recvmsg-inc-tail.c b/test/recvmsg-inc-tail.c
index 29b6c2b4a96f..6be1bbf7a73e 100644
--- a/test/recvmsg-inc-tail.c
+++ b/test/recvmsg-inc-tail.c
@@ -63,7 +63,7 @@
 
 static const int expected_bids[NR_SENDS] = { 0, 0, 1, 1, 1, 2, 2, 2, 3 };
 
-static int no_buf_ring, no_recv_mshot;
+static int no_buf_ring;
 
 static int setup_buf_ring(struct io_uring *ring, void **buf_mem,
 			  struct io_uring_buf_ring **out_br)
@@ -195,7 +195,6 @@ static int test(void)
 		}
 
 		if (cqe->res == -EINVAL || cqe->res == -ENOTSUP) {
-			no_recv_mshot = 1;
 			io_uring_cqe_seen(&ring, cqe);
 			ret_val = T_EXIT_SKIP;
 			goto out_close;
diff --git a/test/reg-wait.c b/test/reg-wait.c
index af517a1f2936..ea4c3405de53 100644
--- a/test/reg-wait.c
+++ b/test/reg-wait.c
@@ -23,8 +23,6 @@ static const struct io_uring_reg_wait brief_wait = {
 	.ts.tv_nsec = 1000,
 };
 
-static bool has_kernel_regions;
-
 static int test_wait_reg_offset(struct io_uring *ring,
 				 unsigned wait_nr, unsigned long offset)
 {
@@ -382,16 +380,14 @@ static int test_regions(void)
 	rd.flags = 0;
 	rd.user_addr = 0;
 	ret = test_try_register_region(&mr, true);
-	if (ret == -EINVAL) {
-		has_kernel_regions = false;
+	if (ret == -EINVAL)
 		goto out;
-	}
+
 	if (ret) {
 		fprintf(stderr, "test_try_register_region() failed kernel alloc %i\n", ret);
 		return T_EXIT_FAIL;
 	}
 
-	has_kernel_regions = true;
 	rd.flags = 0;
 	rd.user_addr = uring_ptr_to_u64(buffer);
 	ret = test_try_register_region(&mr, true);
-- 
Ammar Faizi

