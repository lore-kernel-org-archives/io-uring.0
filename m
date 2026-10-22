Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792711284;
	b=qvrMktfIbwCII5ewzkse+F2lCnazUQ/tfTO4/OWjZ3WzKeJ5nENrUbMNMcQSUimxfQr4
	 EfgXFutkkyIp2LkJBKA4kqbUCQBcKwy5p5Hx0AGNubxqPgL0qrQnJKEz85aOSNbEShAml
	 bSbhT/6h3VWoQS6fpmN/6UIm1yOcOhpNglB+xHlcpR4yCemkvdOWBhRjtXK5ogQ+bbyJu
	 dGijITy43Pp7wXOJFPzfbJ8pMMxR6LJhkNVxyneXdsk/lONgAdk5YpvHFwuoXjZXT1Rfe
	 g6ysoOZSHG8Ue3vQBYQx9yN7V9fe5bEpSc9X11RL5g4XMuPW+RwzmrLZ5ZPYlgbxHRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792711284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=OhB3GDRw8d5cRY9z2D4vphubhUsoZarSV8LxVq2K+Hk=;
	b=V1bmqMcDNkS2o8OUhKs1LHFYWlIFoMzWSO9MiYZrogteWH0FQGcZjNiFFVZXQuBvx4hU
	 pKhQGVk/oLgCLDEhNopbrQqcdCCnhYRpQJlAdEZMM8HaQe4LXnFEr687qN7XUqrrJWAZP
	 CilRVLdUqhqhMc0dx43XEcTcWYcl2rhaMn/CM3KYLSJaItQc5FoMsgc0AAX8NyrkrZ4bV
	 I/jhpIHLkZAx2v8nCdf2cWDZzoTLEj7DDW4gbmxfiXwFGGkB4FzCOhiuVbkEGt3U8pfzl
	 1ii8jNVqK1tgmxZEYgv2FNVkgHUejgRUxbDYcAFilqXbQJpACKyCp7ZJMyhvWgWfICg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=elZXSmBA;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68682606A319
	for <io-uring@vger.kernel.org>; Thu, 22 Oct 2026 23:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68682606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=elZXSmBA
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1f03f2e8aso1979585e9.1
        for <io-uring@vger.kernel.org>; Thu, 22 Oct 2026 16:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792711283; x=1793316083; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OhB3GDRw8d5cRY9z2D4vphubhUsoZarSV8LxVq2K+Hk=;
        b=elZXSmBADJP27Ln01A27DyJBEt5JSFK1E0MC5T8p8gB8SNUc6SXuXjMvvCb5xSQRNw
         O16RfzpVUZT7Yaoz9AIdgELh/6o9wW+gqncwZRJMkvjGSd85H+I54zpjV6RGeKMnN93Y
         Udok4LANe9O+SeJMjuvgWRPT5ouV21ropvuraa6cZX18NlR434Y1uGLuuabG41Jvjy4C
         mZzH/OeymK6LUWqD+Q8ZRceZugH0EHgXxfdqWaL5B+XabYXcCCyYrtELyJS8v5Vt34M6
         yYEuAUz8j6EZUrLmWusTHHHZFzKr82rdCtUuAQ/3UreuzZ2+Xqmt+a8tGNILFe881+Yj
         jinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792711283; x=1793316083;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OhB3GDRw8d5cRY9z2D4vphubhUsoZarSV8LxVq2K+Hk=;
        b=rd8X/os/zLYlaV621KpYzfYrVeUhi5cRIJIHiRonrfJlRsIc6Phb50sObP8K6oERPL
         gPDlDeoEC1b7JWT5Jk3ebXNWMCgjCnJDOZEhxPwBwzMmBu8z6VvILh5u6JST73IIgXjS
         sx+C8zlqKAWNPB8BrGXYNz6tNhsWXXjaG+Il1k+UP1Y3k1xZWMrPxtrmTXbJj0VBqG9b
         s8nNBgW8g0NkqxBmxOJs+vfkGb+j/G8ltPj/u+lYRKr0y3XsR9d9PtPgP+Ly4tlqnJ0i
         qd6T9NsKtoHILyRInNwSkBVmpFc8lYY60HpUUej4TFW207dg3n0EZvIjvGpQ0rv5Pb9R
         rsXg==
X-Gm-Message-State: AFq9FYIANhVr19T6+MaqJ/NIYJNhP/wTjisVxxglcoyCp3O5t1hDzCdm
	Ug7Oo6uDqlxNGnzcjibqUCCsIeKRdpWBkcJ5ZTZ9aG1NenwHb+0VSVMBJ9viU0T58XKl6F8BDg=
	=
X-Received: from wmdd7.prod.google.com ([2002:a05:600c:a207:b0:4a1:c221:789b])
 (user=dmnk job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a403:b0:4a1:7c56:d4e2
 with SMTP id 5b1f17b1804b1-4a211dd987dmr6948775e9.16.1792711282711; Thu, 22
 Oct 2026 16:21:22 -0700 (PDT)
Date: Fri, 23 Oct 2026 01:21:21 +0200
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022232121.2538616-1-dmnk@google.com>
Subject: [PATCH] io_uring/register: enforce per-task restrictions in io_uring_register_blind()
From: Dominik Maier <dmnk@google.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, dmnk+artist@google.com, 
	Dominik Maier <dmnk@google.com>
Content-Type: text/plain; charset="UTF-8"

When io_uring_register(2) is invoked with fd == -1, it dispatches
directly to io_uring_register_blind() without checking
current->io_uring_restrict.

As a result, a task with per-task register restrictions installed via
IORING_REGISTER_RESTRICTIONS can still invoke blind registration opcodes
such as IORING_REGISTER_SEND_MSG_RING even when those opcodes are not in
the task's allowed register_op bitmap.

Check current->io_uring_restrict->register_op in
io_uring_register_blind() before dispatching blind registration opcodes.

Fixes: ed82f35b926b ("io_uring: allow registration of per-task restrictions")
Assisted-by: ARTIST LLM
Signed-off-by: Dominik Maier <dmnk@google.com>
---
 io_uring/register.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/io_uring/register.c b/io_uring/register.c
index dab3eb4258df..5b26a5eddf3b 100644
--- a/io_uring/register.c
+++ b/io_uring/register.c
@@ -1010,6 +1010,13 @@ static int io_uring_register_send_msg_ring(void __user *arg, unsigned int nr_arg
 static int io_uring_register_blind(unsigned int opcode, void __user *arg,
 				   unsigned int nr_args)
 {
+	if (current->io_uring_restrict &&
+	    current->io_uring_restrict->reg_registered) {
+		opcode = array_index_nospec(opcode, IORING_REGISTER_LAST);
+		if (!test_bit(opcode, current->io_uring_restrict->register_op))
+			return -EACCES;
+	}
+
 	switch (opcode) {
 	case IORING_REGISTER_SEND_MSG_RING:
 		return io_uring_register_send_msg_ring(arg, nr_args);
-- 
2.56.0.257.gf7497c7d27-goog

