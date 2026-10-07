Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376FC349CFD
	for <io-uring@vger.kernel.org>; Wed,  7 Oct 2026 01:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791337411; cv=none; b=uUR6WLFlduWdwWhDqBsfvWrlqvRVVpweDV4C5ZM6bJ0IvXEmA53wwXiryROw8ph4e09GM62Vtf0hICTqaGY0/yjtdi3lw9OCGRwAUmmqlj5wmyxwMxkUHsl8lfy/TKbZ1DXtCtG2AjVUarqalVGW1Z25zoo4hU+C0a9c37vg2zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791337411; c=relaxed/simple;
	bh=iy9U6gJyxks5ymTnPsPTZg2hiScYxD3ewbuzhpHoVzk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X/6b6qOCy5+iC8060/b817ehj8PMg2A1zr5pRzoSSQ7bTleaY1phYG78ZS/LtrxZvEG7CKNX9c5B19IUtts1ESpeA1Mw6eiV5Gg1JrJiYUs2UC7tbCu8FMeGv+S8wy2ZjOU2TbfQ35T2jysf+6RX5ogJ7x6lY06+ERHAVHZXxrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXTwCzJD; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXTwCzJD"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so32983605e9.2
        for <io-uring@vger.kernel.org>; Tue, 06 Oct 2026 18:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791337402; x=1791942202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SSeH33Tp73HrlxrRD40ZRw/kp0xshqtHbX/nV8WDcGA=;
        b=ZXTwCzJDFcyzO8SCksoWO3x+1pUndPHwo7B9GSWfLn5A3I3f50GPfnDclabpI03HD8
         Kpjnw8Y+uSiCqGngqohra5lymwGskCdnlcRHiCMBRVtpKX6BJ0eokEVRUCDIkLTzhaov
         twmjYoLY5Ho9s1sPs/zJGXEEYWnORYEzBi0bZWcR1yNdVjc3L+r6W/GG/6eQHQDfdQIR
         tiplSbT/Yx2LvtRiLRZzszW9PoLeArxPoyjjDeMdC0evV0edTTDy5wHhX8A/26JDtQsv
         RetqtmzQz7XqlxNH5CerYBIldYJvoyXajNKWqqZz+cci3lln5jFKucHEjviTq3Om5kPj
         cQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791337402; x=1791942202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SSeH33Tp73HrlxrRD40ZRw/kp0xshqtHbX/nV8WDcGA=;
        b=ubGSClrceXKJxjdCxvTdnEgydEjnY5fVmrM22CddtY3d8B/HmUE05nEM5aIaXuH5kf
         216mnpjx46svr5nSHv7xkbqce/zuHUwpDeF9ffLXvmWEIPrpm6wt48F18IIcj0Z9QjcO
         3khPEN42zlS/zic0dC2IdLTEQISzPFzwS2yoj2nWKanIGjgeKqzxo4atOvAFkOAHXjjJ
         j4xip3TLquhplWf6xlBDMV/lVLkYDd4pXyNreQI8o6ZxBui9sH+EAt3qdLGHWgNI1VPf
         y6gFgeWX+nhhU04ly29QYeLl0nkFkkYoi1aDPyXOM4YmyRIutT8D/vM7B2zK8u8gKOno
         ud1A==
X-Forwarded-Encrypted: i=1; AKwUvBy3C/KVXIgBfAYm4S6mShk/FuUlMnGWzcwE2H9rFoevjmbtB0Wz08I2m1jmxmRIupnfWHlb3Yft6w==@vger.kernel.org
X-Gm-Message-State: AFuF++ksMsgfjQ7vftgtZ4eRHku4h7LBRoYM1ISaBo30yFfj/XMpHN6v
	d5siSz0HxAcAJ/O54/RJUCL35mTv2u6cxmiMCZepf4mk1UiEN2GreN0z
X-Gm-Gg: AYBFou14HAqzVE1PF0UPuvd5Pn5UarSQQ/DClOcANwNVuLgWGeuwpL8mmjkUaFl0UCh
	nuzXMqV+VBj33UC8FaeJ3hdDWzOb4F22p4lfA18poCzMH+SGKVJ5IxhNtzVuBqUrSH/RwPXn+/4
	SJzRzsKpHkv3gzLDAbpDx85DvfSssRDa07TNBQuqI38v6nEGjkuBb2FnzvuVJOJ6ax6n4QCPKQH
	YC/95kXZGoPRFRZHdqi9Gxiao3LT0XM3pxNR9jY7uNNvLX3nfieCdijdP5WyBlLgJuq4uCJlKK8
	xtaa/jF6sjQvgZod4kVvmu7xgtL8vQuEK9oIicDtJ1ClS/qJVcdcczeAxo2G2/2BqqmZg7gKwKR
	LzceXNY9uzScVF4oETJIckTJRzyJM0zAVodK/vFx+hALpwpWjuJLlSCzvE+VJSxbU8Dzz1vp0na
	e7dvdEdfXp9qM95e1Qea86aTrD7sQV6hyfM5HFdEUrYutMC+YOTvvPN/p52j+VObUaYOTf3ELmi
	+EeB9iXDVGjnqRkqsfTldXUZbpXNubcTBJzxshg4w6uN0DCvlPIWQykRrt8YCCtR+NkMOrqp/5d
X-Received: by 2002:a05:600c:3e88:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4a1800807b4mr8642425e9.0.1791337402388;
        Tue, 06 Oct 2026 18:43:22 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f653d7csm26423895e9.14.2026.10.06.18.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 18:43:21 -0700 (PDT)
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
Subject: [PATCH v9 08/13] nvme-pci: add SGL support for the dmabuf path
Date: Wed,  7 Oct 2026 02:42:51 +0100
Message-ID: <0613da77bbb89c3128221ffed3a76af4817981cd.1791336930.git.asml.silence@gmail.com>
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

