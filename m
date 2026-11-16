Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827892;
	b=aeBpCGFNnROAWTtFl3snZEGzXDsv4ziCS/2lng2sPudKlx8HEUTzYx5AccuRtS9VveCO
	 Naxa0A/4FDu/v9JspFYeHxdCRkiU71f9LRAzx8IlNsotj/QT1VOWGkRxjMdki7xt56x3O
	 DO7sCTNmsnOqHE8wozQn4OtBMM12IWIytg08YsBHyKWFYqE+tdVHY83DaExkQwHB/rI+x
	 UV6EsXeYBDQ+Inx7MHMHog5qCroApEqiT+RuNvD6b7RY3B0EWkZbeFLlmFSiRKqTKGIsi
	 Cj7rx3CCfOpTyo6/VSY0gC/or08Oqx7Wjv+4SjvEN5j1SKNCoxWiikqSOJ9ZW6vcQ+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827892;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=hr2iOYsfwsGfteooV/PkXIZGy0rZa5h2sUds04atGew=;
	b=LaVsiKBzkS+P304O3v70l7YLTFX5imphQPIdg6OivdHhPGC2fNXtpboylvPapZPmv+vp
	 EdA1UN8UgnVP4uV9Uyz85TiOaWzgmN2swVd0HT24GWMumtgnj906opR9K0kbOIZDtHn3t
	 2HJLnNIrbGkzIpD46/c9SfHVythuch/jn7ThnEcNWCHkwvTnZO+sQRcYKxylXuwavm4Mh
	 1XAPAYWRtZLN6kkCAI1K0DkW61rlCJp5dO+WQvazLf0DT5JilnfHtF4exC6cVKHvFfjrv
	 6XciR2KbLuO2VUdu5Qlie9hRm4L4FHE6HB4hF20BlbndzmsreM3xEqdO1YHnmU3+Ccg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b="iB/mchrt";
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC67606FA7F;
	Mon, 16 Nov 2026 11:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EC67606FA7F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=iB/mchrt
Received: from pps.filterd (m0528008.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7dGga849902;
	Mon, 16 Nov 2026 03:18:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=hr2iOYsfwsGfteooV/PkXIZGy0rZa5h2sUds0
	4atGew=; b=iB/mchrtz02GirH4yZST3uq/URICvTqTkbNYyV+6vAi00CiNUwQBg
	bzvhvMGoMOWEJS/YV5ZOWpZCMOg3EBSAvqH5xyVz2+kLDmfOcKxRnpPdV77TDakV
	KdHMjstlubpyOOm8KiqF7vbz1Y/pT4G4cJjsR/M+UuUV8hVYWvnb5UQ3tCmQLlH7
	SoJ8CxIWjxfxwkxbSDDDffmFdHb9xYCYWOjsIG55W49s5n/9xHzxUQvtweP0cIdE
	9uWGzxEx2osd7gWqR5STgARBQfkBEfC9xjd/GJHFKfE2haeuwyXxXhChk/Vu9Yf9
	PCGKCPDeCCXdcBBMeA9wPRsgWbAY/7Ykw==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hyd4qm1yk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 16 Nov 2026 03:18:10 -0800 (PST)
Received: from localhost (2620:10d:c0a8:fe::f072) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Mon, 16 Nov
 2026 11:18:08 +0000
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>
To: Jens Axboe <axboe@kernel.dk>
CC: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>,
        <io-uring@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] io_uring/net: Add bundle support for multishot recvmsg
Date: Mon, 16 Nov 2026 03:17:37 -0800
Message-ID: <20261116111744.702159-3-cleger@meta.com>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261116111744.702159-1-cleger@meta.com>
References: <20261116111744.702159-1-cleger@meta.com>
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
X-Authority-Analysis: v=2.4 cv=btnZl0ai c=1 sm=1 tr=0 ts=6afae672 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=_1IyUuN4QrATX339ibzo:22
 a=VabnemYjAAAA:8 a=eftbfI40lzuo6X_ppmIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: 88zbdacNc3RHmdBX1ci4ZtDBvQYmjPff
