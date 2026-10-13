Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381C455C1DF
	for <io-uring@vger.kernel.org>; Tue, 13 Oct 2026 20:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924943; cv=none; b=Q4G3mVgFv4ClJYtHpIrei6uRIHhUZ30o/VX/9yIyuyOcphvVzA+PX0MO8liiiH3HfOZQFYuBDo822f1LLj3OgGZPvIys/bt5beryE3Vv5I0H+m786aast5XXU6w2loUzOF82f028Z7nxJsZmSU1g//847aRqYXeyM7HR7vm7Hng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924943; c=relaxed/simple;
	bh=iy9U6gJyxks5ymTnPsPTZg2hiScYxD3ewbuzhpHoVzk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r1OPyn1EgPY56fi156+joDR7QyaCbXPc1WRjUbVnejGLZC2khuzD/cHbd/CD43B6FWA9iQ+TWbrH8yzycFAOE8R1xawNCl46eCFf0G8PVDUmPvAxe0LBPxezZP6rx0w9Xefquiam7pwUJV9QKAGBGddNfcOk/rGo/m2YZc8yrpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rxB/KSTH; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rxB/KSTH"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b0946c2c2so2151088f8f.3
        for <io-uring@vger.kernel.org>; Tue, 13 Oct 2026 13:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791924935; x=1792529735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SSeH33Tp73HrlxrRD40ZRw/kp0xshqtHbX/nV8WDcGA=;
        b=rxB/KSTHvWpkavsnom95gTiMDT+JfmZAJB44NlGZhTdwcxrSXV5dw2AqP3OJXkuPr+
         NHPCJS0YMm2qrqXYshAb6gGsts7I9pkCZgx0Obymx4o65k9d9pCPLSo6pmBkyufDuX+f
         ZiQYGtmr7aK4Hlnp+YJYsbpGgDrwnlEyNIdFEF1t7So3pyl5TnvZ7VE/D+r7W9sAaBk7
         P4Qqmfrbw4pfFp0UbghV1MiDGmqTHH/OmI9TQmvv85M0SzaCAXCY1gAUQAyL9PLWN3oT
         xIGiwkA8wXpi6Jdv5+c9MUWX45Bt+zxqBmzTMV+TqOAXJCzX+71tO/rpAS62dSdkFVaL
         pvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924935; x=1792529735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SSeH33Tp73HrlxrRD40ZRw/kp0xshqtHbX/nV8WDcGA=;
        b=riin+s7vJKCdjWl2eiDcGfpw6nkk5yrLlT57VPaKQU1HZ09UoPYJN10Vhv2URUVxyO
         SgTuz19N1PXRAP5nf0JBACNNghqEtC0XebUy+EV/QQRpSAYS12yVD5YzDPcfnxtsdGVK
         uSa7cZSZmJ/iT8ezrrlSFT9yteLr/J6c1kRpQCXZr9DV7tAePQj9ToLQzROcXUbvfqaC
         tHGYzXmx2XNF3kIUusYHoflvAKpFkumNceMzzg3jTrNPwVaaRaLFDVMPOsYpWh75lyaR
         ANz4wGNcPg8paAwpv/TN47z0glvsKKJq09dbp00YdZ8IMUZeX9U2vY7JY6gEqKoyXWcH
         OiAw==
X-Forwarded-Encrypted: i=1; AKwUvBwshxcCbmWrU6BcKOY10cf1fL/6VITKEe1s4M96PxJW1QH/SFNAZosx8bTl7LseQNbg1E7czITp1Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYJEVPcEaB4zOI8IvcUsKImJOvdxl9i6Mw8F61tGk2zF3ioQn6lW
	rdj0bEgXiRc2EibCDJyh790Uny2JehCAdZZuINJSJzQt2GYa0A0HmUIu
