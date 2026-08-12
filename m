Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723FC44C4FD
	for <io-uring@vger.kernel.org>; Wed, 12 Aug 2026 13:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786540382; cv=none; b=URR7b5d8CrSreNCIxCvSOkttU8noGmjAMhaeilHw3pH/2XbtyD9sUGo1eRtgEkaSguHd/NDMhObL64Xv1wawC7OjK4wnW4chushfq/LnGjnSWKvgKOlof+fFSsSEiu1QB6/PVbYBpDGMde1Vjx7i5s43BBOSGt4Vy9qTpAS8WAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786540382; c=relaxed/simple;
	bh=SE+/2vj4X8bPl9+0AL9S/WSArJYGo7Wwyr4z2rc9t68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dX+fr9DCQexBzQI/6/cnu49i0PVWxE44Io2Ueul+I0pQ6KbdpKDejHaXoH/T6GVLyQr1WcNEkDygdXu4yYrRSiyJ2wT/7UO2LqaFIAeQ/MDtyN3X2kcugJTkI9QbM25NYvgwvWvz6BPiqoBN/rXDCLA8f51y63yciW3S+w3spcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Cxkkb3iy; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Cxkkb3iy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Fic8VIvp8MsgJ4iE5MNw+G+vELMUXjzBDJPHM2UID/I=; b=Cxkkb3iyj9umA5JUVrmICty7FM
	to5nxtbKreBiYsMCq5FoCMaugNN1ybe6barXVe+BJSFvRACxKJLSQi14n1jbRaOvChia+9k/XDIlN
	xmXUM2Uou5l3f7JdMpYwCjCkxTdXrmbhpJ39hnZJyY9lpanwR52eKdlQ6EK8iBFXmuiYhhhpD9UmZ
	hIylOl8SZ1s6lKMPp3SCfdqvsPJDlwzaWsdgVdBsjr7uTxMI+MbgjsqRHj9yONg4rZ5eowfONKT5J
	OeI1+Ld2cW46BGdkHYEw9uOMLwYLkFqZCsiwYi/T7Z1wS/98up2ob5TJzwwAa6HWqVZoa7AhVRI2H
	ml6eG7Eg==;
Received: from [66.186.210.122] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu8lQ-0000000GFoB-01Ms;
	Wed, 12 Aug 2026 13:13:00 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	io-uring@vger.kernel.org
Subject: [PATCH 3/5] liburing: add io_uring_prep_cmd_zone_reset
Date: Wed, 12 Aug 2026 07:12:50 -0600
Message-ID: <20260812131255.258582-4-hch@lst.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812131255.258582-1-hch@lst.de>
References: <20260812131255.258582-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Add a helper for io_uring zone_reset_all commands.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 configure              | 31 +++++++++++++++++++++++++++++++
 src/include/liburing.h |  7 +++++++
 src/liburing-ffi.map   |  5 +++++
 3 files changed, 43 insertions(+)

diff --git a/configure b/configure
index b953eddd6ddc..8c5ca801f487 100755
--- a/configure
+++ b/configure
@@ -469,6 +469,21 @@ if compile_prog "" "" "discard command"; then
 fi
 print_config "discard command support" "$discard_cmd"
 
+##########################################
+# Check block zone_reset_all cmd support
+zone_reset_all_cmd="no"
+cat > $TMPC << EOF
+#include <linux/blkdev.h>
+int main(void)
+{
+  return BLOCK_URING_CMD_ZONE_RESET_ALL;
+}
+EOF
+if compile_prog "" "" "zone_reset_all command"; then
+  zone_reset_all_cmd="yes"
+fi
+print_config "zone_reset_all command support" "$zone_reset_all_cmd"
+
 ##########################################
 # Check idtype_t support
 has_idtype_t="no"
@@ -797,6 +812,22 @@ else cat >> $compat_h << EOF
 EOF
 fi
 
+if test "$zone_reset_all_cmd" != "yes"; then
+cat >> $compat_h << EOF
+
+#include <linux/ioctl.h>
+
+#ifndef BLOCK_URING_CMD_ZONE_RESET_ALL
+#define BLOCK_URING_CMD_ZONE_RESET_ALL			_IO(0x12, 1)
+#endif
+
+EOF
+else cat >> $compat_h << EOF
+#include <linux/blkdev.h>
+
+EOF
+fi
+
 cat >> $compat_h << EOF
 #endif
 EOF
diff --git a/src/include/liburing.h b/src/include/liburing.h
index 0188937b0de4..214c7778d6a7 100644
--- a/src/include/liburing.h
+++ b/src/include/liburing.h
@@ -1685,6 +1685,13 @@ IOURINGINLINE void io_uring_prep_cmd_discard(struct io_uring_sqe *sqe,
 	sqe->addr3 = nbytes;
 }
 
+IOURINGINLINE void io_uring_prep_cmd_zone_reset_all(struct io_uring_sqe *sqe,
+						    int fd)
+	LIBURING_NOEXCEPT
+{
+	io_uring_prep_uring_cmd(sqe, BLOCK_URING_CMD_ZONE_RESET_ALL, fd);
+}
+
 IOURINGINLINE void io_uring_prep_pipe(struct io_uring_sqe *sqe, int *fds,
 				      int pipe_flags)
 {
diff --git a/src/liburing-ffi.map b/src/liburing-ffi.map
index bd7bc64416d3..fc9701b63907 100644
--- a/src/liburing-ffi.map
+++ b/src/liburing-ffi.map
@@ -275,3 +275,8 @@ LIBURING_2.15 {
 		io_uring_register_zcrx_ctrl;
 		io_uring_register_query;
 } LIBURING_2.14;
+
+LIBURING_2.16 {
+	global:
+		io_uring_prep_cmd_zone_reset_all;
+} LIBURING_2.14;
-- 
2.53.0

