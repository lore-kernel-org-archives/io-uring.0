Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793751558;
	b=jvrKCQqpqJIWZiKjKmJKrjPbp1rCBIAdF2qOU/suNtmJ/9rDT2FCxgQjDwgxffnPsBYL
	 qy15F2qsrIpnSk7dK4jIunpg3f+xy8aeJKKWG68nFpKW4aZFvdkPIRUuYQFM1c6ceal8O
	 n5Sza3fMyEYTGX2HE8oWdb95DHyy9BggdFs3Gjiln8bR38uQ8LX8Vx3DXEXJpGw8SZdhe
	 cXuw60iDjNo2HvVsqXCVhzrRaWl+ccLBmL18HVZw1nzjjQ1I5uxhFA61NB+/UnfZCr6E0
	 boFDUIxSOXDWr53pJlk2n+iPkWBxZ5+DOFw6jT2N7lSUhjjEsvhpmfN5wPfb95DWveQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hxI6oNEf2EvFWjGeDFQYrrcpmAnzoeBTieQsEmlXNt0=;
	b=CeS1CvNVciPXtAqgXgrfwp9JT2+YKm2fbZ/wDgy4KwJTYrAjODHyYDSyQfH4mnhlbeIs
	 lt04zSNk/KKGnoxH93S3XbwTXBeuioMq4h6CZgMxVevSs/GyP7oipnMyUwVW7ZTy74mGR
	 Y+jKrqiRgQUmKggb6IPfcNn0CW8B2RjiOX/sHrROBIge90/h26VlvZuJ2Agd/Qp479MCC
	 7FnrAzQDLaQ3KFVlb+hvNKO9xv9UxyaPD8sdzC+WZdv/dDCZf96txVePre25s7FK0+39D
	 JI+DrL3Fh5kAA1aR8tizjsA1d5G6nDgfw8n6bhQiW9Odh++53WjopdCyM8tU4KhLPdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tRuoCViD;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3EF606A329
	for <io-uring@vger.kernel.org>; Wed,  4 Nov 2026 00:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB3EF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tRuoCViD
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df8fe8513so126741f8f.0
        for <io-uring@vger.kernel.org>; Tue, 03 Nov 2026 16:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793751555; x=1794356355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hxI6oNEf2EvFWjGeDFQYrrcpmAnzoeBTieQsEmlXNt0=;
        b=tRuoCViDiz1iXYAGfLXl4R7y+RpayZrjfUA/EIamwmY7fg2tTWVGnvqmEJ6GzuXb0n
         L9q8v7usrCBqH5nyZDGX3z5SVn8+UF5iEWXHYkpiDZZkH6OMnjwQ1ejQfNwV7dFEy5jR
         DSP46baP6aBJKObk8ZJZHOyfFAhX8L5VsVcCNcqNk/mFdWI5qCvSP6bBvypVKaDv4xi/
         8c6dTf5zVxiHwLo6vGHS2EpUHkAVNBNV783B22uCwCuIUaqIQOFbFClcmBQ+gvX4CByQ
         U8Cb/QdTzUTQVtsrQ+rA+9i1ftqGQQFxCenLkBm5DlCh+HED1O+6CcYoZVfCg0pv/4IE
         DN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793751555; x=1794356355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hxI6oNEf2EvFWjGeDFQYrrcpmAnzoeBTieQsEmlXNt0=;
        b=0XRCuFfGJ0FEhiT8zULxPSTg6gATUN7qaUhscylKx/mfunKAKDe6B1i/Uasxe0TGMD
         AUhf+HNvSEX0nON5uY6EtC+erSkDkMzLYoBWAduPn8dcjLChg7pgcY4b5+5IPLGriJdL
         +7om1POxRZzElSxwt/ygXJFkyNTIbERjbzG7EgtyOoNvaqlL1I6ZC4/H4rpEwhayPCjH
         uHyAyMbAZS3n4kmDut5Qz0tMxvfkIQr6i2s7+2ImPoeapWRb4H/sb44gO1Hqu+iQS8BF
         Qbkmai8BGKtGM2raCJn+UJQAnV2SJV58L3stN+9GCLN8NWz2ASuHRKL8CEZIWW4LR+Ge
         bgeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMN622oFMgSj0ime6aXqgmqoHJWOFHYCThHPzgMbcddNum1jsspu0FPX/JtdpgF1J1x9Qii1NC5Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/EHJKUKy8pzdhj4Yax7nUMwm/GmKIWZ8pECxpxaV2MSVo8UYHr
	yv9ee0sgNUzPbq3Uzrmdrqj4xqxUCcnmdYNMofTqZGcrpWoYFA3Iu92n
X-Gm-Gg: AYBFou01rw+WaJvkH0dHR1kVFN7VUKLaATUkiGGGPBmunxjdhJZMYOGxekOYNZNcy/K
	+90NYr9wHqOJqy33R/K4H5oPXxFdinH2ySmNypGqsWT/uC+12PSQc+4OJrkP7SkXuIwrt2L6OaY
	XxgbY9r2br9Z3MwW0PzSKGs6gMdzZzdjy0Gq5ot5802pinCZLV7FwZAaENAHuF8yiYrwG39Ah9o
	xPRFtaQnrxffRMy5kD1zkLIkEszqSMebtIzMN7OUDHOo4MCB53WdLuUa9QjpdHBO9ITBhAl5Wz7
	7f1MFIIhgSIwkPS5ieOv95jG5UO8x3l4EZfJl65T31qoeb4AH4V0rPYt/6ZiJDoqZXX9Zli2I7I
	7XQ+NdtJ3srY0m0Ty9YPjwZvsUIoBZkcksDp5PHo/XyaK70gyGc5HDz4AFrOvcXJSs4tsyolC8g
	Ut0r5h0I1GroIhX1F/D+iQy3pmlIXrcb3x3vNaXAyfiqL8YnRp2aK00DZdmNY0Xt7mT3vJ/fi34
	o3LShPnxMRK2R+YRq8HnaN3z2HKzaEM9zMkjg8TrntQKZ/cdjOEVi2oc0YP2AWNFXT06pe/qlxW
	INyLOxNs4Xjh7P7BBN7dGwGeFeaUkF4w0LSn4yODM456XuatLkLx9Q61HuNwRpMQhuhGs+JwOto
	hV/d0774ErYdnuRVQ3VmEnFUzlqpCdXg=
