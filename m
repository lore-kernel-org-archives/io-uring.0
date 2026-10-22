Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680369;
	b=nPJKGRET+CV+kroAPaJX58E+2dHQzwBiQYlShfZWL5vcahd1nInozSzBxMbsMG8zEtG2
	 sH2NIeAhLHvPkKeufJKsrJ71EPdMY90zPk8sLiITmq2ORDCrJ9Q3uJy+bKgmjgrmSExMd
	 zg68rYw4SnZN3V5IF9/+740yi/+q2wrn+pTouPIBYrlmyreaHl0kHdLfhg29U5IH0pFH3
	 CYxnbAfgiAqLUvZngVUEnPacQ2+RZ58h8sT3Qr9XrT+/WQZUBYW0/7/79Xi3r71E/z+/a
	 Nimxdttf8dwY+OcGpKWhIKX55i1qUsuFGqOdZ+foco8rxK+13T5Xbe8TBeJhYhkyyxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PrklBKkcVwO3V8O9sw0CVF0qG6S9AFzj2KttEqdFQnA=;
	b=IqD7GoMeArmUyyEsUQ2yyjqdyHKtK/v6GeKwV3EuxUb/xNWK+L7IpQs54rhZnnAuRagh
	 9L0l9QGkyluqk+D13DMthRpC0OiAGroMVFHVC3nErXyMIJrX96WWPqrcEz3sRjmJT0Zoa
	 YiAdguyp4Rkgu1rnRIZi9W7CCsRzkhfXNPG0UUxX31cOzhuDrKhlAg1FYSA5+2E/Z0Yzl
	 N1KCo6YZiijA0/XKForbtCwn8qicCOgk731UWh+ctgvjvteZirGfV9gRqfwjgA3ZsLya7
	 Y1AYha3yWbSIfx3chMWA/vUkM2TdFmvsKZDnzbKBX0yZK6qyt+L2nhSLcCTTg/iYdhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IBNXlLqR;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81319606A319
	for <io-uring@vger.kernel.org>; Thu, 22 Oct 2026 14:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81319606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IBNXlLqR
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-157fe9d771bso2499333c88.0
        for <io-uring@vger.kernel.org>; Thu, 22 Oct 2026 07:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680369; x=1793285169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrklBKkcVwO3V8O9sw0CVF0qG6S9AFzj2KttEqdFQnA=;
        b=IBNXlLqRHyQGCpmfqrAk1ZBu2PX1oPbKF1Bzom9GXmhEu8LizS/ke1Fvza7ZyQfshg
         QJfTtjwJbSJisBpGdbuCV6LR3sIULH/hhUEfl13j/0rDedXrLHtF48OC0dRRoG2j+K+Q
         ybkLcWhu9uHq5h4b1MyTK4m0g7V6XM4zv1/UjXnaC4KWAh8xZiIPQduDV/7gfJe0Fzg0
         oaWWwrioxkk5QqRpIwqyfO8xzv47hgaYrgoHaNZbwvEOHEoy7nQMOc12C4mOIuuBu1f3
         3SbnjV39pX/g9v6ptoltyPbXYq1fdsMg6l0b7AYcOBHEbfA3oq58WUIh4Ilh2iG0UV9Q
         aDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680369; x=1793285169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PrklBKkcVwO3V8O9sw0CVF0qG6S9AFzj2KttEqdFQnA=;
        b=YdLfnu0qxok/d67v9Ya7P9mTyeBIYj/kodZtQ1EGsD4/g9nMPlcDcDLYnQcNxLxZzS
         GAE8LPoaVMMcOzrgUzq1ZuNYRq8MYwjY0kA3Wj79XHxirPCjeMMpm7Z6wY5hDqOFudS3
         6yEtD/jUrk5NSfHES4IogP6sypbf0JXAMKKR9T+4O2IUQN15PLu4+WKAmiaMj0UoFkwQ
         YFnmkKSXXbUGzNFJZny6FDZGX8WY4eOKbgO+LF2veyi8p3AiaIdHfgx+1wmogiHCeUYF
         BvKmuDhjmVhqBfaz59dv64khJrkA43tEf67ntyYTUuTUxKN0UzqRxX7FzIOhNhbHXhkP
         M8hQ==
X-Gm-Message-State: AFq9FYKWnfeZWpA8cGsAmlo7Qlyh6D/ISECVPY3eyk8cWcJA7aHuBBCl
	ZuHUHFSaqviGoSw5i//7Y9hr0Q7ayN46pzilgXjHG87JIa0kNpncRGM=
