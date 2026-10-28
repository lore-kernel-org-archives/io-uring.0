Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206062;
	b=X8liSUhWQLiSIFvPvS2pDUXv/yyeIfb9hK2vMJ/2tOe3JX+kw0VLcmizXLhAw3PDiuCx
	 LGkp78TszIHzFxQ+ZBIhA3QhD/cufhWUqnnViCSFJLfwtwF6Yajw5+3vj07+Xv1UXaMJ5
	 n/pETKeNyCzll0wfL3i7k/ZKgXeRH1X3BgSrU+JEjrPh079lsIAUvDzMHrSeFL+CQFxcr
	 duetbFV6dKm2sBGMADZnJEsYQjv3w90FF0J/0BpHM7rhKSjGS3MEJ4uMXd1E5wU6G4dNp
	 TQmQE/VyPT8RtoJD8BEFIg7uk509o7UH46jyjdxP8jaWRRWOfvYQROacNYbS44nlMLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fd5UErdXQbkUuMz5MUmHtV+orNLfJZtkQG/h/s3wuLo=;
	b=jmvaBDwOrJyokV/c3+Rl58+yeBtA2z+K0+XomPuROXXMZISE/GWW92bAwTfqHLyamx/b
	 28oFkys5KshzY+wQYB1+lLclqwPCpn+07vrtB4Oftt8c5Iwf9Knr/M1wDC97e3gF2A0Tx
	 LxKsjYgLwQa4PR4/8IkHtSLS8nP7IeMq2Et3fqaF4l0BRan6fHfbNij57JGh84rDXVt0V
	 AZFcB9stYeYg1QjnAJwhFTG7xn4615yR4Fo4/zIZFMnUxLaHpx4WEzRLg6PPwYhOQtNra
	 EJBi8xrxBKQI57Zv0ZZYNw1jl+lfDjmsk7fe75CQV0L0j9Ydq4q6BL9jUyhL5FqrQtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MblJS07u;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D22C606A33F
	for <io-uring@vger.kernel.org>; Wed, 28 Oct 2026 16:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D22C606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MblJS07u
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-823b938464fso827275a34.2
        for <io-uring@vger.kernel.org>; Wed, 28 Oct 2026 09:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793206061; x=1793810861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fd5UErdXQbkUuMz5MUmHtV+orNLfJZtkQG/h/s3wuLo=;
        b=MblJS07uEmZ2U0Af50XOgEoezv6jLytJlLDRj9ZRFiOm09U5Xt/3A/QurJwBgfkjr1
         kK2r2ydcekcqQOxRE2LStDWur/56he8uSC0YJIXjmEMqeY80/14dOPKAhk2sP3aC96wm
         7QrV95tbb0XybbsoSxQJ8DG2jHr0bGgaKElfAsoEsFYNQ18kGDbzAKCijpsMoADYu1Z0
         YeDiEOOweuC2r/AxNUqLMCApaVvjO71k9m4QDAGW/u+brjstlW69tcshacXCC7qy/7ja
         2B77WaqQcU8CHY9i75MDLivMCK0AfPs+ZRBNo+sJLNP9EZTqhj1rnA30ndlGevD95455
         IyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206061; x=1793810861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fd5UErdXQbkUuMz5MUmHtV+orNLfJZtkQG/h/s3wuLo=;
        b=ii7aXU4zeb32XWgDOgHHrGJhuwyteJ+4WniRdKaF2FnJkTkYt6F+5tDAwEVYEmmQWd
         GVgWGIsgLH0j/+HVQfM19TZrpgtMexqwesinP3U9iPi96eUNJM+i2HNKq10adzfC+bM3
         Exk/w3iguaAgPVD7TYTt/Pdz1cW5cDAzv4AR+jOJ3DWg5FNHWRXKKjYvw7X45AH+tenW
         q6KMMTwfrMkwvNUCIER471B6JJZE01tE83euzw1S0gpAHUyGw1ahC097RE+gM7Lorv8c
         dpWZd5h5Ag/YgxHHJrY2yQv31tlRzknQU84lgUzR0bef/3G6u28aaBL+PMm8SEWKgx/7
         zCXw==
X-Gm-Message-State: AFq9FYLQavnd+sqo2R3hS/o9c5SRl1o7p+9b9x0Q8lWfM2yursRz47zT
	9SS5Ylhc3o5vgaVogbYlMFadXj5ePnB+GWSg7dovaYNdHGPWuz73tzaPkpXzjbqIGyTdgzf5zWi
	AEaXpF3I=
