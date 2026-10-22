Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792700548;
	b=q3pq72zhp/PN/ea5zbJstznU9k+rElqz8yj2pwUw3nibZW5tj2PRth9/k2Q8WsrLtUKL
	 9NJBKt5lMajavpln5WCmZjAz1218VXLMaQslpm4KENlZqZ3JsKMzoGmSuuSG+AWcdqRoq
	 Xc9GjK9q6DuR+KkKkCcHT9WDUcGB3W/owUJL1V6BpwdxrxEw7w4GZXKly0u0adjov9Eqd
	 +jFMbsc8T9TsrZgcBPbTGxdTFCh7C+4q+Ninkd4udU+RyDxFkPwP4RSzVlIHgcBtPw1me
	 jrq1UUaYr5SfgIlvEcXZxrB7NAaP/Tqy51yUIT93LNasiXtpc3l8WrSrsQ6Pj7ZlcVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700548;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version;
	bh=UVfPiBY11c+DvREEA3B+kQj+k08oJhZBDtYiIKmLFFU=;
	b=gY70EBEGPreGCtrvW1hYWyW8YdRs7uTrV7QIZO/9ZNTEJWQ69LaUH7gf/EB5iV/Rpgis
	 hIBe17H70j014E/s0ln9YKqVKWF7OgBitEPITaBf1sfyEc4fbWLP6H1a1/3035pcfnLzU
	 lU2bokc5f16rxkMDwOwXOz8JqUJ0ilhNTx+x16Tv7GaMDv6EXseBZ5RAu+kY8OAZfQQL+
	 HJo1zVaCa+N7Gp49AH7MnTzSzMCQbz5nampmH2+B+ky/y/ESgI7YWdHQbchCOzMO8MSCf
	 i7//5q16S3se0qqbR+6yp5S89O1vvz4yQJv4rX6ocu30ZoXhPiQYtxsFvKPX4uTnkqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=ik1fQicX;
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0C6606A321;
	Thu, 22 Oct 2026 20:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C0C6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=ik1fQicX
Received: from pps.filterd (m0528006.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MHt4QM1017972;
	Thu, 22 Oct 2026 13:22:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=UVfPiBY11c+DvREEA3B+kQj+k08oJhZBDtYiI
	KmLFFU=; b=ik1fQicXuyPhrSN6v0M/+wop3gjgDEx0ZNLqYOkIP9PbQp/1KgNc6
	2RTr1hmNBemFxzFRVwJQXx7CPzeU3BDv2MEdLFtdebXBx6RJx7nk6a5AMlpGKlce
	POk0j33mdsGND55lkr6rRC9xjdW4zKagxuH1NT5el8foa5LVzApCXGGpOx+FnIs4
	/qeGo9CcYZEGeiPq0+xwmHXYfUvjUBoQI9m1VSj0KF7Dv8z6zzX/s56FmFh0LM74
	9xxIayOVuuOaktjFmTfFGQ+LkDrgzYNE7YmHtSXsJpRE0UZz28W3Tjb/emdgZ3V6
	8RWlfbvwinsq2xqHNd5F57bpdeBTWrkNw==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hfjf63rsk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 22 Oct 2026 13:22:25 -0700 (PDT)
Received: from localhost (2620:10d:c085:108::4) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Thu, 22 Oct
 2026 20:22:23 +0000
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>
To: Jens Axboe <axboe@kernel.dk>
CC: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>,
        <io-uring@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 2/2] io_uring/net: Add bundle support for multishot recvmsg
Date: Thu, 22 Oct 2026 13:20:23 -0700
Message-ID: <20261022202106.2474515-3-cleger@meta.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022202106.2474515-1-cleger@meta.com>
References: <20261022202106.2474515-1-cleger@meta.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA4MCBTYWx0ZWRfXwcPUUNWj0iIU
 zuHlGXj26HxASZ8I2iJdWd0cSMkE5f0Thv5sNanjKgQxFS6gRGiSVxTqXjRt3Rr5KZkNaz8H+yK
 PySl/eT7EwI27MSTyqFfAtM9j81zISA=
X-Proofpoint-GUID: 0GiS0BuLXjxZjyJ67zeWKGS3pynViWch
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA4MCBTYWx0ZWRfX77n6EVL/5Z0Z
 tNyFmsQEo9iLTo1AhB0quQZa7AKI6OTXJNHI/Uo6+N/edABTrgvJ4r277nLUe0/w1JQz/A9NVJ7
 t6tyJdZB6E9V0eyb0lk8/zxt4pHROyhZ+9pAhQ/JN10c1t+yk5IRkPJ9hK6ChsjtJpcf5ReZcwq
 f9D1vjAlokML/9BdZe1ohr3EJal/ufvNuKBjD042avpAgqQgNSFmL5gx8srf16K66O63cQxUfrn
 ltF4bkvUT41KBGzPoFmj+lTYrCuIHLLpGHFU4VZZZX+vskP1K1j4QkEr9UlW8LgZtELwX3XPYdL
 VrV1Z1qpUj0mTs0bhINPmEkO6jaP+3Jhyh1KNdMYlJ2xemuA9cOKkmlj69XNZN0jr7VVQF/wQfN
 u77ao3/zvAodLHGc19FCOYQBrCv4LSDlv4lWhHPoITVdRaLUrbXb+ADtdoH+FvFvEqKQ59WssUi
 TouypcsFkd2mm7L2iog==
