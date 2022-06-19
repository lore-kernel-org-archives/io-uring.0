Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C98C43334
	for <io-uring@archiver.kernel.org>; Sun, 19 Jun 2022 11:17:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235132AbiFSLRD (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Sun, 19 Jun 2022 07:17:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233799AbiFSLRC (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Sun, 19 Jun 2022 07:17:02 -0400
Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C007A2191
        for <io-uring@vger.kernel.org>; Sun, 19 Jun 2022 04:17:01 -0700 (PDT)
Received: from [192.168.88.254] (unknown [180.254.122.8])
        by gnuweeb.org (Postfix) with ESMTPSA id 3F3C17FD62;
        Sun, 19 Jun 2022 11:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
        s=default; t=1655637421;
        bh=RWCaYv4p6CIMRUgFbFEO1RIMLP367OP4YZ8QuMK/6BM=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=e6YvCCLrjX+NVWWBKMUnzlSOAMWx3+SxLzytKQ2RQJLYw19nOoOG5WLfDDxS3btQN
         vZUmSFqun/c0ro3d9NCclWhg2FOybMpgBa4sQqghloUFW5S8zzjcbKsrztFnA2+QvQ
         QE1y0VvDLGUFMpei5VaCc++Aql8lLf8B+W/nur3DQFyaa7fSvCDrc83fRcppiz/5bD
         1WMKWaQ14z20YFNR55fsMg5VFTYE3KejhCWsGiZyhfk77iiA6yMCSpQWTPLOcgoj70
         BzUusk8w3XYHy7WaftrsAOiwuRwckD1+xlZYGsCXEXsmd4TpkdOnygDabnkYxHBq/c
         lOR3l8OKhPhfQ==
Message-ID: <786492be-f732-59d0-ccef-e7be6a101002@gnuweeb.org>
Date:   Sun, 19 Jun 2022 18:16:55 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Pavel Begunkov <asml.silence@gmail.com>,
        Carter Li <carter.li@eoitek.com>,
        io-uring Mailing List <io-uring@vger.kernel.org>
References: <20220619020715.1327556-1-axboe@kernel.dk>
 <20220619020715.1327556-4-axboe@kernel.dk>
From:   Ammar Faizi <ammarfaizi2@gnuweeb.org>
Subject: Re: [PATCH 3/3] io_uring: add sync cancelation API through
 io_uring_register()
In-Reply-To: <20220619020715.1327556-4-axboe@kernel.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

Hi Jens,

On 6/19/22 9:07 AM, Jens Axboe wrote:
> +		cd.seq = atomic_inc_return(&ctx->cancel_seq),

Not sure if it's intentional, but the comma after atomic_inc return()
looks unique. While that's valid syntax, I think you want to use a
semicolon to end it consistently.

> +
> +		prepare_to_wait(&ctx->cq_wait, &wait, TASK_INTERRUPTIBLE);
> +
> +		ret = __io_sync_cancel(current->io_uring, &cd, sc.fd);

-- 
Ammar Faizi
