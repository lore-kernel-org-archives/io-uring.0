Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D850547ACD1
	for <io-uring@vger.kernel.org>; Tue, 28 Jul 2026 21:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785274213; cv=none; b=PlJ/JPvc+wHyzBXYTuoCNKqS4Ai7aNyNtmlXgv5T9hHX8+lY/YajGPbDVsnRQEHHOjDkKvbCyhha5ykqOE0zxGacrUBZyrVGxCZJ1JMRedmVErIn9btVROf/C3mkvBmeAisDj5Xeuf+ZeVLm8A2JnCiXWDwdKG6adJmScluxo6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785274213; c=relaxed/simple;
	bh=GOpsniia9YGwJC5+Tf9jZp7skqJgnlIpNpZfRP/ds68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hS0qzDuyhC/N0iNcGTLIuznQH81F95ljmKeIwFSfwVkHGEtrN0nAyEZC5NUBX3wg0c8aC3MEH5OyAS28crEmVeDQRTyThYDfeybPw2hPUi56PXDHou8fY8FU4qQtST+fWLvswEBQoZTKCiCijVwRdo3+/p95s+gQhn/zJnfYLGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H5Ym4u/V; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H5Ym4u/V"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4728c12ba97so237113f8f.0
        for <io-uring@vger.kernel.org>; Tue, 28 Jul 2026 14:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785274208; x=1785879008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jomHTWh5pLJKgL2wIyki6K11K3ENYcuFeD6DEOIqSFg=;
        b=H5Ym4u/VExLT6WCLEE6Kv4YIjIw58vB034j8JEtU73/52h+pQnIHzfk9AFZZ7sYOjb
         8zlZzzwzcZzyJN9OYpWJ55tzNZb0Mo6Waf1q38cQDVRs8lfGOHXMPls5sh4/rm8Leqmy
         gXWt8McGH1ltozIKZ+VJYO62dYGsgiFSxlNJtrV9ymcJBGJA7MTfe0qICFv3efxNTiUi
         Ewfiu/Ea/sINTuGolpH0q03ARYDniehuDgUm3WrSEVB4y7Nf8kgeqlwD7CDcQQ4L8f8u
         Ao9Ov92XKpNK+yJ/fcgLbF6EbI1zlAJ6KEoSzfPPH9VNM8LzJsDWMTMZKpQ3fvXK7dMo
         lepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785274208; x=1785879008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jomHTWh5pLJKgL2wIyki6K11K3ENYcuFeD6DEOIqSFg=;
        b=MyMNE7F/gRO9Eh7sQz4n0/nPhko3tDQCRGSFB8Mw3KLkP7wFmkkXugb6hkSRsmriTv
         D+HQyukdGsP2ZyJnyn9wrv6LSiFnT1iKa/Oo6LFbm8SVnF3dJQ3P5yCNMRzWd0ks/X/C
         ZnW2YS8+RBn6LrpNBW8W0dmwKnny9s3aNTS/j4xeMspiTJi1mnnxdL5yX4uW+NK9ITAR
         o/HHbpLEbBRStN3vhzObFgEAy7SlhTTuB7MJ0EH+1i2MsRvIw3HGdC4f8QpVY/qtoVXP
         iibfiUnVNNIT4zw2lPWkJDqB2dLb6EVHDesUikl4UWWg9FBAKkVu/Qq3/7ZM2yjUg+Iq
         IsxQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGLTlFuM9ykYg8ENQPTLDdz3sWYmCUqDNRQryHokNBsjKBCsfw2+lwHkWZ9FL7YUMzEkjUdau2ZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkLa/0kaBfHBQfrhYvlDp/fpUyY1Wa0Vh0COFyL2WD2FqIETe0
	5OUXUvFvKpt2qZxRjZrg1B6fq0oJWpd9OOnln6zJn7ltLrs1fafdO9Eh4VFbl8wHjVI=
