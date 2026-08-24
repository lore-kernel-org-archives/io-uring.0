Received: from mail-oi2-f1.google.com (mail-oi2-f1.google.com [74.125.231.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3681A74C14
	for <io-uring@vger.kernel.org>; Mon, 24 Aug 2026 12:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787574163; cv=none; b=sIl6B6cMsCTMYHa9h4//IzRVbwAI5KlY6uRpBf5ClXCpvEs+qq+3zltFnjI7NzXEE9FgUxQv0m125IoZtxE3sH1mhwQ4rwMGTqj1Roj4bfd5dWWPQwv5taEvdB30ij25Ahz7swV5cGxDHjWFDNOEBm0qNDTZXvudIF9z34M5nCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787574163; c=relaxed/simple;
	bh=xlOpud7xtGYeKvVg7J9HvnhE1+yooERTngPsG//M2AY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=VKEuA5c9TD0Px+M64aFT1jIrFeqcaoNdtGF8jtQoA5nnYQR+p3pWMd2wUkeDF0hglalJLhmE5xsX21bnfsmGaeK5TdidLTGi3uDT1lTYZ9McxixowUwwsfkWwD5dA6jpt6MPeZTFieJqR8n5xQkk8ZuUpTp2mWMBXNPxqn4zbg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f1.google.com with SMTP id 5614622812f47-4960b753d6fso1256631b6e.0
        for <io-uring@vger.kernel.org>; Mon, 24 Aug 2026 05:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787574161; x=1788178961;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i3OpGxcFxR2SRwpv+1IUOBNl7T7ZVe7kG2ziCDNh6vU=;
        b=K5WrrVPq76IdLt+FJETBwZ7sEcrmQOyO7+w76WQmYn2tPvXND5fKUdtbd3IizdnPE7
         hl1aTlyHXENuD6ix51oNBPd8XrjclYzQNDGwXPiNYBhwbAaSSUgYMWN6HcJgwGM6nHH1
         5DXQET58gjGHwYAmX3ZAK3CMqU/itbnDFXFr0yCn9z1CrMLBxZCzIVBW7HcJ8qtmNgY5
         hlg4eTmGEJzS2y0+m1whjcOJSpqNacoxJL9GMVJtAe19+Lajc0CT5tZXqEuMeoTsDPoF
         T4rj+Q8wA5k6pgspMRsGnzol3f7lz7wmIq2GdFWSIsiFUGsmVIXe6W6umzTAsYJ3ehbf
         z6wA==
X-Forwarded-Encrypted: i=1; AHgh+RpCh6XxRnG4jBygHhDdolvtbhWl5r5RNt0uz3pRO/u+dAuNzwcVDoKIUTL+LZhlVT3KYrgOrmWLLA==@vger.kernel.org
X-Gm-Message-State: AFuF++kETj6RHohMpoNPbnewgMuQprWSqEuFCaOp+vOySyeefVx4HmRz
	C9YSEDywufGE1vZKBNxZhnfL6Y++at+dxoUPnodO1q0KuJMcJyBBbW1bxhsetKoW1oNvGgslP5D
	ZTKN239STIVpMqOZFolu56wtTPNcodPeHmfdB4nBtzznVE3kMqPrdrNRcC7g=
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:308a:b0:497:df42:1e04 with SMTP id
 5614622812f47-4b2ef4d45f6mr24656223b6e.18.1787574161096; Mon, 24 Aug 2026
 05:22:41 -0700 (PDT)
Date: Mon, 24 Aug 2026 05:22:41 -0700
In-Reply-To: <0000000000008441e70611f52901@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8c3791.ae6ddae5.3da009.007e.GAE@google.com>
Subject: Re: [syzbot] [io-uring?] WARNING in io_ring_exit_work (2)
From: syzbot <syzbot+557a278955ff3a4d3938@syzkaller.appspotmail.com>
To: asml.silence@gmail.com, axboe@kernel.dk, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    4352b8aee980 Merge tag 'i3c/for-7.3' of git://git.kernel.o..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1369b179580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=335632b21d0ce540
dashboard link: https://syzkaller.appspot.com/bug?extid=557a278955ff3a4d3938
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=139f3549580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/8491c9d0d35e/disk-4352b8ae.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/51cc3aee80d1/vmlinux-4352b8ae.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e0bcbebdbede/bzImage-4352b8ae.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+557a278955ff3a4d3938@syzkaller.appspotmail.com

------------[ cut here ]------------
time_after(jiffies, timeout)
WARNING: io_uring/io_uring.c:2356 at io_ring_exit_work+0x4d0/0x9a0 io_uring/io_uring.c:2356, CPU#0: kworker/u8:7/1002
Modules linked in:
CPU: 0 UID: 0 PID: 1002 Comm: kworker/u8:7 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/05/2026
Workqueue: iou_exit io_ring_exit_work
RIP: 0010:io_ring_exit_work+0x4d0/0x9a0 io_uring/io_uring.c:2356
Code: c6 05 c8 2a 38 0f 01 48 c7 c7 80 aa 6a 8c be 25 00 00 00 48 c7 c2 60 a1 6a 8c e8 cb 03 78 00 e9 70 fe ff ff e8 f1 41 9c 00 90 <0f> 0b 90 b8 70 17 00 00 48 89 44 24 38 eb 9a c7 84 24 b0 00 00 00
RSP: 0018:ffffc90004c3f940 EFLAGS: 00010293
RAX: ffffffff812aeb8f RBX: 0000000100003abe RCX: ffff888026cf8000
RDX: 0000000000000000 RSI: ffffffffffffffff RDI: 0000000000000000
RBP: ffffc90004c3fad0 R08: ffffc90004c3f8c7 R09: 1ffff92000987f18
R10: dffffc0000000000 R11: fffff52000987f19 R12: dffffc0000000000
R13: 0000000100003abd R14: 0000000000002000 R15: ffff888030d88000
FS:  0000000000000000(0000) GS:ffff888124cf3000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffc968890f8 CR3: 0000000082816000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 process_one_work kernel/workqueue.c:3387 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3470
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3551
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
