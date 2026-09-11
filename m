Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E3949CF55
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141700; cv=none; b=K9XfW3cw+l+BflqHQnxnraPV9hl3W76JLWjkH6UccMbX5Mb0rtgKR9VP5Ry40ua+DorZPYRKErmNUNcjCtR9PgpiHoSSinSHHFxH593U6DT60v/pHEMnz4/aSCGyyKuv5wwWZqBVIrdZgLtIAyL07INGCbZxnKOiUfk/W6W3mEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141700; c=relaxed/simple;
	bh=XdS2vz++61dhB8gNSiHdcOUBiync4kfeCEgyK73ydkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nEYE23bT4UcCDKkD2i0JpYL7YBhuPxRCnmCrDE/o6c95np7rbYjRtHQCkg79UcAT25a1ob461XTFuCoN3veklxjAbOXgI+1aGgNczKDVHe1FgjYQnAO/Uvonlbopy8GPHMhrpDsemiJUOmk3LziLPolBZWKdo1RVSKZvVeKAuvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=U7Q9fmf4; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="U7Q9fmf4"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-801b48c329eso567349a34.3
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141697; x=1789746497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e+l/T+/xCXvTiwht7pcUKQEXNgCo/1ejOl1Mvl12ebM=;
        b=U7Q9fmf4vF++7waUkGx12xOX/+q0atU010XcA8UHMJvSxuoCHIK1V1Ka+ADd6U+L8i
         AjLkTF09Mx+v8xbhNYKJXHtkvQY3SqD4eK8Dz5e/1+DqecYektLufZ2v35t5h6E1ETBu
         hD2EfUpjvDtwS8Za8i6xva9GDQr3FrGBBout4NR8Hr0yrF47xhZV/1n+zqTvypbEclc6
         CtsSAAcDT+HjkkPRXAd6u0Jgu8whlwYjbmG8PcZRoIRfrA9NVaf0DE3fG3fctVtFr7KN
         6ORsnKRCt6G+9ns9xZcOsST/bYgatDC3d9sIjW8HiMRbQ5KTWNb7+95sGBBLyHL3qCxZ
         5zow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141697; x=1789746497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e+l/T+/xCXvTiwht7pcUKQEXNgCo/1ejOl1Mvl12ebM=;
        b=BDkeaCInscIGl8W2QgpKfOKAQphok9VTAfnCpRHmbvRsLpC3OkJhi4LGd7yg1/wDmJ
         QPv8ZylEodHPEhJ5do0SVTwfwr6JGONC/NBDlu8w6we/4LhfNben/PZ+kFdrZnb6a3qh
         JqpvdB8ElPxp7RVPgZhv7vemw+Fukml+etM9Ec5lf/VNILxjZjEoUzWNalPTqsuZadnQ
         2BFdWYkT13G/SbGgbufptzBvNl44SbehqKZLwsBmTRx5JpQFsIzRD8fs4vX+PC2G/6IJ
         vBoXDEE3YRc15U6Yz4OfLA5rqheJLpiDAb1LEX9NnLf+Mp4GNfVn0kc10CsePJ7Oo+Ps
         xqFA==
X-Gm-Message-State: AFuF++kWKlqzVyhLtSLSFetu44ACMyrCtWTeV328jsUnNHQjXcdnv6SF
	nZH+debW9WmU1y65I5MuBYLvxkV2IUlBHtd20DvcTvR7eCmT7ZQ6jU/m1FlwJH4E8+sZiLbJ9OW
	ezvUXxO0=
X-Gm-Gg: AYBFou12u7ITIZaNi4fDrgjpmJu8ko/3/gWgpU0Eah06n4lW8rlq0XQtyuRp0N6v5qM
	vPeHcKfl/euvSRFch7isUZ5lFXVWdrKtxUnFhOovxaU6l72eCadNBmKbPK1l9cSZtnQVitBL117
	GfXrj5Sfq+lPxjfLmPB98sre2eQc8xN83VPoxqcRCkatqXw6InZPDI91ZAeFhuGMNPKOjhg07Zy
	2ATGs8JefN5CXOtKtywq53BXq0n69nkyzOgCZhgNnkQL9uHFW3FR84evUNgGiDSHazhCxnZqak7
	lueyHsb9FnYiEFECJPNYPlUw9ViWlKo9uMWaathVl0jYrcommiJMOg2VjoYWMXNPal9gm1J0ZjV
	NvbgeHUbYJmtlTQ7tBmHss4XGtIe6bAlX4mOI/WUy27u6OLkHjYJoyvOHPuGoomC6NQ0gHfg6Cq
	N9EPBFypVqS0PgPT3WNvq4PeMS0rfMdltHRmX6Pf5XHr1+raId+NGJH8Sgzv4VQ3Ubu33JMA+Q5
	tq/+obExhKqSMEGmngW9k0y019d9f+J9blgqSM37C4=
