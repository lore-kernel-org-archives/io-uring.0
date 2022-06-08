Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F80CCA489
	for <io-uring@archiver.kernel.org>; Wed,  8 Jun 2022 06:43:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbiFHGnv (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Wed, 8 Jun 2022 02:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347027AbiFHF5o (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Wed, 8 Jun 2022 01:57:44 -0400
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A7CE38EBAF;
        Tue,  7 Jun 2022 21:19:33 -0700 (PDT)
Message-ID: <68b1a721-217a-f52b-ae41-0faec77edf3f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1654661971;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8ArL2CGDYn0GDFk7cQJkZf9GGeA+hEwaGPjbvKJ00wk=;
        b=YFKJTOHeESuLxajWfe2KD/EX9BYUMK0HVlTucNXdjlUyDK/ZZmnsVu3aHgnLznIUS2SYDB
        SuZtINSPnlqOBjp+tqQgKlpfw66BbTAwyUbi6YvcT2bNRJb5ajTU4DduLsiDqm0nty6y2q
        F9AwxR5bgsw0TDnucHT2eAfsrAUGt9o=
Date:   Wed, 8 Jun 2022 12:19:19 +0800
MIME-Version: 1.0
Subject: Re: [RFC 0/5] support nonblock submission for splice pipe to pipe
Content-Language: en-US
To:     Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org
Cc:     Jens Axboe <axboe@kernel.dk>, linux-fsdevel@vger.kernel.org,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kuniyuki Iwashima <kuniyu@amazon.co.jp>
References: <20220607080619.513187-1-hao.xu@linux.dev>
 <d350c35e-1d73-b2c8-5ae4-e6ead92aebba@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Hao Xu <hao.xu@linux.dev>
In-Reply-To: <d350c35e-1d73-b2c8-5ae4-e6ead92aebba@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

On 6/7/22 17:27, Pavel Begunkov wrote:
> On 6/7/22 09:06, Hao Xu wrote:
>> From: Hao Xu <howeyxu@tencent.com>
>>
>> splice from pipe to pipe is a trivial case, and we can support nonblock
>> try for it easily. splice depends on iowq at all which is slow. Let's
>> build a fast submission path for it by supporting nonblock.
> 
> fwiw,
> 
> https://www.spinics.net/lists/kernel/msg3652757.html
> 

Thanks, Pavel. Seems it has been discussed for a long time but the
result remains unclear...For me, I think this patch is necessary for 
getting a good SPLICE_F_NONBLOCK user experience.
