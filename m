Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795470014;
	b=t2K+9wSUa1ksA6LCmrz7Skpn6e31hyp0f2b0dSlFWkRTcZ5PQ8mx3oF9HCKg1XJCAADK
	 Q5fCbIA+Nc6x10x9NQgDCVYEaQk2LeG6RpqngCY6vj6OO86vBexI6OzAlo2s2pJGmp/3B
	 Lb4ZgHp8h/FHjuFTuuC1O58HUDjCWGWM62FmJmRNUKP1i4kLvFEm25Q9G3BIbFNuKKYPT
	 iepL+J3QOr0poe6pKGqFakQUblIWGxcgOr8kyo8F+t0Y1TWi6C42LONPiEAuMfxhcZL/3
	 C1XkbVcbkQD9yVy8Lh3OhXcnMKzXNqPykv5tiHLKDDtIBQk2aPch2JsCkOpreJd2PjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470014;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=HKSFqKY5gLCzSnLSY4AhH2xyZ+XcSr74tWJnLBKvl2k=;
	b=TX5dRkpfiEw0ESv5DMA8KXTQZHi3gSQemLq3nScIxSBqXD+L60KMes+f8dUGMCfB5wfj
	 BOZh1mC7o1Ayy4BxAW5XMm5ggBgIb6EwZLgMcvamuRaXLjaDcWT+hvZC6BQfNPbWT4EbK
	 6eJ1zKK+C1cWpyeUIz6Pw3/dlhVS7vLC6soyI2ytcz83d8NPgTD+S+Sn+b0iygqqJw/1H
	 h/AD/8h2gsSs+Qtm8+Ir7s5T6nPsZ+Vumg3pouvCiYeZ5l758miRAU85CsHOO0qWpLoIw
	 sWBbj693VdnyYaRJ/MGfGgPH4jnFD3SN34+CtpmhieZnn/Wg8FHhqKTqBl2JVAyuG7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=HKhrbS1R;
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA1E606A32E;
	Mon, 23 Nov 2026 21:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEA1E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=HKhrbS1R
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJw1DS2406754;
	Mon, 23 Nov 2026 13:40:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=HKSFqKY5gLCzSnLSY4AhH2xyZ+XcSr74tWJnL
	BKvl2k=; b=HKhrbS1R5p76JihAeGOYMKQ1fqvncar/U2I8yuy2RYcIXBysUPt0L
	jVqAaw609ZsYfO0tnv2FNjQOQk94/3Plv5YV7+f1hk+0tY4Q4gU8+ETvDzMDJJRA
	7px44/bU0IZNB2PYWkRKVkLkVDF+Qb2jJ+VXZQL7qNKOzkHRDrCYv2tSuSd1Nunl
	0K/UvHKHByg3rfGJCycnlRBAMPh89qGthvT46bfqBvOMBYWeoq30s3U66TpWS/jv
	UQrygHXlXcw0ev8eZW4qHRhvWDIhdAr8C3oaNKiRtL7c8UmGYyxI7lduLxzlf1aj
	D9xg2O4fpxzF3CsNkZ1VyG0wSvMoBHEEw==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j3a0avm16-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 23 Nov 2026 13:40:12 -0800 (PST)
Received: from localhost (2620:10d:c0a8:fe::f072) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Mon, 23 Nov
 2026 21:40:11 +0000
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>
To: Jens Axboe <axboe@kernel.dk>
CC: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>,
        <io-uring@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Juanlu Herrero
	<jlhe0197@meta.com>
Subject: [PATCH v2 2/3] io_uring/net: Add bundle support for recvmsg
Date: Mon, 23 Nov 2026 13:39:19 -0800
Message-ID: <20261123213952.824008-3-cleger@meta.com>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261123213952.824008-1-cleger@meta.com>
References: <20261123213952.824008-1-cleger@meta.com>
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
X-Proofpoint-ORIG-GUID: WzNhlCrtwDG-WPkYVNXsWiWdckP7RvOK
X-Proofpoint-GUID: WzNhlCrtwDG-WPkYVNXsWiWdckP7RvOK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfX/x/jgl4hdGW2
 QdCS2XxTJ7Zz9uYpHV0wLH4+DDsbz+oMJqi6QZg+hctn+IEenIC1Y9axz+RlDY/R7dnxwYkIuIn
 X6jPbyw351OkeTyKioP+2UkiA/GE9kc=
X-Authority-Analysis: v=2.4 cv=FeCiV5+6 c=1 sm=1 tr=0 ts=6b04b2bc cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=wpfVPzegXHpEFt3DAXn9:22
 a=VabnemYjAAAA:8 a=YIDYgUdWu8j6PtAN40UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfXxKDGr8KK67QT
 VfO6a0mq1MiRIdUIz599h+ZK8nXlXRW9Xkzo+GB+DBsUEoWhztx4jpFkRLnb0nAfCkUdCmxfCwT
 yRuxwv5tGxJTixp3qpWbJWpa3L9OV7HII6pcZvfLfpRGdWcVqXct4VEFjW5QlcjeX5NIQbwuRe5
 b33u7IvN1vtcSAFbt247dcPViSmtyaHgD616HPBHU/X737E5F1w/Nx8ZBCOtFJxY7izuM0hH68L
 Ukx88Fkyd/1HgdLSlg0XsPq+vJn8mE4qrenJKV8o9FRMQV0zg7fA7c0RkT0L+AbK44A2YW0mSbC
 X5wCoM+4belZzp4/XskKgFVpkJ46fulPNwMFKD12TqZrga0UQbN4KhcBugmuvS4IJxvZSqLKtt9
 QvVG4tlPTHhHfyQx5uj8aJ4wZDePlMcgyztjcLJD+mZigSwTY+y2wBS4IGNOzNi3GjSeMVuuXAN
 IOWc7nYmteOv8AlOBcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01

