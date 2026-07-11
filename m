Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FEC384250
	for <io-uring@vger.kernel.org>; Sat, 11 Jul 2026 09:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783761157; cv=none; b=rR+39mqDn+ZXEW0owQvU3cvHxf2XxhTRQ4+u7Qb1Pa7RKtUOIdPmWSZcXi07T5TXe/ToL7jSw+G5hCJdSEUKiBWSnKeEC+SpgNnxrI6Yy3htrDZBErMThMXl7H/k7JpOw42wz+goVkOGnpYwNAKF9T8LDnA84dOZXHI4O/P9WME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783761157; c=relaxed/simple;
	bh=7ymV105ZmGGl8uhZGojt5WY8AiecF8ThAvKoxYEWg6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aGbBg2Hj2Vxqvh0dOl0/zt+vLLAFy7FrrJbK4P8g1Kxsdf0+KY8iR1VyjtYlnOfDwJypNBBU5eVqwoo7O4ITX6DElp248jRyXKUQIJhs16GY5jFba5iBexdGmCUFYjrf6N6DPGKYwDtVf4239O7LZ3/PAbkh1dGlOxq2uM9U72I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=baaSvS2e; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="baaSvS2e"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69c5f6f7a40so871229a12.0
        for <io-uring@vger.kernel.org>; Sat, 11 Jul 2026 02:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783761154; x=1784365954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kn8FUFZkw8BUpz/Wxz48LtuZ9xzNk4cNG4d+dWzPPVE=;
        b=baaSvS2eDYWFuw3ux11Vd3w06CDB28q6/qF6tfI874lB1cK/bj60KPD25WrP9lh8lj
         KGi0n4vITzGijqsJMvJ429F1ZqILnZYAurmg6pmHGYQiUZ2hnTnY+x+JLNhGK0JNep7Y
         WIGJ7ilyBCZc6aMPTVITM8AmyyD80DllR8w6gQL0mvQTOnHJR415p0n/BhFyRcv8g1zW
         oGURNv8dvi4qRsmL7b0dvjKQ84xSGh7ieG+kvdmvSw8IQ63m6mjGJ/zQjBsAbf+qcy+4
         E0qUm5dKvYwmXCewyq8Aon0Nicq1UGHkoHJibHTsjFyYG7W4m7fjWBh/4ugWqyTxSNdg
         pawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783761154; x=1784365954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kn8FUFZkw8BUpz/Wxz48LtuZ9xzNk4cNG4d+dWzPPVE=;
        b=or30X0nvskyA18gg+e4CzeW9f98aYVzkKSjoU1gA0moDz/ApXckm530ptH+E8zdn7D
         PVGdQKr3Y5yIXFY5M/nCbzw92wOiCWYcehz1vPbnv00OrpYGJxSDIDeWOPlmK90Sx7zn
         isWbfBhLuciXmrUaGQ7IpZylTjn7yJp/l/YbLkBB07nXt/mB0cFQbqZ2QqRbpHg4IxAN
         8r1BMdsCzmAkOlL+aabfFK6Qrm5vzV49Ddcw+av5C+Cr5JjDLDR+7q1zTmLvw2xXVP+v
         Rza1dx1qITR3E075TTZjCIXxTmHsTG4yrx9g9bCLUUnDs5kR9hQFq8aEH5olw9TrkX1x
         odHw==
X-Gm-Message-State: AOJu0Yw1miOzsoZW2OPpoDiJ1TJiKKlYPVBbKw/RJ+2uy5FIkWBLpI/G
	bh8gbdGwJ57Q+yuUuwpN8XVCJMYNiMtvF5qw7yAT0ya5RKhmF+s+IGvr+fCo9w==
X-Gm-Gg: AfdE7ck7UKsInP+4wp9YggIM/LlCipSjmXU/h19V+LAFOuRx3IaSkDjCf2iDxolLs0H
	hxtNKvGr01dC1IIVR93759VYfHGGgwFOfFSkL5gKRAQsbwxTdqbRxhdso2yg7tFuK8BuRrmmWq/
	AQZVM9Dv5JsIWNrK6/qI5J253aAH5Ki9M9/yidC/IJw+TszdbOA5kR0ahe3gIiwyv5AQ7xl3PBs
	+iJU9f967J18Np7QulT8Wtnqchur+/l99pGSbkPQQiXijE2/lLF37ROkX+iTbQ7njdBMHdsnAFs
	dr5CjMwucy/EVh7B8pAAqWbtS0cxF9UjAgG3N8IG3s8zwU1/xe1pDuIehed5+2bgHJ6lkfgwsp0
	cYtLt/K6XdxT2O8GFDNDOoFaZMrN6Rg0fjh7IEsJEdYy9e+5LU3wr0rw+/Yi1rc8JWV/SS032ct
	BueWrtBqfWdBV23z6UMvhi44nFesXEztKh4QGZz3Ki8nECxvDcjJixbY60qUHZwfCSQuPv3mhbo
	xr/wgrLG5n1WSIFyPfbIdgT6M8J7sjHOMQWxhABfZpYEc8=
X-Received: by 2002:a05:6402:1ec6:b0:698:e595:a5c with SMTP id 4fb4d7f45d1cf-69c5f0c7963mr1075220a12.6.1783761145236;
        Sat, 11 Jul 2026 02:12:25 -0700 (PDT)
Received: from 127.0.0.1localhost (82-132-221-54.dab.02.net. [82.132.221.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69c60d47188sm681191a12.27.2026.07.11.02.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 02:12:24 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	netdev@vger.kernel.org
Subject: [PATCH review-only 06/17] io_uring/zcrx: constify area_reg on import
Date: Sat, 11 Jul 2026 10:11:29 +0100
Message-ID: <a9f68c5d19cba8243062c5eb15afd0eefede6ade.1783616211.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783616211.git.asml.silence@gmail.com>
References: <cover.1783616211.git.asml.silence@gmail.com>
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
index cb73dca3c1ee..9f21ae61b862 100644
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

