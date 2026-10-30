Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334065;
	b=iL6ynkkXGbXGr1NVWDPo5xtB6j2BVhZjy668yQlVqvb73s29m2y2RXvWR0M0RD2gBKX1
	 y8+lZvdqtPxeIq6ZECt0X5KzYXw4p+tn6e3Pb9nFIFrkBtNhRfIE0Pl9GEbxVlc3gIYYX
	 cyjZXCxGeemzfBFcgFQWXwCz+A3IN/rRhyZBYeSx0oo6UcOMTp66hnOZ3nYHX/AcuCD/q
	 rBlRPFoKYlXAW+DRsdOOhPMCQqvTgWsZVrOQN+tDoxFz+AfedngZc94Wvl/Dz6aDXPwhe
	 PpFAFjbVHwdw4I751XJyduHYjpX8Le3dsCCRDbhW1kByPOFmTs8nvuYSTJQdCN+R8LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=qZ0HEHSSnJ62DFFfvad+4V9OpH4w50W8/K1tySVDK+A=;
	b=UlpSKdzynfUwojaFQ5DUou5iG4pRxvSP8w7z5U6JTfFZvFCybqRl+QLNc02P9xBsGgd3
	 mLkTooOp6ypbeNNw6jcHaB4xO+an7Lh7NHIVHjM+kLBZn3XXISWDPFm8Xcu3R+3obcyTb
	 Jj4PIRY4VD82Qno2FuUCvmkBllAckTP5JiJN7VT59HhfGIBDPe4QQ99t2Ti0Si7u0f5iI
	 9seJc3j8vpDHbFxnfoLRjcdoQt1wuke+yTOHVplB75xbCZi60u25eJVFFV6XBNKj/0xLY
	 ISofuN7gY6Oluj+h9TAmIkeb+Y+oeloYvBxfqybRjMQD/P1OFNcLxYNPgc6Q0Tf33/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=XjS0H6aE;
	arc=none smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8ECA606A31C
	for <io-uring@vger.kernel.org>; Fri, 30 Oct 2026 04:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8ECA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=XjS0H6aE
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-48e94879f02so96352fac.0
        for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 21:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1793334063; x=1793938863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qZ0HEHSSnJ62DFFfvad+4V9OpH4w50W8/K1tySVDK+A=;
        b=XjS0H6aEzIPpb1+pzOo2LNNGgqlyIQfmi4OlZjOB3OcgfWKXur/unvW7LyUML86H6j
         1mhl2PktMNSsruuGNYX2X+NPkELNx/nGdB29yXQqWNIMOi3x0TJPi3L2XNi0zOGInzTj
         fWQ4A+/KyQ3EjrKT88OJW3LVp2NHKU9meeH+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334063; x=1793938863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZ0HEHSSnJ62DFFfvad+4V9OpH4w50W8/K1tySVDK+A=;
        b=A/4BzToNdzQS++x6u2NsbkmqUT+U0T6BF9pxi3hM8r9jItzisvRJ2lzYFyVMyUIorj
         lxTjXTeZF9ptU4DBexN5H6bBo8yhJOBW6PxjhUren4HLF208MclnMKgKLTqIkL8k38ht
         8vhMvfSRA/vtx1hsY6T2rjNeOpY4+2ILgoeAJRJk5ZBTwTYFG5AZpxyNmZlyfTwtWCOO
         8pe4K8tNE6vcodovYlCsFju+0m0eAfF9M5rxXEjYnfulbpjHfPNTgePxFyBWmGy2d9XH
         BFkfaHJ9STn5+1VuUjqUPzFMLM+mBwxgyDKEyQR5lV/mTuhD0WvUhdcarjr7UeRWA1kL
         1eAQ==
X-Gm-Message-State: AFq9FYLd8/NP3DiiFK/Bo7LPBwCED4FZ51tW9cF23hOPW+Ir4vrnI5WE
	MUDlm15eJQi17Lyj6eq5H+oBtRvw8hdNaaaVBpCPSGP1YEo2FxtYTrovxS/hEChGuU9hPlO8WTi
	IA5Qt5+g=
