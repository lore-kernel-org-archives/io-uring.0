Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D21D51CF4E
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092724; cv=none; b=gSlFOVSRzP/i564WNlx8GVuqQ0J0CLMGyO+Oluxvn9qYbp1ykkZHqJFIvmp167ydtpuPZg0V5Ft89b+uYouo6iU0XHwc95DFn7v0V+8lHKqkyInoCqvIpL1dVuHXOX3EJJJJHc7I93eYIak2rYjzg50//xmJEYD8CWbIh9fAh4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092724; c=relaxed/simple;
	bh=Mz/q1sBKYxgEtt3UGzpQ96LfZ55f9dv+wLHsNx6jtls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kril9Crugm+vZjQKKuKTzP2LucAUHjaK9Exmf+9wKjOuN8VqfUl60LMjWYtqQ8V5CCf75G1wC+upQcv08ppAWVfdy9rCjaO/Sk59s9n8dQsNOZJNPwrt1ZLdWsstuyyMj//xyE406YeeKU6NVdFz2zx1aWUIke9N2y9UyeuT4Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=c0QAdcAq; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="c0QAdcAq"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53506b44151so74000861cf.0
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092720; x=1792697520; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWL8wXqSjhkgK8405PnBj45S65kl7db/EgoWvsamcAs=;
        b=c0QAdcAqnR134AJAbC1mGCBckBF4UgRHdiBLC/jgDRABkJoex1DJ9ewF0NfdFbKuV7
         2gDTrr25aK6VvHAfgcNn4hb9YP5f/6E+nyZXLx4xhO2TGEfpxmWk+i0DdQhqC/Zia/HI
         E/c7A6aX6CuDTaTFZiP711YYPQiakjCB0rYtzl7lks77eKJpWRI8ctNLON2nsoGGclqP
         ajP8ZVg5BDdTQbHSKYnId1PQbFgQQ1rvuNTQwAjGfamD3MaD3LTejpPqZGVSu6i7aZCs
         F/kEJQUohAXIJ/y9zelVtDa4BCxJj5RGP7Z3BclcCOAu2oOR2mDVc2tWcnbw9Us+kpsQ
         /h6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092720; x=1792697520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SWL8wXqSjhkgK8405PnBj45S65kl7db/EgoWvsamcAs=;
        b=pz7ypo/WyQjll9jgBfZkGlADPQ1pEshpxJTcvxbOJ7qcbivh/J7xKLP8DLl/zEM4Df
         EvRbsANWAN6RmJiQUJbi9lhf0GzV2BUKvhX+4GrrjnglZGzf4OLbYlHmFrov6uICyDpZ
         HhBzdGgEMnteGuimTYmCmVYpWexMVM1bcoD1dECL4oTSxmeV7mVpu6RnnBpB99zJacQo
         OcxpmwxDutSy1j2lidAszX6MrxLi7I8mAuqUjJMEnmW3m6d2cLa88YdR2U7cRHdARQFz
         s6P9gcDs3tozY6B7es711EN18l3SSj/dXchn1qoeenCO35QjOsaPgheWX0/tEjBroDMs
         yjxw==
X-Gm-Message-State: AFq9FYISjwecX4wPcswP9MFpWn5o9nb9oLJWkjZxQJBYi17F0EbTzlI1
	7UgQbMFRG9M+Axo3Lh649jCCsyYOvEg5Go1d1IM3e/dyo5NSrkmjL9JRIZkgg0ZSGTvYerpAerL
	EYINQ
X-Gm-Gg: AYBFou0D4ffG09yKGFDr21UlGFq9cGoOGGZU0EJYs19YN1Tbja4qzf8QsBX/ZVgfxAL
	va7rcI7daFFtaC29FpiomHTRaERL6sHCYqXstqAtMH5C94dFKQl58J4aZQ0JKZICd7Q9shLS9yJ
	whtrPu4rEV2Gzrz0FtCJCA1X8h9UwD2s2DrbeTy6qALAXoa1ya5mGe2R2heirkgMGxSW7At2ORi
	M82iCmvH7v/QC+n1VkdLJXsz6mjffPdpHmXj1geBNMmJK/lo1UTf9lLIYlmCT1fDlZY1NxbDB/k
	AnMX/bYiN4XAyUU74uM2kcXT+rhYdEZ6/3ica8wf/VwcVUO7X4mbAhXCpZtQnR5GunWik3iFE3K
	DxVpBfh7uYSU4EBWJ7NPpteGCYJVdUTsDZRhkapqT60cZhRIStH3pldY4AcD3JWjNyQntmcEsJo
	cxjbt6osZNvboz3mZLYFxCoZjw6aac53jNbDm2edibKLkyQrYFLf7orseqkfbqcq2vvFaIc89N1
	/E31RtgWY1Cvpg=
