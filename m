Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9912C433EF
	for <io-uring@archiver.kernel.org>; Thu, 21 Jul 2022 16:23:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231374AbiGUQXH (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Thu, 21 Jul 2022 12:23:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231284AbiGUQXH (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Thu, 21 Jul 2022 12:23:07 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A396388776
        for <io-uring@vger.kernel.org>; Thu, 21 Jul 2022 09:23:06 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 8039D68AFE; Thu, 21 Jul 2022 18:23:03 +0200 (CEST)
Date:   Thu, 21 Jul 2022 18:23:03 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Christoph Hellwig <hch@lst.de>, io-uring@vger.kernel.org
Subject: Re: __io_file_supports_nowait for regular files
Message-ID: <20220721162303.GA9289@lst.de>
References: <20220721153740.GA5900@lst.de> <62207ded-7bf8-9aa1-bfc0-90a0aa12c373@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62207ded-7bf8-9aa1-bfc0-90a0aa12c373@kernel.dk>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

On Thu, Jul 21, 2022 at 09:59:40AM -0600, Jens Axboe wrote:
> On 7/21/22 9:37 AM, Christoph Hellwig wrote:
> > Hi Jens,
> > 
> > is there any good reason __io_file_supports_nowait checks the
> > blk_queue_nowait flag for regular files?  The FMODE_NOWAIT is set
> > for regular files that support nowait I/O, and should be all that
> > is needed.  Even with a block device that does not nonblocking
> > I/O some thing like reading from the page cache can be done
> > non-blocking.
> 
> Nope, we can probably kill that check then. Want to send a patch?

What would be a good way to verify it doesn't break any strange
assumptions?  I kinda don't fell too comfortable touching io_uring
guts.

> 
> -- 
> Jens Axboe
---end quoted text---
