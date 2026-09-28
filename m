Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488904CE683
	for <io-uring@vger.kernel.org>; Mon, 28 Sep 2026 13:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790602385; cv=none; b=mMapS3TaMjdPSkMAsyNdgWF1OliV0KYn5V4vCPDqKEjgTwu+D8Gf9e1wN0U0hfUrXSFAM8DWOJpUVqUVp3kwsLcFm9eAmR9lnGjt0WMdhK1WNWpodALi6s1AUNzBcrnHBTNByoyMl80fO4PvpWrpoTUhXnZS9ehcavODrYT8LmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790602385; c=relaxed/simple;
	bh=wiOPOVzZkfrXRxbFz1UgU3+Xbr5CbqnKoLrDHMr2xo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rHD4d+7s0XpQ9VwNytQIkEn5F2Ujoi4+ZpajDr12RfnGJf+HIkuPLxR14s1eQkGXQjoq3HU4w1+petZ3fWn3u2+8a7Rw84SaiswtpJeHfYt2BwUNKZ6/vtpYsRq8Ip1J+PPioO8eanPY4vYlGwIk8/21s9sRs8WI0Ay+OLLxhbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A103FaSb; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A103FaSb"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f6cf16bso1859118f8f.0
        for <io-uring@vger.kernel.org>; Mon, 28 Sep 2026 06:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790602375; x=1791207175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z28dlsJTIpkqTAOZ5w69VF46XysVuY21MZeRZQmbEno=;
        b=A103FaSb31zfTZFdiyeg1rlVNhV/Y0mSzi1pmQMEVhQ8h5MmC+LzF6Loh5BR9R33Nu
         cJa0QpNtbiOq+814q1zyA2vrH/3JT8bXxDuJ0liEcR6uz3vAIPvzV3lKF6t+z+kRYepk
         AxFsfktwN0mRy1zjKsAIsUdKrBraHkOnIdqEokmBv4DzlbM6ctZiGT0tLs8xUp2jcIRq
         Tw4fTzJA9EB6nlXzd80bMpQk44iyuYjdQ2HrqXOQUH3yz85QDVbgMgwL7Z7waULl7lwz
         SFB7QL4L0BB0On9OuWfhYBapzspB5/8MCoMzobna0Wf3GetL1lEtETI5ccEXEybzOjE0
         9ARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790602375; x=1791207175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z28dlsJTIpkqTAOZ5w69VF46XysVuY21MZeRZQmbEno=;
        b=LO60m10LXw4BqLx8ceFF44ZGeBQoZEa5c10y2tQfplhsrP9cj4xYIIVlHryZQhWv4p
         RGB3g8SFLzk/3371F3EjA1/YNfzes3AFArJUzQ6Xpzg+jHOWg6AB22K0hbbgMjsAZLlh
         7jeMtmZMBSR+2NiHKRORklAlZf6PrgYJ1zRqy4YKYdenZSSH2Ki4YakIAbtj/QbpCrim
         0dgNyoy3yP9/Wu1d6vpnGiL2bdV+e4AN1IkIQNBwGGYOdtxl+rLI55fU4QVayhWSXqOQ
         zCYTGrEopkIXGWiu1HwTO94Km7DpR7xIjnf5uKS1jQCQyG3pdZ8BSxGanUjo92KE4dqf
         BySg==
X-Forwarded-Encrypted: i=1; AKwUvBwOtixmjTBTO1B005S5zRJ5U/UrqKR3lWevOFvFud9y0qwZ8/y/rv/WjLvHzs7LVN9jCblQaV9n5A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLLHpSlIV2vbFAhXV1W4whkLxI178prcqCv811FDXSwyFFjbCdE
	RLnImn7KYVt3Xnc6l7TONVTtCaMQvaGqSEtzPvDSb9k0RVgdtVTiUwI7
