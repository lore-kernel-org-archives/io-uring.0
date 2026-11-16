Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827884;
	b=wqmuZOebbJipeHRYYxzcGXDdNmg8Lo41fWX+O6bt5v3WoBe0buwMnOL6AdAlB0obfhOp
	 SnWdFyraiGLzCAr9cGC3zEhtDdFGj0QrVOGWpkhFtKuNWw7WNizXrBCS4NMefgkJYczHX
	 naqVkSwNxhlnkufcfbstlpYVzvXG0m1s8CR/MwIxygeIuCGj8eNrnyYGe4GYCWzh5OLsy
	 JXNM+fZ0Clf+dPzeodXb093jn4zaGV2o1R81xpaFMU7Nvtr/Wqul0h0UrL0rBT6LyIPTp
	 A1QkL5ZNRQQObiGGCYsTxvjIFqHSYVfUhLxRBLJ+cegwEcFg/JNMr0Y91v4bI2WzMTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827884;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=dOoLNcOA145dbGgRO3HFr8CXny0Ow8aS7Stp+f4QsPU=;
	b=4oLmAGIsWgpAvcatIPjc0HpBHsr0EJbgzEu4V4e0C5rN2Q3x9j4WFb5+DH6ytahrYvM5
	 xlP8m8RGgjNGjc/Akrh2RLV4ErXgGLcgRa7Z6NdNa64uotP0+MMr2eMTA1fOUQcFSweGh
	 2ln+YuReq0jNqAd+HxU1C26DPLRekTxyvhbNP3SsQp/HNFvrAO90EtmrW5o/G84Zgu29D
	 OCrKs+5lNcSeNnJbiO267BtnKXIDKzuhV34q/CpduI0Bg5GglAgYG5sWkWMH5xF7kzu9b
	 NMK8Mw/Cq+/5AN+lYt2+9nb8Ot0j6kIy5Q6EDd01sIge8YugsFcKerlm/PO9sCnsUdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=IOfadrRx;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736E6606FA41;
	Mon, 16 Nov 2026 11:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 736E6606FA41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=IOfadrRx
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7dYfS1606045;
	Mon, 16 Nov 2026 03:18:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=dOoLNcOA145dbGgRO3HFr8CXny0Ow8aS7Stp+
	f4QsPU=; b=IOfadrRxYNMuJU19xtAWFqKL3LC/vaqE8iCCjDKsbrHCLcXQYk39L
	Y/h+/9xWvWP0he/9RvEigco6zJRPIxZ+ftBEDP5VtWitnVFjiy3VyvkfNKm6DK7f
	uCE0DzN8doBTllHZigofAbKnHE1oTT/1mxaCrkgNdoCiPBwt/TjTLIJTZLbazVK9
	/GEGiWETY928MQf2uVONq+eE5BRqZ/H1Mc7ANXK7a1nN1AFXlJDgFbqIBEJRvPcJ
	LExcmTw95EfO6fUBKUMe9H5ugPRGmzSca/VOFthRvFHCYWqlVxit8pm6T8IcWgYd
	8v1Uqwfb9ysBrBcf5vVJ3H68VMSZOu7Yg==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hxnmcr8u6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 16 Nov 2026 03:18:01 -0800 (PST)
Received: from localhost (2620:10d:c0a8:1c::11) by mail.thefacebook.com
 (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Mon, 16 Nov
 2026 11:18:00 +0000
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>
To: Jens Axboe <axboe@kernel.dk>
CC: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>,
        <io-uring@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] io_uring/net: Factor out receive buffer selection
Date: Mon, 16 Nov 2026 03:17:36 -0800
Message-ID: <20261116111744.702159-2-cleger@meta.com>
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
X-Proofpoint-ORIG-GUID: O-q-RhI4uRxrhv-23rCYz7qpAd5Pmllr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NCBTYWx0ZWRfX4GTGNJ1M/Zo1
 tFkvCWolXt6l9qnG5o0NF8U7MsLweyNXG2mqzs99dnjXWZGMeti6oxCUC2zIHDR7tLtpnpM01k9
 n7lXmUdZdLFKFTERwYLhauPMkUMo1jM=
