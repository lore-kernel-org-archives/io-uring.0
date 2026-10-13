Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A880C560ABB
	for <io-uring@vger.kernel.org>; Tue, 13 Oct 2026 20:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924950; cv=none; b=Ia0+vj+IEFmH2O+8DPQ+vCk7KyK2DRZce/I5FkBoXqmMe66o9hB4k1mWlLa+++zU+dNRe9LTImh7AUEsVi4Zi/DxCuJulhAR3/WHmTL+k3FitAozDCmXP4vPmT0hdIJtmxO50tulsevO0lfKNoZxI5BaUPrpj/7xKoyaRfQ0HjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924950; c=relaxed/simple;
	bh=r60ha7f86tSXOy7awDRSeceZcMhT0AOlgJWaxT3jtGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Co1N+bthEBL1NR/SQQ0hC2QAKBW3cU5yAsujAyMvCWCbEWpQurQjqWHL/WLxLmyH59pBSqQYoAb4qig6wcteA6f8SaBhJnB1WV2b4K5dYQe+tQxqiFfhO1FqXGpJf0nG5I+7mOgdEz0ew+Zz+sd7UnEYzGF46YQEwQvQMVBuBcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LxZZIuOx; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxZZIuOx"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso3265446f8f.1
        for <io-uring@vger.kernel.org>; Tue, 13 Oct 2026 13:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791924945; x=1792529745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ays4SVba18pfRPB/Hpqu6QDaxGmpKJaoA/2lD097Khk=;
        b=LxZZIuOxbxtAdJEFuNKtznhoBBpEf3ufoFq8v4kzTbqgOqUFJe9dhejArkyc+vYakg
         gA82Qb4w+2eaopT9BqTesVEw0igg1/U5EQYOgXmKQZ+GFAM9mPkf740crYic2xoOr666
         bEK6oWvBuK1Ob4o/Jy0TZYoXTSAGDutRsS8HyREoYGGVR4WRppv1WzteJN8abdPeTftd
         UeG0JyYR9+pa4mf5P7/nuFz9by7Zjf/RX2Th4uYYGMDXdZz6oXHcq/hHPDdSqMVMCRWb
         zDKQ5xki635PLGpoMCHY4SxYCAxVVAJxQwD6gQGdv92GWjFj/PaVwMeRBm/VNv/LfSR9
         IO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924945; x=1792529745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ays4SVba18pfRPB/Hpqu6QDaxGmpKJaoA/2lD097Khk=;
        b=t3by/NjJEK2uup/54yYWw52OQ9/bvWj4lxJRXYjThRFG3zRL/UTaDsZcCAWfqnlzOj
         nVM9fdzz85eR8YyDeTX/Pz7bW3ZmyM+J3BwP0cM/Coit9FAiEm/b27dtFuT5fAXlgxqh
         KRBpo4se6+phuKnUscRuQQSfkWP1kBKAQRqtP/crb3Rux+Iof/tLWywjGHh+pTdThzR4
         vUFXid+IaQaIjeINVb2oq7zMKd15xRFE2mf8UUG/yiOm80sgQM40bz5SsNEcMcs2Ggs+
         15dIh9dsWUAoN7AILzac1CFEn6Cxby3X4G77G/VjJPtKrs1X708ysCfj8be52HFSn7hb
         1HLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJ4v1tza/rDeA8k1hZpz3aWCEcL0wvb6IV1U24WezrJPE0yAhZZZr75qCybu7eQnJlzf1IFrPoDA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJhzr1IjZo3xpkmPPa6Y4MjTsjdnNmjFuwRrM4oyX497lgf458t
	naWCxLm44XppOJx/loI/Akhc0Dxm+gZ31ax1YkYQkdC5TPd9oO+JJjpB
X-Gm-Gg: AYBFou2gP0tonyPjnF/xnyvPaG+YlG2TJNbv45ar83QN5nUlz1aNSewajOskYVPTgRu
	IA/i6l8u8ua/uj3NFzNqQNawH7oayUQNjlHv79M8lkEhFBbtfKMmjCDQkwfVnt9E3xXB19aH4cK
	QuC8R6yLYvx8oMkbBP00xCL+sCPvHcIeoYnMG63aMvKFt5HTaZprpF9K+3Ste9wXQC/q9f3nhHH
	Qs9srznAy4PqqI5uH28RqnjKBQJoLb5/o/dU3sMw5E3E7QYCCwQ8Ouj3NywdUT7MHgeG242lioK
	p/VPIKjGoRurMm5vQH6M0SYSIQ40YqifpuLvGXTzMB8BtsEnp6F0LFexLRAbrierOyNyOvVK6nm
	9DDlbho6d/6i+AezxJ/7KksgGXAN+BhDRm41oT0gwLEly9hQv8RZGG7DbDerJNe5sFLT7nluFy4
	WIvhRODdEHMqH2WzSUIx/oThgnYQ0h/sRcWpKlxotgU3/Q3KXvzeCcFvVh3uWlzc4Inhfzy7XOg
	FF+7crY7g/xyu0IEc2r7/oRsvK2v59EfOx35jxyFk8t3Rcgb7SL5BUult1DkhxWYgLointUCM3j
	e64tlvlvy9o=
