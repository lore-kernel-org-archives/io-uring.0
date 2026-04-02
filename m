Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AF423EAB2
	for <io-uring@vger.kernel.org>; Thu,  2 Apr 2026 16:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775146186; cv=none; b=OLwOkQ/zJz6HVYqqepzeZekkVbgh3YjvctcwjvOP5Ibnxn6QEa1uK0F+xoZShz6i834x5fskxQ3oiU4W6IGyfkNGLst0qY53Hpgmz0LFYdODqAqrEPv5wmO8eHc+jCGEwKguFjBIb2IV1jDNvQIgGiU1Dz8ejTvusURiFzTWdJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775146186; c=relaxed/simple;
	bh=bm+lm3vSzU9qw8VwtBtUfQysLwoiE0BJhGGgAt7LgoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j0rekiZSPAS/8y6wMH+X1wKY61DMhDty/OISa2XrRPt2ovI5mddlwmZvhCbFGlPUKRgET7laR5kYXtL26l7jV6fdELtWgmuaDBO2UeuPzPukJ96TmGJ8XJb3LpIF8czx9Vz7jeqd7033QxKowl0LpZMvlYy+1JBtu+T1jiwfI4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQhJqE8M; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQhJqE8M"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso719368a91.1
        for <io-uring@vger.kernel.org>; Thu, 02 Apr 2026 09:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775146185; x=1775750985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHAlAxNY6j3n5YyDL6Js3k1gE2FG83PcnFuswlZcUWU=;
        b=RQhJqE8Mx/QLq6YpZyopIlRCNxB9Yw8S5Y8419QUAwkfu5RFMlU6cdJjTu1eyrqI4m
         qMkjugwxgZ5pK/YFqcMS8fBH6cb9uy3FyC4L+iTgEI5Rv4kJnptCaqz0wLu27Ynwlakg
         r6KAaO/+IZ9MXHF8KFIqCOab0tnmHqFVb6kzbT+/+m8rtfkeXJlHXKRW7vCo0sZqOdXK
         5/BM3j0c7MyxRFa4hBpzp6DKH5U+X25SLIgEPRBJgMhKtaCvmPSiEME75nMWrmwIgjfQ
         sx+8E7odrJ2+0Dr2MMSkyXdpHmwZMmrZ8J/uyjrPPapske/B1R5b4ZeDBjWkhC5h3qcx
         5Mow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775146185; x=1775750985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uHAlAxNY6j3n5YyDL6Js3k1gE2FG83PcnFuswlZcUWU=;
        b=VqGvamEeoKcnAkITdHwEVA1EX6U6In0V8Iubx5NyvT55rBbzgAbEqUv5H0RRjBDtN3
         khXbCp1Hj4PZ96GxDsTrTI7NazAW4BKy7sA1/yIwe8jOaGZMEke23FELQWjosDfsxL4V
         gNpraYM9lWFssublmqJnf4NP0eWo3lN2cU03DwRpE67HjGi7zcu/w3sS6b0NiHPJnn5r
         qN/mbXnneuF67ZV/pVXuaoYBUGkTekTn9O1gcf/twOE8zw1giB17qk0tbmPdk8tl9M4i
         657I2cXVyJzkR2arKtNjhfGlNyYEvbY2PGSIJ4DDqu/ZKd6LqAphkYDcYdaXMaGuqGmA
         SR8A==
X-Forwarded-Encrypted: i=1; AJvYcCVXtswqWphw8KjQmKnw75qttEOux2syiyok4S0m2/w5WYyEiooiedgfgE0z4FsQYrK+U6J2xWz6Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdmtCsg8wQtJzr/PhIQd4FrJ2guIkePVtr30chQa1C033AKawb
	me2Xa2Zs3gmJaBRKRhVg/hnTc1kHu7FwTPVciRwq7EhdfJjEGroC7mCCcMoN0w==
X-Gm-Gg: AeBDietH2AupTmRpV0MZRwF3gHtLF8XZSBJ2UH8bfRyzfyjhEoViO4dIKZoqg6fgOyp
	cdxFimiuy8GIR/4SF11JVS5mt0vrc5kvD0fP+C4WiiCMK10Z5t0ZYIuUmZuEPZESVxQSfJB9Kuh
	Is1sSOJxtDWnFocrY6VZgnvkJA7FdxoUBoZ7K0VpjCjNNf+3RVpDQsce8t8hRMg4EFlEjQdcBU+
	O5wwDRfB+2kilXBOKCQUjC9QlrBzg8F9OO0hoztk289qfMq4GQWdXJHaTScR6RgTeFwLD3dFJw/
	PGWfOQPOD71O+Hg6ZJEZWMi8qZWwXkslCWtd3NBsyESPM9Dp2tjBZw6Nu+2B5nHEexE8IG69Ly6
	8k6gClqt2uJ0fxTdV9s3E4SiI6p8vGw2q8wFHuHD8yoxXzyKefv1l6UBHurcbLiD+4cFY5W5Rdw
	hELY3EK6Wob0uwaJJP
