Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088965;
	b=Lahx3HzSQpXpm5/q6Qz8Suu9b7zCsGT/fujqb3Dtn8xOzvyO5/Jw8lX3CEA0pB+tPWH8
	 g679YKpUbbzsIBcZXDxShtgpGaoHvmsfVRiK8p0f9EgHeg/9RaLDmp0dqPY5P+hDcFtrn
	 NFE5rOX8sG36ImlemHAbt/AAYrcg9SmpiprxBufH0pZtOfu8XIrWibZYZwR3j3edweN6L
	 GprMStnTvQXLGQe6IL3hxCvn5p5aCaDvQzj8dInYYOOOHXzDpUjR6gIGFoh8My3sXMpGe
	 dEkSwyoFgjEGh8mzB+eNbnS2KnNA/LlPuc/UGEprpUR0bS1v8P1PIc15VL6dVY4e99g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088965;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=WOjvdHFZJhxTSRqOV4KMRhV4WehW3lyrqK+mm7lp7Vw=;
	b=5OT2hnzXM0kMPvwW9k+d69TUzBsiQsNHSXUim5EWuVzb1ADbnvhvl9PFjkeP3FRsTrnz
	 nFZ26IUYhd5rsDyXgXDShyDovUQb3ARHItBRPmN06gCYnIwgZnoxmwJqB0+5Kc6ijcaxh
	 IuzUaeHxBaQaao0gNH06nehplhl8bibBzJJSRQm0ZT6Q8JnCapJJvkTmPqy1s90pUvlKF
	 AISdJanrg9+7VemLobIJSbKT8lV3bsEtmRwrr2B08FbmkVXAKiG8fzCdkM8e0WiNJknDT
	 WDonXu/FKnmkT+sHMz7sUfvHeCs5HmmFMCNIk+nSb8jJ0aXhXwgT+vKYMc+j71QCUdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=pG0ZEesL;
	arc=none smtp.remote-ip=203.254.224.25
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7563C606A33D
	for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 11:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7563C606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=pG0ZEesL
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261119114922epoutp02aa7d6b74762755f04e99e55ac63b8aac~pb_amHFm-2967229672epoutp02d
	for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 11:49:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261119114922epoutp02aa7d6b74762755f04e99e55ac63b8aac~pb_amHFm-2967229672epoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795088962;
	bh=WOjvdHFZJhxTSRqOV4KMRhV4WehW3lyrqK+mm7lp7Vw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pG0ZEesLUNkNplzEHupiN6k+tNvatEzlngA1+n/uRDQKYq7RiTRdZ4zxRSd/tDrP7
	 JB3H/+pfyIrU6NX5C4xuD05+s/cYvkBlfr6/OUXZxBBTtxtXYBAlhgUaDjrPCxqGqe
	 fGvjF4ZB6kgrsAr3xCVKYN5xwqGHwCcwJ7Tbrc9Y=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20261119114922epcas5p449340df7af188640373a832441a450ed~pb_aLYUpl1084610846epcas5p4M;
	Thu, 19 Nov 2026 11:49:22 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.87]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4jVcFX040Zz6B9m4; Thu, 19 Nov
	2026 11:49:20 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261119095728epcas5p4b40c41eae2b6c6eb852f472762a25d3b~pactI_2J10192401924epcas5p4c;
	Thu, 19 Nov 2026 09:57:28 +0000 (GMT)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261119095726epsmtip1eb24622127108000e4cec885d45b5915~pacrBQNkM2192721927epsmtip1b;
	Thu, 19 Nov 2026 09:57:25 +0000 (GMT)
From: Anuj Gupta <anuj20.g@samsung.com>
To: axboe@kernel.dk, asml.silence@gmail.com, kbusch@kernel.org, hch@lst.de,
	sagi@grimberg.me, James.Bottomley@HansenPartnership.com, mkp@kernel.org,
	bernd@bsbernd.com, joannelkoong@gmail.com, miklos@szeredi.hu
Cc: io-uring@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
	fuse-devel@lists.linux.dev, joshi.k@samsung.com, anuj20.g@samsung.com
