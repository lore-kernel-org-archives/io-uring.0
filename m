Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792700537;
	b=0Dl9uIaqHHvYptueo8AAJ3TjfItxB9Lygr127PG6x/g4nD4G6rRr9yh6KXwS3vas5Mw1
	 +xm22+EdcyfBZRMokItc+UV3JdMfcwYkJFLjkSUNs9XLylkyoaiSII6awQHLYX+v6qGF1
	 RLlpCbMeHq0GSlXM2vhmmeneysVol4f9wcRY7o5iThOK9QMuWzxlxckrvSXQ0P99xX4vL
	 tgUvTh5C2Kyzz+LTgSd8BTTANCusuNCfBLq08mFHXsikwHuBbz7uM8MlUK80Vu99+Ia+7
	 HPlF4y92JRuDmEnD/AkoRC7tzNF45hBovqxv7KHGYDH83jSeozquStRqvsQJg5sa6Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700537;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version;
	bh=PYNgADVC68CwJP+YNADd/HcGS93CaXKGM5BiCxLiOm0=;
	b=O9aBcEfR/LT0iMVy6xP/0lltG0RsIsfS49lyKRs7kK9Z4U5n1iOHWCF8P++heSbBt0jX
	 UaSqQR5YcaTVkg65HW6WY63/DsH71I5sacEVSbIU+rH1BE62NKBQ5LB4fd+1j+W7Y6rvF
	 l2nsxRSkjSn/4SMWZ/96RIQy0qvMvr+G5A137GMiaRlDjZuYmhknj1Kgy45BQfePzIndi
	 fYJGb5wkX3fsRarsitfdO34XBuT5aVPHXUei9RKnT5uAfXfp5iehuCp7l8SIMBLAjFuxy
	 Nvc4VtgG0x10rXwYL8acdNtsY36dFYOUbOtbGnmQiJc54elRRJQ1P3pT/V5UDg0TO/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=aXPXGqRL;
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1634606A31B;
	Thu, 22 Oct 2026 20:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1634606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=aXPXGqRL
Received: from pps.filterd (m0528004.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MHsoIE1999247;
	Thu, 22 Oct 2026 13:22:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps82601-s2048-2026-q3; bh=PYNgADVC6
	8CwJP+YNADd/HcGS93CaXKGM5BiCxLiOm0=; b=aXPXGqRLJf4CK2BIV/htac63a
	dSRUZgmfYBCZhVtQh2vPedXiWezIVlYJoqIf503RwoJ2YXaHAejUgXBB+MA8CF4d
	YhKTfnnyd+qMknaeQFT9q1wiT2hU/5sHim0PvOPCpKMVDIwsJCAFOsDTBiKCTE/y
	R2GSZv2Fprm5VLHMIQKm7vFqsmF6d7xWnlbK1Zs+i9Zluxwn5jFG0JAcyg2qUuGw
	LYQRWhgUPxglN/S9TX2LGqOZ1tkU1SBmzuXkbmTvrZL5de/tIQ+PKlpGKTpzYHhJ
	wIK13+4Y1V1jvOYrP7jf+PYlc1bFOsTFoWmrEx6ORyr8O+4G+GpY3U10sMkjQ==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hfjf5ks8d-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 22 Oct 2026 13:22:15 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1b::30) by mail.thefacebook.com
 (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Thu, 22 Oct
 2026 20:22:14 +0000
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>
To: Jens Axboe <axboe@kernel.dk>
CC: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>,
        <io-uring@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 0/2] io_uring/net: Add bundle support for multishot recvmsg
Date: Thu, 22 Oct 2026 13:20:21 -0700
Message-ID: <20261022202106.2474515-1-cleger@meta.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA4MCBTYWx0ZWRfX9CFDae28hYBb
 7+tL3EA+W3bHlikgnADOS/CcuUKy3UnujFQ94Bu3W+9/jdSZHGo7ntnHucP6kD0Yzr1IZKZ1Pk1
 yImfo6t8TfhB5dUICR8AA722jE2OfMWxY1mQD87bvpmGppxcTWBe33oL1s7rJ40mmPDQM7898ow
 AAtToKwU34d6JOWpu+uBQ2Lhk0SfxOtMjnZBznuverQueQSfdcqGPfDumxZyxWixfjoueT4bOe+
 58g8Vz8Gl1dGAxOlmpTDj6ysOBfszBGqBVAQ76aRu071JZNk+OsfAgKiwBj3EmOJYMApCm7QM8+
 RVRZbup0cfrJcdoCZPY4AtqgWrPnZBSf2Tce9plZAJnOkj3U+w2fEW+jiZTmnK3wkINufJPvUTj
 YRDXFfaZ69pKRAaMsIecEEFM4gBhQ639fr4ZAqzNO7N6qxQlb8sWG1v3DeG42cMZ0mUm5UoqF/Y
 nGJ807BERl7Ly24l4dQ==
X-Authority-Analysis: v=2.4 cv=fNisTpae c=1 sm=1 tr=0 ts=6ada7077 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=GbPsI2Ihf5RTnMjR_gZv:22
 a=dh8xkkVarwHNG_fGBwMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA4MCBTYWx0ZWRfX1VyfVVdTAmVN
 Qu4HbxQyTbHCgay/dhNM4PXBMq+cd6oqVzl3krPpJmFWsKdTvRIV8unq2Y7hdYzB6mvQH1goY3J
 er3OeylhBYlLXM/FvH1wI/QkJ7RQRvM=
X-Proofpoint-ORIG-GUID: 37qGGeyT2uS7ijvYyEZArCgdHaGPTGlB
X-Proofpoint-GUID: 37qGGeyT2uS7ijvYyEZArCgdHaGPTGlB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01

IORING_RECVSEND_BUNDLE is currently supported for IORING_OP_RECV but
rejected with -EINVAL for IORING_OP_RECVMSG, since the recvmsg output
envelope (struct io_uring_recvmsg_out, name and control data) was never
accounted for when bundling a receive across multiple provided buffers.

This series enables bundles for multishot recvmsg. Patch 1 is a
preparatory refactor with no functional change. Patch 2 adds the bundle
path for multishot recvmsg.

Note that contrary to plain recv which handles retry and can append more
data to a bundle, recvmsg does not support that since each payload is
associated to an envelope. trying to enqueue more data in an existing
bundle would leave an envelope in the middle of some payload buffers
which is not expected at all. The envelope must remain at the start of
the buffer.

Clément Léger (2):
  io_uring/net: Factor out receive buffer selection
  io_uring/net: Add bundle support for multishot recvmsg

 io_uring/net.c | 240 ++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 196 insertions(+), 44 deletions(-)

-- 
Clément Léger
