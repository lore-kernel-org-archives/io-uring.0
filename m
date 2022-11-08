Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B6AC433FE
	for <io-uring@archiver.kernel.org>; Tue,  8 Nov 2022 06:55:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233263AbiKHGzz (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Tue, 8 Nov 2022 01:55:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232641AbiKHGzy (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Tue, 8 Nov 2022 01:55:54 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 065CD1F9D0;
        Mon,  7 Nov 2022 22:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=4tzqoSh3DSl3FicrwkaEghaNBV3MO8lFSsah/Hl61GE=; b=AaCN5AiFZ6TzgSsWHH1falK9KY
        mc52Kyhdw3FaFvQAhqpVB6aKKSJQ4N9uWkedeulkyVwM5oz0uaVaO+yZjaYIWoJgf2A7oxrBTINIx
        2RytMjn2L1qmSmxDaaRfwBwEpxG3kJ/RUtRpRC122gGClYZidTqg90Msu6TRPZGSO2V03W36qmUui
        TnpFoscRLQeezK6XJQPVOzGBlPvKe4QL1H9xnpKce0lBie1OE+KkHmpFw1ZVEMVydotgtTA94I4wM
        9VYpe4201XqRks84LxDf4TjbFtG9/nYPKn6fVSmY33njkPT0JhqgLlsgt70gVfei4uKduQOKp76Qe
        m6otl0MQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1osIWT-003Ijn-IV; Tue, 08 Nov 2022 06:55:49 +0000
Date:   Mon, 7 Nov 2022 22:55:49 -0800
From:   Christoph Hellwig <hch@infradead.org>
To:     Keith Busch <kbusch@meta.com>
Cc:     viro@zeniv.linux.org.uk, axboe@kernel.dk, io-uring@vger.kernel.org,
        asml.silence@gmail.com, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 1/4] iov: add import_ubuf()
Message-ID: <Y2n9dd3QOwcgk5Cx@infradead.org>
References: <20221107175610.349807-1-kbusch@meta.com>
 <20221107175610.349807-2-kbusch@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107175610.349807-2-kbusch@meta.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

On Mon, Nov 07, 2022 at 09:56:07AM -0800, Keith Busch wrote:
> From: Jens Axboe <axboe@kernel.dk>
> 
> Like import_single_range(), but for ITER_UBUF.

So what is the argument for not simplify switching
import_single_range to always do a ITER_UBUF?  Maybe there is a reason
against that, but it should be clearly stated here.

> 
> Signed-off-by: Jens Axboe <axboe@kernel.dk>

Now that this went through your hands it also needs your signoff.
