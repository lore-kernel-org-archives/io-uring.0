Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783643438BF
	for <io-uring@vger.kernel.org>; Wed,  7 Oct 2026 01:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791337397; cv=none; b=DLjokMrVD1SNiyXnVvQveko23rIyJ9TNFS2wutpz63p7F798fd+IVgWyvtE7vPHFV2XvX9MnqB1IyLXNmFt62zdxMmyRnfK1q6woDeU/GMQAWrvLs7+SGl/Aryx7Kys8p7eJcbTfH44852BMqf1eXPRXUsYO/voldeg02W/UGFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791337397; c=relaxed/simple;
	bh=lqtmMOq9NyJHWkCTixF/EfRvdzo9ti4x7BRbdW0dvpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I8+/XDqfSDBT7Eidk6WppTxtpQLco60Zhk/za0VLijQBuGrxBhdXaEr4UDxhF2UdIAdukWLhoBabYQsilhXakQ1FQv5Z2h5+CJqmrRBxPDF1SH4ISJB88fpQ/t2BlXn7npDCUoelUL8ECzKGPdz/cieVGgaLwzdobIUNnY112ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dESaBPDV; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dESaBPDV"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso31600665e9.2
        for <io-uring@vger.kernel.org>; Tue, 06 Oct 2026 18:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791337394; x=1791942194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BooWm7URUcyrH2E2qkRWxlx7KQoz7GWFpr53v56Fl9k=;
        b=dESaBPDV4Ukztvcg7uEN5PPES+i8YXb+SSrNwbql8zn7D/45P7ttuJqb9mBz0cyu+E
         185hKAXEd5/80OFdd6MR5jJ08p/W2Jkrc87tbfboKIPwXHSiJOOZ6gtcjWrTW9KBkO2K
         2bLc6Nklp4jWRt4C3VI4gQLGV894Fhlj7XD58WhIVgGt0OyT8zeKZiRCWI9YBBblHOuK
         kz/ZULF2lxsyXYrNJKqlPD2r4SE3Vz7JlfgfuhUO8nR8JZB8jGXTZ/NHa2eGHFloFehz
         vNTOWWIt12286QIdUgJjF8AZAembvLE+8W60bRiu1T74MTutEiNMRV+OR8EeTcB1BPVS
         faLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791337394; x=1791942194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BooWm7URUcyrH2E2qkRWxlx7KQoz7GWFpr53v56Fl9k=;
        b=jRE2MFKsxDixrzn5z5zTesJE0Hv/TwBcRi03zinZH43uW8eNk4k3CrlpF85YAfGVAY
         9Qp/XU29qJC/5sNMbFCPeMGm7Ho6bijh8HHZZ5qePewZuWo0VgiinulUGk6znKy0cKTg
         8Pxr5y/dY6CN9xVMC3fQZ2uU6zwA2spb6n8C70LCanG2kGR/toG6Ge+nx8vyl5jhj8Z6
         Tmen77ZvfFQQ6p2keX3hCteMTob3bvlbQ1td4IN/tx8vBdoGzJT6ZMqruXsD61GUrR5N
         dIke+QYORwWAHZX4L8ws1YAW+oqamFO6FDgh8wcF8jJ+fFw5/XqogeJElSp30RweXf+B
         blaQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7cOrz3YyoFjLZKtvlCB0xurqf3pxLg3YQFJ5zjIJCREvRxDzTaWid5iNduVEKlXb38qs4BmeC0Q==@vger.kernel.org
X-Gm-Message-State: AFuF++lXQ9oZvL8LtgGy018PMqQ9EbsIpdobk1VuES+a+P1ECAMJn0Pj
	Rvul0SUx3yLdtJxVp65NtqMqGZfXipIiyh6tp8atL9g97w55aZH6Y2Qd
