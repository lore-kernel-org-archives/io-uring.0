Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A75647DD43
	for <io-uring@vger.kernel.org>; Thu,  4 Jun 2026 16:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780589270; cv=none; b=lMsBctmUE8LYSaAbl8LMEZc3NSvn3CPvn3nypTZ/P6fij0+awzm/kwaA8V6SqhCAO/SWILA7bz7O3eJx7QXl9YUuE4xR65kSLTW73053kwGJmcI5UI0XNMCPmu50uZX7f2KB+M6fdbQPJfm1kHvQinYi5RJ/PeeDvMrqrgSs5ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780589270; c=relaxed/simple;
	bh=ranHxghjt8dtpwZXJuV4fZcNf+r3JH7DF9j6NvHfzq8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R87eW2XV/RceZQQjsHT1op79lfZw7xR+Cxgx2z7wRe4NlmWC7HA1fDo7XIVGh678GOUB36gjtcWt36iAghC61ojSKlTV4bSt5b/4lnubhV+h1ngMNOerzefqikAqidZhzeCSBeKvpEm+n87QJLX6zOR7xzJ1/9KdagFZ1NsowCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=p5q81YuA; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="p5q81YuA"
Received: from pps.filterd (m0528005.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654DutX51173375;
	Thu, 4 Jun 2026 09:07:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=s2048-2025-q2; bh=UhE5YSKA3cbVQJ1A+c
	2O+xVMLYv2wUqX62l16wdobvc=; b=p5q81YuA7Q1t4J/UEzhydiyaTGNShNyCGm
	AdaY3FYu0uPCHrExV8qk7YahCXQvCHqjs1GQanTV4OHyxRNVRtzGbkelDHR2RJEW
	0AQXsdhFDkI63eXYHQg2N1fifCSfBzwbJ8NQQXpOKshSlQpQqRHJP3H/CENR+mA/
	NBXN68kCQX2NqnkpoG23ZwfKUGfdVj7sKN0xxkOmJhPMsBROuzlG675RVKewr4DJ
	rsovIH+T9wGN7Mgp9I5tAXUGF0+tbozowI200VDYtjlW5okkGwVlMfDRhB3SRaC/
	bb3frU4B+ety1iZdsBGl5YlsKRIpqBS725EyZES+CzPiVlYZZ6LQ==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4ek94vsdr9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 04 Jun 2026 09:07:47 -0700 (PDT)
Received: from localhost (2620:10d:c085:108::4) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Thu, 4 Jun
 2026 16:07:45 +0000
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>
To: <io-uring@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>
CC: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>
Subject: [PATCH] io_uring/net: inherit IORING_CQE_F_BUF_MORE across bundle recv retries
Date: Thu, 4 Jun 2026 09:07:13 -0700
Message-ID: <20260604160715.2482972-1-cleger@meta.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -ERDOPl_D19fgxw93G95s4xgp9CCYiiW
X-Proofpoint-GUID: -ERDOPl_D19fgxw93G95s4xgp9CCYiiW
X-Authority-Analysis: v=2.4 cv=L4MtheT8 c=1 sm=1 tr=0 ts=6a21a2d3 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=jCddH8ec0KUNCymVuxII:22
 a=NEAV23lmAAAA:8 a=VabnemYjAAAA:8 a=3fmZ9ie1pTvBIPzkAFMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE1NyBTYWx0ZWRfXxTrE9nlFeTSH
 GGYAmcfy9YOPuR45dVfkEcSUu1XuGAo/Lc8JbHKnil1DjVEx88ArulbDkd67E/e1F4qT/J2a+/+
 QtvsNOFsNW4VXYwDHc8IZptxYOsdy3lre744d9Hw/kz9O5Tmh0c6/lJksDlDNXFBwvhfXj5zDsO
 MGIIA6tSOUU3JMFvIvBgFrHpHKtqmXnZwXLQoPKrZFc1aLNXtnqYRlZ12VgkYPP//6cMZ6BtxGp
 jex3Zur0T2OpNbzSJ4T+iIOoXAalckKYfsqes5Z6nlVN9zsKsNnpaVxH8Bja3jRCEuyJukT0OOq
 rzz2xWukJUnCr4GZfCGUqxJTYd+mv/2A7X67m3ItxkDfx8Ze4ruFRT9etvfrhfC1FLNuuA4gbUO
 7MqJMg/lAUaj7+KFOORw2ESGpU923cwHbFTAt6pKM6CW3mKY9vqISZWYhqju0IrBivRNT7A5B45
 yKxXWuAYegQVH75hToQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01

When a bundle recv retries inside io_recv_finish(), the merge logic
OR the saved cflags from the previous iteration with the cflags
returned by the new iteration:
  cflags = req->cqe.flags | (cflags & CQE_F_MASK);

Bits listed in CQE_F_MASK are inherited from the new iteration, and
all other bits (notably IORING_CQE_F_BUFFER and the buffer ID) come
from the saved cflags. Before this change CQE_F_MASK covered only
IORING_CQE_F_SOCK_NONEMPTY and IORING_CQE_F_MORE.

When using provided buffer rings (IOU_PBUF_RING_INC) with incremental
mode, and bundle recv, io_kbuf_inc_commit() can leave the head ring
entry partially consumed, __io_put_kbufs() then sets
IORING_CQE_F_BUF_MORE on the returned cflags so userspace knows the
buffer ID will be reused for subsequent completions.

Because IORING_CQE_F_BUF_MORE was not in CQE_F_MASK, the merge above
silently dropped it whenever the final retry iteration partially consumed
the buffer, and the subsequent req->cqe.flags = cflags & ~CQE_F_MASK
save would have left a stale IORING_CQE_F_BUF_MORE in the carried-over
cflags had one been present. Userspace would then wrongfully advance it
ring head past an entry the kernel still uses.

Add IORING_CQE_F_BUF_MORE to CQE_F_MASK so it is both inherited from
the new iteration into the user-visible CQE and stripped from the
saved cflags between iterations.

A test available in https://github.com/clementleger/liburing/tree/bug_f_buf_more
allows to validate this fix.

Signed-off-by: Clément Léger <cleger@meta.com>
Assisted-by: Claude:claude-opus-4.6
---
 io_uring/net.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/io_uring/net.c b/io_uring/net.c
index 8df15b639358..ee848eb65ec9 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -842,7 +842,8 @@ int io_recvmsg_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 }

 /* bits to clear in old and inherit in new cflags on bundle retry */
-#define CQE_F_MASK	(IORING_CQE_F_SOCK_NONEMPTY|IORING_CQE_F_MORE)
+#define CQE_F_MASK	(IORING_CQE_F_SOCK_NONEMPTY|IORING_CQE_F_MORE|\
+			 IORING_CQE_F_BUF_MORE)

 /*
  * Finishes io_recv and io_recvmsg.
--
2.53.0-Meta