X-Received: by 2002:a05:6830:83a5:b0:7d7:ea9f:c0f9 with SMTP id 46e09a7af769-803fc419502mr3786286a34.0.1789141697378;
        Fri, 11 Sep 2026 08:48:17 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f6d1ca4bsm2629478a34.23.2026.09.11.08.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:48:16 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: juanlu@fastmail.com,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 03/10] io_uring/rw: don't reap io-wq IOPOLL completions while io-wq has a reference
Date: Fri, 11 Sep 2026 09:45:27 -0600
Message-ID: <20260911154811.646705-4-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911154811.646705-1-axboe@kernel.dk>
References: <20260911154811.646705-1-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IOPOLL requests issued from io-wq are reaped by io_do_iopoll() on the
submitter, with the same window as the task_work completions: the CQE
is posted while the worker may still hold its reference, and the file
is only dropped once it does.

Leave such a request on the iopoll list until the worker has dropped
its reference, the next pass then reaps it and the put from
io_free_batch_list() is the last one. Also move the reference handling
for the task_work case into a helper.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/io_uring.c | 17 ++---------------
 io_uring/refs.h     | 27 +++++++++++++++++++++++++++
 io_uring/rw.c       |  4 ++++
 3 files changed, 33 insertions(+), 15 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 4787746a2d9d..69f1b3f4c4a1 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -1286,21 +1286,8 @@ void io_req_task_complete(struct io_tw_req tw_req, io_tw_token_t tw)
 {
 	struct io_kiocb *req = tw_req.req;
 
-	/*
-	 * io-wq may still hold a reference if the issue completed async.
-	 * Defer completion to the last put, so that file drop and CQE
-	 * visibility are ordered. The last reference stays for the free
-	 * path to put, a linked timeout may still look at the request.
-	 */
-	if ((req->flags & REQ_F_REFCOUNT) && !(req->flags & REQ_F_REISSUE) &&
-	    atomic_read(&req->refs) != 1) {
-		if (!req_ref_put_and_test(req))
-			return;
-		/* the other put raced us, ours was the last after all */
-		atomic_set(&req->refs, 1);
-	}
-
-	io_req_complete_defer(req);
+	if (io_req_complete_ready(req))
+		io_req_complete_defer(req);
 }
 
 /*
diff --git a/io_uring/refs.h b/io_uring/refs.h
index 0fe16b67c308..021bf0cd66af 100644
--- a/io_uring/refs.h
+++ b/io_uring/refs.h
@@ -56,6 +56,33 @@ static inline void __io_req_set_refcount(struct io_kiocb *req, int nr)
 	}
 }
 
+/*
+ * io-wq may still hold a reference if the issue completed async. If so, the
+ * last put completes the request, so that file drop and CQE visibility are
+ * ordered. The last reference stays for the free path to put, a linked
+ * timeout may still look at the request until then.
+ */
+static inline bool io_req_complete_ready(struct io_kiocb *req)
+{
+	if (!(req->flags & REQ_F_REFCOUNT) || (req->flags & REQ_F_REISSUE))
+		return true;
+	if (atomic_read(&req->refs) == 1)
+		return true;
+	if (!req_ref_put_and_test(req))
+		return false;
+	/* the other put raced us, ours was the last after all */
+	atomic_set(&req->refs, 1);
+	return true;
+}
+
+/* io-wq still holds a reference, the request can't be completed yet */
+static inline bool io_req_shared(struct io_kiocb *req)
+{
+	if (!(req->flags & REQ_F_REFCOUNT) || (req->flags & REQ_F_REISSUE))
+		return false;
+	return atomic_read(&req->refs) > 1;
+}
+
 static inline void io_req_set_refcount(struct io_kiocb *req)
 {
 	__io_req_set_refcount(req, 1);
diff --git a/io_uring/rw.c b/io_uring/rw.c
index 95106dd1d7eb..19b7c64e5952 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -16,6 +16,7 @@
 
 #include "filetable.h"
 #include "io_uring.h"
+#include "refs.h"
 #include "opdef.h"
 #include "kbuf.h"
 #include "alloc_cache.h"
@@ -1370,6 +1371,9 @@ int io_do_iopoll(struct io_ring_ctx *ctx, bool force_nonspin)
 		/* order with io_complete_rw_iopoll(), e.g. ->result updates */
 		if (!smp_load_acquire(&req->iopoll_completed))
 			continue;
+		/* io-wq still has a reference, reap it on the next pass */
+		if (io_req_shared(req))
+			continue;
 		list_del(&req->iopoll_node);
 		wq_list_add_tail(&req->comp_list, &ctx->submit_state.compl_reqs);
 		nr_events++;
-- 
2.55.0

