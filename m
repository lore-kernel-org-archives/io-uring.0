Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794756382;
	b=zqB67q51elkHdfxZtuWmtmlJw7KmBVDNK6OWblwZvJr1IQHhiqSSnECOoeZa8DsBjaQ+
	 Hb5p2c4+OYHaoZ6kfq5GGEUvlJxgAoVbpSb5aVuY7XFYKIpAfU7XDj47qByfRZcaxdQUl
	 0bW6gOHn6Bsb5Cq/7kjP1bm+LYoVWtKEJOS5BWVio2h5OjglLrbXse7cEp6sDKhkMQ25b
	 GkYVnO6/AKIPo3LrUt9FGcYI/OF98N4DBOdkXaH8NGOuAlcKGYlwMIyri5LSdDipPhMof
	 mtI9tRTsJ0O3CW5H6pW5/mAcdwx02lMkQGBQvNtqkS+uURFEy5DVPg/PFrzCq2kVwNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794756382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=uDW7tcDT0CM8/ssvcSccTXT/PC8BfbsqfznWdH/SvDs=;
	b=niUSPABn2kAZyupvo1n1wqq0a4r7+dW+jrqfS+9MERw+8Zo/Mj6M9V5QHQ4fcF+2dSob
	 1iDdRBqWatnu1UScj3jZZbCgZRGH2Tv9sx6LQcQrRTC8TTOl8H0UcIlhaw8GfC6irs1+q
	 ePRJ4lsHdegEdgrZMcNepJ0qPMILlVqffjf/rlimlzcXGM4VShNYK86nubKknW5B6DQXS
	 ETGult32sdYHB9R88aJmjfiLjR1/4ungDZ2+cLqpfsUtXVJ4/lqapT/zdKmMGCR3JjBby
	 TCGgnMODOLKpE07eWom+RIk6ksU7sE/RypDcvVpe2iDOqFNXBFMo5Nk1RnkYpQ7ZHng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="A5l5/rzc";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5F6606A31A
	for <io-uring@vger.kernel.org>; Sun, 15 Nov 2026 15:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D5F6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A5l5/rzc
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36dbde64409so3878366eec.0
        for <io-uring@vger.kernel.org>; Sun, 15 Nov 2026 07:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794756381; x=1795361181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uDW7tcDT0CM8/ssvcSccTXT/PC8BfbsqfznWdH/SvDs=;
        b=A5l5/rzcYj2Ou5Njd5vTMjnr4GQZJm94H+CRn/EhR1+yTyEQEmhePxkj/wzhco2kaj
         67tsAJf9sdvWhRhMmXzrf0HQ/Vz/FNJpdmMM1IL/+9hJSYMjTEwojuwP5VbLoGCIFeKm
         Ad97b/w4VnQLNlNCz0t38o5p/4th8s4oursZuk11hPIY8s9hY7v/IiIlR4FBgIdszc7y
         DQb9gP3eWPB6wh/irgiw0jCgYAaeTQFe7igAnhVVAuDh7xkO60EvRqktN4Qfm/1hL0Lh
         mPaRf/qvWxv+nLZF+54Ot+xkQOutXYwGgHG/x2XnMPhqudKFnihdwX/KID1ueUbWjNsQ
         zT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794756381; x=1795361181;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uDW7tcDT0CM8/ssvcSccTXT/PC8BfbsqfznWdH/SvDs=;
        b=EW0Kmu/SM14eEpwnwN5DEITEdc6M5cYYZMhT86nQsVCiQIoera/N3w0DDAGwr3gpHy
         bwCdfm+N+BSekstU6OPkGEY4SME7GA6TKGr+x8s1FjM3zo2z01WBiCHslt+t9iYqKaah
         5dGdDe7rmeYsyrQReOLxqHyr8oQ7RqMF67j1f4QBPm0i7g0n3iXpfPqAgEKjRDuoxXkB
         gIHubhxbeL4nqeBF3eh7iA5N4SlU0T6G5XuXDD0u9/XyfuVnor3Sw0yNtQcuyvoyunvx
         K5MwPRf9pWg/N87CIbTd8iqk0Q/K/0u4cuO1zRbzLRIgjgDjLq2v72qGWbb5hS07Qycl
         3U4g==
