Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B72C433EF
	for <io-uring@archiver.kernel.org>; Thu, 28 Apr 2022 15:34:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347620AbiD1Pha (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Thu, 28 Apr 2022 11:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349248AbiD1Pha (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Thu, 28 Apr 2022 11:37:30 -0400
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5025056C3B
        for <io-uring@vger.kernel.org>; Thu, 28 Apr 2022 08:34:14 -0700 (PDT)
Received: by mail-il1-f198.google.com with SMTP id j16-20020a056e02125000b002cc39632ab9so1951882ilq.9
        for <io-uring@vger.kernel.org>; Thu, 28 Apr 2022 08:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=EwMmxxB70GQgJ7u1Zrn5Cilc9vL4oRzYW0xvX1vsow0=;
        b=evmiBQm5QUr0jiawqD2cHXGkeOI2rxORm2wPjJhN3ib0S3mAfauNsWP6hBWtZLs/Na
         FmbV1AekQazEwffZLuA8FBjRvCoouXC9nyq30KOF9fInapNsrg2mzGZiXbZk+KagVmj5
         hH9eIYEhCHrez7J5BR3iQsyIVvAGbY3DfDAPybxs2tQUkmhtOasQqxyBW3NIHyRNwaG+
         bvTPUROmz4Zeq5gJztsK4PdVuy+eVG1wvqjg+oO2Zage813dh2YgSaGIO3BxNrLhecfo
         i/AbbulqXgpVBWXEk72ubrwSl0YQ/XvxDtUl/0nrqmb2utMJTvlunA9NUlBBX28zTbwU
         anhw==
X-Gm-Message-State: AOAM530lfaz3QAJMniApYxSGZnzAur7YqKWwvdarJV4ijT/gCWXN1X8j
        iy4V8guNnbeinTfRAFKeYyF0mQUTqQxA+hbjvLaoxCMQknJS
X-Google-Smtp-Source: ABdhPJzrnc8aaDPPy8hiBYilBlWFtxk5NFe/XwVn3JfG3hYu7MIAfPPPIVXngUhRoa2edWTe4oBAsrysbQjR1xKK/21PxatM+TEM
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1585:b0:2c2:5b2c:e3e5 with SMTP id
 m5-20020a056e02158500b002c25b2ce3e5mr13726563ilu.76.1651160053601; Thu, 28
 Apr 2022 08:34:13 -0700 (PDT)
Date:   Thu, 28 Apr 2022 08:34:13 -0700
In-Reply-To: <00000000000012e22c05dacabb11@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000765a6105ddb8a8b9@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in add_wait_queue
From:   syzbot <syzbot+950cee6d91e62329be2c@syzkaller.appspotmail.com>
To:     asml.silence@gmail.com, axboe@kernel.dk,
        gregkh@linuxfoundation.org, io-uring@vger.kernel.org,
        jirislaby@kernel.org, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

syzbot suspects this issue was fixed by commit:

commit d89a4fac0fbc6fe5fc24d1c9a889440dcf410368
Author: Jens Axboe <axboe@kernel.dk>
Date:   Tue Mar 22 19:11:28 2022 +0000

    io_uring: fix assuming triggered poll waitqueue is the single poll

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17b70e42f00000
start commit:   b47d5a4f6b8d Merge tag 'audit-pr-20220321' of git://git.ke..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=63af44f0631a5c3a
dashboard link: https://syzkaller.appspot.com/bug?extid=950cee6d91e62329be2c
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14506ddb700000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=139b2093700000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: io_uring: fix assuming triggered poll waitqueue is the single poll

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
