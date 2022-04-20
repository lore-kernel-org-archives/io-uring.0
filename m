Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA31C433EF
	for <io-uring@archiver.kernel.org>; Wed, 20 Apr 2022 13:18:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378833AbiDTNU4 (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Wed, 20 Apr 2022 09:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378874AbiDTNUy (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Wed, 20 Apr 2022 09:20:54 -0400
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 176DF42A08
        for <io-uring@vger.kernel.org>; Wed, 20 Apr 2022 06:18:08 -0700 (PDT)
Received: by mail-io1-f70.google.com with SMTP id g16-20020a05660203d000b005f7b3b0642eso1185603iov.16
        for <io-uring@vger.kernel.org>; Wed, 20 Apr 2022 06:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=aM2Q2d/hJNPY2DMp/gPkgY7NILmg4uzapPLGnb3ip8g=;
        b=Os5Hq41QP3M08iC+E6no56IHLt4MIGH5ry8vVO8fFqeUWxL0/c6HQZPFdFbPwuJMuh
         9Zb6p9pn+gGBjwsZ4AoRqUVUdtcJ+e5lrQ/WRP7aaw6wbskvJY5cdvdRt2QoznLdaJzX
         yeSyia61vJrBlQ+7E01D5+5hwcg9vvexh0I9zcfnqausdWG1MKo524799z+pStEmGCpu
         g0PYdLZDyu4jB8/c6vjqVaQ9V0+Rc+xTc61Wd2UiE42HCusUMEvwAjhxfmoojeR6IIjt
         TPTwLpo02q9MK6Q60E/YGaJBe3uk+x9Mx/UpHbxOVv5gkJMtOgBBIpIFQow3UXPIqtGA
         IB0Q==
X-Gm-Message-State: AOAM530Su41ku/319wxb+5DtWtwI61rD2QLrJIcmjcMLEJ0bAcrDgjTI
        k1qJ6ii0xKYUcUZuAxBOxm2haup/VC5RHU3dBdaRN5l5Iitz
X-Google-Smtp-Source: ABdhPJxu2RZ1CiqGWLVPPnLZOgLlP+uI8/5OKKR0Jj8q6RcsN/iR/FYUjqXCQ8Grb+eaoxDkLTK1mB+0cIZUNs/BZUi4pP4tC7Am
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:152f:b0:2cc:b71:5b34 with SMTP id
 i15-20020a056e02152f00b002cc0b715b34mr8878949ilu.23.1650460687500; Wed, 20
 Apr 2022 06:18:07 -0700 (PDT)
Date:   Wed, 20 Apr 2022 06:18:07 -0700
In-Reply-To: <9ac31ca6-7141-74c0-a22b-4d908839d8e7@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fe8ae105dd15d214@google.com>
Subject: Re: [syzbot] possible deadlock in io_disarm_next
From:   syzbot <syzbot+57e67273f92d7f5f1931@syzkaller.appspotmail.com>
To:     asml.silence@gmail.com, axboe@kernel.dk, io-uring@vger.kernel.org,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+57e67273f92d7f5f1931@syzkaller.appspotmail.com

Tested on:

commit:         0f00d115 io_uring: refactor io_disarm_next() locking
git tree:       https://github.com/isilence/linux.git syz_timeout_deadlock
kernel config:  https://syzkaller.appspot.com/x/.config?x=c01066a8395ef6d7
dashboard link: https://syzkaller.appspot.com/bug?extid=57e67273f92d7f5f1931
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
