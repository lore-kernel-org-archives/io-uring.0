Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793751081;
	b=21wAxNAsq3dyZfMqFdipzisfJkROMR1gdurdiNTXm2GbqEge5U3GsVBEq1u2p4qLIjUg
	 mfjYrD5MtyZyJ+JQtzrOGIAj6tjY4Wq7Hb/6m4GrA/Py6wv+xJq46gBgIFAGLXXY0B9nL
	 xDfgg3i795kesoZ4yUZWTw07fbnYw76QZ1OATutK2Fq2vkPmmoAH0NtvXVZ2o7r4ywBe8
	 QgKb/54jUFuiRpVUDMhYRWhK/E7UM8IZ36P/c1EhHrW/rJ8ncrPBWPD1A7XHNsyab1nKL
	 iqc/SQZIiq6BrdZNM0dhwDYothHaBjAGitJoJ8alvYGW8htMqtCRrcc6c7sqQBBC3bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=odAhtlZP2Mip19/hHo5YdLy+LBq1jrxtalPsU0+TeJc=;
	b=N7FTNLFyVWrY1urpC0iMpq6jmaj1pOw/DtiXcMByzkTUnGaZTYP03gmsBSvYjekngmbS
	 fp1TkOMlB4Mz0Ao5W2lMaOAJ8QjLe8dn3yUp7YFYwHSW+S/WjJKBrDWc+1lBG9a5r4KcJ
	 Xz/Nq7Z5YN5vegV6sADqHeJS835ng9hlYpCi+cWNFG2fYNN/0iG/80F0EcHQP+MbRYbCO
	 cyqyzDgSbb5ARBOcbJgJE41ACGvFaidzbLPabAoaHz1dh0DqvHwCC4hc91gKw44pxoblI
	 VOkIV43xJJE018NGj0VIJ86Zy0wWZ9crYCkb/MkX7du5azCBpMlswSUJSY9WB2Czc+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KXHE6ksn;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0463606A31B
	for <io-uring@vger.kernel.org>; Wed,  4 Nov 2026 00:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0463606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KXHE6ksn
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so817075e9.2
        for <io-uring@vger.kernel.org>; Tue, 03 Nov 2026 16:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793751079; x=1794355879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=odAhtlZP2Mip19/hHo5YdLy+LBq1jrxtalPsU0+TeJc=;
        b=KXHE6ksn0cc0tPq7Kle07za/kSTxhfPr99hwHVDSzJuC+C+gw90opoYSURyt1p8YzX
         RckSO4Gpkcbe4WuLRM0CisxaHEVmIcyAJ+drxEDs3tt9dWv+ABuhQY0K5WpXd/ACFpTW
         a2U3vFarnXuz0WSst+BjGFviRYaS1WMrO5mxYq+/bE34nmnd6mVhwI4i7apMR5CtkWvx
         4pgcHkZUMLi4BDJuEhtCRserrJepu1LT172tY0uUmcG/Q1abhoCib8Tp8bBF/D8PSyAi
         1iG6wtWjbS9bsr20XfPu7NG+xVSMn2neGF8U4fAp7cxCr41rB1oLVyi8a9nEGtBnIeU/
         fCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793751079; x=1794355879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=odAhtlZP2Mip19/hHo5YdLy+LBq1jrxtalPsU0+TeJc=;
        b=HsbzaWUBt2d4V9fIAQpKZDp8wZGs/U24laXrZEN8/YWvTlY1O1vhI5vFVFX17bR7Ec
         2YiRAaZkWoyYepO4nWS1zQuy066j2wRhPT543BYz8VTQqqrB6B3JYs4P2pX4n32tn504
         VS3+pn75blGbCz9Rh0OWGf+F+2CnzBd6mqexfnePrGDXHpU2Hz7OoDk4AD+nd6BWXKva
         eLtIW6q7YWuWwyuyo9QMj6pvOTbY47D5Uzdu9MOzz/NQ/IdUQlL/GPh9JGbdN5gC9b7a
         XT1rwKZKZ0HbGhNlQhRh8ZupQv+LqmQAScJYsV9UQu1g4mcuQaBGT/lS19FgXKDCyaGS
         Ra8A==