X-Gm-Gg: AYBFou3YWz+38FkhWulnrAPFfikF9NcIs77cufRQG12dthCegoSUx+oRkV6gs0UNxuJ
	KZuulgBrPHiZ+6in8D9Eni83asnu+qpRzqX4DLS+G8/Iu8xkCJf6Fey9g0+AwTUKmDRopTvjTLt
	a3VVPmwdRLhtGf5Lcmv/gfKZsJTBTWNEvIYqSgPNaqiFLD0qt7IHRqzrDIZAaJPSh7OLQYhogDP
	6+RhjdrDv4Oi6Upsu4C+4QexFovoACMPxOZKRV6EVB9jI0w++Ye7/1vV84bywYCNLowqOjbwBXE
	wrxZ2VofqlKt+fCO4JhDnzp7lTc5fmn1SsTw1t5/GDa8aL6o5FDX3XTt65feymds+aYn0/bdRLs
	sxWXJmwC/dtpOgtudaVUhtGkSRovyPt89R2QjzN9USdPFy39uW9IQFUxJX+O5UsRFEfnb80sWdO
	lefyITKboCZ64uzWdcDHgp8TQb6LuKA8qIpxt0YvqthMnONmCJYobfqiKIQUV795BOXz+HMghwE
	xREzi9OewN+KeZcxYjB/GgNtNsaO80TnCkCwr7VnjLKeZneHvM6jb8sgteYaiGyLYv8injRRyDr
	QvH+8GMsEsA=
X-Received: by 2002:a05:600c:6097:b0:4a0:1f90:594b with SMTP id 5b1f17b1804b1-4a18064cf5bmr6446075e9.22.1791337393761;
        Tue, 06 Oct 2026 18:43:13 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f653d7csm26423895e9.14.2026.10.06.18.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 18:43:13 -0700 (PDT)
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
Subject: [PATCH v9 03/13] block: always adjust bi_offset on bio_advance_iter
Date: Wed,  7 Oct 2026 02:42:46 +0100
Message-ID: <beec7303891dac21cd620d2a47842f843b391192.1791336930.git.asml.silence@gmail.com>
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

Extend bio_no_advance_iter() iteration to also increment the offset.
It's not currently needed because the currently listed request types
don't have a buffer, but will be useful once we add bios backed by
dma-buf, which don't have a bvec but work with a single range.

Suggested-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/md/dm-io-rewind.c |  6 ++++--
 include/linux/bio.h       | 12 ++++++++----
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/md/dm-io-rewind.c b/drivers/md/dm-io-rewind.c
index 04f3fc8aeb6f..b22719c6411c 100644
--- a/drivers/md/dm-io-rewind.c
+++ b/drivers/md/dm-io-rewind.c
@@ -113,10 +113,12 @@ static inline void dm_bio_rewind_iter(const struct bio *bio,
 	iter->bi_sector -= bytes >> 9;
 
 	/* No advance means no rewind */
-	if (bio_no_advance_iter(bio))
+	if (bio_no_advance_iter(bio)) {
 		iter->bi_size += bytes;
-	else
+		iter->bi_offset -= bytes;
+	} else {
 		dm_bvec_iter_rewind(bio->bi_io_vec, iter, bytes);
+	}
 }
 
 /**
diff --git a/include/linux/bio.h b/include/linux/bio.h
index 17944e44b584..892ca469c570 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -113,11 +113,13 @@ static inline void bio_advance_iter(const struct bio *bio,
 {
 	iter->bi_sector += bytes >> 9;
 
-	if (bio_no_advance_iter(bio))
+	if (bio_no_advance_iter(bio)) {
 		iter->bi_size -= bytes;
-	else
+		iter->bi_offset += bytes;
+	} else {
 		bvec_iter_advance(bio->bi_io_vec, iter, bytes);
 		/* TODO: It is reasonable to complete bio with error here. */
+	}
 }
 
 /* @bytes should be less or equal to bvec[i->bi_idx].bv_len */
@@ -127,10 +129,12 @@ static inline void bio_advance_iter_single(const struct bio *bio,
 {
 	iter->bi_sector += bytes >> 9;
 
-	if (bio_no_advance_iter(bio))
+	if (bio_no_advance_iter(bio)) {
 		iter->bi_size -= bytes;
-	else
+		iter->bi_offset += bytes;
+	} else {
 		bvec_iter_advance_single(bio->bi_io_vec, iter, bytes);
+	}
 }
 
 void __bio_advance(struct bio *, unsigned bytes);
-- 
2.54.0

