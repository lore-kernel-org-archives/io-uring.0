Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7425A37DAAE
	for <io-uring@vger.kernel.org>; Wed, 29 Jul 2026 15:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785338110; cv=none; b=Xbtewdg4PeCBKv8x4lP/dsqMqVVDGGfykrJEi+1gx0fq09Fvudu52nO96lhppN6wtvBO2q+yBPtRl2ojumaaBYPIj7UO6VZ9senei0AkFsGWyZ62mqv+ejeyXm+RHj8lxMTtkkbVezZf6qeOD9u87AReDX2aJ+29R1crNXYt1Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785338110; c=relaxed/simple;
	bh=tzQGn+bNMrbg1xuxu1uU5K8OjtCXDEbHSapUXWKV0t8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UYBc4RYPlt5iJGl87Sp8gAKFvJyDItnxHHQW/4ICzFdPdCL4eGErC7w1K/fNOt+RIX4TbIaBdbD5TAb3DoIH276tt0VRevPHPjXgdqhpfcUNOca5Tz8P664NGbSsqaVNr9kd1a5cPEy4TK/zg6zv0DC0HqOfdNOlGCe/rxunK4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com; spf=pass smtp.mailfrom=xbow.com; dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b=cVXOJxOb; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xbow.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b="cVXOJxOb"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84861fc51f5so747417b3a.1
        for <io-uring@vger.kernel.org>; Wed, 29 Jul 2026 08:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xbow.com; s=google; t=1785338109; x=1785942909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZQzCH4B5mM4CTNbOsYvN+gZppj/JJTPXHXD5c5OcK+Y=;
        b=cVXOJxObI+947LAgPD1gyMB21+56IozHNmYadzxAx8YiBZ+P/y1Jv0mGSp03u8+nOp
         tFvf9bzuTZATOIv2hzL0O/2l4v4QGScg++acinmjQqbsaH/cHMvy6Nbhu8ur57ltITn0
         imvPUkt1kWExxxQooJ6uf2ph1ZmzAF0CbUp+50uShmM9l6DooJmrUU/TJ0Mpg3yQnBNl
         fNT2ZoHUdldBk077vtQmWvslBpMDwOYrqLyRukbD/MNsojCzuXauwmcmXLPZjfnSDQGh
         er4eJMORQ22PvIHqNCAdy1tNZHcr52pVH3bNrSkMpW0+1SQdJiw8uLtgRfNu2lxhtgz9
         4NAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785338109; x=1785942909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQzCH4B5mM4CTNbOsYvN+gZppj/JJTPXHXD5c5OcK+Y=;
        b=BHezJ1ZzIgrilRaBikufqEK+PJuQt7adzRtynobngsIdIxglaR7uTBenwSkFbg8rhY
         phlkImr9lJAqDb+O9mnusATJj48JFb2N2Tropaiu7BrI8Qyc1BxWXmALOVN73tD9bQel
         ayZ05tyonk3vvSEDyw3OIHHlA3NfdDipxbTK5FOAVxOolYCNm1kgjntg2OA3Qk76Wdf0
         KrQooaSTUpH7TkuJAWqy2oKoAxrHZrDAbkT0dr7vXdyhNs6kBsHtP6IR8r3B1Qx7MO7m
         bJA2r9XHjD8M4p0DkTd9yrgeG6QjAzGmwGya1qG+SZsawjOe6T03metc/JFzOO8m/N4A
         /4/Q==
X-Gm-Message-State: AOJu0YyC8VKqzt9RNSThVYVml9ebqqbWmO+71zWmIwYkrIQBb9WjFYNY
	iTHwSV4GkplgZVC/ipSdQwo3QUk0gjR59bit/1Qhrw7maleg0B7Vt2nJReJKSj2wXhzeXC0DDs7
	R4EuC8SSV7A==
X-Gm-Gg: AR+sD12R1kGXHy4vO+NhuXYg72YjfZ6TTU9UnfT6sdAc82AWPGLRGBY0E4EPJEQlIzR
	tSdCe/e2n/rOexJEFpOWgvboTYreLdhR943ZJURKaz2gFF3AXM1IYTuq9maGAN/m7JO3h2svKru
	as4h2f8QWk8iLyfV7i4K9WiBJUKGpTj6HjIC3iDBMIAjNqeiwudVB45f9eY+x1AIdwVtuOGk9MZ
	n2wcTxLb30ebYd/CaPKz7C/XEkQ6e1cSSm60MLZvQMRiz3dgEkTywCodTs0rxEzEUUjZUOd9TAV
	VksX2hzg6TNQJjPq6BrcQ5pP2w3R2F+V2msnfBAKiDs5GsbZbFyBb70QY/jOGqXcIL7sIm6FpmH
	dd5JuY87ZT7h7d2ojfpwYHw/U9OfjOmJP/MKrGPSMmJjm5MLtocECaETsWRrHxFDB6QYnKCJ6kL
	Fz3x8FsEp2uPrOUMcAYw/kgrILl5ZjizhS/NOjg1ros5s6mtYFA4scTY7vDOB8DOvx3qhU41Ndr
	o3ob+e4fAyJIHkPaMAjOA+qKIHD
