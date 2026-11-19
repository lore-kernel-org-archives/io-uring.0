Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795116146;
	b=tFLcECJo2HxdT0l0VUZdujpfPRXALqd7gOlNxiAp+U5onQNO62ZsIO/gEAOA1Y6vCeTD
	 G7zdUwlpb0YqfzAsl6d+9ghBTqTQt7EVp3g82el7Ff1lL7rtAN3UOwbFGomSBZvbbmWEb
	 oCkHZlQZwrr/Oa/Qi3MN6z++hqHC+k7JvgJQWF/cfJxAyiIXctb3V9S7NBOgLARGh2iMK
	 UgsUJ1ANbfJAJ792SHvmcLf2moZ8u66dMHVLT1Snxg1LhmuFbx7yO/wZ180Nsj7EZu8xZ
	 qYBpF+85QiKRlpw0J9+NpCGqOKyJ3lfbkrTMEDZCQAprrz4rNvdMc0RY7a8tpE5nXng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=nUBgZOt2IJ67Wrur7DZ7iPFmfutOTQnShU8xa/Daxlo=;
	b=ozG99WVrTtI7ux+FUUSouAQfMUDRvUYudsrqUQy9DyMrY80IjSM9lwnbfu1FMXp/CU4k
	 p69j14L1o54fnlh8gZXCfDIkDkl9cYwVLF8VhFbON+oCvlgXa6Sx5wmCDhEmxRXbIisc+
	 x7gxydClEjNdQoTLuSpU6N02WVMaNUASOIP7G8m8fvtXWQR1JBkddiBF2ivMaW8Z9nxsi
	 92hY/9uYvwNnOJdEH9mO0IWaZ/kuWyXnr28tp7h7hfkRx+EevBl6vSOhsYomWy29amFps
	 0XbkxVN8cyF3ZsuB/g18dL/sz9Otg6oF1KplR/H4EVj9sRuGlCS2ya/NSCf7WlfB7wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="lw/xdbf2";
	arc=none smtp.remote-ip=209.85.218.72
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A17606A330
	for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 19:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68A17606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lw/xdbf2
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c50713860c0so13687166b.0
        for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 11:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795116145; x=1795720945; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nUBgZOt2IJ67Wrur7DZ7iPFmfutOTQnShU8xa/Daxlo=;
        b=lw/xdbf2qD8x3s8kAyMWyE1PJHWBTnMuA6cw/I41s3wz+ChRQnFMqLlWae09SGuexW
         hkVsuGCwSS5tNfoGc87cXM0rgVN2pkBzDfWsExmu46z2KljXhyysz/Cla0U1O3z08vTF
         GZXkoRMKQvKB7hYLiqU9wdvE1OqHje/Ff59Ge0n9nrHB4TT3xvo1aEPEfJG2kRBa172h
         4HZRuI3boNsDG2hieVVhILoI82e6BojbszuN40WXP+TpsrlZzRMkEsruP7QeGVXfIr/5
         nxcdFHmRik8Ri27QXBswG6h1fkAdyV72IJzTjuSrG28h2aSiPaZPom4FcEhH+4N9NWCI
         seTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116145; x=1795720945;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nUBgZOt2IJ67Wrur7DZ7iPFmfutOTQnShU8xa/Daxlo=;
        b=a7uwdaI4/t7X7VWsTg+XPm9ARUhM/BZHzjg7+f8o5xClXlBy1wfK88aLRgetXnCvso
         Euksd57a/N3ID078VOzmrqV5jKfA1BLcgv6SHYxIRxPY+D0BI3vbkXhUSZ6b8gZT/X0a
         2QXvhSFAhu6peftUoY1Xf0nHkI4lPIy63/GzjSkyq2Hi0qf94fFN/oknIEFwD5FmEUAA
         NENO3VabANhY8EusGbeS5MRWdP/IUnDXPMC+sew/9UDQucmBjNyUbtKfSpHrxc5RQph+
         rE2/t3rpGzvhs8ZctsO8PzPsGxTKZjGpPp47oIU/m7PySod0+e6S3A+0yNVESdE6Yfy6
         rF6g==
X-Gm-Message-State: APuU4Z8jrBGnR4bpAw6M8EoAfl7dyKAwm+I7rX5GJE1DEaUNUMF9WEFJ
	k18Rhb9KQQTeosdXE1/J/pkci+bzbj4AKlKLlw2mLuPmNHWpE1JQIODvqZzcm31Ji1aJHdli+Q=
	=
X-Received: from ejbkt13.prod.google.com ([2002:a17:906:aacd:b0:c50:5cad:433f])
 (user=dmnk job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:6992:b0:c51:24ea:2bd
 with SMTP id a640c23a62f3a-c513ab00b56mr73720366b.39.1795116144634; Thu, 19
 Nov 2026 11:22:24 -0800 (PST)
Date: Thu, 19 Nov 2026 20:22:23 +0100
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119192223.2659961-1-dmnk@google.com>
Subject: [PATCH] io_uring/epoll: reject IOSQE_FIXED_FILE in io_epoll_ctl_prep()
From: Dominik Maier <dmnk@google.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, dmnk+artist@google.com, 
	Dominik Maier <dmnk@google.com>
Content-Type: text/plain; charset="UTF-8"

IORING_OP_EPOLL_CTL does not set .needs_file in io_issue_defs[] and
resolves both epfd and fd directly from the process file descriptor
table via CLASS(fd, ...) in io_epoll_ctl().

Unlike the other .needs_file = 0 operations (such as openat, statx,
xattr, and fs helpers), io_epoll_ctl_prep() does not reject
REQ_F_FIXED_FILE. On a ring configured with IORING_REGISTER_RESTRICTIONS
requiring IOSQE_FIXED_FILE, submitting IORING_OP_EPOLL_CTL with
IOSQE_FIXED_FILE set passes io_check_restriction() while operating on
unregistered regular file descriptors.

Reject REQ_F_FIXED_FILE with -EBADF in io_epoll_ctl_prep().

This issue was discovered with an AI-assisted code review tool (ARTIST)
and reproduced in QEMU/KVM on an unmodified v7.4-rc3 kernel without
kernel modifications or error injection; a standalone reproducer is
available upon maintainers' request. The fix was compile-tested with
-Werror and checked with checkpatch.pl --strict; an equivalent fix was
verified against the reproducer in QEMU/KVM.

Fixes: 3e4827b05d2a ("io_uring: add support for epoll_ctl(2)")
Cc: stable@vger.kernel.org
Signed-off-by: Dominik Maier <dmnk@google.com>
---
 io_uring/epoll.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/io_uring/epoll.c b/io_uring/epoll.c
index b9db8bd..7de4a9d 100644
--- a/io_uring/epoll.c
+++ b/io_uring/epoll.c
@@ -32,6 +32,8 @@ int io_epoll_ctl_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 
 	if (sqe->buf_index || sqe->splice_fd_in)
 		return -EINVAL;
+	if (unlikely(req->flags & REQ_F_FIXED_FILE))
+		return -EBADF;
 
 	epoll->epfd = READ_ONCE(sqe->fd);
 	epoll->op = READ_ONCE(sqe->len);
-- 
2.56.1.750.gf70dc682cf-goog

