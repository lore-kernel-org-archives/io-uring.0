Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792716877;
	b=sQLpIL+nddbojZcGX811CYwZ0SNzaDnBlvfoBd17nmtfYiDy42xKfykBYPU0NqqTA1Aa
	 54JTjGa2MYUzGyqqVJENU+HNNaFUtvZc8KbbNP1aIoF8jI2rZF5dUU2JvqhFJxgpqSIg5
	 UTwEhmgAPP71tpB5CVL9N8giRzCUUVa9fsOzk9KvNBtxA6a5wT2ROXJXKfbRBP6i8wF/T
	 VRY/ByYDmORC85beFaIGdwuj54/QzWNVZqlKCrfzr/AIjpfnUO59/DAUB09pSEFgXsg/m
	 JQY0VZTAJiStF8CKWOBRvWxxr6zMN1vDlrS8xuHtkaihPAsabcbTnXL3xmKvOM/oqRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792716877;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Received:Received:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nTrGs6wWNLLgWTqB+xFg9ZYzFBZrMp7njVvdaDJiRlk=;
	b=Aj/KSdd+7UlPJACPVU6uzXdWDQV5wD/F5uWNg/yLSoHIkeSW/1eKfGfkEP7I8X4TSZJI
	 fix4dG44lvhPHu0aygUEI9CV14vhRWScdc8uN49EWz/DqvunjdMvlu+KGubInNYSYYSG6
	 KRoSep4qJYq4DgiEVOeiVUeevlF8GNuKnCq7Bxi7wmc10SA+m3rBoUTe7vNHkDdFLn5A2
	 egVljrCMiO+EIDuDQZGLvoe5xUDTXY2ddfS4Pmqj6lOgsy2bDy6SeCI/NhYdrGibY4gtE
	 hNUNhdyRM6YSSpFOYZykq4LDkdoVH5eArI6HJUc9H4k3uJnetMI7Q7OBFeHLy60/wbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=diac24.net;
	spf=pass smtp.mailfrom=diac24.net;
	dkim=pass header.d=diac24.net header.i=equinox@diac24.net header.a=ed25519-sha256 header.s=eidolon-ed25519 header.b=tNn7cCSb;
	dkim=pass header.d=diac24.net header.i=equinox@diac24.net header.a=rsa-sha256 header.s=eidolon-rsa header.b=ARSPTwcV;
	arc=none smtp.remote-ip=185.142.180.128
Received: from eidolon.nox.tf (eidolon.nox.tf [185.142.180.128])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B19606A319
	for <io-uring@vger.kernel.org>; Fri, 23 Oct 2026 00:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30B19606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=diac24.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=diac24.net header.i=equinox@diac24.net header.a=ed25519-sha256 header.s=eidolon-ed25519 header.b=tNn7cCSb;
	dkim=pass (2048-bit key, unprotected) header.d=diac24.net header.i=equinox@diac24.net header.a=rsa-sha256 header.s=eidolon-rsa header.b=ARSPTwcV
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=diac24.net; s=eidolon-ed25519; h=Date:Cc:To:From:From:Date:To:Cc:
	In-Reply-To:References; bh=nTrGs6wWNLLgWTqB+xFg9ZYzFBZrMp7njVvdaDJiRlk=;
	i=equinox@diac24.net; t=1792716875; x=1793408075; b=tNn7cCSbjmpzWvfOzvyU1Fp7L
	bu8SpylPPsLgDcGT9zDPhqPpuZqXesyKktQQOeAc42aMb65GAyfXGWhTIgZDw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=diac24.net;
	s=eidolon-rsa; h=Date:Cc:To:From:From:Date:To:Cc:In-Reply-To:References;
	bh=nTrGs6wWNLLgWTqB+xFg9ZYzFBZrMp7njVvdaDJiRlk=; i=equinox@diac24.net;
	t=1792716875; x=1793408075; b=ARSPTwcV/9Bktp26FarvmLuDj2siQFxknWU1BCjzomGWQbd
	b6Ukyo+QBXBiF0Zp10Lb1FC7hXnQW32CbBUX+kS2FiRmWdl1bjAgT+RYmIq90R5yUNECfiRhQjmny
	pQzvu6eI+bQJ+q8ivNay93tejrqwz+JJuhFIhNDEZwpEXnd0hip09bMEkzat6ilYmIZEwxHL3KQ9N
	12s8/+Doni1edgyXEJy6xmPWPMMDxyZDQ6GJGza5ALmfgdOR4HAzwWcFyDaZL29YSe/ppYRnHR7fb
	7P37UCOQiMmB/F/s034gzpEEEYPiCgONSA8pcr7KW3owpmpw+T2i78sxQybsg0bQ==;
Received: from [178.197.169.187] (helo=alea)
	by eidolon.nox.tf with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <equinox@diac24.net>)
	id 1xK3YH-00000000pQ1-1uQE;
	Fri, 23 Oct 2026 02:54:33 +0200
Received: from equinox by alea with local (Exim 4.100.1)
	(envelope-from <equinox@diac24.net>)
	id 1xK3Xt-00000001RMu-3qdb;
	Fri, 23 Oct 2026 02:54:09 +0200
From: David 'equinox' Lamparter <equinox@diac24.net>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	David 'equinox' Lamparter <equinox@diac24.net>
Subject: [PATCH] io_uring/kbuf: alignment for incremental consumes
Date: Fri, 23 Oct 2026 02:31:32 +0200
Message-ID: <20261023005339.336321-1-equinox@diac24.net>
X-Mailer: git-send-email 2.55.0
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

