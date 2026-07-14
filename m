Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88163CF207
	for <io-uring@vger.kernel.org>; Tue, 14 Jul 2026 18:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784054138; cv=none; b=QweMIsbPxP9uiMOOczVEZA8sDGfjnegBZAM02k2BI2Vs3UQhVGqkWIZH2TB2/bSNnjT5zxIe2hGcSnPhCSY5jQM1ZYZV44vyxrRvLR77Jz1jAtIJWzP3iV6THZL9v8lw13ryn6FAmWTKA5S39/m+951wkvycDRTlsGMP/k3R01Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784054138; c=relaxed/simple;
	bh=e24qDC1bJ67u4PBXu0munNu4u2ZtDmxmjgtFYhQHg3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B3/P7nD4NQVutStBE3Ky6TU84AzUQrmdRumsQbnCo6UtCVhpAHD9a2yVstcNSSzndMuzVR8L8807RxG+GK4mwy627Y/PXAaKRPJkzFck0EZB23Yzi7OezYEY+KywhkqZU9Sv2cYNKoErLjWmUzAdHA0bgW4d7YUcPfh5yhfvVNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HEGso2LA; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEGso2LA"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-381b831d535so1495345a91.0
        for <io-uring@vger.kernel.org>; Tue, 14 Jul 2026 11:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784054136; x=1784658936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3LkuuRu+oIoUZSl+BKTPAESLNMZorz7yKFwgm7bZRxg=;
        b=HEGso2LAAJKZ5Ubg5gJTqMeJmPgD/yCnFpnhjNiW+HoaecN20oRgpYmyjaGW3uaz8W
         eA2NpamoX9LMzwFRZVyaFdULoyoTOEqqLcBhvoIr0mWUw5Qyog0tCsC9/zih+zdM648r
         1M6GpieeDEEwXvok3SuPEOk/zTAG0i0kCxRs2jnaqhmIpNEqHcRUZnxy+2jiKA7qW5Kx
         2SVfj9rYy4ZgshAZX5FmfrIQ4agdA8DRJhXVINnkLu3q5RkumMIcg6KMLDv5Mv1dSeo0
         rHbyVALAu7QAv/xTv7Q5z0BzgK1un6cdp54l913twIqom+mpjy2BcLw70ZBvCtlHTlD3
         SCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784054136; x=1784658936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LkuuRu+oIoUZSl+BKTPAESLNMZorz7yKFwgm7bZRxg=;
        b=WdPKRLlbzxWOJ44L3v6LmHf4mZ5y6Fr/7mcOFT7O7LQRk8czWFHrI+luX8NDil2T5G
         VBql7NKqUs7UIVCUVNHidT068meeRt29cUY47eKgc+s5pgFf9jQRWKl9pWrsHJS1JAbt
         lAFNZBTMR1tq4A1zgzeAbDCYM4T7eMe8L4atzB2A8jVKbnSkL4cLujMSirMHnL7znDGi
         kXic0FkHw+U/z66YWhxlFxPIzKVqs3tmkHo3qw77A96h8uC/m1nkz4DbTUCUNhgOwANL
         vJX7tI3ujKtn7beiVuey4wErtRJZ0KKhO14Ii2dDaptdPZ+ZM0pxwsnFFG+BbrkiwIs/
         Y3dg==
X-Gm-Message-State: AOJu0YzttofTKnMFeqfbSbe3H43InEsdhsa9jBHjh+/UG7fr3/hwsPjt
	bWV40aqWhcgJyFU1P6BxQTYdloZKsRO4srcUvPlqU4kQSTQvxxhxIpbPGDNcKIoXeVc=
