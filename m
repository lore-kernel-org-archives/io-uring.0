Return-Path: <io-uring-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE8C4EB64DD
	for <io-uring@archiver.kernel.org>; Tue,  1 Aug 2023 07:17:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbjHAHRQ (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Tue, 1 Aug 2023 03:17:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbjHAHRP (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Tue, 1 Aug 2023 03:17:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31E2D199D;
        Tue,  1 Aug 2023 00:17:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AE652614A7;
        Tue,  1 Aug 2023 07:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AAB5C433C8;
        Tue,  1 Aug 2023 07:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690874233;
        bh=GY83+sXoxaD1CbkDRl4cxxWBkLyEKKu4Cd1THggBg6E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sCEczpoi4W7YlBKGlO1qwtGJ6nifwTXZ9HWqrOQZvqLnWm9S63hTefI+FdT3xW/Oo
         YS6EmnJuPMvE80HeUkz4l/CK5io460UkUZfdRFRif6w0L6flCZ13QZ4Gy5g48j1fDT
         FLJiYIRSy5C4PZXNvHTzUhgYDvgTLSHGf0zcMD/JJ/o76e4sTR0VtN0/kDWVyM1A+D
         ir30zhcejVcWsjLCjKoHgtO7EABUM3UEqsrK3wMGL9Npp8Uww0jvzy2yJzXFmkYY4K
         Jd7MAKYE3Jh2Nn7i1tbaPyWTRgiVSMuc717As/aicOyLHmm/TSB+YJ4v5vys5mmJOC
         OmoZdjrsV++JA==
Date:   Tue, 1 Aug 2023 09:17:07 +0200
From:   Christian Brauner <brauner@kernel.org>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     "Darrick J. Wong" <djwong@kernel.org>,
        Dave Chinner <david@fromorbit.com>, Hao Xu <hao.xu@linux.dev>,
        io-uring@vger.kernel.org,
        Dominique Martinet <asmadeus@codewreck.org>,
        Pavel Begunkov <asml.silence@gmail.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
        linux-fsdevel@vger.kernel.org, Wanpeng Li <wanpengli@tencent.com>
Subject: Re: [PATCH 3/5] io_uring: add support for getdents
Message-ID: <20230801-arterien-kurskorrektur-0c105c47765f@brauner>
References: <20230718132112.461218-1-hao.xu@linux.dev>
 <20230718132112.461218-4-hao.xu@linux.dev>
 <20230726-leinen-basisarbeit-13ae322690ff@brauner>
 <e9ddc8cc-f567-46bc-8f82-cf5ff8ff6c95@linux.dev>
 <20230727-salbe-kurvigen-31b410c07bb9@brauner>
 <ZMcPUX0lYC2nscAm@dread.disaster.area>
 <20230731-gezeugt-tierwelt-f3d6a900c262@brauner>
 <20230731152623.GC11336@frogsfrogsfrogs>
 <22630618-40fc-5668-078d-6cefcb2e4962@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <22630618-40fc-5668-078d-6cefcb2e4962@kernel.dk>
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

On Mon, Jul 31, 2023 at 06:28:02PM -0600, Jens Axboe wrote:
> On 7/31/23 9:26?AM, Darrick J. Wong wrote:
> > I've watched quite a bit of NOWAIT whackamole going on over the past few
> > years (i_rwsem, the ILOCK, the IO layer, memory allocations...).  IIRC
> > these filesystem ios all have to run in process context, right?  If so,
> > why don't we capture the NOWAIT state in a PF flag?  We already do that
> > for NOFS/NOIO memory allocations to make sure that /all/ reclaim
> > attempts cannot recurse into the fs/io stacks.
> 
> I would greatly prefer passing down the context rather than capitulating
> and adding a task_struct flag for this. I think it _kind of_ makes sense
> for things like allocations, as you cannot easily track that all the way
> down, but it's a really ugly solution. It certainly creates more churn
> passing it down, but it also reveals the parts that need to check it.
> WHen new code is added, it's much more likely you'll spot the fact that
> there's passed in context. For allocation, you end up in the allocator
> anyway, which can augment the gfp mask with whatever is set in the task.
> The same is not true for locking and other bits, as they don't return a
> value to begin with. When we know they are sane, we can flag the fs as
> supporting it (like we've done for async buffered reads, for example).
> 
> It's also not an absolute thing, like memory allocations are. It's
> perfectly fine to grab a mutex under NOWAIT issue. What you should not
> do is grab a mutex that someone else can grab while waiting on IO. This
> kind of extra context is only available in the code in question, not
> generically for eg mutex locking.
> 
> I'm not a huge fan of the "let's add a bool nowait". Most/all use cases
> pass down state anyway, putting it in a suitable type struct seems much

We're only going to pass a struct if there really is a need for one
though. Meaning, we're shouldn't end up passing a struct with a single
element around in the hopes that we'll add more members at some point. 

> cleaner to me than the out-of-band approach of just adding a
> current->please_nowait.

I'm not convinced that abusing current/task_struct for this is sane. I
not just very much doubt this will go down well with reviewers outside
of fs/ we'd also rightly be told that we're punting on a design problem
because it would be more churn.
