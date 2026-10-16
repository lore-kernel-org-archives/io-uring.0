Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C73480DFF
	for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 10:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146916; cv=none; b=o6cscvuQ+LXRoeJobpaONpbQvSSrZ3xC8+A4W2LRyx8udstywDwlUp/A0mxaBwbbHLDtYdzRnPqi2cRF220RO6ZtjWlWOAzo8VNQRnbJr63E4d7fBKrO/tBsoYAkXLt2oEheZNPXd2HLUI9FyHigDyf+kGom+4Ifbbe8Ds1YlME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146916; c=relaxed/simple;
	bh=u2qQQenzoB1TJlQZF26AH9M2PqhoVAabw/YYenRQgXA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CuFP0S+urXqmUA+2ArdDO+ITwcj7bIdPOJlhcUDmIOKWNmo+0NwiM7ZlxTSn9oMfvtQt1mzR17yScHfZEyw/PVPOswD+HrYKmkUTKPWG1fap1lcO9Wje78WfFhCP64rtpQ/2pwaFgRwQ40THsbAYlVntZAU+PXZfaUcPzFpWW5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjU8aqCD; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjU8aqCD"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3514b90bb89so5570836eec.1
        for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 03:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792146905; x=1792751705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HtjzVVsA6JArz1B6fu2Ta+i9SWusgx63z4Tf4QofPAI=;
        b=BjU8aqCDbJ1xGzjyxGGDs9wDWDodgs+HpG3uSxdZGRX0VwnskBTphA2wgM+3O40JQX
         xR1qH+DyoxJfVPwqCO4E+81fMhmMRvwuz0fP9PkOr12Tu8alZ+n3WFQ6ouOJ9r4Wqy6g
         1E2iC4R3f1VkzjDSIC9hbfmFRp8U7jDN+LynQhdLOlVOYTSqaW1sWeGnbvDGV0f7pLX/
         mvSaud7F7mJK2h/817Kf3fx24Ja9xGrR7oWF9OhMW8Czial3EFGDdeefDqVXHGn8GtAw
         /VAqdGs8ZekK7IZ8k11K9u6RZAenTsxVdZ2QZCErTR7q1VqfilonulAekJLhkCv9rzcW
         DsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146905; x=1792751705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HtjzVVsA6JArz1B6fu2Ta+i9SWusgx63z4Tf4QofPAI=;
        b=MaXfFdhRNnNSE6A/QpluOROciwW2uYyUTUIBSliDFZVzLf6GmkyQKmJM1CPy8ksrWN
         R9DXkncluOvJpghG3G4EyoBVarFxcbGAf3EL7JxEAwPYj4QfhoN+jFs4OrbegcmRBtTa
         euOFy9OOWcxnx9oDrBC6JN/bB9RlRyYl5MyRIcIq+v2P6z+KudYbw4EtAul7NsWodp1R
         kQBbh/X4yL3SBB2xd+sQJPLXLbAi6YjM8TYOMAiroHr5NUVel3x79xoaKGMeh7Ofwo7J
         qD488iyqmudyJeYg1qp8IqjSri/25Tl4xtGsX3Mc9/+ZY0uoYDRfhOc+Y3bnOY8Rjhjr
         yAqw==
X-Forwarded-Encrypted: i=1; AKwUvBykwR6F6gkJYJqEf4+ZEnN+tk8Y+/OsJKj8HcLHCVtkfXRSmkdoAxiXMVuDGeKJ02B71/lU3xc1aw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLdRD8yD0SM7gtAOAJx5UGszZqlbLiwbPpIvOHxfpDZ+E5/4zyw
	1pktGx1piumqh0o5jrPUxt4zx2SpX3bOp4Pfp7gM+wFbd8Cth83qObA=
X-Gm-Gg: AYBFou2D8ScsILdEtUFW7hBHztHfJZOlXkVvqBHgUkhMvsemUXYpjqdVre2YV3u9LZc
	r3uRNmd9IGCD+mBNxfYorZwq/q5tZ5BhTfl8mjOfFSAJm6caYf93ds8+cl+ODclqSXgx9c9Rsi+
	q+7fW5Gz6yTq2c84CZ1054hKhHeW+chAjjV2tsIySnGU5gCbIe7kHDFOPImtnEVqTprTKVU0Y2C
	66lN4cmCvdprxc1wRNYPOkTRmUohJOuDnsbpj19M9b51BNpoiBQEA3RU//FWnx60HkAN2ygFctu
	NX/wlFFzApbPMvFQiDCttCzfLGzAgy5OLxqFkirvFvHe6nr8BL9dr3TfbbATx1g+I976bXbgdxq
	Pg1ggEVQFjxH9WvSVVPwhDucXzDP3C9eCnFcpmySyFYsfqtcyUsPAhlB2qsTLn7SZt3E8BMP94u
	/GI1e2r7vVj/VT+Xtd2bKOoe/VlLqAm6gWPY+ER/CNbF8rQkNqLqM0iF0HM7XRf/QxGeE+Fnk/D
	LeEw16echsjpc21Xw9Se7f7LAXXaB6FF5awOSRWq2tMXsz4m+c=
