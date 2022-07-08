Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4239BC43334
	for <io-uring@archiver.kernel.org>; Fri,  8 Jul 2022 18:45:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239176AbiGHSpu (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Fri, 8 Jul 2022 14:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239624AbiGHSpt (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Fri, 8 Jul 2022 14:45:49 -0400
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D6E965D52
        for <io-uring@vger.kernel.org>; Fri,  8 Jul 2022 11:45:49 -0700 (PDT)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 268HAXkO002033
        for <io-uring@vger.kernel.org>; Fri, 8 Jul 2022 11:45:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=facebook; bh=D/T8CS+xZx777REBbJTCPwR6aI+CKV7CanuSdvVYLl0=;
 b=LUNelZolA8AX7cA1Lr8F3aTE913KG/XGh85AdC7mawCGLUTwMLoTEmI7llrwjgMO7c/9
 qbt3rSJfEeRVoDFQsZa2AHurADJ/jmRLQHAp0cnMkd5l0ZwqEA1KPwxiI21i6rV3C5R+
 ebg55UUMjJ/dESNv0abKRjgPc3afyjiwJ+c= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3h67d26d43-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <io-uring@vger.kernel.org>; Fri, 08 Jul 2022 11:45:48 -0700
Received: from twshared9535.08.ash8.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 8 Jul 2022 11:45:47 -0700
Received: by devbig038.lla2.facebook.com (Postfix, from userid 572232)
        id 94AF62BA20C3; Fri,  8 Jul 2022 11:45:40 -0700 (PDT)
From:   Dylan Yudaken <dylany@fb.com>
To:     <axboe@kernel.dk>, <asml.silence@gmail.com>
CC:     <io-uring@vger.kernel.org>, <Kernel-team@fb.com>,
        Dylan Yudaken <dylany@fb.com>
Subject: [PATCH RFC liburing 0/2] multishot recvmsg
Date:   Fri, 8 Jul 2022 11:45:36 -0700
Message-ID: <20220708184538.1632315-1-dylany@fb.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: 3hj8pQJneSqfWDXo54ybghyCJtBXVtT6
X-Proofpoint-ORIG-GUID: 3hj8pQJneSqfWDXo54ybghyCJtBXVtT6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-08_15,2022-07-08_01,2022-06-22_01
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

This series adds an API (patch 1) and a test (#2) for multishot recvmsg.

I have not included docs yet, but I want to get feedback on the API for h=
andling
the result (if there is any).

Dylan Yudaken (2):
  add multishot recvmsg API
  add tests for multishot recvmsg

 src/include/liburing.h          |  59 ++++++++++++++
 src/include/liburing/io_uring.h |   7 ++
 test/recv-multishot.c           | 137 ++++++++++++++++++++++++++++----
 3 files changed, 189 insertions(+), 14 deletions(-)


base-commit: 5d0e33f50a06db768b1891972daab40732400778
--=20
2.30.2

