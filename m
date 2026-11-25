Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630102;
	b=D5Bdy2kAeAIH1VfDTH2q3H7md1+zGZORD0BMfHWrFazYSx+IXK3DHJpWz/Ny6pxoLzGD
	 ZINGFbkYMV82njwWgGeEwZKSbuPstdrIL93CbQXK0PNQkgls2o32zjLeZzQ7iCphiDyi2
	 6MfV8dWQS1Ed5yQjxg4MurMhBvlDab6Py+1sr7Ers487aIaoqeRouLao2oPh/cpUJF/yP
	 9YZ0R0177skwt8WYGQxiOfdFhYhksu39+t9P5W9iUewGP0OqtCiUFntYUxOYzlRqr7KvM
	 S0Wkn2GcO1zwMhIkqiPBLFVqNltq7BbaO5jHoaeDFCTW4SXj0bi/WvVEQwK4TuTG81g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dHM8QuM6MY/pSqOPOop7gPxP9CND5feIuBhfsBIhnlk=;
	b=JrUo2NJ9NPR8o0iKtxvlrtLIL1O/G2Wtn11UM/k9Ox5PC7iuOpozbtZ9vJ4BA46lXUKJ
	 w9X5lCbIP9tN1ooMXGqzBWvwu1vWXr+9d8XgDYrHfpB7zsydqpFxOtMsxCkjqdW0RbRp5
	 Xc9VlU5BGeJh1pv3yPtK3Y+Jc+qm6jhkNcmopLhZnp8rAKh1tuXMit7ezwslelAL2SDAb
	 cuOAGycN2H8aY5hMOAGcwcTdWhY8qqQ0k0puzpyZEMfeZ2m4BxKs0Fvy+bV1co2AqQQaL
	 /CYK0Vv/U87gRIqtEiA6KS+yx++APQRUsEGfqgm9fIkf+mDWLUPYQ2ID2cInxUX8pWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=Pw1yTcSe;
	arc=none smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5EF606A329
	for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 18:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C5EF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=Pw1yTcSe
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67dabd38cdfso6166244d50.2
        for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 10:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1795630101; x=1796234901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dHM8QuM6MY/pSqOPOop7gPxP9CND5feIuBhfsBIhnlk=;
        b=Pw1yTcSew1tJWPymC+EtTRZkEr+5tKy29+ynnVbyUao6v1cTb3h2c86QP8jy2LO7iB
         v3EGy9XAL8lNHqht6WJpIjOhlALmCvzgkursP11zUP4ceia2Bf5Px8hg00FFcASj07FI
         co0UQR4YEGuawnGC/1HPrkLdeTp/NImxuNm2SK7ZieoqZyw+TCeGN6u8+dBG7Gfyvfts
         FxNKHYh7zU5qp2y3JDdtDm85fOcJb3tYbJVAXetO70nLmk/mDWj60TXlkRC3Vw9uZONM
         C8gKtG6H7Qm9+1xB8dKpGvgZcu2SXU7jH9RaP4y7R8bPA8NbPUse1zMMOH1hi+BnjN3P
         ubww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630101; x=1796234901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dHM8QuM6MY/pSqOPOop7gPxP9CND5feIuBhfsBIhnlk=;
        b=Qlj1bdkXnQd0i/VfFDWJBJk2ctPvaXrGz6gxJ7eNp01nzd6Dt+Y0k9QQnolpqFQ3v+
         0I01wb/EkFACV8o1EIMsLWbhWM+SHCgDqwm09gQ1kqU1bF03WXAzPFLkiIuMsVbNsvew
         YYlnquV27h0jtz2bkvfJrTK595YDN4FsxwBdz5/50c/WTOwtAW/YV7VOBf0HvnKSTU7b
         peX/XrBSq50KZRPf6a9ucw2KK7RWawOm+hBcsjeHsoLpj4CA6woOWeLSkeMqpcOlVhq4
         yVoUCcOd3NIDFpgHf1dUEUmNPquVbqsJ9AVxr8h/myD4NBgw8Lp5sQ1vQqqpcqvxbIK2
         m4UA==
X-Forwarded-Encrypted: i=1; AL+hErEZmwVumXdWs+Ghx72VlsCx54OqsFKRwbIQKuCou79kuI4CHPmYpOgHYjLZZFAbWjxA6387PNyvSQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9LxzhVNrqSNvTfnR9Z5UgbItT9cCsFR58jYnQfETxcY9KWCujY
	E6TKYIDfJgVi3clEe+xVbmt4SQd4EppPATbkHiEAsIWYV7iG1FH/wRx4/fVNHEGV3ymG8b9W+uA
	AnsedlIpT
X-Gm-Gg: AZFdTZffXzvXUyMy3Zg1I0Tk2CwjK5DERt5QNdM9T77WUveznqs4h5rNRbBKDoYmDsD
	bnrT5VDlnEs0kN5XhNW157Km/DPENzoQojq1lNRgMsv9mtU6lZfRoNuDPNhVi9m3taYaLKDx0YP
	DJZDPRtaObNu5Tz5FXdhDlwOL56Xu3XEs0Oph4qiag6U75eBRg3QflVhpW0mf1ET8Li87tBvyKO
	EVZeylYaD4+0/xdMocLFWTlZyAPIJk5IvpB+O+n1unkuiuTTmh+WdkEo4/ZizzyBQRWzlebCk2N
	H1DjMSvMoeoHDFgZ00G/f3CVtyOZVoCViSukklnBMMFBtED7I4k3EgYARIjj8InvRjTAqGyPWAW
	+mNx9LqOfbwPBwQw0aV+U2SEwlBAdSeLBYX6zRDddYcL9IJlSoCg/bN8Ei/GA8qm1nFerq9Ol1m
	lUJIutCRNvX6NzHVKCmaoh0gJQCNzLGXvfZs1FnPt61E92P4E+gEXkeYc1CLSW7Fkpuua1aN64W
	/1HYW8TgjnYueshE7sxh2vcBvY8vGTnsaltewN9ENe2P7RUuliEmSleR5gWyCgzilFVyuO0/IbZ
	PZQe2uNLmVAiWo6w6CPO0ZG0abWvhwnF3PMOHngLwmT0TZWEGFoDcdoHaYbPdDCDH0S3guQtnQ=
	=