X-Proofpoint-GUID: O-q-RhI4uRxrhv-23rCYz7qpAd5Pmllr
X-Authority-Analysis: v=2.4 cv=EMKTQFZC c=1 sm=1 tr=0 ts=6afae669 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=03ozwUkBphtHgyqjj1sw:22
 a=VabnemYjAAAA:8 a=wjFNdW0xE5YP9TeFXlsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NCBTYWx0ZWRfX85fCQ68LlXaM
 MRIigO4b5dYr29axmwe2Z9tw1Yq0a0ja9i3auT4th/sKY0IHENfks0lxRWIGNqFgU8ZeQhicqr3
 mdNLFy94Kgm0VBA+879bEMAfjlefw6FRv0adL4ieKjgQd+fsLeWWYj5rK5+PQxpvUUHawK+Rg3X
 M2gHdKoin5IgZ8M4syp6cJfvmL3eskBdG2i2Wh+Pm+ifJrFS5PH4smLH6P5Pm3TQ22M9B97fMj8
 yl6zpmxyZoPlHF/Rf7lfcKnVVgoT3v52rtWnmvPlPQZIQYRBV38Clu5komFPruGGRZGK2LsqJQn
 Uoi5zmKbEvart9l3OqTSg730kebmpnp/bVbwirVIW+AxEuT0nbiGofY+FOJE9jbDjEoshrwOuSm
 GmDwl9FjrIHt2eG113Ns8qTyBlTpnfkHwLipngtQrzjHpsEdUa1iue6Li8/SYJvRXiYFQaeI1qT
 RpSJYJslKEOG2AT9YoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01

In preparation of bundle support for recvmsg, split out the provided
buffer ring peek into io_recv_bundle_peek() and the existing recvmsg
buffer setup into io_recvmsg_buf_select(). No functional change
intended.

Signed-off-by: Clément Léger <cleger@meta.com>
---
 io_uring/net.c | 110 ++++++++++++++++++++++++++++++++-----------------
 1 file changed, 72 insertions(+), 38 deletions(-)

diff --git a/io_uring/net.c b/io_uring/net.c
index 533afd335627..2f106a1fc69d 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -1039,6 +1039,68 @@ static int io_recvmsg_multishot(struct socket *sock, struct io_sr_msg *io,
 			kmsg->controllen + err;
 }
 
