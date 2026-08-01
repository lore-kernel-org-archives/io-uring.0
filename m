Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB39330E0DC
	for <io-uring@vger.kernel.org>; Sat,  1 Aug 2026 15:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785599320; cv=none; b=ZhF5+zW+JM86OGIxhRf7tIw07Bn/OgdBsw5yqqMj31N9Z5JEM0eA5s6Rs8a9Uiiu4pvMTM6O0/jjNENsS2iZMFOtw1P8M98YaHGV3LA6OZsIU2/SNLgZ14hTbJ3Cnn8Wavuw6o/cP3yawgAFbhTK1qvjNmbe6jorEAIiZBU8eaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785599320; c=relaxed/simple;
	bh=1jBAtnFGRJ/F8gXs/co1VF+epb8VpkeomtOw2fyD9ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bdoNMvHQcmNqu+3LqMrHwr1WpdbyB9+lpqXob033Mcj12zuQz7i4/gFm1gJujyKpaw0I8FiSIilWqL3aHp6cGaoDkdoGF0+uWC9GZwiayG54/ijxISuZ4YYhkfv0HkNu2LxIiLrbsmD5a1pikYKr1QTUWX9gA2t1KucAHK33na4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mfc1+mx3; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mfc1+mx3"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc61541f8cso32038945ad.0
        for <io-uring@vger.kernel.org>; Sat, 01 Aug 2026 08:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785599318; x=1786204118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fyuZF+rseQvIVevAALiITcY143h/8lAr4kofVhDXVW8=;
        b=Mfc1+mx3iaWZQWiA5QbqTZ5Zw+/2gz7kxceU2jPXHLFc7Q551+c6i9znSKBY40Mkzq
         nNqleKOAjLfLlqvNbSdbx8mSOGzT+mcVb9LdOvSnZDurqec52Ik42xRqu3/XDqdmM6iQ
         phiNHZDOOoTJNIGi/wJSHcNqv9HCobynIk3XdFlR+UzJK4EA2YqSHNu3UBwuHnb9dGe8
         pUZa4XywpGm7sKEwummT7fdZUxHFNHWyz49tJRuLiaKVi0UuvTQWzyX/TvZo0grubca6
         AiqWBvrzLV02UC8WX+M5waI5pApeOP3t7+NQnPkP3HY62bGqbKua4X02C9O8YktU+rZy
         Ft9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785599318; x=1786204118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fyuZF+rseQvIVevAALiITcY143h/8lAr4kofVhDXVW8=;
        b=RVFA6iTA9bTg4OxwhqBjdxEazC4WcWiTPatkAC8OonxRVpzF7h0exVSQ8HxBHtSp1Z
         4Lmp5oXyg2ZT73scZbElnVyJTjrN+emnmUdKAJ6kY0cuiGo6icWo4j2AdCTGCLBK1Umu
         lpvO7zS0Gh4ZFyv3POhfuVbvLwB8MDX1e3K6YmM95/JEnYrZ4HdM2RrPPm9uZSt9ybXS
         Y2w3fMjsUinTBl8LZnaFzOiGhzOGEev+7lHyNCV4sO2UET3iHsTGOk9M/GqHocXFrKt+
         gISv+rNKP8XQcKX4/dFataQT/gX5d6a9NWhqqYBOFecyRO3x02+s+M4rjDT5TpPviAto
         xXVw==
X-Forwarded-Encrypted: i=1; AHgh+RrZAkK/PGw+UUq+cdDuEp65PXKFkIUN34O1ci26Bo5tL4MTH3tVKhyg94AxlHqBORJno8fpGH3a5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxwSrO4xsaH7fBj2wgGJYN5WDmZatinNK501/ngXVxjj1S1CJm
	G49metF2xn42iLxJLf6m24CymEGpH3Dcm8NiLyuOCBKFnp3+s7i06W5B
X-Gm-Gg: AR+sD12aqa4Rogm6Hqn8f7RGsStesl5SvmLkO/syiMsH/pNtwffQdcZqvynDSQeMguo
	gazXFSQBrN+/8bECWs0l1L1L2Q+CbdIMJCAHYRbEfOundXJsxV+sdwWMarPV6qp7w71oxVxYKhJ
	b6EErC4qtvG9QeKeRobHeON7nt5nSBMH5C1rBUi7nodBq1cSfFjNau1c9+FqJqlFo/jUt6XX8xo
	qJtzMzkuCgvPffRBNaoTqnGz/qJMhHbYcrAiwxr7Q0390ABtJFLBxPzsM1sK5wg2NiI7lTIz4aE
	XOVClheInJLc+F+on/tzreJIuQ3HiWg5gKyl7Hf/Wvl2/9VjMLuh/69p2UGE5XIDa0htyWqsXuq
	76MSk6Ik3r7O8FiH5e5NXYx0XlqddHjW+U/NO0Il8Sbj7b+7SxuEXg3Ezl8p2G2JPwtsjA50tre
	hx41+m+8gFDBnNZKIz/4yAeEhfqYtUybVsRdFfDhD2xxykH+EXdhYH6/zvHTv5hZ91BK9mKDgB2
	ts520uMEA1qhUx0JC5rE8MUXx14EhwBWsowjdIZhf6A7Ms=
X-Received: by 2002:a17:903:2c0d:b0:2c7:f5c6:c4a6 with SMTP id d9443c01a7336-2d0535b3b1amr33657505ad.7.1785599318082;
        Sat, 01 Aug 2026 08:48:38 -0700 (PDT)
Received: from 127.net ([2620:10d:c092:600::1:61d0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b12202bsm18287605ad.66.2026.08.01.08.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 08:48:37 -0700 (PDT)
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
Subject: [PATCH v5 05/16] block: move bvec init into __bio_clone
Date: Sat,  1 Aug 2026 16:46:17 +0100
Message-ID: <6ecfe8f9b1c6bfb8665fba7daf55d9ad7a8a3243.1785596451.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1785596451.git.asml.silence@gmail.com>
References: <cover.1785596451.git.asml.silence@gmail.com>
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
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 block/bio.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index 4074a0496b93..00f99d03ac91 100644
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