X-Received: by 2002:a17:90b:28ce:b0:35c:29ba:bf92 with SMTP id 98e67ed59e1d1-35dc6ea76eemr7848827a91.5.1775146184727;
        Thu, 02 Apr 2026 09:09:44 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:e::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dba63e80bsm2986245a91.4.2026.04.02.09.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 09:09:44 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: axboe@kernel.dk
Cc: csander@purestorage.com,
	io-uring@vger.kernel.org
Subject: [PATCH v5 3/4] io_uring/rsrc: add io_buffer_register_bvec()
Date: Thu,  2 Apr 2026 09:09:28 -0700
Message-ID: <20260402160929.2749744-4-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260402160929.2749744-1-joannelkoong@gmail.com>
References: <20260402160929.2749744-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add io_buffer_register_bvec() for registering a bvec array.

This is a preparatory patch for fuse-over-io-uring zero-copy.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
Reviewed-by: Caleb Sander Mateos <csander@purestorage.com>
---
 include/linux/io_uring/cmd.h | 13 +++++++++++++
 io_uring/rsrc.c              | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/include/linux/io_uring/cmd.h b/include/linux/io_uring/cmd.h
index bbf57da1e4c8..42801f0b6456 100644
--- a/include/linux/io_uring/cmd.h
+++ b/include/linux/io_uring/cmd.h
@@ -94,6 +94,10 @@ bool io_uring_mshot_cmd_post_cqe(struct io_uring_cmd *ioucmd,
 int io_buffer_register_request(struct io_uring_cmd *cmd, struct request *rq,
 			       void (*release)(void *), unsigned int index,
 			       unsigned int issue_flags);
+int io_buffer_register_bvec(struct io_uring_cmd *cmd, const struct bio_vec *bvs,
+			    unsigned int nr_bvecs, void (*release)(void *),
+			    void *priv, u8 dir, unsigned int index,
+			    unsigned int issue_flags);
 int io_buffer_unregister(struct io_uring_cmd *cmd, unsigned int index,
 			 unsigned int issue_flags);
 #else
@@ -146,6 +150,15 @@ static inline int io_buffer_register_request(struct io_uring_cmd *cmd,
 {
 	return -EOPNOTSUPP;
 }
+static inline int io_buffer_register_bvec(struct io_uring_cmd *cmd,
+					  const struct bio_vec *bvs,
+					  unsigned int nr_bvecs,
+					  void (*release)(void *), void *priv,
+					  u8 dir, unsigned int index,
+					  unsigned int issue_flags)
+{
+	return -EOPNOTSUPP;
+}
 static inline int io_buffer_unregister(struct io_uring_cmd *cmd,
 				       unsigned int index,
 				       unsigned int issue_flags)
diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 5384fbbf684e..4aada6548ac5 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1006,6 +1006,41 @@ int io_buffer_register_request(struct io_uring_cmd *cmd, struct request *rq,
 }
 EXPORT_SYMBOL_GPL(io_buffer_register_request);
 
+/*
+ * bvs is copied internally. caller may free it on return.
+ */
+int io_buffer_register_bvec(struct io_uring_cmd *cmd, const struct bio_vec *bvs,
+			    unsigned int nr_bvecs, void (*release)(void *),
+			    void *priv, u8 dir, unsigned int index,
+			    unsigned int issue_flags)
+{
+	struct io_ring_ctx *ctx = cmd_to_io_kiocb(cmd)->ctx;
+	struct io_mapped_ubuf *imu;
+	struct bio_vec *bvec;
+	unsigned int i, total_bytes = 0;
+	int ret = 0;
+
+	for (i = 0; i < nr_bvecs; i++)
+		total_bytes += bvs[i].bv_len;
+
+	io_ring_submit_lock(ctx, issue_flags);
+	imu = io_kernel_buffer_init(ctx, nr_bvecs, total_bytes, dir, release,
+				    priv, index);
+	if (IS_ERR(imu)) {
+		ret = PTR_ERR(imu);
+		goto unlock;
+	}
+
+	bvec = imu->bvec;
+	for (i = 0; i < nr_bvecs; i++)
+		bvec[i] = bvs[i];
+
+unlock:
+	io_ring_submit_unlock(ctx, issue_flags);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(io_buffer_register_bvec);
+
 int io_buffer_unregister(struct io_uring_cmd *cmd, unsigned int index,
 			 unsigned int issue_flags)
 {
-- 
2.52.0