X-Gm-Gg: AYBFou1z2/+DcvGTQSdA3jpB/5xoSx9gE46kT2vaDGho97zMxYVdMcMxmYlREZCHe04
	VGxulwB9c8tDIMYEaKDC1stJ894TVsCBt0YSPTsheasu5m7/nwNvz52GZ+4MuLsFpsrOPYcZZBT
	EgQGYs1R/33XEbBhM6DYOtW+t/3w8qUu2jow6i5etAWcbehtRWqhCazoZJu/5Dsmag+tntWoFol
	qwPelMNmahFnCXZ0/GbnGp7lS7b4IqO9nD8qT5AvDaNQoiYJCozVzjkpfNLNuUZ6Eb4gVAlOv/P
	nIbK+Ku3kVpg2xGMQx+OdH5KO6hz7BvlPqDeoC4wWLNbe3a8rDImv+0RihTe5CQ23AbWlRLT+xl
	iWM/OqmZ0Yv1m3OIYXhIXcFB9FdZHYEXpEdDtpQ4+otzZtEeIDW1napVHoQ49K1UlEqKpdSVL4F
	GXw7ASM9/fSs1VdFaoIQL5OLMYLHYzY2ma+AjDFRu6JM24EDJWI0NAHIAkYG5HceA5hTHTZCVsj
	bGVsdc0ncxPa8r30BBIU29SOEwW5K2jwPBRiX2kBjFIKLUt7bXoht2T+gJCWs2LCU1OqR28lMrs
	/gM1wC82tfgmz1M3L6YvfLNT0Btf3BO+/0nnT+9AZIA=
X-Received: by 2002:a05:701b:270c:b0:190:d9bb:281f with SMTP id a92af1059eb24-190d9bb28b2mr6570477c88.18.1792680368388;
        Thu, 22 Oct 2026 07:46:08 -0700 (PDT)
Received: from anuj-MacBookPro.. ([2406:7400:63:e55a:5016:92c7:7a35:f3ff])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a275026sm23625880c88.5.2026.10.22.07.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:46:07 -0700 (PDT)
From: Anuj Gupta <anuj1072538@gmail.com>
To: axboe@kernel.dk,
	asml.silence@gmail.com,
	kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	bernd@bsbernd.com,
	joannelkoong@gmail.com,
	miklos@szeredi.hu
Cc: io-uring@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	joshi.k@samsung.com,
	anuj20.g@samsung.com
Subject: [PATCH v2 4/5] block: map dma-buf iterators in blk_rq_map_user_iov()
Date: Thu, 22 Oct 2026 20:14:55 +0530
Message-ID: <20261022144501.2478417-5-anuj1072538@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022144501.2478417-1-anuj1072538@gmail.com>
References: <20261022144501.2478417-1-anuj1072538@gmail.com>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anuj Gupta <anuj20.g@samsung.com>

A dma-buf iterator can't fall back to a bounce copy, so map it directly
with blk_rq_map_user_bvec(), which already handles it through
bio_iov_iter_set(). Fail with -EINVAL where a copy would otherwise be
needed, and update the blk_rq_map_user_bvec() comment to match.

Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 block/blk-map.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/block/blk-map.c b/block/blk-map.c
index 9cb9605d1f62..d1e096fdb03d 100644
--- a/block/blk-map.c
+++ b/block/blk-map.c
@@ -459,7 +459,7 @@ int blk_rq_append_bio(struct request *rq, struct bio *bio)
 }
 EXPORT_SYMBOL(blk_rq_append_bio);
 
-/* Prepare bio for passthrough IO given ITER_BVEC iter */
+/* Prepare a bio for passthrough I/O from a directly mapped iterator. */
 static int blk_rq_map_user_bvec(struct request *rq, const struct iov_iter *iter)
 {
 	unsigned int max_bytes = rq->q->limits.max_hw_sectors << SECTOR_SHIFT;
@@ -506,6 +506,19 @@ int blk_rq_map_user_iov(struct request_queue *q, struct request *rq,
 	struct iov_iter i;
 	int ret = -EINVAL;
 
+	if (iov_iter_is_dmabuf_map(iter)) {
+		if (map_data || (iov_iter_alignment(iter) & align))
+			return -EINVAL;
+		ret = blk_rq_map_user_bvec(rq, iter);
+		/*
+		 * -EREMOTEIO asks the caller to fall back to a bounce copy,
+		 * which a dma-buf can't do.
+		 */
+		if (ret == -EREMOTEIO)
+			ret = -EINVAL;
+		return ret;
+	}
+
 	if (map_data)
 		copy = true;
 	else if (iov_iter_alignment(iter) & align)
-- 
2.43.0