X-Gm-Message-State: APuU4Z/JK0uWglE5YSFRKPiRZYhzdS2nBMlc7djm+YdG4iCIh9TN5QME
	da9BZJAn7hfPvvX1De5pUToJtZt4K1KdKwzy5HpabUXdmXaYafkRC7iZ83evBQtMBU0=
X-Gm-Gg: AYBFou3wg9n5C0HuTl844MgL1lcw2BZnxCYIldeXOPubnqOe1f2J8tov4aAnc2biyU7
	JvWj7Xo3oaSbWkEiBE0xtqB3jnXX2KmwhtiiSNdxoSrrQNrIVgoeHwuxHpQnQNn6ZKLV2pI8pg7
	D6fg1w0nsO2qAt8lagvM9m6vA3f2xc3MkgJV6ibuvAvOwddMwUZ/gVMKHuIf1ZikJ3WsOZtcmaG
	L8xKFbQQfwX0Wy5DRjd2fg7AL6AgpghX2s9D/11kfhdzlHSFgjeC72l1lJYRXu+FR1k0q4i8GUN
	qGkRJWg5t/Aiye7UP3ZYrv9HvLMqRSUM8KXHa3K0l+hfb5HXj0FGBWFL0bmbwBQNYReA4kqvH2C
	vTjUQY6S2dal7YlZpIuE0V62TPBbFqwPHoxGy9CZHicvDpNP1wRxklDYL6m4mOKxj8PwH8OQLtK
	IqshjJHq0ptfHI1jvkrZQYg6nWsPFKDzs4z3vTTigZAB8mSWpBVkkG8w89Vt1Z30wKM6qKu/+wb
	wjjiVBdv99q29TSmw6+mBAXGDZOQDN3Q8Kk5TIESXDV4yApzqZ2s1KWaIV4/3kzSa/swE1r+cJp
	FvTOaBrxU2FTKDMMTTQCWb8psg6z3dgVQ5W/8zpL0378EfEtpjGXd/FMoEZDKzym5htYlRzbmAK
	sBe9HjzeH9Pdsww==
X-Received: by 2002:a05:7301:1705:b0:36e:c9e5:33aa with SMTP id 5a478bee46e88-37965f9ea5bmr7519027eec.13.1794756381407;
        Sun, 15 Nov 2026 07:26:21 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm27367007eec.28.2026.11.15.07.26.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 07:26:20 -0800 (PST)
Message-ID: <0af690bf-71ab-4c77-9738-7d94b2d26426@kernel.dk>
Date: Sun, 15 Nov 2026 08:26:20 -0700
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [io-uring?] WARNING in io_wq_put_and_exit (2)
To: Ming Lei <tom.leiming@gmail.com>,
 syzbot <syzbot+b0d54b9e81de55179e47@syzkaller.appspotmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com
References: <6a1694a9.17ccd394.1fa6b8.0001.GAE@google.com>
 <CACVXFVOMfnBahRrUEMU=3O6onJWAQiEfPdEzFhUrFQ48MRspxw@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CACVXFVOMfnBahRrUEMU=3O6onJWAQiEfPdEzFhUrFQ48MRspxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/15/26 8:22 AM, Ming Lei wrote:
