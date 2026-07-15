Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF9D25B088
	for <io-uring@vger.kernel.org>; Wed, 15 Jul 2026 06:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784097603; cv=none; b=aRRiIilUnYB00vW2mQDEXso0R0QHgFB0NPDVlzNOo9Iwfx+5WH9qUuFTrI746X6YXcpWEuGecfmXHe7cJQ26JYKVqIbObjjEzAQNexe2cmOKzpp5jv2mBHultRv7Fx4VX9kdfDuOzxHrUORR82bwQm9j1qdLnX0f8tLbbKDIWg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784097603; c=relaxed/simple;
	bh=wBiE/Ku3K/4QLAyB0WdAqhrMn2SWi5bHDsMPU4TNDfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u8O/KiH6XSd7qqG1tlMFhCH/+XrVfTu5WtCAZ4alj6d/tI7fWxp0s+QwnsO4VxJvU+FkI96Al2CfQUfSjOcMG12hen98Dh2/MBVHZi8TvE25PNUnOUsVkMRC+h2y01hF4rD4fnrzGahjSujNj52cCgZRZKloo5o28Pvemy6Brxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fQQvARK5; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fQQvARK5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=aFAHUpJEGKEjATzsaqbtoyBud6e/d3G3sDVJI67vTY8=; b=fQQvARK5WgOgsxp1XXLiTt/zwS
	H1N0lnI2HHZmfgN4OMLQmvrxurofseXcpv6ifzr59srbDdZjM584MgW1u0kwR/nb4neW610Wno7tC
	pvL1hB2t5o5EKqnuB2P6jkpAcGBF+ohnNlHlWMd21DnmOcUf5x8lEKNsOWRhjKLJRj5AGO4Pb1J0C
	4BmuboYWsTDh78AqHVNQxBLwYj4ZsMUKXm+addrCjaTG+vqgsOSPUlUU5OcX8/cW6V3njBRjEmcG6
	DTj8byZlzlKSANMbDKfo/GejvwgQqHFtdupJSmiVshdAYpcuHW9IlEu1WG+TaK/9n7LquS9yns2iJ
	+R09tRVQ==;
Received: from 2a02-8389-2301-9f00-3397-c9eb-6d8a-9179.cable.dynamic.v6.surfer.at ([2a02:8389:2301:9f00:3397:c9eb:6d8a:9179] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjtHl-0000000DvD8-2kYd;
	Wed, 15 Jul 2026 06:40:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	io-uring@vger.kernel.org
Subject: [PATCH 4/5] man: add io_uring_prep_cmd_zone_reset_all.3 man page
Date: Wed, 15 Jul 2026 08:39:31 +0200
Message-ID: <20260715063947.2933606-5-hch@lst.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260715063947.2933606-1-hch@lst.de>
References: <20260715063947.2933606-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Add doccumentation for the new zone reset all io_uring cmd.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 man/io_uring_prep_cmd_zone_reset_all.3 | 54 ++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 man/io_uring_prep_cmd_zone_reset_all.3

diff --git a/man/io_uring_prep_cmd_zone_reset_all.3 b/man/io_uring_prep_cmd_zone_reset_all.3
new file mode 100644
index 000000000000..251a300c5ed1
--- /dev/null
+++ b/man/io_uring_prep_cmd_zone_reset_all.3
@@ -0,0 +1,54 @@
+.\" Copyright (C) 2026 Christoph Hellwig <hch@lst.de>
+.\"
+.\" SPDX-License-Identifier: LGPL-2.0-or-later
+.\"
+.TH io_uring_prep_cmd_zone_reset_all 3 "Jul 14, 2026" "liburing-2.8" "liburing Manual"
+.SH NAME
+io_uring_prep_cmd_zone_reset_all \- prepare a zone_reset_all command
+.SH SYNOPSIS
+.nf
+.B #include <liburing.h>
+.PP
+.BI "void io_uring_prep_cmd_zone_reset_all(struct io_uring_sqe *" sqe ", int " fd ");"
+.fi
+.SH DESCRIPTION
+The
+.BR io_uring_prep_cmd_zone_reset_all (3)
+function prepares a zone_reset_all command request. The submission queue entry
+.I sqe
+is setup to reset all sequential write required zones on the block device
+pointed to by
+.IR fd .
+
+This command does not synchronize against concurrent file operations, including
+but not limited to reads, write, ioctls and other uring_cmds and only performs
+a best effort invalidation of the page cache for the device.  The user has
+to make sure that no other in-flight requests are modifying or reading the
+range(s). If that is the case, it might result in stale page cache and data
+inconsistencies.
+
+Available since Linux 7.TBD.
+
+.SH RETURN VALUE
+None
+.SH ERRORS
+The CQE
+.I res
+field will contain the result of the operation. On success, this field will be
+set to
+.B 0 .
+On error, a negative error value is returned. Note that where synchronous
+system calls will return
+.B -1
+on failure and set
+.I errno
+to the actual error value, io_uring never uses
+.IR errno .
+Instead it returns the negated
+.I errno
+directly in the CQE
+.I res
+field.
+.SH SEE ALSO
+.BR io_uring_get_sqe (3),
+.BR io_uring_submit (3),
-- 
2.53.0

