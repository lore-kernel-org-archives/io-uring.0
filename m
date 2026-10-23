Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.19.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792754597;
	b=CwuSiTOLbYoMwFrqxvy4Jxx9j6xBJt2us+Xd+jlD/b4ww8jpf5GTyg04gC2pgK05NZZh
	 8cVFMrEHftsrCbMnCxKYK2CFtLWZb+/vi42Pg8PWdMUKNMVhj9Xox9AdpdEFi1J+/8SQG
	 IK7YRPID/V8+COed7LlF4jhP5d6g5MeDZKUENdMwD/s5HOGweC0kE7/8L3JxWduObrWLw
	 iKZTli4icQxsGWSv5kh7aXcW57jhBNrmlVTS56DfNuNJdFkjMFH/40NWGom18lIP8cna4
	 bHZ0pDCm1sDqjy0viqkaJeux3Jc2r4kVCA/BEmP3Fp4MMm2lCG6vWtIX+emyvU7rCGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792754597;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=ARezQuSh9l13Xm6tSE5oySI4WgAXmnpsz7eQOToq/2I=;
	b=Pw7MswXFa0pCE8K0+Oihs4mixYt9yhEoVUS5hWUMq3s3IdySPAYf/cU5nA6K7qmWkWL2
	 yP9ZJ4YUZIw0qUkSgW1oYyl5TbpviPChTYtDsv82MhaLgNDxOrTVX1tCvKb+GUK23nBZx
	 kguSBdLNwSwrYGg7nkglV1thTPzSWva3oXtPvVNmAMzfDaOMUIrAlYaZ2n3Tkmoas6Fg7
	 kOdT1N1iPBLpN8KmUGcYgACBLR6i35eKFQubISFccbyVfnJLeaHHpreOcY2F0EN7bhNad
	 7yGGCWFUtQ+CLz9Ot7/kRl6/VTmeQDL/UjnkxC3ZcSXFBwDoSJhsURLzaOZItxahu9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=SoYsg6eu;
	arc=none smtp.remote-ip=54.207.19.206
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557B1606A31B;
	Fri, 23 Oct 2026 11:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 557B1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=SoYsg6eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1792754547;
	bh=ARezQuSh9l13Xm6tSE5oySI4WgAXmnpsz7eQOToq/2I=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=SoYsg6eue1Tl7JtUp0e8MtiEaC1kaVykPUuBux5WXsHlw4dqUQO9lqZIwz6NDQARJ
	 PG5WPc2HImtjA8hlUP7F5M+OFOPsx3yEJmH0M3JybqSD1pMHfQhbvYJsybFxP9gSxF
	 4dOg9SNKrxtw3bHVp+PtaNGUC/3/78+vxKrFaCeM=
X-QQ-mid: esmtpsz18t1792754532t8943f6c5
X-QQ-Originating-IP: NMe+Nqfp3PEwpn5pbYKe2TAOj9jhIMl3lV5hgGGYkp4=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 19:22:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11921513370383269713
EX-QQ-RecipientCnt: 5
From: Yichong Chen <chenyichong@uniontech.com>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Stefan Metzmacher <metze@samba.org>,
	Yichong Chen <chenyichong@uniontech.com>
Subject: [PATCH] io_uring/net: keep recvmsg buffer select length within MAX_RW_COUNT
Date: Fri, 23 Oct 2026 19:22:09 +0800
Message-Id: <20261023112209.87979-1-chenyichong@uniontech.com>
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
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NtqDamBdMjYriCc4AA7IKRNhNynvsjogkzoeYdKKz/BlMQI5ndAOXowi
	jxuc9bd9hjztqRjncyb+aszswQdnxxs2ENj1wc6wLVbGUkq8DznwubNGzjd3hOjilDRp3ZT
	MIpx05xUQ6U8kVfBzOiNHmufegxUsFAjWlxf7DmUG0EiStYnR65JkuXjXgCQ0DIegs0yY8X
	2UsTXA86C8Wl6yp5Ti+i0mtU7BcgEEj/P35NcfjMiQccHZwggbCrQJAAPaPkcAUP692sBaa
	c430ZZ7Pxj3pUjvVHMh8B5ntPqjnkK709ius+CfLPree1ZAx3OXoSa0mcCstKKR1QBSxlvV
	FSBSCOi8OP7VibvKUgU+zgM6zknOpydfyJUwbfjfp3JPHsaUMWngFcwgJDLIPFYtU3G1oio
	mb+bDzldCX9cpwJuYCXBlsAv364g5DRBlxTzdmBQfwq/An+rlyAcdVC9XS8Aj+cXE/YoQ9t
	GKe5rySk9yaQPl04gHa2HO+WT5Ds9/dSnI+ieoTxRQlcf7VvCJXpFw9A1pB2gxLV9jh26Qh
	xH6+cXPL+GVeWjo+/JGdIbeQXHFs0iZbvAekBChECvKEJRs7u39K+3HcGzpckLvam3RsC/Q
	ODGhHnHf45pM3VtNJYA3TsGK3u0y5wB9EoM53Kau9SktZz4OTH2Z1Q80GJq5siEQP/a9jy+
	/izXcw3ejaWV2/uFQOYDFr6EFaQNHII21OJNn7sCukthGpBOgn6/L1GqR6GlmPNYwlbptOk
	ARKf+QWtfxQ3zCy8sLk8Dgk+URzJhS0UbBvnhPXc9JMVHXU4vbD6cKXdzROJCyY4oOAi4YR
	oZtMKCbJCw2uKKBHeuPGaDodu5T6JjlLEeVfqRR+2l7TJ5uNnjNMF32G6jVoDLFbBjlwvWT
	Kb1KOkpa/XMA9zoalPw9gcYZsnn1+SktO/znmTqsdBjUqc8/kGSW2wi8c35Lu4w2ecceh0R
	VTrGtkL4EqMyRggC8EL3WpxoLS57te0mgFNkJ0Yaj0o4Rq5DS2Z5wvcuVvLJY2jMdoOYqcI
	m7dTJ0eJEfW9J1m0v5ZKo71r/tBf5rB9PEy6bD+Q==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

io_recvmsg() takes the transfer length from the ring provided buffer when
sqe->len is 0, and such a buffer can be up to 4G. min_ret is an int, so 2G
or more makes it negative and the (ret < min_ret) block is skipped, and the
oversized length reaches the socket layer unchanged: an empty socket then
completes with 0 instead of arming poll, and a short read is reported as
complete. Clamp the length to MAX_RW_COUNT, as io_recv() does.

Fixes: 78d0d2063bab ("io_uring/net: disable partial retries for recvmsg with cmsg")
Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
---
 io_uring/net.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/io_uring/net.c b/io_uring/net.c
index eeab88e77fd8..4678f29f5177 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -1068,6 +1068,7 @@ int io_recvmsg(struct io_kiocb *req, unsigned int issue_flags)
 		sel = io_buffer_select(req, &len, sr->buf_group, issue_flags);
 		if (!sel.addr)
 			return -ENOBUFS;
+		len = min_t(size_t, len, MAX_RW_COUNT);
 
 		if (req->flags & REQ_F_APOLL_MULTISHOT) {
 			ret = io_recvmsg_prep_multishot(kmsg, sr, &sel.addr, &len);
-- 
2.51.0

