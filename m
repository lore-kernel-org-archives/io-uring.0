Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793324778;
	b=FH4lncbKpnzWF1AeLAphVzsAAtUulGmKJBERGcC2Mg9pnDkhiaXWeuaoKqedMZnhgNPM
	 6M34UkF7ym/SYgNG3IzD5zpAsFEpv3JzZTn0MV6kXBUX2Aym7tyYCZB0Ic0U5SsGDrp9a
	 yqrPM4iffMuSGssoKAIObVfWfpz/GsPZQ99GOam+QCVX2OikIb9O/hMPRLu9lTV2tC0oH
	 WWq9Yl4dTUd+Jbfzj+s91sIrkiXnIBIeZsrHhxELXxJilxnkNBTS1JBQvM4qIaBIaAEMb
	 phK4QtzJZ0jrmByV//MEPbCYjPGRwdt+sVU892C2fcOlxciPoDopgwwBqsMPlkxtRJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793324778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KBjoHjefEpt6gXeu0uBAO7mx6fOzElk1Inu+2ky7I1c=;
	b=2qkivU8/ufdOy0mzsirTPd7VL3yKlrdhJQU+2xOjbh88P8TGBLPBJidqg1cUTF0gB85/
	 5fcnya6p5g4UCET2CQAtgAeZVHy3j5MOe5DhRG7Pd3Mj0xZJCTMe7JmaB/Fg/q0Fvxqhw
	 U0uQMKjNF68nRovZggMXM/9P2Brgq4f40h/MIYrHVJkOQ/EqG2rRWtXdEbvUK5wWPm0JG
	 GTk9shKiyusakkqAq76vPICR+aCwL/ige/R68HcQ/a4KKx+9LV7CtsEwOck+9B8ZH29sl
	 Y4negXHevPUyQCnJkucDEOOZmH0EVft7LHyV9PKq8ZMuBuJF2cOA6eVP9bEgQR1zTxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QMZuKhWs;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE705606A31E
	for <io-uring@vger.kernel.org>; Fri, 30 Oct 2026 01:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE705606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QMZuKhWs
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso554614eec.0
        for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 18:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793324777; x=1793929577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBjoHjefEpt6gXeu0uBAO7mx6fOzElk1Inu+2ky7I1c=;
        b=QMZuKhWsa2erUSLf/IY0zFqF2nVXuVqGGow6hvJMlomv9revsAHZYtIipxTsntNl4t
         FQ7slvlyN4kPaRu/yminnBrxoZrysIIsJ6hGIY30J2/8Xbb44S3Ama35r1FCk/14kvLT
         JgtZgKfYW9MheOcj7q9UT5HlPOOWkaLnE5LvDN1lqddtxp74P9bzIk6XnRWxw/RRotau
         CjIsHFxy0GmMzeiHLRePiEBnnNa+IWyO3lPMGziXTaOWZ009vGpGbxKpLu2GRqT7ZMMd
         RhfBQ26czyEpfpIphKYWgg9cDNdHTpQoZLHZ+LFl88pj1WD4gZksSTTyojdHYii1csQQ
         20OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793324777; x=1793929577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KBjoHjefEpt6gXeu0uBAO7mx6fOzElk1Inu+2ky7I1c=;
        b=lUcyVtCDEfZisIDxwwdyYFImEdfgDZMHBNLxE6czD6loMuLgTS4hKCD7e0hSQXCLR/
         cNzAyCla0p84zEqJCrPS0aPSxEwEB8eJkAb29g7oYjZe6bHXsVTJHykcdoUFFBlnO8+p
         UtucUIh0xBXTU/OnSVrjhKIhlAvn0MqeChhlEh+VMkmgFjVuZpnmwKtTY+NrTL+KYL44
         J0WRvZoSd/hhfP3Hd3/JkYjZhZFgKpCflzuX5N5BKsDZxQ8pm3bFxwx36zXHN1SHMWQ+
         hYA1D+YxCX2RkGc3nbthy6jkgIeMTL1NHyxsqmzDT04w9Vuyli8DdfzKcPRR0/m8wr9/
         ArNQ==
X-Gm-Message-State: AFq9FYIGP6f4ye77gGWesxpQ/3Jale193DYvbX965xZU8ZfamLM3FTLk
	zV9pjqxETes2dsBNeJptC1xfpCVSUytEQgcQ8kUUXqm5WuawSDdcIK8=
X-Gm-Gg: AYBFou0S43xbTOPfAbZUKk8k2gnhoMPXqHZCBNiZJe5kKX3UXkWKPu23f6lWbweBx93
	X4+iuKl6797gRwzvQGFCiEuUX7CYtSTpsP8SLkXsspIaVdBaW4Bml3pF37SXHpuzdw0zfoJz+vu
	depAD4K6tMUzQElecaLW319hbr/bqvydqSnb9jknOfNfUdMiYWpuAMnVVi8W4s0eYeQX1OYhy90
	LGJQmQS8waMTVJwz/OLBKTA2BhzPQ/bEpUL6qROrlI5QhKaYY5uVQ9TKl3vve90auaZnUY8jjQM
	xtw3M2fi3u4LraYov5lXwTKfQ+pV0vwhLjfof26Xew9CegzowGUSpCsJJZQabfJaKJZZ9kOTiBi
	/fBXXPHd70cOz+k5n3d8cdzFEp5cRc4UsLq0VPx9SJqtEAcGQdk16LtxMrHHHMZquTfiMcouJGk
	XypHLFvzRSJrGCkadPBObIDW/qXvfgeT4aXwNqcclD5/okbNmaU4n9bIMB79RUe3sxQ9BMeka1C
	lTrsmgT8mAr7KoktrEmDtcRwJJH/2A+zAXtqlocAJluCSAkLUbB8SmCDSw1K2IbU8XoCGARURaG
	Lh+xF0BC6ZjpIXrF/5XySF5vcpnqR4Db4NgvqyzLINIGiEAukST8oKBVFaJOk8ltmK3lSwvy+3Z
	Z62xc6VRQwBfjgO9C
X-Received: by 2002:a05:693c:20d3:10b0:369:fa21:ba0b with SMTP id 5a478bee46e88-36a42451227mr1548074eec.33.1793324776753;
        Thu, 29 Oct 2026 18:46:16 -0700 (PDT)
Received: from anuj-MacBookPro.. ([2406:7400:63:75fd:f9a4:4062:7980:1324])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm2209020eec.12.2026.10.29.18.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:46:16 -0700 (PDT)
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
Subject: [PATCH v3 4/5] block: map dma-buf iterators in blk_rq_map_user_iov()
Date: Fri, 30 Oct 2026 07:15:39 +0530
Message-ID: <20261030014540.3065403-5-anuj1072538@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030014540.3065403-1-anuj1072538@gmail.com>
References: <20261030014540.3065403-1-anuj1072538@gmail.com>
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
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-map.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/block/blk-map.c b/block/blk-map.c
index 7369aba74771..a65b255b229c 100644
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

