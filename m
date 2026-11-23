Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795470010;
	b=cNlpYLPDTCSZglp6DXS4X/cZCp2xwih4k/WtfYuZ+Y6477bbnXaIkSknJu6C4pxAXSDE
	 ET/wlxzgZhqXQaS62ViJxMpeb9tmkY2UQS2jmtwTaRZk2Wuyu/K2DN2O82w0zssg8IFyb
	 20gn5mflSlaFtSkS/xfPr4BiQR2+TCJ/Grcte6NHdq2sB4qDANK3nxpFZVVzEiJ3JYRRH
	 ndrO9+l+8Icm6Au3rZttjd9xkd7Jl2bWppQ73qXTsKv4Sb9LTtRT8sEvrH6G1yK9aIi3k
	 w+XANq+/ZryQutTNclky463DM2+pTWsEx3dwXHtvIvpq+H7klkJqsul8IT1D1/5bjlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470010;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=anOJ+3MjU4Vzs2wxlMXMOCsqTBuNPTglhCbFCbcl6Lw=;
	b=l4RwEOHUjcwPUEIG90KlUfivE+zgUgur/tfXFxABQoy8mvEMgmTjo8sUC517BGPXMeYr
	 HWIoGLY30EBu0kfWKXamJ2qjQXOak3pTkE+0Vgi9IyfNjvZYM4z6WnT/T4iTRqfbf40B9
	 wchrxC1+pwDnPN4AsvjbgCmgbYC+LXCRCUBQ0b9Ff00MDWu3tnAPneOgv0IUypOwnJvaf
	 LvEUPlFe271b6raRSkhiZyztg5uats+j003xAJ+MJn4ElYPrgC4oCGendElYS5tuEb2Kc
	 r7Cun2M2ZUnYaZ4GcRNzQXSdHTHhH3t9ugQT5JxLTA/8dzzgY5Si7DKnyPcc5YZ2ybg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b="fBDf/cC6";
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD23606A321;
	Mon, 23 Nov 2026 21:40:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FD23606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=fBDf/cC6
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJwMVj250255;
	Mon, 23 Nov 2026 13:40:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=anOJ+3MjU4Vzs2wxlMXMOCsqTBuNPTglhCbFC
	bcl6Lw=; b=fBDf/cC6naFXYGY/VXz4lrE4MqBXUMkDVU/TDBY8vzNO0yPLFKOa+
	pcJeS0iEzAOIUx8rXtZJp7YHVKxdObV+eG5etRdrhIs9AojFjtH42Ca8iX1i7CmD
	kUlashjp/F7eIV3ReVdLvL/VL2hk6m0uXJvjJnw1rf1nDVR+SG14LR4SciixqhJO
	ue9Z5itWjcOWUwfX/fmFFIghWo43F2noFI3jnwrebk5RHZQqhtvIK3CgZ8a79W3f
	+6wcxeQk6VJsiG+e4+yum/uMl+M4o444AzTh4ZKSJctaMhvRjZG4mvXsJXKTW1v8
	SVd4ozEd3NTU5Gh9/uFvFaX3lq1umijfQ==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j39v3cfu6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 23 Nov 2026 13:40:08 -0800 (PST)
Received: from localhost (2620:10d:c085:108::150d) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Mon, 23 Nov
 2026 21:40:07 +0000
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>
To: Jens Axboe <axboe@kernel.dk>
CC: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>,
        <io-uring@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Juanlu Herrero
	<jlhe0197@meta.com>
Subject: [PATCH v2 1/3] io_uring/net: Factor out receive buffer selection
Date: Mon, 23 Nov 2026 13:39:18 -0800
Message-ID: <20261123213952.824008-2-cleger@meta.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfXx9UVDoM+Vs6R
 0LdtoHv7bXFn+BDE8tAq0gp0AhLqBIGqJKyqrxzDlg8M+8eddIGE0EbGHJ7TfEKy/+PnLburuVm
 V/I/UfUPUS5aFd4BytVvdC73C3nGank=
