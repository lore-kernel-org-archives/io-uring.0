Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253F944065E
	for <io-uring@vger.kernel.org>; Wed,  2 Sep 2026 22:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788389842; cv=none; b=oLaft3jCwNh25+Xn9oFtEkvvJZzDpbRregXD9u0DIteZno/mc4ZpSMFJIHDi8GKdMRTViYGHY71694kl3+iE00w8/mKXC1lJsX5YDkD8BYuoBXtngeL+UtN7UhOD4++2KPCb/qCD082ThNeUn7pfkuCW2kDZXcEa+tmRwfZNAW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788389842; c=relaxed/simple;
	bh=bEvi/DEoVPBnBzRmjBL5T1wZVH3yYVUQrrL2S5FKD7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i1xzsPgcDE+rQ6lQVAhPg1pUvl/JjspSX8yTJXFwd9vYphZynp0fWOnHeotmzZBm3pQYRSkrnFJcnjP3s9Uwzw2+x3YejBnfPbxH4bKZJqfr5q/6vj5oOyUS1L/8JidAVI+vI+5VXSu2dzzHfHI81zvhbz10lyJdFiiM2RxD6oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=HcWt5kM3; arc=none smtp.client-ip=209.85.214.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="HcWt5kM3"
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2d01548ac96so1725545ad.3
        for <io-uring@vger.kernel.org>; Wed, 02 Sep 2026 15:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788389834; x=1788994634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i/dqMqkRLXLgOf/iN7bfg+WtTxgpBe43DRYOg5f23zY=;
        b=HcWt5kM32WJql329Rbi6Vdcrp4krDm5BWR4DoVInroEgyqhqJOPaI4fP025MytzRrO
         CwPQkkPce/0Hosv9xprmX4/X7dIEed9dgCX2o50qjoXO+S4ig87/z8kUMTk60X7J2kUy
         F4SgengeQJ65hClX2ADLKxhFMblNcqXwPDOrhbcDtYkRjhjkR/iHzcrqaNrba5ATTBY2
         Im+0+SSXlhZJ9BTHqGSduzdBUMZi3x5H9fRGAy4mcPhQDhXshy+6ULtGUAAVCEN94Y+R
         akxO5l4f8QPvFdVZBVDfjp64AxorN7T52QnUndBdj4W2aARdZtbIgzN99WCXFKHHzY7r
         ErLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788389834; x=1788994634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i/dqMqkRLXLgOf/iN7bfg+WtTxgpBe43DRYOg5f23zY=;
        b=LSlbCLYzYEP36R45g474G3eRrvElPqCmHH9Sx2o2OrrNpjlItr7wVmB7rRlmQKGyQE
         RO92nK6gCPdtP15fK5/dYcCyyTHA1FhdaeGS2LMrZX17+WQzT9CJbGgTVYc1a6659ExO
         w2AzkVlW7IzuUQkkK05MU3LGI5k8NrT2bcYQUW+LaOvg5VfPE+hODhu8iVnVcm3bRMKC
         bggxYqHuIa8Uykcz6IivGRdcT7EIl1GN56aYcpEODdBhbDYkgM6aFC9g4uV+MAS3eDeD
         o5mOGN1PH3TguoSQd83bvSoRHEV/UONbHq73U2LJsHF/K27/h3xPi5spAl15pNfBSguP
         Yt0w==
X-Forwarded-Encrypted: i=1; AKwUvBx7VOxdlta3gXSaG2fokFJVdKv9BP9g8DIE/VLmiLmhTiFrUjb4j710J96VKdlck8ue0U6iWQcdvA==@vger.kernel.org
X-Gm-Message-State: AFuF++koSFfUIuK0kb28PyAojInNUmEglD+Yul7utKKhOex4vtX3ij7b
	cVnoIXYr/IwxcXt+cfoL7SRh+dF2OWE+k/a1IrDlO/WXM00TGmth7cuoCx3i0oB1xcmTF3neWkw
	ewfFN9TtiLHYayuRcuAE20pG2rHRg+21JW1yQxYBAChIBx0QaDaQP
X-Gm-Gg: AYBFou3K904TJdb+nkBxPvtbv0h2S8HlnZl2EP3gAkT7ASVUEbgOzIRxKwDbrwQ9U4L
	O7FfVUaeDuk0AYyzw0G+3n8sD/x8rymqaWUQvci0I2AYv1bMt3cidVACdF8EpjP28qSWLnvXhV0
	HUyWb/ZmA0c7a7Myd1alJwSTHO9hD4HJCR8jb7xSnOxMRnfYtILDDsaBmNqAU9eUun7EBC+VkLQ
	zwdWAx0XH2CuRx4v3vMhIlganMGoBAcnTBYJjwBacUnoW/NYIAz3hBI+zZhgrXWXcmJVBgNmSZh
	notzR2pI8ifWJM0y9xkrejiGp2vlLoJWfbwAZNLdIK/0fzwxaUhG+Xtf3cxlfMXzpts32yOdAp2
	F/emhLcMHqRroDc7b
