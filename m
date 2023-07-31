Return-Path: <io-uring-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C12C001DC
	for <io-uring@archiver.kernel.org>; Mon, 31 Jul 2023 16:06:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233192AbjGaQGs (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Mon, 31 Jul 2023 12:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233345AbjGaQGh (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Mon, 31 Jul 2023 12:06:37 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C34E19B2;
        Mon, 31 Jul 2023 09:06:28 -0700 (PDT)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1690819586;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TKyQ/XF6eGolHML6HuUpI0tpF8KVMtcZ161+On2lDmo=;
        b=yIxWfNS6Gt9NNtbzovQikF8QjhF5T7GekK5zb2uE0lQyyPksz26C0dOzarkkbvSTF05ack
        JrU3rulOa19gnmo76oBFFa0xPPN43Nek4gDcS/xWu9CoH3cpxV+M7/nUsDcNs0633Bsab1
        2hVxTOPxv8AdNZnRUEyJ3mLYgRCI+MccODyCO0nE+ZZcqOxROIA+qDIgCd/Dp3CeWyepB4
        nFDBadi7XKQlfrX2EErtbHWzsL2En22IobUk2nC83bI6udlh7NwvF74WMrvVlcTHCg2/fd
        NeFz7nnCeQJvtfh45O6B9QZm2bBhx+HVNFkFhf38SQ/QVCsjZgyaKqoVgK+SmA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1690819586;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TKyQ/XF6eGolHML6HuUpI0tpF8KVMtcZ161+On2lDmo=;
        b=+diubCoiF6KWEJHTctJGu5RDeYCyFU6qKcpyu+1kiDP9M+h4wGFw7p4g8fRtfc6Tq5/Iu8
        tseHX729BpqQNAAw==
To:     Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     peterz@infradead.org, andres@anarazel.de
Subject: Re: [PATCHSET v4] Add io_uring futex/futexv support
In-Reply-To: <20230728164235.1318118-1-axboe@kernel.dk>
References: <20230728164235.1318118-1-axboe@kernel.dk>
Date:   Mon, 31 Jul 2023 18:06:25 +0200
Message-ID: <87jzugnjzy.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

On Fri, Jul 28 2023 at 10:42, Jens Axboe wrote:
> s patchset adds support for first futex wake and wait, and then
> futexv.

Can you please just wait until the futex core bits have been agreed on
and merged? No need to contribute more mess in everyones inbox.
