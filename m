Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D2EC433EF
	for <io-uring@archiver.kernel.org>; Thu, 21 Jul 2022 14:42:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiGUOm4 (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Thu, 21 Jul 2022 10:42:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbiGUOmz (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Thu, 21 Jul 2022 10:42:55 -0400
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 515DC83F3F
        for <io-uring@vger.kernel.org>; Thu, 21 Jul 2022 07:42:55 -0700 (PDT)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26L3weDV007158
        for <io-uring@vger.kernel.org>; Thu, 21 Jul 2022 07:42:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=facebook; bh=BmXud6ehcByx0R2//fPpMpBuNl6A0a/XV4zS+I6dcmg=;
 b=QJG/kSt5PIeRRekB09Z5m2Tn2ZntMV1fSrv5xk+u3wVr2uc3hPbOtYmgEUjmq7QJ3xE7
 YvQi5xlhTOpdkQIQn9tIlNCPJkzJzNPPICwivZI/TmGHfWsG+RFhI68W9LaEyaJVORAV
 Zg/uu9tdh9sONPSkDYb4wXC18Xg7Nss73VI= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3heyc8ttcv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <io-uring@vger.kernel.org>; Thu, 21 Jul 2022 07:42:54 -0700
Received: from snc-exhub201.TheFacebook.com (2620:10d:c085:21d::7) by
 snc-exhub103.TheFacebook.com (2620:10d:c085:11d::7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 21 Jul 2022 07:42:54 -0700
Received: from twshared33626.07.ash9.facebook.com (2620:10d:c085:208::f) by
 mail.thefacebook.com (2620:10d:c085:21d::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 21 Jul 2022 07:42:54 -0700
Received: by devbig038.lla2.facebook.com (Postfix, from userid 572232)
        id 601C93593BA1; Thu, 21 Jul 2022 07:42:49 -0700 (PDT)
From:   Dylan Yudaken <dylany@fb.com>
To:     <axboe@kernel.dk>, <asml.silence@gmail.com>
CC:     <io-uring@vger.kernel.org>, <Kernel-team@fb.com>,
        Dylan Yudaken <dylany@fb.com>
Subject: [PATCH liburing 0/4] tests updates
Date:   Thu, 21 Jul 2022 07:42:25 -0700
Message-ID: <20220721144229.1224141-1-dylany@fb.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: 4jg26bXAkOrbAEGfKilwFIR6fV-xqmj4
X-Proofpoint-ORIG-GUID: 4jg26bXAkOrbAEGfKilwFIR6fV-xqmj4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_18,2022-07-20_01,2022-06-22_01
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

This series adds a patch for a panic in 5.19-rc7 simplified from the
syzkaller reproducer
It also causes the poll-mshot-overflow test to be skipped in versions < 5=
.20

Patch
  1: is the panic regression test
2-4: skips the poll-mshot-overflow test on old kernels

Dylan Yudaken (4):
  add a test for bad buf_ring register
  Copy IORING_SETUP_SINGLE_ISSUER into io_uring.h
  test: poll-mshot-overflow use proper return codes
  skip poll-mshot-overflow on old kernels

 src/include/liburing/io_uring.h |  4 ++++
 test/buf-ring.c                 | 30 +++++++++++++++++++++++++++++
 test/poll-mshot-overflow.c      | 34 +++++++++++++++++----------------
 3 files changed, 52 insertions(+), 16 deletions(-)


base-commit: 4e6eec8bdea906fe5341c97aef96986d605004e9
--=20
2.30.2

