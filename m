Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794680228;
	b=vFwUuOevB3PM26jisNh/qXBSyf0seEz+mxug7d8KRP9Lu+05Jg9F3isbskFIx4LDOoYn
	 j4U3M+JZNUW5daRTXZj7kbdIy7TzMyzCmETNmFxOdMcYttht2dfKd8aCxmF6cevrT/bB/
	 RdidQH0ybmUZpssIkSAjAEy+Y4yvVaTUDtXwkpBUF+zggwkl0BX684T7xTnyXTqdvIJAS
	 kPFp8zghVExKIk1nolCidKJ5zyOrMvTF/zHvagLlBLicR9odObRNwTB9codnGVrRp1Z0d
	 RzLgYji6CdUpZz4mvchbtpmIBPdSuc+LlR9/6oCf6cvbAW+1UIbqOSe1iW34FEjeR9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794680228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Content-Language:To:From:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=a4UD8ktoUVDxJ57rJ4EnDivuiBzBoDnoK3pIrPbg/MI=;
	b=m9kBuZFXnqzlZBpkIxSHnDMK/bpmIub5tK6XFoTgHcRhon3nmDiYyrxs281Nk+PvdXZt
	 yKsIfNd0rYGsK+ZRo1XXipbPgctQ02Bb1ufdPG91U2HxqbXjCfJjB07GW+080IdNFGttz
	 O2LzHh8E0me/LuIREQSnwMC3t43VCa82ZUhFZVvmX7s7GWqk4uzFkbS8dW955nqgGKrL4
	 1/v8rWvEKSFYGGC3hn2A3aMmprrso8IVUrq+hJaz9e/hHn6V4ZqIFbPFAfuPoireJcDgn
	 cULVdHzAXEz1tsonpv+3dFs3cQLFuFq3Vq0HkfbkN96u1i0tq5XPHgI9UtCCsznonZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CBt1CGbq;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DB4606A32D
	for <io-uring@vger.kernel.org>; Sat, 14 Nov 2026 18:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0DB4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CBt1CGbq
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15ea896ddc8so2967196c88.0
        for <io-uring@vger.kernel.org>; Sat, 14 Nov 2026 10:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794680227; x=1795285027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a4UD8ktoUVDxJ57rJ4EnDivuiBzBoDnoK3pIrPbg/MI=;
        b=CBt1CGbqt+UTyjzQKkLdtbmrjum2ptEgJAjPLjZqiDBRHBnWu1gq1VyT1msyncpDNi
         wQiS1Z3CMN0iia/+bdsxZIzDQY0BG6/fSJtugEvip9HTs6cIZ0MWZzFO388kFwP/KvUq
         j16oeSufin4wdAPixLHCFptkAolrErk/Jv1TuUgM+y2/+HvmRz64BlkmM3zaQeNfdRmu
         iuZJokTqq23V2FmVS63Iaiy6SR94CNRCSfIUYhZlpeEYbC2pMaTIs75Ybjx7eea8ZXiD
         K83focNxFdbXCB+Mow9ZnzB0hZVa41HapTEw4fOoJptgiZsz1hpXMMKS7WTA2hksq190
         MsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794680227; x=1795285027;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a4UD8ktoUVDxJ57rJ4EnDivuiBzBoDnoK3pIrPbg/MI=;
        b=zON2rnQa4YZw5kl8SMpjgtDKQkZnG1HVpIKliMzWMa0J+ExjTtftgX8QLvR9n55McT
         ZA4YWHtl5EqT6/tBU2UbtQi5gC+G2apnO4wItKq8EtBvLBTWfk0DpGWkcDeAiQH4NACn
         6OIGuqcbtw3QaJ6HfFo2xKy/ClHIp961hQCn53j9PBNHUXnNyqAP+sA/plj21VBZt+IN
         69V0XN/PbKIlC2cUuAttyN6n1/EyOZ+L3lUTGDf0BWS871wzGKJnR+jKxYmCCxs9ssDZ
         B8Co8tJ4+LjXS8jdJ0jZkqSkv+cLo8eFyJlGCnCjPg+5LOWedwgVi4srDptZNF3YrHH5
         zI/Q==
