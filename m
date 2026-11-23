Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795470007;
	b=j5XfARKCOOffdufnrSYlJf+myU2DlGFmWCDseOvir2DNI2LmyFZYz3pMBdP/f1WZiA4p
	 lqHzBIJMRq7NIUgqasn00GRTA2xm9/tKx9+8J5ZFLxDjVozaTNvvPCVcpu33G1cEE+K87
	 eKeSJBKSHssKhj5vrKjcyLjY6D6OGjnb9cGtHktS2twtvMD+EkX9a4YPf+eenkHBMTWy2
	 h3kE1xPGBjK2W0lGU6zvAIGhLNLfKLzEG7YlnTMozS7E1LApLqfOwSlkJARWRElr8Bkw+
	 e6ft+iMf4rFvP4q6b0C6c9uDS6PtCsVoGTcOY4p5KHgqgy3Wgmc0IVCeiuJawOx/eqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470007;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version;
	bh=ex1ULMVAEV+ZIfxEUvMfTKsmYI3rmVPICZINUc/pU2g=;
	b=QohOLdAhITkTtFuWtKr9cx248JnL5KJ+8ZKnGKo0Viff0V4Ilv/hMR774xCtWFadxD6b
	 ymYTCA+d4rvr/Z9Q3oIMcIRCJFz63gXsvJOiFUuZ805/LuEAvXV8rQ4PoGG076nGo671Z
	 Iuggd9RagCyIFfj+qMueQ9U6wnkJszwlje/4lJShCkLOKoA4Yyivhi82qjgc04EcuiK0A
	 wTDwEcdPUyHDoxpulAgewFEjj9aTm5EEaDTDr1TyIxsWy0df3CUZIsPtcLJM37tyWdwoA
	 EGH2rtSx4fZLp+ySrTZ1IftQQOtYyjswZXH7fK4N/NdPidbc+AwGULbZaKkneRDpl4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=bflkjytA;
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A4D606A32A;
	Mon, 23 Nov 2026 21:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2A4D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=bflkjytA
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJwC092388937;
	Mon, 23 Nov 2026 13:40:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps82601-s2048-2026-q3; bh=ex1ULMVAE
	V+ZIfxEUvMfTKsmYI3rmVPICZINUc/pU2g=; b=bflkjytA7OiJ6QdHWIjXDDZ4a
	MBXaTWj5zwKOi62hLLdcgbzML+/viBmrCYtFO7nsnDUdLG0vLNYiVOdDpt95DiXe
	MixbKOG67xbX0caJepKNzRZo9hIT1/rIgVGMgFonbK8I5rsBzAGJwJ6G2roZFxh6
	iJyfTkMrL55I0vTG2e+YkrOtFU28+NE/lWr8f9xilBw8FdEjnrXU8rx0G9L0MIFM
	xwPZ45/rzDZOzo6hZ5e5RejPMp3FL+aePe9l38irXmFyb0GA/A/AawGAnBCqjj35
	Kgo0Gf9bYFUghY4i9gPDECNwliHIjWb9oVTwgSnh4SiJiWlUdUHZjk60tyGAQ==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j39wgmhhd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 23 Nov 2026 13:40:04 -0800 (PST)
Received: from localhost (2620:10d:c0a8:1b::8e35) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Mon, 23 Nov
 2026 21:40:03 +0000
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>
To: Jens Axboe <axboe@kernel.dk>
CC: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>,
        <io-uring@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Juanlu Herrero
	<jlhe0197@meta.com>
Subject: [PATCH v2 0/3] io_uring/net: Add bundle support for recvmsg
Date: Mon, 23 Nov 2026 13:39:17 -0800
Message-ID: <20261123213952.824008-1-cleger@meta.com>
X-Mailer: git-send-email 2.53.1
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfXwitOnUx6Jqf0
 /lPcf3YkKmlcc+h8eLeRk3Wcsrl3TaVTRtEYMXIqtMX7DodXL95KXD4ZRTTj7YeDyyfBO9/vmIJ
 1d6ROx1l16qs3U565JYjuK1/IBU2m+E=
X-Authority-Analysis: v=2.4 cv=Cbudd7rl c=1 sm=1 tr=0 ts=6b04b2b4 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=xtH7KyWI9dI7BmFOsl-x:22
 a=1E7JvQEFULOfdho71cQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 3Ppv8dnOiI60y93NtdxicyF0hulJb48m
X-Proofpoint-GUID: 3Ppv8dnOiI60y93NtdxicyF0hulJb48m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfX/XnSChNy0031
 s6rTpHS9Qz78+g6qqjKc29fC26YY4buXgt5qbpSC8zyMk7cyhR2b32P7PwF197pKh4Ygoq/IqXj
 jkfcdotVqkCucDYMEabHQua/aWeg44uwh7urDzYtM0W2+uYMVUBw9gbt4D7iu791Xd/eBlNONF8
 eCUPBRSCTLeYpzM36tfNzjSjmiWwRLeSdadvWaqGfRRvxzNxouE0/xKECqYg04GR62QSrQcqe7h
 3RlPLO443kia9Ibz1GFTyZqI6w7SVEWR4boFIjlVYpjEL+44b+UsYADxBIOKs0NP3KTRwdCIg0K
 fAecYOXv+hPjbA0lvJPQvDUTKJY0OqvzOY0xft6Rbu8y0jk6Cx20k8nZaGAiAWjLcfjAYzD+89O
 8Du0iwX2CNzdpA71cn2IaS/uYzhTHNabKxRxFvdsYbGT/1dCneJNgZmpOHXTX79IxbuyuNrbGPR
 V7uXD9zX5wdh8mpFPnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01

IORING_RECVSEND_BUNDLE is currently supported for IORING_OP_RECV but
rejected with -EINVAL for IORING_OP_RECVMSG, since the recvmsg output
envelope (struct io_uring_recvmsg_out, name and control data) was never
accounted for when bundling a receive across multiple provided buffers.

This series enables bundles for recvmsg. Patch 1 is a preparatory
refactor with no functional change. Patch 2 adds the bundle path for
single shot recvmsg. Patch 3 extends it to multishot.

---

Changes in v2
 - Add bundle support for single shot recvmsg
 - Added incremental support for recvmsg
 - Remove superfluous comments

Changes in v1 (previously RFC)
 - Factorize header size computation
 - Remove unreachable check for length

Clément Léger (3):
  io_uring/net: Factor out receive buffer selection
  io_uring/net: Add bundle support for recvmsg
  io_uring/net: Add bundle support for multishot recvmsg

 io_uring/net.c | 228 ++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 179 insertions(+), 49 deletions(-)

-- 
Clément Léger