X-Gm-Gg: AYBFou2YbaB9q/81R6rGmaFdRbCh2wPfMfqoywI/I49WMGcOWVD5omGhvKkvOsc5M6m
	NWKhU9hBeVf+X953GaBqINUxlVqy2Z+rc0f0v5LNkMBryvFzlIx57ECZxV7dXbNQ/6Fm/GhDVc5
	WPvkGkJNNMykEaktgJZV+B5ZAt8AOLGTtvgFHHhKz4S1FDgMj2lcZ0Vab+y5o6U3Og5OJUwPsP7
	ZZDCvqo+VUySu/xbi6v7GH4fFwC0zvQLPltPtjH4z2bL6k/khMWVoCAuR+KsRdGcOe/UNvDKHDJ
	ls9gjfQzko9eXzOoYSbiSOPDFoeavKW1ks8KGJnBYjjffz1uQFd9D0j2zj0ASO/44vvP7KxNWEF
	924Eal0ACHFov8toEg9xn1FSz4R4qqX2Ya5Gzqkjuyr/T6CyEmcJyxocjdl0S6q9pRMj84UVPk9
	AaPhLZHvIDBMJC9Fh86q52z2/7JXOXon+3afrV3+oE1JdeuBxdvPh8XJhrrZeX0eCwY69SwfpIJ
	mpwalF4N8zFmdi31YLI6lbBXEqPhnvjnsOZNRvVvFbY2lkGGOr00hFwg4EFysRxC+b5pXtV16B8
	mh1IBs5Kq5g=
X-Received: by 2002:a05:6000:2002:b0:48d:b940:af77 with SMTP id ffacd0b85a97d-48dbace21ecmr25776962f8f.36.1791924935206;
        Tue, 13 Oct 2026 13:55:35 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de7273a0esm2380730f8f.29.2026.10.13.13.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:55:32 -0700 (PDT)
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
Subject: [PATCH v10 08/13] nvme-pci: add SGL support for the dmabuf path
Date: Tue, 13 Oct 2026 21:54:52 +0100
Message-ID: <892e9887dabf195633d376de113b775b29ae7dd3.1791924581.git.asml.silence@gmail.com>
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

From: Anuj Gupta <anuj20.g@samsung.com>

Add SGL support in addition to PRP for dmabuf-backed requests,
building the descriptor list from the mapping's sg_table.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/nvme/host/pci.c | 150 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 146 insertions(+), 4 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index a0506c93fa16..79b3c1092e4d 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -1223,12 +1223,18 @@ static blk_status_t nvme_pci_setup_data_prp(struct request *req,
 	return BLK_STS_IOERR;
 }
 