X-Gm-Message-State: APuU4Z/i04dHspzoAxohks8cw38RIq9y40i5XzcnppIYYXTaRopVvBK6
	QSIsIJMb/IONPTKYIv0THDA6+mEtWfFdJlQWqGGeNBuDoszxHGchVgS2P4WTE5Cp3iR98EyI0BK
	xvN5tiGg=
X-Gm-Gg: AYBFou0W3ftsdbkC1j52SnbdH5MLfe32HeF7ZTaQ8OQtfCH5lkn/uHiTwMv2NYfArQ3
	3klahLs4fg0NlptA3JcRD/3j0y4rdENJ7eT86fVEcFAE22mqSYl/olc+DnagP16LZrhpCgVsMVq
	/Udu/f3tigLxcgRsXqP0UQPeLMB7cixANGL6FfrLxCUUJwqAglVjyV9N9w0R8uDpFTEb6RtChZH
	1CZclGDOU3xZjayZocv1efOhK/S234MJ96jYUeOl/2/LjPGgzmp7GWPRTrVDOOUtTOGogEuwfqq
	pO301/6Ju106lxRg9AIGXtSyWGYyj378ey+Ff/FHu408ryTIoy9vee7sG1ccIqErDxq3no3aobb
	fsSDqZr3LHodA5oJA4IHi8NQ/fs3w/qW7ntKGy/ROAAYAvdhjuBp1rWafvOFuuuNBVSXwfjY4Yl
	jwBYifBk50q5ePtnrHODgSmicp3prRTNm34C/B205kjyp5Dvr9U17vsAJ4A0jlQ5iLrcQxXVMeM
	K1EqEB/QLRCUOaMYCIs/sxX6x6/UEULTdtkkMQKvMblIm8t8GQ7FC/nS3lucjN8wvTW140NClKF
	6CCQKuajJ+52CRJfbTE0hSU4WwSAFoHIoddFxtggLFFD259ThTYPIxaRuqNDLUl12YXOvX0mhGO
	j68WbZ/Dt+cnQ
X-Received: by 2002:a05:701b:2514:b0:1a7:e1c6:6f33 with SMTP id a92af1059eb24-1b5030cde42mr4790718c88.30.1794680226503;
        Sat, 14 Nov 2026 10:17:06 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm20816221c88.8.2026.11.14.10.17.05
        for <io-uring@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 10:17:05 -0800 (PST)
Message-ID: <9efbf0e0-4654-45a9-87e2-1c8bba6016f0@kernel.dk>
Date: Sat, 14 Nov 2026 11:17:05 -0700
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: io-uring <io-uring@vger.kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] io_uring: remove handler-local failing of negative results
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

io_issue_sqe() now marks a request as failed if it completes with
IOU_COMPLETE and a negative result. Drop the open-coded versions of
that from the issue handlers.

Handlers that fail a request on something other than a negative result,
may be issued through io_poll_issue() for multishot, or complete through
task_work are left alone.

Signed-off-by: Jens Axboe <axboe@kernel.dk>

---

diff --git a/io_uring/advise.c b/io_uring/advise.c
index 0073f74e3658..167abea23457 100644
--- a/io_uring/advise.c
+++ b/io_uring/advise.c
@@ -101,8 +101,6 @@ int io_fadvise(struct io_kiocb *req, unsigned int issue_flags)
 	WARN_ON_ONCE(issue_flags & IO_URING_F_NONBLOCK && io_fadvise_force_async(fa));
 
 	ret = vfs_fadvise(req->file, fa->offset, fa->len, fa->advice);
-	if (ret < 0)
-		req_set_fail(req);
 	io_req_set_res(req, ret, 0);
 	return IOU_COMPLETE;
 }
diff --git a/io_uring/cancel.c b/io_uring/cancel.c
index e3d9fe8fc982..057dfad46244 100644
--- a/io_uring/cancel.c
+++ b/io_uring/cancel.c
@@ -262,8 +262,6 @@ int io_async_cancel(struct io_kiocb *req, unsigned int issue_flags)
 
 	ret = __io_async_cancel(&cd, tctx, issue_flags);
 done:
-	if (ret < 0)
-		req_set_fail(req);
 	io_req_set_res(req, ret, 0);
 	return IOU_COMPLETE;
 }