X-Proofpoint-ORIG-GUID: 88zbdacNc3RHmdBX1ci4ZtDBvQYmjPff
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NCBTYWx0ZWRfXyyZKyUOzeyIo
 97PshE2JVQdkH1/cggJYN/566LfZf3p7t0YOyHsbWquK8PfRtxpxW5fZzVl/+wbCo3+xpmhGyZI
 JUYRZeRe1ma7cbzoALYmSuNALvTynis=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NCBTYWx0ZWRfX+qzBLBv357Zz
 l8GWPGwtflzOpFa4PLrYI27FvTyUuIeYKf5yI2HDapfcpgLUeGjv6g8K4b3VHHeB4XytPAgjqHm
 heV8nsg/GVXK6kNOMFqJ5Vh4XxK7Fswhc+0/y4DW2lf56Wg8IKWALV4tgvfegPsj3pyvB1x1Ija
 TNRFgr9ozwX6AwLUiTVeo1kDyur56A4zNNG1yrB9ZdwDA8AZWtfjqPXzkbKbzRJSa2Wx9FHy6zj
 +QseUd9BXMVz+ogoFihNgV1Gruz4oMgNf37Elqf9n7FCG77a0/cEwBDd0nAKMOl4vKg1TpNyvHg
 2pV/zoXFYedtCywqCNOqDTT7l2VNhcJ/cAe2u5MR6bmfePP8UPO1YWQV27Pq9F33tYdoIJbdsy+
 W+QHb4JgRrrpvoS6T+6rywwYZ5wl9vQ6gS21xhWEMvfgUWMsoExBnTCKmLCKOzBeobT4SQhIiKZ
 UKvktbhd15mM1laJ7Aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01

IORING_RECVSEND_BUNDLE was disabled for IORING_OP_RECVMSG because the
envelope and control-message sizing was not implemented. Enable
bundled multishot recvmsg by reserving its metadata in the first buffer
and accounting for payload spread across the selected buffer run.

Signed-off-by: Clément Léger <cleger@meta.com>
---
 io_uring/net.c | 154 ++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 134 insertions(+), 20 deletions(-)

diff --git a/io_uring/net.c b/io_uring/net.c
index 2f106a1fc69d..e207530c6f1c 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -753,6 +753,8 @@ static int io_recvmsg_copy_hdr(struct io_kiocb *req,
 	if (unlikely(ret))
 		return ret;
 
+	iomsg->msg.msg_inq = 0;
+
 	if (!(req->flags & REQ_F_BUFFER_SELECT)) {
 		ret = io_net_import_vec(req, iomsg, msg.msg_iov, msg.msg_iovlen,
 					ITER_DEST);
@@ -848,7 +850,8 @@ int io_recvmsg_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	}
 
 	if (sr->flags & IORING_RECVSEND_BUNDLE) {
-		if (req->opcode == IORING_OP_RECVMSG)
+		if (req->opcode == IORING_OP_RECVMSG &&
+		    !(sr->flags & IORING_RECV_MULTISHOT))
 			return -EINVAL;
 	}
 
@@ -863,6 +866,36 @@ int io_recvmsg_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 #define CQE_F_MASK	(IORING_CQE_F_SOCK_NONEMPTY|IORING_CQE_F_MORE|\
 			 IORING_CQE_F_BUF_MORE)
 
