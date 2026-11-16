Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794804327;
	b=2pia5ihpNrUu1lyiCs1yrpm9stOi/cpKupEYX4WbhMdlbcSpnsIjOCaey2WQIeGx5X7n
	 0RWLdOQlpbYURpDy+y+MqBfOtUJf8jaqPxjizc9PBwmJT5q59TMHDvNZU44HY4WV1ZF2p
	 2k36cH2VBPwmryQ0QEFphdQKe0vJYzfyAsUaR0wKSTSf66hy4Qo2VPCLmogbC+uUdwVfb
	 +LCOoFbjQHUbKsb2+UxE2yga9UGmV54TFuSHvADy2sXeiiR/VVyIHWMH+9eY8XBN+62l6
	 hpFEAX9rb7D5ShPOZYIz3enqdmT59hdyDvVLCN9lQlUZq0OG6nIfYV1udf5qMWQzOXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794804327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0HbxzpoKVbzRpjQoVSFAE079JjbQp+u9Wan9S/2jnpo=;
	b=VKHg+3/OFl3uEzUeMzxvyx8at2VeMaUYBo44zgdyhSQBuvJTJCAVRf71e7pNFqFvV8wU
	 /WDzIvCaO5fjhgo/SOW5HeNglp9IMeZusfHyo8/wrWIqhF/xWRG5w8FKUz3MrYx1YsaXb
	 LxbKO97b+wPjUjW9cCikM9nS7milB7Ulp5X/N2C1YBYkecNiOgXPqo7t3X7gbmE7z4vwF
	 Oj9DvWRpI1G8J32htIsZbM6T6j5Qlh976qu5gDa583aiJCI5NZyClrmYW76Z9dxLaD6PJ
	 F1Vt1UxvXg1CJFl0RuBAuMcFqtRifwaTl3jnTk8tRB6H6yDSotuCUdJYklGKl5YA23g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qGYEWpVP;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29194606A31F
	for <io-uring@vger.kernel.org>; Mon, 16 Nov 2026 04:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29194606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qGYEWpVP
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-37198ed3727so4582961eec.0
        for <io-uring@vger.kernel.org>; Sun, 15 Nov 2026 20:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794804326; x=1795409126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0HbxzpoKVbzRpjQoVSFAE079JjbQp+u9Wan9S/2jnpo=;
        b=qGYEWpVPOlxL6NnC30g2FM/x5cSBORzLxYHfNvXjaV1qzl/VGbrE+R+y82xWMU/UOr
         yf6stfreQCgMCW7USIoqa5YX2Qh4uym/Kq0k3aCxL/J77Gw7p9UrecXVAQNvCYMsbypm
         FH1lLgraQw3ejEjZa0MfN8aLMx/e0tcOjZEtJc5UV89JSGlxJZmBPqCLeYuOBpKMYnli
         DkcoqUJJlV2MiDh0JnPmS83f8mlLI4X+Ux3BAKmj0oYloJaDq0triFaVL1/Qo+sWG3NR
         jh9lW+T10seGQvoNyycQeS1t82rFcwPyIlIgc0glh9FaDIbhgYpOtgG0IKEbM6xMspM+
         1AzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794804326; x=1795409126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0HbxzpoKVbzRpjQoVSFAE079JjbQp+u9Wan9S/2jnpo=;
        b=HjLD3eI72Jp+S1AXEYARd+LNyUMYD2x2A26Zz2qpghA3r62AX8xsJgh9yFsgSs9C+E
         MnfisjGX0/DPnKlQdaUVqlCK7yffCZomfErIvitQl3OY5YVVqCvOYmj7AJk/MRAKP6xd
         7ZkklwgEuEYMLuQWHBFYI+//lbXGX5yIrGQobBCLvbfoZG4Z7vjj8CMhQBPLk7WD98tb
         LoBfd6rmw5Dl/9Se2skmnENOs07OTfKyDgmdATBLHL6O1vUaDgJKIN2vS0h5dA8l1a+C
         PSfPssg2uDeLelWvLDv7Bx3V1mrEYOvz0lnKpJqnec2IrA558xyW0wogHJdzashmK1o5
         9r8g==
X-Forwarded-Encrypted: i=1; AL+hErFW4rswNvYRqXZd2zpRZiWrIXFvzVut5fR6z5PeBJcvhzh3Py2EkXUlgSqG0+1qsNO7D4K3ic+Y4g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/fRr/02waVu13tvD0hsvqhv/ISHYVs6TGaJWXCmWt03r12tZse
	K5E7hrTxMa2+Gib0xE/WZcvXUCwkSAyEy8ZRbxACLsoyF8Ejpa2Ifji/wHWsw5tE1XM=
