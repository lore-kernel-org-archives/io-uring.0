Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793751058;
	b=4CaUsLbdCcYhgWE3My9FylLiJjbrQQO5NOBjjnEuZDsByHfab5xbLOLx6/Dlq5aWH1q1
	 ACGb/NjrnXa3kkd8a/YtWxNWW6PCaAX2io7zuEHc07J6voky97Jk3lmafcpddZRtKzCM4
	 5rUjUj6UlDuOoknpuoUl4jofaKE9nXp1qUuV2I/diZEjRfv9QPhe3zI+SDPMLqvzUChtd
	 HB2w5mg2Y4g7yTY5t4bolP5zeIDv841s32IMep0Cmu9qiedaV7J8BWi1jAWZmJZSiRqrP
	 JlxfJxHk82XhgchJhWafzCfcMpfw3VKKmSYWDxM2pyMvaua9GOgCESZkn4OlifsYMrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=C9fD5wGZku9Jq6jHpw1PlebB4Fcq0l3o/hV8S9abTEU=;
	b=0t6++RjZUTlAakkqi/NjWe23diI/xfA674j0/aJqnr9IF8uSMLLlC74sLxQyG5zUQGxH
	 3hy2NG3Y/YlrN8jfzKaZ4/ATm2gp3XsrksgFSlDvfX/vOjALLEzJbznGCVcYCBlV18Kae
	 ZMgE0l5awCSPV//b9shXHQE2clteRpJzlZDMrEAll6iOdYI4P+F2+MXaYWp43KXiqYAmB
	 YWDxRkE2A/lmMy3h/gXC27NNcuYn45avcaERAYGBKa7WwsXj5QCHLb3qL6roS4LgYg8iT
	 c0Nl8XDwypBcg0T14obCdDi2NEu+q3xuvTC+jtioJrBbyMPqhYAcx64DeSZ6uf4M3KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cLpint65;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A5E606A31B
	for <io-uring@vger.kernel.org>; Wed,  4 Nov 2026 00:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95A5E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cLpint65
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so917605e9.1
        for <io-uring@vger.kernel.org>; Tue, 03 Nov 2026 16:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793751056; x=1794355856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C9fD5wGZku9Jq6jHpw1PlebB4Fcq0l3o/hV8S9abTEU=;
        b=cLpint65TCuJKQClZwWDr1rSVv9UWfVRNGyv3j923NKPd+c26alPzYdLINtYO+UEPa
         WqfLPVR8fC1mP/2iyywGgaI3VD2g7T4OY9ivKw9F5DEQNJWVmS/4h5ZX+IRVC2y0fB+x
         Df16wMNhxJHiJM/2aAy9zSLdSHRqOpDClyizA6QJUVYlC5z1D4Q7k3GWmm/sJ0eyJgiy
         zaot8XaAyyao70jppeUcxR2fFG8eJ00NjAnXLrERcutCKIHlhUoa5IOUmZo5qRtO6T97
         HF8NZjTquX1g7/gySt4+5HIzwGMo9A+exc/xrlOUPW3bWqawEfWAoXMGNFkurHR90QUK
         TPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793751056; x=1794355856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9fD5wGZku9Jq6jHpw1PlebB4Fcq0l3o/hV8S9abTEU=;
        b=AbSIQx54GkCJJUltoUthbG+8ZkLtpvsvS91sMBwYKjeGzpGtWncNPpIZu5+so8A37K
         HEKoLUIllH145TeHD9ruSmkk/u9nS1w6xxSb8wwdByGTEupObiz9Bid1gXSvO68E7WVj
         DKIpKLpj9uw44vV32b9Y9Gk+MZ5i+dnpv9d4rWoyFgdRCPjV3tgMlxWQ+lAnXtxQs7/y
         1Ahg59vof6C4hDUfQvJ2PAZ+x0bxBe/ewCm8DY6dw/3ij+yrzJdLskwg2YnymzZ9TBKn
         +hZFBOoId8aGNs8xujxxT24dCYxHFRTQK4NXF2wk8ngXbPSKoda6gIImKBKrgLfCMPbw
         Gggg==
X-Gm-Message-State: APuU4Z+vg7hl/ai8hK5uNDZOrRHNYgiJU9od7g3e/dmVghxpgdYVMIDP
	expN+sfgPoBpodA/8xxqdceae23m/+m4Nb9SVnCtJhL+myzXsueyslWrrFaz+Q==
