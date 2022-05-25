Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB7BC433F5
	for <io-uring@archiver.kernel.org>; Wed, 25 May 2022 12:08:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234048AbiEYMIS (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Wed, 25 May 2022 08:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230511AbiEYMIR (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Wed, 25 May 2022 08:08:17 -0400
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09DA213F01
        for <io-uring@vger.kernel.org>; Wed, 25 May 2022 05:08:15 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04357;MF=xiaoguang.wang@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0VENKOlQ_1653480493;
Received: from 30.225.28.160(mailfrom:xiaoguang.wang@linux.alibaba.com fp:SMTPD_---0VENKOlQ_1653480493)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 25 May 2022 20:08:13 +0800
Message-ID: <d8829873-4e68-1da0-f326-0af2dc40c3e1@linux.alibaba.com>
Date:   Wed, 25 May 2022 20:08:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Content-Language: en-US
To:     io-uring@vger.kernel.org
Cc:     Jens Axboe <axboe@kernel.dk>,
        Pavel Begunkov <asml.silence@gmail.com>
From:   Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
Subject: improve register file feature's usability
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

hello,

I raised this issue last year and have had some discussions with Pavel, but
didn't come to an agreement and didn't come up with better solution. You
can see my initial patch and discussions in below mail:
    https://lore.kernel.org/all/20211012084811.29714-1-xiaoguang.wang@linux.alibaba.com/T/

The most biggest issue with file registration feature is that it needs user
space apps to maintain free slot info about io_uring's fixed file table, which
really is a burden. Now I see io_uring starts to return file slot from kernel by
using IORING_FILE_INDEX_ALLOC flag in accept or open operations, but
they need app to uses direct accept or direct open, which is not convenient.
As far as I know, some apps are not prepared to use direct accept or open:
  1) App uses one io_uring instance to accept one connection, but later it will
route this new connection to another io_uring instance to complete read/write,
which achieves load balance. In this case, direct accept won't work. We still
need a valid fd, then another io_uring instance can register it again.
  2) After getting a new connection, if later apps wants to call fcntl(2) or
setsockopt or similar on it, we will need a true fd, not a flle slot in io_uring's
file table, unless we can make io_uring support all existing syscalls which use fd.

So we may still need to make io_uring file registration feature easier to use.
I'd like io_uring in kernel returns prepared file slot. For example, for
IORING_OP_FILES_UPDATE, we support user passes one fd and returns
found free slot in cqe->res, just like what IORING_FILE_INDEX_ALLOC does.

This is my current rough idea, any more thoughts? Thanks.


Regards,
Xiaoguang Wang
