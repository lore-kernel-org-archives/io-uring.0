Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080604746D1
	for <io-uring@vger.kernel.org>; Tue, 28 Jul 2026 21:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785274196; cv=none; b=roz5iAY8pDkaFNdG/bNGFfKx+OgJj9cUALMHd6AJ/kzI+AO6rvyBlzgmi3jRO7pl73gZ5amNVoGz+0EQlS+TqLVT01q1FoUQeTFdPYfThUVDVv1pZk8pzuDVGQHSs4TDFiUr/wHYbUpkx7VUS9lZVW8e8kTRkbo/fCLK1+9G/Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785274196; c=relaxed/simple;
	bh=ouxAbpVq3eLeqOZuflcAiBfEtTkTCcnamxD+XK6c374=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=icNHYpvV6w+LgmhHq0lxqbpX9eVTzSKM0PLci/KwjdXHVVrRc1ocvrHSuGZ0JFBo7qwTdT5pcGc8pMihJMSnSVBxv5JWUTi/Llw/xsVANoDWwUlQgSVkZ3qdXCbh87Fc2uykgRNrHOTon54kFM3972bL1+jhKX5sZLXVgskHu9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=emRRA2uN; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="emRRA2uN"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f707e5d75so224925f8f.1
        for <io-uring@vger.kernel.org>; Tue, 28 Jul 2026 14:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785274192; x=1785878992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3L2paztWhQuVkOkPSkB4LVS1c8WWkooOhtLcip+4H4Q=;
        b=emRRA2uNIx1n+VOfDx7XHlbG5aN71gGWq52a6nhfhJkpVt6DqAkYWcsDUW2dlNoMNu
         St4ty5IIFlHTn148f335nU5cmpmsEGtwAX0Obefzk6631/bbtLEbtOKj4FBRZgtHMots
         o165Ly5ljIxpVbZAVExXGu/zOwTS6ZMt028vsGuQ7JUOo1V/wxg28ly4T281f+GUE9pq
         AkxOhE7kGVs0Ks+AiJ0wClTF2BiEsQ9DGX1D4hTMP57pOohJ/gWOgOinzwnOZ8A98+c7
         F8uEhrgjpmRnnUhEG+hjUNHFUMG67d/kH0ch2J7E0Wa29HL0CxgPPFmiOCPlKg/G8kXI
         //tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785274192; x=1785878992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3L2paztWhQuVkOkPSkB4LVS1c8WWkooOhtLcip+4H4Q=;
        b=GhmdeBRhknOILZ5B8vSnEt7+rV4q4AaqmBPYdERQILBUU54ZefkQhXYv5vsMYoaVIR
         4IkHnH2Di6xF+O/yfo7z8WJeIlRi5yLbsEJK1L0SQNopxZSYZ2lqKYHgStHbmuByGkNB
         jpiB95/QaiPgGdWjNyyBwaVWrzuQP7+nTyJYrNhcZB01499LVGJJvGh6mkUGavrCJn+x
         M4DBI4qySllep17QPRtJdIkZiz5yKTqexDCIci33E6xHk3slxFXV36nKhtPM3dGfr1uw
         UciaNleEsChV6z5vrEA3ucn/0btg4xnZAi1JO2TuMzxOuTtuQxqok0LttTvO2jyp6RSg
         7r3w==
X-Forwarded-Encrypted: i=1; AHgh+Rp3wybK6pdmTfT0yxcn3MI/KaTbU1G3AZbrCg8zowmiMT3/f+qj6Tj1XrryQxsUXPu26Bqu/I5kXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhTNvhmxpDGox2p4ZCCL2lARhaXB4tYRscVLZ5MA/fS3oRKpNV
	F5SKZYTSd5u4dODeNbqLOJCIhWCX5Jdr/wfbkSA6BJMdYNvpNqGQNpXq
X-Gm-Gg: AR+sD10qWzIRBcd6TTTiZZ2g8J47qFJU3rR2nwIRbraR3Uj8m+vZQAOJc8k8vUwv6Bg
	B7HP38qJHSfE0pFOy1V3TfW5wnk6F2lm+YgsHN+WfHbT9U9IsCjHFQdwm/VVj/JWrEp0/Fy/pXx
	O7KQM7Mz0TI4Xg6M3T6NyG+WoKPnpvghYrE1K3R0KMxGLrTefFVWhjvD8ksjmu42Mrn+FSCftQ9
	6QVVAyyYLeLWKQPA4WVEoqztJHfjAL+O6ygEyMuKvPsvQwTkBfqgm9PNLbeWwV1ap5dNhDG9O1h
	JlEs562Phz97DxAcGUCSwEDMZ82d+wGzdmhbry3y4cHV81fEShR2YUceEe1CClkjvr9DXQlOTid
	AegmMTUAp3Qs1sIAweYKxFopTJURmT63EypmzPEOBFgIeQtv7I420HOQp91aVgNviaIV36uXxtn
	wb0Ul99yZEisn3yUdV0WzMhvI6Iy3UT1VqTbSmZ2gu7wVZY6ctSLyzAU0fzz759j4MachjN0VCB
	94a5Bj1
X-Received: by 2002:a5d:5d06:0:b0:47f:947a:9dba with SMTP id ffacd0b85a97d-47fb1e5ce09mr5390953f8f.6.1785274191852;
        Tue, 28 Jul 2026 14:29:51 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6ac44bcsm2245329f8f.11.2026.07.28.14.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 14:29:50 -0700 (PDT)
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
Subject: [PATCH v4 05/14] block: move bvec init into __bio_clone
Date: Tue, 28 Jul 2026 22:29:17 +0100
Message-ID: <7423d294c6184c683d7b2ccddf060b4a308e0316.1785274111.git.asml.silence@gmail.com>
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

Consolidate bi_io_vec assignment for cloning in __bio_clone to keep any
further changes in one place.

Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 block/bio.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index bfaede30a54f..57c127aee116 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -860,6 +860,7 @@ static int __bio_clone(struct bio *bio, struct bio *bio_src, gfp_t gfp)
 	bio->bi_write_hint = bio_src->bi_write_hint;
 	bio->bi_write_stream = bio_src->bi_write_stream;
 	bio->bi_iter = bio_src->bi_iter;
+	bio->bi_io_vec = bio_src->bi_io_vec;
 
 	if (bio->bi_bdev) {
 		if (bio->bi_bdev == bio_src->bi_bdev &&
@@ -902,8 +903,6 @@ struct bio *bio_alloc_clone(struct block_device *bdev, struct bio *bio_src,
 		bio_put(bio);
 		return NULL;
 	}
-	bio->bi_io_vec = bio_src->bi_io_vec;
-
 	return bio;
 }
 EXPORT_SYMBOL(bio_alloc_clone);
@@ -923,7 +922,7 @@ int bio_init_clone(struct block_device *bdev, struct bio *bio,
 {
 	int ret;
 
-	bio_init(bio, bdev, bio_src->bi_io_vec, 0, bio_src->bi_opf);
+	bio_init(bio, bdev, NULL, 0, bio_src->bi_opf);
 	ret = __bio_clone(bio, bio_src, gfp);
 	if (ret)
 		bio_uninit(bio);
-- 
2.54.0

