Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C85C43334
	for <io-uring@archiver.kernel.org>; Fri, 10 Jun 2022 09:10:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348387AbiFJJKh (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Fri, 10 Jun 2022 05:10:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348523AbiFJJJ7 (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Fri, 10 Jun 2022 05:09:59 -0400
Received: from out1.migadu.com (out1.migadu.com [IPv6:2001:41d0:2:863f::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B996289A13
        for <io-uring@vger.kernel.org>; Fri, 10 Jun 2022 02:07:45 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1654852063;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=7lHdYGnDSiKwZaz/PMPyOfzUHo+/04M+jHsg/mtr8Po=;
        b=d+1D3Gu+i2JHOqfF62FpON9bD2j90MeLKIFaPXjR2pgtuuF2wTN2ZD4MvCXpcJ/El0t4vg
        MfU57tnss7unO0YduM4EbbBuL2+kLerp0NNHMHvNR8JZGyQfDk9AVgOiDQ8F/JgkAXXDdk
        5X1bIg2Yy9AVY2UN5EOuoSHOkv8WduY=
From:   Hao Xu <hao.xu@linux.dev>
To:     io-uring@vger.kernel.org
Cc:     Jens Axboe <axboe@kernel.dk>,
        Pavel Begunkov <asml.silence@gmail.com>
Subject: [PATCH 0/5] misc update for openclose and provided buffer
Date:   Fri, 10 Jun 2022 17:07:29 +0800
Message-Id: <20220610090734.857067-1-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

From: Hao Xu <howeyxu@tencent.com>

Patch 1 and 2 are bug fixes for openclose
Patch 3 is to support better close logic
Patch 4 is code clean
Patch 5 is a bug fix for ring-mapped provided buffer

Hao Xu (5):
  io_uring: openclose: fix bug of closing wrong fixed file
  io_uring: openclose: fix bug of unexpected return value in
    IORING_CLOSE_FD_AND_FILE_SLOT mode
  io_uring: openclose: support separate return value for
    IORING_CLOSE_FD_AND_FILE_SLOT
  io_uring: remove duplicate kbuf release
  io_uring: kbuf: consume ring buffer in partial io case

 io_uring/io_uring.c  |  6 ------
 io_uring/kbuf.c      |  9 +++++++--
 io_uring/kbuf.h      | 10 ++++++++--
 io_uring/openclose.c | 10 +++++++---
 io_uring/rsrc.c      |  2 +-
 5 files changed, 23 insertions(+), 14 deletions(-)

-- 
2.25.1

