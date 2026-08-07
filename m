Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE8C47A872
	for <io-uring@vger.kernel.org>; Fri,  7 Aug 2026 13:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108802; cv=none; b=aDSsoSMBInjKkdu7Gd9w0AWz7VnxoAn4jgY0As3vSsR9M2kMtCAISA+ChtF5k6ip6Sch7ppBZ7mO06v7Jix+3BRiQ46PfB0Uti3xzozgFX/HV9JrqFnS2ZppQd7+4fgkYAQaK6KiK5AzjEU/Wsi0sNoXJ1ceaMLurOZgCdvmrNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108802; c=relaxed/simple;
	bh=XEPKuFkhwe8ZEQpD+ybrZ931bpYJrWOlA0mPf2Iby4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gmi8b1gzmpqiH9zAucSfsjuHqFJC1AyyZ98GA6KINtdFSv7kMCC5mK/5Y+2noFr3P3WRd7arRpGaooIb6vQvwvjQHNHbzoYPPuJB9Yk7of5rqYcSZDIhILHhnHZdmx+4EHCI6uAnkm5PLG46fwg+QR/W4DpO+sWRecUmYRJ/QfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJ67GseK; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJ67GseK"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954d29264cso17729785e9.2
        for <io-uring@vger.kernel.org>; Fri, 07 Aug 2026 06:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108795; x=1786713595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JFwnycb9pT/CeFOR+3rV5yTDz73HQ1IY/EPJ9WblqSc=;
        b=kJ67GseKWztVBEt1G6HCpMjmx57HHOTCojzwIJzRYpAWdcL8AyoRTIrvFtnen/cB/U
         gJvRkOnwf/kP0dPNdpI4P8aSp6H49iskdMSH7aKWCcu1CvfIpbzp4MQUkMHk4Ht3NfbX
         pqZFTzDF4FpAn/U9/2sMYsy3N5Pu3W1LgHGX746kdSj/UfLRBNui87lZXEKsgz6riiff
         FRGOWSl7pQRAYxy3e+CvcJolD972O+5ZFMiPvM+/RlQH3Jt2u+kG2NEjge0A79I0ubru
         3LD0AjLJd0aJy8mz4vLNmYbo8PK8U8hrNLYhN5uhdzeu+jduBP12AalmBiyk25LUTZmZ
         obiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108795; x=1786713595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JFwnycb9pT/CeFOR+3rV5yTDz73HQ1IY/EPJ9WblqSc=;
        b=l2EkFeinwK6EZdMyQIzrS7UA6h4CuwilnXtJjjsp1AIZxPm4fPwntHl0I/SEKuX+Rp
         gt/pwXC47JkW4BU0Ec2/Z9Cq4+RgIB9jHGEJiWyXmcXH0nnpEku8WmKl25+gbBIUKUAu
         6qnHlFAKGrQgmY1FPPOAHIQCokImY3FFJgObmbr4UGmlRnCJrLMg8J1w/bnAi5pBV2nf
         Zc0vEpyXFtmFSvQ3ajrvPUrIYDh2osGBN2K95hke2/9PLQubvothp222fwEIMWsQKFUh
         lFcTYiifvfABOSo1t3vWXo1EdSeoYqXTs2y8shOFA810I71MQqiXSBSbzjmERtLM9hyG
         zKyg==
X-Gm-Message-State: AOJu0Yx8yXg2G+n1yM7OHxLy53YmxeWAKtdGLE4/X42ncnIA3uMoTnrv
	cLy4u65+Xtnlw7Fsmsm5+fsOdS1oATCoDxF7cYqpDhRVCdrlYMJmE0D+1fROLkJH
