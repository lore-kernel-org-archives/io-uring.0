Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6084A43EB
	for <io-uring@vger.kernel.org>; Mon, 21 Sep 2026 13:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789997987; cv=none; b=UIDPVyEKP7vebVgziHcqFJkyfEjS84RBDkrDW25I/9Jtc3aOvddND3vE72fKub41CKTDy65NXpTBnw8Q80a4vbFXR8lw9WxvScjS5+o6LUdkmKWRbjxgt/d3EtvglHZlu6ZD+QFwmh+J4DkuS74ixpwIzjh52uV5PZdcMkbv2ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789997987; c=relaxed/simple;
	bh=smDKQevZZNHOYCALAT7ddU35ycdlQd+jI7KY7MHT/MI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qmmt1eum4eQ+T/szv5s9WWX7xDcoTrfAsVPh4Yd9Er3aEwKmknxSw4LBzfneJvXq9IszllyS1QdZVYJLle9i/cTFrvZJKwxwZcKxwEEA8DjMmlMDMB9xYE8k6u8B72ki/WzL9PQo21bCFjypGNnWlfQ4lASg5jgBKM8J4eDft0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjBxfpz+; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjBxfpz+"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso14457805e9.0
        for <io-uring@vger.kernel.org>; Mon, 21 Sep 2026 06:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789997984; x=1790602784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EHTjFNHsfPkUevAeFTZNd93AhuEIP81I0y/DmV6dihY=;
        b=WjBxfpz+Z59BT444gfGRH3Mtq36vASFYOARX3FT6YjCghKwWC/pXcTF9wK+Ub3vqBC
         Sc4dhztOy6cixWLJTdmnW6aAAdKy6TPhMsPXXeutJhvrLzPjLqgtQiZ/zqfnBxCoUEeo
         EgLHekMf8Whef56EqGaYHtNlXeHKNnxM3wA1LbUHwyWakaZ++biQR//LT7RcYO3npvW9
         SrP/iKtyrib9w9UzVAEsPN7zVMbNF6NcA+QrrmokozaB0DMuC94DsYPRf/Krt0l6+z9r
         nvOpE25tQCq/X/7/Tg+hp4Ccl3nkS9CWkMQgEOeLKAo4Eh3RG9wpVUSStGcSORqd1XWa
         YPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789997984; x=1790602784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EHTjFNHsfPkUevAeFTZNd93AhuEIP81I0y/DmV6dihY=;
        b=s7eB0A+JS4M0KiSEkocefKtmtB91VjRd9gF3cfhWAPFLt+l9VYmDsAcHbCjbR4W6f9
         xHkNZLmMrc4kihRUwBRjGBDXzPbjtmhan75XFsIEK4ExRN3+Dpq9kFHzV/TgMQSzK2ih
         yaqL7+0+dTbgHdW6si6BcAo7Lv3NR6FKEy/bIXTzoom6uV/WXaHZlUHZjYTZX127Cukd
         84QS/7zpE1xNj5IGdZF9/LYJCn8ijfCqOqwQh0q8lk3zP44kj8XV9u2rXimkmwE1/EoT
         ZEEnBpaxoU0UM8wYmOl0YKBp3W2f4wpT8fkOZ7BEL4TL6n4wTn8Xa2flUNigDkSTO8qY
         L58A==
X-Forwarded-Encrypted: i=1; AKwUvBxpGhczKyQpc8Qmut9akN+dVYSrfn6WLIIFl3ulP+Hwf971ZdRB0kxQIuBUFimCsKXcmBwXqhOOIg==@vger.kernel.org
X-Gm-Message-State: AFuF++l05VZS8dW0gI4dmEk3mLQH3sHqElHTV2RHMGBeSMUhlyNQScQn
	MgL2mJEzBuqMxx3T6pZWtG48AsntIJgiiRyQN0zEDIpRhTDoXYVRjwWu
