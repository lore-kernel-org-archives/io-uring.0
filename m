Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1AA43E481
	for <io-uring@vger.kernel.org>; Tue, 31 Mar 2026 21:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774991260; cv=none; b=B17mKPmtU4UftcZuMNQoKCwOCVspbFbSGP+S2BcVvqY1UmFEm/QlaUnk6R78tCxfvtRrgR1qU1bltUrlKyZ+j4UD8Ep7QDYvIpC5OPR4lqe+XQ5VItRPM2bM8KSEuhA1E30OEYiHauPy89WP+4aAQa/V8LSVEzzCq1LSoRrefoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774991260; c=relaxed/simple;
	bh=UE55KhM6GuZncb7T3BcNm6ZqBpgyiOIYY+HsG6tJxEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LDTX9CMjLNXW0xZ/k5a0oWeEnjVtQnmufp/JvWRuO7VYXLGF27U41VEyPcezW0G1fnauqlWE2nuWwp0jTj+HYu+gKyYzBkTN4Emv/RaSB9bMGpbJXlPYeUvIb9cAC1OZUt4fE9/fkfvZjHCRyZSWJSMDVo5VDf9aBtatBjucSZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FqP47ucL; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FqP47ucL"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48374014a77so72850515e9.3
        for <io-uring@vger.kernel.org>; Tue, 31 Mar 2026 14:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774991257; x=1775596057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCiRS8aWbO6iZJae5k6OeoD65iJxJIA1uOfxsYtE9pI=;
        b=FqP47ucLsKwsYkQ6JB+qGo8HTMFU2G6+T/Nww27GTH4hzG59y1zohhGa2Iz1Y0Ay2t
         2M2i/LCR//RLfu4bWW+n2Y2KP78eCK9ocfvuRuWbUPJimsrllkC7tHbyKbmIo+U3y2sR
         Mf3Ox/T6KqcCrURPvT+pKycPB79qEjACuMpR1hBmHJfYs0H9p/qERQCkxi7uf0pZiQMZ
         OA7OoempT0hfMkNa2pWtiTpMv62VEMXkivnkFLaTBl3Eg+rWNd9kH6mENu8zIa/R+5Up
         a9N+lm5DMxtsdckk8w2iD0otTfRyhNsnEMI1jNMkQxxSVEPXsyB+JbCH99Kcz3fLgqON
         MVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774991257; x=1775596057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jCiRS8aWbO6iZJae5k6OeoD65iJxJIA1uOfxsYtE9pI=;
        b=GOO8+ClGO29S6uSu7S3tjJjreAy4e3nVFeA6MN5YsfZi88cQUaILeaZg4bvwylSxmh
         nJH/3BNSNBEb5gf0syfd6doBOxmgC5c3xQiMGmmt7iCb4mzljSmnYBFJhyzYGDtALX57
         6+SG5CTo4/YUKfoXktuzRaL+f6EHJqrRPdpK6PB2aTSYOaUxxCZFSFtIqybzG24fMbUD
         JYaQ00pP7UtU44Bv09xVUonuLL0lYNc3wVlUpt6wg3U+dzfhawxliz5OfPWHMtQsCcIs
         hbHEKR1JusFhXWACj2GrS2cObBXrDJqkh/y9IYTOJmbj4Y/eAES/nZxz/nZ53NQT4rA+
         ezwg==
X-Gm-Message-State: AOJu0YzgGFFmi0zx6+xYwRlqJCMh+UeCER8vJ6FQGO/z09siPU8bwt5j
	TXOY1P7zbNpNHbYGwuEWWwHQsPsw8TDZ4SlbzxNANeHIpzq9wZh1oho/xtJ19Q==
X-Gm-Gg: ATEYQzzwtSXC2cj4ttd+9XJ8YW19NI4Bp6y6jACGdeEkTQ7PKbI0XxLDAMsqTV+JMCV
	Zw+UJLLeGdYIeBh3pBtiBb+W1cPExD9hWivv+7KF9BNjg2HUObD4zu7FHc0L17PLRY41v1t8uib
	zd0Exuo8pK2XUSOqiMnBEEVdU+z4UClnLDifgIc8kJ1t+sMBwe2HJnHfe0RbS4kvcrrD5FHHEXA
	KjTVvEzrwCQ7eGzQQ/TwB9pt0NPUzQo1M70JPJzyEola4mWLbGqjEmRWSxqVvOx2wYDsxUXwQld
	3Fl+SvA7trn+9Vh06XSBwTZortRwQsVxDm0jpOprBqzPPNQ0EMADwKw93H5dzmu9iMo1HAMU3K5
	sG5B19RUc2vs55fMXesojhXdIM8S7h2wixN/g+HBn77YVXgc1Xwsef4RphVATvlflUuf2doictb
	TquKis3p8GMLt8Tk6KuGNgSRTm9XuNknIcNdMLgNni9xPeNbn5qWeif2qie2Sx45l1zzRtgtMDZ
	1EdnqJ0lIZv8gVo1+p5EfRIySKMZCWWbhSpeyqr
X-Received: by 2002:a05:600c:c056:b0:487:300:d9ca with SMTP id 5b1f17b1804b1-488835a5998mr10223415e9.31.1774991257520;
        Tue, 31 Mar 2026 14:07:37 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2570b18sm32431393f8f.31.2026.03.31.14.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 14:07:37 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	axboe@kernel.dk,
	netdev@vger.kernel.org
Subject: [PATCH io_uring-7.1 v3 4/6] io_uring/zcrx: don't clear not allocated niovs
Date: Tue, 31 Mar 2026 22:07:41 +0100
Message-ID: <cbcb7749b5a001ecd4d1c303515ce9403215640c.1774780198.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774780198.git.asml.silence@gmail.com>
References: <cover.1774780198.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that area->is_mapped is set earlier before niovs array is allocated,
io_zcrx_free_area -> io_zcrx_unmap_area in an error path can try to
clear dma addresses for unallocated niovs, fix it.

Fixes: 8c0cab0b7bf76 ("always dma map in advance")
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/zcrx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index 5c0a49340722..d84ad40eae49 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -289,8 +289,10 @@ static void io_zcrx_unmap_area(struct io_zcrx_ifq *ifq,
 		return;
 	area->is_mapped = false;
 
-	for (i = 0; i < area->nia.num_niovs; i++)
-		net_mp_niov_set_dma_addr(&area->nia.niovs[i], 0);
+	if (area->nia.niovs) {
+		for (i = 0; i < area->nia.num_niovs; i++)
+			net_mp_niov_set_dma_addr(&area->nia.niovs[i], 0);
+	}
 
 	if (area->mem.is_dmabuf) {
 		io_release_dmabuf(&area->mem);
-- 
2.53.0

