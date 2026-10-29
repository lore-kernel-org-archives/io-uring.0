Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793289523;
	b=YI+Z6veTfg022xEM/+LFbOj3hJT7zDIHEguc7CwZft10/K1ddNvrHE9V4sfkHg78s7Gd
	 Lbk1ALhukM8iwW4ZwoWszQwCPh721Apu+Po3FsXRHE9r0ovsuuRnqx4QjCReCTy1d3GpZ
	 Fifap9EBnT1IaChtx83EERCFlV5YYZBu6rRTIcS297/CZIDGR+7tV6ZBADYj06GFgLD1b
	 jtUMMYXfZVyyvaWA4Io9E/+wRcJTtnJOeGnxW5+HrlUhEivp7jini5gNawY87+vDGr4Fj
	 Z8BNR/2AyWY5UzgYqVNLzYNQqbv/rBa38iLSOvQ42vwBYsjkZt+3f262nO/HcKx6dBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793289523;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JlvxwwNyQO6n19Y10XHId6qvmxHt/ChSrZalCBx9Qp8=;
	b=lndWZ3fGj4yVhvDclkCaG5SGyPpX9kGXOoF3kbcF+LDDLbh/mZ5mL/3gw6U01BMCMdnh
	 +8IutkBbHAHfs9rfVGJiyQxDScW8R8AMKEUA9+w4ZpMMek/MULzSnqOfXROCMK6csH+0W
	 F1MsOam6vucubjsPfjme0tqz5D9IivmJknkm/j87qbR05bLFeUjOh1GctyEELT5yV7vAj
	 CkZR2tOweSsI70oKyseP9/JuD+giIsUVUl/nmSLfMM2jFZecBxZ8KV1DG2Tm98bP2BJ8/
	 DmTIg04pspoYbKGFC4G4Ihu85jIhP7iPOCKp+9A2lHwZTJivgg7WNIHwJQvL8LKQbAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ao46Fng6;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="tS17m/zd";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3095606A31A
	for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 15:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3095606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ao46Fng6;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tS17m/zd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793289521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JlvxwwNyQO6n19Y10XHId6qvmxHt/ChSrZalCBx9Qp8=;
	b=Ao46Fng6BkuomxnvGyrwrH8JrZ1ywGD0m76xRr/ZdlYWpD3LPDG2xsrv8xrlZjbc0M8xz/
	l8pieS0aGSlf9BtpQ7uB8GTT1UMZk05Z3BjYa2flMAztgxE2rhZZlhgl7ybjQnRILkFXZT
	O6VzvurVIKWbk2rrT7bfN1IkEAa8EJ4=
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-kH5qE8BgOzye44loOFRibg-1; Thu, 29 Oct 2026 11:58:39 -0400
X-MC-Unique: kH5qE8BgOzye44loOFRibg-1
X-Mimecast-MFC-AGG-ID: kH5qE8BgOzye44loOFRibg_1793289518
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-359b81ad4e8so2983532eec.0
        for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 08:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793289518; x=1793894318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JlvxwwNyQO6n19Y10XHId6qvmxHt/ChSrZalCBx9Qp8=;
        b=tS17m/zd7hpZYlf+Myz7mmsRtsxJHHYG71/hoJ+U0TiMItLRiusnTPjlEqeGik8qF8
         wMYDxWU5Yz+QhLjTrqrWxdvWUNwHjFl3Uh2Kz1QWU2hGV0iOpHbAwPULEkd2LYcQWGxb
         b+jJavr5dh4Ly5732jfg6Nso5JBDamjUSob3xULb3ThPJL5ufOwqDexhfsTCOzqnPziH
         XpqipHbNomfcq9OxtcY0SEM91UughpP0pwJ4zkmMcmHYxdChEqnqpmdiWkcfBQ/l+JXB
         AA/+Aizx4jVlK4WwPRcoVoEJheXlWEVQ3tqZvpxibwjqw/TLKFiXbV53VlJGph9LJdnP
         EpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793289518; x=1793894318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JlvxwwNyQO6n19Y10XHId6qvmxHt/ChSrZalCBx9Qp8=;
        b=BCmbS2VHzFini3OotPo1sxGpRWw4qMB3BhVR29+quRdXlqO+wYA/XE/hAK33jVBgkC
         EBidcB+jPCHcpMq8v89G4oj0ZTlbpfOdTQbAczynFlR6Hl84YKqrCELyXg4llVgI7wOe
         SvnIKO5NrqtxqNGxnqoBHkybokz6lVzeT7Jr9b8y9qx/pn9WZdIloPpqtIyiknJUJ15A
         RS4uJLMUOnH9TfohRC/40SVngaWsjovnU+BOsykep2mjfxHNJRFlMnO8k8+RF9LYSx5/
         Ugbne+ejzr8U7/nXzNyAt2kmi0+dSbqBn5KkmOv9ukYFu8QoVUZqRYKltsUBsSNeXciQ
         YSIA==