+static void nvme_pci_sgl_set_data(struct nvme_sgl_desc *sge,
+		dma_addr_t addr, u32 len)
+{
+	sge->addr = cpu_to_le64(addr);
+	sge->length = cpu_to_le32(len);
+	sge->type = NVME_SGL_FMT_DATA_DESC << 4;
+}
+
 static void nvme_pci_dma_iter_set_sgl(struct nvme_sgl_desc *sge,
 		struct blk_dma_iter *iter)
 {
-	sge->addr = cpu_to_le64(iter->addr);
-	sge->length = cpu_to_le32(iter->len);
-	sge->type = NVME_SGL_FMT_DATA_DESC << 4;
+	nvme_pci_sgl_set_data(sge, iter->addr, iter->len);
 }
 
 static void nvme_pci_sgl_set_seg(struct nvme_sgl_desc *sge,
@@ -1239,6 +1245,142 @@ static void nvme_pci_sgl_set_seg(struct nvme_sgl_desc *sge,
 	sge->type = NVME_SGL_FMT_LAST_SEG_DESC << 4;
 }
 
+static unsigned int nvme_pci_dmabuf_sgl_nents(struct request *req)
+{
+	struct bio *bio = req->bio;
+	struct nvme_dmabuf_map *map = to_nvme_dmabuf_map(bio->bi_dmabuf_map);
+	struct scatterlist *sg;
+	unsigned long tmp;
+	size_t offset = bio->bi_iter.bi_offset;
+	size_t remaining = blk_rq_payload_bytes(req);
+	unsigned int nents = 0;
+
+	for_each_sgtable_dma_sg(map->sgt, sg, tmp) {
+		size_t sg_len = sg_dma_len(sg);
+
+		if (!remaining)
+			break;
+		if (offset >= sg_len) {
+			offset -= sg_len;
+			continue;
+		}
+
+		sg_len -= offset;
+		offset = 0;
+
+		do {
+			size_t chunk = min(remaining, sg_len);
+
+			nents++;
+			sg_len -= chunk;
+			remaining -= chunk;
+		} while (sg_len && remaining);
+	}
+
+	if (unlikely(remaining))
+		return 0;
+
+	return nents;
+}
+
+static blk_status_t nvme_rq_setup_dmabuf_sgl(struct request *req,
+		struct nvme_queue *nvmeq, unsigned int entries)
+{
+	struct nvme_iod *iod = blk_mq_rq_to_pdu(req);
+	struct nvme_dmabuf_map *map = nvme_req_to_map(req);
+	size_t length = blk_rq_payload_bytes(req);
+	struct nvme_sgl_desc *sg_list = &iod->cmd.common.dptr.sgl;
+	size_t offset = req->bio->bi_iter.bi_offset;
+	bool pooled = entries > 1;
+	dma_addr_t sgl_dma = 0;
+	unsigned int mapped = 0;
+	unsigned long tmp;
+	struct scatterlist *sg;
+	size_t remaining = length;
+
+	if (!entries)
+		return BLK_STS_IOERR;
+
+	iod->cmd.common.flags = NVME_CMD_SGL_METABUF;
+	iod->total_len = length;
+
+	/* entries == 1 fits in the inline descriptor; more needs a pool. */
+	if (pooled) {
+		if (entries <= NVME_SMALL_POOL_SIZE / sizeof(*sg_list))
+			iod->flags |= IOD_SMALL_DESCRIPTOR;
+
+		sg_list = dma_pool_alloc(nvme_dma_pool(nvmeq, iod), GFP_ATOMIC,
+					 &sgl_dma);
+		if (!sg_list)
+			return BLK_STS_RESOURCE;
+		iod->descriptors[iod->nr_descriptors++] = sg_list;
+	}
+
+	for_each_sgtable_dma_sg(map->sgt, sg, tmp) {
+		size_t sg_len = sg_dma_len(sg);
+		dma_addr_t addr = sg_dma_address(sg);
+
+		if (!remaining)
+			break;
+		if (offset >= sg_len) {
+			offset -= sg_len;
+			continue;
+		}
+
+		addr += offset;
+		sg_len -= offset;
+		offset = 0;
+
+		do {
+			u32 chunk = min_t(size_t, remaining, sg_len);
+
+			if (WARN_ON_ONCE(mapped == entries))
+				goto err_free;
+			nvme_pci_sgl_set_data(&sg_list[mapped++], addr, chunk);
+
+			addr += chunk;
+			sg_len -= chunk;
+			remaining -= chunk;
+		} while (sg_len && remaining);
+	}
+
+	if (unlikely(remaining))
+		goto err_free;
+
+	if (pooled)
+		nvme_pci_sgl_set_seg(&iod->cmd.common.dptr.sgl, sgl_dma,
+				     mapped);
+	return BLK_STS_OK;
+err_free:
+	if (pooled) {
+		iod->nr_descriptors--;
+		dma_pool_free(nvme_dma_pool(nvmeq, iod), sg_list, sgl_dma);
+	}
+	return BLK_STS_IOERR;
+}
+
+static blk_status_t nvme_rq_setup_dmabuf(struct request *req,
+		struct nvme_queue *nvmeq, enum nvme_use_sgl use_sgl)
+{
+	unsigned int entries;
+	size_t avg_seg;
+
+	if (use_sgl == SGL_UNSUPPORTED)
+		return nvme_rq_setup_dmabuf_map(req, nvmeq);
+
+	entries = nvme_pci_dmabuf_sgl_nents(req);
+
+	if (use_sgl == SGL_FORCED)
+		return nvme_rq_setup_dmabuf_sgl(req, nvmeq, entries);
+
+	avg_seg = entries ?
+		DIV_ROUND_UP(blk_rq_payload_bytes(req), entries) : 0;
+	if (sgl_threshold && avg_seg >= sgl_threshold)
+		return nvme_rq_setup_dmabuf_sgl(req, nvmeq, entries);
+
+	return nvme_rq_setup_dmabuf_map(req, nvmeq);
+}
+
 static blk_status_t nvme_pci_setup_data_sgl(struct request *req,
 		struct blk_dma_iter *iter)
 {
@@ -1334,7 +1476,7 @@ static blk_status_t nvme_map_data(struct request *req)
 	blk_status_t ret;
 
 	if (blk_mq_rq_is_dmabuf(req))
-		return nvme_rq_setup_dmabuf_map(req, nvmeq);
+		return nvme_rq_setup_dmabuf(req, nvmeq, use_sgl);
 
 	/*
 	 * Try to skip the DMA iterator for single segment requests, as that
-- 
2.54.0

