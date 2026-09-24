Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F5F35674E
	for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 06:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790231729; cv=none; b=kw6dr6oMGEodniL6UauvLwR3MPhqecWMgR8HdHXRD0Ytxm1t+LoLWcp2U2P6lr8O3xnqvsskj0K7fai/dBtwMXqDfqWvUVcG+GAAviJDeDTDhpv5ow1jLKyglD/uxM35oMviAKD6SHUbI7CoRm5e0yK3HRZ+Lms1DAfbKCp+A/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790231729; c=relaxed/simple;
	bh=KwdQfLFN9qP1Uy3/R/YcRZOunp2/x7+DEgYdQS30umw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nVhTLr4Tl1g7Asi09YMv5hKNXIWewdtRrdA0xpwxTxvAD5FVjvz6Hm1VOiM7WvlVUxoCWnjbn6nynsavL4yQE+OtGgR/IbG38NJ/6w1Zo9dM/DSgQY2w20ZwYQiYcihk4kwgTpW7Ju3rm5Yr8rVGLzBa4ZpevSrKvEiRe2yvyCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WB/S2IO/; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WB/S2IO/"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc433d52421so789074a12.3
        for <io-uring@vger.kernel.org>; Wed, 23 Sep 2026 23:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790231727; x=1790836527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Lg8cX0rN3DBpAk0/WdaoBs/N2TVrxi/nNoDNY7O6wQ=;
        b=WB/S2IO//rXoRKsFY2qtbT5OHCjIG7gIDF1KxEOzJEOlWivUzysmjEDZL5E/myYEzP
         iOwBF0iLSus3LUQgxim59rVttHEjXpTfxH/7j9zfjEYq2D+DllREyBfROhiokJyoGgYS
         L/hvmAZJWn4DVwHWmbiBiYpVi6wy6sMC0YJVZ4OOWAUwiE5zoNnTF+yoy9N3c2w/2zxF
         xtoGal1OT7t1U8Es1njO+uLrowjdn3mUDIsYXyoDGwMFWj7K7ITd0mmqZlm8+qMHNjHU
         uALXdzvD6sKn37oG58YtL74X0Fxi+KiPbrQikOMuXhpP8ejRVn7Ov/Zr51nEwGFYesc0
         ERzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790231727; x=1790836527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Lg8cX0rN3DBpAk0/WdaoBs/N2TVrxi/nNoDNY7O6wQ=;
        b=dFLjmnlkWyqdxDw3xk4hYaMs4ned51eFVu27eAnRCgGPgcBdT6FuBFntxoOO6tq0ch
         v+lAvdAss4Odpfep780fk7cS8dnY+ohIW/duBzHkngGd5CjsOwsZe2jDUrvll4KU3grH
         gccB0UncPFoJIKmxErB1NeHwc2Fzdlt1eicaq2pVJecNLF4Ff0RQlVj4Jo0D0P9e1lil
         k3YyhanpiJOuCU0lkz5Rkcvab72SAy4Em78vCck9Jp3Opx6Nc2NDeEKtPtTMOP6JzlEW
         heu2GjXRJmJ6/2f4/IS2w1uNhAtD0rHxgjp0HToWDAWiTEqTW9Jpi1bmLVvzBhdsE00z
         0nfQ==
X-Gm-Message-State: AFuF++liKZji33uYFAs94qJ6BqtNOq3UVcmzQrT5VF9GNDB8WMeXQzEp
	ZZTZvD+8hYwMME3gAki1L351mhjVlUIoOxVT63818jXtDHWhrkQgTQV1
X-Gm-Gg: AYBFou13g+KCeMtjIJMZDkg36UJa+Kjy6SHrjIq4xQtBIqGN6+sXZo/oRB9ve6CqfoL
	E3LzvfS+dJ9bjbDRR60V/4b06SVRcf6E7G5lh3LpWvq703HUtTM/+9WrP7dWsbQL1eh47mpk/lA
	irojqj8qTtHFjWy5voYqryiwnDXQCtKxxAinst1cspUSD4MB1tpv4omQeTweBmFWhhhAQ3e8Gck
	QFcQ61r2agncneMntEaCD26ZXbDu+wx0TTjpRP93keP1uL/j1Xu5zIRbg6fXrHtXYfa03HbS4oG
	st+m/P5W73GVJf/g5N8ibN4M8wrPB4dNksKgqyGmBJoIUgoYQ8h5/sIJzLauvh3Mwoq6csGZdGz
	OvekfeTc+fsTm2ZMTcXE9KdA9O5niXw3W9l4n+A0Zq2f8zjU7BkQLj3I1QpxqUQCxLRuuN/n+l7
	9KIdouzRRV/e+ywz9RqVdUc7ozxmqiWLOtflxB5xaoslcSv3Fao5rpg10qmwgW7N1d5frmq3zVS
	xDJCxlP24KHreFDy/ItiOu9lyAUkvmPpXvQPPceMcWA4PbiGw89mUR35W5zrZf35b5f22zErkBx
	XMIgXGwHYt8UAcXU8pex
X-Received: by 2002:a17:90b:55c3:b0:39e:6a81:f34a with SMTP id 98e67ed59e1d1-3a098bb630amr1174600a91.36.1790231727242;
        Wed, 23 Sep 2026 23:35:27 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a096b8753csm3109897a91.0.2026.09.23.23.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:35:26 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v2 0/2] io_uring: fix CQE32 and CQE_MIXED ring refill handling
Date: Thu, 24 Sep 2026 06:35:23 +0000
Message-ID: <20260924063525.2500081-1-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260919203516.2581409-1-benquike@gmail.com>
References: <20260919203516.2581409-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two issues in io_cqe_cache_refill() and
io_fill_nop_cqe() for 32-byte CQEs:

1. Restrict skip CQE insertion at off + 1 == ctx->cq_entries to
   IORING_SETUP_CQE_MIXED rings so pure IORING_SETUP_CQE32 rings do not
   emit bogus IORING_CQE_F_SKIP entries.
2. Require 3 free CQ slots in io_fill_nop_cqe() before emitting a skip
   CQE for a 32-byte CQE wrapping across the end of an
   IORING_SETUP_CQE_MIXED ring, preventing an orphan skip CQE when fewer
   than 3 slots are free.

Changes in v2:
- Split into a 2-patch series and drop the third hunk from v1, as
  requested by Jens Axboe.

Hui Peng (2):
  io_uring: only insert skip CQE for IORING_SETUP_CQE_MIXED
  io_uring: require 3 free CQ slots for 32b CQE in io_fill_nop_cqe()

 io_uring/io_uring.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
2.55.0.1082.g2b9226bbc0-goog

