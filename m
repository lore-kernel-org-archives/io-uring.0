Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57336472F8E
	for <io-uring@vger.kernel.org>; Fri,  7 Aug 2026 13:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108789; cv=none; b=fMbetpg1KAETePYWSZyETdCw/b+4D7jggx/EHVMpsvWKfplZl9kZr+gjPOqCf7ROYc/kExtFOcj2sFTwqS5Tshpj1siCQZpLcNscKJaEK+czh1dTz+v/dvr3IYVuEIlsD2RkMaN7GrFfaaIjBYdEZwyaaaF5ErD4LASvhhX4iiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108789; c=relaxed/simple;
	bh=/3QfjorFC4WHngMHUPf5Mu5W04ciyZS5aS+owYb5SWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kC6/vy/dv+Vzz/WPKV2AQ9ZzWToKIZEEe74pavjHm0XxGfoGKamFazM6xtyQYGfwySJKroOiZQHDKsQ7ZXx8+NaOmWrh3lWENzE5S50cDIt63k88xn80AoHxV0y57bhCTfNqMA83i/MaPiXEBm7CM/EvtRXieRnArjFwNX3uKnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e96yy8GE; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e96yy8GE"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso17282285e9.3
        for <io-uring@vger.kernel.org>; Fri, 07 Aug 2026 06:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108781; x=1786713581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gAxAClyqJm0XfJys8/gN2j1pvq2c/F/Yxstuid7ORa4=;
        b=e96yy8GEilOsEx/arLwyI16P9tVHHzTXydm7WpL8a2qMBpmHJ3R4egl1ilzG/fHp2L
         6EfvorIDER65rZcXBpmhjhFyYZFujDRNeAnMYAKTPAv/0RrXqnfnlXgFkaxqAVR4SZ3l
         c+SqjqSRBccexf2cv5XpKBzMidl0vdfT89YiJ35pk1tr0qKYNRSRWTvDqFh6b5N4kznk
         EGh5CN2GdKvVwD35YHJBlpCGSGv1s7rkxouKSONgZTepD5Tplg7tSu7DHGS2Ui1MeUtb
         l/BH8k0xRtixOZ5+MFIMVpGnjy+Jb4QJ7V4gwlHtma7jTuPH38Sxb3fhaB2zOd9A49Y0
         ff5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108781; x=1786713581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gAxAClyqJm0XfJys8/gN2j1pvq2c/F/Yxstuid7ORa4=;
        b=n6a09q5CNB4lARk8Pc2Q3l5a3nNV9YPHIMGUOE5qYp/gpUBwuKyqOlFIZoJ6MzbyRE
         /hMv6J+ggo84kd5SZdpZGLjF9h42RJuqKwBbSEvtWjBf9v2j26kNsqQ1xlH3Awe4ppJs
         UT0Czq26VmlMUdJYg46zhtjdbIF014n5DGtBLWOIhMJYoKht6c3UAAn8UoKn2LxQDy8L
         wK92DenqC3MYScyweGp6DXf+uermRH7cCndo7MvVAhr/BnIcKB2IWWRqJYqUNLmNGB0o
         PlZ8DfoHb0LkrOa8AwRhC15ztwl+z+gIiHiM1zXQkpqxB5cPoRJKcdwthiA/+gn4IEzP
         0/Tg==
X-Gm-Message-State: AOJu0Yy2RTBlXE8xrG+T4jEpqBkqUqMvNBFcgt4A0E8iT/Z2q0Nj0vw+
	YA3BWSJxiPGWDwDO8TakdZAERu3FQ4qfGBB7WxqqctKSOnaiCGzMrYxtqrcdROif
X-Gm-Gg: AR+sD12Dh+WpNxc/JXsJx1x0PkLCLKlJ+Onp7AODx9mPohoYoTTy5naMsyUmwetARO9
	uNMFHgvQ1OBvXNcRy696T03thzGai0RCy7/vyczMD4VqXpfgL1qlfCX+e6WE1T22JWig3BLpoNy
	aYYn8G0BcCEvFlee0YXf554SdLoZGw7wMqUxWglQn1zXVk8l7udVMdPPsoQG0707WBDP5r+wDn2
	w3bfjwAUYB6vzAp/2psGc5HiArrc4o0V9oq1Tf5quejTmXvbJGiYIWnI8I1drhMAmccfL0UUImN
	bn25AsMqbAQ62w1CJwu4UEYg7OicUUzvqZEIDOogjFSaU0DY0U8cfrrZU3EuPx8oWcsqgytgxOZ
	/urp+5IyLWQHXToBCf7y9DD0S0KFYdCkuxaho3rMPbIRt+vwt7cwyYfT93oEJrL6P8plPDBy1Si
	MGMYG21JGZOqO3e/v2P3e3QXxPufRizVF6WEpEuO832QuWF45u5B/s+5rip5mp1hobP3mxR5fua
	sSkJL4gT0pQu0XPjeUiZVhr0ljFYnmlVTKxxl8EkjVX+8JMG+kw2a5291ppfv7lEg==
X-Received: by 2002:a05:600c:8b4c:b0:493:bb6b:5bb5 with SMTP id 5b1f17b1804b1-4994e7c4de5mr282052215e9.13.1786108781343;
        Fri, 07 Aug 2026 06:19:41 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995427a244sm144125015e9.10.2026.08.07.06.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:19:40 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	netdev@vger.kernel.org
Subject: [PATCH io_uring 00/16] zcrx update for-7.3
Date: Fri,  7 Aug 2026 14:19:18 +0100
Message-ID: <cover.1786108672.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

zcrx update for 7.3. Patch 1 fixes RQ processing over-throttling,
which shows up with larger page sizes. Patches 2-5 makes the RQ
use more scalable for multi-CPU setups, including softirq running
on a different CPU from CPU. Patches 9-16 implement dynamic area
provisioning.

Pavel Begunkov (16):
  io_uring/zcrx: scale refilling with large pages
  io_uring/zcrx: move RQ head/tail to separate cache lines
  io_uring/zcrx: add RQ iterator
  io_uring/zcrx: cache RQ tail
  io_uring/zcrx: coalesce same-niov RQEs on refill
  io_uring/zcrx: constify area_reg on import
  io_urint/zcrx: narrow var scope in io_zcrx_recv_skb()
  io_uring/zcrx: don't reload skb_shinfo
  io_uring/zcrx: add helper for deriving area token
  io_uring/zcrx: don't pass ifq_reg to area creation
  io_uring/zcrx: split dmabuf unmap and release
  io_uring/zcrx: unmap under netdev lock
  io_uring/zcrx: move freelist lock to struct zcrx
  io_uring/zcrx: keep array of areas
  io_uring/zcrx: lock area creation with pp_lock
  io_uring/zcrx: add dynamic area provisioning

 include/uapi/linux/io_uring/zcrx.h |   7 +
 io_uring/query.c                   |   2 +-
 io_uring/zcrx.c                    | 398 +++++++++++++++++++++--------
 io_uring/zcrx.h                    |  15 +-
 4 files changed, 305 insertions(+), 117 deletions(-)

-- 
2.54.0

