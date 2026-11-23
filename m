Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795470601;
	b=cdviqgaJr1P4e5aOyUy94qemOHhSrLVQC/fbqS+xt+kcLXFQhdQwlI5aRjnaqy4XM/oq
	 TcZwwiLFz0TYdw8o+DUMk2yTYIWlvM3LuCGTqLjHLeCsPPMuHselyhSjYY112Ahg9Rqia
	 qhtVU9JNNbI6GAZhqm4rSjJFBN6RXjuuvKOGFKNyZYUe/sRodC0dFlG7mMiTZKEC0Ebdk
	 P6H0uZ1lQpe62cjAvMSpPtobLt3pvEQd6XGTWnYjTKaYunLBktl+90S7B90821jl5Ktrt
	 GazEcfzBuCzKFD87qb0TsLygzfYZAClvRqAafuyOwyoPncBbJ7daNthDbYZ/qKEawBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470601;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=6GBzfa5xAQFC1KFsAm7FqZZ04QUj65ELUdE7/sR5UDg=;
	b=pM9+GOb+ufkbxWvMY7i3M2B5b+euSLRQ6r5+hiefBhedcC/Jxph2YHJPrJoCfVnOQf3Y
	 XYf9rDZ9THDwCYq2UkX/cVj3yt3bRGWPtiH99HGFzlEVRgx8OkCzENwllodQWor97XaAY
	 58s5zmk7F9B5Bx0/1mVayennZAMvx+pUJ9z9bxWjOcCqz37FIgR2XFEoR73rDur35t2YC
	 p9pHaLjPtFEfO7CoYZKdRLN38pak5lvhtReSjLEdVtGIE9dhfl+LUdgIRMa2BSX/Dqa8C
	 xoOd4wbjnMMeccE5LgWKsqXxWmNjoG3Q8DVMbTr07xkKgjvLmSX5J6kIoV91rtcdeaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Wi3L3mwy;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDE9606A333
	for <io-uring@vger.kernel.org>; Mon, 23 Nov 2026 21:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACDE9606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Wi3L3mwy
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJw7ob2854679;
	Mon, 23 Nov 2026 13:49:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=6GBzfa5xAQFC1KFsAm7FqZZ04QUj65ELUdE7/
	sR5UDg=; b=Wi3L3mwy5wIMWKQ77SYZhFiZwyi9SmB2K3+afIB0x47EwJXsSBHAX
	uAN3NwDbmAeAtMYn5UjY5QpzytgfA4aZvQKj3+IU4Rg6wnLhAWi7oz3BrJqfVst4
	XCztiyRilUAUxcix4Liv5qLWb1emKDJRx5Kh4ZTCOlLSgWgjsVwoMig88GtkquhF
	6tkyIbyKVUcudLe0mbFx2MEK0Y2EaNj+Jdengz3ybMI6ZyvU5yzMXvBBwCO93ZO0
	OKwpIuA0L17M4RAAtHjQkjKvRB0NQGOB/q5e6RTO5yMA5beuL3K+tLsx8UT5WrUZ
	kGyLbrUrI5U8O9HWgIb8bViTl4IhVu4qg==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j3bfmvd47-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 23 Nov 2026 13:49:59 -0800 (PST)
Received: from localhost (2620:10d:c0a8:1b::30) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Mon, 23 Nov
 2026 21:49:47 +0000
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>
To: <io-uring@vger.kernel.org>
CC: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>,
        Juanlu Herrero
	<jlhe0197@meta.com>, Jens Axboe <axboe@kernel.dk>
