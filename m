Return-Path: <io-uring-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C71A5C77B7F
	for <io-uring@archiver.kernel.org>; Wed, 17 May 2023 12:20:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbjEQMUI (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Wed, 17 May 2023 08:20:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbjEQMUG (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Wed, 17 May 2023 08:20:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 225C04C33;
        Wed, 17 May 2023 05:19:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AC3E264662;
        Wed, 17 May 2023 12:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3636C433EF;
        Wed, 17 May 2023 12:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1684325998;
        bh=wFGRTVNgSolEtpE7ywJRUeXY3mE2266Cr0MMqKvhLgs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AKcIBQA+Sg5f+KasRA2jUEu8UP/d+b3a0oSAPU9J218PWkChz7k+FQHyqcU1C3qvr
         m7wYCUDkHC4Uf87iH09txQNxfRWmbL2A9Oxwf272JY4lsPyw15RbrI70VPNzlhphXn
         xa3zzL4Ye21883SBbW6VANgX721FukKDxu/PT25g=
Date:   Wed, 17 May 2023 14:19:55 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     yang lan <lanyang0908@gmail.com>
Cc:     axboe@kernel.dk, sashal@kernel.org, asml.silence@gmail.com,
        dylany@fb.com, linux-kernel@vger.kernel.org,
        io-uring@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [Bug report] kernel panic: System is deadlocked on memory
Message-ID: <2023051740-eardrum-backfire-0222@gregkh>
References: <CAAehj2kcgtRta0ou6KQiyz33O4hf+_7jgndzV_neyQRj5BjSJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAehj2kcgtRta0ou6KQiyz33O4hf+_7jgndzV_neyQRj5BjSJQ@mail.gmail.com>
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

On Wed, May 17, 2023 at 08:02:38PM +0800, yang lan wrote:
> Hi,
> 
> We use our modified Syzkaller to fuzz the Linux kernel and found the
> following issue:
> 
> Head Commit: f1b32fda06d2cfb8eea9680b0ba7a8b0d5b81eeb
> Git Tree: stable
> 
> Console output: https://pastebin.com/raw/Ssz6eVA6
> Kernel config: https://pastebin.com/raw/BiggLxRg
> C reproducer: https://pastebin.com/raw/tM1iyfjr
> Syz reproducer: https://pastebin.com/raw/CEF1R2jg

These links do not work, please provide a C reproducer in the email.

thanks,

greg k-h
