Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543574;
	b=fvhmlt39XWlcwPBgsF3AMsbIEYVgtBZTBXtqnfL8s0flveKy8qhM8y/QhwhE6Xw8G/l0
	 qU5IbrX5PvS3aETQL6639I3AHmBEA/QWsAu88wHe9SIJMKn/Wwll5Ha6OrVf/BCYTj51g
	 MCSB3jYa2BWjPl+XbwkpH3G4LIIXpeyiDMql6OyNaNLMYSzSBcM7pSihizntfi3h8zWOB
	 9mxbB2j9ZQYcmiqs+2QgfBBFZPmAm8XM0KdIgioVPBAdjZ2ueyfQqtHgyBmSruIjiPqT6
	 fKwk6GlsRfl2r6kvYyGXQINm81oxHNGCj01IF1INr+BF/IMy9AOpXDbNe/4qgDRA+tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=WHGYAXTX1DTRVyN+Jnw8SurTp1dmWaYyLMxzjF+q34Q=;
	b=TTnqH+x58SZRDqzbCsfNSYD0i738uvvDxfS4IFJ2n1fAMz51/i+dUctGILybvTY1FD5d
	 zj/6JrLShWfjgc5Wm8P+/WAms01loWCQVS1D6RJ8b5Lgd6l3s8Kk4O4dOPu8gKMbxyibu
	 6mJfu0REw/7D3kmwXueQZzm6iXXHTuzWAvNmG8B5ZY7wkF08fSMu3uBvvchKqICGS224a
	 MfrkztI8+pIuXVdUE4A0ZhJNc0AC/7UghRK2jQLrzrEaqQl7mVjb09WefXg+WK26zO9eu
	 5cJWZV2IAYp6UNA7iSVOuX/21owfH4VaAADz14c2iFm2LfbOWwAr/nAo3GTUBeCuGNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="aM/5VYZE";
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E846606A69F
	for <io-uring@vger.kernel.org>; Tue, 24 Nov 2026 18:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E846606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aM/5VYZE
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4b9f8c66f72so4659595e9.2
        for <io-uring@vger.kernel.org>; Tue, 24 Nov 2026 10:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795543571; x=1796148371; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WHGYAXTX1DTRVyN+Jnw8SurTp1dmWaYyLMxzjF+q34Q=;
        b=aM/5VYZElptpI2v1UN15tQ1uCbO1osWxcZm3gAHX/+GRIBoRiAHtOsoU5GHFNcLvug
         +dEnBLnkoDEj9LApRTVc4xDB15Rfcis/Dq16BTHsqDi+RaHvSo6M+CAqnfNMm2fW58yJ
         zilynG02kzu8W/zmVwOGxFNy2XLV9TN26NNzw+pGclLgtTmMxloXteQk/RXyZ3KoeRDQ
         7tdxtes+sYlJC8UWiu9ZqazUmvtT4Ul9jHQu8Oc3rL2A0JbXVcvDiVtHWLY+LIPHz6oO
         M0pCI2uEoEBZBXllBIEweD1+FdYKR/ZCZd13lWMtlJEmeeH1kYH16jibGLD3zuI6UWfC
         oTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543571; x=1796148371;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHGYAXTX1DTRVyN+Jnw8SurTp1dmWaYyLMxzjF+q34Q=;
        b=XMqkzuDRR6/kMHZuY+ipo7ZTfODOgB0pRKlq66BQBqQ0snhNxJrFWcdDPmWdCviAqD
         fDXZoaLTVkA3MGaOtuM9En3lCqLiwUcQGEOgpNkRKDvAWdEm4N+kxHjEaRXzqLnWzkQY
         nG/rahft+13IeBrSNHOt3bApePmxAnWgjgwiPi8EDvuMA2rJCti9N/uOPo1kV3OCHr3h
         M71Y2sj2i+JKn2JzWERcACRlYRg3wmXig1mUGHZ9ZgH3Ct+ckt5EZwU1mm2I2Qzhxfr6
         SgfOdrjsZ7od2y8MioozYl7NOXtaqM1woRg+rvVX+LTmYrnkpGzQktU61mikqKFIvRMN
         tYaw==
