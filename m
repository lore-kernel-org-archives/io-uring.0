Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0605528428
	for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 16:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167920; cv=none; b=n3sAGDkO+lzOfGAcGGkanF4sWwAAq73cR3+dxAKuvIu0n0Mf6Rneo+kgn1eQQ5zL3/9ukpmYuw83ZpVuaWlcGE++EBn9vwl5uy2rIBMB2U9u1KXS2i5cOjWbuAUEbezvN65OkAelmrB+AWf4VFjhr4xsJQmylreWlg1Tkaic8Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167920; c=relaxed/simple;
	bh=VvBvQ/30m7x+T/DuyuVFhUktQ2DqxHnhmKpwqj7sqnE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HVGVKcGoXZbip/+6ck9jtm19IfB5+NU8Wvfhv8YkP4jff8QelToW9tQIiDrmR6tx57V/2eE+wcFxHPcoamWsXJmnfm7uLCUpIGYM0sLU9AzooVu0UH77EdVnBuYmXNB1fJXFZr5q0M1aCr2AUu25VTW9sustZE3cA4JPZ0AtrMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hi1rRvYx; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hi1rRvYx"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a061a13884so1078395e9.3
        for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 09:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792167913; x=1792772713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2h4T4TA9I7ITEJ9LtYDpJnkQ3Na35pl9oB5/mKgUjrY=;
        b=hi1rRvYxeQk3H0IpSfreI/7wMq14BjUOMJyWDPw4Hgum+fKRlA94KgJJbVqmr7+dgU
         qM9+jPoKBhCeFdT2ti6iT9IUYsampWW7aRUd9RCl0UKD6yWq+E7Sa2aeBhOjDV/rylyM
         CJz3Oh6pIBn33T8KE/o9HLELRjSx0mVaeH8qkzs1gTnKHobVCoEW0Lhp0a2J/8wABRI4
         kLIrM+bw+zyg+8HN+0N1/c8vHJwBvGPbTzDLXUo06QCDR799bVhKkSuST37RnEUJ1MSF
         sdFN7XaY4owqWP7aatcMrwG44SlV1AiR0Psf4VHJalJE3uuDWHNhktHaZ6gy3Awuqc1v
         k/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792167913; x=1792772713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2h4T4TA9I7ITEJ9LtYDpJnkQ3Na35pl9oB5/mKgUjrY=;
        b=KppcPZJfFBAajrNVM/TaxIF/UPvnsvJEFB3cEb2VaNyO0gEDSt4+h3H+upyLxMJ6qe
         B3sh/UHhGTR7jpjiQ+R9HoSu9XzpkOwWL+N2PE8RGCeX/rZfU2KrDSGhB3ZQLUUExpir
         eOaqUwkOxJqHtXI1K/0lRP36L9HBh8kdQ7eZZ8BJfRlrfcOO8yl1sJ0X3qZb4bSjtt5/
         qyuCuj0b9/v9hIGVLODt43LKMMWKovUMrd1PC9gTW2jmWlC0OjrwPXSmgPrW6PKOaM9U
         mSM5HTdIU+Tvkp8EKMPGsMBXL69aTxWZDpJ5f0d3udoNw/gE6hGlCCfZdjiVVS6HNys+
         Rw3g==
X-Gm-Message-State: AFq9FYIedVMBX+jkio3s4jSo+49ED4TDLAlPh+WWAFCMuC3qmhoqAtgE
	zZq/TvPaawpZ+GnhL8MYib0o8tePigUSmWY7UHMR/t4hx0kVG3HLrSObtbWgBQ==
