Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEB93FF1C5
	for <io-uring@vger.kernel.org>; Mon, 20 Jul 2026 11:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784547819; cv=none; b=n6hpsb7RSNWTQEB7js0U5exNlRoUIZl7LJ6EfmTaiSQ3H+fArywBSPVtqlurzYLgf/ek/wP0Uc5CJ1n3cvGUh6EDkvefHIJm/7f5nJagC5U0/DlSJK7R7r44453HrHLa0t5eO5eFBjNUrQN5BZN8lntoYhvDSsR3GdHyaltrXMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784547819; c=relaxed/simple;
	bh=RsiZxpaYkIGyXLjpfXqn0g58mFsJP6p8d93eCWh0GjY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FM/yC7+eypIyqAoEvObPPmmOsXOJMkfMVbNGOWAZ3C/J/UyPMGMfeXX1GvqnccbTtIgaWlUrmlyrbLnrmbtZhDOOhiL/p3xS6q7L1FQc/mV2Rat/74gy3r8ud7EBk6WvAw07L/fdojofbfeI+gEvR3KCzAJR1e3rfEe34C8Knyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pYbezPIm; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pYbezPIm"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84a2c90e383so2365761b3a.0
        for <io-uring@vger.kernel.org>; Mon, 20 Jul 2026 04:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784547817; x=1785152617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9KUSd3YHfcAQRvrkzE412v+iNXEgmG9XvjWjelzlGwc=;
        b=pYbezPImujtrmUi8HH/gMhtIEmyBp9g0lOFa0KYs07lErB7p+5O+wkP/5C10OH8nRN
         cLEbcoRiN9P5m1hthX8gPS2QktF9lCn1oADy73ArL1552ysVjHzPtZVVR0/gjBCwuhqx
         M6NDCMPP07MwIXSSiw0OrrXcBdTyLT1mc/2eUpL4covii1y+AXH4CoLdWXcqLW2QE1vC
         1zLtQD1fiXwYAlfb3HIsUlr3L9mnBpK13ryT5bMm3Yufm4wI2VdALXYK8AlL0GYCFibr
         z9Md4s2J9zbaWOvHppZ35CzIsRpABqIwKABh5DJppHi4KuC3u7h9sfGfFf//rnAnl6cn
         BtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784547817; x=1785152617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9KUSd3YHfcAQRvrkzE412v+iNXEgmG9XvjWjelzlGwc=;
        b=nh8yEIto5qcuZLW803JSWesdVf4H7TGoHBVRkOilwFSvUKVC5MD+/4EhBDzxhryYkL
         OeIjFWughOwV+l8N3CZ9DzeW8Y+H1vrr6IjoUI6A3eQDW6pWtpcMUHJQq8cCcZooTEro
         i+9oqX20ERxZea8Dy+l+PhHdu14A7a/gqoZ2tPIe5GzbMeddUUvpneF4O08HZXxM5SGt
         DbUiMYTcb9AY7nX11UEhdxZeq9Cl10v8jGSgRlAPZhbdeOg+vi9KVgNmMsGSUyWAZH5i
         UNx1myP0f+tIb0s6GwY6aSOVbGAMbg+ey44/Qn8z43pbk7z+V34YWATN74Njg8I6Tt8t
         u8+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq2aQJo45bnMQHktZHCDagKySlEGbPbg4zusUfleaWD0/ULsaEkGihmA3YQ0+thHbdEs5aJTPN1qA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGugoB9J1KyAsO89tMexYBRnvwg8Gp97LDdjVA9rAtAIrOMwvX
	XfE1Xs671Ub93XQwwSuOdGVfJMEzeCXj0BcxENfqdsySSxgH22WCJAj3
X-Gm-Gg: AfdE7cmQyFTgx4K6g4LjTPQhws58EPFG3oHZwQ0p5r4aRoUaLQwii3qiiaN5gTusQf2
	Bwn3C7wLC0rqcokRBO1OwZcn3Zq1xUYJS93g8QM45ZglVhzNbB5EghtNoyw8sdNeIh7K0uYZYKN
	1svExkZSbhcVlFTZcHUpJrlF4sJPvDkYBAnkOAWTNodV5GhYbAODrjCYKf2iai9Ku1OOxKdu13R
	x4MJJcXqNq/cCuXdPi8Ktoa79R3JlvmQU1Rp0CfhfZR7E3898y7mnePL1Rta6i0oKL4ctoAGVVI
	HAnmi4o0AQ3B72jmPMZCMu+TUsEkD2g+0xGefDtNUDgXLsTeSLpjFyoAsDH8oSGSSDijAT+MGXh
	Nj2GLLFfhGHrMaij0fncmAbVRTvpCiCYUGG+jiBY5df7kAz+1tKdXDZanQ8LRyE/drcaxkx1oSV
	zN/E5XV9gz
