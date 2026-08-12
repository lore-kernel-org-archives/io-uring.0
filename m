Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20D244BC82
	for <io-uring@vger.kernel.org>; Wed, 12 Aug 2026 13:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786540383; cv=none; b=DmnxIrWnBBmC8krNyHYrThfrdQ32++wLlYaGJ2JTIoKsUsqG4UT6nZdOr0y7GZbXa/n3QCPlDkjKKSomK+t5/hVl+4JYhC0U3HPwcHtMMSRrNPERbsHdWVJEmKlwxDjLzJlXCJoMmVKqim/KSj/CDpUNr01K736viXCUetv/EG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786540383; c=relaxed/simple;
	bh=cp3nZ0dviJMUm7oPxAT7N8tm9/evvCgXVFxyOFnW868=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OTA0ZDOwdRjtBLABBp0VQgswXQvlCqlbzu+gS7H0aWwjk4RSPsM7P7XvuWJ1DpNEJByyBG7O6jJ8Y13uuCiv6H77yZSrm/KiFaUEt4QL4QFv05MdNLRKSac8EzhRuqBDJf18MF7eNlX9pXMysttO+eiuCKojRI5QzTsKO5dME6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UPMHyODx; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UPMHyODx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=slOin60mLr5SiRc3+4WGV4MCQwrUzfjh/msuv6cGL/Y=; b=UPMHyODx1aq88BgYUAfGIOsZUF
	yt7pbXzy7drBTom/dEkLx/jxH39ej4t09P86+E7vUwImll7faAv4DlNNU3/eb3ggAXK7W6lVFoOx0
	qh4RK6Dd2+9Zx9y/BXsdfGD3FFI6UuYktZZNtoRY9RDOmIyacOEZT2WCOy8pXpGzY6iwBEd6cy0yM
	5B9HH60Ny3vJ6FFPCsxRACIoK9x9fB2/MhT1OAFqPJ0B8VWkDMwLiJxebxSSvXmDin3QCJtH0aS7L
	8DXrZYP9Zj9Aaox/qUHb3/BbEJEAlgAhu+82PWvPFI1uKOWvX4WaOKGkXL3R728yy4BxNF4S2VEw3
	IEWINQZw==;
Received: from [66.186.210.122] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu8lR-0000000GFoJ-04kU;
	Wed, 12 Aug 2026 13:13:01 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	io-uring@vger.kernel.org
Subject: [PATCH 4/5] man: add io_uring_prep_cmd_zone_reset_all.3 man page
Date: Wed, 12 Aug 2026 07:12:51 -0600
Message-ID: <20260812131255.258582-5-hch@lst.de>
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

Add documentation for the new zone reset all io_uring cmd.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 man/io_uring_prep_cmd_zone_reset_all.3 | 54 ++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 man/io_uring_prep_cmd_zone_reset_all.3

diff --git a/man/io_uring_prep_cmd_zone_reset_all.3 b/man/io_uring_prep_cmd_zone_reset_all.3
new file mode 100644
index 000000000000..9512fa6bbe73
--- /dev/null
+++ b/man/io_uring_prep_cmd_zone_reset_all.3
@@ -0,0 +1,54 @@
+.\" Copyright (C) 2026 Christoph Hellwig <hch@lst.de>
+.\"
+.\" SPDX-License-Identifier: LGPL-2.0-or-later
+.\"
+.TH io_uring_prep_cmd_zone_reset_all 3 "Aug 11, 2026" "liburing-2.16" "liburing Manual"
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

