Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5EA353A87
	for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 13:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727756; cv=none; b=n4s/IgpVtkAAv9vsB2ecDn++yBt8mUKeICp9GbdfNraM9fhOuwC6jRuulOUA/RfaEyNPrJnXqKj2+nkD+I5bUX8K3kM7AfBE5WbVSr7UWk3/FyFDQRJuGdgda/ohhLpfsfjBs0acBvSIb9eDCac9lBeMG3hTovZryiy2eMLAftc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727756; c=relaxed/simple;
	bh=qWnVCFHEIQQwVG8uhmXw/dvzIi9AupAXMmD833qTb6E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D+ryeYQII4oSv2S7iuxHds25vvPa/f8xTcHlwR73mM7SMSChMdJrkoiWVnR/zNM8cMp3E3piWw6ASXLd+TyUeTzq3azRiGC+1xW+s78uDvJJdC/OSfwkapOnZLTumOOq9MFwwAwqaVdF5zX3OoIH3ddrQX6hosvVYnvl4esJw8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r6LYFZ24; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r6LYFZ24"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso22847945e9.3
        for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 06:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784727751; x=1785332551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=keVf3FgJZB5UJkfkXGyU1cYZXcGd56IkuhMm4F3AyS0=;
        b=r6LYFZ24qifmW5LZicUI3qSTOTteSWQAke3ZqLwiI2RHT5Fqk+iIN1jxBXfVl7S1BN
         YVUllGnEKrRsexnkRBU4bEgPXd8/Uo4TrYfzwEle8YHjdhtdQyTOJvswuHWAJ/hpoair
         QVFREXAwqllowMEiayxUHn5963O8dxUYQusVjNUxiOXtilwJhcyreBwUUyKAwoEkQb/P
         xZP2QtfKCJKruF2gJX1rTScHkyPlzKx1EBVx/6GKyiLL+oEQkqPg073gEBOx0anDrhyu
         Qj2jSAHriKOkPJusCeBinNKpIt4Iw3CstfKctDS4kmZ0hcVYJw6CN+7bglW8yA4Pxf/C
         +ilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727751; x=1785332551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=keVf3FgJZB5UJkfkXGyU1cYZXcGd56IkuhMm4F3AyS0=;
        b=ScZjfWQV1nj0UWEpzdr14aBHZ7sgXMIYScf6MBWMyOBbyavV1Juxj6KA+AowvtZe/r
         eumuOt+7PeKHsK4IAfQA8MvJTZcxTfk25jpgZF8gUbhLXbPttqdRPaZGn84R7c9joinq
         1sr/YuI4CziEnruJnBt1vNXivze1dVB14zrFEiqlgR+PKtw6Bw4+JYv5C5oma7wFs5pZ
         Y8pf73UAKX8aZFziO5y0ow2E79xhKUZO+Bota+SgSt3+1Yh+Ugsx+cFphA0DeEbLFBek
         mHbgdRYndMnQ5TyDSHqHTAZCD1FTMGRqQAbxJy48n/NQ7Jl7pvfcBHBIm8nHlUCHIP+/
         7KEQ==
X-Gm-Message-State: AOJu0Yz7cQQOa03XE7k1DVPzR2l3mIPq2jJoxrDAl4k7fT2imqnawIqH
	tPWL2jp1V/sWMC9tk6ZeYN8+LoDXGAAzNiiQZh0+R3PTRNHeJaUDS9SXqL/lQvfI
X-Gm-Gg: AR+sD128a41ugDZDZpXziXy7BrfNbYNKoPDGsuycMcvx0IS2biDOH4JLBL6JDSQWLXn
	DQAIf1cpYV1tf/NvVtYno4naaPKHlxhCzU2hkVAX9E7SAClEzoB0lDu4nlSIkGu/7MpLKdVfl5L
	ftHJBrZJyzxKMQThjK/ZXlrex3euMyt03KK7JDxJvKFAn1t9dm0luhiPQVScjM0EuRQAW4QaMMQ
	kxEWanOghWVx3pCH12TTz8WZKX7sQoZnT7PD6H3icqZJ3+aKCIqsKKTVhH/Yb4VEwgHH2ufD8/a
	6dupFkACPmSA2eEc+PlnpW/HHlHrVC4j/381EwYpEN22CimZrtK+2cy2CuZIXdV1So7ODVq8wQp
	GIp2rWGf/97NWRNIbYcGsbtD/KzgOCfWXsT8JZvORo5zLPJpA6BhyyrQwov5LBfBAMYVNhOFg3v
	/4b9uv9H7+6NRh+Y5SzLpCLqKw4dUdSAsoa+8508hxv1234gfA5GsoZJyEZLQ=
X-Received: by 2002:a05:600c:b90:b0:495:6f6b:fb75 with SMTP id 5b1f17b1804b1-4956f6bfb8dmr17230625e9.38.1784727751353;
        Wed, 22 Jul 2026 06:42:31 -0700 (PDT)
Received: from 127.net ([2620:10d:c092:600::1:c15])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a63fb10sm73403015e9.13.2026.07.22.06.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:42:30 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	netdev@vger.kernel.org,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>
Subject: [PATCH io_uring-7.2 0/3] fix up zcrx "notification" uapi naming
Date: Wed, 22 Jul 2026 14:42:14 +0100
Message-ID: <cover.1784726895.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a degree of inconsistency, nuisance and ambiguity in the naming
of the zcrx "notification" API. Rename it to "events" and do other small
adjustments while it's not released yet. The patch set only does
renaming, there is no functional or ABI changes.

Pavel Begunkov (3):
  io_uring/zcrx: drop "notif" from stats struct names
  io_uring/zcrx: rename ZCRX_NOTIF_NO_BUFFERS
  io_uring/zcrx: rename notif to event

 include/uapi/linux/io_uring/query.h | 14 ++++++------
 include/uapi/linux/io_uring/zcrx.h  | 32 +++++++++++++--------------
 io_uring/query.c                    | 12 +++++-----
 io_uring/zcrx.c                     | 34 ++++++++++++++---------------
 io_uring/zcrx.h                     |  7 +++---
 5 files changed, 50 insertions(+), 49 deletions(-)

-- 
2.54.0

