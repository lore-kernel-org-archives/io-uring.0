Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9391C433EF
	for <io-uring@archiver.kernel.org>; Wed, 23 Mar 2022 03:25:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239411AbiCWD0n (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Tue, 22 Mar 2022 23:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240832AbiCWD0m (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Tue, 22 Mar 2022 23:26:42 -0400
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3FCF70915
        for <io-uring@vger.kernel.org>; Tue, 22 Mar 2022 20:25:13 -0700 (PDT)
Received: by mail-io1-f70.google.com with SMTP id u25-20020a5d8199000000b006421bd641bbso225218ion.11
        for <io-uring@vger.kernel.org>; Tue, 22 Mar 2022 20:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=4vGMEtGe+BbLjSVih08yohBtZCRt30b9qlDbMhfTRl0=;
        b=lRTwLrdOzoCyNxVgP8LlxLn5x3Mio3FEVv3rGa04ws/bLlqW6c59ciVCjSdYmeSw4/
         PqVFRX8JCfWm5dXrQrV767Tx1wCLCsMLX4Dc9cTTLomTys1aF/XTwNkKGARjNBErIbQ8
         DKZD5OJAzv9f1JFeQoIeDdQt8jxt9mxGyrd3u+HTr9J8A1l8hRTtmnjcuutkDcxr388h
         QlQbQ/K6RI1VlQh2YpF2HFglW9hqxTo+zOLzKPk0gshWx4E2zNpOL32yxGxTj8U5XbdH
         crs4es8PxSchjlAFVK7UsWEfAll5ax7KtNxsoVTYqDULi2upnfkaFC/yj/2rcsJABV+q
         Js6A==
X-Gm-Message-State: AOAM5321hl3QqThu916t1Cv0YOEGVjX8FyehWXjr6p4EtoBpwoytY+Ap
        h9dvRDabOehV89ptuTEHTjFm3QVsQU0IGAi7xyg5nnOzbLPU
X-Google-Smtp-Source: ABdhPJxPmD1OSkA0wPsjR1WGTpH4zf9ZPV9c193YS4y2yCDtYsvVjxIthOQverrG4KJLyuKRpk3Ekb1prWTDh8ldMR24rIqhrGbr
MIME-Version: 1.0
X-Received: by 2002:a5d:8714:0:b0:636:13bb:bc89 with SMTP id
 u20-20020a5d8714000000b0063613bbbc89mr14075565iom.126.1648005913000; Tue, 22
 Mar 2022 20:25:13 -0700 (PDT)
Date:   Tue, 22 Mar 2022 20:25:12 -0700
In-Reply-To: <0000000000000f361d05dacabb09@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000008409805dada47ce@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in io_poll_remove_entries
From:   syzbot <syzbot+cd301bb6523ea8cc8ca2@syzkaller.appspotmail.com>
To:     asml.silence@gmail.com, axboe@kernel.dk,
        gregkh@linuxfoundation.org, io-uring@vger.kernel.org,
        jirislaby@kernel.org, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

syzbot has bisected this issue to:

commit 91eac1c69c202d9dad8bf717ae5b92db70bfe5cf
Author: Jens Axboe <axboe@kernel.dk>
Date:   Wed Mar 16 22:59:10 2022 +0000

    io_uring: cache poll/double-poll state with a request flag

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11819d0b700000
start commit:   b47d5a4f6b8d Merge tag 'audit-pr-20220321' of git://git.ke..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=13819d0b700000
console output: https://syzkaller.appspot.com/x/log.txt?x=15819d0b700000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c44f0c051803a0ae
dashboard link: https://syzkaller.appspot.com/bug?extid=cd301bb6523ea8cc8ca2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=150525ed700000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10d08625700000

Reported-by: syzbot+cd301bb6523ea8cc8ca2@syzkaller.appspotmail.com
Fixes: 91eac1c69c20 ("io_uring: cache poll/double-poll state with a request flag")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
