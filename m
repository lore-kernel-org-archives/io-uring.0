Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D003BBFDA
	for <io-uring@vger.kernel.org>; Mon, 17 Aug 2026 08:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786955331; cv=none; b=Oa4d5R/QmdOMBVlfpdq6raJHy1refseryqwihGtXkWf9ENGoPuQhCGNWpKVdKvnheuIVztKcijxNd6tzRrq9ro+kFDVgqbyMA9gmmjMvvSUmYZc7Slx1jeO8WmwJyH2M1OwCXgnxpVSustamOdLt0yu9JmLJBfD1Tntfhj0kSkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786955331; c=relaxed/simple;
	bh=HI0BmQwwH0RRPDTXChmRJabrv0+9GvTSp2ot7sYaFco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UbfvItbuxlEJ2xWTRVAcdWfv6/qzbBL5HtfhkmVK5ZabKJZ1dobO95Ls0D1aKUQfd2sB2vV1LWlUHaxfMsxRBkH6Qr67v9cRFJGRA9sMY5ZqM8JFJ1FCm4iS1h6RF0YlW6nf9l6fBF3HzMJt+nigeVBPD32erU82aIqpESq04D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=juTCE6OO; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="juTCE6OO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=KGHyNxsvUrYEpitK/nm9hcGXhfFdUXARnYnKuTFiR6o=; b=juTCE6OOqa0RFkkkEz3sgMqPz7
	Uyg1RzoF/vAK4LzSHUwIWozU+pJx/7D0N0cy0/YZ/lMCrhRL0OjxvI433rnTLzt2Dyp6erTJOKqRG
	MfirNy5V2i4ftRvzWq3e1KgoXh3ISrwXyDMn4PxG54SWMsxejG3XEBN4HIarTQyCbfLIX3TzXFiDg
	5uouobFHT0UaL4u6sKfPUx0ZovFIcz0Z3vPCSdei/Kz7Du7ZjqINjv7QVOgTWOdNlvJD6Pz/Lnef2
	zafqmAtehqSAhq4DO2jj+46iet7BJd14+u0FJDuOy0tdcFCxjmQegos29LEfLDrgods/cEmox/tLx
	pcq5+Sng==;
Received: from 2a02-8389-2301-9f00-d9b3-9099-237f-e1a3.cable.dynamic.v6.surfer.at ([2a02:8389:2301:9f00:d9b3:9099:237f:e1a3] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsi9-00000005h0h-2NU9;
	Mon, 17 Aug 2026 08:28:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	io-uring@vger.kernel.org
Subject: [PATCH 3/5] liburing: add io_uring_prep_cmd_zone_reset
Date: Mon, 17 Aug 2026 10:28:30 +0200
Message-ID: <20260817082837.762276-4-hch@lst.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817082837.762276-1-hch@lst.de>
References: <20260817082837.762276-1-hch@lst.de>
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
index bd7bc64416d3..87b49f131d70 100644
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
+} LIBURING_2.15;
-- 
2.53.0

