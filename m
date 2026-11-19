Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.19.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795061452;
	b=fdZ+p8Y52dgp8pGWkArsLoDnjbzW+UhK1PPqHL5ZvAh4YbciIaH8p1WBT3jpf1DwsNcX
	 fZNkqmqW+q5zEcN7RqEHQbZTKEerTO5d0X1CPdVgg9FOjt4bnlxWKnS36YhOht40EJwuK
	 +oivje03/2eP0puaiRWFSKpxkOob0SIOFM2eDg92SSruwFRVRrfpv0h0h8qVZ15ux2kSl
	 I9v5vBk3iujfXOtayw0Nl3db894c7P2BxReT3EtoI1AbCT4J8yUVrECo9dUtb9pdUCNtV
	 zv5DpyLUbzLFK62Oe+GymFQQA62YJjSSG7hRG/uSrp4uUnF2sxdR5OdahnVNa8qIFfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795061452;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-QQ-SENDSIZE:
	 Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=2x7iGj9/gbFarsl4wREpZGAUwTWKd6dE6I6PNtRVRTg=;
	b=q0UXozIiS1Q5YsWaSY2+9aPBKofwm1kPegZ3pxTUKWtDzwMBt666a1/x6iaCeM2emABR
	 F6Xkll6ZeJSupXfGnPG0iPZqTJYNf+xQU6DE2kdxjN0RXVj9c78gIBSp7F6Cq2yFSmEid
	 WaqUAk1qxGJBJn6eh/CJ+2mmBwQS1XBXJnBJY8XCuNTnI6f+Fo6w2XJImwoI6CXfADcSf
	 4RrjtpjsgM9Uj89pHbmeckaV22l0dVyKLATmET+pRI5JEl+k2ron9Dae/IsN7k/zP+6ei
	 mMvTFDhGrek7VuDqCafw+7WQ+k4ooIDWt0TX0P+qA5yZnUUCZMrapjLNmpI7ltukMhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b="IKr/+NpE";
	arc=none smtp.remote-ip=54.207.19.206
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F1E606A320;
	Thu, 19 Nov 2026 04:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3F1E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=IKr/+NpE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1795061425;
	bh=2x7iGj9/gbFarsl4wREpZGAUwTWKd6dE6I6PNtRVRTg=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=IKr/+NpEZGW6NzIZUI6h3Iyrcnkosb33MP0m5oIE6nn0DxFZkUzH4tZhJ+MlCoMy7
	 0PPT79tOcWf/w+thyr7pL4g57+lgjaLWz0kDtALfeZtPls1fHCJeo0vLvy9blr1TG6
	 LbuAW3wMkL9p57pWZ3vP+NB+SQBwrU7Vvp4EuKgw=
