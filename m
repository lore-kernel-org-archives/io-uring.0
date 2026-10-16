Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36E326FA60
	for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 09:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143285; cv=none; b=KXeZZa1GMEbvP5BgseJmwepyVSDsuG7/APVYHVDc1nYm30oONNowykXpOeKZe6/94ASfrmr8j1asksBdhrNRFJyWtKV1zhIYulw8ADEfhykhNdftQH6uT84dQ0abFhrxej6qB3WxwthWtkhWrhKCklM2chm6CEMgENJcAAj2xPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143285; c=relaxed/simple;
	bh=JUlbSNC1c5FQufY/MtplDiQAm5ICexKVO8OpJNtgLGw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X2VHUE7IIzDdeTsIX9gjORQ5/w1zFN+wc1WKU70StLW31CC0SjpwAPTcRlhRNxIB87ixMPzoYi9yEE2iMQW2bBZHaJC7y/iDwV51BIlmnsBmFhXMJByIKTeWjwvQ08l+PdQAkTZXco4SfmjGIY3+aOkhwun78x4uVcfTfiy/rRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=it/WVlRI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="it/WVlRI"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso13722775e9.1
        for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 02:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792143282; x=1792748082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ymRDCbkPH0L/MN0wvzTktChP65Muw3EavSGPIzFh+rc=;
        b=it/WVlRICN7GYa9bYEOPv5pQkKzWA4wAAY0XRDa5Us8AcPgs8YmvAUTLolepbQwlGX
         W6szYBW6KqpeZlDIVhu2gAaRW0Ya0kkfQ1b3t16Xx8sj/aWfGUTNG8wk3TA74ueDFQ+X
         3A6SMTm0bolmefUkMis77uM5vgxZUVMy9tZ2+xPTUwzwbbxeGuUMhThm9GtIofQJ5e6w
         JlQHobnLrhwalvV08AZUH/FxJh2i7pzi6sMVfQduyYmNiwLcaaeLwscNiWTLT6GN02MK
         4hEdxZkIDC79dIKrK0ElGFplyBKsKiscn2uU8+phOYC2XHH3oEw76g5nHY6qRHd6fc+T
         7U6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143282; x=1792748082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ymRDCbkPH0L/MN0wvzTktChP65Muw3EavSGPIzFh+rc=;
        b=nEtJ8gPHBTEB4fKF9lJOIX3gNbLM/m8/019zrwbHwq9bfXuzdYiF/bLCL3tIuIxGmJ
         UJlwZIdxHj1ibxZKWnX8DI0V7wMPNOGYNapAQALOP6zWSJBfFEdOsuqR61jhqY1X1fbJ
         5sxYyJNpOEY1uD0Pe0ywgtJP2HNaljcNtVBfp4mST4WZnKs/GgBBv2hNriCENyND83U2
         GHSFD5pHPQxHm5mhVZJ7odSuZt/QtIUf3T1PZBqrSNVTUJJNeseRISoOOlyCcfEkoLvh
         erONwWMuawx4CcpL6IvoLh55FNPr5lCvJclStCqYIGH8NTPz0MVracdIBKssk8VxANW7
         Z18g==
X-Gm-Message-State: AFq9FYLf61Cyzgd+mg4QP8q/NGiLsEMgeYhFVUV68ZT07kFgQr2eOAEE
	t0R+3w6nXBiZJLRg0d0TyMwGOhuokc/jyH8K/4TS6ICne4Pxo6gzZvsLs2TGuw==
X-Gm-Gg: AYBFou3zfwJKAoWEsSSdbUGU9NhhV74C7leVkE4RlWbGu7O0UoZ1IW3cnwcnyrQCUjF
	9Grohwsz56yamNdCaEsHPwKR34HFrcpqVzGlb+KtE8LGG6RoWH2K+RdER3INo15jCjMJqKfCIrP
	DPV246LFAZza75pzb+MnbHuqlpOeSjJIXFgkCTCJAkIJiCdXuI+CgNcTh7+lWHLNy7XbomwE7fM
	E2DUzflauj2alkSsQZ+tWK7Me4aMAsPoF/yOaZDSlPX64V0C+W94eGBSvwGFbquB27567g0660O
	NIsSDXdIbF2+fR+bxez0zLwyfnNCGMdviqCunrI/w22hQfYmLd1nRYcwH0q0kxm7RFhIElVc+fb
	etx6gWuvMHnFFHToQ7Un+jBE6prsoZ9A+3GfznuXur7p3He4RKms/HvzSdDJpInejFL6JjwuEo9
	1oArwfLQFm7V6Urc/pUgCBKqUChqo/LTT28vjD/RIMcPj1vWnVU5F9CmVld1xjrLdchW+xAjWeZ
	bVXj2bRbpKaqVAD/3Pn7M6sDTnfXb9toRs/e7/wBdFzhowIOEFPZLrgqPJFG6dwcexUz5kAHP26
X-Received: by 2002:a05:600c:3e8d:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4a18e4aecb2mr401472905e9.32.1792143281895;
        Fri, 16 Oct 2026 02:34:41 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ad6252sm63570615e9.5.2026.10.16.02.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:34:41 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	Jens Axboe <axboe@kernel.dk>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 0/2] clean up dma-buf-io kerneldocs
Date: Fri, 16 Oct 2026 10:34:35 +0100
Message-ID: <cover.1792142927.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a kerneldoc for dma_buf_io_init_map() and clean up it overall.
Targeting the Jens' branch where dma-buf-io sits. If preferred, it
can all be squashed into 

0d3120db2cbe0a ("dma-buf: introduce initial file I/O infrastructure")

Pavel Begunkov (2):
  dma-buf-io: fix typos in kernel docs
  dma-buf-io: document dma_buf_io_init_map

 drivers/dma-buf/dma-buf-io.c | 32 ++++++++++++++++++++++----------
 include/linux/dma-buf-io.h   |  7 ++++---
 2 files changed, 26 insertions(+), 13 deletions(-)

-- 
2.54.0

