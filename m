Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46722C433EF
	for <io-uring@archiver.kernel.org>; Thu, 23 Jun 2022 07:18:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbiFWHST (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Thu, 23 Jun 2022 03:18:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbiFWHST (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Thu, 23 Jun 2022 03:18:19 -0400
Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 871E745503
        for <io-uring@vger.kernel.org>; Thu, 23 Jun 2022 00:18:18 -0700 (PDT)
Message-ID: <bdf9a053-1614-7d89-6885-13e21a343c34@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1655968697;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eIYviu9kQ7K7UhCLBDSdzD2Logx32PYMzlWcCUHWa74=;
        b=kFRrCFMDtM3MwkIHlKLTe+Dc7FrGpnKMpBL9RGBdciQ0AMY+6l+D3QkNT6QMV5MAvBlAV/
        l/JSJLmKgPRUgKi/3CaBZUmnAqASHRLuKlcUCbqw3ha5E+UuuxrO7pfEqR+WxhxlGSH2Cv
        9tkGpbbYEHW6YUWQnRRxbGgZmb1gYb4=
Date:   Thu, 23 Jun 2022 15:18:13 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] io_uring: kbuf: kill __io_kbuf_recycle()
Content-Language: en-US
To:     Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org
Cc:     Pavel Begunkov <asml.silence@gmail.com>
References: <20220622055551.642370-1-hao.xu@linux.dev>
 <40f6127c-3211-5152-f767-3c63174349a5@kernel.dk>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Hao Xu <hao.xu@linux.dev>
In-Reply-To: <40f6127c-3211-5152-f767-3c63174349a5@kernel.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

On 6/23/22 01:48, Jens Axboe wrote:
> On 6/21/22 11:55 PM, Hao Xu wrote:
>> From: Hao Xu <howeyxu@tencent.com>
>>
>> __io_kbuf_recycle() is only called in io_kbuf_recycle(). Kill it and
>> tweak the code so that the legacy pbuf and ring pbuf code become clear
> 
> I have applied this one as I think it makes sense separately, but I'd
> really like to see the ring provided buffer recycling done inline as
> that is fast path for provided buffers (and it's very few instructions).
> Care to do a patch on top for that?
> 

No problem.
