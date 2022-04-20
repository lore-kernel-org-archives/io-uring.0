Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A0CC433EF
	for <io-uring@archiver.kernel.org>; Wed, 20 Apr 2022 19:15:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347102AbiDTTRy (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Wed, 20 Apr 2022 15:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347774AbiDTTRw (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Wed, 20 Apr 2022 15:17:52 -0400
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED5325EF
        for <io-uring@vger.kernel.org>; Wed, 20 Apr 2022 12:15:02 -0700 (PDT)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
        by m0089730.ppops.net (8.16.1.2/8.16.1.2) with ESMTP id 23KILVpg020661
        for <io-uring@vger.kernel.org>; Wed, 20 Apr 2022 12:15:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=apGns2hv2Kojna43sNpICvdsJ0mw7txl6GqDyuzbyqg=;
 b=nta286uuCUaJPFGBxCp6HnXgmRiR0IHK/76aiK2+lq6MqbRERxkJMMtGHStfhixOjUdh
 lgPwJD6K/ghD2AA3J3UIJa0f3GLRRYQFeZem7nFuQR/N6RfGuwHvgPxrFVJF1nJc4Ing
 p/pPwiRsOncuCjuEoQI0Se5jfzZETBLu14A= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by m0089730.ppops.net (PPS) with ESMTPS id 3fhn4j4ekj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <io-uring@vger.kernel.org>; Wed, 20 Apr 2022 12:15:02 -0700
Received: from twshared8508.05.ash9.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:82::c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 20 Apr 2022 12:15:01 -0700
Received: by devvm225.atn0.facebook.com (Postfix, from userid 425415)
        id 8C8DADE0C408; Wed, 20 Apr 2022 12:14:53 -0700 (PDT)
From:   Stefan Roesch <shr@fb.com>
To:     <io-uring@vger.kernel.org>, <kernel-team@fb.com>
CC:     <shr@fb.com>, Jens Axboe <axboe@kernel.dk>
Subject: [PATCH v2 02/12] io_uring: wire up inline completion path for CQE32
Date:   Wed, 20 Apr 2022 12:14:41 -0700
Message-ID: <20220420191451.2904439-3-shr@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220420191451.2904439-1-shr@fb.com>
References: <20220420191451.2904439-1-shr@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: -wokqMQt0M7srXgvdbhnWBRMxDAotaKQ
X-Proofpoint-ORIG-GUID: -wokqMQt0M7srXgvdbhnWBRMxDAotaKQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-20_05,2022-04-20_01,2022-02-23_01
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

Rather than always use the slower locked path, wire up use of the
deferred completion path that normal CQEs can take. This reuses the
hash list node for the storage we need to hold the two 64-bit values
that must be passed back.

Co-developed-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Stefan Roesch <shr@fb.com>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 fs/io_uring.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index 4c32cf987ef3..bf2b02518332 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -964,7 +964,13 @@ struct io_kiocb {
 	atomic_t			poll_refs;
 	struct io_task_work		io_task_work;
 	/* for polled requests, i.e. IORING_OP_POLL_ADD and async armed poll */
-	struct hlist_node		hash_node;
+	union {
+		struct hlist_node	hash_node;
+		struct {
+			u64		extra1;
+			u64		extra2;
+		};
+	};
 	/* internal polling, see IORING_FEAT_FAST_POLL */
 	struct async_poll		*apoll;
 	/* opcode allocated if it needs to store data for async defer */
--=20
2.30.2

