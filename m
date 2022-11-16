Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB94C43217
	for <io-uring@archiver.kernel.org>; Wed, 16 Nov 2022 08:14:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237902AbiKPIO3 (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Wed, 16 Nov 2022 03:14:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238570AbiKPIOC (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Wed, 16 Nov 2022 03:14:02 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23A9D13D62
        for <io-uring@vger.kernel.org>; Wed, 16 Nov 2022 00:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=mX8HRc+Qs94VVpMfxca3KwFv02cRSnw9qReJd3IwxLQ=; b=brz6RY60VrtL/14Li19H7MonDU
        AOm9Se/79IMjZ6RJVbM7nDzC1qqOJqo+L9US/RxOWAFZftljmOv5WrlO+S3TC3EcU+bXwJxkd/4ML
        fkZFJDm7YErP3Djg5BWQK/x2u7qjNQk2wkegt24JWiXSnPAMuzWvi/RRwWIW+ePcpxsm5gjrajXpB
        T1HlknIlzcKM1yDv5/BzumAQ3UrLBAaVWF02OQKGAuvNAlZJTH0LH7LSdje9PgFdjfdLoEybrIvh9
        hNGyaIx3j9FNeATWO1pL78cf40/SdPwakvZycC3R7GPrD0Dr8ecGeq36GAUE/TQzT7ivsTwH80g/N
        TsUeRSwA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1ovDXT-0017EV-FQ; Wed, 16 Nov 2022 08:12:55 +0000
Date:   Wed, 16 Nov 2022 00:12:55 -0800
From:   Christoph Hellwig <hch@infradead.org>
To:     Jonathan Lemon <jonathan.lemon@gmail.com>
Cc:     io-uring@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v1 05/15] io_uring: mark pages in ifq region with zctap
 information.
Message-ID: <Y3Sbh7N+IbTv2JJf@infradead.org>
References: <20221108050521.3198458-1-jonathan.lemon@gmail.com>
 <20221108050521.3198458-6-jonathan.lemon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108050521.3198458-6-jonathan.lemon@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

On Mon, Nov 07, 2022 at 09:05:11PM -0800, Jonathan Lemon wrote:
> The network stack passes up pages, which must be mapped to
> zctap device buffers in order to get the reference count and
> other items.  Mark the page as private, and use the page_private
> field to record the lookup and ownership information.

Who coordinate ownership of page_private here?  What other parts
of the kernel could touch these pages?
