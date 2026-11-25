Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632296;
	b=OjiEpHSvC4twFK5wn2hO3+jkHrX/UeYf+nxOw4owPDb60x9Thls6jSd4EqSxjxHbVYHy
	 7adjOZ95aSSO0vyEnj9P0FcHczvU7EW8l2bZGud5AKmnbtUQEf0opLeLmVP5p1BRAAsnw
	 QKD6hx3AMnoJt8UnByfyRwYophADli68couzeMAA0pwv66IIgjWI4ZgTFX6T6yzRsQ83D
	 sQ/Uv0MZasVS2kt3bgiPjfXer8bln3vUPy53wtTr3YAlZFp0Ahgyyj3UrPYcKJLJ9qize
	 EbePBTYhUu9CKG5X94hpO2nB1pdUE5vWPr79fj2sguVh/jlucQCaE+buDy8oEk77G5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a5rJScEvhNMt1brRokq97ALu8dB556VnTLwbExVZgcI=;
	b=FrJe1YQ2Zm43jF6vkrB6HOlSBBR+n7m+XrLzoWqXTSVs5IYLyxND91Xan/aS31eX23eO
	 +XxTv7ftxdhvMXh+RdGYL0OIQOJVWX6MZq8j/NAd1viJHjnhAEEuPtFA6MYlvM7752MIP
	 9UUEfffcjMN7hS/pNvlwF7Kygdf/uMD/8lLj+nxatqrSbfoWLTfVLbR4W9HjqnV66qjNy
	 C4AHJWDscL/v1xbB/5vIpTrSMBl6LtfJSoYw7TZGEo7mgcfh72ur3OD0wfd7WUaL0AXge
	 G+kdh/x9EitdVHwiqnDj3dqaw4Lsk2DPZXAWNUllOaMpBg1CQkwdc8NzgoRtbM5hBmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=lJmqXhmb;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F26A606A326
	for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 18:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F26A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=lJmqXhmb
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-71aea92f666so4012368eaf.2
        for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 10:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795632295; x=1796237095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5rJScEvhNMt1brRokq97ALu8dB556VnTLwbExVZgcI=;
        b=lJmqXhmbGAES/nC9M7ipHNQ1FG+VMZFRoyvsaOdUfHJtscn2k2YSYUFoLg0BTr/TY0
         6f+GKVOax0yazONlYIbzZKE+C87PDwFw5V0f48WZnALUrJctwS40yJ6HxLgiRMpSuYKp
         OkZBsTRjPxWOt+hiJbb0USjarpiNJvAmlOELT6sUhJHxqxo0Grep5KKNO9l5oibVtkKY
         nHRlqqJkG17B0awW6DgYR8Eu9A8DAxvkN0FKAwfBQStFFmnh0He+HAXRspwVNNeZyXx+
         w2TIUeMNCn5+Rpvoeb/HhIVxR9n9Ntpk/CyRPHoR1Sl+tD054ZRK6jkIZqY9x3kSlVLP
         /SSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632295; x=1796237095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a5rJScEvhNMt1brRokq97ALu8dB556VnTLwbExVZgcI=;
        b=ezaOGXgiOIs8ZvCKj7N1s4ntMWTcgDiZZRIBW5dfk0vxED23aHa/bRCLc5duvYjosx
         HnccTB8yyt55yHwibPh6GqWiReiBQ4h+FDZeBkvRHe48khoda1rr9cr6qBtNcXHhQ1D9
         tiSYRbZcvuKXaHv9+YQgGmaxjqSMK3cQXZaB09qSjGP7rK7hFmA5S+Q8z6Aaw5ibyUuq
         fGpoPfEl1iKArcTQPcd2mD7VhuA8hQe8ZLmVi12drbEJ/YJy5W/WAawctJ/1BGXIbLDL
         OZ53QiERKzkGHUd4CCpBjx6sk4dpmJ8J5WdoJ6EEZ2HwxS29342mr6/bGnSiNALRUfEU
         hxzw==
X-Gm-Message-State: APuU4Z9JCZVF7T/ZgUSDl3vS7gYnlRhCsKy9OoEpF24eFTm9zcjNxt5U
	et9147RdnN0uSZDPAGS6JhPZDzaRhAHtqd6TaXQ9mZ/SNJ5Y6cWjwg2c9yPzPiCTcrTSM1CSJCd
	+bON30wQ=