X-Gm-Gg: AR+sD11hS0kkxW5SOtqDFYzBC3zC7J4H1qaF7CM24VwnIApnrGooYSnb5X5MvVyf9d2
	3flVc9KgP7tbi9kGPpAQ7wjKYWhme5rvUp6him6UmnpEhCBOOZXLFkSyp5KRRn8X1HYmQr2R7xX
	QrFnCn1Wq1ad1Kv2ybFszeVoAyfWQvSnccY5RfLEMNb4G884AyfcHWu9TDJgrFWvINXPbucvhFC
	i5E1/qcsbGuARd4TlgECASDEsWT9CzlR6zl1ghpuDwSPTcS16GBIcXKYqSudHmBm/F73tZ+n4gs
	Q5rS/tkKLUM1hzigqy7AI3mlzcLn/P8oWGx27ywGueBfzTT5u7chaIWcS55t+SHV4jMa0KMOzHq
	u8vD6HibRypdNtfAeh2Fab+XyWACfwXJWEX87ICOitEFMLGIJsbFCa9vxeyGVT+FJLkoKSUJNI3
	Ni0ZNSXl7d13MTL2tEQZv0QyU5w+3hZ3bAb3WT+PXBFMaqWTJ2LQKmzmDw00dOQIRNwrEaozTa0
	YOwpWJEmDFkyKA9Uzc=
X-Received: by 2002:a05:6000:2f81:b0:47f:97a4:f121 with SMTP id ffacd0b85a97d-47fb1f108a5mr5045703f8f.30.1785274208062;
        Tue, 28 Jul 2026 14:30:08 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6ac44bcsm2245329f8f.11.2026.07.28.14.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 14:30:05 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	io-uring@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Cc: asml.silence@gmail.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Nitesh Shetty <nj.shetty@samsung.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Anuj Gupta <anuj20.g@samsung.com>,
	Tushar Gohad <tushar.gohad@intel.com>,
	William Power <william.power@intel.com>,
	Phil Cayton <phil.cayton@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	David Sterba <dsterba@suse.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	dm-devel@lists.linux.dev,
	nvdimm@lists.linux.dev,
	linux-btrfs@vger.kernel.org,
	ceph-devel@vger.kernel.org
Subject: [PATCH v4 12/14] io_uring/rsrc: add uncloneable regbuf flag
Date: Tue, 28 Jul 2026 22:29:24 +0100
Message-ID: <a138961611aadf950ce6ab9215f00ae888b8ce72.1785274111.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1785274111.git.asml.silence@gmail.com>
References: <cover.1785274111.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's hard to implement cloning if the internal structure needs to be
mutable and/or relies on other ring resources. In preparation to such
buffer types, add a flag indicating that the buffer can't be cloned. It
might be possible to add cloning in the future for them, but that would
likely need reallocating the structure and reacquiring resources in case
by case manner.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/rsrc.c | 5 +++++
 io_uring/rsrc.h | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 24fc3232a66a..d57e8a0380b5 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1381,6 +1381,11 @@ static int io_clone_buffers(struct io_ring_ctx *ctx, struct io_ring_ctx *src_ctx
 		if (!src_node) {
 			dst_node = NULL;
 		} else {
+			if (src_node->buf->flags & IO_REGBUF_F_UNCLONEABLE) {
+				io_rsrc_data_free(ctx, &data);
+				return -ENOMEM;
+			}
+
 			dst_node = io_rsrc_node_alloc(ctx, IORING_RSRC_BUFFER);
 			if (!dst_node) {
 				io_rsrc_data_free(ctx, &data);
diff --git a/io_uring/rsrc.h b/io_uring/rsrc.h
index 98ae8ef51009..83aa86e6f320 100644
--- a/io_uring/rsrc.h
+++ b/io_uring/rsrc.h
@@ -29,7 +29,8 @@ enum {
 };
 
 enum {
-	IO_REGBUF_F_KBUF		= 1,
+	IO_REGBUF_F_KBUF		= 1 << 0,
+	IO_REGBUF_F_UNCLONEABLE		= 1 << 1,
 };
 
 struct io_mapped_ubuf {
-- 
2.54.0

