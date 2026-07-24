Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467C33C2BBA
	for <io-uring@vger.kernel.org>; Fri, 24 Jul 2026 22:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784933963; cv=none; b=rmrrtUS3WIMTBZK7PoThGy9w4uYpBmg2UrLtcgWJjALuSWC10hix2Y5j5RFc32N8x0RvHTDC6ppimePWXxfa6X/4pjI2FDpsOLRIknxW+vSxo7RC8GEqlX+jzPXq4PAW6quvtR8C8FamEsl52JFbNnUbmSmQjtP0WQgnWnQlgi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784933963; c=relaxed/simple;
	bh=sygqJwnUDIr7DtBFQCBWy9IVIbVztIG8pNl+8jNVXYc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GnIjtIrSJqPUQE3ZRwnqSGcpanF4EvzPmqOBThKfJO64mYn2ZGW726tt5vxLblf6BPh2ygn0FQVi/g8q4PjRcKkxZ/k4SHU2/XhNcE0nbPsP/u6gh3LLnJoa+4qW0ZFsk5LHy5WYNciDOTwTK6c25SoxG1LaQLYp2tqQUauZjh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com; spf=pass smtp.mailfrom=openresty.com; dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b=RcICo1bi; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b="RcICo1bi"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9aea40d799so545081a12.0
        for <io-uring@vger.kernel.org>; Fri, 24 Jul 2026 15:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1784933958; x=1785538758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8gdOzRCy0bw9QJF7JbNbjlRf3k3HYYFwR3qhhpvfhNQ=;
        b=RcICo1biDFt0xdYnmluk6SkrxCd5Btpmh8yhdbZPE2jWNeKJ2vAmj4WuPxVcy5PnU9
         u1c07YQSsW26+C+UslsZ0+ypIiYJTKAuG5QQZBOB/+BndHIeY+8Q7PX5Hil1NpYFzsHt
         6SixQzRbfO3G2Q1yZOSt+o0AlnO7YQyjMrY75TuimjPLZ67M1a2dHGaiwUoDErhL1Mie
         ZU1gPIlXEMRhvhJLNXL7eMipfbejuT1Ti7orzDjTMRZ7HnAlUiopu2CULpsopqCICxf0
         R1YGE+1Pq8oZM5c4lPXSPrIz17+VvhYcySNYGKBcoJonV1+R+6rG/srSKknxTOuDLzxH
         Ghzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784933958; x=1785538758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8gdOzRCy0bw9QJF7JbNbjlRf3k3HYYFwR3qhhpvfhNQ=;
        b=Uz5XQ/wwQuMnQBIsBn8/ZmLRQtM2/py+MyWFHz3yE2ye2W08msTX88pH7vqoI6FSi8
         ITYA/gzrmdwi5umNM1YUPN0k58bAl/DBnUrhSCthZY1zcS/MQ7uWb6tLBY2dYBPO+tZC
         WlYRtuqaNsQAKssdX2B9ypQBXzjZuZsf59m9w1JhZMH018lwUNzDFIFOlRI5hlre/Aot
         ZPQVeKb/XjNaCtBRMvSX01JEb0/BODy8++VA9jA6DLfoEvHWVzM1QKzIjZrt9yBWyIta
         +HNGpCWRVC7Q1vflDTLsCZCwTrloTLJ/gPDwCh7qLpkM8il1hXLZaEKkYHalm+FKz7YP
         xK5g==
X-Forwarded-Encrypted: i=1; AHgh+RpK39KBlSSyWYK2L/my6P07fgbB51obyurzNsrwNbesKI0LdjbLXXSy+jx5CyeiOxdAKpOE4XnxKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw/AKwVcmbDGS1HA8pogj8g+IHnZgxZPs7QiQAccCzwyKrRIsU
	aC0OMtRJ2EwV2YcAOT9IX1BG05L+G+FV/Dxh/F21PFofdBUg2gbZY6yRzcqvi9NFgkE65ydmQk/
	bIv/STTBSZw==
X-Gm-Gg: AR+sD11YNyA8ylz0jZx3c4psGCrjhNCTloBosFiL9HottK+0huJpWzCOTr134vhCuIP
	jF6ZLAgV86150JGM75tggIAnJaEVqPQ+B0xKtTDmDrUAc4qXF5y0YAVTFlJ4pzE9iuOtUVO75Qo
	RUZEfZpwmsMj6xg6qxCAr5/OU/QBg4YmEgvq49qjzrZedEVAQ2Hz9R0ZiAaHANdUpnMxsMR+bAO
	GTjFAwrEM6Z/k9vX95+w2CvaOMUtW3LWONdzcRXoskf1x4fgvG4jJEG/Cn+Q+VelxewEr3nTu9J
	GazFzwzOIF6kLsemvXMHulf+hy30FC7lq+xUtOp42wOFBIWhezfuRmnhRUxA17LRa+ut0fWwI7Z
	STE3oBaN9377LTYzCW0/KXFQhTRkebezU8YrCzUcd2Rn5ybrXZqwJAi26AwarXUYzcc1iXIC24F
	Jd0liB12vODDTbvg==
X-Received: by 2002:a05:6a20:4305:b0:3bf:7e2a:e874 with SMTP id adf61e73a8af0-3c67d9b3d82mr283559637.1.1784933958385;
        Fri, 24 Jul 2026 15:59:18 -0700 (PDT)
Received: from integral2.. ([2402:8780:1329:2779:beb7:3f70:1f02:3159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc584433sm2910930eec.23.2026.07.24.15.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 15:59:17 -0700 (PDT)
From: Ammar Faizi <ammarfaizi2@openresty.com>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring Mailing List <io-uring@vger.kernel.org>
Cc: Ammar Faizi <ammarfaizi2@openresty.com>,
	Yichun Zhang <yichun@openresty.com>,
	Christian Mazakas <christian.mazakas@gmail.com>
Subject: [PATCH liburing 2/4] ci: Fix the wrong `cc_pkg` comparison
Date: Sat, 25 Jul 2026 05:59:03 +0700
Message-Id: <20260724225905.747718-3-ammarfaizi2@openresty.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724225905.747718-1-ammarfaizi2@openresty.com>
References: <20260724225905.747718-1-ammarfaizi2@openresty.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 7a65e5a4f294 ("github: Build all newly pushed commits") nested
the `cc_pkg` variable into `build_args`, but the if statement is still
using the old matrix variable. Fix it; the correct variable is
`matrix.build_args.cc_pkg`.

Fixes: 7a65e5a4f294 ("github: Build all newly pushed commits")
Cc: Christian Mazakas <christian.mazakas@gmail.com>
Signed-off-by: Ammar Faizi <ammarfaizi2@openresty.com>
---
 .github/workflows/ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 355541167424..842cdead6fef 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -204,7 +204,7 @@ jobs:
 
       - name: Install Compilers
         run: |
-          if [[ "${{matrix.cc_pkg}}" == "clang" ]]; then \
+          if [[ "${{matrix.build_args.cc_pkg}}" == "clang" ]]; then \
             wget https://apt.llvm.org/llvm.sh -O /tmp/llvm.sh; \
             sudo bash /tmp/llvm.sh 22; \
             sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-22 400; \
-- 
Ammar Faizi

