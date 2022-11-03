Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31DDC4332F
	for <io-uring@archiver.kernel.org>; Thu,  3 Nov 2022 20:40:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbiKCUkI (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Thu, 3 Nov 2022 16:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231161AbiKCUkH (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Thu, 3 Nov 2022 16:40:07 -0400
Received: from 66-220-144-178.mail-mxout.facebook.com (66-220-144-178.mail-mxout.facebook.com [66.220.144.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A6B420BC0
        for <io-uring@vger.kernel.org>; Thu,  3 Nov 2022 13:40:05 -0700 (PDT)
Received: by dev0134.prn3.facebook.com (Postfix, from userid 425415)
        id 4C267C4F609; Thu,  3 Nov 2022 13:39:54 -0700 (PDT)
From:   Stefan Roesch <shr@devkernel.io>
To:     kernel-team@fb.com
Cc:     shr@devkernel.io, axboe@kernel.dk, olivier@trillion01.com,
        netdev@vger.kernel.org, io-uring@vger.kernel.org, kuba@kernel.org
Subject: [RFC PATCH v1 0/2] io_uring: add napi busy polling support
Date:   Thu,  3 Nov 2022 13:39:37 -0700
Message-Id: <20221103203939.667307-1-shr@devkernel.io>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

This adds the napi busy polling support in io_uring.c. It adds a new
napi_list to the io_ring_ctx structure. This list contains the list of
napi_id's that are currently enabled for busy polling. This list is
used to determine which napi id's enabled busy polling.

To set the new napi busy poll timeout, a new io-uring api has been
added. It sets the napi busy poll timeout for the corresponding ring.

There is also a corresponding liburing patch series, which enables this
feature. The name of the series is "liburing: add add api for napi busy
poll timeout". It also contains two programs to test the this.

Testing has shown that the round-trip times are reduced to 38us from
55us by enabling napi busy polling with a busy poll timeout of 100us.

Signed-off-by: Stefan Roesch <shr@devkernel.io>

Stefan Roesch (2):
  io_uring: add napi busy polling support
  io_uring: add api to set napi busy poll timeout.

 include/linux/io_uring_types.h |   6 +
 include/uapi/linux/io_uring.h  |   4 +
 io_uring/io_uring.c            | 255 +++++++++++++++++++++++++++++++++
 io_uring/napi.h                |  22 +++
 io_uring/poll.c                |   3 +
 io_uring/sqpoll.c              |   9 ++
 6 files changed, 299 insertions(+)
 create mode 100644 io_uring/napi.h


base-commit: 8f71a2b3f435f29b787537d1abedaa7d8ebe6647
--=20
2.30.2

