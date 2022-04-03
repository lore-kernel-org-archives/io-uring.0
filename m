Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D48DC433F5
	for <io-uring@archiver.kernel.org>; Sun,  3 Apr 2022 20:43:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344780AbiDCUpp (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Sun, 3 Apr 2022 16:45:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiDCUpp (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Sun, 3 Apr 2022 16:45:45 -0400
Received: from dcvr.yhbt.net (dcvr.yhbt.net [64.71.152.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2349315A21
        for <io-uring@vger.kernel.org>; Sun,  3 Apr 2022 13:43:49 -0700 (PDT)
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id 638111F4CE;
        Sun,  3 Apr 2022 20:43:49 +0000 (UTC)
Date:   Sun, 3 Apr 2022 20:43:49 +0000
From:   Eric Wong <e@80x24.org>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     io-uring@vger.kernel.org, Stefan Metzmacher <metze@samba.org>,
        Liu Changcheng <changcheng.liu@aliyun.com>
Subject: Re: [PULL|PATCH v3 0/7] liburing debian packaging fixes
Message-ID: <20220403204349.M316769@dcvr>
References: <20211116224456.244746-1-e@80x24.org>
 <20220121182635.1147333-1-e@80x24.org>
 <20220403084820.M206428@dcvr>
 <c53378f8-87eb-43a6-afbb-e506c566ad26@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c53378f8-87eb-43a6-afbb-e506c566ad26@kernel.dk>
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

Jens Axboe <axboe@kernel.dk> wrote:
> I never build distro packages and know very little about it, so would
> really like Stefan et al to sign off on this. I'm about to cut the next
> version of liburing, and would indeed be great to have better packaging
> sorted before that.

Thanks for the response, awaiting Stefan.

> Does it still apply to the curren tree?

Yes :>
