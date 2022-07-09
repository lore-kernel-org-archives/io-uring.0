Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB9BC433EF
	for <io-uring@archiver.kernel.org>; Sat,  9 Jul 2022 16:46:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbiGIQqR (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Sat, 9 Jul 2022 12:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiGIQqR (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Sat, 9 Jul 2022 12:46:17 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66FC512098
        for <io-uring@vger.kernel.org>; Sat,  9 Jul 2022 09:46:16 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id n12so1539536pfq.0
        for <io-uring@vger.kernel.org>; Sat, 09 Jul 2022 09:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5ST0dwgswkyiznS7MSshlJOqrnF32dp+oFhX00WjctI=;
        b=Xpd9pupHo7osCGmA7fGoNW6rfE7AiHVGgs9uvxdYXFP72hJFib9eCQ3fZOA7uNBe70
         Mpb5PZXvlq+0aJM8RIMlgRgXnY7LTLEyHOjhjNjNOnoninNa2wNtoAbq8RayIfhn6+wH
         H2mp+DV/K82XLLRRz5NGwF8NeVgtDFZXjk7lhv65uXxkOhhA3vqZgfQGLZmp0zHpqGp/
         HCPAZImpzjW04rVL9KxhZpJawpmjR4h8oJ0g7RpRgaahiNT0/1P8iMXhfP8jSUHcUjRb
         w/BpcKhmlW1ee9zB8JhiJTemkENyG2Qf+1IpjLyB/zn6xgWuvB/9ebaGZ5pabcR+n6M/
         1J6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5ST0dwgswkyiznS7MSshlJOqrnF32dp+oFhX00WjctI=;
        b=vaVPPFGZ+QM0O4SS1Rx7J9wpK3heePF3F+43t6a3pz4Xp+IbBzt0HLivahitpbgwaP
         U2rE87yze9SlXaYgWKhQdEKFiFEfLWiaTxx79iCEvVG872vFyjO2b1C/32D7UV0y6s+o
         XJOa9jjaR+Hq8V5qcyL9PSzYg8JVfiQStITboU92Ly0ZLiWViB5lOemcfFDMZhxbMYpC
         fh/DKCguE9BY65lVSmlZRjhCSyE/fk0+fKUj4bdOErdWHeYYQTbB3Y1mhMytOlkg8pAs
         1Vfed3vbZI+P4RrT+wqqdUD4xF0JKbZmOHghKsL9MQCVTWP3SnM8gAXXCOsdHVttvx4U
         ezCw==
X-Gm-Message-State: AJIora/hDyftfbPhswdcgjrTjS2ZbKGlTNt8zE6ap9TR0XL4bwB3CbOb
        UqIGQaLp/A1OwZTEirdf6SbAWSrGSr/zOTFG/FH+pxuF
X-Google-Smtp-Source: AGRyM1sQqNuHnOjOphKE6l0RZy/mvbCGv2ipsL8XqqPHY9GkHX4avwDcTR0v/7bY+NMtTYCMg0fC5wvBkhx7WmeGr6I=
X-Received: by 2002:a05:6a00:148d:b0:528:3d32:f111 with SMTP id
 v13-20020a056a00148d00b005283d32f111mr9403160pfu.31.1657385175837; Sat, 09
 Jul 2022 09:46:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAEsUgYg5zx5Zk_wp9=YXf5Y+qPh9vx7adDN=B_rpa3zoh2YSew@mail.gmail.com>
 <924ece92-caa8-390e-7040-1dd3eb8ad3cd@kernel.dk>
In-Reply-To: <924ece92-caa8-390e-7040-1dd3eb8ad3cd@kernel.dk>
From:   Hrvoje Zeba <zeba.hrvoje@gmail.com>
Date:   Sat, 9 Jul 2022 12:46:04 -0400
Message-ID: <CAEsUgYgVFgq+G8wYAb4aQXXrw+GvLmzm7d2jd7RpRfKAB8BDLg@mail.gmail.com>
Subject: Re: recvmsg not honoring O_NONBLOCK
To:     Jens Axboe <axboe@kernel.dk>
Cc:     io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

On Sat, Jul 9, 2022 at 11:26 AM Jens Axboe <axboe@kernel.dk> wrote:
>
> On 7/9/22 8:21 AM, Hrvoje Zeba wrote:
> > Hi folks,
> >
> > I was adapting msquic library to work with iouring and found an issue
> > with recvmsg() where it ignores O_NONBLOCK flag set on the file
> > descriptor. If MSG_DONTWAIT is set in flags, it behaves as expected.
> > I've attached a simple test which currently just hangs on iouring's
> > recvmsg(). I'm guessing sendmsg() behaves the same way but I have no
> > idea how to fill the buffer to reliably test it.
>
> I am guessing that you're waiting off waiting for the event. It's not
> stalled on the issue, it'll arm poll and wait for an event. I won't go
> into too much of a ran on O_NONBLOCK, but it's a giant mess, and where
> possible, io_uring relies on per-request non-block flags as that is much
> saner behavior.
>

Oh, this is intentional behaviour. Got it! Thanks for the explanation.

-- 
I doubt, therefore I might be.
