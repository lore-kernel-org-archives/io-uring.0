Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD8AC433EF
	for <io-uring@archiver.kernel.org>; Thu,  5 May 2022 13:34:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232934AbiEENhl (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Thu, 5 May 2022 09:37:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243341AbiEENhi (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Thu, 5 May 2022 09:37:38 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1322857110
        for <io-uring@vger.kernel.org>; Thu,  5 May 2022 06:33:59 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 88F9468AA6; Thu,  5 May 2022 15:33:54 +0200 (CEST)
Date:   Thu, 5 May 2022 15:33:54 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Kanchan Joshi <joshi.k@samsung.com>
Cc:     axboe@kernel.dk, hch@lst.de, io-uring@vger.kernel.org,
        linux-nvme@lists.infradead.org, asml.silence@gmail.com,
        ming.lei@redhat.com, mcgrof@kernel.org, shr@fb.com,
        joshiiitr@gmail.com, anuj20.g@samsung.com, gost.dev@samsung.com
Subject: Re: [PATCH v4 4/5] nvme: wire-up uring-cmd support for io-passthru
 on char-device.
Message-ID: <20220505133354.GC11853@lst.de>
References: <20220505060616.803816-1-joshi.k@samsung.com> <CGME20220505061150epcas5p2b60880c541a4b2f144c348834c7cbf0b@epcas5p2.samsung.com> <20220505060616.803816-5-joshi.k@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505060616.803816-5-joshi.k@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

Sorry a few ints while looking overthis again:

> +static void nvme_end_async_pt(struct request *req, blk_status_t err)

The naming here is a bit silly and doesn't match what we use elsewhere
in the code.  I'd suggest nvme_uring_cmd_end_io instead.
> +{
> +	struct nvme_uring_cmd_pdu *pdu = nvme_uring_cmd_pdu(ioucmd);
> +
> +	/* to free bio on completion, as req->bio will be null at that time */
> +	pdu->bio = rq->bio;
> +	pdu->meta = nvme_meta_from_bio(rq->bio);
> +	pdu->meta_buffer = meta_buffer;
> +	pdu->meta_len = meta_len;
> +	rq->end_io_data = ioucmd;
> +}

And this really should be folded into the only caller.

