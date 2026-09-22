Received: from mail-pz2-f11.google.com (mail-pz2-f11.google.com [74.125.228.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6337751B171
	for <io-uring@vger.kernel.org>; Tue, 22 Sep 2026 20:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109853; cv=none; b=pzKjkh96F6KsxpyjYg4ioYcdpBFdI3tXMv8KDNIf/XTtqPnQ78wKkSNeYA3JVQC/GZvSht4osI9Svf0RZQ8tw2OFveSBmo+w+JZZM9v4Pv6W/LencZSduQqCibuveTO/hlYTBl/owBTBz74z/I3GP+IsCPrEPapVdEDi2a1TVS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109853; c=relaxed/simple;
	bh=CvPWprNtj2/h7qYd3ZKQiVW+cdulTxr3CaN7at07Ro4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eskU1KiFEKsVVkptWWNG85QDFctsr7+EedgYk1TzQhDywMyJlVFegahE6z9y4aT8nJ+X7q3MFA2WrCascEmSTG6Q3fJ9ThwtSjV0ffTmsywH8Uwf3OXPzgmy5ql9S49a6Q3JPa7aGfEWYlD2sWvJyj88svbYzofAsW5D9btiu8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAANVfL+; arc=none smtp.client-ip=74.125.228.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAANVfL+"
Received: by mail-pz2-f11.google.com with SMTP id 41be03b00d2f7-cc1c2963c92so109109a12.0
        for <io-uring@vger.kernel.org>; Tue, 22 Sep 2026 13:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790109830; x=1790714630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gMpSTn93NNFEOpIjn813NWg6HwKgpaeEXImngFElSS8=;
        b=bAANVfL+RXtqnSbOnA2QMuo0fAQDAC98/9wUjefyttPpqXsPVWmh7OjlESXRXHbokY
         I8yfmpKqZnzJV7PssTgmWGNkG9LLhYXhfR+eFoGwG62IzdfM0sagVP+Hj39tHQNL1BFQ
         rkG2Eg+cyKQzwzJQQ9HMvdsO5fIV5sDRxz81j8irJgAhwx4fA5QNAfhm2gziWf/MjZlP
         Cz3YNLcFYRjRxKnH2B+Op6WWqZEwpl+6NUD0D5EGd+Mr1VZffwMnYIdSV98APmPoXhyN
         6s4erbfPcI8H4O8/pK4Bcweb6bM9Wf8RJUVQUa1gdi09otXZaH+GwP2UjXNWgd6JDEoA
         2yCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109830; x=1790714630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gMpSTn93NNFEOpIjn813NWg6HwKgpaeEXImngFElSS8=;
        b=WVH0ZdktCp6lG+5GyI6Hu9hZ35Kqg2Iqp3YqNsLDJqHwfknGcyYlkGZXGKUPbE/6mo
         AO7HG2lTbHpkBJQ5/HT71JSkXg9uS8mhnuFsi900MgvQMvXs71E1K9xiFewXTFb2g2SV
         IAFiXBcR+emhJSzIL6Tlc1s+u4O5YIrXVA0gs0655iRJkzw5yrl+ql4FXrLG1DwAKeCF
         eYT5YWNuPX0qnpLHAuydR0/ZMis/qJuET8piOvTsywHlAejtGbY7nVbK7jWiwNpwJgfH
         8J8P1xPasBR73+aVB3Ky/Jtsv0dgfKNP+/z66eQgVlJa0mPzuQ4NT3xLTPSAabZiaBtQ
         ugVg==
X-Forwarded-Encrypted: i=1; AKwUvBwN8LUCTCzHi1l33F8hQLRZjMaUmeIt9iVZp7rnjgdFeUbZ7iFj8egHoe3cdVkRUz/V9s8k3TNsNQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kKMceI9Gs2TS3c+gCO2oejJ01CC1lDmtoCfBHbYCTHz3zOXQw3
	dVpGkQLv5yU791pa/3ZwCfzQJG0pALso3H9mqTbzo8yzzL7dKjn0CVNn
X-Gm-Gg: AYBFou2JTJOTU0hI+YRZ5YqmruakUmZAWqwU/d/Fl7rC0ciCJ2O1mhpSjR8l0HZqMPo
	xoOZ+e/6+rT5ZSZl25uu4PMQsFGXBAt4kPC3+JzxDhJ3kUoMErKWlvJ5m0+JS0cowN+Rv9mknCy
	adSk9So1YRoFO37sMek9lkwNwKjRwtVZWEy/ngZetfGErhmPv4J6y2u2SP39lP/uO9iCvoh0VPZ
	nnXvxT3mo4B694wXN7ZCh1LmEGq1QQ84REaTlOFaL4wZ4Tc4JBJjxqxB1DkZ8RkHg0mbwhhphEm
	DXpqyfu7hHCtBUzoZEp7B4AVC9ygVeNIm+jIgR7mM87hFwAse//0sMnDrwPG4tQYSeiX5hKRZ7L
	CU7S4/PRtepLIlmp+QBJQKbfS3TEW5Er5FY276w4gU7UYpbncJOf9nQ0p6KCgrjMhNy8BKfZKH5
	ch+pujelKa6yGGqBIKAoS0p7Jzifyk62PojUo9UJ0A62+rpg19HXSpiqcKLBS0V84=
X-Received: by 2002:a05:6a00:854:b0:87c:9094:b72f with SMTP id d2e1a72fcca58-87d1a7af70bmr703595b3a.12.1790109829787;
        Tue, 22 Sep 2026 13:43:49 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:8::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d4c483asm289145b3a.21.2026.09.22.13.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:43:49 -0700 (PDT)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	hawk@kernel.org,
	ilias.apalodimas@linaro.org,
	asml.silence@gmail.com,
	axboe@kernel.dk,
	sdf@fomichev.me,
	bobbyeshleman@meta.com,
	almasrymina@google.com,
	kaiyuanz@google.com,
	linux-kernel@vger.kernel.org,
	io-uring@vger.kernel.org
Subject: [PATCH net-next 0/3] net: consolidate net_iov freelist and DMA handling
Date: Tue, 22 Sep 2026 13:43:45 -0700
Message-ID: <20260922204348.717198-1-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Follow up on the recently merged devmem gen_pool removal by consolidating
the remaining net_iov freelist and DMA-address handling.

- move shared freelist state and operations into net_iov_area
- switch devmem to public memory-provider helpers and reject DMA
  addresses that cannot be represented
- decode stored DMA addresses for TX on 32-bit systems with 64-bit
  dma_addr_t

Stanislav Fomichev (3):
  net: netmem: add net_iov_area freelist helpers
  net: devmem: use memory provider helpers for net_iovs
  net: devmem: decode DMA addresses for TX

 include/linux/skbuff.h          |  7 ++-
 include/net/netmem.h            | 55 ++++++++++++++++++++++-
 include/net/page_pool/helpers.h | 10 +----
 io_uring/zcrx.c                 | 25 ++++-------
 io_uring/zcrx.h                 |  4 --
 net/core/devmem.c               | 77 +++++++++++++++------------------
 net/core/devmem.h               |  7 ++-
 net/core/page_pool_priv.h       | 14 +-----
 8 files changed, 108 insertions(+), 91 deletions(-)

-- 
2.53.0-Meta

