Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792700543;
	b=DK0fhnWnDjL2EK6QGaedN1ot9rKpsRw7s7PlwdaEBXfjZBhB3IVHqgWJZIjBNijXrY94
	 q407Y7ZaC5DTr4SNrw5x5M007IFtdftE6jRpGO4YWrXhw0y+RC9ulBjs+ne/4xFbBCVXe
	 kBjnkK2kc918wvUhPEerQavB/cDNm63XV2LNX6Q0WBWr81y/J+8T17lk215lPZOGTvZCV
	 OqiJEAzHqWEb9CUB97bPoHu5fbEi/IfezFJMYuT5CSp6lz1wHPetwpkoExQphsYgGq9Jx
	 ncP+HLR8wayAxtCDhMs2YGPEvAffAYtMOU5gbraBOGtL/07tvF5WUQ3Ok1FhxxUGrrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700543;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=eRied2sFAIlMg7fzehlSeofRbpvYYZgxmtcQb30eI2o=;
	b=zEdJ/pMuEYCFrCDVOaslPDRR3K33qtUloKVykjc5YMD+H7Mxy+bS7TD1EJMWXKoVk0H6
	 E+4yojt1M/2ZSnziomaEvQVRBwO/sQDnOyRzsGZibaorT8LRRJBzgkSgUU89WzK90nwdb
	 aJRPEJSCoawqQyI6f8DhuF9o2gccXU0JC+THFFSuHFn+/LKsHMENd+ir5O7GS93BFKTzM
	 OUAy456jBJIp4vtgPsPUFq7edZvlfzWWjU3bs6w8meGZLN7KNa2dAg1BGfgmsoDDlxIZf
	 8ewhqj7tWI+h5bCRlIYx2s3Emaa0a713DMMRY41rSgo9VPh5P2YFuBqXTSYtbJSz7fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Jrkmv8mW;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A967606A31D;
	Thu, 22 Oct 2026 20:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A967606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Jrkmv8mW
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MHuGsm1804470;
	Thu, 22 Oct 2026 13:22:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=eRied2sFAIlMg7fzehlSeofRbpvYYZgxmtcQb
	30eI2o=; b=Jrkmv8mWQMKaKC3yvFReVBk+piZYugD0YXmiOBNQ/GjLiC9dnOQjr
	DgPYZjs3pX8TQIi+ZrqwqYpOBxcsXAc7+lciB5zzujnlOsshtMnDpmHFnu2Zyb8P
	J51mdiwKMM2wUfw5ViCnC+KaP15GWg0FWvh5IIe/y07Y1PEI8SvB9QkCy3hrkd/F
	WfEyC6DZZT8FL9xBdAg8bNQYhiE1RA51Tjg4jWUz9pLEb2S5XzFue4S6zeTqRLhZ
	GkogNuQghiORayAV/K+dontqe8yVZc01CgvYqLdSJd4lEcwPCMrLlSHyNzl76Ggd
	wRVXA1Y4JGLoBZmEWQNqJufYAFIXkc2xg==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hf9mxwt6s-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 22 Oct 2026 13:22:21 -0700 (PDT)
Received: from localhost (2620:10d:c085:108::4) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Thu, 22 Oct
 2026 20:22:20 +0000
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>
To: Jens Axboe <axboe@kernel.dk>
CC: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@meta.com>,
        <io-uring@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 1/2] io_uring/net: Factor out receive buffer selection
Date: Thu, 22 Oct 2026 13:20:22 -0700
Message-ID: <20261022202106.2474515-2-cleger@meta.com>
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
X-Proofpoint-ORIG-GUID: NTNrcv8aTp-i4QzM_MX9Cgsuop9S_YO9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA4MCBTYWx0ZWRfX6v5L1uH5gwSt
 x71MLBSBwA0rRXQPn567PCgnK601DWz3menTB1+QeYlglBALjNmN2E+7XGFygawGnwQUELivLhh
 klBRSnwm0nnYrB8r9PnlilLZexH0Hp0=
X-Proofpoint-GUID: NTNrcv8aTp-i4QzM_MX9Cgsuop9S_YO9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA4MCBTYWx0ZWRfX3fPj8nGb9544
 luh/fXfV/K/uhj9eQoeF1zBvn+mWYDLsnRkN52xpRkFcfM3Raq3aOeClN6bS+lZqVsF3LyQkTQF
 YpTYjnZ9apcScdoUt18rWsPKXu6G0Y8IloxtRlSqgW38RZD9F3yTmoenpPudwCACUSNM0D+kaKp
 XTNtSR4yrThZtjSejxpb1dPkhbuwf64DGHCBAiDEbnL6DhOUxBvwAJLJGuSMfNlvQ4L3rtkGVJq
 aJ8ZPuTOvw7C1Vw8NcecY2cvknOQizSI3Ej908DEWLQImYp/PtK/sdnDDhmK0XvT2RgJQ+q8lbU
 vHQvcNB9L6/u9d9Wl5uk8DfHcEKOuZMOLKkygv8gPsMRq6DwkT7VKcjGCDnkPaZhyal7dYKGcmJ
 1YB7MDQsnJC/meCnCddxf5KBwbQNw61ZRppkPXCC1ELUwR1yXKyteaoVc4EI5Fq1Y+3lgxkVlwl
 vFWN5POPVYyCbdYuoyg==
X-Authority-Analysis: v=2.4 cv=TakDJhQh c=1 sm=1 tr=0 ts=6ada707d cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=tpM8CJlwf7uhpglF1g9U:22
 a=VabnemYjAAAA:8 a=LkjGDa2GHWcZH3lhxhkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01

In preparation of bundle support for recvmsg, split out the provided
buffer ring peek into io_recv_bundle_peek() and the existing recvmsg
buffer setup into io_recvmsg_buf_select(). No functional change
intended.

Signed-off-by: Clément Léger <cleger@meta.com>
---
 io_uring/net.c | 108 ++++++++++++++++++++++++++++++++-----------------
 1 file changed, 71 insertions(+), 37 deletions(-)

diff --git a/io_uring/net.c b/io_uring/net.c
index f5f4f3ce6ef3..1606824971ec 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -1018,6 +1018,67 @@ static int io_recvmsg_multishot(struct socket *sock, struct io_sr_msg *io,
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
@@ -1047,19 +1108,10 @@ int io_recvmsg(struct io_kiocb *req, unsigned int issue_flags)
 	sel.buf_list = NULL;
 	len = sr->len;
 	if (io_do_buffer_select(req)) {
-		sel = io_buffer_select(req, &len, sr->buf_group, issue_flags);
-		if (!sel.addr)
-			return -ENOBUFS;
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
@@ -1130,39 +1182,21 @@ static int io_recv_buf_select(struct io_kiocb *req, struct io_async_msghdr *kmsg
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
-			arg.max_len = min_not_zero(sel->val, (ssize_t) kmsg->msg.msg_inq);
+			max_len = min_not_zero(sel->val, (ssize_t)kmsg->msg.msg_inq);
 
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
2.53.0-Meta

