Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D3D411A05
	for <io-uring@vger.kernel.org>; Fri,  7 Aug 2026 13:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108797; cv=none; b=e0XB40NRr15AF+Lbjc90HsCUU5DLObv+TdIX7L+TPpWnn+HFg89YjquWLNdbUTuaCe0oFoq/JXGfCT5B33XoCHIyyoRAFDjtVCo1sfHhyQ2lZg6XC75EepVrdaVJ9oXyzddjRStQfPBJUxCFvwCSNk3SnJYR0VjCfttyjY4rZoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108797; c=relaxed/simple;
	bh=ktmoXFZuFIGeNodDPoCN++Z+HEof+owlAdKgvlHsDPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UrTTzuNy9ht8svpGO7w5AKLgyjNHobjIxZ/bJzHb5HUV/WfH5UkZ/yTzkW8nFuWs+9N1jC2j6BWM+7lYyc7awU1ceaBbCMcsRnzoDNmUsHNMuaiZ48jPkAM8DJzdo3utogHcZ4/3eGnQxDlG72wJj8LP/kjR8zuiresFWhank68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZOE6f2xS; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZOE6f2xS"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495635a85d2so28131305e9.0
        for <io-uring@vger.kernel.org>; Fri, 07 Aug 2026 06:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108789; x=1786713589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iQhF0TcWQVe1xV9f/49SFwwFGfCjJ2hCpO6NQ7/d1Qc=;
        b=ZOE6f2xSDcb2xuZ5ZFFH5GQDmqT68p1J+CvC+/0MiNdnQFOlm3c2yfvGy1iap+J2Av
         Mvcwu/xbfDAGEn9XDRJbVAResLjl47/xRr8pkuCwpFPSCeCntF0jGfwKY+ilrv73YarY
         ESBUOEaJme9m09Ve52AwJjO9bFSTGGa4r4dDe2qHb7VzB0TiRtfmvfkjv/gSkLW81f9v
         n9rfad6AEnBLSWzOvG0sAzdByH4DG7L0l0buZ1iC6lQmbtXqPvmX3IOLfbwAInfhnDUA
         vMtjKgeBH19DQmXDQOg30lMLxjC8hm4lblSVzWfNX+Y129f9Fe33ediPvKD1Ug3VLc1+
         1rMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108789; x=1786713589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iQhF0TcWQVe1xV9f/49SFwwFGfCjJ2hCpO6NQ7/d1Qc=;
        b=JWzJKmKHoCpBo/5XwdQ2nwGYqkkoIL/bV4PvXVwnb9dAy1PKge2YhIdBquR67TTMSV
         4+Zz5ANSTsItpw/q1NWiMFvYF8/MXLV4A5nCQnNYMqXFxBnL4ZuUFrbe39W8bksKuOIP
         CS/s/pVnGdwS+nsYn/TeQ5uts4/8dJ3lUSoSF3Rjs2rIu/vSrFuI7YRw6uiWjxyHMUpe
         gQJ+C0gM4f4APmO+4q4wwB7nKl378NAruHeVswJCpb7BXoAFkhwd0xBZgH7CuZ4d9Z6H
         QlI9eV4Uj/xusa7QzMzq6F9Q6YhMUEIrRsRkhSRc3EhDJIeofx7P+dOdPMY3ix8XliQP
         1kRA==
X-Gm-Message-State: AOJu0Yz5ChnSAYFQnR5xCU2YqR+dbU9u/VfxPyrVzpasOQpsVXhfJ3DZ
	YkhBkhSQlv52ycvM3Bk07FPsUsMiH4U4G2SpWoctwGBE1ETGPo6QEepQ6w+llBXz
X-Gm-Gg: AR+sD10mkmEdKuO70OT9U5dDc357DHEUZuMit4iLCvtGdjjEGsdnzI/Ob+Q458XcKgx
	j/dZeyeUWlEMs3iKILltEyMv+/j/x28HecriFsGLwGG+jXHwonSjbs/lLrXYBiWHiWy3ZRuIeWB
	yFai8BCKmP5Qx6BRxfcGROTH8mjy9Hmhrjir0vLg7lrmrziFr47Qhgz0fVn+FwVsXC2G1Ub9CTQ
	ERDS0BksuGDbH2PiG4/PBDnJQ5ayufCMtAXjZ0vekWlj6lDQI4P/8ZmPjckTffcfM+lc+5BSoAZ
	mTTJ/l3xValSIayvTi4JGJC/DxI8U8YFCN42wHAp1YSrrDk+vloGbmDZMgdJ9Fw2tanA3r9F8u8
	M+wlQzDOWWUJDl7/qZQbANLBog1jhMi1Woid1OQgGYBCGs4eyHFFpFRsrX7gVelHf4RhGy0ih3/
	gj+MZJ5OZJwq8GIqJWHSYqYQoW2HtR6WvoPvrFvmTQvMF7b05zmfP8Qc8A5XT/ViDQdcp38alap
	fLzV4E6nbWqAcZKL3Prfntq3EC85A9wASLIjdSWnpK+HwCEP2CCyHVwAjCpOSy33DWob1AFWKTe
X-Received: by 2002:a05:600c:a202:b0:495:7838:7e25 with SMTP id 5b1f17b1804b1-4994e7d01b1mr234241055e9.15.1786108788678;
        Fri, 07 Aug 2026 06:19:48 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995427a244sm144125015e9.10.2026.08.07.06.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:19:47 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	netdev@vger.kernel.org
Subject: [PATCH io_uring 06/16] io_uring/zcrx: constify area_reg on import
Date: Fri,  7 Aug 2026 14:19:24 +0100
Message-ID: <2cd4a3e43875576587c900ebdf8f1fb4af266e4a.1786108672.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1786108672.git.asml.silence@gmail.com>
References: <cover.1786108672.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_import_area() doesn't modify its struct io_uring_zcrx_area_reg
argument, add const to enforce that, it'll make later modifications
easier.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/zcrx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index 691206a7721b..50d075fb3825 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -136,7 +136,7 @@ static void io_release_dmabuf(struct io_zcrx_mem *mem)
 
 static int io_import_dmabuf(struct io_zcrx_ifq *ifq,
 			    struct io_zcrx_mem *mem,
-			    struct io_uring_zcrx_area_reg *area_reg)
+			    const struct io_uring_zcrx_area_reg *area_reg)
 {
 	unsigned long off = (unsigned long)area_reg->addr;
 	unsigned long len = (unsigned long)area_reg->len;
@@ -208,7 +208,7 @@ static unsigned long io_count_account_pages(struct page **pages, unsigned nr_pag
 
 static int io_import_umem(struct io_zcrx_ifq *ifq,
 			  struct io_zcrx_mem *mem,
-			  struct io_uring_zcrx_area_reg *area_reg)
+			  const struct io_uring_zcrx_area_reg *area_reg)
 {
 	struct page **pages;
 	int nr_pages, ret;
@@ -274,7 +274,7 @@ static void io_release_area_mem(struct io_zcrx_mem *mem)
 
 static int io_import_area(struct io_zcrx_ifq *ifq,
 			  struct io_zcrx_mem *mem,
-			  struct io_uring_zcrx_area_reg *area_reg)
+			  const struct io_uring_zcrx_area_reg *area_reg)
 {
 	int ret;
 
-- 
2.54.0

