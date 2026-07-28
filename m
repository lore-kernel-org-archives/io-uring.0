Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BD747F2CC
	for <io-uring@vger.kernel.org>; Tue, 28 Jul 2026 21:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785274214; cv=none; b=Q5YgF06AMDU5AxWN0njGxLQ8X2bQaMix/4NrG1DJiKVPz9ErAzJg76pMI5gAKzf7wZa62DCE1W8McuQN7pQQ3ExQD5maHKJ/Zm8WzMt/mn5tK9sJGvuLtssqoK59IsJ+hALdXCJFD7EQnAKr0wFwuJUtERA1xohxhD24AD3RdO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785274214; c=relaxed/simple;
	bh=bt1fjQx57j1sUPSIKU54YXB3emwAGpiLG3SIBERbcvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MM4ijPhRnebatPBLvT2EwWZSRp/LUlnoHMIqFnQBfAZkaxbSIVBejUVIj08/LsHN8QK/0rLFRLswb92LuV8kQlHJxxL5mGVarUA8ZHrlMAG+ALHNJK4mlJ+ZmrbXgQiOh2YDoDxwpYjQEz37gfDyQPkHq0YsxX5XqbWRuhlfsIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3I3XC6d; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3I3XC6d"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-472326ca506so239280f8f.2
        for <io-uring@vger.kernel.org>; Tue, 28 Jul 2026 14:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785274210; x=1785879010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mhCvEG3xgv0esCi48jrWlXZeUf+lVK0keP2zUsWb1Q8=;
        b=D3I3XC6dQ/oOKK2O/2ofvHmwDqjhElP2Cr/usPPiueWfnxSn291o1UoHCTlZeOOIVL
         4D0hz6PHOvhptiOnA2XMfGCTho/jrTmMeHMeaiKcW9CXsuQqojpwhUvNpCaMoyyAh7il
         T3/CXl9KoCt22vkEBKM9GTdSMrEIiT9rxrEfM4phZpjjKShmuR8flxyCxHxCWuoyylrJ
         jNJsleztVMOIFqxHPMpw2oqJ43P4msMjLX4W5xT0180dH0o09UsQDoUmJywdzP/RE8uF
         zDmVjFxxGG8kn34gn5KiBCq6veaRLjHl0rFSQu1Nou8MfP9W+dfpVN+PP4dZdFQ2guM6
         c0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785274210; x=1785879010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mhCvEG3xgv0esCi48jrWlXZeUf+lVK0keP2zUsWb1Q8=;
        b=DNU7SEhT7pXXCsvJrafEKurgBFSF1YmQP+Wr0wcZcSwV+VEfihqlchv9xX/aIef5uB
         7Mr7vHDUoG8YJxQjYFEGoJUy7b98HHG+A62ZxjO2GJ0flX7PPDEywzV6PA+Bct0picPN
         PnaEQui4sp/ZOCgN+m8SCH9aqlIZ6fd6+621QkW7w8Qh5/YjIHPRhUvnV+Y/B5MCR46E
         hxyGSc4e/g+nmJlF3gS92MCTpv7i40frTm7VMtl1aLUQpMydyxmzzbrScXTX18tEiN/2
         G7TlWWenZUZ2+pBc/nODGp1jC9YsjINHJfJFEG0Ta4m9jSg6XMdxezdK3OopYvXFOgAU
         h5HA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7PLRvIW8YM5I7aPnH87VeNURAKPUQTAoOPC3eSL7Lw9ovfvP3mxMFFkCDrwjuH2NR1dXkRfNJeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzWGrZBt50USi4HEMBoGfVsZ/1ZEuFR4daBKH2LvHq6jgcXNsu
	6UrZPPahhQxuuAQPW/abU2MDucyUie1mVUwadjfl8Node41nwq6AfTHz
X-Gm-Gg: AR+sD11y1XkJfvqChaLgtiDGMuwS1n4RAQVJnvF9qHCbWYFYOFVXxrQfGaKIVxZs/D4
	qBtv7l2WG/FuyGpz7XpOjUybUXPLMkkAgAYl8nYKC5Tcg+epbYIT6M2R9NRo3cKlvW8z9hZ5eJn
	6AMyiQKry8qwkbA8SDyhW8Okv2dWW+Luz8KUqFE/e7tjCUqIq2dlwQ0jMAFw1YhHVNohx2oUXV2
	soK/nYbXKz5J6NlMlJ/RenyPmbg+QCCbPGIbqU/LOynXLXs0HTDZfKUaG/VkcnnBaKi9WTVo5DJ
	WF413yWW//ujNGQ2DgLtzTFg97wU6TjC0rYVEUUw26RE5m5jcFz6k9N4xC3MHzaeKP0W0ETKEGz
	fMuOUsxToz/WfjK8scGO4bxs0UmrjjNL6hSNbGlg8KxZao50GKOLrrNtr4Xhr6FVUBDj50XsP4J
	7JBq6ryCca654+dBilpCMwDCjZ9Kh+HC7Nxo9dbuonDyBnSs03JPaHkzHkIzg1ztdcbMWH8bQqE
	LAgEeKQ
X-Received: by 2002:a05:6000:26c1:b0:476:8a:5 with SMTP id ffacd0b85a97d-47fb1f12d18mr4496873f8f.34.1785274210211;
        Tue, 28 Jul 2026 14:30:10 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6ac44bcsm2245329f8f.11.2026.07.28.14.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 14:30:09 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	io-uring@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Cc: asml.silence@gmail.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Nitesh Shetty <nj.shetty@samsung.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Anuj Gupta <anuj20.g@samsung.com>,
	Tushar Gohad <tushar.gohad@intel.com>,
	William Power <william.power@intel.com>,
	Phil Cayton <phil.cayton@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	David Sterba <dsterba@suse.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	dm-devel@lists.linux.dev,
	nvdimm@lists.linux.dev,
	linux-btrfs@vger.kernel.org,
	ceph-devel@vger.kernel.org
Subject: [PATCH v4 13/14] io_uring/rsrc: add regbuf import flags
Date: Tue, 28 Jul 2026 22:29:25 +0100
Message-ID: <9eac63cb6aae06f591e6d0c67505ea2c16dd99e6.1785274111.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1785274111.git.asml.silence@gmail.com>
References: <cover.1785274111.git.asml.silence@gmail.com>
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
index d57e8a0380b5..05877b4c0ee5 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1245,9 +1245,9 @@ inline struct io_rsrc_node *io_find_buf_node(struct io_kiocb *req,
 	return NULL;
 }
 
-int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
+int __io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
 			u64 buf_addr, size_t len, int ddir,
-			unsigned issue_flags)
+			unsigned issue_flags, unsigned import_flags)
 {
 	struct io_rsrc_node *node;
 
@@ -1656,9 +1656,9 @@ static int io_kern_bvec_size(struct iovec *iov, unsigned nr_iovs,
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
index 83aa86e6f320..f12abaf63270 100644
--- a/io_uring/rsrc.h
+++ b/io_uring/rsrc.h
@@ -65,12 +65,28 @@ int io_rsrc_data_alloc(struct io_rsrc_data *data, unsigned nr);
 
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

