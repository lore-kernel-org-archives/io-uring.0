Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723998;
	b=j6kbajITdpNzeS38JMGTegNK8zM0rhsd9192/rnp10i7uSV/Kdxj4AEkH163yIefK+/F
	 IChb+3FBJvg79RxeYOo3yIO9yoh3M4IqGomxbsF73QV18t34+NjmyVL6p6LhUMx45miTh
	 BQ6znU0InYVAp6v+Yl08gJtZUv4ptMa96odkNl8ii4OYU+QzWkHFBhflmqzhiI6p4B7xx
	 OYxkC7AADdujOuX09hYnl8L99X9zv53V90AHHja4TcpjPz6ROzOqrylhPXqndmh8Gedl8
	 BfA5UZpj4sLuloepRcQ4nQlwBxZT4Lj9vHt6UfM4JNj7NdhScAAoJnrJb1mWElURCqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723998;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=tidyCoyZe7LKo8H4SlVqrvVHfH/8nEUqM91aapDHdu0=;
	b=ma1i5q+yYt990Bw4JfhjRAcXvyC2brF6voJMeJyQKodLEOkm4A1on0FiBcyJrWpgeBcF
	 w669Z1Sb+OHQV0JCOPHETYCdYg31sLdpGYMsT+z7Y7afLJRhhyUQH0TWtLbNeqKCxysu3
	 3BkOje2qwpOSchG9DDCb6rEIKe3rNmSqCrASDK5gky5afFwOs+m9w3XXDAjFGyyGL7WEV
	 kv8xV6A2DZXaDJLtx+GJNkH5ajqv4+D8JZLHd7Y49wg+tMBH/bSw8EB5W7jv/n9eszviZ
	 ZOkESAKj+n5wHeTQ7KieszGA7ZM9aJGAu+4RCvoJxffMtHml7w6aXA4en9+a3bJzwQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8868606A32E
	for <io-uring@vger.kernel.org>; Sun, 15 Nov 2026 06:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8868606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-568249fbf5eso2928740b6e.2
        for <io-uring@vger.kernel.org>; Sat, 14 Nov 2026 22:26:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723996; x=1795328796;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tidyCoyZe7LKo8H4SlVqrvVHfH/8nEUqM91aapDHdu0=;
        b=W/7m/wvkSI1vRgRQUc0f7ZjvlkTCLIURqgnBa6JeEKcENYpkIKmlnoE3oj1KjlD271
         CZ0VVwWvl22U+2nxvILY/KK5H7O8SDAwGzbYgqzHQLkNAIRKDxxFohZmztbP7YZXkE6b
         RoSvlcE99w1YvpdDTzfXizAZjAZ82g8e5ljayXSlUbTQ940AJt0t49wbFwFY8o781/hD
         tlvZ6v9GsBuDmUPEZEiUwT7mAP1ijEG6773kvVDHvWPvgsh7V/gBZfzNrrgeTdrDmZSi
         m1DV5HlFjDPeEDRLpTMh3/dOlGGG3gJ3/DXyFSeq2HreXRAKNMANJagAOKE5bTxHFxKR
         RVYA==
X-Forwarded-Encrypted: i=1; AL+hErEL5VqtYhtQHNTwsezoTMtTFOUV2vMItWk5z1bvgkV/blD6mCzANkM/2UfkFy3brbsGbgfnjhdheQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+4Og/7rqc8FIpdDfYU4cfiuGWqVuwzep2/oa5vRDBK1N4wlh85
	AIcUOuPdTpS6jWrWwZOt+tWWS0X5vA9Gjd2F7eYx6KSUvuEo6qXVa+likf7D+WSC9pRqMYg9Gzo
	CgE8U18PBoXIcxjCozC2ehfrCRHlemUFrIWkMKpZeYmka0JnifAz02zfzaQ0=
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:17a1:b0:4d6:9222:99f7 with SMTP id
 5614622812f47-56e64ce3fa5mr6534838b6e.55.1794723996655; Sat, 14 Nov 2026
 22:26:36 -0800 (PST)