+/* multishot recvmsg envelope + name + cmsg size, ahead of the payload */
+static size_t io_recvmsg_hdr_len(struct io_async_msghdr *kmsg)
+{
+	return sizeof(struct io_uring_recvmsg_out) + kmsg->namelen +
+	       kmsg->controllen;
+}
+
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
@@ -898,20 +931,37 @@ static inline bool io_recv_finish(struct io_kiocb *req,
 
 	if (sr->flags & IORING_RECVSEND_BUNDLE) {
 		size_t this_ret = sel->val - sr->done_io;
+		int nbufs;
+		int payload = io_recv_payload_len(req, kmsg, consumed);
+
+		/*
+		 * A zero-length plain recv recycles its selection before this point.
+		 * recvmsg still consumes the first buffer for its output envelope.
+		 */
+		if (req->opcode == IORING_OP_RECVMSG && consumed > 0 && !payload)
+			nbufs = 1;
+		else
+			nbufs = io_bundle_nbufs(kmsg, payload);
 
-		cflags |= io_put_kbufs(req, consumed, sel->buf_list, io_bundle_nbufs(kmsg, consumed));
+		cflags |= io_put_kbufs(req, consumed, sel->buf_list, nbufs);
 		if (sr->flags & IORING_RECV_RETRY)
 			cflags = req->cqe.flags | (cflags & CQE_F_MASK);
 		if (sr->mshot_len && sel->val >= sr->mshot_len)
 			sr->flags |= IORING_RECV_MSHOT_CAP;
+		if (req->opcode == IORING_OP_RECVMSG &&
+		    io_recvmsg_bundle_bufs_left(kmsg, nbufs))
+			req->flags &= ~REQ_F_BL_EMPTY;
 		/* bundle with no more immediate buffers, we're done */
 		if (req->flags & REQ_F_BL_EMPTY)
 			goto finish;
 		/*
 		 * If more is available AND it was a full transfer, retry and
-		 * append to this one
+		 * append to this one. This is not supported for recvmsg: each
+		 * CQE must carry exactly one envelope, so appending a second
+		 * recvmsg return into the same completion is not possible.
 		 */
-		if (!(sr->flags & IORING_RECV_NO_RETRY) &&
+		if (req->opcode != IORING_OP_RECVMSG &&
+		    !(sr->flags & IORING_RECV_NO_RETRY) &&
 		    kmsg->msg.msg_inq > 1 && this_ret > 0 &&
 		    !iov_iter_count(&kmsg->msg.msg_iter)) {
 			req->cqe.flags = cflags & ~CQE_F_MASK;
@@ -957,13 +1007,12 @@ static inline bool io_recv_finish(struct io_kiocb *req,
 
 static int io_recvmsg_prep_multishot(struct io_async_msghdr *kmsg,
 				     struct io_sr_msg *sr, void __user **buf,
-				     size_t *len)
+				     size_t *len, size_t total)
 {
 	unsigned long ubuf = (unsigned long) *buf;
 	unsigned long hdr;
 
-	hdr = sizeof(struct io_uring_recvmsg_out) + kmsg->namelen +
-		kmsg->controllen;
+	hdr = io_recvmsg_hdr_len(kmsg);
 	if (*len < hdr)
 		return -EFAULT;
 
@@ -976,7 +1025,8 @@ static int io_recvmsg_prep_multishot(struct io_async_msghdr *kmsg,
 
 	sr->buf = *buf; /* stash for later copy */
 	*buf = (void __user *) (ubuf + hdr);
-	kmsg->payloadlen = *len = *len - hdr;
+	*len = *len - hdr;
+	kmsg->payloadlen = total - hdr;
 	return 0;
 }
 
@@ -1035,8 +1085,7 @@ static int io_recvmsg_multishot(struct socket *sock, struct io_sr_msg *io,
 		return -EFAULT;
 	}
 
-	return sizeof(struct io_uring_recvmsg_out) + kmsg->namelen +
-			kmsg->controllen + err;
+	return io_recvmsg_hdr_len(kmsg) + err;
 }
 
 static int io_recv_bundle_peek(struct io_kiocb *req,
@@ -1075,29 +1124,94 @@ static int io_recv_bundle_peek(struct io_kiocb *req,
 	return nr_iovs;
 }
 
+static int io_recvmsg_bundle_select(struct io_kiocb *req,
+				    struct io_async_msghdr *kmsg,
+				    struct io_br_sel *sel)
+{
+	struct io_sr_msg *sr = io_kiocb_to_cmd(req, struct io_sr_msg);
+	struct buf_sel_arg arg;
+	size_t iov0_len, max_len;
+	int nr_iovs;
+	int ret;
+
+	if (sr->len)
+		max_len = sr->len;
+	else if (kmsg->msg.msg_inq > 1)
+		/* the envelope + cmsg also live in the mapped buffers */
+		max_len = kmsg->msg.msg_inq + io_recvmsg_hdr_len(kmsg);
+	else
+		/*
+		 * No usable size hint: datagram sockets don't report inq, and
+		 * stream sockets haven't reported one on the first issue or
+		 * may report 0 or 1. Map as many buffers as the peek allows
+		 * (up to PEEK_MAX_IMPORT) so a single receive can span them.
+		 * Only the consumed buffers are committed.
+		 */
+		max_len = MAX_RW_COUNT;
+
+	nr_iovs = io_recv_bundle_peek(req, kmsg, sel, &arg, max_len);
+	if (unlikely(nr_iovs <= 0))
+		return !nr_iovs ? -ENOBUFS : nr_iovs;
+	/* legacy provided buffers map a single buffer and don't set out_len */
+	if (!sel->buf_list)
+		arg.out_len = arg.iovs[0].iov_len;
+
+	if (sel->buf_list && sel->buf_list->flags & IOBL_INC)
+		return -EOPNOTSUPP;
+
+	/* reserve the envelope + cmsg at the front of the first buffer only */
+	iov0_len = arg.iovs[0].iov_len;
+	ret = io_recvmsg_prep_multishot(kmsg, sr, &arg.iovs[0].iov_base,
+					&iov0_len, arg.out_len);
+	if (unlikely(ret))
+		return ret;
+	arg.iovs[0].iov_len = iov0_len;
+
+	iov_iter_init(&kmsg->msg.msg_iter, ITER_DEST, arg.iovs, nr_iovs,
+		      kmsg->payloadlen);
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
+	/*
+	 * Bundle recvmsg spans multiple provided buffers, but the peek
+	 * interface can only be used when the ring is locked. If we came
+	 * in unlocked, fall back to a single-buffer envelope carve.
+	 */
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
+							&len, len);
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

