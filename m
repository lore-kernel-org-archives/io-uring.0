Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D418C3F6B0
	for <io-uring@archiver.kernel.org>; Mon, 15 Aug 2022 13:27:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231773AbiHON1X (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Mon, 15 Aug 2022 09:27:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241432AbiHON1N (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Mon, 15 Aug 2022 09:27:13 -0400
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E7351F2E5
        for <io-uring@vger.kernel.org>; Mon, 15 Aug 2022 06:27:12 -0700 (PDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27FBP3sa009850
        for <io-uring@vger.kernel.org>; Mon, 15 Aug 2022 06:27:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=n9aYHKG0/2vtdVEZMM8BPKXtI8isVI9dEvQ2rPvmlHk=;
 b=HOc56Aq1co0McM63gOU0MCL7E1IMi2iwY5FEzB3KqVIMbKtmeYICUj6FcxPp16VCT7O8
 aoiDA+uK2mMN3nlqlytQKKj/5g2PzB0zzwMA18bvvSolfMMaXuYibYoGltIuCSbu3ufr
 m/ifwAVycsZi7B50n1M5s2NZETSVvYaEKKk= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3hyn83rj2b-3
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <io-uring@vger.kernel.org>; Mon, 15 Aug 2022 06:27:11 -0700
Received: from twshared7556.02.ash8.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 15 Aug 2022 06:27:10 -0700
Received: by devbig038.lla2.facebook.com (Postfix, from userid 572232)
        id 59E0649B730A; Mon, 15 Aug 2022 06:09:55 -0700 (PDT)
From:   Dylan Yudaken <dylany@fb.com>
To:     Jens Axboe <axboe@kernel.dk>,
        Pavel Begunkov <asml.silence@gmail.com>,
        <io-uring@vger.kernel.org>
CC:     <Kernel-team@fb.com>, Dylan Yudaken <dylany@fb.com>
Subject: [PATCH liburing 08/11] add docs for overflow lost errors
Date:   Mon, 15 Aug 2022 06:09:44 -0700
Message-ID: <20220815130947.1002152-9-dylany@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220815130947.1002152-1-dylany@fb.com>
References: <20220815130947.1002152-1-dylany@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 1hTevEsqKFV-6N0TAZBQWSEbUoxEPv0t
X-Proofpoint-GUID: 1hTevEsqKFV-6N0TAZBQWSEbUoxEPv0t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-15_08,2022-08-15_01,2022-06-22_01
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

Add man docs for return values indicating a CQE was lost.

Signed-off-by: Dylan Yudaken <dylany@fb.com>
---
 man/io_uring_enter.2 | 11 +++++++++++
 man/io_uring_setup.2 | 11 +++++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/man/io_uring_enter.2 b/man/io_uring_enter.2
index 9ad6349b2c4a..688e57984f00 100644
--- a/man/io_uring_enter.2
+++ b/man/io_uring_enter.2
@@ -1326,6 +1326,17 @@ is a valid file descriptor, but the io_uring ring =
is not in the right state
 .BR io_uring_register (2)
 for details on how to enable the ring.
 .TP
+.B EBADR
+At least one CQE was dropped even with the
+.B IORING_FEAT_NODROP
+feature, and there are no otherwise available CQEs. This clears the erro=
r state
+and so with no other changes the next call to
+.BR io_uring_setup (2)
+will not have this error. This error should be extremely rare and indica=
tes the
+machine is running critically low on memory and. It may be reasonable fo=
r the
+application to terminate running unless it is able to safely handle any =
CQE
+being lost.
+.TP
 .B EBUSY
 If the
 .B IORING_FEAT_NODROP
diff --git a/man/io_uring_setup.2 b/man/io_uring_setup.2
index 0f57d8f06a35..9a543d68dd02 100644
--- a/man/io_uring_setup.2
+++ b/man/io_uring_setup.2
@@ -279,7 +279,7 @@ call. The SQEs must still be allocated separately. Th=
is brings the necessary
 calls down from three to two. Available since kernel 5.4.
 .TP
 .B IORING_FEAT_NODROP
-If this flag is set, io_uring supports never dropping completion events.
+If this flag is set, io_uring supports almost never dropping completion =
events.
 If a completion event occurs and the CQ ring is full, the kernel stores
 the event internally until such a time that the CQ ring has room for mor=
e
 entries. If this overflow condition is entered, attempting to submit mor=
e
@@ -287,7 +287,14 @@ IO will fail with the
 .B -EBUSY
 error value, if it can't flush the overflown events to the CQ ring. If t=
his
 happens, the application must reap events from the CQ ring and attempt t=
he
-submit again. Available since kernel 5.5.
+submit again. If the kernel has no free memory to store the event intern=
ally
+it will be visible by an increase in the overflow value on the cqring.
+Available since kernel 5.5. Additionally
+.BR io_uring_enter (2)
+will return
+.B -EBADR
+the next time it would otherwise sleep waiting for completions (since ke=
rnel 5.19).
+
 .TP
 .B IORING_FEAT_SUBMIT_STABLE
 If this flag is set, applications can be certain that any data for
--=20
2.30.2