X-Gm-Gg: AYBFou0sa/JL2u4Jm33ObrkDWcE1k1mjWSmHvrNyohwnbK/OH1MasmYmRYSLarKD9Kv
	zWxvX5GWmk9hbccGu4Ojv98SwkWkUKOKVBkfFShpTNR0dittv/HjrhtoscodQSIxRiIc77vn6Fn
	osl/xKP/j5AOEQXjWk/Xa8ldERg0a9B47ZpFgLy5yHCmQTgP4tQeZrQQ2V6FehczSSQzdgn/+iO
	4xwH59a3RFjnuTq3GKITmru1WTCrryh1aKdtkCz9zQ3YAQ3g5SfV3yrQ76vQajyc39hJCPPFdAY
	wqUSTMJ1ISIMzUAVtEF7hRlJl5RB+52fxlb6DilKUxO7rVrpVb1UB+oqf8/7oGohp8sso1Rfltz
	STbs4kf2hXM2mzDvfBr0L13Kza8D1YQvdMsgO2j5gUvrXJQYYvaOjErSV3eEa/rEIsbSpdrY9zy
	Gl8NXdHaEj+eea1Ht4Hx0hYNjhDwrzMntahWp1JU8G3sIBjR8xLlXfsnTvo0GrRa2U1kzbBUMJD
	nGlrsfg91znT6xbiK4xqU6s9ZqAu/MZZpBSb5NEZH+RMeG8pzDbbKCEBsitHKBUnd3EzRN4odk8
	Zho4vq5QgE8b+vqg6kBvOTcetEGG9+CHbu3Qf1BMsP5ocuhakql2M+GxFwCLF2WyV3t3Oz7nDfM
	aFXzGIV7gcrTbZo3cIDnh77lGFVsJcRg=
X-Received: by 2002:a05:600c:608d:b0:4a2:1197:1de0 with SMTP id 5b1f17b1804b1-4ac18b7dcdbmr332328975e9.19.1793751055758;
        Tue, 03 Nov 2026 16:10:55 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea18104bsm790557f8f.6.2026.11.03.16.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:10:54 -0800 (PST)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	axboe@kernel.dk
Subject: [PATCH] io_uring: add feature flag for dma-buf support
Date: Wed,  4 Nov 2026 00:10:49 +0000
Message-ID: <1b3ca4acc350aa5a397325d066533c4e5743a0f7.1793623347.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add IORING_FEAT_REGBUF_TYPES, a feature flag that tells whether extended
buffer registration and dma-buf buffers are available (see
IO_REGBUF_TYPE_* and struct io_uring_regbuf_desc).

Fixes: 62e4bf5b25d44 ("io_uring/rsrc: add dmabuf backed registered buffers")
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 include/uapi/linux/io_uring.h | 1 +
 io_uring/io_uring.h           | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/io_uring.h b/include/uapi/linux/io_uring.h
index b456f45fa8de..cf1afd11bb87 100644
--- a/include/uapi/linux/io_uring.h
+++ b/include/uapi/linux/io_uring.h
@@ -646,6 +646,7 @@ struct io_uring_params {
 #define IORING_FEAT_MIN_TIMEOUT		(1U << 15)
 #define IORING_FEAT_RW_ATTR		(1U << 16)
 #define IORING_FEAT_NO_IOWAIT		(1U << 17)
+#define IORING_FEAT_REGBUF_TYPES	(1U << 18)
 
 /*
  * io_uring_register(2) opcodes and arguments
diff --git a/io_uring/io_uring.h b/io_uring/io_uring.h
index 32247529076c..a0ed03fab123 100644
--- a/io_uring/io_uring.h
+++ b/io_uring/io_uring.h
@@ -50,7 +50,8 @@ struct io_ctx_config {
 			IORING_FEAT_RECVSEND_BUNDLE |\
 			IORING_FEAT_MIN_TIMEOUT |\
 			IORING_FEAT_RW_ATTR |\
-			IORING_FEAT_NO_IOWAIT)
+			IORING_FEAT_NO_IOWAIT |\
+			IORING_FEAT_REGBUF_TYPES)
 
 #define IORING_SETUP_FLAGS (IORING_SETUP_IOPOLL |\
 			IORING_SETUP_SQPOLL |\
-- 
2.54.0

