Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FC248C8CB
	for <io-uring@vger.kernel.org>; Fri,  7 Aug 2026 13:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108804; cv=none; b=rosQWII9To13YKaqVsiRR5ebZNV8aV0PZS+OuBUqxbpNCL05jOXO2O8zhhh8otcsAcx2VGR3CuxfsM09InFNO39YAkIByChnJYBB9DGj2yBos5cJyKg5ECrRmo6re6iHa/L0zDurgRdUycCHJRJYERZVchgG2IdW68um7a/nuCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108804; c=relaxed/simple;
	bh=NG+/rgzHAv6MDNfeFWrG2P9/U23Edpgb2yNwIiBT1Ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SWVqbfSmLoI1egi09SpGIHtYgehM+1I6pk27kd2kzeTH9ozjwXfrkOFcmDlDejTDsKc3QK7xWC8d2UufbJ5yObtBYNqDCgeCay18/ADCLimgmcWXlOX+SS/KaCEFQQjQJJk1Q8rgESTnnzzfHhFCiHbt9nuLj0dqPyYLCz1oT3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGkB5VGK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGkB5VGK"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49800c6a846so27563375e9.3
        for <io-uring@vger.kernel.org>; Fri, 07 Aug 2026 06:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108796; x=1786713596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D+9t8ch659Yhm+Hv1XmNdLGapWGQy+4Zla8E93djIqg=;
        b=bGkB5VGK0dOVdvbaIHIszpbNamnVjga78RxB57hXoJf/vZYP1KYx5H2aa29AnhDzID
         6BpjF5ou/QQdzErWsFYg3nS3kkk2pcrwQuLq/CMdo16wpZS1e924vRS0Q7D33ZhzNRsq
         KAPDhmaKmRvqNCZAXemxA85WcPqgYV85lpIoAyB0SjNq5Ozs2C7babdR3ts6gC+LM1R1
         5HRMOT7vmQwNXkMQC1MCDkkGqYVkzxyRdVctbSxxjb4BrBOkCdLO9OklbJ9CeCECLHyz
         pgmprGLYyP8vhX3QCNXPlDkok7M/0I0BvjBx8t0rJzv0New5JyzSWfVpyvDjPr1klUhV
         6fVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108796; x=1786713596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D+9t8ch659Yhm+Hv1XmNdLGapWGQy+4Zla8E93djIqg=;
        b=iRVDIQgTDIQN3dOixc7joIDFUyKWVR6NyTrTclSMQG0JOjqxlpoTnRxNnpYUpPVe69
         ba7vns7fGntaoKPc+pkiwdOhVkd9OWCdxGLsBiJgKrzZAgdSKBS5iJi4qCOz9KLZnvpa
         Wks/ZZvlVfdfJ70tNOglfL80jI2azpcBHY4WhmaqMlgQ31nATx54/U3fns2I8SGDVPm2
         J+5fzZ/tUbF/iudDK0LqXN+WUCDjeQHcB8U1UOvFTQ/4D5L/FxBQjTQS3C9VVK+gzknm
         Jgm+ozvEy3xDl1wa58j8qs2y5UoCwMJNdwRV6Kn3xtOHbSojJ7mVzy3RAaTODhWbw9u/
         fQgA==
X-Gm-Message-State: AOJu0YxcLQWWQKO4OWJyyEczM5pkgSF4jjGJCZyLRQX2wX5/kNLM69JD
	vOQVTqDD3ORrkmJL7rs1FiLsEMNsjob1Wb6wsp3bW85ayMEmDumbTGX1w0egQJUr
