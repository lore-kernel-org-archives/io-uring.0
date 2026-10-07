Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD2835E926
	for <io-uring@vger.kernel.org>; Wed,  7 Oct 2026 01:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791337408; cv=none; b=OtrV415AR/zHOi8tqFWC9ivbiLsIYyLREc5H8utKPrlzaHVImsdN7lO1e0fFhoJM1HHfkTsrwg6Zj0+F5f2/GLNaYRuhQolda55oLlSJuZ1LB3zcoypd8hNeMGDCv8KQouG5s0bYIloI+0Yt6KZ4uvMgGe7HvpTh43gaV/E0A1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791337408; c=relaxed/simple;
	bh=L6TVWpongEDpA7TiLe+SNULpjIEu9UzpPIkgkHUo5Rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uVQ02FBJF8l2QEtmTWagHEA87g2z9BZbO4FgJhFi4AQYUCu250Hvo619HJSnXoU5dfciODqbU5r16mbd5ggf9WArJgmAHCYWgJDiRKm9pUMaRC9BmINtIdj4U5781n7ieM09lOQEi72hqHJxBMQJ9IvZQvx6dtmVkDcBzuSczPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PHUxMFdB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PHUxMFdB"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so9192815e9.0
        for <io-uring@vger.kernel.org>; Tue, 06 Oct 2026 18:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791337398; x=1791942198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nls4uSWUi3FtYOHw3kmfxrWIUNA1MBsyApDbzhyJZsE=;
        b=PHUxMFdBnl8loPA4gMlZ1Nl0KX3UihE9mLzk+a0dSjbj8L8hiqK2iRPJmJQJfirjjl
         AyACKfhq1XPG8uw8pqgDDQUadYE2SYYr1W5fH+VR1gKQ2dkFTixU3otk+G5PMLofx27J
         avEgNEYmNOavcpoMackgdk1vqCVCHTaSa1jwf+rmnjrW/+lMr1RLXaazNs1/Wy0Y1Dem
         cchGM9TS/6P75TT7BulwCxcUeBiGpVI0ulGWIgUJqG7cS6PsV2hGiAF8jTBZn3etms+W
         2ayi90jkjlH5Re3EgzybDBanHh6nuB0belXcMhG/k9Q2v5Y4JFEGQeTrvs+NPSVr63Sa
         PHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791337398; x=1791942198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nls4uSWUi3FtYOHw3kmfxrWIUNA1MBsyApDbzhyJZsE=;
        b=DnWttODWjaUWmsR9AReVH1fqY5kmQx77YKHrnwdo02wvIsuRcX2Afk2iM4C5EqHUjb
         r0InmqyFr+tPn7T4UXB5osDuQOL1fUijLNI4zyshj3oSP+dDiB+a1amLuUDVdqjYzjEH
         7BSsoMAGY+MMLVUE5S4yjwaexchQM4frLLBRj1weFG2cmi2No/0m5YNyCDLpYVWcPCv2
         SJpK7yxCksUCuZISyh344ThMh+Skr/MUa1qr0SteA//nJ3qZvKIheOU773LtxuYxQSVN
         Bk91RnkVJBFstvzESJS9MK4wV6jo9pVyCoYBxCHC480UKxcowE360bWGjm7rM2M1xZ1l
         I/lg==
X-Forwarded-Encrypted: i=1; AKwUvBwVOGUaqfCsZVmqGlInEGZv5KQBky5/IHoA2/Eo0LFMD7k5CFpkyVgkDtPksS2QKkuYItEA7iVwxg==@vger.kernel.org
X-Gm-Message-State: AFuF++nNhjXHgbuyIsbKzRXxHT8PMeX6ZhJvlkFs0jG1C8wwH34VZ+aS
	Mxzwv1qPLpM8XUTz2eDZ2X+fMRoSGsU404oKq48+NtcuAvTu52ItyUUi
X-Gm-Gg: AYBFou2JOhGjZu5XXjJMoY4m9xS7GaX22yU6ASCy1OHSW4fqFe1MDNG1xyp9PCYsEih
	m628fTrsYaAhK8FaE+VY9nhJdayAllUg+tFbmYF+zrQ6lqsA/JM870/n0G1PoRvipJMyXnG9FjD
	dnaabaHu9Ay+jLVY4RHD4H6yiT8RZ1CgJr0ddMhyOFILjEjkkwXqB74x5Hn4FOsAHz6Z1XI1mTI
	oL5VQJSzCZ+PfHpo7ux7PQwf6aIZniiklRU8uZ/Y/76oRtbP506bxxK1itDVscsGBSttpHvYn1M
	nPj+bD2pK04Il+/Q3Z59djet01BmI2xB0EDLis1vW87cy9ASzvCJQOE/4cShvkoWPyUofF2J+5F
	d+eNDhmO/ZJjpz0pC5sexeBSmIrJb56ZsK1hS6miQLatIi0YwvXLT+X9M6RpMdml3eU5RWNgeUY
	EXdfjT3wOftYTP3r/5oTuDL1Ii8fD5FP9GSM3545ANLUYkzW3JsmqPR78ixrerDthDZhk/AFq0z
	fm7xPKx/7RYE1yE9Vb079I8HiAe77VgbcooQ1NX3whtwhjVs67ggsTWG/hyiqhW06iNtr3lwTKG
