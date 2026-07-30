Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAE33A0B36
	for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 19:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785439741; cv=none; b=HotWhpG0a79aeYuKXamuQNAr+xpDqB+YiJzwgBUG2QJ70Bj2iy6VkxHUXiSA2zKVD57y47+ZJxHtEKlllJHW68s/7vc0cyKfwJ1HuqEclDasV+EMnwS01uhKTnzPJ1kW4G/Q1ivwj0FpG/tRCIkd6AWMjglCl8NNd2/eIEaZKPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785439741; c=relaxed/simple;
	bh=K5WoNgXgQdg9g06mhIzR2r1Me96vNqQOOp5TO8oLp0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KBR9OZw/eDeJ3gLGul0MrttFBW0ElcRnX0YPqzSDqBOXlyk0Dxx6KjhGyF9IgTos/AUmApQ2/AjUteMj5ynQ6+5jRXQLYyvy/TWQ1oYcoAH95JEcsNUXRpnWc7Lng9RswFNdsdXxv30lUwkwWgbU3ZUlxRcJxkcpS0SRVgyDZMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWfyuUs5; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWfyuUs5"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84e4efb18c9so30300b3a.0
        for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 12:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785439731; x=1786044531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vg+HKJD//ylZ8IdlpokMPZEfihdlw8kCPM5W3QVcMmw=;
        b=dWfyuUs5rz/on0hEgLMO3WO1t9H8f3aG3StJ3BjDy72Ssdz7wq+/ktrjwxIn+klCWy
         jVvPvjVnjxJfk3JHtcpFXZD92eVXxkVSUUoWDqxUS1FX7QBfZQhMPIWliuSKhreilPkE
         eoIzK/aE8aegRHhjTH5MFbkZtyrCPv+pnYv7xd7dML6gT5MuRvl9yTc6sDSYrfk1COg9
         lyfT6+TXb8OrbK8vvuUuCjVRmcRXehKtQgo4yHCP/vfWDt+VXR7KOCHOEboqpSYgwOjU
         WWQUfFxEMTDKljHoM4+bc//0jBRwWEWTk8UtDXruMvzW2rDWIsK4joYM3wU5tZqMZIq+
         vMrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785439731; x=1786044531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vg+HKJD//ylZ8IdlpokMPZEfihdlw8kCPM5W3QVcMmw=;
        b=CQaubdHo4xmyR1CScqRH5fUKyS7Jlg8h1em+XN0W5mxeiJp23vBBCEc0aKenyEJ52t
         rAVSj7JiZk84bncRElSrCCmO97mv8fsm++bQEZ0bxN6auEDL3dBUtb0XZ4mfsu7h32DM
         2tITtRyDuJhKZk+LQBhdeOIWUyCr8u7GPpnupS1SmOugLoxBe79eKBNWI/zNGOBbBS7O
         iTnVPYcRFaLnS/nZzInEEOrd/5tQHe2uKIe12+8Zx4J9rRiHvmmTOmeza57FefIswa3R
         ObDnCdDOoFcutzYWh0ISc377FGfPB/LD6arrgUyXGfrUtXik2KB+H+bUynZQO9GoPtU5
         NdJg==
X-Gm-Message-State: AOJu0YwcqEFFcdWEJVDH1FcfetI9dXmhKRzSLiUX5OiGzm1W93oHd2AI
	Q1xZamWQsQ4kGxfBbSNkssOVK+LMX/sX+ia7IAb4SU+6AUp3agqXpZtX2SGSHeUz+EQ=
X-Gm-Gg: AR+sD111q9m4lQyThO4MkZwMaFJyy1bIB3HaVLeCBb3j5OajHtBL7CDiPeUTj2gaeqb
	i8TZbClrGlmv4zUfJSgwKRGlb6MJjowQpmO4Mkwojw55y+BQTWH+UWPk2cHWv2FYFN0VLR9klgy
	HI4U7v7+iv5GK3AjYb7fnFWDcwjh57NlhN16y010BxLrgUImoXa2fJVc7gG1+NOVkx7BJL/S1O/
	3xpg0AQJMX3yk9l2ZbBbIsxUJUiwwovt2SzR9LcS0vat+4ahR5b3uOleqfRgEOki7q4Qqx8vpao
	tIVjhAu7AfG8NqGOPa/7vBF/CvRIUrS3B+owujtNhu2AIbMjqX7sOjSwzAF56gdRnF7mm+qROrZ
	IzJk4N4bSTFcxXnZrNp/SJTGOQvn+ZpGNdk6OHU0sMWVtQsPE29Nc0icK1/4u50uK6JABQk+2RM
	Y0ZXMDAWcz//OnMPdE8ACvre3E9L05SDnjkCy8LANdgkddX+oAtXZUV1AzGHuRH2s/PpEDAFgkk
	7uGDoE9AFJBOWYW5Rd6UyDDuBsmqZt8YaGNqDh3cANNPSTUw58KK2LD1ZntH0/3ZXCdZNQ6mZqc
	1/PC488GErK/
