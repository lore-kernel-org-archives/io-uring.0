Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795470582;
	b=RHJVzkyt9sE+IshoC31h+vrH3bk5bP2yixd0X1oqgDPg26P4iy+8W8E/II4FqjHg8ot4
	 z+iZk40XAnFpI0lQUSI1ftb9tbvghFHmuDTUfAMoTalaUnM7u8VcGkSzVZWEHWLMAeSQi
	 OgiFb2Pe76K4TJP3Xg3vRPe7zqeXlLBGCplJKMrn5tcSKTZJ8/jE2lnZWOWprtAedBRrn
	 fb+FgtD64K8kUbR7aCNjN6o54izV9y85wr+860gXEf8YJQKewFGOEAKNrxVMy5sznTeGB
	 dpM3/8N5mQ3biwzvoQ7FSyieOfBRB9gM1HzdUl15sbSkt5r/8H4treflT0+mZeinyzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470582;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version;
	bh=Q4eGb6JTuIJiHcIWr9p2LeSpHulvn80Kk3v/36/K54g=;
	b=Xm/NtyIfNTp3rtVb6Ga2cdTNpaYReAp7l1WNQWG05YlooCJBaTCPpRHAjdTy1ya/OJ7T
	 vKJgucpZHyg3/Xpo1S/r76IWHoDM6qlIpfu+ImWUNf/I1nSGx2IscKwamALhJ0GYvwky7
	 qRhgpV8qMcHkOpBGDTeE/liNS4wLFqN2ltjTMPvu3QCjU9nkC8F9P7kS01CUz79ZWAUCG
	 uyFaY/8g8PoXT9JyhvK9nv1CRs9ql0PgqFa9CiQVCNUWTy9FZ6Kz6pY+BqejdwT7/8M6t
	 iTdlb/ev9zvDqFajd2nFLwPWN+chJtT0jhGR9xBT764ZMpfrVihqSQMM1PH64PCAt8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=CLtkm6+W;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA517606A31E
	for <io-uring@vger.kernel.org>; Mon, 23 Nov 2026 21:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA517606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=CLtkm6+W
Received: from pps.filterd (m0528008.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJw9qN1921627;
	Mon, 23 Nov 2026 13:49:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps82601-s2048-2026-q3; bh=Q4eGb6JTu
	IJiHcIWr9p2LeSpHulvn80Kk3v/36/K54g=; b=CLtkm6+WXlGEmBo2bM+uwkkRk
	5dAWU4b5JAHU3Oqz6j8WgddFdWxWzEnFq6qqzizMgo5Q12dmrXdDyCM7cpmx3XCu
	BJQXR2eLkpuahKdD9y7mZ4MqTYi1zf/XK71GYD3/Wv1eFIcOzZIRDJnGQ8E2s9yI
	Q7R65Mdx8mb3oC4kPMucEwP3NWwtcB66FGaHL5D3bWNCb7iVtsgCHHPpYbAJMjW5
	YLaQ2ofFAwQLepDyyo7d//RASnhFRKoNB+CIya28fggkpoTgjbM1dQ9aiXceMMYx
	0jQ3+n9W0lo4kI9vD37bmAzsmCV8xY9iYi0/vr1xjNIB/2FH2a2u0AlZiZW9A==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j40spgux0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 23 Nov 2026 13:49:40 -0800 (PST)
Received: from localhost (2620:10d:c085:208::7cb7) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Mon, 23 Nov
 2026 21:49:39 +0000
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>
To: <io-uring@vger.kernel.org>
CC: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>,
        Juanlu Herrero
	<jlhe0197@meta.com>, Jens Axboe <axboe@kernel.dk>
Subject: [PATCH liburing 0/2] Add recvmsg bundle test and man documentation
Date: Mon, 23 Nov 2026 13:48:57 -0800
Message-ID: <20261123214924.921732-1-cleger@meta.com>
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
X-Proofpoint-GUID: _GLCLClMYc2ruEd4xe0JXQPdCrz_Eg_9
X-Proofpoint-ORIG-GUID: _GLCLClMYc2ruEd4xe0JXQPdCrz_Eg_9
X-Authority-Analysis: v=2.4 cv=UbrE26SN c=1 sm=1 tr=0 ts=6b04b4f4 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=_1IyUuN4QrATX339ibzo:22
 a=e-3p8aCxOUzqUapr1u8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfXw+UdvjaGdHrH
 44/ak2a5hqplX5CMLkF92sMUBPc15F+XodcV9F+Fi6NaiTc51vOY+lLj/eVgur4g2M8C9Ze9syA
 y6Dg+hZUcMzamWD58jCKTN0TSaje0vE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfX11597lcPEMhc
 sTu0dkvOcil99a9IvW8oI/v76qB2uKfGmN0gC0R0vxF+cGRYpMbI1g3/w08zUa3X/yr9gj7ttl8
 IeArvb9B4NHkl+HtcMPXuIh4zcxSvnO1gnB5+MBBsa6/+j9t8l23txYvyDfNvYA1iCjpJ69zihD
 oDYGqk2kbT4l6jWyqssyfg17QI2lchwG/FF8Wd592T7AHqp59MU4Gg18EitkjbgzujjioJnlazx
 HT7P7T6XtCUIxATleRFAwezLU9BluAlcF6lxy+k6RH9H3pGEnG/8d/er4ufYEoFITGoC4he5+iB
 DYxwoynHh8pmIxrLBvHn5Z0PPQY11WPZ47mzrXI9DlvcrT8JV5xMsBpZQM1W5QEBofMARgqYlQz
 IbAxx4OH6MZJraA5ntElw6qb/iYLaxvcPVDOebXu84bB9h4fYoczSlhLZCwjyGHKqmCfO0OPOhR
 97tGKEbGtO8V08wBuig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01

The kernel is gaining support for IORING_RECVSEND_BUNDLE with
IORING_OP_RECVMSG. Single shot requests return the name and control data
through the msghdr and receive the payload across the bundle, while
multishot requests reserve the envelope and control data at the front of
the first buffer of a bundle, the payload spilling over into the
following buffers.

The first patch adds a test for both variants, and the second one
documents bundle support in the recvmsg man page.

Clément Léger (2):
  test: add recvmsg bundle test
  man/io_uring_prep_recvmsg.3: document recvmsg bundles

 man/io_uring_prep_recvmsg.3 |   27 +
 test/Makefile               |    1 +
 test/recvmsg-bundle.c       | 1313 +++++++++++++++++++++++++++++++++++
 3 files changed, 1341 insertions(+)
 create mode 100644 test/recvmsg-bundle.c

-- 
Clément Léger
