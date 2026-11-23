Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795470019;
	b=VZvxsUdj0QHoT8NUwp2kmtwXzqofPUTFntUFkmstgxSwY7kzp2TXPOWKjzeTtc6Pn1ce
	 aF9r7AEMv6Fmn5W/IbyZJUG12FYfeyAJ6abieiYwTmfrOAHR5scGORwEiYzynHskondcM
	 cBcoxtE3aBc7PlprLuvppOz4Hn4zU/p7VzbGPOnh1f+KTp1vh4UhaAR6oPJhUY9VjfBIV
	 GAiaQm6k5NLxRR9LoceMeqherKuQErAi5MaLJlChZB1xbVOA0AJlG8XFI3gypA7rbgPQ0
	 U4GzrBQWeu/iAvcAn/cvADBHS2bGMF+uClWa+JTR2Qg3IklVKys7BbjZH2CjNZhFy8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470019;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=a1tRI8/65mu6pBwuIEynIPPnKdws+PGS5nQFEWFwoaY=;
	b=pcFbsv6WXOjW+ulDzkkQhgDGRxmeiPRlpECQYtZ2bvmWkxAZ2ejtJyh0zTMmh13cEYUM
	 ek0vDG/v2KgrZ0qq0a+YJMR5oiC8EgBq/8dPzkv10oAZuz0OMX4Eo6FlSnxuINx2LqYgt
	 xI0kKo8y+aeO0w442RCkD1RxyV7gh/B5yL8Ur33FCLysFn1tGBIhLOb/vxvYtA7xRTcrC
	 ZqkRSoK91vnshSbxK0wbtVvk0wPJ0MIfVwfWOWLpe4FfbfSHZgEDw5aZGjHaJdk2bL4gv
	 K1jnW6wHzb3nu3RuLwImoewdKxjDCa0gr6HzMolwptcno9ut8eX80YBj5n92x7PBGyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=RpkTb67o;
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81957606A31E;
	Mon, 23 Nov 2026 21:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81957606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=RpkTb67o