X-Gm-Message-State: APuU4Z+Ku8RDX/TQUPzYpRWWPKUS6LIfcKPtx/dUd54o1m3eObAlRiHs
	M5LIgAKV+1ew32fLdevagX+WqwV6o9N0WQSk0tF4uxuuMincrxSsWy9+obi8jg==
X-Gm-Gg: AYBFou0mgrR+Eq1B+0E2GjvAgzO8+rblG/lFKblgNSCKBzlHI6PoDCyMpfp6uvT4xu4
	+bpT6GedGEvfu+NdOc2rfRY38vxHQ4Uk7UDtftziIVt9HOjqkzyGgDjSDK/3HxS8mw2TPzNtMQF
	AWY/v4ZUvL9uIjCXqV75KxMOq2xVc+1eDOLgoyhZkIvTEjfz0EXnPhdNGtW3hcOI+OxXmSIK0BL
	AQ6ed2eUfui3wMRgv8h7o/z/YjVoSLv6wdQml+YyS3uX+d2YmoG87u8SB4Am0yQUeI/EEFSte87
	XJLk6cvX1YxIPw2ajUO6Jh5YLtmIRsFbIrjNklFLHQTXBrQS2Ce/R+Trp6FrgrII/kfBlm4RBkd
	G4qjnJ0Qymgeo7Df92/g6z01KTQS/hRTl9iUSI5lmpW+Vcy0JVGioj5xzn/sXA1f9FG9fF6PtUP
	xAX5UrfPcEMiGzUDMHsbvAhe/o6QVJHwK2y+I6V/MPqONZPiLWolfu2chbQIRyoNN7+RE4jNS0y
	TadHm6QaR5RrxebQx/20U6E7nwBwa7wSCmurFdKXvpiMvZRc2FmCAJLzskro1q3t1hS3/yObi/D
	2Cno6jamd72rWOQwcJ6aQ9dqj5JhX4i8ciCEfUNgVcM4qTNwvRJLW4OENcWEAwFuEXHUfXMuHt4
	JqKM/Jw4Ps12EUzyXuBKTAaLDociCBhLP
X-Received: by 2002:a05:600c:890b:b0:4b3:8529:eb27 with SMTP id 5b1f17b1804b1-4b38529eb48mr43679715e9.27.1793751079216;
        Tue, 03 Nov 2026 16:11:19 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa38bb4asm97050455e9.6.2026.11.03.16.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:11:18 -0800 (PST)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	netdev@vger.kernel.org
Subject: [PATCH io_uring] io_uring/zcrx: don't sync for cpu dma-bufs
Date: Wed,  4 Nov 2026 00:11:10 +0000
Message-ID: <2cf944dd571364e249af5fefcab07bc670bce842.1793623006.git.asml.silence@gmail.com>
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

dma-bufs follow different from normal memory rules, we don't need to
sync it for the user. If the user space wants to directly access it, it
should use proper primitives like DMA_BUF_IOCTL_SYNC.

Fixes: a5c98e9424573 ("io_uring/zcrx: dmabuf backed zerocopy receive")
Cc: stable@vger.kernel.org
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/zcrx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index 6d7abb1636e7..17e554bb774f 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -1425,6 +1425,8 @@ static int io_pp_zc_init(struct page_pool *pp)
 	if (pp->p.dma_dir != DMA_FROM_DEVICE)
 		return -EOPNOTSUPP;
 
+	if (!ifq->kern_readable)
+		pp->dma_sync_for_cpu = false;
 	refcount_inc(&ifq->refs);
 	return 0;
 }
-- 
2.54.0