X-Gm-Message-State: APuU4Z9UQi1wWHlWVhP4U/cqzA3iqxr248AsGc2knSzXqyJVnWUdkxRW
	nFM6VP9h6SiXKYec8EWTgaamY4rYHe2MoTHJJViiORC9CAKyfh6N2JFOH9UFl0PuYFh9Mn6cQA=
	=
X-Received: from wrpy18.prod.google.com ([2002:adf:f6d2:0:b0:49d:572:f312])
 (user=dmnk job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e0d:b0:4bb:5f07:10d7
 with SMTP id 5b1f17b1804b1-4bb8882445cmr306751535e9.26.1795543571272; Tue, 24
 Nov 2026 10:06:11 -0800 (PST)
Date: Tue, 24 Nov 2026 18:06:10 +0000
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.663.g77904e546d
Message-ID: <20261124180610.75208-1-dmnk@google.com>
Subject: [PATCH v2] io_uring/epoll: support fixed files for IORING_OP_EPOLL_CTL
From: Dominik Maier <dmnk@google.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, dmnk+artist@google.com
Content-Type: text/plain; charset="UTF-8"

IORING_OP_EPOLL_CTL already goes through do_epoll_ctl_file(), and
IORING_OP_EPOLL_WAIT already resolves the epoll instance via .needs_file
and req->file. Mark IORING_OP_EPOLL_CTL as .needs_file = 1 and pass
req->file directly to do_epoll_ctl_file() so registered epoll instances
work with IOSQE_FIXED_FILE instead of ignoring the flag and looking up
sqe->fd in the normal descriptor table.

Suggested-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Dominik Maier <dmnk@google.com>
---
v2:
- Wire up .needs_file = 1 and use req->file so IOSQE_FIXED_FILE works
  for registered epoll fds instead of rejecting REQ_F_FIXED_FILE (Jens).
- v1: https://lore.kernel.org/io-uring/20261119192223.2659961-1-dmnk@google.com/
 io_uring/epoll.c | 8 +-------
 io_uring/opdef.c | 1 +
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/io_uring/epoll.c b/io_uring/epoll.c
index 4fb04d4b9136..349bebdb0298 100644
--- a/io_uring/epoll.c
+++ b/io_uring/epoll.c
@@ -14,7 +14,6 @@
 
 struct io_epoll {
 	struct file			*file;
-	int				epfd;
 	int				op;
 	int				fd;
 	struct epoll_event		event;
@@ -33,7 +32,6 @@ int io_epoll_ctl_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	if (sqe->buf_index || sqe->splice_fd_in)
 		return -EINVAL;
 
-	epoll->epfd = READ_ONCE(sqe->fd);
 	epoll->op = READ_ONCE(sqe->len);
 	epoll->fd = READ_ONCE(sqe->off);
 
@@ -55,17 +53,13 @@ int io_epoll_ctl(struct io_kiocb *req, unsigned int issue_flags)
 	struct epoll_key key;
 	int ret;
 
-	CLASS(fd, f)(ie->epfd);
-	if (fd_empty(f))
-		return -EBADF;
-
 	CLASS(fd, tf)(ie->fd);
 	if (fd_empty(tf))
 		return -EBADF;
 
 	key.file = fd_file(tf);
 	key.fd = ie->fd;
-	ret = do_epoll_ctl_file(fd_file(f), ie->op, &key, &ie->event, force_nonblock);
+	ret = do_epoll_ctl_file(req->file, ie->op, &key, &ie->event, force_nonblock);
 	if (force_nonblock && ret == -EAGAIN)
 		return -EAGAIN;
 
diff --git a/io_uring/opdef.c b/io_uring/opdef.c
index cf3aa2242cd7..f23f11ff356e 100644
--- a/io_uring/opdef.c
+++ b/io_uring/opdef.c
@@ -313,6 +313,7 @@ const struct io_issue_def io_issue_defs[] = {
 		.filter_populate	= io_openat_bpf_populate,
 	},
 	[IORING_OP_EPOLL_CTL] = {
+		.needs_file		= 1,
 		.unbound_nonreg_file	= 1,
 		.audit_skip		= 1,
 #if defined(CONFIG_EPOLL)
-- 
2.56.1.831.g720f3f5937-goog

