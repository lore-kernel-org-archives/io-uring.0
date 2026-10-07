Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DD236897C
	for <io-uring@vger.kernel.org>; Wed,  7 Oct 2026 01:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791336749; cv=none; b=KnznP0uHLqx6bO2sC0mb6A5oy5tBWBinSjNy6NV0KQWGoSB5tbd+14QKM1UyqIOMe/tAILlYQWFtmtMtf5zzJ/ZLHOkm11W7vbgoNF3/10KdWxXeYxivIqpKsI4dHdZnmMrKxhoCVfBT2T6FMMi5ANu06Q40TNTWeRkZg3LkpNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791336749; c=relaxed/simple;
	bh=Pm6Rb7wT+j3sduRH8AC/hPaPOXEeHtixW7LlbFfv5Wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CDtMRdAztEtFDePzzg9IcgbtP4Yo2pApcnVD8f3R0MU9ag2aa7njqDIYXHs0zsDvH6AYV4q9awUPnswvKh1Lvq6xX0AJ+819KtbD7lCRcVDn1VU+nmquQeS0UYViuykhrPzpGXH4gFHd+oW+AC9asmGAgLVf8EQnU1tm/nTRP04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VvX3Dnx0; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VvX3Dnx0"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a01933b584so11485125e9.0
        for <io-uring@vger.kernel.org>; Tue, 06 Oct 2026 18:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791336745; x=1791941545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fZk+12RxIUpX87ik4Sju0ydtLd9LDkS9K++2ovit7qo=;
        b=VvX3Dnx0qoDL8lSf7nEbY3mWcro6KK91o33rMqefIYfGDOMQyZbwwHy6oyBkpFUP9F
         tLe0SAzOqmpS9DtfJRAZX5OgjtMW6rbQQ6osFMrunIW/4NowZ2JNiZ2jAhFZWsJ0Rs05
         0CpZhhyREuzpYQ19abt1Db3hicTjHt9z/GZNpjSGeUi0kcJdISN5trFGERatm2ui/5BQ
         ceRWyQXYeD4ixnLXQ2F+ECqUQbE9oTKn6EbtyGAgKzycRRxQTCzUWozDaTTQJoGjsR3q
         gXVnH0X5LdEqo0IQROLXyrwYEA3YHI4QYmnJpx37+8c+pjVrENQykHXIXHaZsj0zBg1z
         g98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791336745; x=1791941545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fZk+12RxIUpX87ik4Sju0ydtLd9LDkS9K++2ovit7qo=;
        b=XAwLeV1VQ/mIJlaghhWN0Z+qwe1iO8AUWt+OPxCWGjzHeWdcjnrCY6O7/eFKIBhhAF
         PdHM6hHXqr+gIoaG2KU09yOnt8Gd3RE1ItcORrzXwQRl2SX9o3YMafTTVI013QWDnuJS
         xD9cIdS/QcE84DKSZLAK6T17W4rxyQp+m9sv7jfSoBD3WS7EFEDX2Mfibs04thfp4X19
         ohqEeMinEGx+CwlVVUesyCgKybbXrFaGfvsRe7UiIzQQ90v3dMQl356XrsafbL/r/m9s
         pzAT2asxGgs4Lk6o5Wm51YSfZfF4w1eN3J6OI9kKqaoto1ta891UEFuwlsCq6nBNMN/P
         q0yw==
X-Forwarded-Encrypted: i=1; AKwUvBwtDgjO8/k6w9L59A0z8iv1/szYvspIJBeh/mKjAlrLH8+uL2JmlggPbvOmbgLPal+LQdsBwQ67/g==@vger.kernel.org
X-Gm-Message-State: AFuF++kq9E5Xw3qId9iCcFfDDpYlSk6VT73oOchd9LyCtEsvDpshxxui
	Mt4LyiQB9sBkae+Zyx/cZJbVJ5z7487Z7r6JFFEteGb/XiMMxxzEIXgY
X-Gm-Gg: AYBFou0rkUYZw+cMl+jxIpLCjF/JGX/UfWnAHDy6+h5jZnNwyLZ/iKG16+4BEwTJ2Aj
	hpvPhH6C0tUPa7+RkNs0KxlgLXylrNUa4+EWRTMCLQq9bh2FYQa/Ma6ZhxAPHiqrPbs/ZFedRZd
	dNMbIFKMQtyhBqlGrt480E4Pj4DafD4600J5XcQ+jY/OzO9PAAqrATSad50hBQjZF9ziRYhaINV
	T6UYizo0jtWcj9U9IHXMGT9MJkPfInKfwnrI6LYIMbRuktG0Iekt0m3atofqRRWfEkNDdNbx/Dc
	5onlnla19U8wOpw6mS/9jpmqreQnc1bEa+u1qnF15npRJdDtF3rMVc89KswVm8nVNqXGxXJchwk
	rqaY5uo8D+rkQUKKAJInuYGedEWU0brhjcUqisj5W6AkXigfG+mO5iwUwcToTU7ObjjnjDhE+v3
	JKinvb9pTJaIGtraz86QkPPd/4XV3aZys1Yzj5LPsawDnb3Ls6Q2Pmotz6vZyv/i1jRQ4bDpXXi
	wBupJB6mJnrJJFM07DtVDmG3mkyDscnXnyEI9YcLCYhn4+/MAgUwRYz3ba1A7fI1yCH73mK754U
X-Received: by 2002:a05:600c:3b8d:b0:49f:fbad:29c1 with SMTP id 5b1f17b1804b1-4a1806611acmr8359665e9.33.1791336745490;
        Tue, 06 Oct 2026 18:32:25 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f6538b7sm21183615e9.13.2026.10.06.18.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 18:32:23 -0700 (PDT)
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
Subject: [PATCH v8 08/13] nvme sgl fixup
Date: Wed,  7 Oct 2026 02:31:51 +0100
Message-ID: <e4caf53b7334af5390d4098cb5883ff551246a5c.1791336002.git.asml.silence@gmail.com>
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

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/nvme/host/pci.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 651f7654d73b..79b3c1092e4d 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -1287,16 +1287,15 @@ static blk_status_t nvme_rq_setup_dmabuf_sgl(struct request *req,
 		struct nvme_queue *nvmeq, unsigned int entries)
 {
 	struct nvme_iod *iod = blk_mq_rq_to_pdu(req);
-	struct bio *bio = req->bio;
-	struct nvme_dmabuf_map *map = to_nvme_dmabuf_map(bio->bi_dmabuf_map);
+	struct nvme_dmabuf_map *map = nvme_req_to_map(req);
 	size_t length = blk_rq_payload_bytes(req);
 	struct nvme_sgl_desc *sg_list = &iod->cmd.common.dptr.sgl;
+	size_t offset = req->bio->bi_iter.bi_offset;
 	bool pooled = entries > 1;
 	dma_addr_t sgl_dma = 0;
 	unsigned int mapped = 0;
 	unsigned long tmp;
 	struct scatterlist *sg;
-	size_t offset = bio->bi_iter.bi_offset;
 	size_t remaining = length;
 
 	if (!entries)
@@ -1305,8 +1304,6 @@ static blk_status_t nvme_rq_setup_dmabuf_sgl(struct request *req,
 	iod->cmd.common.flags = NVME_CMD_SGL_METABUF;
 	iod->total_len = length;
 
-	nvme_dmabuf_map_sync_for_device(nvmeq->dev, req);
-
 	/* entries == 1 fits in the inline descriptor; more needs a pool. */
 	if (pooled) {
 		if (entries <= NVME_SMALL_POOL_SIZE / sizeof(*sg_list))
-- 
2.54.0

