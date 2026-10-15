Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171DB48F001
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092720; cv=none; b=FG/Dz3miKwWdJ+2PGwaHsszhg0cKydUTRcvgv3FOjw37jVDanu4iTPFNzL2Dgy25KOFoAjaa9+HDW2+pbdHLwgvvNlnMpXknp+aX7gyYXcwsw8Rxy4JisnE30A5L0mPfeLIep+oeubH9BbkdKc7wJw3imJdAys+4G/9LBZdNMoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092720; c=relaxed/simple;
	bh=vnBRpOVrqT/n5rXyXXZHIWQ31BZzmdXyRlqCl0tlTg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jt3lqBCvgtbu8ea+ghY156hJdGi/HuJWf8wvLKwdOeTDB2uC9dW4Wz1lSZLbTSZjXq7D+O9Zb9bbkddilA3dqFdEvhnsyVbn5Re7bCqXwAyRx1jnbJo7f24SjmMQqssOwBvjII7ium7yaDDOA7o2Wz3JuqkD8EtXVZ1G43aYkq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=bYWnpxO8; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="bYWnpxO8"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5350c1b9e0dso21440071cf.0
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092718; x=1792697518; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f6XBdjPmuJZpYvrZ6TEGVBoOfjY2UPtqxeN0SL+X3hs=;
        b=bYWnpxO8Xwi2DeuuMX2DLFTOAuEOnN3PTYK/StFPakLoRajdCv9nPOpTICDCewAlUE
         1XR+QW3sZTaijJMtjAG6Q9WUhMO+K1L1IPibXRwdSnoGfGRKfgEvl/+XgJc376EnJ/mo
         gst+4OYHfLGQLmEq1WTblYKLzfdEScugEhT8dg1nlpwULYQwiZUP0j3iACWtRzvGrbgW
         lbMsMUOVS0TEtZbLqmnpDg+i2dwRJKWVvEJAliiJgMEj1xDBDk/qw3rNGsFW1ZFFwejz
         r0VBbaKcOUKNh8t1y09J5O0CGhzR0nqI8YM58CSDynewJkw/OetNaIiFyC79PAc0k3NU
         ZJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092718; x=1792697518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f6XBdjPmuJZpYvrZ6TEGVBoOfjY2UPtqxeN0SL+X3hs=;
        b=AmVHH99tI81FLrs1lC8cWuOWCISNCZ2Us9gpbbrOvmtCnDDMkoPnWkPxYRvfHP1FSL
         RTQLw4SowBMduBmKySmdabdajBHD3jWGIsXcqiOrtW7gpdwVrMb866nk4MwuM+rreqeH
         nmF3lZ8VptpjzbsaEOdqnbaDGlDpgg4cyEXzKSe/AmQRzNLukYjyhJ+CXG+BO5x+5fR1
         gTM2pwS4zms+ylNhbmX4Xlc+E0pH5rshHsplRL8hwYeyfhavarKL9trFpqwEEtUvKqZV
         SEju+02IfiPeZ1OKOG7+aAxIrJkNJ6r/fZ/0eIGmHWzkhystyQmEupIeNI5P+TdfJGHb
         IXvA==
X-Gm-Message-State: AFq9FYJ4v3jVx5o7jkB7tKdyPcYADHrdPZkWRSlytcUPhy1fSPT6K6vX
	TJhxNuBjsX2rGXC1qQetRtnQfQGcNFjOoFTXwTjskx1TkAWn5iYVYhzHeipiVDxf8n5Y5Mjxnoj
	goOGx