Received: from pps.filterd (m0528004.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJwO6L2538411;
	Mon, 23 Nov 2026 13:40:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=a1tRI8/65mu6pBwuIEynIPPnKdws+PGS5nQFE
	WFwoaY=; b=RpkTb67oU+39OEZ+5tQLw3TSvzGZ0bNkaZbOIG24AV0gwc0WrQmlK
	Fk0WxnLoH+gDaisAwvNfzBasw9XjSHGD2QIkDxxTxKMnsjm7Fv60M6s5hIqLFHjK
	0IY+Ookp5Bx42vhgybMQIfPo9MBrPMj+Pdx07kX2BRDGF9OCqxA4uQfWRj2q+z73
	vM8qoi/wXRc5srAgV3WBUb00Wtc02HnEB/jp7NqQi2Ia8FNBsAmsrAvQYnzcrsGz
	4HPYMhaQS0QYud1X0BKxZ9QdpnBK33tMsyc106ndGIOuGSE+ItScyb8jO5xNWYy8
	iPg/ODHV58CVxE/NqN52lfXqWymfPXHeg==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j3wth952w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 23 Nov 2026 13:40:17 -0800 (PST)
Received: from localhost (2620:10d:c085:108::4) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Mon, 23 Nov
 2026 21:40:15 +0000
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>
To: Jens Axboe <axboe@kernel.dk>
CC: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>,
        <io-uring@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Juanlu Herrero
	<jlhe0197@meta.com>
Subject: [PATCH v2 3/3] io_uring/net: Add bundle support for multishot recvmsg
Date: Mon, 23 Nov 2026 13:39:20 -0800
Message-ID: <20261123213952.824008-4-cleger@meta.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfX1fpJhaNdA9y0
 xZmafwyNVzNBItH2j0ymMrbttydI8KNER0JyVtwWcfsxvXEzdRIG51JzUf7U0bOtDaQ1gidyhdh
 UrBCPjZ55VwxLbSvb+FTXjANFYau/Vk=
X-Proofpoint-ORIG-GUID: byFxtDbG7OMASvlIU0jG8CsX8lgviKJn
X-Authority-Analysis: v=2.4 cv=U9sHnuru c=1 sm=1 tr=0 ts=6b04b2c1 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=GbPsI2Ihf5RTnMjR_gZv:22
 a=VabnemYjAAAA:8 a=4eHgr8EeR5wV96aBYpQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: byFxtDbG7OMASvlIU0jG8CsX8lgviKJn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfXw8QiD1u9XXWD
 l/mcFJ41zI7DmFjyhLMudyzk4+B6/F68GqQ5xWGGG71XLeB8xacdV6rQXzg7wopayU/tkMyPIA9
 rJCkNx3pvV7pugzcQhW15y2FASMnzOuszN35dY46i2xCpJjpfZChH6LEMn7wBAge1qDZxG/Sd07
 MjKEyoxYaLJJJYiHR8TMlPiWNqXKh7dr26Sx808nzLspUmy4KH7zN8G5Ge7Cu8Mtq4Im7NeLyk6
 wdgZ99E6m9bzwpGJXZBr1AFNt2MyCenKoMh+59QPK5A5MgQcphPZeU9V21dg3nD6Rf4GjmvIpsJ
 wtP+yWyuinVjq1cUKc03OWFJpwmZMsZEvpAvxAgm6BuTxyrly/CQA+PtdY0kgNx2NTibCc2EdWV
 WSZJVYp/t1m+lnrOT/xNp5q26RmLbmHwGz2gBacgGiS/Gvn27uci4lBKJl1lLjtQJ+RyhXTgct9
 6ja2o/aLn0UgUGtMBQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01

Enable bundles for multishot recvmsg by reserving the envelope and
control data in the first buffer, and accounting for the payload spread
across the selected buffers. Incremental buffer rings are supported as
well, as the envelope and the payload are consumed contiguously from the
head buffer.

Signed-off-by: Clément Léger <cleger@meta.com>
---
 io_uring/net.c | 70 ++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 62 insertions(+), 8 deletions(-)

diff --git a/io_uring/net.c b/io_uring/net.c
index 4c9d21db1409..4e385a2b9b64 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -746,6 +746,7 @@ static int io_recvmsg_mshot_prep(struct io_kiocb *req,
 static int io_recvmsg_copy_hdr(struct io_kiocb *req,
 			       struct io_async_msghdr *iomsg)
 {
+	struct io_sr_msg *sr = io_kiocb_to_cmd(req, struct io_sr_msg);
 	struct user_msghdr msg;
 	int ret;
 
@@ -753,6 +754,11 @@ static int io_recvmsg_copy_hdr(struct io_kiocb *req,
 	if (unlikely(ret))
 		return ret;
 
+	iomsg->msg.msg_inq = 0;
+
+	if (sr->flags & IORING_RECVSEND_BUNDLE)
+		sr->mshot_len = sr->len;
+
 	if (!(req->flags & REQ_F_BUFFER_SELECT)) {
 		ret = io_net_import_vec(req, iomsg, msg.msg_iov, msg.msg_iovlen,
 					ITER_DEST);
@@ -847,12 +853,6 @@ int io_recvmsg_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 		return -EINVAL;
 	}
 
-	if (sr->flags & IORING_RECVSEND_BUNDLE) {
-		if (req->opcode == IORING_OP_RECVMSG &&
-		    sr->flags & IORING_RECV_MULTISHOT)
-			return -EINVAL;
-	}
-
 	if (io_is_compat(req->ctx))
 		sr->msg_flags |= MSG_CMSG_COMPAT;
 
@@ -870,6 +870,29 @@ static size_t io_recvmsg_hdr_len(struct io_async_msghdr *kmsg)
 	       kmsg->controllen;
 }
 
+static int io_recv_payload_len(struct io_kiocb *req,
+			       struct io_async_msghdr *kmsg, int consumed)
+{
+	if (req->opcode != IORING_OP_RECVMSG ||
+	    !(req->flags & REQ_F_APOLL_MULTISHOT) || consumed <= 0)
+		return consumed;
+
+	return consumed - (int)io_recvmsg_hdr_len(kmsg);
+}
+
+static bool io_recvmsg_bundle_bufs_left(struct io_async_msghdr *kmsg,
+					int nbufs)
+{
+	struct iov_iter *iter = &kmsg->msg.msg_iter;
+	const struct iovec *iov;
+
+	if (!iter_is_iovec(iter))
+		return false;
+
+	iov = kmsg->vec.iovec ?: &kmsg->fast_iov;
+	return iter_iov(iter) - iov + iter->nr_segs > nbufs;
+}
+
 /*
  * Finishes io_recv and io_recvmsg.
  *
@@ -905,12 +928,23 @@ static inline bool io_recv_finish(struct io_kiocb *req,
 
 	if (sr->flags & IORING_RECVSEND_BUNDLE) {
 		size_t this_ret = sel->val - sr->done_io;
+		int nbufs;
+		int payload = io_recv_payload_len(req, kmsg, consumed);
 
-		cflags |= io_put_kbufs(req, consumed, sel->buf_list, io_bundle_nbufs(kmsg, consumed));
+		if (req->opcode == IORING_OP_RECVMSG && consumed > 0 && !payload)
+			nbufs = 1;
+		else
+			nbufs = io_bundle_nbufs(kmsg, payload);
+
+		cflags |= io_put_kbufs(req, consumed, sel->buf_list, nbufs);
 		if (sr->flags & IORING_RECV_RETRY)
 			cflags = req->cqe.flags | (cflags & CQE_F_MASK);
 		if (sr->mshot_len && sel->val >= sr->mshot_len)
 			sr->flags |= IORING_RECV_MSHOT_CAP;
+		if (req->opcode == IORING_OP_RECVMSG &&
+		    (io_recvmsg_bundle_bufs_left(kmsg, nbufs) ||
+		     cflags & IORING_CQE_F_BUF_MORE))
+			req->flags &= ~REQ_F_BL_EMPTY;
 		/* bundle with no more immediate buffers, we're done */
 		if (req->flags & REQ_F_BL_EMPTY)
 			goto finish;
@@ -1087,15 +1121,35 @@ static int io_recvmsg_bundle_select(struct io_kiocb *req,
 {
 	struct io_sr_msg *sr = io_kiocb_to_cmd(req, struct io_sr_msg);
 	struct buf_sel_arg arg;
+	size_t iov0_len, max_len;
 	int nr_iovs;
+	int ret;
 
-	nr_iovs = io_recv_bundle_peek(req, kmsg, sel, &arg, sr->len);
+	if (sr->len)
+		max_len = sr->len;
+	else if (kmsg->msg.msg_inq > 1)
+		max_len = kmsg->msg.msg_inq + io_recvmsg_hdr_len(kmsg);
+	else
+		max_len = 0;
+
+	nr_iovs = io_recv_bundle_peek(req, kmsg, sel, &arg, max_len);
 	if (unlikely(nr_iovs <= 0))
 		return !nr_iovs ? -ENOBUFS : nr_iovs;
 
 	if (!sel->buf_list)
 		arg.out_len = arg.iovs[0].iov_len;
 
+	if (req->flags & REQ_F_APOLL_MULTISHOT) {
+		iov0_len = arg.iovs[0].iov_len;
+		ret = io_recvmsg_prep_multishot(kmsg, sr, &arg.iovs[0].iov_base,
+						&iov0_len);
+		if (unlikely(ret))
+			return ret;
+		arg.iovs[0].iov_len = iov0_len;
+		arg.out_len -= io_recvmsg_hdr_len(kmsg);
+		kmsg->payloadlen = arg.out_len;
+	}
+
 	if (nr_iovs == 1)
 		iov_iter_ubuf(&kmsg->msg.msg_iter, ITER_DEST,
 			      arg.iovs[0].iov_base, arg.out_len);
-- 
2.53.1-Meta