X-Received: by 2002:a05:600c:c16f:b0:4a0:2484:2800 with SMTP id 5b1f17b1804b1-4a1800ca1c3mr7313145e9.3.1791337398229;
        Tue, 06 Oct 2026 18:43:18 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f653d7csm26423895e9.14.2026.10.06.18.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 18:43:16 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: linux-block@vger.kernel.org
Cc: asml.silence@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-nvme@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	io-uring@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jens Axboe <axboe@kernel.dk>,
	Nitesh Shetty <nj.shetty@samsung.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Anuj Gupta <anuj20.g@samsung.com>,
	Tushar Gohad <tushar.gohad@intel.com>,
	William Power <william.power@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel@lists.linux.dev
Subject: [PATCH v9 05/13] block: add dma-buf support for raw bdev
Date: Wed,  7 Oct 2026 02:42:48 +0100
Message-ID: <af2b48a490186edf38f1d4a5dfd9513574f7a350.1791336930.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791336930.git.asml.silence@gmail.com>
References: <cover.1791336930.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a simple proxy implementation of init_dma_buf_io_ctx() forwarding
the call to a new struct block_device_operations operation. Also reject
dma-buf backed iterators for buffered IO.

Reviewed-by: Christoph Hellwig <hch@lst.de>
[pavel: reject dma-buf without O_DIRECT]
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 block/fops.c           | 22 ++++++++++++++++++++++
 include/linux/blkdev.h |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/block/fops.c b/block/fops.c
index 827dc9eecba7..e9da48ab73be 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -730,6 +730,9 @@ blkdev_direct_write(struct kiocb *iocb, struct iov_iter *from)
 
 static ssize_t blkdev_buffered_write(struct kiocb *iocb, struct iov_iter *from)
 {
+	if (unlikely(iov_iter_is_dmabuf_map(from)))
+		return -EOPNOTSUPP;
+
 	return iomap_file_buffered_write(iocb, from, &blkdev_iomap_ops, NULL,
 			NULL);
 }
@@ -855,6 +858,11 @@ static ssize_t blkdev_read_iter(struct kiocb *iocb, struct iov_iter *to)
 		if (ret < 0 || !count)
 			goto reexpand;
 	}
+	if (unlikely(iov_iter_is_dmabuf_map(to))) {
+		if (!ret)
+			ret = -EOPNOTSUPP;
+		goto reexpand;
+	}
 
 	/*
 	 * Take i_rwsem and invalidate_lock to avoid racing with set_blocksize
@@ -958,6 +966,19 @@ static int blkdev_mmap_prepare(struct vm_area_desc *desc)
 	return generic_file_mmap_prepare(desc);
 }
 
+static int blkdev_init_dma_buf_io_ctx(struct file *file,
+				      struct dma_buf_io_ctx *ctx)
+{
+	struct block_device *bdev = file_bdev(file);
+	struct gendisk *disk = bdev->bd_disk;
+
+	if (!(file->f_flags & O_DIRECT))
+		return -EINVAL;
+	if (!disk->fops->init_dma_buf_io_ctx)
+		return -EOPNOTSUPP;
+	return disk->fops->init_dma_buf_io_ctx(bdev, ctx);
+}
+
 const struct file_operations def_blk_fops = {
 	.open		= blkdev_open,
 	.release	= blkdev_release,
@@ -976,6 +997,7 @@ const struct file_operations def_blk_fops = {
 	.fallocate	= blkdev_fallocate,
 	.uring_cmd	= blkdev_uring_cmd,
 	.fop_flags	= FOP_BUFFER_RASYNC | FOP_DONTCACHE,
+	.init_dma_buf_io_ctx = blkdev_init_dma_buf_io_ctx,
 };
 
 static __init int blkdev_init(void)
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index d003a9d2d1f6..2d5c30823aab 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1599,6 +1599,8 @@ struct block_device_operations {
 	/* returns the length of the identifier or a negative errno: */
 	int (*get_unique_id)(struct gendisk *disk, u8 id[16],
 			enum blk_unique_id id_type);
+	int (*init_dma_buf_io_ctx)(struct block_device *,
+				   struct dma_buf_io_ctx *);
 	struct module *owner;
 	const struct pr_ops *pr_ops;
 
-- 
2.54.0