X-Received: by 2002:a05:690e:1247:b0:67d:ebad:8ca2 with SMTP id 956f58d0204a3-67df4410cabmr7287298d50.53.1795630101276;
        Wed, 25 Nov 2026 10:08:21 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df337bfd7sm9193210d50.15.2026.11.25.10.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:08:20 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Jens Axboe <axboe@kernel.dk>
Cc: Jori Koolstra <jkoolstra@xs4all.nl>,
	Christian Brauner <brauner@kernel.org>,
	Aleksa Sarai <cyphar@cyphar.com>,
	io-uring@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] io_uring/openclose: allow an empty path with O_EMPTYPATH
Date: Wed, 25 Nov 2026 13:08:17 -0500
Message-ID: <20261125180817.3682397-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
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

Commit 31cf44efa6df ("vfs: add O_EMPTYPATH to openat(2)/openat2(2)")
made build_open_flags() accept O_EMPTYPATH and turn it into
LOOKUP_EMPTY, so that openat(fd, "", O_EMPTYPATH) reopens the file
behind fd.

However, io_uring also uses build_open_flags(), but __io_openat_prep()
still copies the name with delayed_getname(), which rejects an empty
name with -ENOENT. As of now, IORING_OP_OPENAT and IORING_OP_OPENAT2
accept O_EMPTYPATH, but fail on the empty path this flag is meant for.

The issue can be reproduced with this program:

    #define _GNU_SOURCE
    #include <fcntl.h>
    #include <liburing.h>
    #include <stdio.h>

    #ifndef O_EMPTYPATH
    #define O_EMPTYPATH (1 << 26)
    #endif

    int main(void)
    {
            struct io_uring ring;
            struct io_uring_sqe *sqe;
            struct io_uring_cqe *cqe;
            int fd = open("/etc/passwd", O_PATH);

            printf("openat: %d\n", openat(fd, "", O_RDONLY | O_EMPTYPATH));

            io_uring_queue_init(1, &ring, 0);
            sqe = io_uring_get_sqe(&ring);
            io_uring_prep_openat(sqe, fd, "", O_RDONLY | O_EMPTYPATH, 0);
            io_uring_submit_and_wait(&ring, 1);
            io_uring_peek_cqe(&ring, &cqe);
            printf("IORING_OP_OPENAT: %d\n", cqe->res);
            return 0;
    }

Before that commit (v7.1), both calls fail: it prints "openat: -1" and
"IORING_OP_OPENAT: -2". After that commit (v7.2), the result is:

    openat: 4
    IORING_OP_OPENAT: -2

This patch will copy the name with delayed_getname_uflags() and
AT_EMPTY_PATH when O_EMPTYPATH is set, as io_uring's statx already does
for AT_EMPTY_PATH.

Fixes: 31cf44efa6df ("vfs: add O_EMPTYPATH to openat(2)/openat2(2)")
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
I found this while comparing the behavior of different kernel versions.
I used an LLM to analyze the problem and to draft the patch and this
message, and I analyzed the result myself.

Tested on io_uring-7.4 (0659e44ce739) with KASAN and lockdep. A test
that runs 24 cases through IORING_OP_OPENAT/OPENAT2 and through
openat(2)/openat2(2) now gets the same result from both (32 of 42
results differed before). The cases include O_PATH and regular fds,
AT_FDCWD, forced async opens, RESOLVE_CACHED, a direct descriptor slot,
a bad pointer and an unprivileged reopen of a 0600 file (EACCES). The
liburing open tests and the openat2 selftests pass on both kernels.

 io_uring/openclose.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/io_uring/openclose.c b/io_uring/openclose.c
index 24cf3ce2e2bc..29fe31f16a2b 100644
--- a/io_uring/openclose.c
+++ b/io_uring/openclose.c
@@ -54,6 +54,7 @@ static int __io_openat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe
 {
 	struct io_open *open = io_kiocb_to_cmd(req, struct io_open);
 	const char __user *fname;
+	int uflags = 0;
 	int ret;
 
 	if (unlikely(sqe->buf_index))
@@ -67,7 +68,9 @@ static int __io_openat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe
 
 	open->dfd = READ_ONCE(sqe->fd);
 	fname = u64_to_user_ptr(READ_ONCE(sqe->addr));
-	ret = delayed_getname(&open->filename, fname);
+	if (open->how.flags & O_EMPTYPATH)
+		uflags = AT_EMPTY_PATH;
+	ret = delayed_getname_uflags(&open->filename, fname, uflags);
 	if (unlikely(ret))
 		return ret;
 	req->flags |= REQ_F_NEED_CLEANUP;

base-commit: 0659e44ce739ecd856164c75a5325b7959a2921d
-- 
2.53.0