X-Proofpoint-ORIG-GUID: bNERBfqtG-r7XjEIrexMfuvmZz-ysbtp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfX+/aGMvj+cNpR
 0Zc0BadAkqsBuE7TewwZjbsqgyz09ykOq93Bs7OGKOV1vYPxlX5Gx4HdOZ+Vtm3dUi9EL0w367D
 6+ZeEK1EqfAMCqvfcMiYm7odeUtooX2c3GUPIo91clzGYxa7NVZ0kXzRL2zbw/RsDEpPYEuHohB
 4IBhxEMhDVMoLQSW7b+wPPlx3h2N56U7cGpKy7MKg7jEIOZKHml5SBrXzexHRBf14fcSJrm1mvz
 +dVe7ODrRm4hzwiAu5jYd8G+H+hoBXoSgroprhB6rVPVfD7FwfQspl0PjPFYlK6CjaGpYI6wlF+
 GkmfeLFeSCW+kyW0YOcx9BJrodVuab/3/AqKG/Kgm02G5I5ZlC50FCLLHTtQnTeYBOt0kHEtR6D
 Y2Oj2phaYvxfRrKETFhzfhugy7YnIDTNFkXulznoo6VYSZsTDNrQsH9nLYvne8REDXwZtBCEbK7
 CNfc7AJKOvW71IFqSvA==
X-Proofpoint-GUID: bNERBfqtG-r7XjEIrexMfuvmZz-ysbtp
X-Authority-Analysis: v=2.4 cv=a+mlZkSF c=1 sm=1 tr=0 ts=6b04b2b8 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=PAz_-FQ8hEVmOPYdF0yf:22
 a=VabnemYjAAAA:8 a=Pq0vTLmSvauFJnm5LVYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01

In preparation of bundle support for recvmsg, split out the provided
buffer ring peek into io_recv_bundle_peek(), the existing recvmsg
buffer setup into io_recvmsg_buf_select() and the recvmsg header length
computation into io_recvmsg_hdr_len(). No functional change intended.

Signed-off-by: Clément Léger <cleger@meta.com>
---
 io_uring/net.c | 122 ++++++++++++++++++++++++++++++++-----------------
 1 file changed, 80 insertions(+), 42 deletions(-)

diff --git a/io_uring/net.c b/io_uring/net.c
index 533afd335627..6c9cfef7ed5c 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -863,6 +863,12 @@ int io_recvmsg_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 #define CQE_F_MASK	(IORING_CQE_F_SOCK_NONEMPTY|IORING_CQE_F_MORE|\
 			 IORING_CQE_F_BUF_MORE)
 
+static size_t io_recvmsg_hdr_len(struct io_async_msghdr *kmsg)
+{
+	return sizeof(struct io_uring_recvmsg_out) + kmsg->namelen +
+	       kmsg->controllen;
+}
+
 /*
  * Finishes io_recv and io_recvmsg.
  *
@@ -962,8 +968,7 @@ static int io_recvmsg_prep_multishot(struct io_async_msghdr *kmsg,
 	unsigned long ubuf = (unsigned long) *buf;
 	unsigned long hdr;
 
-	hdr = sizeof(struct io_uring_recvmsg_out) + kmsg->namelen +
-		kmsg->controllen;
+	hdr = io_recvmsg_hdr_len(kmsg);
 	if (*len < hdr)
 		return -EFAULT;
 
@@ -1035,8 +1040,69 @@ static int io_recvmsg_multishot(struct socket *sock, struct io_sr_msg *io,
 		return -EFAULT;
 	}
 
-	return sizeof(struct io_uring_recvmsg_out) + kmsg->namelen +
-			kmsg->controllen + err;
+	return io_recvmsg_hdr_len(kmsg) + err;
+}
+
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
 }
 
 int io_recvmsg(struct io_kiocb *req, unsigned int issue_flags)
@@ -1068,20 +1134,10 @@ int io_recvmsg(struct io_kiocb *req, unsigned int issue_flags)
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
@@ -1153,39 +1209,21 @@ static int io_recv_buf_select(struct io_kiocb *req, struct io_async_msghdr *kmsg
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