+static int io_recv_bundle_peek(struct io_kiocb *req,
+			       struct io_async_msghdr *kmsg,
+			       struct io_br_sel *sel, struct buf_sel_arg *arg,
+			       size_t max_len)
+{
+	struct io_sr_msg *sr = io_kiocb_to_cmd(req, struct io_sr_msg);
+	int nr_iovs;
+
+	*arg = (struct buf_sel_arg) {
+		.iovs = &kmsg->fast_iov,
+		.nr_iovs = 1,
+		.mode = KBUF_MODE_EXPAND,
+		.buf_group = sr->buf_group,
+		.max_len = max_len,
+	};
+
+	if (kmsg->vec.iovec) {
+		arg->nr_iovs = kmsg->vec.nr;
+		arg->iovs = kmsg->vec.iovec;
+		arg->mode |= KBUF_MODE_FREE;
+	}
+
+	nr_iovs = io_buffers_peek(req, arg, sel);
+	if (unlikely(nr_iovs < 0))
+		return nr_iovs;
+
+	if (arg->iovs != &kmsg->fast_iov && arg->iovs != kmsg->vec.iovec) {
+		kmsg->vec.nr = nr_iovs;
+		kmsg->vec.iovec = arg->iovs;
+		req->flags |= REQ_F_NEED_CLEANUP;
+	}
+	if (arg->partial_map)
+		sr->flags |= IORING_RECV_PARTIAL_MAP;
+	return nr_iovs;
+}
+
+static int io_recvmsg_buf_select(struct io_kiocb *req,
+				 struct io_async_msghdr *kmsg,
+				 struct io_br_sel *sel,
+				 unsigned int issue_flags)
+{
+	struct io_sr_msg *sr = io_kiocb_to_cmd(req, struct io_sr_msg);
+	size_t len = sr->len;
+	int ret;
+
+	*sel = io_buffer_select(req, &len, sr->buf_group, issue_flags);
+	if (!sel->addr)
+		return -ENOBUFS;
+	len = min_t(size_t, len, MAX_RW_COUNT);
+
+	if (req->flags & REQ_F_APOLL_MULTISHOT) {
+		ret = io_recvmsg_prep_multishot(kmsg, sr, &sel->addr, &len);
+		if (ret) {
+			io_kbuf_recycle(req, sel->buf_list, issue_flags);
+			return ret;
+		}
+	}
+
+	iov_iter_ubuf(&kmsg->msg.msg_iter, ITER_DEST, sel->addr, len);
+	return 0;
+}
+
 int io_recvmsg(struct io_kiocb *req, unsigned int issue_flags)
 {
 	struct io_sr_msg *sr = io_kiocb_to_cmd(req, struct io_sr_msg);
@@ -1068,20 +1130,10 @@ int io_recvmsg(struct io_kiocb *req, unsigned int issue_flags)
 	sel.buf_list = NULL;
 	len = sr->len;
 	if (io_do_buffer_select(req)) {
-		sel = io_buffer_select(req, &len, sr->buf_group, issue_flags);
-		if (!sel.addr)
-			return -ENOBUFS;
-		len = min_t(size_t, len, MAX_RW_COUNT);
-
-		if (req->flags & REQ_F_APOLL_MULTISHOT) {
-			ret = io_recvmsg_prep_multishot(kmsg, sr, &sel.addr, &len);
-			if (ret) {
-				io_kbuf_recycle(req, sel.buf_list, issue_flags);
-				return ret;
-			}
-		}
-
-		iov_iter_ubuf(&kmsg->msg.msg_iter, ITER_DEST, sel.addr, len);
+		ret = io_recvmsg_buf_select(req, kmsg, &sel, issue_flags);
+		if (unlikely(ret < 0))
+			return ret;
+		len = iov_iter_count(&kmsg->msg.msg_iter);
 	}
 
 	kmsg->msg.msg_get_inq = 1;
@@ -1153,39 +1205,21 @@ static int io_recv_buf_select(struct io_kiocb *req, struct io_async_msghdr *kmsg
 	 */
 	if (!(issue_flags & IO_URING_F_UNLOCKED) &&
 	    sr->flags & IORING_RECVSEND_BUNDLE) {
-		struct buf_sel_arg arg = {
-			.iovs = &kmsg->fast_iov,
-			.nr_iovs = 1,
-			.mode = KBUF_MODE_EXPAND,
-			.buf_group = sr->buf_group,
-		};
-
-		if (kmsg->vec.iovec) {
-			arg.nr_iovs = kmsg->vec.nr;
-			arg.iovs = kmsg->vec.iovec;
-			arg.mode |= KBUF_MODE_FREE;
-		}
+		struct buf_sel_arg arg;
+		size_t max_len = 0;
 
 		if (sel->val)
-			arg.max_len = sel->val;
+			max_len = sel->val;
 		else if (kmsg->msg.msg_inq > 1)
-			arg.max_len = kmsg->msg.msg_inq;
+			max_len = kmsg->msg.msg_inq;
 
 		/* if mshot limited, ensure we don't go over */
 		if (sr->flags & IORING_RECV_MSHOT_LIM)
-			arg.max_len = min_not_zero(arg.max_len, sr->mshot_total_len);
-		ret = io_buffers_peek(req, &arg, sel);
+			max_len = min_not_zero(max_len, sr->mshot_total_len);
+		ret = io_recv_bundle_peek(req, kmsg, sel, &arg, max_len);
 		if (unlikely(ret < 0))
 			return ret;
 
-		if (arg.iovs != &kmsg->fast_iov && arg.iovs != kmsg->vec.iovec) {
-			kmsg->vec.nr = ret;
-			kmsg->vec.iovec = arg.iovs;
-			req->flags |= REQ_F_NEED_CLEANUP;
-		}
-		if (arg.partial_map)
-			sr->flags |= IORING_RECV_PARTIAL_MAP;
-
 		/* special case 1 vec, can be a fast path */
 		if (ret == 1) {
 			sr->buf = arg.iovs[0].iov_base;
-- 
2.53.1-Meta