X-Received: by 2002:a05:622a:2b06:b0:534:20b8:5d1b with SMTP id d75a77b69052e-5359fb57284mr310145851cf.38.1792092719740;
        Thu, 15 Oct 2026 12:31:59 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.253])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb756c6sm3355626d6.43.2026.10.15.12.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:31:59 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:49 +0000
Subject: [PATCH 25/43] io_uring/register: don't wrap 32b CQEs when resizing
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-25-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092659; l=2644;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=Mz/q1sBKYxgEtt3UGzpQ96LfZ55f9dv+wLHsNx6jtls=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QC9cI/rr1OqIYiXP1XrpvHebcz8IoUBGehHjnzZaAA3jFmJYLo830i9idhtoDQ3ufdNTBUnZQVL
 r252pBniGlA0=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

On an IORING_SETUP_CQE_MIXED ring, a 32b CQE uses two contiguous CQ
entries and is never allowed to wrap the end of the ring. When posting,
io_cqe_cache_refill() inserts a dummy IORING_CQE_F_SKIP entry if only
one entry is left before the ring wraps, and the application relies on
that to read a 32b CQE as one contiguous 32 byte slot.

io_register_resize_rings() copies pending CQEs to the new ring one 16b
entry at a time, placing entry i at i & (new_entries - 1). When the CQ
ring is shrunk, a pending 32b CQE that was contiguous in the old ring
can land with its first half on the last entry of the new ring and its
second half on entry 0. For example, with 8 old entries, 4 new entries
and a 32b CQE at index 3, the halves end up at entries 3 and 0. The
application then reads the extra data of that CQE from past the end of
the CQ array, and the CQE content it sees is wrong.

This was found by code inspection and has not been reproduced.

Fix by failing the resize with -EOVERFLOW if a pending 32b CQE would
wrap the new ring, the same way the resize fails when the pending CQEs
don't fit.

Fixes: e26dca67fde1 ("io_uring: add support for IORING_SETUP_CQE_MIXED")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/register.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/io_uring/register.c b/io_uring/register.c
index dab3eb4258df..d7e9963ab9b0 100644
--- a/io_uring/register.c
+++ b/io_uring/register.c
@@ -505,6 +505,7 @@ static int io_register_resize_rings(struct io_ring_ctx *ctx, void __user *arg)
 	struct io_uring_params *p = &config.p;
 	struct io_rings_layout *rl = &config.layout;
 	u32 *o_sq_array, *n_sq_array = NULL;
+	bool cqe32_tail = false;
 	int ret;
 
 	memset(&config, 0, sizeof(config));
@@ -654,6 +655,21 @@ static int io_register_resize_rings(struct io_ring_ctx *ctx, void __user *arg)
 			src_mask = (ctx->cq_entries << 1) - 1;
 			dst_mask = (p->cq_entries << 1) - 1;
 		}
+		/*
+		 * A 32b CQE on a CQE_MIXED ring takes two contiguous entries
+		 * and must not wrap. A smaller ring may place it on the last
+		 * entry, fail the resize if that happens.
+		 */
+		if (ctx->flags & IORING_SETUP_CQE_MIXED) {
+			if (cqe32_tail) {
+				cqe32_tail = false;
+			} else if (READ_ONCE(o.rings->cqes[index & src_mask].flags) &
+				   IORING_CQE_F_32) {
+				if ((index & dst_mask) == dst_mask)
+					goto overflow;
+				cqe32_tail = true;
+			}
+		}
 		memcpy(&n.rings->cqes[index & dst_mask], &o.rings->cqes[index & src_mask], cq_size);
 	}
 	WRITE_ONCE(n.rings->cq.head, old_head);

-- 
2.55.0