X-Received: by 2002:a05:6000:4027:b0:48d:fbdd:4132 with SMTP id ffacd0b85a97d-48e6e4f540bmr31194343f8f.18.1793751555202;
        Tue, 03 Nov 2026 16:19:15 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda1fb0esm676676f8f.49.2026.11.03.16.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:19:13 -0800 (PST)
From: Pavel Begunkov <asml.silence@gmail.com>
To: linux-block@vger.kernel.org,
	io-uring@vger.kernel.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Pavel Begunkov <asml.silence@gmail.com>,
	Jens Axboe <axboe@kernel.dk>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	Nitesh Shetty <nj.shetty@samsung.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Anuj Gupta <anuj20.g@samsung.com>
Subject: [PATCH 1/5] dma-buf-io: add tags for sharing ctx b/w files
Date: Wed,  4 Nov 2026 00:18:57 +0000
Message-ID: <9fc301319428c6c47fa183ff90d60abcca8ea63b.1793751001.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1793751001.git.asml.silence@gmail.com>
References: <cover.1793751001.git.asml.silence@gmail.com>
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

Currently, it's only allowed to pass a ctx to the file it was registered
with, which is enforced on the io_uring side. Going forward we want to
support filesystems and not just block device files, and it'd be too
limiting.

Add a dma-buf-io tag to all files. We're going to save a tag of the file
passed during registration and later use to reject files which tags
don't match. A tag should be set for a file by the importer subsystem
implementing ->init_dma_buf_io_ctx on creation and should be unique for
this instance of the subsystem. For simplicity, we're going to use
pointers for which we're going to use pointers, e.g. gendisk for block
files and superblock for filesystems.

This patch adds a new field in struct file to keep a tag, but it can be
then be switched to a new f_op method.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/dma-buf/dma-buf-io.c |  3 +++
 include/linux/dma-buf-io.h   | 22 ++++++++++++++++++++++
 include/linux/fs.h           |  6 ++++++
 3 files changed, 31 insertions(+)

diff --git a/drivers/dma-buf/dma-buf-io.c b/drivers/dma-buf/dma-buf-io.c
index 8440151de860..60dc58fc0c23 100644
--- a/drivers/dma-buf/dma-buf-io.c
+++ b/drivers/dma-buf/dma-buf-io.c
@@ -166,12 +166,15 @@ int dma_buf_io_ctx_create(struct file *file,
 
 	if (!file->f_op->init_dma_buf_io_ctx)
 		return -EOPNOTSUPP;
+	if (WARN_ON(!file->f_dma_io_tag))
+		return -EFAULT;
 
 	ctx = kzalloc_obj(*ctx);
 	if (!ctx)
 		return -ENOMEM;
 	ctx->dir = dir;
 	ctx->dmabuf = dmabuf;
+	ctx->importer_tag = file->f_dma_io_tag;
 	get_dma_buf(dmabuf);
 
 	ret = file->f_op->init_dma_buf_io_ctx(file, ctx);
diff --git a/include/linux/dma-buf-io.h b/include/linux/dma-buf-io.h
index d9f27650a851..299edf0baaf3 100644
--- a/include/linux/dma-buf-io.h
+++ b/include/linux/dma-buf-io.h
@@ -48,10 +48,32 @@ struct dma_buf_io_ctx {
 	enum dma_data_direction			dir;
 	bool					is_dead;
 
+	/*
+	 * Tags represent an instance of the subsystem the dma-buf I/O
+	 * context is bound to, the set of underlying devices and subsystem
+	 * specific map / context structure representations. Remember the
+	 * registration file's tag (see struct file::f_dma_io_tag) and use
+	 * it to filter out files that don't share it.
+	 */
+	unsigned long				importer_tag;
+
 	void					*dev_priv;
 	const struct dma_buf_io_ops		*dev_ops;
 };
 
+/**
+ * dma_buf_io_file_compatible - Check compatibility b/w context and file.
+ * @ctx:	[in]	dma-buf I/O context
+ * @file:	[in]	file
+ *
+ * Returns true if the context can be used to issue I/O to the given file.
+ */
+static inline bool dma_buf_io_file_compatible(const struct dma_buf_io_ctx *ctx,
+					      const struct file *file)
+{
+	return file->f_dma_io_tag == ctx->importer_tag;
+}
+
 int dma_buf_io_ctx_create(struct file *file,
 			   struct dma_buf *dmabuf,
 			   enum dma_data_direction dir,
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 99caef43ff3c..a9bb63cf6f9d 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1293,6 +1293,12 @@ struct file {
 		freeptr_t		f_freeptr;
 	};
 	file_ref_t			f_ref;
+
+	/*
+	 * A tag representing the underlying subsystem for dma-buf I/O.
+	 * See struct dma_buf_io_ctx::importer_tag.
+	 */
+	unsigned long			f_dma_io_tag;
 	/* --- cacheline 3 boundary (192 bytes) --- */
 } __randomize_layout
   __attribute__((aligned(4)));	/* lest something weird decides that 2 is OK */
-- 
2.54.0