Implement IORING_RECVSEND_BUNDLE support for IORING_OP_RECVMSG. Single
shot requests return the name and control data through the user msghdr,
so only the payload is stored in the provided buffers and is bundled as
for recv. Most of the code for bundle support is already there, just
wire the call to io_recv_bundle_peek() and modify the check to allow for
bundles with non-multishot.

Signed-off-by: Clément Léger <cleger@meta.com>
---
 io_uring/net.c | 62 ++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 50 insertions(+), 12 deletions(-)

diff --git a/io_uring/net.c b/io_uring/net.c
index 6c9cfef7ed5c..4c9d21db1409 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -848,7 +848,8 @@ int io_recvmsg_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	}
 
 	if (sr->flags & IORING_RECVSEND_BUNDLE) {
-		if (req->opcode == IORING_OP_RECVMSG)
+		if (req->opcode == IORING_OP_RECVMSG &&
+		    sr->flags & IORING_RECV_MULTISHOT)
 			return -EINVAL;
 	}
 
@@ -917,7 +918,8 @@ static inline bool io_recv_finish(struct io_kiocb *req,
 		 * If more is available AND it was a full transfer, retry and
 		 * append to this one
 		 */
-		if (!(sr->flags & IORING_RECV_NO_RETRY) &&
+		if (req->opcode != IORING_OP_RECVMSG &&
+		    !(sr->flags & IORING_RECV_NO_RETRY) &&
 		    kmsg->msg.msg_inq > 1 && this_ret > 0 &&
 		    !iov_iter_count(&kmsg->msg.msg_iter)) {
 			req->cqe.flags = cflags & ~CQE_F_MASK;
@@ -1079,29 +1081,65 @@ static int io_recv_bundle_peek(struct io_kiocb *req,
 	return nr_iovs;
 }
 
+static int io_recvmsg_bundle_select(struct io_kiocb *req,
+				    struct io_async_msghdr *kmsg,
+				    struct io_br_sel *sel)
+{
+	struct io_sr_msg *sr = io_kiocb_to_cmd(req, struct io_sr_msg);
+	struct buf_sel_arg arg;
+	int nr_iovs;
+
+	nr_iovs = io_recv_bundle_peek(req, kmsg, sel, &arg, sr->len);
+	if (unlikely(nr_iovs <= 0))
+		return !nr_iovs ? -ENOBUFS : nr_iovs;
+
+	if (!sel->buf_list)
+		arg.out_len = arg.iovs[0].iov_len;
+
+	if (nr_iovs == 1)
+		iov_iter_ubuf(&kmsg->msg.msg_iter, ITER_DEST,
+			      arg.iovs[0].iov_base, arg.out_len);
+	else
+		iov_iter_init(&kmsg->msg.msg_iter, ITER_DEST, arg.iovs,
+			      nr_iovs, arg.out_len);
+	return 0;
+}
+
 static int io_recvmsg_buf_select(struct io_kiocb *req,
 				 struct io_async_msghdr *kmsg,
 				 struct io_br_sel *sel,
 				 unsigned int issue_flags)
 {
 	struct io_sr_msg *sr = io_kiocb_to_cmd(req, struct io_sr_msg);
-	size_t len = sr->len;
 	int ret;
 
-	*sel = io_buffer_select(req, &len, sr->buf_group, issue_flags);
-	if (!sel->addr)
-		return -ENOBUFS;
-	len = min_t(size_t, len, MAX_RW_COUNT);
-
-	if (req->flags & REQ_F_APOLL_MULTISHOT) {
-		ret = io_recvmsg_prep_multishot(kmsg, sr, &sel->addr, &len);
-		if (ret) {
+	if (!(issue_flags & IO_URING_F_UNLOCKED) &&
+	    sr->flags & IORING_RECVSEND_BUNDLE) {
+		ret = io_recvmsg_bundle_select(req, kmsg, sel);
+		if (unlikely(ret < 0)) {
 			io_kbuf_recycle(req, sel->buf_list, issue_flags);
 			return ret;
 		}
+	} else {
+		size_t len = sr->len;
+
+		*sel = io_buffer_select(req, &len, sr->buf_group, issue_flags);
+		if (!sel->addr)
+			return -ENOBUFS;
+		len = min_t(size_t, len, MAX_RW_COUNT);
+
+		if (req->flags & REQ_F_APOLL_MULTISHOT) {
+			ret = io_recvmsg_prep_multishot(kmsg, sr, &sel->addr,
+							&len);
+			if (ret) {
+				io_kbuf_recycle(req, sel->buf_list, issue_flags);
+				return ret;
+			}
+		}
+
+		iov_iter_ubuf(&kmsg->msg.msg_iter, ITER_DEST, sel->addr, len);
 	}
 
-	iov_iter_ubuf(&kmsg->msg.msg_iter, ITER_DEST, sel->addr, len);
 	return 0;
 }
 
-- 
2.53.1-Meta