diff --git a/io_uring/epoll.c b/io_uring/epoll.c
index b9db8bde27ec..4fb04d4b9136 100644
--- a/io_uring/epoll.c
+++ b/io_uring/epoll.c
@@ -69,8 +69,6 @@ int io_epoll_ctl(struct io_kiocb *req, unsigned int issue_flags)
 	if (force_nonblock && ret == -EAGAIN)
 		return -EAGAIN;
 
-	if (ret < 0)
-		req_set_fail(req);
 	io_req_set_res(req, ret, 0);
 	return IOU_COMPLETE;
 }
@@ -95,8 +93,6 @@ int io_epoll_wait(struct io_kiocb *req, unsigned int issue_flags)
 	ret = epoll_sendevents(req->file, iew->events, iew->maxevents);
 	if (ret == 0)
 		return -EAGAIN;
-	if (ret < 0)
-		req_set_fail(req);
 
 	io_req_set_res(req, ret, 0);
 	return IOU_COMPLETE;
diff --git a/io_uring/futex.c b/io_uring/futex.c
index 792d37968efc..2d36d6afb9d6 100644
--- a/io_uring/futex.c
+++ b/io_uring/futex.c
@@ -272,12 +272,9 @@ int io_futexv_wait(struct io_kiocb *req, unsigned int issue_flags)
 
 	ret = futex_wait_multiple_setup(ifd->futexv, iof->futex_nr, &woken);
 
-	/*
-	 * Error case, ret is < 0. Mark the request as failed.
-	 */
+	/* Error case, the core marks the request as failed */
 	if (unlikely(ret < 0)) {
 		io_ring_submit_unlock(ctx, issue_flags);
-		req_set_fail(req);
 		io_req_set_res(req, ret, 0);
 		io_req_async_data_free(req);
 		return IOU_COMPLETE;
@@ -358,8 +355,6 @@ int io_futex_wait(struct io_kiocb *req, unsigned int issue_flags)
 done_unlock:
 	io_ring_submit_unlock(ctx, issue_flags);
 done:
-	if (ret < 0)
-		req_set_fail(req);
 	io_req_set_res(req, ret, 0);
 	return IOU_COMPLETE;
 }
@@ -375,8 +370,6 @@ int io_futex_wake(struct io_kiocb *req, unsigned int issue_flags)
 	 */
 	ret = futex_wake(iof->uaddr, FLAGS_STRICT | iof->futex_flags, NULL,
 			 iof->futex_val, iof->futex_mask);
-	if (ret < 0)
-		req_set_fail(req);
 	io_req_set_res(req, ret, 0);
 	return IOU_COMPLETE;
 }
diff --git a/io_uring/kbuf.c b/io_uring/kbuf.c
index abf44f5dba26..6d35fcd45f2b 100644
--- a/io_uring/kbuf.c
+++ b/io_uring/kbuf.c
@@ -623,8 +623,6 @@ int io_manage_buffers_legacy(struct io_kiocb *req, unsigned int issue_flags)
 	ret = __io_manage_buffers_legacy(req, bl);
 	io_ring_submit_unlock(ctx, issue_flags);
 
-	if (ret < 0)
-		req_set_fail(req);
 	io_req_set_res(req, ret, 0);
 	return IOU_COMPLETE;
 }
diff --git a/io_uring/msg_ring.c b/io_uring/msg_ring.c
index 3067c9343991..3b2192cfac05 100644
--- a/io_uring/msg_ring.c
+++ b/io_uring/msg_ring.c
@@ -323,11 +323,8 @@ int io_msg_ring(struct io_kiocb *req, unsigned int issue_flags)
 	}
 
 done:
-	if (ret < 0) {
-		if (ret == -EAGAIN || ret == IOU_ISSUE_SKIP_COMPLETE)
-			return ret;
-		req_set_fail(req);
-	}
+	if (ret == -EAGAIN || ret == IOU_ISSUE_SKIP_COMPLETE)
+		return ret;
 	io_req_set_res(req, ret, 0);
 	return IOU_COMPLETE;
 }
diff --git a/io_uring/net.c b/io_uring/net.c
index 183425f28b0c..04927fa5d242 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -1824,7 +1824,6 @@ int io_socket(struct io_kiocb *req, unsigned int issue_flags)
 			return -EAGAIN;
 		if (ret == -ERESTARTSYS)
 			ret = -EINTR;
