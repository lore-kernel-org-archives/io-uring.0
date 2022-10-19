Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12432C4332F
	for <io-uring@archiver.kernel.org>; Wed, 19 Oct 2022 20:52:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbiJSUwZ (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Wed, 19 Oct 2022 16:52:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbiJSUwY (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Wed, 19 Oct 2022 16:52:24 -0400
Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 345D48B2EC
        for <io-uring@vger.kernel.org>; Wed, 19 Oct 2022 13:52:23 -0700 (PDT)
Received: from [10.7.7.5] (unknown [182.253.183.71])
        by gnuweeb.org (Postfix) with ESMTPSA id C46937E257;
        Wed, 19 Oct 2022 20:52:20 +0000 (UTC)
X-GW-Data: lPqxHiMPbJw1wb7CM9QUryAGzr0yq5atzVDdxTR0iA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
        s=default; t=1666212742;
        bh=F/z+IIXoW92bkJEpfIc1b1KsoNSdBCKXwq03bwcBPJQ=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=nmB1educpffl7GsuBguKs2UFE0LYk1pTAaxP3LA97tXH6nsxi++SOiv7BCqWmc+9b
         q7/nacsNjpB3BlqLRWku+Gt5Y0QNIn+HTdut+n71Ht3qelUVnPGW1miQ7zZdltf7v3
         Fs18F3TcliJUruHRnVOUTP8dPqvwr5Dguv7n1o1cbtFGdGYQvkV1G+B/JUvvK9VOeO
         F+6ijmXlOJVqI31jCTWWrOXkros7BBYzvEXOABnQsZdNCZ0L23IxCScAE8i9ksUxDM
         T5/4h4AnYwDf7LLHeqOXmR47hWI4L2Ff8njeUvNPa/TPu9L5catwOb2xFkLA4GnbJQ
         mShy4NBXEEvUg==
Message-ID: <6cc93efb-cfa3-b0fe-ce06-deb03e013b2f@gnuweeb.org>
Date:   Thu, 20 Oct 2022 03:52:17 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To:     Dylan Yudaken <dylany@meta.com>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Pavel Begunkov <asml.silence@gmail.com>,
        io-uring Mailing List <io-uring@vger.kernel.org>,
        Facebook Kernel Team <kernel-team@fb.com>
References: <20221019145042.446477-1-dylany@meta.com>
From:   Ammar Faizi <ammarfaizi2@gnuweeb.org>
Subject: Re: [PATCH liburing 0/2] liburing: fix shortening api issues
In-Reply-To: <20221019145042.446477-1-dylany@meta.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

On 10/19/22 9:50 PM, Dylan Yudaken wrote:
> The liburing public API has a couple of int shortening issues found by
> compiling with cc="clang -Wshorten-64-to-32 -Werror"
> 
> There are a few more in the main library, and a *lot* in the tests, which
> would be nice to fix up at some point. The public API changes are
> particularly useful for build systems that include these files and run
> with these errors enabled.

Let's clean the main library up, but ignore the tests for now. I'll send
a cleanup series for review before the release.

-- 
Ammar Faizi

