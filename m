Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E0E9C433FE
	for <io-uring@archiver.kernel.org>; Thu, 17 Feb 2022 01:27:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230353AbiBQB1Z (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Wed, 16 Feb 2022 20:27:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbiBQB1U (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Wed, 16 Feb 2022 20:27:20 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA3C4C24BE
        for <io-uring@vger.kernel.org>; Wed, 16 Feb 2022 17:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=jn+LE2R+FPfxhQJ8o/DAUFaXpzIyjEuNUZnOJVwGh+E=; b=J2XQAh2VQDrALqKSByUM2zJOak
        Q9bZ4dmngfdviLjX+Q8bmrahDs35rM1ylaVZEl8zFE1Qh0SbCzYBr4R4mDsVX1kJTAZDXntZ5z6NL
        lPeE4DHcVZSm5vYgEb/JyshIO106A877tgr51zKfgjmKfPKqpypqx6x91QNlUpNC63nMwr/csglM3
        694gLrsT+1AgpziGFhnQc1anejbvt8iJ44od/6weqLJFBW93xcbwpeUSXdUc+yIrDomgU80Qx4hac
        lTGIBDYFDbbNV0/Spmx+Efn/7xpZdQ57QBVJyf+VR/Nwe2ynDnmhbCNxnztqxPNuS5KTN2/gxkb9C
        fRJdsw6Q==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nKVZa-008fP4-N5; Thu, 17 Feb 2022 01:27:06 +0000
Date:   Wed, 16 Feb 2022 17:27:06 -0800
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org,
        joshi.k@samsung.com, kbusch@kernel.org,
        linux-nvme@lists.infradead.org, metze@samba.org
Subject: Re: [PATCH 3/8] fs: add file_operations->uring_cmd()
Message-ID: <Yg2kajMhJs0j8wcw@bombadil.infradead.org>
References: <20210317221027.366780-1-axboe@kernel.dk>
 <20210317221027.366780-4-axboe@kernel.dk>
 <20210318053832.GB28063@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210318053832.GB28063@lst.de>
Sender: Luis Chamberlain <mcgrof@infradead.org>
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

On Thu, Mar 18, 2021 at 06:38:32AM +0100, Christoph Hellwig wrote:
> On Wed, Mar 17, 2021 at 04:10:22PM -0600, Jens Axboe wrote:
> > This is a file private handler, similar to ioctls but hopefully a lot
> > more sane and useful.
> 
> I really hate defining the interface in terms of io_uring.  This really
> is nothing but an async ioctl.

Calling it an ioctl does a disservice to what this is allowing.
Although ioctls might be a first use case, there is nothing tying the
commands to them.

  Luis
