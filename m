Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C0CFC43334
	for <io-uring@archiver.kernel.org>; Mon, 13 Jun 2022 03:46:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbiFMDqF (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Sun, 12 Jun 2022 23:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232385AbiFMDqE (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Sun, 12 Jun 2022 23:46:04 -0400
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 024222E6B3
        for <io-uring@vger.kernel.org>; Sun, 12 Jun 2022 20:46:02 -0700 (PDT)
Message-ID: <570ea01b-fa33-d5ec-3311-6c862b9d6ab3@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1655091961;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4lO8TGLa/W6D5OEfzgoLFKD7Aa6HHCABmnKYhAeHcGU=;
        b=fpMEvOe9S8n4gEH846LcFGYJ6tWwAn2o7csFLYQdtbZ7mN4sL3e+WAzUAxyQYPfF3Ah/Cs
        tvlr0SS4j3bagzH/HwkYkLJiqpO16MQ0hOCOQPvQ0n/Vde0RzHSmthJzuCyBmB3HH+NCdX
        B6peeLxDg5YPzXHzAx+pt7QjN3lGkz0=
Date:   Mon, 13 Jun 2022 11:45:52 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 5.19 2/6] io_uring: openclose: fix bug of closing wrong
 fixed file
Content-Language: en-US
To:     Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org
Cc:     Jens Axboe <axboe@kernel.dk>
References: <20220611122224.941800-1-hao.xu@linux.dev>
 <20220611122224.941800-2-hao.xu@linux.dev>
 <4808da68-0835-07ef-4b59-7fa0c09684ce@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Hao Xu <hao.xu@linux.dev>
In-Reply-To: <4808da68-0835-07ef-4b59-7fa0c09684ce@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

On 6/13/22 01:47, Pavel Begunkov wrote:
> On 6/11/22 13:22, Hao Xu wrote:
>> From: Hao Xu <howeyxu@tencent.com>
>>
>> Don't update ret until fixed file is closed, otherwise the file slot
>> becomes the error code.
> 
> I rebased and queued this and 6/6, will send them out together
> later, thanks
> 
> https://github.com/isilence/linux/tree/io_uring/io_uring-5.19
> 

Thanks for rebasing it, was busy with something yesterday.

Thanks,
Hao

