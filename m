Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7683624D4
	for <io-uring@vger.kernel.org>; Tue, 16 Jun 2026 12:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781613404; cv=none; b=TZmPFwIn0mUkQbZykDIuqDB+Mk4sS9FZKepl0Ap2eLfzfDUCy2zPchfE9o/zThR05NrEpsEczSjME0vQYh0HK4MvfyABtFCy3Btj5ALeGVhEF+uOpT4K2Q2KieXeywefNlc/xRDfycvFLStDZIo/2hy9Oq5lGtgQ1bGiqhIKBgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781613404; c=relaxed/simple;
	bh=AQu0bGG4P5sk44ih0WOlfIlUFx15WXJenCKRn7z3Fzs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bnx/SfdTeYCF+ghpxoOLS4fQdBrlifA5ly+ap+h/b4xq1yrsEKEdfmSqj5XPe2PKZH+90HYXsYDeyQhBRY5FW15xjAZ2qknftgml/zWlXsdpX+vydHIZAt5pGBdYckWpEiLN4Guenhj9bWNj9XaNEnaY+Ix7kPxtDN4kYNqZlgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ON5CSeS6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ON5CSeS6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781613402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CWlLwoh5y3iVjDYKyZhWzTfzwRycOW+LCm3ThLAWCnE=;
	b=ON5CSeS6pzVVZvUzbG1W6/FTaDLqLHxZ23wyAiqzEYiPBobhn/uko3v0uW8fpkKmWTGikS
	UNBPg5yYKCyMLwJ5ylwkt0rrCdQK+K2iTEJwE0p1yUwfq1DEDrbjWCRZQgBJaX6Fg2FzCm
	tXQ9ZjEIb1MtFf3w1qXiw7ekCWF1r1w=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-84-ESBi7erwNUiVoQ2ga2-Kpw-1; Tue,
 16 Jun 2026 08:36:39 -0400
X-MC-Unique: ESBi7erwNUiVoQ2ga2-Kpw-1
X-Mimecast-MFC-AGG-ID: ESBi7erwNUiVoQ2ga2-Kpw_1781613398
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 669551805C01;
	Tue, 16 Jun 2026 12:36:38 +0000 (UTC)
Received: from wsxc.redhat.com (unknown [10.96.134.57])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CA9B81955BC1;
	Tue, 16 Jun 2026 12:36:35 +0000 (UTC)
From: Ricardo Robaina <rrobaina@redhat.com>
To: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: axboe@kernel.dk,
	paul@paul-moore.com,
	sgrubb@redhat.com,
	Ricardo Robaina <rrobaina@redhat.com>
Subject: [PATCH] io_uring, audit: don't log IORING_OP_RECV_ZC
Date: Tue, 16 Jun 2026 09:36:32 -0300
Message-ID: <20260616123632.3209545-1-rrobaina@redhat.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

IORING_OP_RECV_ZC is a read operation. Audit only tracks file/socket
creation, not subsequent reads. Set audit_skip to align with
audit-userspace uringop_table.h.

Fixes: 11ed914bbf94 ("io_uring/zcrx: add io_recvzc request")
Suggested-by: Steve Grubb <sgrubb@redhat.com>
Signed-off-by: Ricardo Robaina <rrobaina@redhat.com>
---
 io_uring/opdef.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/io_uring/opdef.c b/io_uring/opdef.c
index c3ef52b70811..fef134a21113 100644
--- a/io_uring/opdef.c
+++ b/io_uring/opdef.c
@@ -519,6 +519,7 @@ const struct io_issue_def io_issue_defs[] = {
 #endif
 	},
 	[IORING_OP_RECV_ZC] = {
+		.audit_skip		= 1,
 		.needs_file		= 1,
 		.unbound_nonreg_file	= 1,
 		.pollin			= 1,
-- 
2.53.0

