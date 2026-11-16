Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827889;
	b=SWU1ClllEFqtfOgrC3ioa5U5nTN/mw903toYgLhLuoazKI4B76DKnA+lDzQF1TXfCfpu
	 iA39FRu7HdnRF7KN/7iCSoUrSk8dUPP9UpWY2p/sN2DarBNdNmdiJHw23uTjsKfsq5rUx
	 bLRKbVMyOTxzVbXteLrYLNOEk35asBzgvAq500BIgorZlb0ABoZzrCYZ835BPPddg/rk1
	 rRtbnpzj6Sw9dQZkn3OWdK1JaAqNXs6BIqo5hroZsOL9Pb/G86wo9oX95bgoB1L5adorx
	 bcJB7mCYio/SYaqGgadPK5Pee4TLhamNaU8qHqxifN4nefU5hr3hdgA0D9nTc3bW8Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827889;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version;
	bh=106LuhNkFCRGEUor5y3mizO0ZEf92F3tH32RHmcxfcU=;
	b=mgggOEgpcb1W+phn198WT4vESGz7ZG2mqg6b0gJvnuSV2R9Pw3r58rUsJ+LFv9yU8Sl2
	 P64WXipIPnFrUbsTEaSfZdL/0ZOyQQlOhs1C5SpY0+qdfaVnmEWWCBP4lTMfgA78ZGAtD
	 VEFXTAhy12i3cGBh/eOvE4f2oK4x8aSILYHNdcsarIT2TyVKE7VhO1ZqNfuYR3B2833DI
	 BHL5c74hgkD/vQ2+SuZ5hjpKzLKYrSg8IwtWkTimweVNmxpsN+Jrc9qlaoF9Rz0j/FDot
	 i3QpZMBLGxqCBONZZvFiJx/H6D0EqS/5Dy/8g9FaW9VmanITVnFExXTQCvUd7hqKjtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=LCpZ564Z;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F268606FA5D;
	Mon, 16 Nov 2026 11:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F268606FA5D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=LCpZ564Z
Received: from pps.filterd (m0528008.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7d7l8849792;
	Mon, 16 Nov 2026 03:18:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps82601-s2048-2026-q3; bh=106LuhNkF
	CRGEUor5y3mizO0ZEf92F3tH32RHmcxfcU=; b=LCpZ564ZZ99RgS8Ep1/NgNnZO
	5yssuBb4R+NQJ2GaHAgGu4a99G/J40eYXP63hDfIqfkYwyYJGS7+AS+VBsstDxwO
	Pmrmk/U9pjam2Zz+kQILPCDfhsVKmGEFzJ8PRdEq4P/kTjaqztEM+0wI/zP0fwjp
	QuOagEVeFjRLwWk30uLSu2FzgSnL1ujGUb3smQCiMrRTDszfgKhJSeI8cRmoM1nP
	4+oUqp/nLDkLkpr+FsY7zTw8rv+5aH5/e2AIZiSb0Me/Y3dmHpjsFQONV4MSc1qr
	q+ZjpZuPqG//tjlie4OEFCA2LyXKkmYJMh3zOiyJVCiET/2+5Ka0MxSIUdfAg==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hyd4qm1y9-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 16 Nov 2026 03:18:07 -0800 (PST)
Received: from localhost (2620:10d:c085:208::7cb7) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Mon, 16 Nov
 2026 11:17:56 +0000
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>
To: Jens Axboe <axboe@kernel.dk>
CC: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>,
        <io-uring@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] io_uring/net: Add bundle support for multishot recvmsg
Date: Mon, 16 Nov 2026 03:17:35 -0800
Message-ID: <20261116111744.702159-1-cleger@meta.com>
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
X-Authority-Analysis: v=2.4 cv=btnZl0ai c=1 sm=1 tr=0 ts=6afae66f cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=_1IyUuN4QrATX339ibzo:22
 a=dh8xkkVarwHNG_fGBwMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: qDQjg3FRkTlaS1vN_nxwyvro5UHT9zLc
X-Proofpoint-ORIG-GUID: qDQjg3FRkTlaS1vN_nxwyvro5UHT9zLc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NCBTYWx0ZWRfX6HPyiON3hneG
 vtts/8jFJPIEnEE091eBzdCyIf9aqykLQyLlMOEf2I1pP5NqLgNqgbNRQ7kSgFedlk9+sMP7aKy
 WvBV/Ej1g7TYXadb01Jpz5WBarR18fU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NCBTYWx0ZWRfX7AkhczotWs3C
 wn07g2/pmHq7ZDgNMc9zsTkt5LIJ46z6cjQTCkIKGpHcWJgur+KI78ZUIekTNX52+vYnVXaSyUk
 hcjujT6Rn4DHSFv+t+NbTTpphSzF3I+/Y7V2yUQXprETMBPE1WqZ8u5xrOmEJdEJUK4/RtSfqrM
 O5Nugf8BK7/AIhiiRvnrkFzwGjnmAjmppq4VVQzEEp6Zh5KrlyWwfQuBh5U4uRD3mKQLmoqkh7e
 +pPoYhQlF7hUY16Vkhg4Abwxm1oCyBUSTcifhgKeZkLe8utVuN9LI+ebc30noR7W0LPW8+z0CBU
 1i/hQjDuWBm9Hf+/tffWgt4dNE2564jbDJqzpLx0qzZCW8brqJBi9wHlcJ+4ZTjmhMa9xzsumj8
 m3QlJjskFfumE74yLpAqPVQTRBH/nlE0jErk9HnukQOlnqX22Xn8dNg7gE8e2g3XT2btnV7R2Oe
 BKVnd7L/sDbmnG2oiiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01

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

---

Changes in v1 (previously RFC)
 - Factorize header size computation
 - Remove unreachable check for length

Clément Léger (2):
  io_uring/net: Factor out receive buffer selection
  io_uring/net: Add bundle support for multishot recvmsg

 io_uring/net.c | 244 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 196 insertions(+), 48 deletions(-)

-- 
Clément Léger
