Return-Path: <io-uring-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F7A8C04A94
	for <io-uring@archiver.kernel.org>; Tue,  1 Aug 2023 01:02:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbjHABCY (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Mon, 31 Jul 2023 21:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjHABCX (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Mon, 31 Jul 2023 21:02:23 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 424BCE5D;
        Mon, 31 Jul 2023 18:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=OFO5+ZJdeJmmQU60CCF7PS24KaQVAnEVml3BwOJfAV4=; b=liz1+pC03GNlDV14ReOPDhGQw+
        R0nW7haNoWE8Gdjq1kBMlCP4RxxAaeRLvaXhvhAdyrY6UruG7nK90A3eXmbA+sRrCsTyrsJxu5Wsa
        OEZcFTgSDhKdOr3I1KKRvR140OFq2tV1PiJc19XVu3AMzNHEwia0xJ97pZtg6opD1ACxnBxFChZpk
        bQWx65FAX7gjNDghYcrvdky2T3p6ikamrGwtJzehFGIfTFvkshw3QKb8qE//D/1Of2LYkYDgWLXwk
        CV04HBSIzrMPlJg+CBG66Pb7w1X/0WHxW6O7py+ookbYDAEMVMmRce9ZRmMK/7eS0Fwjtm67XtEFd
        Z5d9UVRg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1qQdlv-004oCB-GC; Tue, 01 Aug 2023 01:01:59 +0000
Date:   Tue, 1 Aug 2023 02:01:59 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     "Darrick J. Wong" <djwong@kernel.org>,
        Christian Brauner <brauner@kernel.org>,
        Dave Chinner <david@fromorbit.com>, Hao Xu <hao.xu@linux.dev>,
        io-uring@vger.kernel.org,
        Dominique Martinet <asmadeus@codewreck.org>,
        Pavel Begunkov <asml.silence@gmail.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
        linux-fsdevel@vger.kernel.org, Wanpeng Li <wanpengli@tencent.com>
Subject: Re: [PATCH 3/5] io_uring: add support for getdents
Message-ID: <ZMhZh2EYPMH1wIXX@casper.infradead.org>
References: <20230718132112.461218-4-hao.xu@linux.dev>
 <20230726-leinen-basisarbeit-13ae322690ff@brauner>
 <e9ddc8cc-f567-46bc-8f82-cf5ff8ff6c95@linux.dev>
 <20230727-salbe-kurvigen-31b410c07bb9@brauner>
 <ZMcPUX0lYC2nscAm@dread.disaster.area>
 <20230731-gezeugt-tierwelt-f3d6a900c262@brauner>
 <20230731152623.GC11336@frogsfrogsfrogs>
 <22630618-40fc-5668-078d-6cefcb2e4962@kernel.dk>
 <ZMhWI/2UIFAb3vR7@casper.infradead.org>
 <e2d8e5f1-f794-38eb-cecf-ed30c571206b@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2d8e5f1-f794-38eb-cecf-ed30c571206b@kernel.dk>
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

On Mon, Jul 31, 2023 at 06:49:45PM -0600, Jens Axboe wrote:
> On 7/31/23 6:47?PM, Matthew Wilcox wrote:
> > On Mon, Jul 31, 2023 at 06:28:02PM -0600, Jens Axboe wrote:
> >> It's also not an absolute thing, like memory allocations are. It's
> >> perfectly fine to grab a mutex under NOWAIT issue. What you should not
> >> do is grab a mutex that someone else can grab while waiting on IO. This
> >> kind of extra context is only available in the code in question, not
> >> generically for eg mutex locking.
> > 
> > Is that information documented somewhere?  I didn't know that was the
> > rule, and I wouldn't be surprised if that's news to several of the other
> > people on this thread.
> 
> I've mentioned it in various threads, but would probably be good to
> write down somewhere if that actually makes more people see it. I'm
> dubious, but since it applies to NOWAIT in general, would be a good
> thing to do regardless. And then at least I could point to that rather
> than have to write up a long description every time.

Would be good to include whether it's OK to wait on a mutex that's held
by another thread that's allocating memory without __GFP_NOFS (since
obviously that can block on I/O)
