Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED65327C13
	for <io-uring@vger.kernel.org>; Wed,  7 Oct 2026 01:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791336742; cv=none; b=t2b5TBTIpTm0sIbIutYF8JTRJI4f/LUVp0lsCUdMkHMVAqUcPkwzo9D8WVMdSQqFrD0tg/nmetx7CELNzwSGIYkYSCPsEEKbBrjWFhnTr2rnN2rFSBRD71q3O8sCE0h49sjr9j6l9IyY1LhPjnic0iX7yfy2VnFN32xdDFTcjPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791336742; c=relaxed/simple;
	bh=0a99AkCdYYlGDSLNyvcoHvxyA0h7cLM0HZDY04APdmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Imvp4mveXNv0+L2r1Uw8/Pjj5mhnpXiFBoLyfN2oEgkgkVOJV4X9TWcwOnADj390PZvbhHwpTByFT05DaOKSfShTN7snkIF8fxgiI49aop0hWrrFFHU7u3wOyFvxtG0zpLgB44T9CZc+Fow7CvVkgw9CjR+NKuhqUav9mJEJgNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMs03But; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMs03But"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so21776985e9.3
        for <io-uring@vger.kernel.org>; Tue, 06 Oct 2026 18:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791336739; x=1791941539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SVgIYOF9sl5M4BcUqDAxFWbO5yiW+j2eX94ter+J4Q4=;
        b=VMs03ButU2FboeHQTkYyBdrXeOt3kgH7bdXRtDeQz5jQg54g8D79SDzAAJ9Pie2uwF
         gntESDeoh4eVkjHZj4EaepqZPylrkxjGPgxLb1veTZ/GcwKoYczRL7bMVOR89K6X8pVD
         1WH3DxSoY5rdyeNyUr0u3a848b94qm2iquxXWxvpDAckRHgNRitowm8JloXI1zCUsjtn
         QntTIjIs8LCpUfwdh530xZxLHvshGJz5+u3K9DMpxM8ipxHmScPYAnedejv3N0Uqn0bV
         HY+Dn49AK+xx1Xlg+bGXJuEtJhz5fqBC3oEOJbTlebhbnm6LQA8hm91tDd+moAGt06d8
         RjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791336739; x=1791941539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SVgIYOF9sl5M4BcUqDAxFWbO5yiW+j2eX94ter+J4Q4=;
        b=2GuPKhlA8JY/GzzhAcfxUeuiz8evw1WwZmVHV1Pmx/q+x0J4waJAIpQfkChWb0TA7z
         eOWJkpOUKw1xrFsLLA94/1TSA8wTdY5zV0OsW/aBYiZyQ+FrLKJuAdgc3tPqrEAmQMLK
         1VAge8N7wz8Vh5CvESMkUNAmH8l7a3EQ+3sJpLleORaKuyB4qYGwb9bj6CZCb+XgEM2D
         8RdPY11Q0pJpdpe0NhUGtKCki3twdi4xNpBPwWbDGSJhqaBSnhq3kTTEi9jT8y4VxQZH
         hpQnUR6kBRqPaz/CtOcwFXWGF9+IzrL0ZlSGyPGWtU1aMZJfgrAn1T0HVL0l4u1Fvp7X
         MJ6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzpBllplKXApKgOlRz2Pr0oj+NYsMOwmP+Xa7QPXe5wzA4U9ZMRt8+KOUL/81hSq0/9Mes84A2aIQ==@vger.kernel.org
X-Gm-Message-State: AFuF++k87JxsHMIPistrqQXy/QlSJuyXBCIpyACOahTmvbrxkEjEiuAj
	3p3P2DSPeM9q5hiWb6K3t/VH9Up/DKTqv+tip1N5ogzq/N/7nBSXQGpA
X-Gm-Gg: AYBFou1lIX241FSE4w/oXHCbf+Rt9cfM82JNgeEoM0hv8AIsLGmHuSq+7EB3WGybOKm
	gLmuCkkaNJNVqADfiH3rTeGlCORJ9GvLkUgchpO8C0FqqSDyJMKmyXLCoKaC9MGjarxgzweYQxn
	LfooiYKSxQVxxn5WKR5qKum053LoMxxysqxGT3rZJtYnRSU3AxPQi2f0nA9eFEemcUoePOPsEF1
	HYhLexsDDSaHXRv1Xf5R7MIHdRMPGpJCv24FpcrXZghyxoDXdMmJq016Hxz5+I4/d1LZc4w21xk
	flKsvYRx9Vji/mvvgH7MJ5uA/yLpBfDmvvsEuPqJMibn3zcVhdc+uQzkRXxTGA8mLpPb1xU1HYM
	hpcjt5H+2SbNlvQpAZzg/KGJJmhOvTNkvjDAJyoevyvZFIBGXARzYePQHKA++2ULNLTKfyNKnek
	MFUKuJQN3KnftJx1yTxmB5/HovUHIzKitLH3D9qpZg3/1+KHbVFh6FSix3Cu+NEuTdnqwzc5p5R
	CS9VQpiTtqlt/WxfyFKFtt14ghnPuOdM1GRx2bFyF60ch7lBR0z1v8O79UrNPCivUEqbgM5i6CA
	XLvmX0YLtLA=
X-Received: by 2002:a05:600c:3f0c:b0:4a0:251c:fa72 with SMTP id 5b1f17b1804b1-4a1803038damr7433835e9.11.1791336738926;
        Tue, 06 Oct 2026 18:32:18 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f6538b7sm21183615e9.13.2026.10.06.18.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 18:32:18 -0700 (PDT)
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
Subject: [PATCH v8 04/13] nvme-pci: rename nvme_pci_sgl_set_data to nvme_pci_dma_iter_set_sgl
Date: Wed,  7 Oct 2026 02:31:47 +0100
Message-ID: <2f8b57f68fd3e432085b3a7767971778bc7d1919.1791336002.git.asml.silence@gmail.com>
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
index 77317e5d00f9..a65b77726e4b 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -1147,7 +1147,7 @@ static blk_status_t nvme_pci_setup_data_prp(struct request *req,
 	return BLK_STS_IOERR;
 }
 
-static void nvme_pci_sgl_set_data(struct nvme_sgl_desc *sge,
+static void nvme_pci_dma_iter_set_sgl(struct nvme_sgl_desc *sge,
 		struct blk_dma_iter *iter)
 {
 	sge->addr = cpu_to_le64(iter->addr);
@@ -1177,7 +1177,7 @@ static blk_status_t nvme_pci_setup_data_sgl(struct request *req,
 	iod->cmd.common.flags = NVME_CMD_SGL_METABUF;
 
 	if (entries == 1 || blk_rq_dma_map_coalesce(&iod->dma_state)) {
-		nvme_pci_sgl_set_data(&iod->cmd.common.dptr.sgl, iter);
+		nvme_pci_dma_iter_set_sgl(&iod->cmd.common.dptr.sgl, iter);
 		iod->total_len += iter->len;
 		return BLK_STS_OK;
 	}
@@ -1199,7 +1199,7 @@ static blk_status_t nvme_pci_setup_data_sgl(struct request *req,
 			iter->status = BLK_STS_IOERR;
 			break;
 		}
-		nvme_pci_sgl_set_data(&sg_list[mapped++], iter);
+		nvme_pci_dma_iter_set_sgl(&sg_list[mapped++], iter);
 		iod->total_len += iter->len;
 	} while (blk_rq_dma_map_iter_next(req, nvmeq->dev->dev, iter));
 
@@ -1359,13 +1359,13 @@ static blk_status_t nvme_pci_setup_meta_iter(struct request *req)
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

