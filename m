Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959151E0DE8
	for <io-uring@vger.kernel.org>; Sun, 26 Apr 2026 11:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777202874; cv=none; b=A3+Kycwvamb+KzOc6o8+of74nIcxlDeeHdgPfv9uw4E3Wy6glVDDE7yw/B8e6FODoODKBjOXfJrom1RoyDnTPCNYJ5q9tXSKYsb2sT/gQGOfT/oOm1Fe0RvWl9OlFj3NnIOUe9qrfYUtuu7MHgxfgTytecg+ul/sAdndnXeLEm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777202874; c=relaxed/simple;
	bh=XwX4X4KFeq9barroBiPxBDLOlXCuwSHtVn6u5AeMLmA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D2WsHTDrW9alJqSZ0rxJOK21YrUk+PHkX8SYp8KarknApTMMJ0iT5ObkkfB347DVH7KcBI5kiPfa2J4wn+fqcw97QII4e4zwxEgtsSho+Zkt4J3pXfAIuJ0l4FkA0oPLBiweh4x9NMDAcRrrir3GglWeGcvwGWZD6HIERFcsT3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=NlSRP0DE; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="NlSRP0DE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=MI
	xUqq93JVNNwTe8Cawpq6riu4a6pich3cqObY9Msog=; b=NlSRP0DEO2EDknC9gZ
	QESd/PozTDfMN87vDZ7pEZctExi4SyZXND7ODt2AWWXCTfJquILi6Uj8fH4wHGwg
	0Qf02hyT0nBUmJyQtDHDzUa4yvOV9pD40dklmkfuEVC4OZ7Q1FP8QcyvzEPpBKvd
	PPevfno6udkxTa9OjIAtJqFWc=
Received: from haiyue-pc.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgCX1OSq9u1ptpJ3Bw--.6916S2;
	Sun, 26 Apr 2026 19:27:39 +0800 (CST)
From: Haiyue Wang <haiyuewa@163.com>
To: io-uring@vger.kernel.org
Cc: Haiyue Wang <haiyuewa@163.com>
Subject: [PATCH liburing v1 1/2] tests: fix bpf ops build error
Date: Sun, 26 Apr 2026 19:27:30 +0800
Message-ID: <20260426112732.300165-1-haiyuewa@163.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgCX1OSq9u1ptpJ3Bw--.6916S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF1fAr15Kry7JFyxZF1UKFg_yoW8CrWfpr
	Z0vw43t3yjy3yxWF1kWFWSkFy7tF40k3WjyFWUWr1jyFyxXasFqr4jkryv9r1fXrWYvrWY
	vasF9FZrurWDXwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR_HUhUUUUU=
X-CM-SenderInfo: 5kdl53xhzdqiywtou0bp/xtbC8Au9KWnt9qvceQAA3T

If removed the previous install by 'rm -rf /usr/include/liburing', the
test build will fail:

make[1]: Entering directory '/root/linux/liburing/test'
     CC helpers.o
mkdir -p output/bpf
     CC output/bpf/nops.bpf.o
mkdir -p output/bpf
     CC output/bpf/cp.bpf.o
In file included from /root/linux/liburing/test/bpf-progs/nops.bpf.c:2:
/root/linux/liburing/test/bpf-progs/../bpf_defs.h:9:10: fatal error: 'liburing/io_uring.h' file not found
    9 | #include "liburing/io_uring.h"
      |          ^~~~~~~~~~~~~~~~~~~~~
1 error generated.
make[1]: *** [Makefile:387: output/bpf/nops.bpf.o] Error 1
make[1]: *** Waiting for unfinished jobs....
In file included from /root/linux/liburing/test/bpf-progs/cp.bpf.c:2:
/root/linux/liburing/test/bpf-progs/../bpf_defs.h:9:10: fatal error: 'liburing/io_uring.h' file not found
    9 | #include "liburing/io_uring.h"
      |          ^~~~~~~~~~~~~~~~~~~~~
1 error generated.
make[1]: *** [Makefile:387: output/bpf/cp.bpf.o] Error 1
make[1]: Leaving directory '/root/linux/liburing/test'
make: *** [Makefile:14: all] Error 2

Add the include option in 'CPPFLAGS' for bpf build.

Fixes: fd8a6e66c739 ("tests: test io_uring bpf ops")
Signed-off-by: Haiyue Wang <haiyuewa@163.com>
---
 test/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/test/Makefile b/test/Makefile
index bcb97da1..05e1f9e9 100644
--- a/test/Makefile
+++ b/test/Makefile
@@ -385,6 +385,7 @@ CLANG_BPF_SYS_INCLUDES ?= $(shell $(CLANG) -v -E - </dev/null 2>&1 \
 $(BPF_OUTPUT)/%.bpf.o: $(BPF_PROGS_DIR)/%.bpf.c $(wildcard %.h)
 	mkdir -p ${BPF_OUTPUT}
 	$(QUIET_CC)$(CLANG) -g -O2 -target bpf \
+		     -I../src/include/ \
 		     -I$(BPF_OUTPUT) $(CLANG_BPF_SYS_INCLUDES) \
 		     -Wno-missing-declarations \
 		     -c $(filter %.c,$^) -o $(patsubst %.bpf.o,%.tmp.bpf.o,$@) -mcpu=v4
-- 
2.54.0

