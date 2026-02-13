Received: from mail-qt1-f228.google.com (mail-qt1-f228.google.com [209.85.160.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533B5C8CE
	for <io-uring@vger.kernel.org>; Fri, 13 Feb 2026 03:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770952890; cv=none; b=IupZXwSput+Nld2B9oBDU0vXj1xzCt6yWc5kImncJNmzyjrMOW0oJS1kXHuoCZ3mnVIi72dI2MHnlz+ohD69OQ7UpxiO+wUim7P0kgEyxhT9BA1LQQT+GjMGoYJ8YLKUxHCmAlN9YRlwxFunoPxMGAscqczZMtEdPHnv5sWVa+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770952890; c=relaxed/simple;
	bh=S7mkoOuNfW+vVsSc5zwR60MqIzi4Lad6BXAK3HBrZUg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mXh5RuKwDR0v6/JrueoGsXGvqqWW7FNKq1U668F6myHVtxnDjwVP/YVFlgo8JVtDdQOpI7nIl/X6iEpH/3cOTA90Jr390d/AQyg2LygZ4EHMeJgc5iR4FHlPhFvw7avoiVo2GtnqK2X8zqvCxM1He1ucghSYCh7QjdLymzidDH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Na0mcF3e; arc=none smtp.client-ip=209.85.160.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Na0mcF3e"
Received: by mail-qt1-f228.google.com with SMTP id d75a77b69052e-5032ee7bf6fso217231cf.1
        for <io-uring@vger.kernel.org>; Thu, 12 Feb 2026 19:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1770952888; x=1771557688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hNjsk/uff9pARkaRzlte1yX2NQYGh3GjyfK1pUQCaAc=;
        b=Na0mcF3eogCjA9l/2ryztu2mJL1I+i5G4l3fGZkWFdOhxbzqU1Qbu3itnGSKjznG8Z
         o6ncFN0Ycx9BBOVc7SXYVa0QG0G971zPy5eYx7NfAZBZV9q8Iq7/qCuh7AaQ85vI5M8q
         HPkElqIuHig/BdvALg8CZ0Tdx+ynjftyVAtI4QQ1edULYa8Qi04qch6fz1qC6weQjbns
         U4UowFAH8e7xWqMwDbG//N3pRf6CyMPCaSrP3bTkTUHTDDVaNzsAEjDuevr87peA4ItQ
         9AhN59uVthxlJXLkp0kBHTesEryEkMhTIxp7LFyifQq+s7smdg1rprbT4Ac4iC0wCAWz
         QeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770952888; x=1771557688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNjsk/uff9pARkaRzlte1yX2NQYGh3GjyfK1pUQCaAc=;
        b=emHFpgUdoiCduYkS47RzS7cj9EUCv5BYRG+/D+yRaFAEFuR167fuhKMvLUuR5bXGm9
         cGms2MhhdEQE7ntKm2c7gatzWlYGXchhu0bs3fq2ztPXrKez2CwPUWIbz5XMfiNmG/f2
         wd2t046I1/XZxiz2SiC+1B6244nqRcDLbdAdCvDGWmXRcsyK7F/MHS5XHWEPw0Jq7mZK
         1x8pIJqQvdgPJHMpb9OzJ0zr5WKbKyQFOvzoxbyMb5IpKODCtKv3zYvH6zFP/Iz1lmf2
         sasD8Y6Lkj7aN6iZLeD61k+bFxfAfIMQHSPE2vi7ZFtnCtfsccExJICNLD8LJPublF8u
         +d8Q==
X-Gm-Message-State: AOJu0YwrgBUWUHIgjo+4rzci1YCRnUY0JbTVusKaLmMyz0rMDMNZf5Id
	EOm0/G/S1OGEavx0fCvliOEimZg4+T2txHGoaj8lJeDBr6uFgAJ6nmA1qSNZKR7zETYIemd/OgC
	cfDu+jbov9va5Uft/8GTgYheiHMuz7TZd9fgPRJwgHyLmGawjuvnf
X-Gm-Gg: AZuq6aL8TGupwWEg2ppb63TLq2QLXuMcneYAdGYAnJ1If8AOg34kOw1d9QJunqBuUeU
	d/k6DZKZpmhbAYz26/HGYX5J9uqG984qheU9wsbRE4B2Be5iqU5/GUQ7+AthokxGIUeqlDmWqOP
	IcHdA0q3PIlb0UZEIMM1MyPzHeti2vbEUma5EAnUJ7mETkKUX4fs9ntClswRdjICt2r36iU/XKf
	4TXCyXAmhy298t6KlAsgcvAzb+aOwjTk66vgEJs3YQVt+NQp72NKL3WYuTguFJb6rL8OBh1WAJB
	sZmbQVzDkWaDqj8eJSFDd5FmEjTD4H0rs6jxB1oaFwVhv8N22gsUi8Cr2STJZ/7y97JrYF2cf0M
	IEBFwwlbyUw+F+IhHeMjzWYnP4aqMCzzYGi8bsc4=
X-Received: by 2002:ac8:574b:0:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-506a6a604damr9881811cf.6.1770952888246;
        Thu, 12 Feb 2026 19:21:28 -0800 (PST)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-50684b8e231sm4821541cf.8.2026.02.12.19.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 19:21:28 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.112.29.101])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 8A5DA34050F;
	Thu, 12 Feb 2026 20:21:27 -0700 (MST)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 73459E41DCC; Thu, 12 Feb 2026 20:21:27 -0700 (MST)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: io-uring@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 0/3] io_uring/uring_cmd: allow non-iopoll cmds with IORING_SETUP_IOPOLL
Date: Thu, 12 Feb 2026 20:21:16 -0700
Message-ID: <20260213032119.1125331-1-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, creating an io_uring with IORING_SETUP_IOPOLL requires all
requests issued to it to support iopoll. This prevents, for example,
using ublk zero-copy together with IORING_SETUP_IOPOLL, as ublk
zero-copy buffer registrations are performed using a uring_cmd. There's
no technical reason why these non-iopoll uring_cmds can't be supported.
They will either complete synchronously or via an external mechanism
that calls io_uring_cmd_done(), so they don't need to be polled.

Allow uring_cmd requests to be issued to IORING_SETUP_IOPOLL io_urings
even if their files don't implement ->uring_cmd_iopoll().

The first commit fixes a few bugs where IORING_OP_URING_CMD128 isn't
treated as IORING_OP_URING_CMD with iopoll and provided buffers.

The last commit removes an unnecessary IO_URING_F_IOPOLL check in
nvme_dev_uring_cmd() as NVMe admin passthru commands can be issued to
IORING_SETUP_IOPOLL io_urings now.

Caleb Sander Mateos (3):
  io_uring: add IORING_OP_URING_CMD128 to opcode checks
  io_uring/uring_cmd: allow non-iopoll cmds with IORING_SETUP_IOPOLL
  nvme: remove nvme_dev_uring_cmd() IO_URING_F_IOPOLL check

 drivers/nvme/host/ioctl.c |  4 ----
 io_uring/io_uring.c       |  4 +++-
 io_uring/io_uring.h       |  6 ++++++
 io_uring/kbuf.c           |  2 +-
 io_uring/rw.c             |  4 ++--
 io_uring/uring_cmd.c      | 11 +++++------
 6 files changed, 17 insertions(+), 14 deletions(-)

-- 
2.45.2

