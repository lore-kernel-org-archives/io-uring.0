Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6846423AB98
	for <io-uring@vger.kernel.org>; Mon, 16 Mar 2026 01:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773625020; cv=none; b=W8wNZV/D8Op5nUrVjbxBpgcIpAX1AJXzcy6hlgH4NAWoYVRWXtXKi8UqlT3vSVW8uDcol1Gn9EgIgA+YYGC7CyPkO5d1irL/IPK67A4rwSrLNGaUGS3onRfHK6qvudZYvG/VG+Y+LUe7tXGImsJMoSSnpRMTAUE3sOoRpZc42yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773625020; c=relaxed/simple;
	bh=5YOroMHL7brRQZ/Wqs1iPlmporf+PlH+NJBIRSPsQJg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PG3nph4Eh2fQrSJOSVr2B3cw3iRlXtIvXDBgz++p6I6tSBXC/sb71Y5jV4xWEX+UbKn3C7aOec25BzWcUflBtoAKb9tjyeZwS95Lfj2oQ94Ip6gUn+hgva4x2civnzUZG3PgQT80VHwlCG8HA8OK5+GuTWJ4sw4coFdhvVHJBbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mWSNKgMY; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mWSNKgMY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=WT
	FbsBosCh+emNk3UCrpBiVosL80zhNJuR6y7Qs6KFs=; b=mWSNKgMYxh8zhjTES5
	1fmnLsfqflNd4+8pst8+1vVE7QpwATXCMNVwKfPTXHhUhOi+nMpBL7+1ORziS9dM
	QXgBm+qT3Og+RgpSd6BI/zGxlNPqlrWu+CWjXiuai2Wyoj0Laes30+ykb0IXQ4rP
	TJhDv29+q0U4if5WKzY0FBwxQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wB3LduWXrdpW5DGBA--.28271S4;
	Mon, 16 Mar 2026 09:36:29 +0800 (CST)
From: Yang Xiuwei <yangxiuwei@kylinos.cn>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Yang Xiuwei <yangxiuwei@kylinos.cn>
Subject: [PATCH v2 2/2] test/cbpf_filter: fix build when openat2.h is not available
Date: Mon, 16 Mar 2026 09:36:21 +0800
Message-Id: <20260316013621.115939-3-yangxiuwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260316013621.115939-1-yangxiuwei@kylinos.cn>
References: <20260316013621.115939-1-yangxiuwei@kylinos.cn>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wB3LduWXrdpW5DGBA--.28271S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrW7ZryrXw1fKr1xGr1DAwb_yoWkGFbEk3
	4Iyrn7Kw1YyFyUA3Z8JF13ZFW5Kw4FvF1ruF1Fvry5CF9Yy3s3Ka1qyF4qyw43Wrs3Xa43
	J3Z8t3y3Kw12kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8zT5PUUUUU==
Sender: yangxiuwei2025@163.com
X-CM-SenderInfo: p1dqw55lxzvxisqskqqrwthudrp/xtbC6h0Hl2m3Xp2AUwAA3p

cbpf_filter.c included <linux/openat2.h> for struct open_how and
RESOLVE_IN_ROOT, so the test failed to build on systems without that
header (e.g. older distros). liburing's compat already provides
struct open_how; add a fallback #define for RESOLVE_IN_ROOT (0x10)
when the header is missing, so the test both builds and runs on
old headers with a current kernel.

Suggested-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Yang Xiuwei <yangxiuwei@kylinos.cn>
---
 test/cbpf_filter.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/test/cbpf_filter.c b/test/cbpf_filter.c
index 41fd284e..b80b1503 100644
--- a/test/cbpf_filter.c
+++ b/test/cbpf_filter.c
@@ -15,12 +15,15 @@
 #include <sys/wait.h>
 #include <sys/prctl.h>
 #include <linux/filter.h>
-#include <linux/openat2.h>
 
 #include "liburing.h"
 #include "liburing/io_uring/bpf_filter.h"
 #include "helpers.h"
 
+#ifndef RESOLVE_IN_ROOT
+#define RESOLVE_IN_ROOT	0x10
+#endif
+
 /*
  * cBPF filter context layout (struct io_uring_bpf_ctx):
  *   offset 0:  user_data (u64)
-- 
2.25.1

