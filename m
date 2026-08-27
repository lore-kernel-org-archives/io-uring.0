Received: from mail-vk1-f226.google.com (mail-vk1-f226.google.com [209.85.221.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB92401484
	for <io-uring@vger.kernel.org>; Thu, 27 Aug 2026 18:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787857071; cv=none; b=SzSOLgaugTotX+BCivD9haNN/VQXucpq2GqYLmtMU/bZpYxXBB92VsCJMxyC1hr6EMmSL4jm+bJtP8M4HFV0x9hngVGEsVDG7m0RInbrpWrZCfyz7wCtlcxTDBSJYF8EnaYm9DhntltAcG+rUEzR1rklF3DzOpXDTOhC2cZ71Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787857071; c=relaxed/simple;
	bh=LC382L91Fjmkvg3DzrJyfTe6xYWA++BUDclrQpsPZnA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rqA2/x/jfAcCUUtd2AeJSPaqhRiHBa3uwk20m3BkrCvxxq1b2VT2vBAP0Yv8UrzgxhTqdExtdfbvdJ4PZz/DJwHat6EcrxdAhqnUa4OQ4FkgJ4TKJMyq63QWZv3bpvegE4IbC2yCJZC6TMBDmN6aDH6v8NxTxzVk4U2jM6URBEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=aosQXsxG; arc=none smtp.client-ip=209.85.221.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="aosQXsxG"
Received: by mail-vk1-f226.google.com with SMTP id 71dfb90a1353d-5c63c4af822so12338e0c.1
        for <io-uring@vger.kernel.org>; Thu, 27 Aug 2026 11:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1787857051; x=1788461851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i10FjmX67zefyeXKozkB0Kmfyho0gXqWl4rPPjjJZ9s=;
        b=aosQXsxGzXAlVch2OV7h96Ps25/3SQ5OcOfmOjiAnoQPNuimPx4xO+VqRcS7UjhTCv
         yp6oKwGtfw+Kp8COsFuceOxA1VNLj0YqS+zVDRX/J5SlNGkUezoPgoqV0imVXUwS6lmp
         Zk3AiSipFgKtCkTCzF8NszkcjOwJlY5SMcbmjQ/sWxCLdBzjXb+ZqMxHj9PCoa/sA0v9
         syQLejkZj2JoUKRtYkczz9dnbSdeb8UqCrSI9xm4TXWs0uBPOO/80ctDd1h/EtUm372q
         A5KD7XSHQRmQLSPp1d+O6jSmgLU6dNmAFO9V6gEARJ4/YVUkqMusr4yW/sIQiulkX1YI
         ih8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787857051; x=1788461851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i10FjmX67zefyeXKozkB0Kmfyho0gXqWl4rPPjjJZ9s=;
        b=iJRFNsVFt5b9rVEiBuLTNAvv4fxR4t63Nq4j9pJteh8TsHKg3hEio7jOdL3vBUUybt
         PffkT7KcVsgznLZAlxaCV0MSCwMpSoO9XixTl4cZoSOBApkqQY8OrDZ2QpVmWswHs00D
         EuTpYtToOXQy65V7XBjCvBw6gfcyHenwZQdmIwtD1k53nV50CWq4Q13PxOK/GDOLUJjS
         nuC0suDcGSeZUnMn/bzpPO5SAs1IS5Cay1oReODNiFkoQRc8oPj1yGgFBpvssSQchcCb
         nzSnBwXFfz9wxWoWnFZTQVoxuRIDoJHHvwsnq8kMpVpNj1q+sdiP6STencARTnV5bxL1
         zacg==
X-Forwarded-Encrypted: i=1; AHgh+RoLjYJcxMrrvlB1l8NjJe7zYPF4p7NFEEfuz8ALtmD9WwSIbdKz3/RRBJRlycAJSYWXgGIsmnDMhA==@vger.kernel.org
X-Gm-Message-State: AFuF++m0NTXOU03O2mutxc5W35oWGYpwgjXfoSyOL3Q7HtyBBqm5uH20
	hX3VnQqiX+MaHCXqHRhV3FaEE0mj7vQrDXbvehuUPHGy1hh1WfTrgvuH93r1iLl3EkkzeNGoCpY
	LlOznKFARm8ozK/+Lt2QOsk4RAORDUbiA/2XkEseL+bUHP+AC6GG8
X-Gm-Gg: AR+sD11n3smRfKDePg8jWW74UVHWpkxqAsw3bklaHNGdx9d1JPYFub1b3fvGr1QdpmI
	zc3KGTTwdplD30qs850Cc4nfxE0hVJZh9NZZItSda5X02K7y/yMeYZi7m9pgvtzHkMcoVvDVt+i
	wPR9el0XnxkRW2tJsAjz5HBaBPNENQ2y6Dt2tF9WLskPHpUYZ1uoNuw4S3aZ01lwdKY2gTYFudN
	RhJUZ7DXHm1f4WMSECMb/Zis8JmYv6uH9ho6er0xmJlOd/fuDacmXcW1OsjF6pjwjsWH5aAlWCq
	uN8CzXm1g85N4PbOKQsNG58iy4DwspciNbv8VThammVc2pJE4SNRyY5r6mJJUWxvwZHCFmBhe6w
	n4bq4I/gShoN4SK6S
X-Received: by 2002:a05:6123:593:20b0:5c3:a1f5:7569 with SMTP id 71dfb90a1353d-5c680feb0f7mr218849e0c.1.1787857051036;
        Thu, 27 Aug 2026 11:57:31 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c6600147edsm1730496e0c.8.2026.08.27.11.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:57:31 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.112.12.104])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 64D774013B;
	Thu, 27 Aug 2026 12:57:30 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 5A653E404C2; Thu, 27 Aug 2026 12:57:30 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>,
	Ming Lei <tom.leiming@gmail.com>,
	Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>,
	Bernd Schubert <bernd@bsbernd.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 0/2] io_uring passthru: set result on blk-mq request completion
Date: Thu, 27 Aug 2026 12:57:19 -0600
Message-ID: <20260827185722.3234622-1-csander@purestorage.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_uring NVMe passthru currently receives the NVMe status and result in
the blk-mq request completion callback nvme_uring_cmd_end_io() but
doesn't post the io_uring CQE until the io_uring task work callback
nvme_uring_task_cb(). The status and result must be plumbed through
struct nvme_uring_cmd_pdu, taking up 16 bytes of the 32 available.

Store the status and result on the io_uring request in
nvme_uring_cmd_end_io() instead of nvme_uring_task_cb() so it doesn't
need to be passed through struct nvme_uring_cmd_pdu.

Caleb Sander Mateos (2):
  io_uring/cmd: split io_uring_cmd_set_res() from io_uring_cmd_done()
  nvme/ioctl: call io_uring_cmd_set_res32() in ->end_io()

 block/ioctl.c                | 10 ++++++----
 drivers/block/ublk_drv.c     | 26 ++++++++++++++++++--------
 drivers/nvme/host/ioctl.c    | 19 +++++++++----------
 drivers/scsi/scsi_bsg.c      |  4 ++--
 fs/btrfs/ioctl.c             |  3 ++-
 fs/fuse/dev_uring.c          | 15 ++++++++++-----
 include/linux/io_uring/cmd.h | 29 +++++++++++++----------------
 io_uring/uring_cmd.c         | 34 ++++++++++++++++++++++------------
 8 files changed, 82 insertions(+), 58 deletions(-)

-- 
2.55.0

