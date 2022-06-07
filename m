Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37AAC43334
	for <io-uring@archiver.kernel.org>; Tue,  7 Jun 2022 08:13:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236825AbiFGINm (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Tue, 7 Jun 2022 04:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232062AbiFGINl (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Tue, 7 Jun 2022 04:13:41 -0400
Received: from out1.migadu.com (out1.migadu.com [IPv6:2001:41d0:2:863f::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDBFA369D8;
        Tue,  7 Jun 2022 01:13:40 -0700 (PDT)
Message-ID: <0f83e380-536c-f00e-cfba-56d708218f8f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1654589619;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=p+EM+nzy1BGWqTaiekqT1dj4V/CyGc6v0CjYm2X46+E=;
        b=Dva4M3xSCVnSyk5drRPy4BbTrsw1TnD6Eg1QC8zTBNV5S4v6anPYJQEm6KUlErJzxRV4Xq
        NYwh/vLRrsqu5mz7hdY+ayPCgojGy6Xdk2Y1MNn+YKspet3b8+KyoXGCE+AQFqn349k6JJ
        l/iDJitwRdUvloMd0m3ACRIL70nFYeI=
Date:   Tue, 7 Jun 2022 16:13:26 +0800
MIME-Version: 1.0
Subject: Re: [RFC 0/5] support nonblock submission for splice pipe to pipe
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Hao Xu <hao.xu@linux.dev>
To:     io-uring@vger.kernel.org
Cc:     Jens Axboe <axboe@kernel.dk>,
        Pavel Begunkov <asml.silence@gmail.com>,
        linux-fsdevel@vger.kernel.org,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kuniyuki Iwashima <kuniyu@amazon.co.jp>
References: <20220607080619.513187-1-hao.xu@linux.dev>
In-Reply-To: <20220607080619.513187-1-hao.xu@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

Hi,
On 6/7/22 16:06, Hao Xu wrote:
> From: Hao Xu <howeyxu@tencent.com>
> 
> splice from pipe to pipe is a trivial case, and we can support nonblock
> try for it easily. splice depends on iowq at all which is slow. Let's
                         ^ should be 'splice in io_uring'
> build a fast submission path for it by supporting nonblock.
> 
> Wrote a simple test to test time spent of splicing from pipe to pipe:
> 

Sorry, forgot to attach the test:
https://github.com/HowHsu/liburing/commit/3ff901b4fb80caf66a520742c6542e35111493a0

Regards,
Hao
