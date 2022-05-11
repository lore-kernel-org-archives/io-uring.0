Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B0FC433EF
	for <io-uring@archiver.kernel.org>; Wed, 11 May 2022 12:42:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238783AbiEKMmr (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Wed, 11 May 2022 08:42:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231299AbiEKMmr (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Wed, 11 May 2022 08:42:47 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2A9C3F311
        for <io-uring@vger.kernel.org>; Wed, 11 May 2022 05:42:46 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 8963468C4E; Wed, 11 May 2022 14:42:42 +0200 (CEST)
Date:   Wed, 11 May 2022 14:42:42 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Kanchan Joshi <joshi.k@samsung.com>
Cc:     axboe@kernel.dk, hch@lst.de, io-uring@vger.kernel.org,
        linux-nvme@lists.infradead.org, asml.silence@gmail.com,
        ming.lei@redhat.com, mcgrof@kernel.org, shr@fb.com,
        joshiiitr@gmail.com, anuj20.g@samsung.com, gost.dev@samsung.com
Subject: Re: [PATCH v5 1/6] fs,io_uring: add infrastructure for uring-cmd
Message-ID: <20220511124241.GA25487@lst.de>
References: <20220511054750.20432-1-joshi.k@samsung.com> <CGME20220511055308epcas5p3627bcb0ec10d7a2222e701898e9ad0db@epcas5p3.samsung.com> <20220511054750.20432-2-joshi.k@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220511054750.20432-2-joshi.k@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

Looks good (modulo the bits from patch 6 that should be folded in):

Reviewed-by: Christoph Hellwig <hch@lst.de>
