Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB631329E55
	for <io-uring@vger.kernel.org>; Fri, 14 Aug 2026 03:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786676679; cv=none; b=dZAuwtWUoDjs27+skMrhRrfGWrVXpXHvDdn8BI+p52Otin64yMVRvfyKTeESivqBoPwCCQ3W21eg+uZkvmGERRi/eRQz+wxPCoBtTDpicx+VpP6InvFZhMEZ5bJjLj1uWorYfUgwfWdjmuWxhXyT76y2CoWnqVq7GG/V+kEA2Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786676679; c=relaxed/simple;
	bh=V/HzzkW+qnhTjCNtyz0WInHj4zMKJktS0mX/T6eERZc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jUQdFBd4f/a9YbmfZHFUMCwhjXo2qFm4UpNbAHuYXAEjxU5LxJKQu6AW0VkHP/Tn57LRB3BI5iY7nNBtwf3rreu26GGD+TWRGKp8v8yhEt6QtR/hcTk+e/ntXNKjj64wdo41FR03EeGy3hnr3xTgZYFA+CcufF23/nzYr8g28TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=oIbW4nfd; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="oIbW4nfd"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d049069377so6672205ad.0
        for <io-uring@vger.kernel.org>; Thu, 13 Aug 2026 20:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1786676678; x=1787281478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9onNRTABCXYOeybtu4bO6u4fdhaxRdMqwE09dAOotHI=;
        b=oIbW4nfdb23s2jxQfCjpKRU2pNth2ab40bJDlhkUssKekfAFoxCyvkpJTYmlUIyQEq
         jFZugQIACRbc5jeYt68Hst57M7uqv5BRm+LBzA2NwLl+/O3FeETa6B4uNKRnynfm/BJa
         Bg4HkwEsV3TqTIwlGPHblOIwNVT5u+ouiOits=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786676678; x=1787281478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9onNRTABCXYOeybtu4bO6u4fdhaxRdMqwE09dAOotHI=;
        b=frGpy3QC8Q3wdRI9s519JTAL6Jib7mvyYrpc0HjFm+HuWxHucXdZaWXbOFUmbUNBRR
         dwL7erBYzkGB8kkUFtLyQpYAY6aBCpdnofCLhtjk7sUXN8ycqpjTSPhmQdXkp3qsYvT8
         0Dq69D7+4tAlgvt/pLUIaGaa7aK4qBErDn351qaR71g3TmcpT6FU4QKC6uczfkfLTTwl
         8LmgXOx0SQtxnewDOqSqyEecaEAX5uKrgv1dlE099UhwDFoZkLLCboS1L5zCp4CBqhze
         N/EFXdCT9YSbyqv+PHnE3PBEUvX2HnzFIaDmO6kHvFAUUC8yCkHx2LesXyMMT5utnife
         DJag==
X-Gm-Message-State: AOJu0YxNbIEsTxTVWEgBlorXT5C8BOwhhrtod20SoUXxe6dNhwUloRoe
	mJSpaKVaE/le5GfCmiQejrqO22F92VzhYkphznX9UsrW9Lm6DeVencmURHn2FTpBhJUJrijsypt
	SNFrr
X-Gm-Gg: AR+sD13UqbGeECv5UVfbciWbGQ4T/1jMdR6OXILMv+tDoEtj1R4ThMZU0N5FgWkeApU
	vb8gees4UYwXzY51XGRoplXAB1YGjUZvihCInmjvb0jIPGz+iLkrDfymlO3uAuh8mP4AarVgug3
	m1WR55vk5luXKOcKJUr6ylEX6LD9BvaLQTPLZ6pIbe0yLBNPCh2ZbhrsvnmK1fuFFlASRiwa5Le
	caR/ObzBKP9UgFziD2+cj/ZtB9fqviVSii8pv6qODTjEbU2lQ/+wGli8o3HIPWIbBwOWSStlca/
	TIf5X3AanFWgbrgq0QmFrP1uDDUZn046Ixbj89xn6sxSO9moI1J3WY/rzKJ8FR08peRgaCV4G6V
	IkQoCRAD6Jcs8YliPlM5cJkPtic6whmYaMdsBOte3xwwB4hC/z/FOhWq3au5//2IjOFqRaf5Vmz
	Az8aFSQmXaPLzapIKUIqn9XKYAAP9/bVjXOCPWAq6ShZXV6tCU4EYv4ojjFWFdO+8=
X-Received: by 2002:a17:902:e547:b0:2c1:ee75:56bb with SMTP id d9443c01a7336-2d3b0dc57d3mr28938135ad.20.1786676677967;
        Thu, 13 Aug 2026 20:04:37 -0700 (PDT)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3ae804b32sm3751895ad.35.2026.08.13.20.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 20:04:37 -0700 (PDT)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: io-uring@vger.kernel.org
Cc: Sidong Yang <sidong.yang@furiosa.ai>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Jens Axboe <axboe@kernel.dk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] io_uring/bpf-ops: wake up the loop task on eject
Date: Fri, 14 Aug 2026 12:04:20 +0900
Message-ID: <20260814030421.61216-1-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_eject_bpf() clears ctx->loop_step while a loop may be sleeping in
io_loop_wait(), which releases ->uring_lock before schedule(). Nothing
wakes the submitter task after the BPF ops are unregistered through link
destruction or ring teardown, so the task stays blocked in
io_uring_enter() until an unrelated CQE event or signal arrives.

Since BPF ops require IORING_SETUP_DEFER_TASKRUN, only
ctx->submitter_task can run the loop, so wake it directly. The loop
rechecks loop_step after waking up and exits with -EFAULT. A spurious
wakeup is harmless because io_loop_wait() rechecks the wait condition
before sleeping again.

Fixes: 98f37634b12b ("io_uring/bpf-ops: implement bpf ops registration")
Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
---
 io_uring/bpf-ops.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/io_uring/bpf-ops.c b/io_uring/bpf-ops.c
index 5a50f0675fe5..87148dbd3b3e 100644
--- a/io_uring/bpf-ops.c
+++ b/io_uring/bpf-ops.c
@@ -210,6 +210,13 @@ static void io_eject_bpf(struct io_ring_ctx *ctx)
 	ops->priv = NULL;
 	ctx->bpf_ops = NULL;
 	ctx->loop_step = NULL;
+	/*
+	 * A loop may be sleeping in io_loop_wait() with ->uring_lock
+	 * released. It'll see loop_step == NULL after waking up, but
+	 * nothing wakes it otherwise.
+	 */
+	if (ctx->submitter_task)
+		wake_up_state(ctx->submitter_task, TASK_INTERRUPTIBLE);
 }
 
 static void bpf_io_unreg(void *kdata, struct bpf_link *link)
-- 
2.53.0

