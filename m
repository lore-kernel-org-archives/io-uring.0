Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794680275;
	b=JBg29Tf10ITMqRBYfvvssnQSgd9idMuL0BXX4QzYuz2ZvasTjp6Nrvh2+RHQUWg0e5yY
	 5CoVpJb5R5Y6uRMR54q+dlsQb9HlXvt/sn+yEU+/N+WpG3EpxQDcczTPtbbNtgHHhxZy5
	 kiDIwMQKLzMV3Cj+Mu2ZckOeZ8Lc+ZfTFobkouy34xy2bJGm2TsspRRmElJHPqPv8Hwid
	 2TocibAJqmj9zj2VobZUbmb4r2fX8aeV4+TPao45cL7jVrO9498PIswBJf6qnpO9+EPra
	 WLhaF5G/VqJdUUQWau7eKWxY5Xba3XXCjOsVHRWmObQFdc8fay3V1O6WjxdDthvytEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794680275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Content-Language:To:From:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=VN7FzIhaj6g+2k8uq/x9OZ+TZjTQBFPil59oA4iHDpU=;
	b=qzc+QYmEuB3bHm7riFNqruMiqyS37EyZuiGIARzX3/5LZxtZ5F7u7QD85EwMn3UHdPLj
	 2y1kg8wRlDJk+e6trOf88OKFsQ2crdCL6+Q/lAehrI5x2k9k/JRRXCTSjDWSaVBPwFtMG
	 27FYnYvYZJYucDI1kHeO7dqviIV2vgEK7fOKbnYIwcFTVt/uMROUse+W+yTEmBcxqQELm
	 i5Ou7vDIM9tVSVufeFQoZVBT9WFaR4Q2mMBfcLA+RqEK6Mpszpu2fIWVG34RYzczdZfoM
	 GsfbzsB1x8W6dUR32caWI05gBLbsT3ZaH2tzAn3QMbn4CsfcTO2CmepLENHLCgoj2zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=TlNsNsZq;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93E5606A323
	for <io-uring@vger.kernel.org>; Sat, 14 Nov 2026 18:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C93E5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=TlNsNsZq
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so2306106c88.0
        for <io-uring@vger.kernel.org>; Sat, 14 Nov 2026 10:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794680274; x=1795285074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VN7FzIhaj6g+2k8uq/x9OZ+TZjTQBFPil59oA4iHDpU=;
        b=TlNsNsZqbbuOYxqwaQH3XLMMfXI+M6eX8mE3NnUcrmnGnRCDf7Om6aZzrrV1bRRc3E
         siAF4XoHdt5D225AKfSurc/dBPSL2cPlNhOzK03pL64GfL46SLbS4lXuEwYxBzQYfMZV
         9nNm/9MbrFhbMcFZ97nKf2w+RMKMNUW78O4puLSJPID066uM7jxxDwkTDghQVGdrPgVs
         6aWDmUtNhQcLwpCdz0PS+VeM3fyt2FpRXY+EFcz9YGg63dJ+sViyHTf6p1yRzSA0EsHp
         RlyoPr8/hL2224j0PsTo1XffZTSJuexlR7UuogGu/BYhcWHQv0mfQUNEyXcIXdrIX7Ed
         B4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794680274; x=1795285074;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VN7FzIhaj6g+2k8uq/x9OZ+TZjTQBFPil59oA4iHDpU=;
        b=ka1MeNODDIk+9TyVhpwE3dE6lynj6rBqrERVAz+Wj3Y6em/9X386t40k3H2fwFAoer
         TPK8WRNx2omXTyoggFsrAY2F8VW515pHEs+sP96hfFZt+XcSr8cJmYuEO4Mi7uXGAABr
         jdibxv5sjee/Jp8HuxsRlILgGWF49AUoyhTXZk9w+HqVergYgPkLSXx3sWBb+L33Tlpe
         GRqp+RAtLwcXHuz03S2JPu1nuYx5OevDv2BlGbkUBx6clKYtEjn6BXllfEMbeAbMvEva
         uVhZ6MRpQWC1OVrLG6CkwWy+PIyMje4p4CtYRLebPd4xhGtWtyfHtyU0KStcZtF8nOUy
         OpNg==
X-Gm-Message-State: APuU4Z++i9jSDxxH5ppiWlsD6gTeDd/FbaF1uVB5IH31MdMYDBjJLSSE
	lBCxSXpvJHIXshkUuya02GRk6RjUwRAajNdxc/RJlUbRDdQMifj5OOay2wejnnD78LI6xlg1XY8
	YOH+pNjQ=
