Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E35BCC433F5
	for <io-uring@archiver.kernel.org>; Fri, 27 May 2022 04:08:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232090AbiE0EI6 (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Fri, 27 May 2022 00:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbiE0EI5 (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Fri, 27 May 2022 00:08:57 -0400
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7B0D38BF2
        for <io-uring@vger.kernel.org>; Thu, 26 May 2022 21:08:55 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R681e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04357;MF=xiaoguang.wang@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0VEVdu-k_1653624532;
Received: from 30.225.28.153(mailfrom:xiaoguang.wang@linux.alibaba.com fp:SMTPD_---0VEVdu-k_1653624532)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 27 May 2022 12:08:53 +0800
Message-ID: <1ee30b85-4f8d-c3dc-a9ef-d7cf6900d053@linux.alibaba.com>
Date:   Fri, 27 May 2022 12:08:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH] io_uring: ensure fput() called correspondingly when
 direct install fails
Content-Language: en-US
To:     Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org
Cc:     asml.silence@gmail.com
References: <20220527025400.51048-1-xiaoguang.wang@linux.alibaba.com>
 <b64a8869-b1f3-f1f7-bc04-64e3be626cd2@kernel.dk>
From:   Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
In-Reply-To: <b64a8869-b1f3-f1f7-bc04-64e3be626cd2@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

hi,

> On 5/26/22 8:54 PM, Xiaoguang Wang wrote:
>> io_fixed_fd_install() may fail for short of free fixed file bitmap,
>> in this case, need to call fput() correspondingly.
> Good catch - but it's a bit confusing how we handle this case
> internally, and the other error case relies on that function doing the
> fput (which it does).
>
> Any chance we can get that cleaned up at the same time? Would make
> errors in this error less likely in the future.
OK, sure, will try to prepare a better one.

Regards,
Xiaoguang Wang
>