X-Gm-Gg: AZFdTZfjKxMkTum91PUO24NU+67eXjv33PYQztgyVoquE7eBBw+Xc3mKN/0RX+wXLPP
	P5g5sI1IP9zY8ygl01AmDKe/Q3Q5eKivXPYjVK96pn/sIRarevLRB28xX7hjpT5n467XcqJUB25
	BE2QYmPaNVAHIeykIA4UGZMCBTDulfppcgtO3LEA4tgTbdBWWJG5Fzcu8F2stU5KzB2pdmG4z90
	18W9VR23WfOOVMpbu1iKgpSvKN4EjnFRN3W0XnL/nlr/ZVhbwTPgPps4n86Cd3N1qv79uvVH8YC
	1TbZh1A14jKf5UWwmcwA2VJYDFQqwvJNgwcG0AJRpOZeOfc/sFEiBmJsr0eoN+jCPh+VYcQdsOD
	bSlrYbYPhKORO4D9BMFo5PVowEIo3xbEyLr4WPP3VcnKOPUATC7yDOEaLKS1ng7ByK4J9FacvWb
	y+IAJka4Wqat/SokRBbobQFWEAiFUiZeZ4ONDlRkzJwnL15WjK5h/s+ZSmmq6RL8WBfbFD1D6b3
	J5+IaRh21uGw+/WY3J5YU/DtFIX8mik4fE3mn0bjIWSXhov/q/AME4HZRwaHORprrfv8fa1gGVN
	JavzDg7eo7VnmYmJ03sRFVEc+H43gSOBUj1dSzzlG6B2Vq+KEdSSaaFBgBd8t34cDvic3WSq7rs
	JKp4udTqlV8ekQlcev5p6nv088FKwffUbZA==
X-Received: by 2002:a05:6820:3404:20b0:6cd:3fbd:1d61 with SMTP id 006d021491bc7-71b39581b7bmr10370746eaf.75.1795632295595;
        Wed, 25 Nov 2026 10:44:55 -0800 (PST)
Received: from m5pro ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b37c52ae6sm12332828eaf.0.2026.11.25.10.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:44:54 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: Chris Mason <mason@kernel.org>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 10/10] io_uring/net: restore the cmsg buffer on recvmsg retry
Date: Wed, 25 Nov 2026 11:43:19 -0700
Message-ID: <20261125184439.58077-11-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261125184439.58077-1-axboe@kernel.dk>
References: <20261125184439.58077-1-axboe@kernel.dk>
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

A single-shot IORING_OP_RECVMSG that is retried after -EAGAIN can report
the control messages of the failed attempt, and hide those that came
with the data. On an AF_UNIX stream socket with SO_PASSCRED, the caller
gets SCM_CREDENTIALS with pid, uid and gid 0, and never sees the
descriptors that an SCM_RIGHTS message installed.

io_recvmsg() passes the msghdr that was set up at prep to each attempt,
so a failed ->recvmsg() has to leave msg_control and msg_controllen as
they were. recvmsg(2) doesn't depend on that, since it copies the user's
msghdr for each call. unix_stream_read_generic() calls scm_recv_unix()
whatever its result is, with a zeroed scm_cookie if the queue was empty,
and put_cmsg() advances the control buffer. ____sys_recvmsg() then
counts the reported length from where its call started, but the caller
reads from the head of its buffer:

    msg_control = C, msg_controllen = 64

    first attempt, the queue is empty
      put_cmsg(SCM_CREDENTIALS {0, 0, 0}) at C
      msg_control = C + 32, msg_controllen = 32
      return -EAGAIN

    second attempt
      cmsg_ptr = C + 32
      put_cmsg(SCM_CREDENTIALS of the sender) at C + 32
      msg_control = C + 64, msg_controllen = 0
      put_user(msg_control - cmsg_ptr = 32, &umsg->msg_controllen)

The fix used here is to save the control buffer before each attempt, and
to restore it if the attempt fails with -EAGAIN and will be retried.

The tradeoff: with MSG_WAITALL, a retry whose control buffer the failed
attempts had used up went on after a short receive until the data buffer
was full. It now completes short, as every recvmsg with a control buffer
does since commit 78d0d2063bab ("io_uring/net: disable partial retries
for recvmsg with cmsg").

Fixes: e54937963fa2 ("net: remove cmsg restriction from io_uring based send/recvmsg calls")
Signed-off-by: Chris Mason <mason@kernel.org>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/net.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/io_uring/net.c b/io_uring/net.c
index 9c69f37cb8aa..b0d508b772ce 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -1047,6 +1047,8 @@ int io_recvmsg(struct io_kiocb *req, unsigned int issue_flags)
 	int ret, min_ret = 0;
 	bool force_nonblock = issue_flags & IO_URING_F_NONBLOCK;
 	bool mshot_finished = true;
+	void __user *control;
+	size_t controllen;
 	int consumed = 0;
 	size_t len;
 
@@ -1084,6 +1086,8 @@ int io_recvmsg(struct io_kiocb *req, unsigned int issue_flags)
 
 	kmsg->msg.msg_get_inq = 1;
 	kmsg->msg.msg_inq = -1;
+	control = kmsg->msg.msg_control_user;
+	controllen = kmsg->msg.msg_controllen;
 	if (req->flags & REQ_F_APOLL_MULTISHOT) {
 		ret = io_recvmsg_multishot(sock, sr, kmsg, flags,
 					   &mshot_finished);
@@ -1108,6 +1112,12 @@ int io_recvmsg(struct io_kiocb *req, unsigned int issue_flags)
 
 	if (ret < min_ret) {
 		if (ret == -EAGAIN && force_nonblock) {
+			/*
+			 * Don't depend on the control buffer being untouched, a
+			 * protocol may post a cmsg before it finds no data.
+			 */
+			kmsg->msg.msg_control_user = control;
+			kmsg->msg.msg_controllen = controllen;
 			io_kbuf_recycle(req, sel.buf_list, issue_flags);
 			return IOU_RETRY;
 		}
-- 
2.55.0