X-Gm-Gg: AYBFou3KhspjfEZiZ3gFQhSX4AGQXECxVF4phbnRORR5eCMxzsp4CzXLBCgBFTnisTt
	hHdvWK2v8rDaGL/QplCivyYaRUGtqxIPASil6Dd9G/uB7jtnghhg2esfeD3apPzag33szuImiRH
	C5F1YI6aqrtkCMXL0/kFRBCeCXuahL8IU8w2Vx6unFxNWk0Cs1s99m9cq8fotqLqrGB25KxjdPA
	NOXYvQc29qoX+fxnP6XylGYX4HgEE96Fjp2NBBj7YrpK3jqUFSzvbj+79Sr5Qj4BFSG0gk2jVB0
	EnOEUeGoosDv+rNffYym3UQX54eR2hW6pFWScc8SG2uVU+EMSCMVxklF9kBJpArNqOaEiDSPV03
	eGuX/w90TPF0q9keCt75Box+dEWGzoXjv2wSlF5PBRm6REYX7rPwaODEguW+iNsXjZA8uCkn8Hb
	ELYx0XnLdoKp5A9AkL4J9xYeWjU4hW9TAXU4b4dbgQZ9f2iNo+caJa5N9V4U9q/YMwk1c/L/y45
	Qo7BB6wnMtk5wyXwq9r1+k4DvOeMclngnIxst9n0c4WYDhDMWVxHU2EP02QwrY4zncRewlwfemN
	TRYk2YW177pK0hTDDWs2TWDJR4HLNeMHzupr+i05Atbl8YEA0QK/vyKoGne04eRITkyPGzYmYot
	+azJrkstUog/+
X-Received: by 2002:a05:701b:271c:b0:1b2:43b0:4794 with SMTP id a92af1059eb24-1b5030d4941mr4684996c88.9.1794680273605;
        Sat, 14 Nov 2026 10:17:53 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b2519sm15889213c88.13.2026.11.14.10.17.52
        for <io-uring@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 10:17:53 -0800 (PST)
Message-ID: <e357bc47-4e22-4103-a31e-8b66395338de@kernel.dk>
Date: Sat, 14 Nov 2026 11:17:52 -0700
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
Subject: [PATCH] io_uring: fail negative results for multishot issue too
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Multishot retries are issued through io_poll_issue(), which doesn't
share the IOU_COMPLETE handling in io_issue_sqe(). Move failing of
negative results and the restart code fixup to a helper and use it for
both, and drop the open-coded versions from the accept, multishot read,
and uring_cmd handlers.

Signed-off-by: Jens Axboe <axboe@kernel.dk>

---

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index be5a4f9505e0..eba8132d6823 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -1526,6 +1526,19 @@ static inline int __io_issue_sqe(struct io_kiocb *req,
 	return ret;
 }
 
+static noinline void __io_req_fail_on_error(struct io_kiocb *req)
+{
+	req->cqe.res = io_fixup_restart_res(req->cqe.res);
+	req_set_fail(req);
+}
+
+/* Fail requests completing with an error, and fix up restart codes */
+static inline void io_req_fail_on_error(struct io_kiocb *req)
+{
+	if (unlikely(req->cqe.res < 0))
+		__io_req_fail_on_error(req);
+}
+
 static int io_issue_sqe(struct io_kiocb *req, unsigned int issue_flags)
 {
 	const struct io_issue_def *def = &io_issue_defs[req->opcode];
@@ -1537,11 +1550,7 @@ static int io_issue_sqe(struct io_kiocb *req, unsigned int issue_flags)
 	ret = __io_issue_sqe(req, issue_flags, def);
 
 	if (ret == IOU_COMPLETE) {
-		if (unlikely(req->cqe.res < 0)) {
-			if (req->cqe.res <= -ERESTARTSYS)
-				req->cqe.res = io_fixup_restart_res(req->cqe.res);
-			req_set_fail(req);
-		}
+		io_req_fail_on_error(req);
 		if (issue_flags & IO_URING_F_COMPLETE_DEFER)
 			io_req_complete_defer(req);
 		else
@@ -1575,6 +1584,8 @@ int io_poll_issue(struct io_kiocb *req, io_tw_token_t tw)
 		return -EFAULT;
 
 	ret = __io_issue_sqe(req, issue_flags, &io_issue_defs[req->opcode]);
+	if (ret == IOU_COMPLETE)
+		io_req_fail_on_error(req);
 
 	WARN_ON_ONCE(ret == IOU_ISSUE_SKIP_COMPLETE);
 	return ret;
diff --git a/io_uring/net.c b/io_uring/net.c
index 04927fa5d242..cca940b36759 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -1727,8 +1727,6 @@ int io_accept(struct io_kiocb *req, unsigned int issue_flags)
 	}
 
 	io_req_set_res(req, ret, cflags);
-	if (ret < 0)
-		req_set_fail(req);
 	return IOU_COMPLETE;
 }
 
diff --git a/io_uring/rw.c b/io_uring/rw.c
index e3a752225dbb..f6849c5ec64a 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -1057,10 +1057,6 @@ int io_read_mshot(struct io_kiocb *req, unsigned int issue_flags)
 		return IOU_RETRY;
 	} else if (ret <= 0) {
 		io_kbuf_recycle(req, sel.buf_list, issue_flags);
-		if (ret < 0) {
-			ret = io_fixup_restart_res(ret);
-			req_set_fail(req);
-		}
 	} else if (!(req->flags & REQ_F_APOLL_MULTISHOT)) {
 		cflags = io_put_kbuf(req, ret, sel.buf_list);
 	} else {
diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
index ba2d8c9028eb..4706cf61d37e 100644
--- a/io_uring/uring_cmd.c
+++ b/io_uring/uring_cmd.c
@@ -262,8 +262,6 @@ int io_uring_cmd(struct io_kiocb *req, unsigned int issue_flags)
 	}
 	if (ret == -EIOCBQUEUED)
 		return ret;
-	if (ret < 0)
-		req_set_fail(req);
 	io_req_uring_cleanup(req, issue_flags);
 	io_req_set_res(req, ret, 0);
 	return IOU_COMPLETE;

-- 
Jens Axboe

