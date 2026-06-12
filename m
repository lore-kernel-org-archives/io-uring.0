Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C673093CB
	for <io-uring@vger.kernel.org>; Fri, 12 Jun 2026 18:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781290386; cv=none; b=etZec97DQiF5X4gwuntBW4zDHtjA95JTA28e4FUzLL/rC/cOR6YUyDkwZWd58vnlA4YB7LrbZtyp2EuyurkPdUbgufY9xP6FtgCOcnmBSa12YvHIdkMXQERsg21Dw260TMCxIwnHSVVBSkAOpojOxz+fA/fxSAh5t/QGlDpFSQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781290386; c=relaxed/simple;
	bh=i5CPMz/1wA55rf3a9kYBheTyF6LHpzQWtP5/Rus/g7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BkvuwLikVvnN4X2h9yf4o6N4rBfrrzZU+prVcXpXjHeZ6Y5KrBb+bUkFSALWZcsd7H8tSsIOfKL93eC87Qj0CCCV2EvWEwodnLK5iLkYBhuG8JS3HvnoMpIs9Z23jvkjx/cKIicBN2MIuj/iQo84IC68tA8zed5zu2RQVupmbU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhhyF+1F; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhhyF+1F"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bf1f074a12so13977625ad.0
        for <io-uring@vger.kernel.org>; Fri, 12 Jun 2026 11:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781290384; x=1781895184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4BUPQ/hnWs0COaJfJWnbFoEDJjJp1OifIeBMvbZhWo=;
        b=RhhyF+1Fc1euAJ2mBi1yMjkd0VDBSSVzBxs/eH9/vghylWW4TVD9jQ/pQQzUuqN/f1
         RH6E3q5O0tyAIoqNwd+AI3dSKkWwiJj990ppOsTwRR2wETvPv3pgzfpprYqRXSGKx1ft
         gXiGWpUYLAgzqFFmXGcWCXpPIq/pOkDYcmIy+GERrpkK5uBq1C06fHfQgbGBC8v+vNpu
         VOKgHVCZaPvLTvwl4f6gPPFGcjQD0XMhmncMZ5C0P7w95SoG8cLEOdutIgMOH32+c/uR
         l8iWeQrcy0+IR0+ToesF4VobolcIP5o8RJI9Elapp15j4cfYS3LP0tc4KV6Sq/NeVi1/
         q3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781290384; x=1781895184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4BUPQ/hnWs0COaJfJWnbFoEDJjJp1OifIeBMvbZhWo=;
        b=YxPE43jgDxm+/+swALXo0TG0T77FFtUwanceJn0aNJqpp6Sb8/syyVWhTyixsjE9xp
         Eg4KBNFFpePLRmRwKbsg1kgdmwcxL6wfsrsDiAPWJn7sp6kb+6fwtqR0fey63CskelUl
         kG4Fh49qJYuoDxMgEsho0EOTJD56XIn190GdCka1gdFbW9ILVB71ZxqsxgfTT5QILYH0
         ofDB5xAwN9nUNFLqW0fezEFsxMWmAyzL2/5+6A0yQwrx6e1mZMU9J2wMswmz1UqUweab
         MBJtyK1UgwgzvLV6HgSe0LOGlWG0Sztjh4ztKviw9AR54wF+dWH0A3uqGz9sHKOjEsa6
         Wt0Q==
X-Forwarded-Encrypted: i=1; AFNElJ+yyPTAHBWKVlDtX1kzVDWE8CMETnqYGbM6YmHvV+8K6uZdWZE1Z1bzVhEnC4iPqdvmbSQn3xUfoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPWkTkPBB0KHVPGkFwyORdINHSf6gVKdz74uiM9HQM7pqmnSVs
	X9/26CNFQ8X126HeYqZN9bRe61YkHkkh0qUf88yCdHUF4kyJsbfGnKB0lqPwhw==