X-Received: by 2002:a05:6a00:4093:b0:848:5bf9:6ebc with SMTP id d2e1a72fcca58-84ecb9a837dmr1421094b3a.1.1785439730694;
        Thu, 30 Jul 2026 12:28:50 -0700 (PDT)
Received: from localhost.localdomain ([182.220.200.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0054afesm3589449b3a.17.2026.07.30.12.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 12:28:50 -0700 (PDT)
From: Kyumin Lee <fyonglkm@gmail.com>
To: io-uring@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>,
	stable@vger.kernel.org,
	Kyumin Lee <fyonglkm@gmail.com>
Subject: [PATCH v2] io_uring: preserve task restrictions across exec
Date: Fri, 31 Jul 2026 04:27:34 +0900
Message-ID: <20260730192734.459247-1-fyonglkm@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per-task restrictions apply to all rings created by a task. Once installed,
they should not be dropped across exec.

For a task that has used io_uring, the exec cancellation path calls
__io_uring_free(). This frees both the task context and the per-task
restriction, so a ring created after exec is unrestricted.

Split task context cleanup into io_uring_free_tctx(), and use it from the
exec cancellation path. Keep __io_uring_free() for final task cleanup,
where both the context and restriction are released.

Fixes: ed82f35b926b ("io_uring: allow registration of per-task restrictions")
Cc: stable@vger.kernel.org # 7.1+
Signed-off-by: Kyumin Lee <fyonglkm@gmail.com>
---
Changes in v2:
- Resent as text/plain with no code changes.

 io_uring/cancel.c | 2 +-
 io_uring/tctx.c   | 7 ++++++-
 io_uring/tctx.h   | 1 +
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/io_uring/cancel.c b/io_uring/cancel.c
index 8c6fa6f367e4f..7d7820eab878b 100644
--- a/io_uring/cancel.c
+++ b/io_uring/cancel.c
@@ -660,6 +660,6 @@ __cold void io_uring_cancel_generic(bool cancel_all, struct io_sq_data *sqd)
 		 */
 		atomic_dec(&tctx->in_cancel);
 		/* for exec all current's requests should be gone, kill tctx */
-		__io_uring_free(current);
+		io_uring_free_tctx(current);
 	}
 }
diff --git a/io_uring/tctx.c b/io_uring/tctx.c
index cc3bf2b3bdbc9..466b7300e208e 100644
--- a/io_uring/tctx.c
+++ b/io_uring/tctx.c
@@ -43,7 +43,7 @@ static struct io_wq *io_init_wq_offload(struct io_ring_ctx *ctx,
 	return io_wq_create(concurrency, &data);
 }
 
-void __io_uring_free(struct task_struct *tsk)
+void io_uring_free_tctx(struct task_struct *tsk)
 {
 	struct io_uring_task *tctx = tsk->io_uring;
 	struct io_tctx_node *node;
@@ -67,6 +67,11 @@ void __io_uring_free(struct task_struct *tsk)
 		kfree(tctx);
 		tsk->io_uring = NULL;
 	}
+}
+
+void __io_uring_free(struct task_struct *tsk)
+{
+	io_uring_free_tctx(tsk);
 	if (tsk->io_uring_restrict) {
 		io_put_bpf_filters(tsk->io_uring_restrict);
 		kfree(tsk->io_uring_restrict);
diff --git a/io_uring/tctx.h b/io_uring/tctx.h
index 2310d2a0c46d9..76ad1ad4594ef 100644
--- a/io_uring/tctx.h
+++ b/io_uring/tctx.h
@@ -12,6 +12,7 @@ void io_uring_del_tctx_node(unsigned long index);
 int __io_uring_add_tctx_node(struct io_ring_ctx *ctx);
 int __io_uring_add_tctx_node_from_submit(struct io_ring_ctx *ctx);
 void io_uring_clean_tctx(struct io_uring_task *tctx);
+void io_uring_free_tctx(struct task_struct *tsk);
 
 void io_uring_unreg_ringfd(void);
 int io_ringfd_register(struct io_ring_ctx *ctx, void __user *__arg,