X-Received: by 2002:a05:7300:d209:b0:35a:47ed:c39a with SMTP id 5a478bee46e88-35a47edc590mr19750851eec.37.1792146904412;
        Fri, 16 Oct 2026 03:35:04 -0700 (PDT)
Received: from anuj-MacBookPro.. ([2406:7400:63:e55a:7bfc:fc3a:e718:89f6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm6213192eec.7.2026.10.16.03.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:35:03 -0700 (PDT)
From: Anuj Gupta <anuj1072538@gmail.com>
To: kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	axboe@kernel.dk
Cc: asml.silence@gmail.com,
	joshi.k@samsung.com,
	linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org,
	io-uring@vger.kernel.org,
	Anuj Gupta <anuj20.g@samsung.com>
Subject: [PATCH] nvme/io_uring: enable dma-buf backed passthrough I/O
Date: Fri, 16 Oct 2026 16:04:20 +0530
Message-ID: <20261016103453.1129150-1-anuj1072538@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anuj Gupta <anuj20.g@samsung.com>

Allow registering a dma-buf against an NVMe namespace character device
and using it as the data buffer of fixed uring_cmd passthrough I/O.

io_uring_cmd_import_fixed() now accepts dma-buf buffers and attaches
the current map. blk_rq_map_user_iov() maps dma-buf iterators directly,
since they cannot fall back to a bounce copy.

Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 block/blk-map.c              |  9 ++++++++-
 drivers/nvme/host/core.c     | 13 +++++++++++++
 drivers/nvme/host/ioctl.c    |  1 +
 include/linux/io_uring/cmd.h |  6 ++++++
 io_uring/uring_cmd.c         | 16 +++++++++++++++-
 5 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/block/blk-map.c b/block/blk-map.c
index 9cb9605d1f62..8f03e21fd5fe 100644
--- a/block/blk-map.c
+++ b/block/blk-map.c
@@ -459,7 +459,7 @@ int blk_rq_append_bio(struct request *rq, struct bio *bio)
 }
 EXPORT_SYMBOL(blk_rq_append_bio);
 
-/* Prepare bio for passthrough IO given ITER_BVEC iter */
+/* Prepare a bio for passthrough I/O from a directly mapped iterator. */
 static int blk_rq_map_user_bvec(struct request *rq, const struct iov_iter *iter)
 {
 	unsigned int max_bytes = rq->q->limits.max_hw_sectors << SECTOR_SHIFT;
@@ -506,6 +506,13 @@ int blk_rq_map_user_iov(struct request_queue *q, struct request *rq,
 	struct iov_iter i;
 	int ret = -EINVAL;
 
+	if (iov_iter_is_dmabuf_map(iter)) {
+		if (map_data || (iov_iter_alignment(iter) & align))
+			return -EINVAL;
+		ret = blk_rq_map_user_bvec(rq, iter);
+		return ret == -EREMOTEIO ? -EINVAL : ret;
+	}
+
 	if (map_data)
 		copy = true;
 	else if (iov_iter_alignment(iter) & align)
diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index d81462e864a4..29c29dad06b8 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -3982,6 +3982,18 @@ static int nvme_ns_chr_release(struct inode *inode, struct file *file)
 	return 0;
 }
 
+static int nvme_ns_chr_init_dma_buf_io_ctx(struct file *file,
+					   struct dma_buf_io_ctx *ctx)
+{
+	struct nvme_ns *ns = container_of(file_inode(file)->i_cdev,
+					  struct nvme_ns, cdev);
+	struct nvme_ctrl *ctrl = ns->ctrl;
+
+	if (!ctrl->ops->init_dma_buf_io_ctx)
+		return -EINVAL;
+	return ctrl->ops->init_dma_buf_io_ctx(ctrl, ctx);
+}
+
 static const struct file_operations nvme_ns_chr_fops = {
 	.owner		= THIS_MODULE,
 	.open		= nvme_ns_chr_open,
@@ -3990,6 +4002,7 @@ static const struct file_operations nvme_ns_chr_fops = {
 	.compat_ioctl	= compat_ptr_ioctl,
 	.uring_cmd	= nvme_ns_chr_uring_cmd,
 	.uring_cmd_iopoll = nvme_ns_chr_uring_cmd_iopoll,
+	.init_dma_buf_io_ctx = nvme_ns_chr_init_dma_buf_io_ctx,
 };
 
 static void nvme_add_ns_cdev(struct nvme_ns *ns)
diff --git a/drivers/nvme/host/ioctl.c b/drivers/nvme/host/ioctl.c
index 3aa5d2f2dfbb..6343da1f6c05 100644
--- a/drivers/nvme/host/ioctl.c
+++ b/drivers/nvme/host/ioctl.c
@@ -458,6 +458,7 @@ static enum rq_end_io_ret nvme_uring_cmd_end_io(struct request *req,
 			status = blk_status_to_errno(err);
 	}
 	io_uring_cmd_set_res32(ioucmd, status, result);
+	io_uring_cmd_detach_dmabuf(ioucmd);
 
 	/*
 	 * For IOPOLL, check if this completion is happening in the context
diff --git a/include/linux/io_uring/cmd.h b/include/linux/io_uring/cmd.h
index e18d4af62e1a..33e0ebeea5a0 100644
--- a/include/linux/io_uring/cmd.h
+++ b/include/linux/io_uring/cmd.h
@@ -70,6 +70,7 @@ int io_uring_cmd_import_fixed_vec(struct io_uring_cmd *ioucmd,
 				  size_t uvec_segs,
 				  int ddir, struct iov_iter *iter,
 				  unsigned issue_flags);
+void io_uring_cmd_detach_dmabuf(struct io_uring_cmd *ioucmd);
 
 /*
  * Completes the request, i.e. posts an io_uring CQE and deallocates @ioucmd
@@ -136,6 +137,11 @@ static inline int io_uring_cmd_import_fixed_vec(struct io_uring_cmd *ioucmd,
 {
 	return -EOPNOTSUPP;
 }
+
+static inline void io_uring_cmd_detach_dmabuf(struct io_uring_cmd *ioucmd)
+{
+}
+
 static inline void __io_uring_cmd_done(struct io_uring_cmd *cmd,
 				       unsigned issue_flags)
 {
diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
index 73b606899833..0e0509edec6f 100644
--- a/io_uring/uring_cmd.c
+++ b/io_uring/uring_cmd.c
@@ -10,6 +10,7 @@
 
 #include "io_uring.h"
 #include "alloc_cache.h"
+#include "dma-buf.h"
 #include "rsrc.h"
 #include "kbuf.h"
 #include "uring_cmd.h"
@@ -28,6 +29,7 @@ static void io_req_uring_cleanup(struct io_kiocb *req, unsigned int issue_flags)
 	struct io_uring_cmd *ioucmd = io_kiocb_to_cmd(req, struct io_uring_cmd);
 	struct io_async_cmd *ac = req->async_data;
 
+	io_detach_dmabuf_map(req);
 	if (issue_flags & IO_URING_F_UNLOCKED)
 		return;
 
@@ -48,6 +50,12 @@ void io_uring_cmd_cleanup(struct io_kiocb *req)
 	io_req_uring_cleanup(req, 0);
 }
 
+void io_uring_cmd_detach_dmabuf(struct io_uring_cmd *ioucmd)
+{
+	io_detach_dmabuf_map(cmd_to_io_kiocb(ioucmd));
+}
+EXPORT_SYMBOL_GPL(io_uring_cmd_detach_dmabuf);
+
 bool io_uring_try_cancel_uring_cmd(struct io_ring_ctx *ctx,
 				   struct io_uring_task *tctx)
 {
@@ -257,6 +265,7 @@ int io_uring_cmd(struct io_kiocb *req, unsigned int issue_flags)
 
 	ret = file->f_op->uring_cmd(ioucmd, issue_flags);
 	if (ret == -EAGAIN) {
+		io_detach_dmabuf_map(req);
 		ioucmd->flags |= IORING_URING_CMD_REISSUE;
 		return ret;
 	}
@@ -275,11 +284,16 @@ int io_uring_cmd_import_fixed(u64 ubuf, unsigned long len, int rw,
 			      unsigned int issue_flags)
 {
 	struct io_kiocb *req = cmd_to_io_kiocb(ioucmd);
+	int ret;
 
 	if (WARN_ON_ONCE(!(ioucmd->flags & IORING_URING_CMD_FIXED)))
 		return -EINVAL;
 
-	return io_import_reg_buf(req, iter, ubuf, len, rw, issue_flags);
+	ret = __io_import_reg_buf(req, iter, ubuf, len, rw, issue_flags,
+				  IO_REGBUF_IMPORT_ALLOW_DMABUF);
+	if (ret)
+		return ret;
+	return io_attach_dmabuf_map(req, iter, issue_flags);
 }
 EXPORT_SYMBOL_GPL(io_uring_cmd_import_fixed);
 
-- 
2.43.0