Date: Sat, 14 Nov 2026 22:26:36 -0800
In-Reply-To: <6a1694a9.17ccd394.1fa6b8.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af9509c.07d0a7c9.39b765.0026.GAE@google.com>
Subject: Re: [syzbot] [io-uring?] WARNING in io_wq_put_and_exit (2)
From: syzbot <syzbot+b0d54b9e81de55179e47@syzkaller.appspotmail.com>
To: axboe@kernel.dk, elzeigel@gmail.com, io-uring@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel@vger.org, syzkaller-bugs@googlegroups.com, tom.leiming@gmail.com, 
	zcgao@amazon.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    aacb77975041 Merge tag 'ovl-fixes-7.4-rc3' of git://git.ke..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1105ee3d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1cf189394a856f11
dashboard link: https://syzkaller.appspot.com/bug?extid=b0d54b9e81de55179e47
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1093cb69580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b0d54b9e81de55179e47@syzkaller.appspotmail.com

------------[ cut here ]------------
time_after(jiffies, warn_timeout)
WARNING: io_uring/io-wq.c:1482 at io_wq_exit_workers io_uring/io-wq.c:1482 [inline], CPU#0: syz-executor273/6014
WARNING: io_uring/io-wq.c:1482 at io_wq_put_and_exit+0x372/0x9d0 io_uring/io-wq.c:1511, CPU#0: syz-executor273/6014
Modules linked in:
CPU: 0 UID: 0 PID: 6014 Comm: syz-executor273 Tainted: G S                  syzkaller #0 PREEMPT(full) 
Tainted: [S]=CPU_OUT_OF_SPEC
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
RIP: 0010:io_wq_exit_workers io_uring/io-wq.c:1482 [inline]
RIP: 0010:io_wq_put_and_exit+0x372/0x9d0 io_uring/io-wq.c:1511
Code: 00 00 0f 85 7d 05 00 00 48 8b 15 e9 74 8a 0a 4d 89 e7 31 ff 49 29 d7 4c 89 fe e8 f9 fd d7 fc 4d 85 ff 79 aa e8 4f 03 d8 fc 90 <0f> 0b 90 eb 9f e8 44 03 d8 fc 4c 8d 63 08 48 b8 00 00 00 00 00 fc
RSP: 0018:ffffc90003abfb10 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff888038fb1000 RCX: 0000000000000000
RDX: ffff88802b0d2580 RSI: ffffffff85367db1 RDI: 0000000000000007
RBP: fffffbfff1f81e50 R08: 0000000000000000 R09: ffffffffffffd785
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000100001f9b
R13: 0000000000000064 R14: ffff888038fb1018 R15: ffffffffffffd785
FS:  00007f00678c46c0(0000) GS:ffff88812246c000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffe270457d0 CR3: 0000000023abe000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 io_uring_clean_tctx+0x117/0x180 io_uring/tctx.c:261
 io_uring_cancel_generic+0xa9e/0xb00 io_uring/cancel.c:771
 io_uring_files_cancel include/linux/io_uring.h:52 [inline]
 do_exit+0x344/0x2a00 kernel/exit.c:920
 __do_sys_exit kernel/exit.c:1090 [inline]
 __se_sys_exit kernel/exit.c:1088 [inline]
 __x64_sys_exit+0x42/0x50 kernel/exit.c:1088
 x64_sys_call+0x156c/0x1570 arch/x86/include/generated/asm/syscalls_64.h:61
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x7b0 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f00678f9a99
Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f00678c3fd8 EFLAGS: 00000246 ORIG_RAX: 000000000000003c
RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 00007f00678f9a99
RDX: 00007f00678f9086 RSI: 0000000000000001 RDI: 0000000000000000
RBP: 00007f00670c3140 R08: 0000000000000000 R09: 0000001000000008
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f00670c3004
R13: 00007f006796b0e5 R14: 0000000000000006 R15: 00007f00678c40e0
 </TASK>