X-Gm-Gg: AYBFou3L4w0vVA8PZ9KY5PAEkwws5nrWtSAQTuMdvgubFDoylL8soi8jUL09fIWdolU
	1Ztdut05MLn+g1TwDYO4ksPdoC8mUtk0c2dh3HbZUnrUzmIHrm6iK+3JJyBkxC/H3ZnhWTPtXZO
	3RG5DiPacTD2QOQ7JYEBj7fs15niiA/GzMVJGxyElwqfi/DTEgvYxMoEAlfyEQ3EoP8Zvlkb9zZ
	rK7F07wsGD1C2pefTUyQfGFBBiRpsssJIyt6dK0qJKEr41+v/xVRsE2qGiCB7ZlUK4Dem7i5yDN
	FOXdM/5/G+KGLRI8cX3Hp/TNWdtIcmMyUNcxd/WC+fcgt1tfxafpzDlRuc9Jb4wn+TpytYMXQk+
	dMZF+GhTX0QoLLyTGZ8sXThOINn5Yig2CFzbO4oZnm6bP7vLuSe5BgPiTiu18Ix2vNRwhDSV8Ic
	rlna+k8wVtQAp9JOnLoa+iil6EGaaYtCGiv4v4Kl6tlpEl4eGfuy3buOxhWQ4ZVDo4FUzqy4nGK
	bvLaBcP1gpyfPmG+LzW0Yqpni3QYoQQRv1DUGDGYr7jctS8zVFYQkYuoA4yuZ+xdMaRkzeQCH6c
X-Received: by 2002:a05:600c:1395:b0:4a1:d73d:4137 with SMTP id 5b1f17b1804b1-4a1d760f94dmr7097555e9.28.1792167912582;
        Fri, 16 Oct 2026 09:25:12 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca31234sm41728415e9.4.2026.10.16.09.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:25:11 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	axboe@kernel.dk
Subject: [PATCH liburing] examples/zcrx: don't forget to sync dmabuf
Date: Fri, 16 Oct 2026 17:25:05 +0100
Message-ID: <73b2654e41519acb2ec310ba1d6dc99cbafcbdfd.1792167723.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dma-bufs are not always coherent and we need to sync it before
accessing. Use proper dma-buf API for that.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 examples/zcrx.c | 40 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/examples/zcrx.c b/examples/zcrx.c
index b55b07ce..47036a33 100644
--- a/examples/zcrx.c
+++ b/examples/zcrx.c
@@ -39,6 +39,7 @@
 
 #include <linux/memfd.h>
 #include <linux/udmabuf.h>
+#include <linux/dma-buf.h>
 
 #include "liburing.h"
 #include "helpers.h"
@@ -103,12 +104,46 @@ static unsigned long area_token;
 static bool stop;
 static __u32 zcrx_id;
 
-static int dmabuf_fd;
+static int dmabuf_fd = -1;
 static int memfd;
 
 static int listen_fd;
 static int target_cpu = -1;
 
+static void dma_buf_begin_cpu_access(void)
+{
+	struct dma_buf_sync sync = {
+		.flags = DMA_BUF_SYNC_START | DMA_BUF_SYNC_RW,
+	};
+	int ret;
+
+	if (dmabuf_fd < 0)
+		return;
+
+	ret = ioctl(dmabuf_fd, DMA_BUF_IOCTL_SYNC, &sync);
+	if (ret) {
+		fprintf(stderr, "sync failed %i\n", errno);
+		exit(1);
+	}
+}
+
+static void dma_buf_end_cpu_access(void)
+{
+	struct dma_buf_sync sync = {
+		.flags = DMA_BUF_SYNC_END | DMA_BUF_SYNC_RW,
+	};
+	int ret;
+
+	if (dmabuf_fd < 0)
+		return;
+
+	ret = ioctl(dmabuf_fd, DMA_BUF_IOCTL_SYNC, &sync);
+	if (ret) {
+		fprintf(stderr, "sync failed %i\n", errno);
+		exit(1);
+	}
+}
+
 static int get_sock_cpu(int sockfd)
 {
 	int cpu;
@@ -373,6 +408,8 @@ static void verify_data(__u8 *data, size_t size, unsigned long seq)
 	if (!cfg_verify_data)
 		return;
 
+	dma_buf_begin_cpu_access();
+
 	for (i = 0; i < size; i++) {
 		__u8 expected = (__u8)'a' + (seq + i) % 26;
 		__u8 v = data[i];
@@ -382,6 +419,7 @@ static void verify_data(__u8 *data, size_t size, unsigned long seq)
 				(unsigned)i, expected, v, (int)expected - v,
 				seq, seq + i);
 	}
+	dma_buf_end_cpu_access();
 }
 
 static unsigned rq_nr_queued(struct io_uring_zcrx_rq *rq)
-- 
2.54.0

