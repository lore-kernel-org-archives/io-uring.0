Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6605E48C405
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141329; cv=none; b=nW6Usf1tvfzPWKy0/dkTTF3szy6dfDiN7pUfklcMxelrMc92Dz7pQI0kz2GL27dCWZ9yR0FVjSgpRUvKW3mobMoNm595AaLDNIy9jb0kukCyMjVOIXMtNDt/8kSQTTVxQ20aaCHejg2rgVKConeY3dVfLnTTenOvJzRAnnZyL8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141329; c=relaxed/simple;
	bh=rrWhPwLXUMHPMn9y2nXl5b0RAfyzWV0Gp95H7S6fUlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OTWUMsobaTX+GsfbDUR2jQjGCwadmuP3W2GNE2Ix3MqEwYQD0JQ23gDVDc86PEpsfmaZ0SASrvK2ChOj8d1MmdYZo0c6YriMd4BEI897xUwNZdKf0c6wXjKUET9TPU09PGqLSm9+eQz1wcNX4UHnXUoiN8aOEWrVWZpTnimra4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=AUg+VxdR; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="AUg+VxdR"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6b1ae6c9b81so170107eaf.1
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141325; x=1789746125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rIQRpDFpvkA6v5lh/5UPtLNtecnKXIQ2k9kxGqhZIEM=;
        b=AUg+VxdRZ5Hk5lqCCpEItfNbMJEzk2c033f4UtKsH0LxJoQgZ3drmpiKGBYTuIDvUY
         y+HI+lhlKRqjF63pFHC4xbD10fUb2JmsGC36TYjCy25eQuF8i5UFM4S1FzB7ARR9wVKf
         bgqoU/bF6ouoEX9gNCoc7rrMxHGCdRmnQJAnFtpZwq5wqx7Z7B7xnyn977q3rPLWl9cM
         70QDGB0M4AK9RXaDTT7AY4lmc0kN3r0Nj7JACMitn7ZkJE53RGbmme6e5wISoBBxIxLx
         o+fu/VoOzdcQG+aFbyW1dZ3AHWwu+OsfF7dRkQICCLvCSD2guOwSyq5hf20Dr1G/twk1
         zptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141325; x=1789746125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rIQRpDFpvkA6v5lh/5UPtLNtecnKXIQ2k9kxGqhZIEM=;
        b=fobRvJS/UsRd5NmM09g8/WNo3RaPBuNJR6iAeNkMRgorrdg3zw/BEsGunb+DhLvDJb
         PRvBKjNh04I7+HUw0faQyOhT4m4dEjQLksKBH4By9Xb/035tiqGoEg/0ikVhieGrarP0
         OiFE9NVRQEIPaGfAP5OovkWC6pFNy17j8Rmfu5loSASZhV/VnOlVC4zWB3NRgzQwrHxK
         GnsXhdjKFluOHVnYjzvluvCWgqjxe/ANUou6cLgSzTZlz99m+gSTHedoAODAY//WlsFr
         W6j1FZE+7c4cWZBOkseuEp0yHWKQfavIc7wqOo0FlXK6HkWeCiIePJtaUGO8JMzfKIjW
         1cDQ==
X-Gm-Message-State: AFuF++lu4ZDCPe7Xi6BE+RhLvW54ylIn3x1zf7dlFPLFRhT4nklk5hba
	WhIYp9W57SfR0UfR3rXEkyDw+fxoLBLnqx+YQcn4S6gpdmW7AJ1wkr5SSpe65dT6qG+cDMDXfZp
	CsQNrd8A=
X-Gm-Gg: AYBFou3durUx/vmfzpAlXT/tVJ0D6iQq9bEPEsynWK0fwTwW4Syyw0QUpS5+Abkhvqg
	ddp+3DzrHI6aul9CUFKgoIY16nfpCDXrhoMCMjy5y7sD4ZXBUHSIV60lc0bJTnXKUnZnLf458Dt
	lc7R7wk8X+R671rouTfHAaiqn0r1Oc0lkAbgJYx4xBdH9tPbag0JA5pHoUAjD408kEzz1XC0nm9
	fcgtDSwCTybm/AxrXr7iVGbhvT8XdOut3berHxzBGDRbUq+h0/c55ZBIHm5jffPpoB2IpqRtb3v
	iJgAlcOGvIinzOTzO/czbzpZO6Fc7bhWU9oba913eNLP66knNejLvQH1ApeBkxmLRLVDAs5EQSn
	aFLejvOv93KoQv1gKWq9yNA4D9BtxYU5/RtiCyFGhoPQDGQC0+vNxgsGeIHAH63diLxclHzwTKb
	yluVwdb0pleg9bUN+ahw/j2k8R8gPw8E009InMfklp+x8E0P8Jj3BT5+BnNyx3/qePZQNDnXWuX
	IDY8nfrXzBaTFuIJuDTc0pgfnlpdn8zareIsXL7LSY=
