Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867657;
	b=LWdCbb2eZfAG9jGJixcvXDr5yZqzYi14c+EAIYr55CflHXm5g3FU3mynsNe1Pjx/No0r
	 lm9mIyl4u9QvdnWFYrdqeSJvXKo1gEchkVcovgRUjgRMz3Wk5JT8CPMLuSNlyS6qEhHWu
	 zi7Sb4544/uAK0VVOXrm6OqIvYsXbLHE+4K4Wm9EukkT6/91N2y9GFAyPj8jHQvatkhKG
	 c/itdiDlbOutEa/x7X20ZDOyOs5++gNLw8D0AJiVhgmxfa+xKE9JDOeKxdpEMiv2OCo/r
	 RwP/kqao/XR2senX3E8dSeakIJ4jbUrlwBFOp612AOiyaQFPKEKoASxRW7kNhqZbJmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867657;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=t0tTsgEMlwJBbe9aNh1uCVy98WSTqrxT5/Z5tObPW1Y=;
	b=lPtCcxgRzg80UQw6ooLMdiutDCgitXuu6ZZ0fm+mKRRoMG+s3vNJhCeL/mZzAFiRkcwg
	 KknE8NUDuZcMxUkdToQYSWOFQRhRefBPBb6FODS4372TmGjT12fWj3cRXMWxXHf3C2Lq5
	 d/rEVXbZsTZZAKmr6TYV4yPytsi/QMjZPsyTsEzSKjiwo1yLcmIZTDvzT7cO9LxWQ13M1
	 kiztogyN1YNK4x5tfNz8Fk8xInAoNsmLOIfKdNgKhxt/xeElJ9T/AkKxKgX3SkPyk6JdK
	 Q3Q7WiUS+Zeeyf0tYn2DOW/L8Pkg0d+ixqItSAs5DLPWy7fIFNqKmmJiwrVlEfPwOJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kaihong.com;
	spf=pass smtp.mailfrom=kaihong.com;
	arc=none smtp.remote-ip=115.124.28.106
Received: from out28-106.mail.aliyun.com (out28-106.mail.aliyun.com [115.124.28.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80864606A31B
	for <io-uring@vger.kernel.org>; Thu,  5 Nov 2026 08:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80864606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kaihong.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaihong.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.3411309|-1;BR=01201311R101S99rulernew998_84748_2000303;CH=blue;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0302241-0.000575557-0.9692;FP=9957485192350860691|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033045166233;MF=yanghaoming@kaihong.com;NM=1;PH=DS;RN=3;RT=3;SR=0;TI=SMTPD_---.jxQPk5v_1793867643;
Received: from localhost.localdomain(mailfrom:yanghaoming@kaihong.com fp:SMTPD_---.jxQPk5v_1793867643 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 16:34:04 +0800
From: yanghaoming <yanghaoming@kaihong.com>
To: io-uring@vger.kernel.org
Cc: axboe@kernel.dk,
	syzbot+9f32706bfd7c4ff81434@syzkaller.appspotmail.com
Subject: [PATCH] io_uring/sqpoll: make io_sq_thread_stop() idempotent IO_SQ_THREAD_SHOULD_STOP may already be set when io_sq_thread() exits on its own. The last ring still calls io_sq_thread_stop() from io_put_sq_data(), which tripped WARN_ON_ONCE(). Reproduced on 7.4-rc1 with IORING_SETUP_SQPOLL + close(ring_fd), which triggered WARNING at io_uring/sqpoll.c:88 before this patch. With this patch applied, the same repro no longer warns (also verified via QEMU initramfs repro). Fixes: 22d9db9fd64a ("io_uring/sqpoll: don't attach to a thread that is canceling") Reported-by: syzbot+9f32706bfd7c4ff81434@syzkaller.appspotmail.com Link: https://syzbot.org/bug?extid=9f32706bfd7c4ff81434 Tested-by: yanghaoming <yanghaoming@kaihong.com>
Date: Thu,  5 Nov 2026 16:33:54 +0800
Message-Id: <20261105083354.3205661-1-yanghaoming@kaihong.com>
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

Signed-off-by: yanghaoming <yanghaoming@kaihong.com>
---
 io_uring/sqpoll.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/io_uring/sqpoll.c b/io_uring/sqpoll.c
index c833e776320d..f0c9e07c2d04 100644
--- a/io_uring/sqpoll.c
+++ b/io_uring/sqpoll.c
@@ -80,14 +80,17 @@ static void io_sq_data_release(struct io_sq_data *sqd)
  * ctx_list by now and have no request left, so the thread can reach none of
  * them. What it still uses is its own or counted: the sqd by free_refs, the
  * hash of its io-wq by hash->refs.
+ *
+ * IO_SQ_THREAD_SHOULD_STOP may already be set if io_sq_thread() is exiting on
+ * its own; only wake a thread that is still running.
  */
 void io_sq_thread_stop(struct io_sq_data *sqd)
 {
 	struct task_struct *tsk;
 
-	WARN_ON_ONCE(test_bit(IO_SQ_THREAD_SHOULD_STOP, &sqd->state));
+	if (test_and_set_bit(IO_SQ_THREAD_SHOULD_STOP, &sqd->state))
+		return;
 
-	set_bit(IO_SQ_THREAD_SHOULD_STOP, &sqd->state);
 	mutex_lock(&sqd->lock);
 	tsk = sqpoll_task_locked(sqd);
 	if (tsk) {
-- 
2.34.1

