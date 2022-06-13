Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D0DC43334
	for <io-uring@archiver.kernel.org>; Mon, 13 Jun 2022 10:12:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231868AbiFMKMQ (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Mon, 13 Jun 2022 06:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbiFMKMP (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Mon, 13 Jun 2022 06:12:15 -0400
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF110D4
        for <io-uring@vger.kernel.org>; Mon, 13 Jun 2022 03:12:11 -0700 (PDT)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25CMWFib005948
        for <io-uring@vger.kernel.org>; Mon, 13 Jun 2022 03:12:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=evt6BDUNCKiS5p0xMpEaS2ol5gixJRI78MJuU+RLgpU=;
 b=VYk+kxQc9BbmGchzBol+Rku8hhSjWMXrWk+HI9H73Yfmx+CB7s33lhE9TOxzzhdegD4p
 JQ2Da694uXLS56UmbEerGrW8lycJwQzr5m3X5zaH9nABUdCocSN5sEHKatDTb8XdvXSl
 jI3LMz6EI9ZMDf+5mGkuQTuR8HgdDbJmNaI= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gmq3kfmyk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <io-uring@vger.kernel.org>; Mon, 13 Jun 2022 03:12:11 -0700
Received: from twshared5131.09.ash9.facebook.com (2620:10d:c085:108::8) by
 mail.thefacebook.com (2620:10d:c085:11d::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 13 Jun 2022 03:12:10 -0700
Received: by devbig038.lla2.facebook.com (Postfix, from userid 572232)
        id 2F3311992AE3; Mon, 13 Jun 2022 03:12:04 -0700 (PDT)
From:   Dylan Yudaken <dylany@fb.com>
To:     <axboe@kernel.dk>, <asml.silence@gmail.com>,
        <io-uring@vger.kernel.org>
CC:     <Kernel-team@fb.com>, Dylan Yudaken <dylany@fb.com>
Subject: [PATCH 3/3] io_uring: limit size of provided buffer ring
Date:   Mon, 13 Jun 2022 03:11:57 -0700
Message-ID: <20220613101157.3687-4-dylany@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220613101157.3687-1-dylany@fb.com>
References: <20220613101157.3687-1-dylany@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: PeISm6RUPqARufjAzQHP9aQg4xxxn9bb
X-Proofpoint-ORIG-GUID: PeISm6RUPqARufjAzQHP9aQg4xxxn9bb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-13_03,2022-06-13_01,2022-02-23_01
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

The type of head and tail do not allow more than 2^15 entries in a
provided buffer ring, so do not allow this.
At 2^16 while each entry can be indexed, there is no way to
disambiguate full vs empty.

Signed-off-by: Dylan Yudaken <dylany@fb.com>
---
 fs/io_uring.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index 6eea18e8330c..85b116ddfd2a 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -13002,6 +13002,10 @@ static int io_register_pbuf_ring(struct io_ring_=
ctx *ctx, void __user *arg)
 	if (!is_power_of_2(reg.ring_entries))
 		return -EINVAL;
=20
+	/* cannot disambiguate full vs empty due to head/tail size */
+	if (reg.ring_entries >=3D 65536)
+		return -EINVAL;
+
 	if (unlikely(reg.bgid < BGID_ARRAY && !ctx->io_bl)) {
 		int ret =3D io_init_bl_list(ctx);
 		if (ret)
--=20
2.30.2

