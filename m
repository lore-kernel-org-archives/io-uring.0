Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C0350278D
	for <io-uring@vger.kernel.org>; Wed, 14 Oct 2026 11:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975774; cv=none; b=IlKFS1Y8AK9DfxD1TZUdBQq7MEQLk9IxVDFxI/PobuqeIE+VJtG0l8R3o5edWRjS+lxf7DzhEb+oRDiChDL+x3MHjVedQ5UILG37sM2v9vZN1mhPsNc0KwF1nBw5Y4fpecONolED1ZbBjrQYHCBLPYEqdNcOu02pTmBREXxfK7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975774; c=relaxed/simple;
	bh=r60ha7f86tSXOy7awDRSeceZcMhT0AOlgJWaxT3jtGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gX1S/os8SOKwHc23dGZTWef1j7baAN7Q1Fq3zkL8mB6GCXVjNMW9C9eJSwWLqEner+Z3mHP+CwbG4fwZH1GSMSnSVI7d8mPRGNUJE11WSbRXZMf49w/ETOeoQm41FfjskedQCaJxxW3ullyGe9zaVzYSSzDoTUvaNh17oI17oKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CNcYKEqc; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNcYKEqc"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so31350785e9.1
        for <io-uring@vger.kernel.org>; Wed, 14 Oct 2026 04:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791975763; x=1792580563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ays4SVba18pfRPB/Hpqu6QDaxGmpKJaoA/2lD097Khk=;
        b=CNcYKEqcxoiGjrLri741QOfEqW5GDwWDAKigQ0DAYSdZ5gaiQfpWEVT5vUZjN8epaE
         fttUP5e9tbZgphAWvxDHT7/luw4/EGZl8K/Hzy9dXUdrIugfa7LM2LjHxOvfkloT8F4y
         A+SzPpqZBXOOGurdhu7MNIh5garaOql1IZZb+TnA49/GWjgCZi5ux58ZcVsBmCu3tQoh
         NKPOLxm4vYkiibKdxxh7/n59+lugHItsW3i04Sg3P9ycMjGooYGJ4lFiXKqhcdRgI13E
         c7851tG9LSs9+TLoBoaX/3t+SqmEw0/q5uc4bEATz+wKCgs4hiy5Xtb+0mWmOVuOxZsr
         Hu0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975763; x=1792580563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ays4SVba18pfRPB/Hpqu6QDaxGmpKJaoA/2lD097Khk=;
        b=YzUIlsUF0XakRw+yiWyxodjMkPruyvxCMtVCG1pOQUs2et67vpn7LvI0zvIqRHuuZX
         PjauQ1AwmrU7UvwDyZHZQIaim2Ly7xXtn3aMhT+a2iCIVQX2VGku58yaHYuKiPOZQabA
         BgJN36Zg/CZOFnFBoWOYK07XDu5MT3NfSWae8KHE9iCttbyT9pIGeGTJtVkUPHLoTJoP
         6jlZms0aKa6IinUXYiCE7fAkQnI25Mnt2idUQ27/xiWx4CLstqYGofjL4mH6SeEYLM4l
         8ziIySewFIxWhvhRccn5YoPEz02IL5Qo1Urq9B9gwSeyDPiOlkjOFcgj6KqESCXbUaOI
         s1sg==
X-Forwarded-Encrypted: i=1; AKwUvBwDtbAM+AbrkjmIqYqZQeS1IPyfE2RX8vWsTRQOgwYIw79EWRh0mYXq2DZNhPxxLKZKE96skaN6+g==@vger.kernel.org
X-Gm-Message-State: AFq9FYKSpjIbDAPb8e4k7u0CBBxS4y9zgFPskeqhfmM5A2uEDzeVxKzN
	x2D8f0YFvD4+eqhb0Y3RUe9NlbVQYi3sV0FNMqOxtiLf6wM+Z7ZFDeIh
X-Gm-Gg: AYBFou12oRLk9YYRmEsOZgKL0aMDnNLEzSx+2x374jNc57blYfUeZEWCZ9bOgGWqdRb
	NlhobFdh5cmeFz1ap6eGTefv67505eeB3pY9W5t8OR7BEg+rPJNlfEcl06LbhWVBLlKT4giohwp
	kr/AFHn/vXhx2AbBept3TjNTwxZWVO0ePII35+lU19DzE0LBfgmSHHByQFpJRCyA4RxJmGCxGyf
	ZRbR7O7SfwPEUTpDwo5Z9zW8UXq1+A1uV6R7lIgQ0c7grbyuQWoi2AbatEJy51EDgKNSlki3/jG
	MGWypD+XYYK8ViT/omrFLEq2182Cm6v35jTXUJ4do7uE97fzuPCjKTd0QYNhqKDLcBLaH5jFQMc
	DbTrh6FelFLGzgpiAHe85hhriGqnBVCWC2eHODFo4jvCP+bv7Q5+qd0xVtwPUXua2zzSCzM8+uZ
	6BGGbfHt1UnNDao2Hb6sB0mfg1Wtx8icOY3SKs9NuQcTfmw25fjqArKXSkLWyzGtkPm8cWfpWXX
	4kJpkXYZuvETMp3Zq0vjXLYNT8qsxjuilZLzqBBxWhxEnkjtIJvIjlELBU3IfggrRBRdjZp7igA
X-Received: by 2002:a05:600c:154c:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4a18e4a9159mr329602185e9.19.1791975762395;
        Wed, 14 Oct 2026 04:02:42 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b45eb78csm38078845e9.2.2026.10.14.04.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:02:39 -0700 (PDT)
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
Subject: [PATCH v11 12/13] io_uring/rsrc: add regbuf import flags
Date: Wed, 14 Oct 2026 12:02:10 +0100
Message-ID: <eb798e045bc245ebb7b0b42ba09a34b92f8b216f.1791975048.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791975048.git.asml.silence@gmail.com>
References: <cover.1791975048.git.asml.silence@gmail.com>
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