X-QQ-mid: esmtpgz16t1795061419t4e617dbd
X-QQ-Originating-IP: SOLS2pGVyuWDAfGf+Hmtmzyz0KFh/P69Pvc0/DPzaKU=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 19 Nov 2026 12:10:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2139939805296085442
From: Yichong Chen <chenyichong@uniontech.com>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] io_uring/kbuf: only drop an old buffer list on success
Date: Thu, 19 Nov 2026 12:10:17 +0800
Message-Id: <20261119041017.1118227-1-chenyichong@uniontech.com>
X-Mailer: git-send-email 2.20.1
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
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OW3qjH3bC/TASPgelUh10x6p0qEoKkhgjoc8fjelrn+b9Z47JtGE9EQ1
	817A6yL5ZDmo3G1YDtGpciYcPav+l3OxjgciQLGq5WjEdNS6isIZO69JNqdh4Kqgmk/MZC/
	wKcYGYVoXsr33Coot7zHbaLKdFqaW7lYOVogbpwsiK4SubY3fI1hBm7+Vsp7/2sPYB19gig
	TDYnUYyP1gTclIKSNvS6yoPhtvqS+OTLrxpfEUxp44nnDJIA5Qnv05OJ/sKx0dhZib92vKa
	Ym+huG0XYGM6b9i10/SjpudwhcuGszLddxyZt5l5+dNHfZGSmI/SJFQJtsBvValECARz7jV
	c3lgdtcEDdf7rufTtm7sEQCOu4/E4afFPl1tblFJaj3j51JitTVdT1f4VGQ2/Sks0028brX
	mTAv+o/T6/C3KjIeViTSjhKcFLwwBKtSVu2P9XOSPypX+ifBinYfdN7iu02kXBr28k2X1AY
	+SX1kU2sGbPBAZDuYsHnWE6OEjUCgqCMKyDyGJ8NfTdVvbPNo4ov+722j0CiZqzhAHlzSnL
	LoGuvJGIDLPsDXdpJ1TEog8nJb70pMl53Q6mt17O/XI4L4+cdzGRweRvsnvpupP3kixpOE4
	YBtEoBf/U3sUOAvbrYO6SDwBJzYwwb3j1s+rlw/PJknmxAUeyrXXU7Iy9K5KViKcB5XrvfR
	W/qvkK5ClddGGRRGK6adeED58Yhss3rEpFgbKYJzfLrdx5QjwWrOkbBIiQPElJY2vtWC8jK
	Sbbo9dFsSIEZpS/l9vAmYmwMeMIbpHrAxLGUm6VyQodB0Ym7JoM5I4P3kw2J3nIFYd8Usjb
	WffJ+9FRhmeF3MZwbuq2P/4MX9Y1YSodvMMMMfQgydJ0rOO4mkJsI/F4Ps5nDxRs7z7VeAF
	/Gj4DMaW7jDgnSnmmURJOL84YjMHOBuAoMQeKVUl9tS7+GibvP246T9BstuvHd/9A4MyZjC
	CJuD83+OW0QFp4hvJTQp3RVYQLoINW4BcNJ+CWbapTAbEOgxDf97k9OjcNsvElUSYLMJHkN
	RPqw44sQ==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

A buffer list for the bgid is dropped before the new list is allocated and
before its region is set up, so any failure after that point (-ENOMEM, a
region that cannot be created, or the SHM_COLOUR alignment check) leaves
the caller without the empty legacy group it had. Keep the old list until
the new one is fully set up.

Fixes: 8802766324e1 ("io_uring/kbuf: reallocate buf lists on upgrade")
Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
---
 io_uring/kbuf.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/io_uring/kbuf.c b/io_uring/kbuf.c
index abf44f5..e785ca8 100644
--- a/io_uring/kbuf.c
+++ b/io_uring/kbuf.c
@@ -632,7 +632,7 @@ int io_manage_buffers_legacy(struct io_kiocb *req, unsigned int issue_flags)
 int io_register_pbuf_ring(struct io_ring_ctx *ctx, void __user *arg)
 {
 	struct io_uring_buf_reg reg;
-	struct io_buffer_list *bl;
+	struct io_buffer_list *bl, *old_bl = NULL;
 	struct io_uring_region_desc rd;
 	struct io_uring_buf_ring *br;
 	unsigned long mmap_offset;
@@ -662,7 +662,7 @@ int io_register_pbuf_ring(struct io_ring_ctx *ctx, void __user *arg)
 		/* if mapped buffer ring OR classic exists, don't allow */
 		if (bl->flags & IOBL_BUF_RING || !list_empty(&bl->buf_list))
 			return -EEXIST;
-		io_destroy_bl(ctx, bl);
+		old_bl = bl;
 	}
 
 	bl = kzalloc_obj(*bl, GFP_KERNEL_ACCOUNT);
@@ -707,6 +707,8 @@ int io_register_pbuf_ring(struct io_ring_ctx *ctx, void __user *arg)
 		bl->min_left_sub_one = reg.min_left - 1;
 	if (reg.flags & IOU_PBUF_RING_INC)
 		bl->flags |= IOBL_INC;
+	if (old_bl)
+		io_destroy_bl(ctx, old_bl);
 	ret = io_buffer_add_list(ctx, bl, reg.bgid);
 	if (!ret)
 		return 0;
-- 
2.51.0