X-Gm-Gg: AYBFou0VfJK7jUqruipt+qqHStNGdJyAHFRnR3hUkc9VPwy/bDp9G5EWT9Lqjmz++CE
	/7ZCzeb0ZoGv+PddobnhAKx7hzEp85XZg2Qk4Q7LJyU1m9hFRa0lPH0/BxbHXf6AVZ25h3Q8KmQ
	UHydjG+ouIqsONPsE8Z47jAivzxqh+25YkJbUfewSSGsB/bBMN3Ojvw1uH2kdq1MYrtmyac9OOl
	T+WI9lyr8EqG14DqgdyL8MppmfTf5o9h1aB2H9/f4IbK9Mb+knzDH2YHVCAkivkFUzyaTYPGV+h
	cDnIClFTY0cHIRzxWlU4iEQf6mO/tfj+v5vE+3FlJKSQNcwNjeAvE7cDv6TPqgqctPjVLoAX8Y9
	Vt6s7ocPIFeOUOFMEY2jz4zwCsUGI2J3rhzOvPCt2KIZRRvLek214wuJ2JMccZBmD5R+PUq5wVI
	9yqrGAbfFe2gw/gSvDx8w0/J0w+S4IxftTZVfR2RgRrYcjY0bTWd6ffJe2nPBxgBRKJ48zOZiIA
	fYg41zs9mLgR6LkbnJWRnHRxUtiX6hBky1T+wBnDUrKCLQMWxWMYcJfYx46eCOgJ3GES/XiXeQV
	7vzyqiov5f4TK6IuvgdwkUDGfsdr2IQxn/35rVXfvWJlVOxAwjDoEoxLAfsmnvImISzR
X-Received: by 2002:a05:693c:60c1:b0:36a:2473:9b2f with SMTP id 5a478bee46e88-377e1af6414mr12491596eec.23.1794804325957;
        Sun, 15 Nov 2026 20:45:25 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm28626640eec.6.2026.11.15.20.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:45:25 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: David Wei <davidhwei@meta.com>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] io_uring/timeout: don't rearm a multishot timeout on cancel
Date: Sun, 15 Nov 2026 20:45:19 -0800
Message-Id: <20261116044519.281756-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
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

io_timeout_complete() does not check tw.cancel. When it runs from
io_cancel_local_task_work(), a multishot timeout that has not reached
its count still posts an IORING_CQE_F_MORE completion and rearms its
timer. With a zero interval the timer expires again right away and
queues new task work, so the drain keeps running it until posting a
CQE fails.

Normally the CQ fills up quickly and the request then completes. But
if userspace moves the CQ head far ahead of the tail, for example to
cq.tail + 0x7fffffff, posting keeps succeeding and ring teardown is
delayed for a long time.

Don't post another CQE or rearm the timer when tw.cancel is set, so
the request completes through io_req_task_complete(), like the poll and
linked timeout task work does when cancelled.

Fixes: ea97f6c8558e ("io_uring: add support for multishot timeouts")
Cc: stable@vger.kernel.org
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
Report: https://lore.kernel.org/io-uring/20261115163547.225149-1-teel4res@gmail.com/

Runtime-tested on v7.3 with the reproducer from the report.
io_timeout_complete() is the same in io_uring-7.4, where it is only
build-tested.

 io_uring/timeout.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/io_uring/timeout.c b/io_uring/timeout.c
index fa7b0d9a81d6..db78059cfeab 100644
--- a/io_uring/timeout.c
+++ b/io_uring/timeout.c
@@ -115,7 +115,8 @@ static void io_timeout_complete(struct io_tw_req tw_req, io_tw_token_t tw)
 	struct io_ring_ctx *ctx = req->ctx;
 
 	if (!io_timeout_finish(timeout, data)) {
-		if (io_req_post_cqe(req, -ETIME, IORING_CQE_F_MORE)) {
+		if (!tw.cancel &&
+		    io_req_post_cqe(req, -ETIME, IORING_CQE_F_MORE)) {
 			/* re-arm timer */
 			raw_spin_lock_irq(&ctx->timeout_lock);
 			list_add(&timeout->list, ctx->timeout_list.prev);
-- 
2.34.1