X-Gm-Gg: AYBFou1uSTSbrDKUz9W5p9OYopf+C4ac+13ku/5ybiRK0kHX+Kr+Gp97WJywrEe10L9
	6PHmAZ+OxaUORs2ogtrShP3jHLZgyrNEMIEoeDbNEB2KC9tAFk+NX0Spdg5ylA3t9VbbGriK7IZ
	vJjv+4KUdac3uAm9ZBkXGYa0ITg9N2qmzqeq9gKBnNL15rK0PqjaZfazKaYUynIlMPqmujigS+L
	cttwCq5xL4UXsOgoNWDqme+e5b1J2OiRQuvgITeytb+9g03nCVm98JUTA2gN0+U2E5uZ36LXxIi
	Ub1IWCIv4/8yLZJoSvkcOuSO6X1RQlLLMAZDz5HUeU1maAYj3oLwR9wZcYE8AFe94eyOD7WUQJP
	ah62L8MRvV1xO7RGtrHjO7UJUd5KOJR/t7bijd9uh5LrgJERyODfctqhzWDlo48rAhH6AyU978b
	5hpB3kZEHQ3nufWv0mEg2n5IgR7B2vLafuqRdm1GLthrvHxlHPmiV9dzOHDTgZ+w53vEQA3pXWb
	IiBQtwuuBgBt0FBt3Q+99azrWzNI0cTiQ2nxvImIMdu6PndXM5kRd5eVuoyVClqZkSHxAtSVdev
X-Received: by 2002:a5d:5d87:0:b0:487:342:d147 with SMTP id ffacd0b85a97d-4887db39b7fmr20252053f8f.39.1790602374884;
        Mon, 28 Sep 2026 06:32:54 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349731sm28090164f8f.12.2026.09.28.06.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:32:54 -0700 (PDT)
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
Subject: [PATCH v7 07/13] nvme-pci: rename nvme_pci_sgl_set_data to nvme_pci_dma_iter_set_sgl
Date: Mon, 28 Sep 2026 14:32:23 +0100
Message-ID: <f950827b5805d13f08f0060df0eebc4ed56814fc.1790602223.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1790602223.git.asml.silence@gmail.com>
References: <cover.1790602223.git.asml.silence@gmail.com>
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
index e58bdd9a4098..bb8051c62926 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -1277,7 +1277,7 @@ static blk_status_t nvme_pci_setup_data_prp(struct request *req,
 	return BLK_STS_IOERR;
 }
 
-static void nvme_pci_sgl_set_data(struct nvme_sgl_desc *sge,
+static void nvme_pci_dma_iter_set_sgl(struct nvme_sgl_desc *sge,
 		struct blk_dma_iter *iter)
 {
 	sge->addr = cpu_to_le64(iter->addr);
@@ -1307,7 +1307,7 @@ static blk_status_t nvme_pci_setup_data_sgl(struct request *req,
 	iod->cmd.common.flags = NVME_CMD_SGL_METABUF;
 
 	if (entries == 1 || blk_rq_dma_map_coalesce(&iod->dma_state)) {
-		nvme_pci_sgl_set_data(&iod->cmd.common.dptr.sgl, iter);
+		nvme_pci_dma_iter_set_sgl(&iod->cmd.common.dptr.sgl, iter);
 		iod->total_len += iter->len;
 		return BLK_STS_OK;
 	}
@@ -1329,7 +1329,7 @@ static blk_status_t nvme_pci_setup_data_sgl(struct request *req,
 			iter->status = BLK_STS_IOERR;
 			break;
 		}
-		nvme_pci_sgl_set_data(&sg_list[mapped++], iter);
+		nvme_pci_dma_iter_set_sgl(&sg_list[mapped++], iter);
 		iod->total_len += iter->len;
 	} while (blk_rq_dma_map_iter_next(req, nvmeq->dev->dev, iter));
 
@@ -1492,13 +1492,13 @@ static blk_status_t nvme_pci_setup_meta_iter(struct request *req)
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

