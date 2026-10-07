Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10BC37A844
	for <io-uring@vger.kernel.org>; Wed,  7 Oct 2026 01:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791336757; cv=none; b=MBsSYfUWO4chzVCY5m72/qFHzHYAYHoMo8sqkWlbkSYr7jReMdrzCmeqrLf/7Wc/YK/YJkrFs7Bs9FTjLwYOYzgvSgCSUC/NNeEq+ULvAw7TwwKpjtjko7eP7lYlC4Cz+2WPKJTCsiES4ghDk5nuaDzXnnln/ZUd4kxHnBKPypU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791336757; c=relaxed/simple;
	bh=zkmmP/s3oaEnM5CZp4fq/TPO4woTgg6h/01Z24jsq/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UmguoToINKe4HiTcGJFrKtJGFEdKqsIzYjfVh9W8bjcGAk92RfiC9pcd7qo09XK2OeRAhGKoE8MWiq3Q4lE9cFELokDB4wvVM5mEzRdcXlAib6EN+MHmuiR+IQz5xDo87LM4urXk2n/oQC6KUIyGmM462Bb33kbZh+YkO4LE6JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRlH75US; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRlH75US"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a16c399641so13172055e9.2
        for <io-uring@vger.kernel.org>; Tue, 06 Oct 2026 18:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791336754; x=1791941554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vy1zLQ9YKYGfqugQgTKt/AfV3rhwVDXY3KU8gp6bN10=;
        b=CRlH75US8oKos3okZ/GQ+5N6xYnevgjyVe5DtiWbW4oF9Ry/Gq21dOFvVgKVsrH/rz
         PwzGinq1WiPIJvHiImryW9+/xVNZPuUWh+B2XhiNH5ZKbC6OJfPYfBCtf02Fnx4UP8gm
         Uxy6nwhailq1lTMmJTj80B3F/elx7keV2nLPs1J1RMPNwhkGkGi3UCQCXoawqabt63YK
         eDT18cJlpKGeqkAo97KfI58vjg+Sw8NY4nRYhWx9Q/c9OP5MPpkNnZ6J5+FbKWLRKWiJ
         72BRXbEKTchEkkghRuEFcFF/mynBzvHWFf0G+XO4CWEo3JHjTeCYZch2RbfkwGTSgjDZ
         eoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791336754; x=1791941554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vy1zLQ9YKYGfqugQgTKt/AfV3rhwVDXY3KU8gp6bN10=;
        b=tXJCrQXvbnQn5Nx9k6AOVb5eEJGMNealJG9iA1nAmrxhYxkrHjEGW8seFkqkc06+9O
         aHYsVjI7o1aTGU8tLOgsBnHN8VLfEu+bXaQXgLOHBYfdnS6bjDldKSnJr6FJnkS6T5yS
         6hUhLmTIv+yX4F3JWOnCT4kpLK4OkygA7Lek89nN7mnUULZ+qh9YP4MyzpeGgadPoVwH
         q5IGKXbl+KE8k1CjF7ZG7g3pVHYyM0dZ7PRu77NBm1qsSwFue4s3yZJxqf8F+C/UdUME
         yVb2cyRze0aGWDCEg9Va37CvH4FNHnjIAFXW/UMl7jzcIced+Lz+gBsM/GTDuy8TvDrV
         lpHg==
X-Forwarded-Encrypted: i=1; AKwUvBw185Hj5YM6Dy5y077ZnswO578jDFanUSCduey8bxZ+VcDNJ8Kdx6WLriwRdjmDWq1WLuWuoET7Jw==@vger.kernel.org
X-Gm-Message-State: AFuF++kPVMMIvF2kuTlUun4SWIYv18c/Y6jygDHtmOB1ON07WaBLNHlu
	ZqfUKLo8g91hYHtIeUqboP8qmvHeN45t/BlBHRah3FfVrMVGXaYMzZyd
X-Gm-Gg: AYBFou2MSQdSZ26OFHXrGxR0iFG6fV0vx6G0qeDtPMkPLrmTV73viv9Y8R+TbsZ+JMs
	GfU8Fps/7p3S8SlmFzTwrwHpLRAdJmEzpkk+LwclQDdKxxfwlMjbYACdI0XvPsUXtJQ9i9xSLdM
	0q24gLr/I4hEUjn1XT3lXErgoqkq3/exCFk+HyHAviY28EYo6KBvRHCk4iaX9FpHU4N8wCV4nwS
	OPK7VTCsKEekNbc+7RRUxYt6lNT+NX9inwdAfXyiGI8XuE7AfXSvxvbUaksx252cHRRJcS7Jduc
	IDrgcZ5iISvlCGksY2JrkwXY70M3qV6kdgYND5AMdlbvZt2cn1ylkTJXIZH91A25ICd/21AEQE/
	1YScxEEUAslJENBIoqlrXwpffg2AAVG5Wd9jf8YQ0LKoDDii9Mgt9cj8JFphU0dzTrnY1yZ6da3
	DVD4F2atKg8EazHpERE5/u19QiGDWwrXsjDtH5IWVgY0T0m98BWWnXcoqqJ3Tc21AQ1ZS/SY0Gc
	YeRBAU6or/7ja56+EJ4qOr9iGYTA+uqhwCPsGV97Gy10ih1PlxzgNBwsjd3P7O77919Hx06h7YI
X-Received: by 2002:a05:600c:3b99:b0:4a0:1c10:1372 with SMTP id 5b1f17b1804b1-4a1806501eamr8969125e9.27.1791336754109;
        Tue, 06 Oct 2026 18:32:34 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f6538b7sm21183615e9.13.2026.10.06.18.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 18:32:33 -0700 (PDT)
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
Subject: [PATCH v8 12/13] io_uring/rsrc: add regbuf import flags
Date: Wed,  7 Oct 2026 02:31:55 +0100
Message-ID: <4a4bfd9b4e444ecf9025e85b5cf0f864aa45c139.1791336002.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791336002.git.asml.silence@gmail.com>
References: <cover.1791336002.git.asml.silence@gmail.com>
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
index 6930a6897b41..6e4fe70b316f 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1315,9 +1315,9 @@ inline struct io_rsrc_node *io_find_buf_node(struct io_kiocb *req,
 	return NULL;
 }
 
-int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
+int __io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
 			u64 buf_addr, size_t len, int ddir,
-			unsigned issue_flags)
+			unsigned issue_flags, unsigned import_flags)
 {
 	struct io_rsrc_node *node;
 
@@ -1731,9 +1731,9 @@ static int io_kern_bvec_size(struct iovec *iov, unsigned nr_iovs,
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

