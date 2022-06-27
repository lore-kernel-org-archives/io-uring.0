Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C7CC433EF
	for <io-uring@archiver.kernel.org>; Mon, 27 Jun 2022 13:35:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234509AbiF0Nfx (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Mon, 27 Jun 2022 09:35:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234561AbiF0Nfw (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Mon, 27 Jun 2022 09:35:52 -0400
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AA336399
        for <io-uring@vger.kernel.org>; Mon, 27 Jun 2022 06:35:51 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1656336949;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=a+k4YAQdh2esk0VR5fdVX6pJQ3M/C2a94u6juktmwW4=;
        b=BDdjdO/9RaH29yQwHw5LC+zW/oK0WuZuemORTzudHQtpsdoEx3rW16z8ojpCvixwkgCHCF
        BliFkzVmTWa1b4Dqosofw6T4FlkF2QUsTZ9nQYx6ENWFJSGf3vCA30klJIaAMwI42wUsXk
        /LjUAQgXodtrT2omnnAsGjhbxGeJhPA=
From:   Hao Xu <hao.xu@linux.dev>
To:     io-uring@vger.kernel.org
Cc:     Jens Axboe <axboe@kernel.dk>,
        Pavel Begunkov <asml.silence@gmail.com>
Subject: [PATCH v5 00/11] fixed worker
Date:   Mon, 27 Jun 2022 21:35:30 +0800
Message-Id: <20220627133541.15223-1-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

From: Hao Xu <howeyxu@tencent.com>

This is the second version of fixed worker implementation.
Wrote a nop test program to test it, 3 fixed-workers VS 3 normal workers.
normal workers:
./run_nop_wqe.sh nop_wqe_normal 200000 100 3 1-3
        time spent: 17314274 usecs      IOPS: 1155116
        time spent: 17016942 usecs      IOPS: 1175299
        time spent: 17908684 usecs      IOPS: 1116776

fixed workers:
./run_nop_wqe.sh nop_wqe_fixed 200000 100 3 1-3
        time spent: 10464397 usecs      IOPS: 1911242
        time spent: 9610976 usecs       IOPS: 2080954
        time spent: 9807361 usecs       IOPS: 2039284

About 2x improvement. From perf result, almost no acct->lock contension.
Test program: https://github.com/HowHsu/liburing/tree/fixed_worker
liburing/test/nop_wqe.c

v3->v4:
 - make work in fixed worker's private worfixed worker
 - tweak the io_wqe_acct struct to make it clearer

v4->v5:
 - code clean
 - rebase against the for-5.20/io_uring


Hao Xu (11):
  io-wq: add a worker flag for individual exit
  io-wq: change argument of create_io_worker() for convienence
  io-wq: add infra data structure for fixed workers
  io-wq: tweak io_get_acct()
  io-wq: fixed worker initialization
  io-wq: fixed worker exit
  io-wq: implement fixed worker logic
  io-wq: batch the handling of fixed worker private works
  io_uring: add register fixed worker interface
  io-wq: add an work list for fixed worker
  io_uring: cancel works in exec work list for fixed worker

 include/uapi/linux/io_uring.h |  11 +
 io_uring/io-wq.c              | 495 ++++++++++++++++++++++++++++++----
 io_uring/io-wq.h              |   8 +
 io_uring/io_uring.c           |  71 +++++
 4 files changed, 537 insertions(+), 48 deletions(-)


base-commit: 094abe8fbccb0d79bef982c67eb7372e92452c0e
-- 
2.25.1

