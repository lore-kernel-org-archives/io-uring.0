Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445E0C43334
	for <io-uring@archiver.kernel.org>; Fri, 17 Jun 2022 14:34:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343838AbiFQOeJ (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Fri, 17 Jun 2022 10:34:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231490AbiFQOeI (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Fri, 17 Jun 2022 10:34:08 -0400
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 225C34755C
        for <io-uring@vger.kernel.org>; Fri, 17 Jun 2022 07:34:07 -0700 (PDT)
Message-ID: <ea7b244e-4c11-102b-51a8-aae061a8c227@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1655476445;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=U3RbdW9cUGm4nmk45lSPvzmxwa0i409XiR1CqifqM80=;
        b=UZrh74Cd6vu5/nQrjAzAtvDanF6kajOyCmwRbIuCmImduP+9IRI1js78GeTJIjPTZ5DJEg
        o+Pxiai9oTgN8K/Q3rJlZC3pEJznlk3ELPXwlCqEWQEaw93UYlKG+oweecGBSNomEUbpV5
        jMiTofNlP7WgVXO+B0X2kToVrApVjMo=
Date:   Fri, 17 Jun 2022 22:34:00 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] io_uring: net: fix bug of completing multishot accept
 twice
Content-Language: en-US
To:     Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org
Cc:     Pavel Begunkov <asml.silence@gmail.com>
References: <20220617141201.170314-1-hao.xu@linux.dev>
 <6704dc2f-87dd-62d5-7f95-871b6db3a398@kernel.dk>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Hao Xu <hao.xu@linux.dev>
In-Reply-To: <6704dc2f-87dd-62d5-7f95-871b6db3a398@kernel.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

On 6/17/22 22:23, Jens Axboe wrote:
> On 6/17/22 8:12 AM, Hao Xu wrote:
>> From: Hao Xu <howeyxu@tencent.com>
>>
>> Now that we use centralized completion in io_issue_sqe, we should skip
>> that for multishot accept requests since we complete them in the
>> specific op function.
>>
>> Fixes: 34106529422e ("io_uring: never defer-complete multi-apoll")
>> Signed-off-by: Hao Xu <howeyxu@tencent.com>
>> ---
>>
>> I retrieved the history:
>>
>> in 4e86a2c98013 ("io_uring: implement multishot mode for accept")
>> we add the multishot accept, it repeatly completes cqe in io_accept()
>> until get -EAGAIN [1], then it returns 0 to io_issue_sqe().
>> io_issue_sqe() does nothing to it then.
>>
>> in 09eaa49e078c ("io_uring: handle completions in the core")
>> we add __io_req_complete() for IOU_OK in io_issue_sqe(). This causes at
>> [1], we do call __io_req_complete().But since IO_URING_F_COMPLETE_DEFER
>> is set, it does nothing.
>>
>> in 34106529422e ("io_uring: never defer-complete multi-apoll")
>> we remove IO_URING_F_COMPLETE_DEFER, but unluckily the multishot accept
>> test is broken, we didn't find the error.
>>
>> So it just has infuence to for-5.20, I'll update the liburing test
>> today.
> 
> Do you mind if I fold this into:
> 
> 09eaa49e078c ("io_uring: handle completions in the core")
> 
> as I'm continually rebasing the 5.20 branch until 5.19 is fully sorted?
> 

Please do, that is better.