-		req_set_fail(req);
 	} else if (!fixed) {
 		fd_install(fd, file);
 		ret = fd;
@@ -1910,8 +1909,6 @@ int io_connect(struct io_kiocb *req, unsigned int issue_flags)
 	if (ret == -ERESTARTSYS)
 		ret = -EINTR;
 out:
-	if (ret < 0)
-		req_set_fail(req);
 	io_req_set_res(req, ret, 0);
 	return IOU_COMPLETE;
 }
@@ -1970,10 +1967,8 @@ int io_bind(struct io_kiocb *req, unsigned int issue_flags)
 		return -ENOTSOCK;
 
 	ret = __sys_bind_socket(sock, addr, bind->addr_len);
-	if (ret < 0)
-		req_set_fail(req);
 	io_req_set_res(req, ret, 0);
-	return 0;
+	return IOU_COMPLETE;
 }
 
 int io_listen_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
@@ -1998,10 +1993,8 @@ int io_listen(struct io_kiocb *req, unsigned int issue_flags)
 		return -ENOTSOCK;
 
 	ret = __sys_listen_socket(sock, listen->backlog);
-	if (ret < 0)
-		req_set_fail(req);
 	io_req_set_res(req, ret, 0);
-	return 0;
+	return IOU_COMPLETE;
 }
 
 void io_netmsg_cache_free(const void *entry)
diff --git a/io_uring/openclose.c b/io_uring/openclose.c
index 24cf3ce2e2bc..71e45fc00abd 100644
--- a/io_uring/openclose.c
+++ b/io_uring/openclose.c
@@ -179,8 +179,6 @@ int io_openat2(struct io_kiocb *req, unsigned int issue_flags)
 						open->file_slot);
 err:
 	req->flags &= ~REQ_F_NEED_CLEANUP;
-	if (ret < 0)
-		req_set_fail(req);
 	io_req_set_res(req, ret, 0);
 	return IOU_COMPLETE;
 }
@@ -266,8 +264,6 @@ int io_close(struct io_kiocb *req, unsigned int issue_flags)
 	/* No ->flush() or already async, safely close from here */
 	ret = filp_close(file, current->files);
 err:
-	if (ret < 0)
-		req_set_fail(req);
 	io_req_set_res(req, ret, 0);
 	return IOU_COMPLETE;
 }
@@ -309,8 +305,6 @@ int io_install_fixed_fd(struct io_kiocb *req, unsigned int issue_flags)
 
 	ifi = io_kiocb_to_cmd(req, struct io_fixed_install);
 	ret = receive_fd(req->file, NULL, ifi->o_flags);
-	if (ret < 0)
-		req_set_fail(req);
 	io_req_set_res(req, ret, 0);
 	return IOU_COMPLETE;
 }
diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 07813d45a1d4..6dc0325b155b 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -641,8 +641,6 @@ int io_files_update(struct io_kiocb *req, unsigned int issue_flags)
 		io_ring_submit_unlock(ctx, issue_flags);
 	}
 
-	if (ret < 0)
-		req_set_fail(req);
 	io_req_set_res(req, ret, 0);
 	return IOU_COMPLETE;
 }
diff --git a/io_uring/timeout.c b/io_uring/timeout.c
index fa54846ed4ce..47446900f63e 100644
--- a/io_uring/timeout.c
+++ b/io_uring/timeout.c
@@ -591,8 +591,6 @@ int io_timeout_remove(struct io_kiocb *req, unsigned int issue_flags)
 		raw_spin_unlock_irq(&ctx->timeout_lock);
 	}
 
-	if (ret < 0)
-		req_set_fail(req);
 	io_req_set_res(req, ret, 0);
 	return IOU_COMPLETE;
 }
diff --git a/io_uring/waitid.c b/io_uring/waitid.c
index 0d3c248f375c..6e3c397296da 100644
--- a/io_uring/waitid.c
+++ b/io_uring/waitid.c
@@ -376,8 +376,6 @@ int io_waitid(struct io_kiocb *req, unsigned int issue_flags)
 
 	io_ring_submit_unlock(ctx, issue_flags);
 done:
-	if (ret < 0)
-		req_set_fail(req);
 	io_req_set_res(req, ret, 0);
 	return IOU_COMPLETE;
 }

-- 
Jens Axboe

