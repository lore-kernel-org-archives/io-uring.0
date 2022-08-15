Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7A6C3F6B0
	for <io-uring@archiver.kernel.org>; Mon, 15 Aug 2022 13:12:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242689AbiHONMW (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Mon, 15 Aug 2022 09:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242692AbiHONMS (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Mon, 15 Aug 2022 09:12:18 -0400
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96E1313F2B
        for <io-uring@vger.kernel.org>; Mon, 15 Aug 2022 06:12:17 -0700 (PDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27F4OxQv021272
        for <io-uring@vger.kernel.org>; Mon, 15 Aug 2022 06:12:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=1RSP9chFB0sQ+L7CDoNhL4AsBLPJqeWnYx+xzgYDArE=;
 b=RZwU31ZUNq8MkMo80kvP8l6iBDQ4Y1Vqfthwm/y0p0GIKJ+nOmBffRvyWNDh4UMbgdOh
 ws2umpP85uMqOTnKY+Loaf3AYEQ3eC0OgjqxhQOvxhSC5JXEH1SaLL5E7LICSIrxpA/C
 xC0KK0GAVrTa1KWULTKp51jwt5oKwvwvTkk= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3hxb93sgbd-4
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <io-uring@vger.kernel.org>; Mon, 15 Aug 2022 06:12:17 -0700
Received: from twshared25684.07.ash9.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 15 Aug 2022 06:12:14 -0700
Received: by devbig038.lla2.facebook.com (Postfix, from userid 572232)
        id E3F5849B6CA6; Mon, 15 Aug 2022 06:09:13 -0700 (PDT)
From:   Dylan Yudaken <dylany@fb.com>
To:     Jens Axboe <axboe@kernel.dk>,
        Pavel Begunkov <asml.silence@gmail.com>,
        <io-uring@vger.kernel.org>
CC:     <Kernel-team@fb.com>, Dylan Yudaken <dylany@fb.com>
Subject: [PATCH for-next 1/7] io_uring: use local ctx variable
Date:   Mon, 15 Aug 2022 06:09:05 -0700
Message-ID: <20220815130911.988014-2-dylany@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220815130911.988014-1-dylany@fb.com>
References: <20220815130911.988014-1-dylany@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: roZVT044DuFCTh1RSCWRHU--zZgGspjR
X-Proofpoint-ORIG-GUID: roZVT044DuFCTh1RSCWRHU--zZgGspjR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-15_08,2022-08-15_01,2022-06-22_01
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

small change to use the local ctx

Signed-off-by: Dylan Yudaken <dylany@fb.com>
---
 io_uring/io_uring.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index ebfdb2212ec2..ab3e3d9e9fcd 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -1072,8 +1072,8 @@ void io_req_task_work_add(struct io_kiocb *req)
 		req =3D container_of(node, struct io_kiocb, io_task_work.node);
 		node =3D node->next;
 		if (llist_add(&req->io_task_work.node,
-			      &req->ctx->fallback_llist))
-			schedule_delayed_work(&req->ctx->fallback_work, 1);
+			      &ctx->fallback_llist))
+			schedule_delayed_work(&ctx->fallback_work, 1);
 	}
 }
=20
--=20
2.30.2