X-Authority-Analysis: v=2.4 cv=VN5IDNPX c=1 sm=1 tr=0 ts=6ada7081 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=kkcUborcUVj0H7zxAXTl:22
 a=VabnemYjAAAA:8 a=ZktdnOYcYsRQubDeTi8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: 0GiS0BuLXjxZjyJ67zeWKGS3pynViWch
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01

IORING_RECVSEND_BUNDLE was disabled for IORING_OP_RECVMSG because the
envelope and control-message sizing was not implemented. Enable
bundled multishot recvmsg by reserving its metadata in the first buffer
and accounting for payload spread across the selected buffer run.

Signed-off-by: Clément Léger <cleger@meta.com>
---
 io_uring/net.c | 150 +++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 134 insertions(+), 16 deletions(-)

diff --git a/io_uring/net.c b/io_uring/net.c
index 1606824971ec..3ae2ae405ce3 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -735,6 +735,8 @@ static int io_recvmsg_copy_hdr(struct io_kiocb *req,
 	if (unlikely(ret))
 		return ret;
 
+	iomsg->msg.msg_inq = 0;
+
 	if (!(req->flags & REQ_F_BUFFER_SELECT)) {
 		ret = io_net_import_vec(req, iomsg, msg.msg_iov, msg.msg_iovlen,
 					ITER_DEST);
@@ -830,7 +832,8 @@ int io_recvmsg_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	}
 
 	if (sr->flags & IORING_RECVSEND_BUNDLE) {
-		if (req->opcode == IORING_OP_RECVMSG)
+		if (req->opcode == IORING_OP_RECVMSG &&
+		    !(sr->flags & IORING_RECV_MULTISHOT))
 			return -EINVAL;
 	}
 
@@ -845,6 +848,37 @@ int io_recvmsg_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 #define CQE_F_MASK	(IORING_CQE_F_SOCK_NONEMPTY|IORING_CQE_F_MORE|\
 			 IORING_CQE_F_BUF_MORE)
 
+static int io_recv_payload_len(struct io_kiocb *req,
+			       struct io_async_msghdr *kmsg, int consumed)
+{
+	size_t hdr;
+
+	if (req->opcode != IORING_OP_RECVMSG ||
+	    !(req->flags & REQ_F_APOLL_MULTISHOT) || consumed <= 0)
+		return consumed;
+
+	if (check_add_overflow(sizeof(struct io_uring_recvmsg_out),
+			       (size_t)kmsg->namelen, &hdr) ||
+	    check_add_overflow(hdr, kmsg->controllen, &hdr) ||
+	    (size_t)consumed <= hdr)
+		return 0;
+
+	return consumed - (int)hdr;
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
@@ -877,20 +911,37 @@ static inline bool io_recv_finish(struct io_kiocb *req,
 
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
@@ -936,14 +987,14 @@ static inline bool io_recv_finish(struct io_kiocb *req,
 
 static int io_recvmsg_prep_multishot(struct io_async_msghdr *kmsg,
 				     struct io_sr_msg *sr, void __user **buf,
-				     size_t *len)
+				     size_t *len, size_t total)
 {
 	unsigned long ubuf = (unsigned long) *buf;
 	unsigned long hdr;
 
 	hdr = sizeof(struct io_uring_recvmsg_out) + kmsg->namelen +
 		kmsg->controllen;
-	if (*len < hdr)
+	if (*len < hdr || total < hdr)
 		return -EFAULT;
 
 	if (kmsg->controllen) {
@@ -955,7 +1006,8 @@ static int io_recvmsg_prep_multishot(struct io_async_msghdr *kmsg,
 
 	sr->buf = *buf; /* stash for later copy */
 	*buf = (void __user *) (ubuf + hdr);
-	kmsg->payloadlen = *len = *len - hdr;
+	*len = *len - hdr;
+	kmsg->payloadlen = total - hdr;
 	return 0;
 }
 
@@ -1054,28 +1106,94 @@ static int io_recv_bundle_peek(struct io_kiocb *req,
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
+		max_len = kmsg->msg.msg_inq +
+			  sizeof(struct io_uring_recvmsg_out) +
+			  kmsg->namelen + kmsg->controllen;
+	else
+		/*
+		 * No size hint (datagram sockets don't report inq): map all
+		 * available buffers so a single datagram can span them. A
+		 * recvmsg returns at most one datagram and only the consumed
+		 * buffers are committed.
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
2.53.0-Meta

