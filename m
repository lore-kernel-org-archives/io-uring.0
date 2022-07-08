Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A43C433EF
	for <io-uring@archiver.kernel.org>; Fri,  8 Jul 2022 18:18:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239139AbiGHSS4 (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Fri, 8 Jul 2022 14:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239141AbiGHSSv (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Fri, 8 Jul 2022 14:18:51 -0400
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 526CD7D1EB
        for <io-uring@vger.kernel.org>; Fri,  8 Jul 2022 11:18:50 -0700 (PDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 268HAXkB027064
        for <io-uring@vger.kernel.org>; Fri, 8 Jul 2022 11:18:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=xO0ni6AN504NEFekeHKz9B4lNNoPkx+1kDAAP6+X1sM=;
 b=czkolZrrrPPOUz434xuhj98CRqV8y8LANFGbD6ftYsCJqXDeL62ItgXnl4picyyVYSXB
 rkJhRlihSHBLdCAvP8iwu+LiFvEBMqvxeWPIIm3a/gS/jpo62LqfAlhhvCUGAVEc8cwI
 t3CLcOZNDNDR/4vSf2zYBhtEVDBP/yrbDY0= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3h6eg1ky59-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <io-uring@vger.kernel.org>; Fri, 08 Jul 2022 11:18:49 -0700
Received: from twshared18317.08.ash9.facebook.com (2620:10d:c085:208::11) by
 mail.thefacebook.com (2620:10d:c085:21d::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 8 Jul 2022 11:18:47 -0700
Received: by devbig038.lla2.facebook.com (Postfix, from userid 572232)
        id 7618E2B9EC2E; Fri,  8 Jul 2022 11:18:42 -0700 (PDT)
From:   Dylan Yudaken <dylany@fb.com>
To:     Jens Axboe <axboe@kernel.dk>,
        Pavel Begunkov <asml.silence@gmail.com>,
        <io-uring@vger.kernel.org>
CC:     <Kernel-team@fb.com>, Dylan Yudaken <dylany@fb.com>
Subject: [PATCH for-next 3/4] io-uring: add recycle_async to ops
Date:   Fri, 8 Jul 2022 11:18:37 -0700
Message-ID: <20220708181838.1495428-4-dylany@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220708181838.1495428-1-dylany@fb.com>
References: <20220708181838.1495428-1-dylany@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 7KOO3AoVSW26BWY_QUpuMIfGripjxapp
X-Proofpoint-GUID: 7KOO3AoVSW26BWY_QUpuMIfGripjxapp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-08_14,2022-07-08_01,2022-06-22_01
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

Some ops recycle or cache async data when they are done.
Build this into the framework for async data so that we can rely on
io_uring to know when a request is done (rather than doing it inline in a
handler).

Signed-off-by: Dylan Yudaken <dylany@fb.com>
---
 io_uring/io_uring.c | 8 ++++++--
 io_uring/opdef.h    | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 32110c5b4059..3e9fdaf9c72c 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -1578,8 +1578,12 @@ static void io_clean_op(struct io_kiocb *req)
 	if (req->flags & REQ_F_CREDS)
 		put_cred(req->creds);
 	if (req->flags & REQ_F_ASYNC_DATA) {
-		kfree(req->async_data);
-		req->async_data =3D NULL;
+		const struct io_op_def *def =3D &io_op_defs[req->opcode];
+
+		if (!(def->recycle_async && def->recycle_async(req))) {
+			kfree(req->async_data);
+			req->async_data =3D NULL;
+		}
 	}
 	req->flags &=3D ~IO_REQ_CLEAN_FLAGS;
 }
diff --git a/io_uring/opdef.h b/io_uring/opdef.h
index ece8ed4f96c4..3de64731fc5f 100644
--- a/io_uring/opdef.h
+++ b/io_uring/opdef.h
@@ -34,6 +34,7 @@ struct io_op_def {
 	int (*issue)(struct io_kiocb *, unsigned int);
 	int (*prep_async)(struct io_kiocb *);
 	void (*cleanup)(struct io_kiocb *);
+	bool (*recycle_async)(struct io_kiocb *);
 };
=20
 extern const struct io_op_def io_op_defs[];
--=20
2.30.2