X-Gm-Gg: AYBFou0ajRgckshVAImHmyKkoEgE14weuBY4J5sAIqBQX3ZNfNxpTNL/YQER1UBky4y
	PlCo8x33Gj7xEmtepKz25oGLVm7eMm4FoF8qpEHBvKzXDx6Ww4OGzNfMDh18k783qyLX2zAAX6K
	I/a641r5YPs0gV3xvBqzRZyWkVdR12+rWzHMHNoW6wtE9+IzeMyyxT3gnP6qL76qqWcTx9FeIro
	0r3Kieg4luw1v3RhOes3YBrTssktffwSW6fbjKNcu/HKFj7hJO32/bbpGXYLx9NicJHvluSKnp9
	A8hKEvEows+BLrog5eDHdh8YAolIdkAjnUqMF63kA5eIdXV6Wjd57uXmVNvaxLw9bq4rtpQ8a5Q
	TLuj1KnsYUqHTMmZIpzi9x5oTnu7VxuLS5EqeIQ0bF8+dKMMHaEPD+7fhHxnVr5nxlwFA6+qtRl
	WVJeyLT6xcots1d3dNWARdhH5YNqzYOGoF+riRIlJ9lF1qzMb5/pFbosHncNdU3svv0YbR3QIkG
	fwuWKRs69ClP0lHLPA9u331ExLDgr3+HeY1JAFEJB6EmZ8SggKeen/uHqb1IgNtRHoXCDuTnxgz
	w6xiD3BZXAFRci8h78jh3TSsyQoe1fhaHqox9WksUKPpdwsEkuTTFV0qQxQSWok3eiF4KNOK4k/
	e7juhI1gbXpeXLPvRjKdfrrPF/S6CFA==
X-Received: by 2002:a05:6870:16f6:b0:46a:c217:c56d with SMTP id 586e51a60fabf-4a9072f137dmr728856fac.2.1793334063494;
        Thu, 29 Oct 2026 21:21:03 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a90ae4e9absm830912fac.4.2026.10.29.21.21.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 21:21:03 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: io-uring@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>,
	linux-kernel@vger.kernel.org,
	outbounddisclosures@openai.com
Subject: [PATCH] io_uring/io-wq: save worker type before dropping its reference
Date: Thu, 29 Oct 2026 21:21:01 -0700
Message-ID: <20261030042101.73491-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
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

io_wq_cancel_tw_create() inspects cb->func after calling
io_worker_cancel_cb(). For an existing worker, that call can drop the
last worker reference and wake io_worker_exit(). If the canceling task
is preempted, the worker can be unlinked and freed by kfree_rcu() before
the callback function is inspected. KASAN reports a slab-use-after-free
read in this path.

Save whether the callback belongs to an unpublished continuation worker
while its reference is still held, then use the saved result for the
conditional free. This preserves the existing accounting and frees only
the worker allocated for the canceled continuation.

Fixes: e6db6f9398da ("io_uring/io-wq: only free worker if it was allocated for creation")
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
I have a reproducer for this issue and can share via DM

 io_uring/io-wq.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
index e93cfa82b850..b6c857544421 100644
--- a/io_uring/io-wq.c
+++ b/io_uring/io-wq.c
@@ -1428,14 +1428,16 @@ static void io_wq_cancel_tw_create(struct io_wq *wq)
 
 	while ((cb = task_work_cancel_match(wq->task, io_task_work_match, wq)) != NULL) {
 		struct io_worker *worker;
+		bool free_worker;
 
 		worker = container_of(cb, struct io_worker, create_work);
-		io_worker_cancel_cb(worker);
 		/*
 		 * Only the worker continuation helper has worker allocated and
-		 * hence needs freeing.
+		 * hence needs freeing. Save this before dropping its reference.
 		 */
-		if (cb->func == create_worker_cont)
+		free_worker = cb->func == create_worker_cont;
+		io_worker_cancel_cb(worker);
+		if (free_worker)
 			kfree(worker);
 	}
 }

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.56.0