X-Received: by 2002:a05:6820:190a:b0:6b5:ec3f:4985 with SMTP id 006d021491bc7-6c0a99f860cmr2369093eaf.32.1789141324900;
        Fri, 11 Sep 2026 08:42:04 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:42:04 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 07/15] io_uring: add uring_lock section depth tracking and blockable opdef flag
Date: Fri, 11 Sep 2026 09:40:57 -0600
Message-ID: <20260911154148.644489-8-axboe@kernel.dk>
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

Prep patch for issuing requests inline in blocking mode and catching the
sleep when it happens, rather than punting to io-wq upfront because an
operation may block.

If a request blocks inline, uring_lock must be dropped on behalf of the
sleeping task, which is only safe outside the sections that rely on the
lock being held. Track those with a depth counter in
io_ring_submit_lock() and io_ring_submit_unlock().

Add a "blockable" flag to io_issue_def for opcodes whose issue path can
cope with blocking inline: read/write, the forced async fs ops, open,
close and splice/tee. uring_cmd is excluded for now, drivers may bind
state to the submitting task.

No functional changes in this patch.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 include/linux/io_uring_types.h |  5 +++++
 io_uring/io_uring.h            |  3 +++
 io_uring/opdef.c               | 29 +++++++++++++++++++++++++++++
 io_uring/opdef.h               |  2 ++
 4 files changed, 39 insertions(+)

diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
index 4af3d579ead6..50a4a0ad222f 100644
--- a/include/linux/io_uring_types.h
+++ b/include/linux/io_uring_types.h
@@ -352,6 +352,11 @@ struct io_ring_ctx {
 	/* submission data */
 	struct {
 		struct mutex		uring_lock;
+		/*
+		 * io_ring_submit_lock() nesting depth, non-zero means the
+		 * issue path relies on the lock being held.
+		 */
+		unsigned int		submit_lock_depth;
 
 		/*
 		 * Ring buffer of indices into array of io_uring_sqe, which is
diff --git a/io_uring/io_uring.h b/io_uring/io_uring.h
index 896aab1ed026..870bb4dcc415 100644
--- a/io_uring/io_uring.h
+++ b/io_uring/io_uring.h
@@ -393,6 +393,8 @@ static inline void io_ring_submit_unlock(struct io_ring_ctx *ctx,
 					 unsigned issue_flags)
 {
 	lockdep_assert_held(&ctx->uring_lock);
+	lockdep_assert(ctx->submit_lock_depth > 0);
+	ctx->submit_lock_depth--;
 	if (unlikely(issue_flags & IO_URING_F_UNLOCKED))
 		mutex_unlock(&ctx->uring_lock);
 }
@@ -409,6 +411,7 @@ static inline void io_ring_submit_lock(struct io_ring_ctx *ctx,
 	if (unlikely(issue_flags & IO_URING_F_UNLOCKED))
 		mutex_lock(&ctx->uring_lock);
 	lockdep_assert_held(&ctx->uring_lock);
+	ctx->submit_lock_depth++;
 }
 
 static inline void io_commit_cqring(struct io_ring_ctx *ctx)
diff --git a/io_uring/opdef.c b/io_uring/opdef.c
index cf3aa2242cd7..fa07a2b94536 100644
--- a/io_uring/opdef.c
+++ b/io_uring/opdef.c
@@ -69,6 +69,7 @@ const struct io_issue_def io_issue_defs[] = {
 		.iopoll			= 1,
 		.vectored		= 1,
 		.async_size		= sizeof(struct io_async_rw),
+		.blockable		= 1,
 		.prep			= io_prep_readv,
 		.issue			= io_read,
 	},
@@ -83,12 +84,14 @@ const struct io_issue_def io_issue_defs[] = {
 		.iopoll			= 1,
 		.vectored		= 1,
 		.async_size		= sizeof(struct io_async_rw),
+		.blockable		= 1,
 		.prep			= io_prep_writev,
 		.issue			= io_write,
 	},
 	[IORING_OP_FSYNC] = {
 		.needs_file		= 1,
 		.audit_skip		= 1,
+		.blockable		= 1,
 		.prep			= io_fsync_prep,
 		.issue			= io_fsync,
 	},
@@ -101,6 +104,7 @@ const struct io_issue_def io_issue_defs[] = {
 		.ioprio			= 1,
 		.iopoll			= 1,
 		.async_size		= sizeof(struct io_async_rw),
+		.blockable		= 1,
 		.prep			= io_prep_read_fixed,
 		.issue			= io_read_fixed,
 	},
@@ -114,6 +118,7 @@ const struct io_issue_def io_issue_defs[] = {
 		.ioprio			= 1,
 		.iopoll			= 1,
 		.async_size		= sizeof(struct io_async_rw),
+		.blockable		= 1,
 		.prep			= io_prep_write_fixed,
 		.issue			= io_write_fixed,
 	},
@@ -132,6 +137,7 @@ const struct io_issue_def io_issue_defs[] = {
 	[IORING_OP_SYNC_FILE_RANGE] = {
 		.needs_file		= 1,
 		.audit_skip		= 1,
+		.blockable		= 1,
 		.prep			= io_sfr_prep,
 		.issue			= io_sync_file_range,
 	},
@@ -215,16 +221,19 @@ const struct io_issue_def io_issue_defs[] = {
 	[IORING_OP_FALLOCATE] = {
 		.needs_file		= 1,
 		.hash_reg_file          = 1,
+		.blockable		= 1,
 		.prep			= io_fallocate_prep,
 		.issue			= io_fallocate,
 	},
 	[IORING_OP_OPENAT] = {
 		.filter_pdu_size	= sizeof_field(struct io_uring_bpf_ctx, open),
+		.blockable		= 1,
 		.prep			= io_openat_prep,
 		.issue			= io_openat,
 		.filter_populate	= io_openat_bpf_populate,
 	},
 	[IORING_OP_CLOSE] = {
+		.blockable		= 1,
 		.prep			= io_close_prep,
 		.issue			= io_close,
 	},
@@ -236,6 +245,7 @@ const struct io_issue_def io_issue_defs[] = {
 	},
 	[IORING_OP_STATX] = {
 		.audit_skip		= 1,
+		.blockable		= 1,
 		.prep			= io_statx_prep,
 		.issue			= io_statx,
 	},
@@ -249,6 +259,7 @@ const struct io_issue_def io_issue_defs[] = {
 		.ioprio			= 1,
 		.iopoll			= 1,
 		.async_size		= sizeof(struct io_async_rw),
+		.blockable		= 1,
 		.prep			= io_prep_read,
 		.issue			= io_read,
 	},
@@ -262,17 +273,20 @@ const struct io_issue_def io_issue_defs[] = {
 		.ioprio			= 1,
 		.iopoll			= 1,
 		.async_size		= sizeof(struct io_async_rw),
+		.blockable		= 1,
 		.prep			= io_prep_write,
 		.issue			= io_write,
 	},
 	[IORING_OP_FADVISE] = {
 		.needs_file		= 1,
 		.audit_skip		= 1,
+		.blockable		= 1,
 		.prep			= io_fadvise_prep,
 		.issue			= io_fadvise,
 	},
 	[IORING_OP_MADVISE] = {
 		.audit_skip		= 1,
+		.blockable		= 1,
 		.prep			= io_madvise_prep,
 		.issue			= io_madvise,
 	},
@@ -308,6 +322,7 @@ const struct io_issue_def io_issue_defs[] = {
 	},
 	[IORING_OP_OPENAT2] = {
 		.filter_pdu_size	= sizeof_field(struct io_uring_bpf_ctx, open),
+		.blockable		= 1,
 		.prep			= io_openat2_prep,
 		.issue			= io_openat2,
 		.filter_populate	= io_openat_bpf_populate,
@@ -327,6 +342,7 @@ const struct io_issue_def io_issue_defs[] = {
 		.hash_reg_file		= 1,
 		.unbound_nonreg_file	= 1,
 		.audit_skip		= 1,
+		.blockable		= 1,
 		.prep			= io_splice_prep,
 		.issue			= io_splice,
 	},
@@ -347,6 +363,7 @@ const struct io_issue_def io_issue_defs[] = {
 		.hash_reg_file		= 1,
 		.unbound_nonreg_file	= 1,
 		.audit_skip		= 1,
+		.blockable		= 1,
 		.prep			= io_tee_prep,
 		.issue			= io_tee,
 	},
@@ -360,22 +377,27 @@ const struct io_issue_def io_issue_defs[] = {
 #endif
 	},
 	[IORING_OP_RENAMEAT] = {
+		.blockable		= 1,
 		.prep			= io_renameat_prep,
 		.issue			= io_renameat,
 	},
 	[IORING_OP_UNLINKAT] = {
+		.blockable		= 1,
 		.prep			= io_unlinkat_prep,
 		.issue			= io_unlinkat,
 	},
 	[IORING_OP_MKDIRAT] = {
+		.blockable		= 1,
 		.prep			= io_mkdirat_prep,
 		.issue			= io_mkdirat,
 	},
 	[IORING_OP_SYMLINKAT] = {
+		.blockable		= 1,
 		.prep			= io_symlinkat_prep,
 		.issue			= io_symlinkat,
 	},
 	[IORING_OP_LINKAT] = {
+		.blockable		= 1,
 		.prep			= io_linkat_prep,
 		.issue			= io_linkat,
 	},
@@ -387,19 +409,23 @@ const struct io_issue_def io_issue_defs[] = {
 	},
 	[IORING_OP_FSETXATTR] = {
 		.needs_file = 1,
+		.blockable		= 1,
 		.prep			= io_fsetxattr_prep,
 		.issue			= io_fsetxattr,
 	},
 	[IORING_OP_SETXATTR] = {
+		.blockable		= 1,
 		.prep			= io_setxattr_prep,
 		.issue			= io_setxattr,
 	},
 	[IORING_OP_FGETXATTR] = {
 		.needs_file = 1,
+		.blockable		= 1,
 		.prep			= io_fgetxattr_prep,
 		.issue			= io_fgetxattr,
 	},
 	[IORING_OP_GETXATTR] = {
+		.blockable		= 1,
 		.prep			= io_getxattr_prep,
 		.issue			= io_getxattr,
 	},
@@ -497,6 +523,7 @@ const struct io_issue_def io_issue_defs[] = {
 	[IORING_OP_FTRUNCATE] = {
 		.needs_file		= 1,
 		.hash_reg_file		= 1,
+		.blockable		= 1,
 		.prep			= io_ftruncate_prep,
 		.issue			= io_ftruncate,
 	},
@@ -553,6 +580,7 @@ const struct io_issue_def io_issue_defs[] = {
 		.iopoll			= 1,
 		.vectored		= 1,
 		.async_size		= sizeof(struct io_async_rw),
+		.blockable		= 1,
 		.prep			= io_prep_readv_fixed,
 		.issue			= io_read,
 	},
@@ -567,6 +595,7 @@ const struct io_issue_def io_issue_defs[] = {
 		.iopoll			= 1,
 		.vectored		= 1,
 		.async_size		= sizeof(struct io_async_rw),
+		.blockable		= 1,
 		.prep			= io_prep_writev_fixed,
 		.issue			= io_write,
 	},
diff --git a/io_uring/opdef.h b/io_uring/opdef.h
index 667f981e63b0..45c2f77cf782 100644
--- a/io_uring/opdef.h
+++ b/io_uring/opdef.h
@@ -29,6 +29,8 @@ struct io_issue_def {
 	unsigned		vectored : 1;
 	/* set to 1 if this opcode uses 128b sqes in a mixed sq */
 	unsigned		is_128 : 1;
+	/* issue path is safe to run inline in blocking mode */
+	unsigned		blockable : 1;
 
 	/* size of async data needed, if any */
 	unsigned short		async_size;
-- 
2.55.0