X-Gm-Gg: AR+sD121a8/Y/MkJodrtaiF3CG4z32rBSFb8f+S5fZ7q+CdK3esz0eIK6j4Zwax4ze9
	jizg/i3vS8EmrEQWIgdNl1y1KUY8yJJouiMuEretT7SICEPcDMqF8GQcM5z+jxwd3BDSiywlbyv
	5kHrVfIkL+dAwD8PmH6DJzyRfLEslLWc8CBMX+MM40SH+PgS4ug4z+BxkaKo6WWG/MaVQGofUym
	DdcOEA62rw+wrAvpOVcyjCvwep1d6xloTSad1B3ym9ZuPjAeiNKhmnaijQ876GX1NoPo1Hc7Gby
	dISXvlOvldCnjreW/Ji8JHVATcetFARJxY9qJa4ENaf7vqfTETtr7IjtWmarONsw/B9rBcUA4hD
	fhEFTm68UHCXiaI0fM6bbX4+yPZ/yc0Hw2eQ1Tg6ZYdKEnPF5m3G9csESjweAP0Ji4YaEftrTCL
	3lAdemaguFs38HmDT7T+RuynYy+2ZD7MnC8/ShPWrwO9nPEC0M4COH94xDwip7eviUv/GL84T6B
	fL0IKtJmZKN7NUrThg+04S5HX6lkKRJmWPi9NkWXPXe+fe1GIv3pE0Nw4qqB9wdUAoy1+XNP0H0
	iQ==
X-Received: by 2002:a05:600c:6c50:b0:499:48bb:417e with SMTP id 5b1f17b1804b1-49959e0176bmr101727645e9.2.1786108796252;
        Fri, 07 Aug 2026 06:19:56 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995427a244sm144125015e9.10.2026.08.07.06.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:19:55 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	netdev@vger.kernel.org
Subject: [PATCH io_uring 11/16] io_uring/zcrx: split dmabuf unmap and release
Date: Fri,  7 Aug 2026 14:19:29 +0100
Message-ID: <bd8c1fd8dac85ce0cf839b389ecd6050761965ca.1786108672.git.asml.silence@gmail.com>
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

Until now unmapping and destroying dmabuf were the same thing. To keep
it consistent with non-dmabuf, split it into two separate helpers. Unmap
destroys mappings and attachements as it should, and release only
putting down the dmabuf fd reference.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/zcrx.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index a142d6035f7e..91d0d823f482 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -121,21 +121,25 @@ static int io_populate_area_dma(struct io_zcrx_ifq *ifq,
 	return 0;
 }
 
-static void io_release_dmabuf(struct io_zcrx_mem *mem)
+static void io_unmap_dmabuf(struct io_zcrx_mem *mem)
 {
 	if (!IS_ENABLED(CONFIG_DMA_SHARED_BUFFER))
 		return;
-
 	if (mem->sgt)
 		dma_buf_unmap_attachment_unlocked(mem->attach, mem->sgt,
 						  DMA_FROM_DEVICE);
 	if (mem->attach)
 		dma_buf_detach(mem->dmabuf, mem->attach);
-	if (mem->dmabuf)
-		dma_buf_put(mem->dmabuf);
-
 	mem->sgt = NULL;
 	mem->attach = NULL;
+}
+
+static void io_release_dmabuf(struct io_zcrx_mem *mem)
+{
+	if (!IS_ENABLED(CONFIG_DMA_SHARED_BUFFER))
+		return;
+	if (mem->dmabuf)
+		dma_buf_put(mem->dmabuf);
 	mem->dmabuf = NULL;
 }
 
@@ -190,6 +194,7 @@ static int io_import_dmabuf(struct io_zcrx_ifq *ifq,
 	mem->size = len;
 	return 0;
 err:
+	io_unmap_dmabuf(mem);
 	io_release_dmabuf(mem);
 	return ret;
 }
@@ -317,7 +322,7 @@ static void io_zcrx_unmap_area(struct io_zcrx_ifq *ifq,
 	}
 
 	if (area->mem.is_dmabuf) {
-		io_release_dmabuf(&area->mem);
+		io_unmap_dmabuf(&area->mem);
 	} else {
 		dma_unmap_sgtable(ifq->dev, &area->mem.page_sg_table,
 				  DMA_FROM_DEVICE, IO_DMA_ATTR);
-- 
2.54.0

