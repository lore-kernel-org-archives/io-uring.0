Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774DB29D29F
	for <io-uring@vger.kernel.org>; Sat, 14 Mar 2026 08:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773477361; cv=none; b=q7gI0d9PLH3OqeU8oJ/IzUnmQ2zztPi74EyXG7vlFpKZAA1XNV2gCdFxDN1mpFRl4IiP6vPBf406rObVsC9Z6grdfw+EgTY2yHKbxtzTrp+oaUHlHNxInFk8qOeo6qgACMtJdwL476gpCnubxx3GCUW73pe9Y77+HD8vdt8ASPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773477361; c=relaxed/simple;
	bh=0tWe3neHBNPW6qJwcoQGvgNHvmg1MPnzuvXO9uG5yPM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bFNnsnAjrZIStQRy7r7QNsKRLKXGneyQhqLh6pu2H2b+2bXDZecmRqfTdnn9rlz/JmNa3CPZgQhCJKoACuhA8A+Nti418gr5GcuRZ56yDfSPbI0sIUFRdlKsYiFGoDaeoBjr49mHCWugNZUEfKpEqMFVnbzPi1gbCfGQr19C9x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=fssnjJ/S; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="fssnjJ/S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Kq
	uBmAA8LKl1pDrP1G31/N39KV5jcr11iMDdYhJD/5Y=; b=fssnjJ/SDMJkN1UM2p
	3ra6PlFoLN/Ald12xyUoixqvhx1E+SFrRuxRMZJJ8Dz33oVtMAEGmeOKNVNQ0CBx
	FvnXtfnurevR07+P9byEWsuvYjqAhcpfvslSw0hWGdYHe8xLDCqYludwh3Kk3AT2
	HVteCkapap/VGwXjcKIp8giIU=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3P4zcHbVpWkWgAw--.7725S4;
	Sat, 14 Mar 2026 16:35:44 +0800 (CST)
From: Yang Xiuwei <yangxiuwei@kylinos.cn>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Yang Xiuwei <yangxiuwei@kylinos.cn>
Subject: [PATCH 2/2] test/cbpf_filter: skip when openat2.h is not available
Date: Sat, 14 Mar 2026 16:35:38 +0800
Message-Id: <20260314083538.791693-3-yangxiuwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260314083538.791693-1-yangxiuwei@kylinos.cn>
References: <20260314083538.791693-1-yangxiuwei@kylinos.cn>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3P4zcHbVpWkWgAw--.7725S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrWxKF47WFW7WFyDXFW3Awb_yoW8Gr4Dpa
	n5Ca1jkan8Z3W5Jw17tFs7C345Kws7ua18Zryj9a4xJrn8W3Wqyr4ft3WjyFn5XFWfXr1f
	W3yvg3Wa939FvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j1ZXOUUUUU=
Sender: yangxiuwei2025@163.com
X-CM-SenderInfo: p1dqw55lxzvxisqskqqrwthudrp/xtbC6QBH12m1HeB4YAAA3A

cbpf_filter.c unconditionally includes <linux/openat2.h>, so the test
fails to build on systems whose kernel headers do not provide that
file (e.g. older distros or LTS). configure already sets
CONFIG_HAVE_OPEN_HOW=n and provides struct open_how in compat.h for
the library and other tests; only this test bypassed that by
including the kernel header directly.

Wrap the entire test in #ifdef CONFIG_HAVE_OPEN_HOW and add a stub
main that returns T_EXIT_SKIP in the #else branch. The test then
always compiles; on systems without openat2.h it skips at runtime.

Signed-off-by: Yang Xiuwei <yangxiuwei@kylinos.cn>
---
 test/cbpf_filter.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/test/cbpf_filter.c b/test/cbpf_filter.c
index 41fd284e..050b3ac7 100644
--- a/test/cbpf_filter.c
+++ b/test/cbpf_filter.c
@@ -6,6 +6,7 @@
  * Unlike eBPF which requires a separate compiled program, cBPF filters can
  * be defined inline as an array of sock_filter instructions.
  */
+#ifdef CONFIG_HAVE_OPEN_HOW
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -1443,3 +1444,10 @@ int main(int argc, char *argv[])
 
 	return total_failed;
 }
+#else /* #ifdef CONFIG_HAVE_OPEN_HOW */
+#include "helpers.h"
+int main(void)
+{
+	return T_EXIT_SKIP;
+}
+#endif /* #ifdef CONFIG_HAVE_OPEN_HOW */
-- 
2.25.1

