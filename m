Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792767016;
	b=pV0i8S+1ukDPMIT2v32fgKCQkNSJjT/Hw6Lqsaib5IKtYGgj2XB2Ynt10HTXRHlyMYrY
	 d9C6uP9PCRZls7gZD6yhJDvHcsOpz6IxQznfeYvjA1xOOy4x0nrKHdfW3Y30GfF2XHLUe
	 Gme4bC8jzmOOtsLSc7Pv/sQIuM3Hreio5DO/0Xy+bMqZpLjEerui3GfXk3gTEoNJfYYnf
	 lxvm/Nt00Lhom82KSETKIHjEPlb7mMLSeLZ2Cg+0lWIyGdaXIAjTQI9cu6zp5REaI2HJP
	 +KN4FvWfzF5HAKubCoI2nGEX64pzVYvKfiukco0mPDEbs5QM7wXYHqdol6pyjLpcfmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792767016;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=NjWFtdnBgSFOZ3uhfMFqtap/ADctSoImeN+zujiPObw=;
	b=TIEH6rdf/VbHYdqi6Qqs2xqKZNNVcpEfdQ5PhRNcw2AV9s2e4DUuilt7o7cwKGdJvwnE
	 KpRviJtFkkl+pL7mHC6C3Ar4+oBR1beesYAyjpcKx/py98fNTA5rm4TNOfxxMPKWoJ/Za
	 HPIHFGfXcp8YIFLY/rPfO5kam3krHP44AY0YzLfN7Y2WmMZ+EyUG08QlqXuZB/QmKk2w8
	 JM4aqpzkFTd5kO8uxIwVdbmTLLjIwugo+7mpaV6tI2wW/im8ljp6Ux8F4ZuWU0QwweD4N
	 JCmbycIm/tAEnqH9vMn1QCq134LPkfgrfKhCHVBM/LzTxYrtStiQoEQHyUu+7N3+E+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b="fmo9C/Vm";
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8033A606A31A;
	Fri, 23 Oct 2026 14:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8033A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=fmo9C/Vm
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6mHI4008465;
	Fri, 23 Oct 2026 07:50:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps82601-s2048-2026-q3; bh=NjWFtdnBg
	SFOZ3uhfMFqtap/ADctSoImeN+zujiPObw=; b=fmo9C/VmYtpi/Ko0sea2FYL41
	tfzzOQVmRofxDoG3T3YRFyDLUJ6ajUXsgWC/1hwqqr4Z7b2LrNcBu7I4Y67LXdEU
	86gjxu4vC7s9B1PIx4tepUKzYPN6L96GWJZ9b0zmQqJVxab6etTezwXqGXhqhnKt
	2UWtL0uyqjdSYLMTq2IfCXBYJhzFduSsn9TBJN5gVDzPCDtqoLn5b/N274csERxN
	WqfaiW8rbjSTw9pmqw8hophsz6rmQebRtehOK03DIwCWPh0+3vF5XdKAtfiXWzU2
	W8Rjt+VAle7DMgyrxVhOD/4Spf8lWuXiAlw8XIHjTTVwSnKtbIJAeKH5S0YnQ==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hf9ftuerd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 23 Oct 2026 07:50:13 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1b::30) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 23 Oct
 2026 14:50:12 +0000
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>
To: Jens Axboe <axboe@kernel.dk>
CC: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>,
        <io-uring@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] io_uring/net: Remove useless min_not_zero() usage
Date: Fri, 23 Oct 2026 07:49:52 -0700
Message-ID: <20261023144953.3584118-1-cleger@meta.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: N1cR58WM3BlUZOydOBDlZQDsmvhu3j2j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1NyBTYWx0ZWRfXxyVfojqUFVoN
 rXDvTFiVPiCJSUNt5wgVXSHIBHJk2nVrn0Bf08pkw9rvbhoQBKQxIlbZToknzJWP0Zkm4rjY4mC
 HW8OGXjH64NNULXK3YQajAJDFutV/Ks=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1NyBTYWx0ZWRfX7nF65pFPNXwh
 krjU4HoLdV+hAOWf5eONww2pVSBNCggCvBdyxBK/07LT5keNPQMi17uF1ZockgeIEyc6UdsFNV9
 C1xuyfhWnkjorfQtCYqp8KwhCkj2QPDi3tqKvK1ZPEt8taKkDmCdm03xtFxs+aOYmKnQmlHoLUZ
 74DV5r4O4B9dq9yAI6+FqOvBMPdXznU8CfjblgzVZYYePsE1vBylqW/LOQMrBSOmy+iuxO9XJOL
 scQnM2WbI0Sa19OWZDaNDgEi/8FkzrJ8IzgGA+t9xHQajBhpbC3XrqI/hI66FI82OB9d00/m69N
 gWtqxrM8XsAVE3YjYICrmjh02CpdbXn4XZxYJVbp2evQzNWSK3iMC9uzdWjKyPUFDtK33hh7Vlw
 b+Et5ETcHvVaCPlvtduFA+tvserQlAyED93Uziqf+SjPFjC8l3SFjqx/3iyRgq46q3y12r6JKe1
 jmg+tEF94IH3kncov7w==
X-Proofpoint-ORIG-GUID: N1cR58WM3BlUZOydOBDlZQDsmvhu3j2j
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6adb7425 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=JnKecZnUtZousrUlYMGU:22
 a=VabnemYjAAAA:8 a=CJ9Eo-JWUmPYsR3IkTAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01

In the else arm, sel->val is necessarily 0 so the min_not_zero() actually
always returns kmsg->msg.msg_inq. Remove the min_not_zero() usage and
replace it with kmsg->msg.msg_inq.

Signed-off-by: Clément Léger <cleger@meta.com>
---
 io_uring/net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/net.c b/io_uring/net.c
index f5f4f3ce6ef3..efc8ea5010ad 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -1146,7 +1146,7 @@ static int io_recv_buf_select(struct io_kiocb *req, struct io_async_msghdr *kmsg
 		if (sel->val)
 			arg.max_len = sel->val;
 		else if (kmsg->msg.msg_inq > 1)
-			arg.max_len = min_not_zero(sel->val, (ssize_t) kmsg->msg.msg_inq);
+			arg.max_len = kmsg->msg.msg_inq;

 		/* if mshot limited, ensure we don't go over */
 		if (sr->flags & IORING_RECV_MSHOT_LIM)
--
2.53.0-Meta