X-Received: by 2002:a17:90a:e7d1:b0:38e:6d4c:14df with SMTP id 98e67ed59e1d1-39aedec8443mr7525746a91.1.1788389834532;
        Wed, 02 Sep 2026 15:57:14 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-3325680a589sm24784eec.3.2026.09.02.15.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:57:14 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.112.12.104])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id A7B4540423;
	Wed,  2 Sep 2026 16:57:13 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id A1AC3E40404; Wed,  2 Sep 2026 16:57:13 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Joanne Koong <joannelkoong@gmail.com>,
	linux-nvme@lists.infradead.org,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v2 2/2] nvme/ioctl: call io_uring_cmd_set_res32() in ->end_io()
Date: Wed,  2 Sep 2026 16:57:08 -0600
Message-ID: <20260902225708.2379840-3-csander@purestorage.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902225708.2379840-1-csander@purestorage.com>
References: <20260902225708.2379840-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_uring_cmd_set_res32() only performs loads and stores to the io_uring
request state, so it's safe to call in interrupt context. Move the call
from the nvme_uring_task_cb() task work to nvme_uring_cmd_end_io(). This
unifies the 2 places setting the NVMe status and result on the uring_cmd
and removes the need to pass them through struct nvme_uring_cmd_pdu,
saving 16 bytes and a couple memory accesses.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 drivers/nvme/host/ioctl.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/nvme/host/ioctl.c b/drivers/nvme/host/ioctl.c
index 6539d4750098..3aa5d2f2dfbb 100644
--- a/drivers/nvme/host/ioctl.c
+++ b/drivers/nvme/host/ioctl.c
@@ -421,12 +421,10 @@ struct nvme_uring_data {
  * Expect build errors if this grows larger than that.
  */
 struct nvme_uring_cmd_pdu {
 	struct request *req;
 	struct bio *bio;
-	u64 result;
-	int status;
 };
 
 static inline struct nvme_uring_cmd_pdu *nvme_uring_cmd_pdu(
 		struct io_uring_cmd *ioucmd)
 {
@@ -438,29 +436,30 @@ static void nvme_uring_task_cb(struct io_tw_req tw_req, io_tw_token_t tw)
 	struct io_uring_cmd *ioucmd = io_uring_cmd_from_tw(tw_req);
 	struct nvme_uring_cmd_pdu *pdu = nvme_uring_cmd_pdu(ioucmd);
 
 	if (pdu->bio)
 		blk_rq_unmap_user(pdu->bio);
-	io_uring_cmd_done32(ioucmd, pdu->status, pdu->result,
-			    IO_URING_CMD_TASK_WORK_ISSUE_FLAGS);
+	__io_uring_cmd_done(ioucmd, IO_URING_CMD_TASK_WORK_ISSUE_FLAGS);
 }
 
 static enum rq_end_io_ret nvme_uring_cmd_end_io(struct request *req,
 						blk_status_t err,
 						const struct io_comp_batch *iob)
 {
 	struct io_uring_cmd *ioucmd = req->end_io_data;
 	struct nvme_uring_cmd_pdu *pdu = nvme_uring_cmd_pdu(ioucmd);
+	u64 result = le64_to_cpu(nvme_req(req)->result.u64);
+	int status;
 
 	if (nvme_req(req)->flags & NVME_REQ_CANCELLED) {
-		pdu->status = -EINTR;
+		status = -EINTR;
 	} else {
-		pdu->status = nvme_req(req)->status;
-		if (!pdu->status)
-			pdu->status = blk_status_to_errno(err);
+		status = nvme_req(req)->status;
+		if (!status)
+			status = blk_status_to_errno(err);
 	}
-	pdu->result = le64_to_cpu(nvme_req(req)->result.u64);
+	io_uring_cmd_set_res32(ioucmd, status, result);
 
 	/*
 	 * For IOPOLL, check if this completion is happening in the context
 	 * of the same io_ring that owns the request (local context). If so,
 	 * we can complete inline without task_work overhead. Otherwise, we
@@ -469,11 +468,11 @@ static enum rq_end_io_ret nvme_uring_cmd_end_io(struct request *req,
 	 */
 	if (blk_rq_is_poll(req) && iob &&
 	    iob->poll_ctx == io_uring_cmd_ctx_handle(ioucmd)) {
 		if (pdu->bio)
 			blk_rq_unmap_user(pdu->bio);
-		io_uring_cmd_done32(ioucmd, pdu->status, pdu->result, 0);
+		__io_uring_cmd_done(ioucmd, 0);
 	} else {
 		io_uring_cmd_do_in_task_lazy(ioucmd, nvme_uring_task_cb);
 	}
 	return RQ_END_IO_FREE;
 }
-- 
2.55.0