X-Received: by 2002:a05:6a20:b786:b0:3b4:661d:8405 with SMTP id adf61e73a8af0-3c3acc2fe08mr13110302637.4.1784547817096;
        Mon, 20 Jul 2026 04:43:37 -0700 (PDT)
Received: from wokron-navi.. ([113.215.38.212])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb517f8f77dsm4597979a12.11.2026.07.20.04.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 04:43:36 -0700 (PDT)
From: Yitang Yang <yi1tang.yang@gmail.com>
To: axboe@kernel.dk
Cc: krisman@suse.de,
	io-uring@vger.kernel.org,
	Yitang Yang <yi1tang.yang@gmail.com>
Subject: [PATCH] io_uring/rw: fix missing ERESTARTSYS conversion in read paths
Date: Mon, 20 Jul 2026 19:41:16 +0800
Message-ID: <20260720114116.21830-1-yi1tang.yang@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both read and write may receive internal restart error codes from
the filesystem layer and should be converted to -EINTR. However,
when multishot read support was added, the error code normalization
was lost for both io_read() and io_read_mshot().

Extract the conversion into io_fixup_restart_res() and apply it
in all three locations: io_rw_done(), io_read(), and io_read_mshot().

Fixes: a08d195b586a ("io_uring/rw: split io_read() into a helper")
Signed-off-by: Yitang Yang <yi1tang.yang@gmail.com>
---
 io_uring/rw.c | 38 ++++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/io_uring/rw.c b/io_uring/rw.c
index 63b6519e498c..e505479e3773 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -615,6 +615,24 @@ static void io_complete_rw_iopoll(struct kiocb *kiocb, long res)
 	smp_store_release(&req->iopoll_completed, 1);
 }
 
+static inline ssize_t io_fixup_restart_res(ssize_t ret)
+{
+	switch (ret) {
+	case -ERESTARTSYS:
+	case -ERESTARTNOINTR:
+	case -ERESTARTNOHAND:
+	case -ERESTART_RESTARTBLOCK:
+		/*
+		 * We can't just restart the syscall, since previously
+		 * submitted sqes may already be in progress. Just fail
+		 * this IO with EINTR.
+		 */
+		return -EINTR;
+	default:
+		return ret;
+	}
+}
+
 static inline void io_rw_done(struct io_kiocb *req, ssize_t ret)
 {
 	struct io_rw *rw = io_kiocb_to_cmd(req, struct io_rw);
@@ -625,19 +643,7 @@ static inline void io_rw_done(struct io_kiocb *req, ssize_t ret)
 
 	/* transform internal restart error codes */
 	if (unlikely(ret < 0)) {
-		switch (ret) {
-		case -ERESTARTSYS:
-		case -ERESTARTNOINTR:
-		case -ERESTARTNOHAND:
-		case -ERESTART_RESTARTBLOCK:
-			/*
-			 * We can't just restart the syscall, since previously
-			 * submitted sqes may already be in progress. Just fail
-			 * this IO with EINTR.
-			 */
-			ret = -EINTR;
-			break;
-		}
+		ret = io_fixup_restart_res(ret);
 	}
 
 	if (req->flags & REQ_F_IOPOLL)
@@ -1034,6 +1040,8 @@ int io_read(struct io_kiocb *req, unsigned int issue_flags)
 
 	if (req->flags & REQ_F_BUFFERS_COMMIT)
 		io_kbuf_recycle(req, sel.buf_list, issue_flags);
+
+	ret = io_fixup_restart_res(ret);
 	return ret;
 }
 
@@ -1068,8 +1076,10 @@ int io_read_mshot(struct io_kiocb *req, unsigned int issue_flags)
 		return IOU_RETRY;
 	} else if (ret <= 0) {
 		io_kbuf_recycle(req, sel.buf_list, issue_flags);
-		if (ret < 0)
+		if (ret < 0) {
+			ret = io_fixup_restart_res(ret);
 			req_set_fail(req);
+		}
 	} else if (!(req->flags & REQ_F_APOLL_MULTISHOT)) {
 		cflags = io_put_kbuf(req, ret, sel.buf_list);
 	} else {
-- 
2.43.0