X-Forwarded-Encrypted: i=1; AKwUvBzzAVOn0QMYMmUNnJHib9WH2NcFuDqpNkDcD50cCDMP3zZKaKKPm7ECwU/q7qXhUjFIjaW9zUPTPw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJOayrZ9J6brv7xz2pu6T8W+M8zHSJgDQzmOGmD8AZRXN+spDGy
	f3DP3ZTJ8X8di/F/ZzZaSaTBEGSMCqrZTkyeW92ItULMaNirfN/KouKKNbCdILPGnOVwVVkVwdb
	0jGfQIqH2t0ry/ul+E7fS5OZAfs0TsKeFhd9G/eoLTIY+VD9sjpt693tjZ36Y
X-Gm-Gg: AYBFou1mq5PAMRj6nhL4x44GDRHEnb9Vp99C1o6DN6yLgdpvMpXOiZTpNBnLQmLx1Xp
	gJl1nV5vWNZvxGFDk3dlZy5jx6LPRcr/Ut7MYlTzd3jKQ/3sDiFlH5fkjt93Jsa/wT8IiJXFKkg
	zkePCVg4jp+W+woAZKNGY0kjWdnxM1WMD6ABWI2LyBsWpaZG685CXi07cgFjEsXwFhyTIhT89jM
	CACnkdpoy+90CGSzundPOumHRkZwkb12Md8LB23LxDQaRPhwOCP1WwOWQ0fXHsP2OrYAAqxyQWU
	DDdlbZXC8HZHXdHBWNYz7g3AicFb6kmVmHijAPjbXXGDiJA5xHphFCFC4zzBdbPMMmoeuhxq490
	8onimRZ1QtHGL9IFzpiodxdkVRq1vulpK3KyA
X-Received: by 2002:a05:7022:ed06:b0:182:9071:3249 with SMTP id a92af1059eb24-1a6ced8ec45mr7441632c88.30.1793289518143;
        Thu, 29 Oct 2026 08:58:38 -0700 (PDT)
X-Received: by 2002:a05:7022:ed06:b0:182:9071:3249 with SMTP id a92af1059eb24-1a6ced8ec45mr7441587c88.30.1793289517483;
        Thu, 29 Oct 2026 08:58:37 -0700 (PDT)
Received: from alpha ([76.166.245.42])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1abea527afesm23753c88.15.2026.10.29.08.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:58:36 -0700 (PDT)
From: Kyle Bader <kbader@redhat.com>
To: Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>
Cc: Kyle Bader <kbader@ibm.com>,
	Anuj Gupta <anuj20.g@samsung.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Tushar Gohad <tushar.gohad@intel.com>,
	linux-block@vger.kernel.org,
	io-uring@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] block: only fail dma-buf bios that need block layer PI
Date: Thu, 29 Oct 2026 15:58:21 +0000
Message-ID: <20261029155821.2983229-1-kbader@redhat.com>
X-Mailer: git-send-email 2.56.0
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

From: Kyle Bader <kbader@ibm.com>

All dma-buf (P2P) I/O to a device with integrity data is rejected
today, at registration and in blk_mq_submit_bio(). Only a bio for which
the block layer generates or verifies PI needs that. The block layer
then walks the bio_vecs, and a dma-buf bio has none.

Reject only those bios, and remove the check at registration. Then a
submitter that attaches its own PI, for example with
IORING_RW_ATTR_FLAG_PI, can do dma-buf I/O to such a device.

Link: https://lore.kernel.org/all/bbb87d6b-b7a3-487a-8be4-27f3f9ce4a1b@samsung.com/
Assisted-by: LLM
Reviewed-by: Anuj Gupta <anuj20.g@samsung.com>
Signed-off-by: Kyle Bader <kbader@ibm.com>
---
v2: a shorter commit message (Christoph), and Anuj's Reviewed-by. The
code is the same as in v1, so the tests of v1 still apply.

v1: https://lore.kernel.org/all/20261028181412.1919506-1-kbader@redhat.com/

 block/blk-mq.c | 9 ++++++++-
 block/fops.c   | 2 --
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 7fff1305b..3fc9fdeb3 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -3138,8 +3138,15 @@ void blk_mq_submit_bio(struct bio *bio)
 		goto queue_exit;
 	}
 
+	/*
+	 * The block layer cannot generate or verify PI for a dma-buf bio, as
+	 * that walks the data pages.  Only fail the bio if it needs that, not
+	 * if the submitter attached its own integrity payload or if PI
+	 * generation or verification is turned off for the device.
+	 */
 	if (unlikely(op_is_dmabuf(bio->bi_opf) &&
-		     bdev_has_integrity_csum(bio->bi_bdev))) {
+		     bdev_has_integrity_csum(bio->bi_bdev) &&
+		     (bio_integrity_action(bio) & BI_ACT_CHECK))) {
 		bio_endio_status(bio, BLK_STS_NOTSUPP);
 		goto queue_exit;
 	}
diff --git a/block/fops.c b/block/fops.c
index 01bc8afe3..5c8024011 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -947,8 +947,6 @@ static int blkdev_init_dma_buf_io_ctx(struct file *file,
 		return -EINVAL;
 	if (!disk->fops->init_dma_buf_io_ctx)
 		return -EOPNOTSUPP;
-	if (bdev_has_integrity_csum(bdev))
-		return -EOPNOTSUPP;
 	return disk->fops->init_dma_buf_io_ctx(bdev, ctx);
 }
 

base-commit: 45b716456dd99488a0cef58482120dc0474aa696
-- 
2.56.0

