Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D920C25B08
	for <io-uring@archiver.kernel.org>; Sat, 13 Aug 2022 07:59:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236427AbiHMH7m (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Sat, 13 Aug 2022 03:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbiHMH7l (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Sat, 13 Aug 2022 03:59:41 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A3C813DE1;
        Sat, 13 Aug 2022 00:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=wixwjmHKCOFMIZdGWOMrMSyWyOyjGPO5q3e+BZJRqeU=; b=Db+9bTiNRjnhM4jb0idim5qxgU
        oPowf9rzPcSswLWPj2iX3D62y6VT6eJ2RP60kFEVNGOabus2U0WBwnNEiIGpU2Hl+sJlkGkkMUXlr
        vrXJWmg8V360EEXP10fhSeSj0v4G3rJpW9Aj4xrh0Zeoeo4YcyZeVr06NTLHntuLKM9DyKYTtfiCX
        XuJXki/mqaGUIyEPsaidNutTjjArGiiTessO8O2QNLJJDYxHkp9hwtatnQrjjxJoTSpjMFnA78+19
        wpR42U7F1HaUzAlb6a39y2DGrQrf2iIL0k54xm2ucDnA5dJYgGWg92jRGdxRJ8NgycJ5q96ZYNpq2
        x9i6KCwQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oMm3V-00CORm-P3; Sat, 13 Aug 2022 07:59:37 +0000
Date:   Sat, 13 Aug 2022 00:59:37 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Keith Busch <kbusch@fb.com>
Cc:     axboe@kernel.dk, io-uring@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] fs: don't randomized kiocb fields
Message-ID: <YvdZ6X4Bf6A1uisS@infradead.org>
References: <20220812225633.3287847-1-kbusch@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220812225633.3287847-1-kbusch@fb.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

s/randomized/randomize/

in the subject?
