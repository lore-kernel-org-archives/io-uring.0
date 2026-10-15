Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0CC55C1AA
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092724; cv=none; b=GHibJc30AUFQl862J9b31ZKvTGJpbU6wUIcurZple35fcnUSp+ibMBude6R7uy24idKXFC87Q7EFIUbiriRJjgCGEJlMydnzYtpknFtvtZ1cQes1GKzrt1yrpu0fh5FIUlv/EF3TwyLUqUTDcakdxBLibPDRN09+UDqzEt1usBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092724; c=relaxed/simple;
	bh=l5jbllSffkZja87ivdyNl1y+ORs7ysnvKp+68gP2A/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YgxM59dCFWoHPDDHhbWScQ5FBEsroO/O9v8GBGVxDd3+vSsSqrqNVaciRiE3VfLxRMEDz9qnl3MDMUVo8dbmjPKccrmTw8l366ye77eMjQ9Qo8YOW3K35eS5f0Whs5oftvVVtJOPowjDd7e5dgCSk9E+2x7PFq3rOSyDi4YheLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=bHL1ctfW; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="bHL1ctfW"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53504882980so66582581cf.2
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092722; x=1792697522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ZXWkhkO0GuHPLHyNOS8u6lC0SQSdanwm92zcb2aBF4=;
        b=bHL1ctfW5zk3vgfNseiYdxv+Zs1FD1nuf/l0r3WDyqaXwLiv1IIoBtCflkl4W3oRjj
         nPmhIm7bf3YLBXmJzTvYVnI3PSzY3/lrvrO4d+8XFAe8QKJ7xAlxvURdZsEpmS5BfViE
         q4HrRTIw9uVLMWqyFWa1YJINpzSnrfYlp++ku9JiZ9KYWhvRKIDXdInucPljdOJkEuZL
         1eHFMTOGFi/U/hyqf5B153j8VQzUcOoM2IcNZAoImUk1dXGHWdIOOniUDqeHlEKGkvmI
         bp77zetmYMcPLkpm+DGDGGaAJDxrIFflDeV0Yk6dZRpU+WMofvjrvlP1kGgEmxwdC7GK
         Od7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092722; x=1792697522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ZXWkhkO0GuHPLHyNOS8u6lC0SQSdanwm92zcb2aBF4=;
        b=MEm/qnjjw1KO9sg/jxb7t7YSP54LZMMZ4ugYijCd8Jpi3xS/ZnT6oGXj4pkImQN+FH
         14Yj70szEFFIKGemoU8JzGqTIUUH+72wTvY0bDW0x9xO4TFQRcQs+0Y/iCGstOj4yRqI
         vStFQhW8PB6bVVSZyE64XKtjwb+L4GFRxgkPoZpa8OMqTUzZyA/8lg9dq4yyH4ZOLZu+
         fjpLSwMkqaIVhW/wX6Mvl46CU+ez0ADdaDVtpidsJBvBX7gBvyUL1RWYxIHaczpJFNDi
         U08pM6V5R5r3e8cj/wNJ54fGVrMTmJ8E18wasiP0sd+zhyg7TfMl2G9aOpr8QpKgXgL7
         n3rQ==
X-Gm-Message-State: AFq9FYIIcQVCynuTuWcqdHwNIYc3Y9sEmhnmwuxBHtp68G+G1nANCOcj
	xviFuAUEY+RCtjIQ7ankPbY4ao2gao9NEoNz8u61vJkk+ddXCl03Ht6A9Jc2sGXFSig=
X-Gm-Gg: AYBFou2Em0CdwJ6H6X9r7uuk+RszZHmj6UgixH8wh3PXPam4BQ6Cf+GEBKl/XDKrsfV
	FBqxaAv95GSkO/k3AeRZJvkmUjhGJdxGk32LbTdylI9BtT3Zo4Kv+Ex1w28m3xJ02LjpxpqFFxm
	w+AN+/oOXGv1mwh2Mqvl/ZwssX1bcMzTvrbF7Vbhr+12+f5xOXR0WuFa6dNKdMM+EipV8OkSrF6
	/KtW88iZkjuOzMRBa527CGNTpnwgNmJZKDTT9ryiyHwHINhw86zGAyK07eO2c+KL3+ikpB9AiWW
	6hY5tcBfXQ52X+qQ1sVAseaewrciC6NonKkqr4MMO587EtKwe7cHmN8bZVKNElTv6udGCwLTkBS
	pKde8EwR8AvCwSTA+OMTthl383aE8DA+cSexv5r8mFJSLgFEDdFqQd9ivHkCYHi1lGQCZBPm0e2
	hIj8I433S92F7vCaN90cwesI0LrGld91CLuLJG0LnqaL8L19HIR9wK8aIs3YMWDyzsDulwTvg/m
	BVLnHBVScrpNQNdbOg5O1RsTJY=
X-Received: by 2002:ac8:5d8b:0:b0:535:859c:b6ff with SMTP id d75a77b69052e-5359fac6320mr336634361cf.20.1792092721607;
        Thu, 15 Oct 2026 12:32:01 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362aa19a3asm1404191cf.24.2026.10.15.12.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:32:01 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:50 +0000
Subject: [PATCH 26/43] io_uring/register: handle index wrap when resizing
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-26-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092659; l=1781;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=l5jbllSffkZja87ivdyNl1y+ORs7ysnvKp+68gP2A/A=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDX2XKrKfGoiRAxgVySO8CiCOxOvI1y4fgQrumYK4uYs1EoTyy2s3lGXnZN/mLNIfwqc8B1tBAY
 iqbDWsmCfBgc=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

The ring heads and tails are free running 32-bit counters.
io_register_resize_rings() takes that into account when it checks whether
the pending entries fit into the new rings, but then copies them with

	for (i = old_head; i < tail; i++)

If the tail has wrapped and the head hasn't, that copies nothing. The new
rings get the old head and tail, so the application finds whatever is in
the freshly allocated memory, zeroes, in place of the CQEs it hasn't
reaped yet, or the kernel in place of the SQEs that have not been
submitted yet. A ring that completes a million requests per second gets
there after little more than an hour.

Loop until the tail is reached, the number of iterations has been bounded
by the size of the new ring at that point.

Fixes: 79cfe9e59c2a ("io_uring/register: add IORING_REGISTER_RESIZE_RINGS")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/register.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/io_uring/register.c b/io_uring/register.c
index d7e9963ab9b0..bce4473dc2dd 100644
--- a/io_uring/register.c
+++ b/io_uring/register.c
@@ -604,7 +604,7 @@ static int io_register_resize_rings(struct io_ring_ctx *ctx, void __user *arg)
 	old_head = READ_ONCE(o.rings->sq.head);
 	if (tail - old_head > p->sq_entries)
 		goto overflow;
-	for (i = old_head; i < tail; i++) {
+	for (i = old_head; i != tail; i++) {
 		unsigned int dst, src;
 		size_t sq_size;
 
@@ -641,7 +641,7 @@ static int io_register_resize_rings(struct io_ring_ctx *ctx, void __user *arg)
 		ret = -EOVERFLOW;
 		goto out;
 	}
-	for (i = old_head; i < tail; i++) {
+	for (i = old_head; i != tail; i++) {
 		unsigned index, dst_mask, src_mask;
 		size_t cq_size;
 

-- 
2.55.0