X-Received: by 2002:a05:6000:27c6:b0:487:27f9:82b with SMTP id ffacd0b85a97d-48dbaae34e3mr16754768f8f.32.1791924944821;
        Tue, 13 Oct 2026 13:55:44 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de7273a0esm2380730f8f.29.2026.10.13.13.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:55:42 -0700 (PDT)
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
Subject: [PATCH v10 12/13] io_uring/rsrc: add regbuf import flags
Date: Tue, 13 Oct 2026 21:54:56 +0100
Message-ID: <4b7c13d9860640499460862c8cd4a13602ca174b.1791924581.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791924581.git.asml.silence@gmail.com>
References: <cover.1791924581.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We'll have special registered buffer types that can't be used with all
opcodes and need special handling. Add separate flags to control
registered buffer import, which will be used to specify what kind of
buffers the caller can handle.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/rsrc.c |  8 ++++----
 io_uring/rsrc.h | 24 ++++++++++++++++++++----
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 532866a1e9b9..f42d201738cd 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1317,9 +1317,9 @@ inline struct io_rsrc_node *io_find_buf_node(struct io_kiocb *req,
 	return NULL;
 }
 
-int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
+int __io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
 			u64 buf_addr, size_t len, int ddir,
-			unsigned issue_flags)
+			unsigned issue_flags, unsigned import_flags)
 {
 	struct io_rsrc_node *node;
 
@@ -1733,9 +1733,9 @@ static int io_kern_bvec_size(struct iovec *iov, unsigned nr_iovs,
 	return 0;
 }
 
-int io_import_reg_vec(int ddir, struct iov_iter *iter,
+int __io_import_reg_vec(int ddir, struct iov_iter *iter,
 			struct io_kiocb *req, struct iou_vec *vec,
-			unsigned nr_iovs, unsigned issue_flags)
+			unsigned nr_iovs, unsigned issue_flags, unsigned import_flags)
 {
 	struct io_rsrc_node *node;
 	struct io_mapped_ubuf *imu;
diff --git a/io_uring/rsrc.h b/io_uring/rsrc.h
index 73d7b1ebf0b6..351995b61e68 100644
--- a/io_uring/rsrc.h
+++ b/io_uring/rsrc.h
@@ -62,12 +62,28 @@ int io_rsrc_data_alloc(struct io_rsrc_data *data, unsigned nr);
 
 struct io_rsrc_node *io_find_buf_node(struct io_kiocb *req,
 				      unsigned issue_flags);
-int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
+int __io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
 			u64 buf_addr, size_t len, int ddir,
-			unsigned issue_flags);
-int io_import_reg_vec(int ddir, struct iov_iter *iter,
+			unsigned issue_flags, unsigned import_flags);
+int __io_import_reg_vec(int ddir, struct iov_iter *iter,
 			struct io_kiocb *req, struct iou_vec *vec,
-			unsigned nr_iovs, unsigned issue_flags);
+			unsigned nr_iovs, unsigned issue_flags,
+			unsigned import_flags);
+
+static inline int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
+				    u64 buf_addr, size_t len, int ddir,
+				    unsigned issue_flags)
+{
+	return __io_import_reg_buf(req, iter, buf_addr, len, ddir, issue_flags, 0);
+}
+
+static inline int io_import_reg_vec(int ddir, struct iov_iter *iter,
+				    struct io_kiocb *req, struct iou_vec *vec,
+				    unsigned nr_iovs, unsigned issue_flags)
+{
+	return __io_import_reg_vec(ddir, iter, req, vec, nr_iovs, issue_flags, 0);
+}
+
 int io_prep_reg_iovec(struct io_kiocb *req, struct iou_vec *iv,
 			const struct iovec __user *uvec, size_t uvec_segs);
 
-- 
2.54.0

