Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793324784;
	b=ucWVrVts4tx7vFTFlYXqYZ18ulMurotrYjyfvvMOSpzYbQMSXJnEU9hOu64RL94mYuHy
	 fL7lZalQohGFZFEcYIsNsy7l/iirwRWgpVRfe8zYSL4dRMj2AYqTkLmMhnChDwhgiZoGj
	 2geoULP+O5+WMkuqbgKvB0PPSJTna6TkN4OZypQwd3vpPed8rdAoP8YguyiStl5MoskZX
	 pA1l2vuEQrSc6wM2XkzCYX0Sy2FZ7a3LTaekXxQswxqcp2k+PwsZvQnuYt+qEK89PE7tm
	 rLmvcFx+gIYWfjYeXhEgou9KGUNZ1svUQCKj1PfvtDkA5okeDX0U0q7L3qsD48FawEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793324784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SF9HmYpsqJyt4I9c/G5LCdmVYCdb7Ms79eOZlmLUUW8=;
	b=1M3y1R0VlzjIRuc8Vt0HfDYD2nyk35WpPTaGIyFsHXO77U1sbpr8uf0bXWl+96OdmR21
	 W8jNiPHgEiUaXSdKC8jn7i7BAdJb/u41PaqYD0BgXgCeS/KVz1ZtJ1NFClsglRR3xNS7Y
	 jeq1blzoIZB2mvhripYCKU8z1X+sfdS/9Qjh+S15sPjTgD/n3PSl37Fgc2F0u+IWeQyHV
	 wTnUmFSLkbhzc8QB1yDv44787o7AfONqrf/qIuHfhB9N3bnhIcdvuSRcpjKmbdCVST68e
	 ufEe95WxgcJgsDppPlxed7WNbAsMq4v7EFAqps+awDP873v95CZk8ZSrxWNWUUTXHjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PpJtXuLt;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190A9606A31D
	for <io-uring@vger.kernel.org>; Fri, 30 Oct 2026 01:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 190A9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PpJtXuLt
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35c76e9614aso410071eec.0
        for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 18:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793324783; x=1793929583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SF9HmYpsqJyt4I9c/G5LCdmVYCdb7Ms79eOZlmLUUW8=;
        b=PpJtXuLtrGLkKx/N+0tCyrbbBKOE3Ru4G2tPkL4Fy/TPNm4MMuVamdfqFeVKhzvHWO
         5zfkyPcNvjkQtGRsngYTN6tj3jKX81nYAB+L+v9JxG8WAiT7ZuuwCIbLK0DE/NzVTNxH
         V8ykoYQuKsXyu+oItMTU/fELmq1xlU4XJ/zFaX3n4njziJO2qNyw3ajd65YpBpJm89Vf
         ZaoFn+57s5tllrgiqGn6h12jGywcjhnlBubvgxi01+Bq3Diqbl9yqhJZ9hY7jGFKVv/c
         PWPgkNT9CA6OIkaB/dygJNRqdJ0VTetO2JbWNcMad2XdBtFait71EyzgVQzvNqAZib2Y
         YqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793324783; x=1793929583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SF9HmYpsqJyt4I9c/G5LCdmVYCdb7Ms79eOZlmLUUW8=;
        b=JVKH3/MAJNaD8QF3oOyQ8umOIFwCPxIGm+NHXfh1y4XvIb6fbNTKdcvHio0Q4zMFu2
         J8Xz3ovVIasaFNsHwDsMwOxVv3GATyqDCpjWW2FGZzTmxKLePMbs4qBHU9UDp0Q4pIid
         Hp/SdoQLbAB74fLzVKBYkHLB//9+ydo+PNCbIL0wwTXo5oIGwVuWAZcpn7Madv/glr3V
         AmVuT7RISw7iNrU6ujUO0lwr2TULZopJw3vkK/IRWhofCHLg1svBMYHOqDo/nzP3WgdV
         2k2lcXA3dcb1kqt6t00IRPaGx34qdFRYzdkuVlAt478pUzoIeh0TPI4SdwOlThK5Jki4
         g2yw==
X-Gm-Message-State: AFq9FYKoYSlql+TAyImwZk6lOYoEyyQRr5a4PtOqKVDNcCfeXs9tpd1j
	UXVCFs0N1RHRqlMJz3roR1Rn+8rubYyXr4bFg400r0ZjkP9FLP5WT10=
X-Gm-Gg: AYBFou1lPVQgKLs+RKvL9+U1ozuNn44Jgkb8xjcSN9hPDbFET25Ne6JoknjWpvkUgJF
	K2NtItXAHisGnxa2cMW2O1hwtccEBzQQUSoU1G3enHX6ya90jcIRwfJK4vBY5pydGIX8BYZDwl0
	5xZasnQJhWN4i82V3B7yiXEgi4LhL+NwNZoggTyLQd0cfRSaxX04y6uiQN5mdGP9mpZbrArMNJr
	wKJ6U1h0V1n1A3KZmWiGdoR315q/6CESmH5BHDxWGAnzf12K0H3Yry831p2YQTQleR2ARJGNcJy
	mzTYpzGhi22MnnHztkpuxcJCCmGV4G63zBkBK9PRmqNVR8Hx/FJfQmv/OLeNIInOe51xEy8cqN1
	QDMee0cUf61qZAd0bSqFTHlw+4c0fiff9K9LTVRjEr1gkLdRaMmAJXNER0SWj6gJtc5RAzpaWKh
	TAtD1Yilc2Se2X20Hs0zYQIkZY4vcw5mB4UGVjTWcayW4Ky3jg0KjJeypNiLIdL9D1f1TcFcGBF
	1su1k3onQLPBqC3LCamjDlDkXCtDJVQ/dlk0h1fdJS+yIgU9Svjd2QDuyChEGrReyEAqfqlVp76
	vJ6YjECwmm4R9nbecZ/48Ij/z3A2qlw0Z5HRNCe0QFS7GHNrx5gLwXwI3sqhmDat/4PDIx7Fr2V
	JxAC+RgVf/M0kQKmw
X-Received: by 2002:a05:693c:69d2:b0:368:9553:f2da with SMTP id 5a478bee46e88-36a423f5c39mr1635691eec.31.1793324783143;
        Thu, 29 Oct 2026 18:46:23 -0700 (PDT)
Received: from anuj-MacBookPro.. ([2406:7400:63:75fd:f9a4:4062:7980:1324])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm2209020eec.12.2026.10.29.18.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:46:22 -0700 (PDT)
From: Anuj Gupta <anuj1072538@gmail.com>
To: axboe@kernel.dk,
	asml.silence@gmail.com,
	kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	bernd@bsbernd.com,
	joannelkoong@gmail.com,
	miklos@szeredi.hu
Cc: io-uring@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	joshi.k@samsung.com,
	anuj20.g@samsung.com
Subject: [PATCH v3 5/5] nvme: support dma-buf registered buffers for passthrough
Date: Fri, 30 Oct 2026 07:15:40 +0530
Message-ID: <20261030014540.3065403-6-anuj1072538@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030014540.3065403-1-anuj1072538@gmail.com>
References: <20261030014540.3065403-1-anuj1072538@gmail.com>
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

From: Anuj Gupta <anuj20.g@samsung.com>

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
index a7a4d09644c1..33dbaa319bb9 100644
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
@@ -4008,6 +4009,20 @@ static int nvme_ns_chr_release(struct inode *inode, struct file *file)
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
@@ -4016,6 +4031,7 @@ static const struct file_operations nvme_ns_chr_fops = {
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
2.43.0

