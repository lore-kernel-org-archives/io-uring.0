Received: from mail-oo1-f98.google.com (mail-oo1-f98.google.com [209.85.161.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD09572689
	for <io-uring@vger.kernel.org>; Wed,  9 Sep 2026 15:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788969570; cv=none; b=YeYx30Nj2LZaJWty/PXkJ2QJLEVTej2PTwHGZV8diBEEvmk7VjPA8it88WzIOThkyyPrHPyOClBc87dLtTxaYtm0PFYvC25G4bfc+H5UEthrk/dpuZrhdpSLENYX84YW9vptwfZfFe0PDBv9LirXnbETAH7pzszWl8yW6Mp3jm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788969570; c=relaxed/simple;
	bh=bIFo61AQRBepA+eZgKggLjcuui2wl34B52fZnjPCxM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qAhSc2q0BKYHiRG6N5/UeGWxzYYDMBlIqGrQhVG6FoO8SqB7xmGVDFEckLUfmyGcG8AbWsfGZau5pC0VKEtGzB4XWJ916HObURoZrMLDSEjl/0ixyXwaDX0SISaIR8VA0Tyj8qhFYu+FIpkNwpFxODO4dMjgLTes2YLJV+o4k0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=A2T/ZGnn; arc=none smtp.client-ip=209.85.161.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="A2T/ZGnn"
Received: by mail-oo1-f98.google.com with SMTP id 006d021491bc7-6b137c4ec76so10578eaf.1
        for <io-uring@vger.kernel.org>; Wed, 09 Sep 2026 08:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788969567; x=1789574367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P1kymuGqdAzFhcYg4rZW0qBDuOZo6IIQ9a977MAFPAo=;
        b=A2T/ZGnnxGqJ6GTSOUlKs7K6sXeddlqWt5r2kJLmeMVNW4/sCk6qBInoaEeOFR2lAX
         kP2yk4SbgyKj39DIYyPtmeZcyyI6kg0hvVEu3yLGEIkO8MZCb5CrWXdaqR12ipkaugb7
         AASZ8H47TZJEd75Yb8CZlk19XF8KKk0tE8K2t2KIecac2GUr7yHaxLmK6H9kNqf3BIUw
         Qf38pmG073c7S463+uAOBWWj6h3SeFnCG1M5eJSLhYa5BhHkq9G7/zaw14FV+K3EUgPB
         Gt5Ydw+tlibgTUTQuKYzqLYlFAxiJIj5fR7C5bxlbl9egT0mmgSAXMSQT3/TCjqndSqR
         8xNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788969567; x=1789574367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P1kymuGqdAzFhcYg4rZW0qBDuOZo6IIQ9a977MAFPAo=;
        b=RzEW56PVp0ilqQGd/hJCOhdI85AOhcV/ZhkrdGmMdKTP/0CXb0SJ3sGXurMTOxORkx
         z23vRMctEbMccvPpsO9eKjWsDyZCORGKGg2s9yNDlS95yAkYDCaAnbm/AswySRSTKhUY
         Mpasyk4XWTvqV36XgTQdrklJkodhevy4x9SWXfxJQfP2PsCadFfZkhNrnU+uUC1YBaCB
         s8gNEUKZlLbypviHbNjYxnBTM7HeRlRXMGT7Z2OXKJIBvewxdLnXupslQanJC7Ipok+o
         ZMFL9MvHiW3xvyaSRrnIfioO8HanpR+EhHfaOef7AtBmLsn4cJ1Q53bly0V7/xCHfGdS
         JnrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVGqApc0Fqxn0rRooUQAmDBj12ljwkNNyUJ8b7MWF9u30x8f8mJxHGQgcNI/uEXPuKChp2l5DVpQ==@vger.kernel.org
X-Gm-Message-State: AFuF++n6Ftk2+Rxra786QVvimCNgWKsRq/cyDjjHXW4mpb0RchmsAPIe
	ZSSPxblSQIF+biEnvcYYyM6GDTdNxcNt088kzxT9EgrPkNNh18uOpH5JJp1OZaqLIOq01/tJLYR
	3+u0KhfqWvxEfHTDdtvj+lNp7ri1ZiGE9kfXVUUGKb2wS+EB1ldnO
X-Gm-Gg: AYBFou3i3se8p72Fc+7uGrO1gjRptraSPPWUEer5sGZHzamKwcPo5cbtccK9pKjI+YH
	5aTkOBkPAuX03DE+Z36Fom+Afz2oa46ruGcRmxX2O0mdlCqxmLg2WUzhRRFUvkx+MjxSxxV+A0j
	nao9fs37K95USzLm8xU6244PR1Yjyn/u0e1xWv0YEgmW/j9TSR44g7MjWQeZmcfu7XJDAMQtFjV
	8wup9WS6oyrl9JuSfWG29EcyjqF9zVdmtQDW7DXtEffo2cr2HTWxF46wZG4ujbEpp5EXMWcLTPP
	wVKCATlw31HtwzVFu0dvxc/cIm5RWiHUormk1kPb4ClYeBLOxHHVpA+A/yFvoyffJ7tqXNriGaB
	noi8ADAp4ByqPZBho
X-Received: by 2002:a05:6830:d0b:b0:7e6:6f9f:7445 with SMTP id 46e09a7af769-80273409dafmr51350a34.3.1788969567419;
        Wed, 09 Sep 2026 08:59:27 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-7faf7de412asm2209894a34.7.2026.09.09.08.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:59:27 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (bond0.slc5-n17m28-k8s.dev.purestorage.com [IPv6:2620:125:9025:20::a31:41f])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id E67B7401FD;
	Wed,  9 Sep 2026 09:59:26 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id DC4EAE4026F; Wed,  9 Sep 2026 09:59:26 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>,
	Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Joanne Koong <joannelkoong@gmail.com>,
	Ming Lei <tom.leiming@gmail.com>,
	io-uring@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v3 0/3] io_uring passthru: set result on blk-mq request completion
Date: Wed,  9 Sep 2026 09:58:45 -0600
Message-ID: <20260909155848.2069290-1-csander@purestorage.com>
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

v3:
- Inline io_uring_cmd_set_res*() (Ming, Jens)
- Document that io_uring_cmd_set_res*() must be called before
  __io_uring_cmd_done() (Joanne)
- Add Reviewed-by tag (Joanne)

v2: https://lore.kernel.org/io-uring/20260902225708.2379840-1-csander@purestorage.com/
- Keep io_uring_cmd_done{,32}() wrappers to reduce changes in uring_cmd
  implementations (Joanne)

v1: https://lore.kernel.org/io-uring/20260827185722.3234622-1-csander@purestorage.com/

Caleb Sander Mateos (3):
  io_uring: move req_set_*() to public header
  io_uring/cmd: split io_uring_cmd_set_res() from io_uring_cmd_done()
  nvme/ioctl: call io_uring_cmd_set_res32() in ->end_io()

 drivers/nvme/host/ioctl.c    | 19 +++++++++----------
 include/linux/io_uring.h     | 32 ++++++++++++++++++++++++++++++++
 include/linux/io_uring/cmd.h | 34 ++++++++++++++++++++++++++++------
 io_uring/io_uring.h          | 31 -------------------------------
 io_uring/uring_cmd.c         | 19 +------------------
 5 files changed, 70 insertions(+), 65 deletions(-)

-- 
2.55.0