X-Gm-Gg: AR+sD13CwDqyQAyxF+lwVPOzMkCxNjwRS+PSsxZnOgI+SmHTee/3DDjKeebEY3u9Znc
	DqTCFBMFlkIDhWiMTTm7SkEmtOD9StMU2bOHDM/tMRa/Xz3DtXWjc/DWSE/XSD/XkfkNDZThhvC
	u0K3uYre/ZxJV139oV3MXWGrUk3+tK9sZRhPod+8F29tfNxiZASxw2caizDuvOyv+Iar3s3NShR
	b1wmSk1P/MFtAX0NsdDLkSh5JqkGaaacB3KVoKppZrANyPJ+NtUpCuH1jmb0pZQxEC5iFEbgMD+
	RDX6Z3mI3qEQq+MZD3inrMixQkL5cLfh/Atdvwqe3X6eLKl3hm1FBzwHmKzPnf9b1kRQg6cNZ8p
	rJVve4KiPIszhDnY6l4c3yJm3cN+ZvrRTz93nOiqemRDo9j8TlePvYZeGRyzqSZBcIV4C5031yq
	vbtdtqru9bksZfVURJpwkzxVb6NS/B2PqlGoY3ODKqxNhMBa7JD0PML1h4nrmDMOu1iRnzcE09L
	Yew1GeUYDfzaDR9e8A2sWyQLPOnzgYL0xEBkQXl+Azu65RKPvTzL47HetbqIYa6GSR+xMjoUVN+
X-Received: by 2002:a05:600c:474a:b0:496:c361:fb96 with SMTP id 5b1f17b1804b1-4994e6db5aemr273450105e9.0.1786108795242;
        Fri, 07 Aug 2026 06:19:55 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995427a244sm144125015e9.10.2026.08.07.06.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:19:54 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	netdev@vger.kernel.org
Subject: [PATCH io_uring 10/16] io_uring/zcrx: don't pass ifq_reg to area creation
Date: Fri,  7 Aug 2026 14:19:28 +0100
Message-ID: <76751ee4747abb4893058fcaaa36895dfe24a297.1786108672.git.asml.silence@gmail.com>
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

We might want to create an area without having an instance of struct
io_uring_zcrx_ifq_reg. Extract a helper that doesn't have the ifq
registration structure as an argument but takes the buf length
explicitly.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/zcrx.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index 5b46e1335079..a142d6035f7e 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -459,21 +459,22 @@ static int io_zcrx_append_area(struct io_zcrx_ifq *ifq,
 	return 0;
 }
 
-static int io_zcrx_create_area(struct io_zcrx_ifq *ifq,
+static int __zcrx_create_area(struct io_zcrx_ifq *ifq,
 			       struct io_uring_zcrx_area_reg *area_reg,
-			       struct io_uring_zcrx_ifq_reg *reg)
+			       u32 rx_buf_len)
 {
 	int buf_size_shift = PAGE_SHIFT;
 	struct io_zcrx_area *area;
 	unsigned nr_iovs;
 	int i, ret;
 
-	if (reg->rx_buf_len) {
-		if (!is_power_of_2(reg->rx_buf_len) ||
-		     reg->rx_buf_len < PAGE_SIZE)
+	if (rx_buf_len) {
+		if (!is_power_of_2(rx_buf_len) || rx_buf_len < PAGE_SIZE)
 			return -EINVAL;
-		buf_size_shift = ilog2(reg->rx_buf_len);
+		buf_size_shift = ilog2(rx_buf_len);
 	}
+	if (WARN_ON_ONCE(ifq->niov_shift))
+		return -EINVAL;
 	if (!ifq->dev && buf_size_shift != PAGE_SHIFT)
 		return -EOPNOTSUPP;
 
@@ -543,6 +544,13 @@ static int io_zcrx_create_area(struct io_zcrx_ifq *ifq,
 	return ret;
 }
 
+static int io_zcrx_create_area(struct io_zcrx_ifq *ifq,
+			       struct io_uring_zcrx_area_reg *area_reg,
+			       struct io_uring_zcrx_ifq_reg *reg)
+{
+	return __zcrx_create_area(ifq, area_reg, reg->rx_buf_len);
+}
+
 static struct io_zcrx_ifq *io_zcrx_ifq_alloc(struct io_ring_ctx *ctx)
 {
 	struct io_zcrx_ifq *ifq;
-- 
2.54.0