Subject: [PATCH v4 5/5] nvme: support dma-buf registered buffers for
 passthrough
Date: Thu, 19 Nov 2026 15:26:15 +0530
Message-Id: <20261119095615.1840522-6-anuj20.g@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261119095615.1840522-1-anuj20.g@samsung.com>
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
X-CMS-MailID: 20261119095728epcas5p4b40c41eae2b6c6eb852f472762a25d3b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261119095728epcas5p4b40c41eae2b6c6eb852f472762a25d3b
References: <20261119095615.1840522-1-anuj20.g@samsung.com>
	<CGME20261119095728epcas5p4b40c41eae2b6c6eb852f472762a25d3b@epcas5p4.samsung.com>

Allow registering a dma-buf against an NVMe namespace character device
and using it as the data buffer of fixed uring_cmd passthrough I/O.
Complete through io_uring_cmd_hw_done(), so the dma-buf map is released
at hardware completion.

Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/nvme/host/core.c  | 16 ++++++++++++++++
 drivers/nvme/host/ioctl.c |  5 +++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index f43582e5f6c4..f12cea7cbc8a 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -8,6 +8,7 @@
 #include <linux/blkdev.h>
 #include <linux/blk-mq.h>
 #include <linux/blk-integrity.h>
+#include <linux/dma-buf-io.h>
 #include <linux/compat.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
@@ -4028,6 +4029,20 @@ static int nvme_ns_chr_release(struct inode *inode, struct file *file)
 	return 0;
 }
 
+static int nvme_ns_chr_init_dma_buf_io_ctx(struct file *file,
+					   struct dma_buf_io_ctx *ctx)
+{
+	struct nvme_ns *ns =
+		container_of(file_inode(file)->i_cdev, struct nvme_ns, cdev);
+	struct nvme_ctrl *ctrl = ns->ctrl;
+
+	if (ctx->dmabuf->size > UINT_MAX)
+		return -EINVAL;
+	if (!ctrl->ops->init_dma_buf_io_ctx)
+		return -EOPNOTSUPP;
+	return ctrl->ops->init_dma_buf_io_ctx(ctrl, ctx);
+}
+
 static const struct file_operations nvme_ns_chr_fops = {
 	.owner		= THIS_MODULE,
 	.open		= nvme_ns_chr_open,
@@ -4036,6 +4051,7 @@ static const struct file_operations nvme_ns_chr_fops = {
 	.compat_ioctl	= compat_ptr_ioctl,
 	.uring_cmd	= nvme_ns_chr_uring_cmd,
 	.uring_cmd_iopoll = nvme_ns_chr_uring_cmd_iopoll,
+	.init_dma_buf_io_ctx = nvme_ns_chr_init_dma_buf_io_ctx,
 };
 
 static void nvme_add_ns_cdev(struct nvme_ns *ns)
diff --git a/drivers/nvme/host/ioctl.c b/drivers/nvme/host/ioctl.c
index d342ccad067a..3f240c9a537f 100644
--- a/drivers/nvme/host/ioctl.c
+++ b/drivers/nvme/host/ioctl.c
@@ -472,7 +472,7 @@ static enum rq_end_io_ret nvme_uring_cmd_end_io(struct request *req,
 			blk_rq_unmap_user(pdu->bio);
 		__io_uring_cmd_done(ioucmd, 0);
 	} else {
-		io_uring_cmd_do_in_task_lazy(ioucmd, nvme_uring_task_cb);
+		io_uring_cmd_hw_done(ioucmd, nvme_uring_task_cb);
 	}
 	return RQ_END_IO_FREE;
 }
@@ -533,7 +533,8 @@ static int nvme_uring_cmd_io(struct nvme_ctrl *ctrl, struct nvme_ns *ns,
 					ddir, &iter, issue_flags);
 		else
 			ret = io_uring_cmd_import_fixed(d.addr, d.data_len,
-					ddir, &iter, ioucmd, issue_flags, 0);
+					ddir, &iter, ioucmd, issue_flags,
+					IO_URING_CMD_IMPORT_DMABUF);
 		if (ret < 0)
 			return ret;
 
-- 
2.25.1