X-Gm-Gg: AYBFou0wIiDS2Sdb714UUa9gqXfq30aTVBLb2sxBK1EGz/3p4uQGaUpWlChVKHaz+dC
	LDIjbyWYE8zw0fMDaxMGLzKOnDLjypIzAGqIYBITW7KpnkiWzI5UG2QizcXLAy1UZXaI9zTQd4m
	L2LMvXJnbOSWp6UVS7NAPVCfzMSOsfJUMMH0HW9IKOL/JFqIZVrkPqHLPdicykkdNDA79l6H9wj
	mSbZMsPr2u3AhPvxONXslb9lxLex/gnuiyY7yaG3fCM9wco1NJpZnxJsgde7ojryIGnA5U0BIgl
	zH3CB57YmpBZZlDIG4Vf2TmH2HS5PLBZO5brqwC4t0P3TbB2sZfRea2WWgJyV11uzc1nHNHr7Bs
	mGllHmhBOUKgMNqMbOJNWWJB9uZTCz5CnhMaSu4gk2h4+dsYK9FmZnGKAixmbP1/6sL/bl4DCfY
	MlWqfK3+qez/5D6dlBbDEXOdJZjxI/Pqalx6lB1vFanWL2I5TLuwypnSl55c6nHaEqKG5OxLf1R
	q2IOue4/iZ72jk=
X-Received: by 2002:a05:622a:598c:b0:535:922:ff3 with SMTP id d75a77b69052e-5359fb87d6fmr330555871cf.48.1792092717958;
        Thu, 15 Oct 2026 12:31:57 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.241])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362a75472esm1731641cf.4.2026.10.15.12.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:31:57 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:48 +0000
Subject: [PATCH 24/43] io_uring: don't split 128b SQEs at the SQPOLL cap
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-24-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092659; l=2544;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=vnBRpOVrqT/n5rXyXXZHIWQ31BZzmdXyRlqCl0tlTg4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOHRMEhNCFDWi4TJ4aR1sERWAQNdTSxSpFN91FDfhz4z2hXG53sDaNjleKpPl7yWVAgIxcSJl8j
 WU6esQo+ClgU=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

If an SQPOLL thread serves more than one ring, __io_sq_thread() submits
no more than IORING_SQPOLL_CAP_ENTRIES_VALUE entries per ring and round,
for fairness. On a ring with IORING_SETUP_SQE_MIXED the cap may fall
between the two entries of a 128b SQE. io_init_req() finds that just one
entry is left of what it was asked to submit and fails the request with
-EINVAL, although the second entry is sitting in the SQ ring.

In the next round the second entry is taken for an SQE of its own, so on
top of the failed request the application gets whatever its payload
amounts to when it is read as an SQE.

The application has done nothing wrong, and it can't know where the cap
is going to be applied. For SQPOLL, let the request have its second entry
if the SQ ring holds it, in excess of the number of entries that were to
be submitted.

Fixes: 1cba30bf9fdd ("io_uring: add support for IORING_SETUP_SQE_MIXED")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/io_uring.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 01187f00943a..7092efc22dd2 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -1818,17 +1818,27 @@ static int io_init_req(struct io_ring_ctx *ctx, struct io_kiocb *req,
 		 * A 128b op on a non-128b SQ requires mixed SQE support as
 		 * well as 2 contiguous entries.
 		 */
-		if (!(ctx->flags & IORING_SETUP_SQE_MIXED) || *left < 2 ||
+		if (!(ctx->flags & IORING_SETUP_SQE_MIXED) ||
 		    (unsigned)(sqe - ctx->sq_sqes) >= ctx->sq_entries - 1)
 			return io_init_fail_req(req, -EINVAL);
+		if (*left >= 2) {
+			/*
+			 * A 128b operation on a mixed SQ uses two entries, so
+			 * we have to increment the head and cached refs, and
+			 * decrement what's left.
+			 */
+			current->io_uring->cached_refs++;
+			(*left)--;
+		} else if (!(ctx->flags & IORING_SETUP_SQPOLL) ||
+			   !__io_sqring_entries(ctx)) {
+			return io_init_fail_req(req, -EINVAL);
+		}
 		/*
-		 * A 128b operation on a mixed SQ uses two entries, so we have
-		 * to increment the head and cached refs, and decrement what's
-		 * left.
+		 * else: the SQPOLL thread caps the number of entries it submits
+		 * in one go, which is none of the application's business. Take
+		 * the 2nd entry on top.
 		 */
-		current->io_uring->cached_refs++;
 		ctx->cached_sq_head++;
-		(*left)--;
 	}
 
 	if (unlikely(sqe_flags & ~SQE_COMMON_FLAGS)) {

-- 
2.55.0

