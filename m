Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28AE1C433EF
	for <io-uring@archiver.kernel.org>; Thu, 21 Jul 2022 15:39:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233019AbiGUPjx (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Thu, 21 Jul 2022 11:39:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233295AbiGUPjT (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Thu, 21 Jul 2022 11:39:19 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F20889665
        for <io-uring@vger.kernel.org>; Thu, 21 Jul 2022 08:37:43 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 88F7E68AFE; Thu, 21 Jul 2022 17:37:40 +0200 (CEST)
Date:   Thu, 21 Jul 2022 17:37:40 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     axboe@kernel.dk
Cc:     io-uring@vger.kernel.org
Subject: __io_file_supports_nowait for regular files
Message-ID: <20220721153740.GA5900@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

Hi Jens,

is there any good reason __io_file_supports_nowait checks the
blk_queue_nowait flag for regular files?  The FMODE_NOWAIT is set
for regular files that support nowait I/O, and should be all that
is needed.  Even with a block device that does not nonblocking
I/O some thing like reading from the page cache can be done
non-blocking.