Subject: [PATCH liburing 2/2] man/io_uring_prep_recvmsg.3: document recvmsg bundles
Date: Mon, 23 Nov 2026 13:48:59 -0800
Message-ID: <20261123214924.921732-3-cleger@meta.com>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261123214924.921732-1-cleger@meta.com>
References: <20261123214924.921732-1-cleger@meta.com>
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
X-Authority-Analysis: v=2.4 cv=DqvDa2/+ c=1 sm=1 tr=0 ts=6b04b507 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=crHB47gyY4rKiduisYu9:22
 a=VabnemYjAAAA:8 a=qCMZd581ZDVLYEUz_X4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: v1Uzt_Y3C0kvwylmO3ublmYBWoh4RZAk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfX5Q/A95mfq4Vi
 n+UY5efZNbvl0Eoni2mQmQOANnGnLzsxpAj+2Lh5vi/lrX/0Mq5+lI4tUaDxSFQX1FG8e7zehM8
 gw4iRVPu78NeWx4WuagJmHh627bE/88=
X-Proofpoint-ORIG-GUID: v1Uzt_Y3C0kvwylmO3ublmYBWoh4RZAk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfX9h0ducLfq1TK
 +OmUdpuqbSE9P8fA98YbopgLbZAWI/+SfZPGGHA3xqo823nmraGiZcYAOnBAxoAGvq6C2319lfI
 zB9ztzFgDt+sRKGZ0++wuaJlzUhurkY1indkzSzRdqj/jaAO/L/b3ZyvL2PVSYWJf7COwVZpuKm
 5cuAKyoQo5i4V6LhjLGpRJkBttAQ9eXSogv7TonEySo7ZTWUT0eTvNQSigqndCfgd0FgUfn7iS7
 d0UA/bWNK1d74KJB280y1Y9lzXNZhY+kZvmwWRYo7NT8zSF8AJdFFLP2nstlEaGQRF1Lxe4V1bs
 jNBx7OZFpdN910+7PS0WM/mgZ3cTklYuhoM7cc3QRaOyl6hghxsvM7isYTi2F7ohONFpqC5PTH+
 cXAAc68772wx6GgzEgHogUrSA48pGt86jex+2ZN6h7rrtvHZaGA1crIBAs4lgA0a5y/O1N0Uefl
 HEQNhDesFip13Nt6Liw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01

IORING_RECVSEND_BUNDLE can now be used with recvmsg. Document the flag,
how the multishot envelope is placed in the first buffer of the bundle
and must fit in it, how single shot requests return the name and control
data through the msghdr instead, and how the buffer selection is sized.

Signed-off-by: Clément Léger <cleger@meta.com>
---
 man/io_uring_prep_recvmsg.3 | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/man/io_uring_prep_recvmsg.3 b/man/io_uring_prep_recvmsg.3
index 74a0c9ef..4f93d01b 100644
--- a/man/io_uring_prep_recvmsg.3
+++ b/man/io_uring_prep_recvmsg.3
@@ -89,6 +89,33 @@ or
 .BR recvmsg (2)
 operation. If set, the socket still had data to be read after the operation
 completed. Both these flags are available since 5.19.
+
+.TP
+.B IORING_RECVSEND_BUNDLE
+Receive into multiple buffers, as described in
+.BR io_uring_prep_recv (3).
+Kernels without bundle support for recvmsg fail the request with
+.BR -EINVAL .
+With the multishot variant, a single
+.I struct io_uring_recvmsg_out
+header is placed at the start of the first buffer of the bundle, and the
+payload follows it, spilling over into the next buffers. The CQE
+.I res
+field includes the header, which must fit in the first buffer, otherwise the
+request fails with
+.BR -EFAULT .
+With the single shot variant, there is no such header: the name and control
+data are returned through the
+.I struct msghdr
+as for
+.BR recvmsg (2),
+and the payload starts at the beginning of the first buffer.
+If the
+.I struct msghdr
+carries an iovec, its length caps the buffers selected for each completion,
+including the multishot header. Otherwise, the selection is made as for
+receive bundles without a length, and datagrams that don't fit in it are
+truncated.
 .P
 
 .SH RETURN VALUE
-- 
2.53.1-Meta