X-Gm-Gg: AYBFou2jNmoCna9JLUDQ5s7I0VL0D/HbnHtTckM46ybwXCZYjgspxxNCYzV6muhwhMV
	gCQ9kYQbao+EE45JRZkIn5A4erW/BkUJeZ5dmF5q3MBuSsITZK0QmKUz8QuTG+/hK3QerUFpKV9
	lY6j6ezLijLimalOBA/BXZKgI9g8PgCAx0eXPjjmD7LvjN0kgYUHMXHS4PDUmn3Mq7U7reNlhYy
	WmFWb2rGOZX79h7BRhVD/+v+BpC71n2t/60ZFgz96vxh+phBPQ8HAXtwGi293Ljmuv4ZJoItlOs
	YpYxFp8P/CeOSjM/6pEqPiw5cznJT48pieHsd8TChDWzqgP/zxAwImEh9xo94ezpXlhQ0yNL3PN
	TPgreaqQuE30Nf4xS6FHRX0EF4uAOJxIl51rcbY/yURyCbJNBCiOFjiKyqBfIGtgoNepo3Y71sv
	RVG1szTvwcQO59to2gXXqWOG+zWS+X9yMJivBodC458ILkwn/IPDZBnNEyvWLVgaQ8748oHZjB/
	aZVK3HHmYz88qII3JsEGVd0Vrf6RjeRlOF0c5giNDWnUkia0P555EFHpRfi2s/HyRBeqCclgdLL
	Q2wn9F0jPE9poYcWMfjc3C8a/os2zP7IrXgAYbRFEvmkmoUMLApT0MDUkWQvzKim6S57T87AuA=
	=
X-Received: by 2002:a05:6830:44a2:b0:81b:a5aa:e82b with SMTP id 46e09a7af769-85ab996d1b9mr2378914a34.24.1793206061195;
        Wed, 28 Oct 2026 09:47:41 -0700 (PDT)
Received: from xps16 ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b206f8a41sm2019182a34.25.2026.10.28.09.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:47:40 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: Chris Mason <mason@kernel.org>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 05/10] io_uring/bpf-ops: clear bpf_ctx while submitting SQEs
Date: Wed, 28 Oct 2026 10:46:53 -0600
Message-ID: <20261028164732.1264069-6-axboe@kernel.dk>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028164732.1264069-1-axboe@kernel.dk>
References: <20261028164732.1264069-1-axboe@kernel.dk>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Mason <mason@kernel.org>

bpf_io_uring_submit_sqes() calls io_submit_sqes() from inside the loop
program, with current->bpf_ctx set, and requests issued inline run with
it set too. The socket code uses has_current_bpf_ctx() to recognize
calls from bpf_setsockopt() and friends, where the caller holds the
socket lock and has already been vetted, and skips both.

So a SOCKET_URING_OP_SETSOCKOPT from the SQ passes sockopt_capable()
without the capability, and runs without lock_sock(). A task with no
capability can set SO_MARK, IP_TRANSPARENT or TCP_REPAIR, and two
threads changing IP_OPTIONS on one socket, one through the ring, double
free in no time. SOCK_DESTROY via IORING_OP_SENDMSG ends up in
tcp_abort() without the lock the same way.

Clear the run context around io_submit_sqes(). The SQEs come from
userspace and must be issued like those of any other ring. They still
run inside the program's RCU tasks trace read section, so a request
that sleeps there holds up that grace period, but other request types
do that already.

Fixes: 890819248a86 ("io_uring/bpf-ops: add kfunc helpers")
Signed-off-by: Chris Mason <mason@kernel.org>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/bpf-ops.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/io_uring/bpf-ops.c b/io_uring/bpf-ops.c
index cf2bd068e331..6c2a587fb1bf 100644
--- a/io_uring/bpf-ops.c
+++ b/io_uring/bpf-ops.c
@@ -17,8 +17,22 @@ __bpf_kfunc_start_defs();
 __bpf_kfunc int bpf_io_uring_submit_sqes(struct iou_ctx *loop_ctx, u32 nr)
 {
 	struct io_ring_ctx *ctx = io_loop_demangle_ctx(loop_ctx);
+	struct bpf_run_ctx *old_run_ctx;
+	int ret;
 
-	return io_submit_sqes(ctx, nr);
+	/*
+	 * The requests come from the SQ, which user space can write, so they
+	 * are issued for the task and not for the BPF program. Hide the run
+	 * context of the program from them. The users of has_current_bpf_ctx(),
+	 * such as sockopt_lock_sock() and sockopt_capable(), take a context for
+	 * a call from a BPF helper, whose caller holds the socket lock already
+	 * and needs no capability.
+	 */
+	old_run_ctx = bpf_set_run_ctx(NULL);
+	ret = io_submit_sqes(ctx, nr);
+	bpf_reset_run_ctx(old_run_ctx);
+
+	return ret;
 }
 
 __bpf_kfunc
-- 
2.56.0