X-Gm-Gg: AYBFou3ZkJG+1oegmSIukcGhq5Olf9Cec7CBc52Jvay85zcJu3FmnghmSIoUN9j75Zm
	8cU7zYghr4c9g9n671SNWvuA/xG7azB432M1lLFu9TE1xOCjE852VhrzJNGILB3rcUOqMFaEusg
	G9elRD1fFC+6BFUC14CUk0ozRcsjVhGGNtnx84OZzNTfe+8L53wzIOSKyiyDTOGk++vXq14ARBB
	qJBTCm2HvEkfH7uYX2OWHLgG0tKKZtd7M3N/X9N/HrDcU3Dunbe3/ur0f+cL90iQwJYOtjALRnu
	lYFsAAMiTh/Hdr4Zr1SwqmdFQE9oTWuL0EOEkURZZM6FX8cZ51W2WG8s0dMZD/FjdQ1RafHXNWa
	ojmd8HYkL0xjlr7NCNwrKBzKGvslHJPmPmphjId52hRu99raekk5QYYc8KxEOhC5OdJ5tPuE1yK
	CFUSvs7XWLDlHG4iwGVctS5aqs9YDHIgqURBEQ61Ha2ggSN6Ea+HZmOUcFN8ZunRdnhCZjBJoYW
	JigiigubdXezn1W1E6a4uqpL3n3Y+Z8zimoc0+dHAszQeyq9cr48+1y047ibji3B3e5SSUqAp9y
	maNk30UHlrOMWxHlCr6zTJKYyTe0HA==
X-Received: by 2002:a05:600c:4505:b0:49a:a101:4157 with SMTP id 5b1f17b1804b1-49fc56db92fmr154368075e9.7.1789997983642;
        Mon, 21 Sep 2026 06:39:43 -0700 (PDT)
Received: from 127.0.0.1localhost (82-132-213-26.dab.02.net. [82.132.213.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm617171605e9.4.2026.09.21.06.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 06:39:43 -0700 (PDT)
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
	Phil Cayton <phil.cayton@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel@lists.linux.dev
Subject: [PATCH v6 07/13] nvme-pci: rename nvme_pci_sgl_set_data to nvme_pci_dma_iter_set_sgl
Date: Mon, 21 Sep 2026 14:38:51 +0100
Message-ID: <114bc2087c7811c849fafbf1392abd7edfb24471.1789997898.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1789997898.git.asml.silence@gmail.com>
References: <cover.1789997898.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anuj Gupta <anuj20.g@samsung.com>

Rename the blk_dma_iter based nvme_pci_sgl_set_data() to
nvme_pci_dma_iter_set_sgl().

Suggested-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/nvme/host/pci.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 3d645324f04e..8dc4002fa696 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -1297,7 +1297,7 @@ static blk_status_t nvme_pci_setup_data_prp(struct request *req,
 	return BLK_STS_IOERR;
 }
 
-static void nvme_pci_sgl_set_data(struct nvme_sgl_desc *sge,
+static void nvme_pci_dma_iter_set_sgl(struct nvme_sgl_desc *sge,
 		struct blk_dma_iter *iter)
 {
 	sge->addr = cpu_to_le64(iter->addr);
@@ -1327,7 +1327,7 @@ static blk_status_t nvme_pci_setup_data_sgl(struct request *req,
 	iod->cmd.common.flags = NVME_CMD_SGL_METABUF;
 
 	if (entries == 1 || blk_rq_dma_map_coalesce(&iod->dma_state)) {
-		nvme_pci_sgl_set_data(&iod->cmd.common.dptr.sgl, iter);
+		nvme_pci_dma_iter_set_sgl(&iod->cmd.common.dptr.sgl, iter);
 		iod->total_len += iter->len;
 		return BLK_STS_OK;
 	}
@@ -1349,7 +1349,7 @@ static blk_status_t nvme_pci_setup_data_sgl(struct request *req,
 			iter->status = BLK_STS_IOERR;
 			break;
 		}
-		nvme_pci_sgl_set_data(&sg_list[mapped++], iter);
+		nvme_pci_dma_iter_set_sgl(&sg_list[mapped++], iter);
 		iod->total_len += iter->len;
 	} while (blk_rq_dma_map_iter_next(req, nvmeq->dev->dev, iter));
 
@@ -1512,13 +1512,13 @@ static blk_status_t nvme_pci_setup_meta_iter(struct request *req)
 	iod->cmd.common.metadata = cpu_to_le64(sgl_dma);
 	if (entries == 1) {
 		iod->meta_total_len = iter.len;
-		nvme_pci_sgl_set_data(sg_list, &iter);
+		nvme_pci_dma_iter_set_sgl(sg_list, &iter);
 		return BLK_STS_OK;
 	}
 
 	sgl_dma += sizeof(*sg_list);
 	do {
-		nvme_pci_sgl_set_data(&sg_list[++i], &iter);
+		nvme_pci_dma_iter_set_sgl(&sg_list[++i], &iter);
 		iod->meta_total_len += iter.len;
 	} while (blk_rq_integrity_dma_map_iter_next(req, dev->dev, &iter));
 
-- 
2.54.0