For incrementally consumed buffers (IOU_PBUF_RING_INC), currently the
kernel just consumes exactly as many bytes as the underlying operation
yielded.  If that's some odd length, later operations continuing to use
that buffer will then start at a misaligned addresses.  This is quite
annoying for datagram & packet sockets, where the contents would be some
network protocol headers or serialization.

(With some pedantry, multishot recvmsg could be considered broken by
this since struct io_uring_recvmsg_out will be placed there, misaligned,
while the compiler assumes/expects 32-bit alignment.)

This adds a new align_shift field into io_uring_buf_reg, allowing the
application to ask the kernel to pad all incremental buffer consumption
to keep alignment to 2^align_shift.  CQE res/length values remain the
same, the application must remember that it requested alignment and
apply it to get the subsequent start address within a buffer.

Signed-off-by: David 'equinox' Lamparter <equinox@diac24.net>
---
(liburing update & test coming tomorrow.)

Although this is a ring property, it's primarily intended for recv[msg]
on datagram & packet sockets.  (We need to handle reassembled IP
fragments, but they're also incredibly rare.  Without incremental
buffers, we'd need to burn 64kB each on what'll 99% be <1500B packets.
A few large buffers + min_left=64k+hdr gets it done nicely - if we can
avoid getting stuff at random weird misaligned addresses...)
---
 include/uapi/linux/io_uring.h |  3 ++-
 io_uring/kbuf.c               | 15 ++++++++++-----
 io_uring/kbuf.h               |  8 ++++++++
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/include/uapi/linux/io_uring.h b/include/uapi/linux/io_uring.h
index b456f45fa8de..ba697bb57f0b 100644
--- a/include/uapi/linux/io_uring.h
+++ b/include/uapi/linux/io_uring.h
@@ -936,7 +936,8 @@ struct io_uring_buf_reg {
 	__u16	bgid;
 	__u16	flags;
 	__u32	min_left;
-	__u32	resv[5];
+	__u8	align_shift;
+	__u8	resv[19];
 };
 
 /* argument for IORING_REGISTER_PBUF_STATUS */
diff --git a/io_uring/kbuf.c b/io_uring/kbuf.c
index c9641b6ccc8f..af09f7c42f69 100644
--- a/io_uring/kbuf.c
+++ b/io_uring/kbuf.c
@@ -39,13 +39,13 @@ static bool io_kbuf_inc_commit(struct io_buffer_list *bl, int len)
 	if (!len)
 		return false;
 
-	while (len) {
+	while (len > 0) {
 		struct io_uring_buf *buf;
 		u32 buf_len, this_len;
 
 		buf = io_ring_head_to_buf(bl->buf_ring, bl->head, bl->mask);
 		buf_len = READ_ONCE(buf->len);
-		this_len = min_t(u32, len, buf_len);
+		this_len = min_t(u32, ALIGN((u32)len, bl->inc_align), buf_len);
 		buf_len -= this_len;
 		/* Stop looping for invalid buffer length of 0 */
 		if (buf_len > bl->min_left_sub_one || !this_len) {
@@ -55,6 +55,7 @@ static bool io_kbuf_inc_commit(struct io_buffer_list *bl, int len)
 		}
 		WRITE_ONCE(buf->len, 0);
 		bl->head++;
+		/* this can go negative down to -bl->inc_align + 1 */
 		len -= this_len;
 	}
 	return true;
@@ -651,9 +652,11 @@ int io_register_pbuf_ring(struct io_ring_ctx *ctx, void __user *arg)
 	if (reg.ring_entries >= 65536)
 		return -EINVAL;
 
-	/* minimum left byte count is a property of incremental buffers */
-	if (!(reg.flags & IOU_PBUF_RING_INC) && reg.min_left)
+	/* minimum left byte count & alignment are a property of incremental buffers */
+	if (!(reg.flags & IOU_PBUF_RING_INC) && (reg.min_left || reg.align_shift))
 		return -EINVAL;
+	if (reg.align_shift > 31)
+		return -ERANGE;
 
 	bl = io_buffer_get_list(ctx, reg.bgid);
 	if (bl) {
@@ -703,8 +706,10 @@ int io_register_pbuf_ring(struct io_ring_ctx *ctx, void __user *arg)
 	bl->buf_ring = br;
 	if (reg.min_left)
 		bl->min_left_sub_one = reg.min_left - 1;
-	if (reg.flags & IOU_PBUF_RING_INC)
+	if (reg.flags & IOU_PBUF_RING_INC) {
 		bl->flags |= IOBL_INC;
+		bl->inc_align = 1U << reg.align_shift;
+	}
 	ret = io_buffer_add_list(ctx, bl, reg.bgid);
 	if (!ret)
 		return 0;
diff --git a/io_uring/kbuf.h b/io_uring/kbuf.h
index 401773e1ef80..fce1fe301c65 100644
--- a/io_uring/kbuf.h
+++ b/io_uring/kbuf.h
@@ -39,6 +39,14 @@ struct io_buffer_list {
 	 */
 	__u32 min_left_sub_one;
 
+	/*
+	 * alignment for incrementally consuming a buffer. All lengths are
+	 * aligned to this at consumption time. Will simply be 1 (no effect) if
+	 * the application didn't request anything on registration, so it can
+	 * be applied unconditionally. Always a power of two, max 0x80000000.
+	 */
+	__u32 inc_align;
+
 	struct io_mapped_region region;
 };
 
-- 
2.55.0