X-Received: by 2002:a05:6a00:b4a:b0:845:e9ff:5d97 with SMTP id d2e1a72fcca58-84e931ecec6mr7539654b3a.12.1785338108626;
        Wed, 29 Jul 2026 08:15:08 -0700 (PDT)
Received: from Mac.lan ([125.128.148.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea03d3f16sm1589860b3a.59.2026.07.29.08.15.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 29 Jul 2026 08:15:08 -0700 (PDT)
From: Baul Lee <baul.lee@xbow.com>
To: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>,
	stable@vger.kernel.org,
	Baul Lee <baul.lee@xbow.com>
Subject: [PATCH] io_uring/net: don't truncate the bundle segment length to int
Date: Thu, 30 Jul 2026 00:15:04 +0900
Message-ID: <20260729151504.47280-1-baul.lee@xbow.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_bundle_nbufs() works out how many buffers a short bundle transfer
consumed by walking the mapped iovec and subtracting each segment from the
transferred length:

	do {
		int this_len = min_t(int, iov[nbufs].iov_len, ret);

		nbufs++;
		ret -= this_len;
	} while (ret);

iov_len is a size_t while this_len is an int, so a segment longer than
INT_MAX comes out negative.  ret then grows instead of shrinking and the
loop keeps walking, reading past the end of the array it was handed.

The recv bundle path can hand it such a segment.  io_recv_buf_select()
folds sr->mshot_total_len into arg.max_len, and that field is unsigned and
taken straight from sqe->optlen:

	if (sr->flags & IORING_RECV_MSHOT_LIM)
		arg.max_len = min_not_zero(arg.max_len, sr->mshot_total_len);

With sqe->len left at 0 nothing else lowers it, so arg.max_len can be
0xffffffff.  io_ring_buffers_peek() clamps each buffer against that rather
than against INT_MAX and records an iov_len above INT_MAX; a short receive
over that bundle then enters the loop above.

An unprivileged multishot IORING_OP_RECV with IOSQE_BUFFER_SELECT and
IORING_RECVSEND_BUNDLE, a provided buffer ring registered with
IOU_PBUF_RING_INC holding two buffers, and two bytes of data is enough to
reach it.  The two-entry iovec is a 32-byte kmalloc:

  BUG: KASAN: slab-out-of-bounds in io_bundle_nbufs+0x114/0x1a8
  Read of size 8 at addr ffff0000d39a1b68 by task io_repro/165
  Call trace:
   io_bundle_nbufs+0x114/0x1a8
   io_recv_finish+0x138/0xa38
   io_recv+0x38c/0x1008
   io_issue_sqe+0xc4/0x155c
   io_submit_sqes+0x6d0/0x1fac
   __arm64_sys_io_uring_enter+0x30c/0x1180

  Allocated by task 165:
   __kmalloc_noprof+0x1b8/0x444
   io_ring_buffers_peek+0x57c/0xbb4
   io_buffers_peek+0x168/0x2a0
   io_recv+0x598/0x1008

  The buggy address is located 8 bytes to the right of
  allocated 32-byte region [ffff0000d39a1b40, ffff0000d39a1b60)

Count in size_t.  ret is positive by the time the loop runs, since the
function returns early for ret <= 0, so widening loses nothing; this_len
stays bounded by ret, and the mapped length is never less than ret, so the
walk ends inside the array.

Fixing it here rather than by capping arg.max_len keeps the accounting
correct for every caller and does not disturb buffer selection: an
arg.max_len of 0 is a distinct "not set yet" state that
io_ring_buffers_peek() tests before it applies its own INT_MAX default,
and pre-filling it changes which bundles get expanded.

Discovered by XBOW, triaged by Baul Lee <baul.lee@xbow.com>

Fixes: a05d1f625c7a ("io_uring/net: support bundles for send")
Cc: stable@vger.kernel.org
Signed-off-by: Baul Lee <baul.lee@xbow.com>
---
The sr->len path into this loop is already rejected in
io_{send,recv}msg_prep(); this one comes in through sqe->optlen instead,
which is unsigned and so never trips a negative-length check.

 io_uring/net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/net.c b/io_uring/net.c
index 00a7df803b99..e8a066f8a9e3 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -500,7 +500,7 @@ static int io_bundle_nbufs(struct io_async_msghdr *kmsg, int ret)
 	/* short transfer, count segments */
 	nbufs = 0;
 	do {
-		int this_len = min_t(int, iov[nbufs].iov_len, ret);
+		size_t this_len = min_t(size_t, iov[nbufs].iov_len, ret);
 
 		nbufs++;
 		ret -= this_len;
-- 
2.53.0

