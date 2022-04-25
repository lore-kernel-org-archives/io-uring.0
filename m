Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F8AC433EF
	for <io-uring@archiver.kernel.org>; Mon, 25 Apr 2022 15:08:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231377AbiDYPLF (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Mon, 25 Apr 2022 11:11:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231972AbiDYPLE (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Mon, 25 Apr 2022 11:11:04 -0400
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ADFA6830E
        for <io-uring@vger.kernel.org>; Mon, 25 Apr 2022 08:08:00 -0700 (PDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23PBagZh018428
        for <io-uring@vger.kernel.org>; Mon, 25 Apr 2022 08:08:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=facebook; bh=2iHyvPk8SyjOSutJtSjowLYaSo/BBVMgwAmZHhzWs+I=;
 b=GgmM99BYKSzVDQKiJhtXQZyCkBuHl95GbxBdSehalpW2hZn85sENZ0KBbNQwH7TuWIp1
 nOBLCLVzOM0IpaLRAixzWAiFYxpHnYUep1LbA06MaN2zoepK5BWUwFm6jRVmUu02zYZR
 hsVPE/Uj/q6jX6bSqvd6C2rvBH7GO9Mr9rE= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3fn1gdpx0w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <io-uring@vger.kernel.org>; Mon, 25 Apr 2022 08:07:59 -0700
Received: from twshared16483.05.ash9.facebook.com (2620:10d:c085:208::11) by
 mail.thefacebook.com (2620:10d:c085:11d::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 25 Apr 2022 08:07:59 -0700
Received: by devbig039.lla1.facebook.com (Postfix, from userid 572232)
        id 4E885811B413; Mon, 25 Apr 2022 08:07:50 -0700 (PDT)
From:   Dylan Yudaken <dylany@fb.com>
To:     <io-uring@vger.kernel.org>
CC:     <axboe@kernel.dk>, <asml.silence@gmail.com>, <Kernel-team@fb.com>,
        Dylan Yudaken <dylany@fb.com>
Subject: [PATCH v2 0/4] io_uring: text representation of opcode in trace
Date:   Mon, 25 Apr 2022 08:07:36 -0700
Message-ID: <20220425150740.2826784-1-dylany@fb.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 8xTfhaimR7rujtjZI7UXuPHB5uWw22pr
X-Proofpoint-GUID: 8xTfhaimR7rujtjZI7UXuPHB5uWw22pr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-25_08,2022-04-25_02,2022-02-23_01
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org


This series adds the text representation of opcodes into the trace. This
makes it much quicker to understand traces without having to translate
opcodes in your head.

Patch 1 adds a type to io_uring opcodes
Patch 2 is the translation function.
Patch 3 is a small cleanup
Patch 4 uses the translator in the trace logic

v2:
 - return "INVALID" rather than UNKNOWN/LAST
 - add a type to io_uring opcdodes to get the compiler to complain if any=
 are
   missing

Dylan Yudaken (4):
  io_uring: add type to op enum
  io_uring: add io_uring_get_opcode
  io_uring: rename op -> opcode
  io_uring: use the text representation of ops in trace

 fs/io_uring.c                   | 91 +++++++++++++++++++++++++++++++++
 include/linux/io_uring.h        |  5 ++
 include/trace/events/io_uring.h | 42 +++++++++------
 include/uapi/linux/io_uring.h   |  2 +-
 4 files changed, 122 insertions(+), 18 deletions(-)


base-commit: 155bc9505dbd6613585abbf0be6466f1c21536c4
--=20
2.30.2