> On Wed, May 27, 2026 at 1:53?AM syzbot
> <syzbot+b0d54b9e81de55179e47@syzkaller.appspotmail.com> wrote:
>>
>> Hello,
>>
>> syzbot found the following issue on:
>>
>> HEAD commit:    6a97c4d5262d Merge tag 'for-linus' of git://git.kernel.org..
>> git tree:       upstream
>> console output: https://syzkaller.appspot.com/x/log.txt?x=17a41ea6580000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=e327ee9a867dd6b9
>> dashboard link: https://syzkaller.appspot.com/bug?extid=b0d54b9e81de55179e47
>> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
>>
>> Unfortunately, I don't have any reproducer for this issue yet.
>>
>> Downloadable assets:
>> disk image: https://storage.googleapis.com/syzbot-assets/5cc8b6debcbd/disk-6a97c4d5.raw.xz
>> vmlinux: https://storage.googleapis.com/syzbot-assets/649698f0231f/vmlinux-6a97c4d5.xz
>> kernel image: https://storage.googleapis.com/syzbot-assets/b297958f355b/bzImage-6a97c4d5.xz
>>
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+b0d54b9e81de55179e47@syzkaller.appspotmail.com
>>
>> ------------[ cut here ]------------
>> time_after(jiffies, warn_timeout)
>> WARNING: io_uring/io-wq.c:1370 at io_wq_exit_workers io_uring/io-wq.c:1370 [inline], CPU#1: syz.1.3756/22484
>> WARNING: io_uring/io-wq.c:1370 at io_wq_put_and_exit+0x36c/0x9d0 io_uring/io-wq.c:1399, CPU#1: syz.1.3756/22484
>> Modules linked in:
>> CPU: 1 UID: 0 PID: 22484 Comm: syz.1.3756 Tainted: G             L      syzkaller #0 PREEMPT(full)
>> Tainted: [L]=SOFTLOCKUP
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/18/2026
>> RIP: 0010:io_wq_exit_workers io_uring/io-wq.c:1370 [inline]
>> RIP: 0010:io_wq_put_and_exit+0x36c/0x9d0 io_uring/io-wq.c:1399
>> Code: 00 00 0f 85 7d 05 00 00 48 8b 15 9f 3c 4c 09 4d 89 e7 31 ff 49 29 d7 4c 89 fe e8 cf f6 13 fd 4d 85 ff 79 aa e8 e5 fb 13 fd 90 <0f> 0b 90 eb 9f e8 da fb 13 fd 4c 8d 63 08 48 b8 00 00 00 00 00 fc
>> RSP: 0018:ffffc900077af8c0 EFLAGS: 00010293
>> RAX: 0000000000000000 RBX: ffff888033fdb000 RCX: ffffffff84f4b5f1
>> RDX: ffff888030d4ca00 RSI: ffffffff84f4b5fb RDI: ffff888030d4ca00
>> RBP: fffffbfff1c81e50 R08: 0000000000000007 R09: 0000000000000000
>> R10: ffffffffffffe7c3 R11: 0000000000000000 R12: 0000000100027def
>> R13: 0000000000001b58 R14: ffff888033fdb018 R15: ffffffffffffe7c3
>> FS:  00007ff97ac796c0(0000) GS:ffff88812446a000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 00007f4b79c90b9b CR3: 0000000037235000 CR4: 00000000003526f0
>> Call Trace:
>>  <TASK>
>>  io_uring_clean_tctx+0x114/0x180 io_uring/tctx.c:248
>>  io_uring_cancel_generic+0x7b9/0x810 io_uring/cancel.c:657
>>  io_uring_files_cancel include/linux/io_uring.h:20 [inline]
>>  do_exit+0x344/0x2af0 kernel/exit.c:916
>>  do_group_exit+0xd5/0x2a0 kernel/exit.c:1119
>>  get_signal+0x20ff/0x2210 kernel/signal.c:3037
>>  arch_do_signal_or_restart+0x91/0x7e0 arch/x86/kernel/signal.c:337
>>  __exit_to_user_mode_loop kernel/entry/common.c:64 [inline]
>>  exit_to_user_mode_loop+0x8b/0x4f0 kernel/entry/common.c:98
>>  __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
>>  syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
>>  syscall_exit_to_user_mode include/linux/entry-common.h:318 [inline]
>>  do_syscall_64+0x706/0x860 arch/x86/entry/syscall_64.c:100
>>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>> RIP: 0033:0x7ff979d9ce59
>> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
>> RSP: 002b:00007ff97ac79028 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
>> RAX: 0000000000018ff8 RBX: 00007ff97a015fa0 RCX: 00007ff979d9ce59
>> RDX: 0000000000018ff8 RSI: 0000200000009b80 RDI: 0000000000000003
>> RBP: 00007ff979e32d6f R08: 0000000000000000 R09: 0000000000000000
>> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
>> R13: 00007ff97a016038 R14: 00007ff97a015fa0 R15: 00007ffc1552e588
>>  </TASK>
> 
> It should be fixed by the following patch:
> 
> https://lore.kernel.org/linux-block/20260930042335.16199-1-zcgao@amazon.com/

Not the posted reproducer, that has nothing to do with ublk. But yes you
could certainly make one with ublk as well. In practice any of these
"exit is slow, use WARN_ON_ONCE()" will always be triggerable, as the
fuse case in the reproducer. That doesn't mean that the above isn't a
bug and should not be fixed in ublk, just that it is an instance of
something that can trigger the slow exit WARN_ON_ONCE().

-- 
Jens Axboe