X-Gm-Gg: AfdE7cmwkMUtcF1sASOD2q6qBliLW+cFl9iQNAiR899/cw7BQLaLQmwehIYy9zsj+hy
	0ZJV/si3NOJZRCiJ8u3EUBkgPm96vwPlQ23exfh43AaP6GoENmJKBcy6m/fCCCFwiYk4YhjAfsE
	WYsfpWidhCMSRBsizRkajS7qO9xBX5YS+gGq3FJIZ0cx5IxWYyqGAvC1WLSy6pp1P/fIxnfrd80
	JNbXEWjARqC6n0WhopJBdYyO5E2IOwmYdNEciWz/JSY3pikqdlmm7SqYVdokAjz8TPqx7PZZ7AL
	xYyeMYyU7f376P9GQUV6cLtRS0QLaAfe3CflZsOJOEdDOLppGrIlxvEfBeIntLyoks3RPnMw8n0
	ZcUeoPKmJP/Pwl5aXHU+UfreBKgCDPLv3B8//DrIMh6SrZU1YlqKEfo443LNZufABEuGM8P4slM
	KD+s/YdLGJFWsM2zN+McIWqam4TSJdhj7+GsUcFBdXI7ltBB5Rnbvn2XQlWTIdM4eMBwZcMzSZY
	7offmTD20vuBY6B7dzNuZK+gT0E6onFJCfd7uUFA0SU9EYyPbiuYBic/LagttQbnIiCEQVob+Aa
X-Received: by 2002:a17:90b:390f:b0:381:939e:adf0 with SMTP id 98e67ed59e1d1-38dc7752a8dmr12640411a91.31.1784054136283;
        Tue, 14 Jul 2026 11:35:36 -0700 (PDT)
Received: from prateek-Aspire-A515-57G.. ([182.77.77.253])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119c2a7bb5sm56450280eec.25.2026.07.14.11.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:35:35 -0700 (PDT)
From: Prateek <kprateek283@gmail.com>
To: io-uring@vger.kernel.org
Cc: axboe@kernel.dk,
	krisman@suse.de,
	Prateek <kprateek283@gmail.com>
Subject: [PATCH v3 1/2] src/queue: don't swallow -ETIME when SQEs were submitted
Date: Wed, 15 Jul 2026 00:05:28 +0530
Message-ID: <20260714183529.321703-1-kprateek283@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If _io_uring_get_cqe() submits SQEs and then times out waiting for
completions, it returns the submit count instead of -ETIME:

  1. The first enter submits the SQEs; because submit > 0 the kernel
     returns the submit count, not -ETIME, and it is stored in err.
  2. On the next iteration the has_ts shortcut wants to report -ETIME,
     but the 'if (!err)' guard sees the non-zero submit count and keeps
     it, so -ETIME is dropped.

That contradicts io_uring_submit_and_wait_timeout(3) and
io_uring_wait_cqes(3), which document -ETIME on timeout.

At these two sites (lines 113 and 118) err is only ever 0 or a positive
submit count. A negative error from __io_uring_peek_cqe() or a prior
enter breaks out of the loop before reaching here. So the change is
functionally equivalent to dropping the err condition entirely; we change
'!err' to 'err >= 0' so -ETIME is successfully synthesized whenever no
CQE was seen.

The guards were added in 2f61e849 ("src/queue: don't wait twice if
looping in _io_uring_get_cqe()") to carry the submit count across
iterations for the partial-completion case (got some CQEs, no error);
that case still returns the count because both sites remain guarded by
!cqe.

Signed-off-by: Prateek <kprateek283@gmail.com>
Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 src/queue.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/queue.c b/src/queue.c
index fcd3c702..e2e5a061 100644
--- a/src/queue.c
+++ b/src/queue.c
@@ -110,12 +110,12 @@ static int _io_uring_get_cqe(struct io_uring *ring,
 			 * timeout, so treat any timeout the same as -ETIME here.
 			 */
 			if (data->get_flags & IORING_ENTER_EXT_ARG_REG) {
-				if (!cqe && !err)
+				if (!cqe && err >= 0)
 					err = -ETIME;
 			} else {
 				struct io_uring_getevents_arg *arg = data->arg;
 
-				if (!cqe && arg->ts && !err)
+				if (!cqe && arg->ts && err >= 0)
 					err = -ETIME;
 			}
 			break;
-- 
2.43.0