X-Gm-Gg: Acq92OEjTqWN2AfoNGNWHNo3+AMf7P2oUT8mTWlPN7zRHN/d6o4oJvpArcF/CMpOhvT
	P4anRUeoZrIgNrhidBczSBFEI36ijhFkeXtIKcLg3MlUp6BBt8/gRKFCfJBmM+iaWypVsOREXEd
	aAxcmWfwkvyIGHvOuzndjG+xOnfmwJky7TOvr0wBt/RfJdl045AmvsrX8GLQ3dAdFQyRLSVjAJy
	XOUTjUnhQiDbVPQrtHWfgZNG3Dx+jZSZPe8jb+PD2pzej49Qqzyo5kCEuuXTD8t/Qp+k34523VL
	2IiSQ3UsxCVhxjSczcfA+KcD4loVwm4mn1aT1ySF5uIkMmJ4Djbuomk+q5rfsLE/q2C1OJ2Ccr7
	ggcaeIRN8vgSfU+pelcoyIqBGHL+XUF4zjG8gXPmlfwNt/luSC3Ngj88Yr9ORuIiU44Yc13WNno
	WjKAPj+tX1gzJU4A6g12rCK6Q1xvaglNX5n6czBn+4Vt5jrsIY6T3/Lun2fgZOnz2pYx+GCYdZp
	rM=
X-Received: by 2002:a17:902:d2c7:b0:2c0:c38d:9d37 with SMTP id d9443c01a7336-2c412840d2fmr45857095ad.25.1781290384116;
        Fri, 12 Jun 2026 11:53:04 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:5f::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c5535sm30804245ad.18.2026.06.12.11.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:53:03 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: axboe@kernel.dk
Cc: miklos@szeredi.hu,
	csander@purestorage.com,
	io-uring@vger.kernel.org
Subject: [PATCH v7 0/4] io_uring: extend bvec registration
Date: Fri, 12 Jun 2026 11:48:36 -0700
Message-ID: <20260612184840.4058966-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No changes from v6 except rebasing to the top of Jens's for-next tree.

This series refactors and extends the io_uring registered buffers
infrastructure to allow external subsystems to register pre-existing bvec
arrays directly.

The motivation for the patches in this series is to make fuse zero-copy
possible. The fuse zero-copy work is in [1].

[1] https://lore.kernel.org/fuse-devel/CAJnrk1YNh0KFxcGVO5VbkM=5WTBsxEOSKWwfcyBxrP=fiU4atg@mail.gmail.com/T/#t

Changelog:
v6: https://lore.kernel.org/io-uring/20260403174139.3634824-1-joannelkoong@gmail.com/
v6 -> v7:
* rebase to origin/for-next

v5: https://lore.kernel.org/io-uring/20260402160929.2749744-1-joannelkoong@gmail.com/
v5 -> v6:
* rebase to origin/for-next

v4: https://lore.kernel.org/io-uring/20260327172631.3380702-1-joannelkoong@gmail.com/
v4 -> v5:
* rebase to origin/for-7.1/io_uring 
* drop the io_uring_registered_mem_region_get() patch

v3: https://lore.kernel.org/io-uring/20260324221426.3436334-1-joannelkoong@gmail.com/ 
v3 -> v4:
* Add comment about io_uring_registered_mem_region_get() locking (Jens)
* Return info in a new struct io_uring_mem_region_info (Jens)

v2: https://lore.kernel.org/io-uring/20260324182157.990864-1-joannelkoong@gmail.com/
v2 -> v3:
* drop patch that makes buffer release callback optional
* add patch for renaming/exporting IO_IMU_DEST / IO_IMU_SOURCE

v1: https://lore.kernel.org/io-uring/20260324001007.1144471-1-joannelkoong@gmail.com/
v1 -> v2:
* update io_kernel_buffer_init() to take bitmasked dir directly so callers can
  set both dest and source

Joanne Koong (4):
  io_uring/rsrc: rename
    io_buffer_register_bvec()/io_buffer_unregister_bvec()
  io_uring/rsrc: split io_buffer_register_request() logic
  io_uring/rsrc: add io_buffer_register_bvec()
  io_uring/rsrc: rename and export IO_IMU_DEST / IO_IMU_SOURCE

 Documentation/block/ublk.rst   |  14 ++--
 drivers/block/ublk_drv.c       |  22 +++---
 include/linux/io_uring/cmd.h   |  38 ++++++++--
 include/linux/io_uring_types.h |   5 ++
 io_uring/io_uring.c            |   2 +-
 io_uring/rsrc.c                | 127 +++++++++++++++++++++++----------
 io_uring/rsrc.h                |   5 --
 7 files changed, 146 insertions(+), 67 deletions(-)

-- 
2.52.0

