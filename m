Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053A930FF31
	for <io-uring@vger.kernel.org>; Wed,  2 Sep 2026 22:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788389840; cv=none; b=YIaNgCBkpa+Fnq8Lbw2KBmXMyH4WLyTsp88rnzC7U1BWUKKCUXils3XKwCNolDOpNhcur6jcLY7VLTuzIeivpgrIvf4PzJ56Ss02wT1mEJoVk5d2j9QhEnydKFzKAbmEuxQC8jEaqWznI0POzjWpiIJ8S4RiQHFlWPUUXTXvY+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788389840; c=relaxed/simple;
	bh=o1vlXcLANFy7ZzKd9CG3z8Rv1Gnisjb6ZUbt68YBI0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u5X2pedQzkRFkEOmxPHT0Jf/LIBZtSTejplCmkFx7bMykDEL40MoOjEPcG+qqVMh9A9X6X/7fuWFDyrDykxWIj0MeNRw27UKCzLgWbDQoDnpOVGiSM1uj4JSE9wqirSoqV9AJfCxOrDjRhLQlGnXJSNTmvX6gbd3Xcmq3/IN2MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=J9cUgpDH; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="J9cUgpDH"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-398a29be161so282201a91.1
        for <io-uring@vger.kernel.org>; Wed, 02 Sep 2026 15:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788389834; x=1788994634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TXye3s8M7BBJFOvpLi+6gbf2riGSXQocruinG92HPCg=;
        b=J9cUgpDHOI/FpeFFt2dKxL1oyBGP8FA9jN2/7Zm9Chy534yn8+XfnFl5PQXD3eSOJx
         q3G6+Be1xOa/okr2QjeJsRwENV5LXQbt5uGYH6qC3/va1Qqje6R0JNj1peeF5coC3WIL
         2lnHfmN7f2UMmkfoCQOt4wKlOKcghCIIo3/swP7BtMpTu6Le3ggGWxMlP/rPgOBvBnom
         SlOoNbx5nXDOeJQ9tRIcMPKtUOno25STK+nHPQWvnJfK96lj987pxEgJWOqvhJmv9K2m
         9c8paPzcb3bmOqEGOUi7c1knEjMBaIQ+WM1YsbwIrzaTgmiwaMCx2KcZkwAtUnQfe0p3
         JZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788389834; x=1788994634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TXye3s8M7BBJFOvpLi+6gbf2riGSXQocruinG92HPCg=;
        b=ZlCvr4RfY+IqU24RmCYPGSbNgVOt6cuEW/NjpYVS2ZHcZXfx1C5EP32U5aeUbXb4J8
         2+8csAL0RColE669RsUIjh5jos4E2jL72Og8cDMPlaWpaSnhnKs1BVlAWvIY5Na4YjUk
         2hBb7q3Ig0mUvEBnZWV6uOd1FZyC5gkuHlUg/t/DcBDH4dyZw86pS0yBUciAYox3bKQ4
         grzN5eFnScJAS8OCVTFjDJ2g0tD4K0FjsE5Rx+tPoABVG/gzE08ZuOBGCuqVp2uLKQ2i
         Sur0pnrvT0OJ/BVb9xjcsuXNMmuI24vhto7LQcNTcAJHghxxHipQuMS6UEgMmsHbFwW5
         J2uA==
X-Forwarded-Encrypted: i=1; AKwUvByBKcx3wQG7vYzLto1r4QpNl1WxtJUED3PnUEI6Skl95UUVrm7SALFpBWwTS3ZHM9m2jtsYZMqEFw==@vger.kernel.org
X-Gm-Message-State: AFuF++mYjsOQcpjUcC/u2vtAW4a5JL3o+UohZt9NfP5pYrHgFD4jis1D
	4mtoRmX+6AfyY1ZDczRe1plN5hIiLS8+ET4En01Ed2/9YDq8Xwci/NpRESXuA9Zd0m7M37CoPjp
	xXOihviW/ce73M5DcPQIchTozLqSUcufCoGqf
X-Gm-Gg: AYBFou1xgRSzmWhMnSMWdZVyt0T9YJlNZodGS7p85ZwSkUqSXjFyWwfq9VJBMJEV4Gx
	crIViRrtGaGF2OsmCIfys3bFSVKdoaata/5he35k+yLFOO/bUEFRc/t8jevb4Nswn4jkARy4QjV
	4OTo+JBhIvZu20qK48Nuq2SgCya+HaKBDJu9OxpDYvm06LHAQqUeitkb8g4Z3K5EYMb8gXZmCZS
	EDCYoWeZaMfU6CFRSpPdORc7+EVMl9Mc/9+CzIDwP6vwW2WTyeYDlhJGIPls69l0a1OdBFOLati
	VQ5RHgMz2GBlimBsjWiKydxXOUUgm3KWao5EwH0skxOyi8PP7LZbp0by+rKZnoN8jDuYm7kXY2r
	5EidyWgePIGSI9UJuwTzMLQQHeqPxRIkW
X-Received: by 2002:a17:90b:39ae:b0:381:77cd:38ca with SMTP id 98e67ed59e1d1-39aee1b3eebmr7025118a91.4.1788389834421;
        Wed, 02 Sep 2026 15:57:14 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39b0e6550bbsm187875a91.7.2026.09.02.15.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:57:14 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (bond0.slc5-n17m28-k8s.dev.purestorage.com [IPv6:2620:125:9025:20::a31:41f])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 564F54001C;
	Wed,  2 Sep 2026 16:57:13 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 46D07E40404; Wed,  2 Sep 2026 16:57:13 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Joanne Koong <joannelkoong@gmail.com>,
	linux-nvme@lists.infradead.org,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v2 0/2] io_uring passthru: set result on blk-mq request completion
Date: Wed,  2 Sep 2026 16:57:06 -0600
Message-ID: <20260902225708.2379840-1-csander@purestorage.com>
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

v2:
- Keep io_uring_cmd_done{,32}() wrappers to reduce changes in uring_cmd
  implementations (Joanne)

v1: https://lore.kernel.org/io-uring/20260827185722.3234622-1-csander@purestorage.com/

Caleb Sander Mateos (2):
  io_uring/cmd: split io_uring_cmd_set_res() from io_uring_cmd_done()
  nvme/ioctl: call io_uring_cmd_set_res32() in ->end_io()

 drivers/nvme/host/ioctl.c    | 19 +++++++++----------
 include/linux/io_uring/cmd.h | 23 +++++++++++++++++------
 io_uring/uring_cmd.c         | 33 ++++++++++++++++++---------------
 3 files changed, 44 insertions(+), 31 deletions(-)

-- 
2.55.0

