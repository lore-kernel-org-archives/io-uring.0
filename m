Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794756178;
	b=RSzvFYVYTUo3Gb6UfFnClZ/MnEzrr9q+w99QTv+EEN9ZM0TWoMFMMJUbbYeHkp8GjK9M
	 80aVLhy8K96jXntM/kdN1rqWwc4l2Q2OPVBxNVDckyYUf4so1lk0XyLmw65Hgfp/nL39c
	 3WgR27zT8U3jnLwdGsZoYSZrvq/xNOW+t2Ejz98z7Nw33GaSuK7z2b7k0smR3nm8zjPlK
	 dQs7jt8hJhSPucqc5klOutfnCu+J5TkoPv7ImkRPnCC9QnUj5FBIFw73Miqp8LhYn4gsk
	 HfTfGIQEqK4C78K0JOvz73oFKh8bTfO2NMCANpcXt/ACygBpoRozIM2KsWsHrtmv1hA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794756178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1+dak9kPwaAumNGN0W2R+Ndio112G9N2RJ9c0aEovgA=;
	b=BOq4IARSw1p2UqOLxww0ROobDmtKGG6uqzz1s+PLEQirf2jjQO/+wEjYNszJ8JkkBP0x
	 NnayLY2mHJVvsVZ/WcuV2fiCNDahLdtuQkWxM+hkIExuNulc0/lj+sWT69jVQR6i/7crc
	 QpouggXv3Iw7DlzBCFp6zSV3WKq1ypfVlLtPzSbfgXFDVly09MY4bE1G9NY8SMuONP+O9
	 MrtBG/ceEvBwROsQ0Y1TFAuqMUTC+V/Ma3oIEHfZTOxHRWHpFgoEeUXABwFmsMuXPfjPl
	 1j0kXFqLNVUcnCSaCgCcvsieUbBieo8xtU8LZrEzVkxkF+pLpqqYfGzhmd4R4rlu7MQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iEEUK2A2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987D8606A332
	for <io-uring@vger.kernel.org>; Sun, 15 Nov 2026 15:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 987D8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iEEUK2A2
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-862b3a39d0dso358631a34.3
        for <io-uring@vger.kernel.org>; Sun, 15 Nov 2026 07:22:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794756176; cv=none;
        d=google.com; s=arc-20260327;
        b=DwK4IM8n8H0s2flM93G7Plzf6HKl61AchrI/Iy03Te9ITX5t+Aq6e+o8lVKzEWsEq7
         LerXqJXVHjwKPXPOtVprU1WF2n4KQs2KgicuTKYME+4h+Qsh5XWBGsXa0ycrQhJVdMWY
         FY8RpeJL4zJfByZsnXfBCdODhYOqVjHyYOjyZKhYGs/E68fzis5qiQJbPwzbtn2AdE60
         6P/Sa25TpiM0nR70ymNpieSkih0jnL/So85qeCvdIMxeS6nWI3OOQLsPTge86YdpWppe
         i1iZOI+GjTH4h6BygtjkghPR1knXAAop5paZP7vztF16q+NNpvOJFqX5Hu9//5ZJJYZh
         BP4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1+dak9kPwaAumNGN0W2R+Ndio112G9N2RJ9c0aEovgA=;
        fh=ZttzoxSi4+YXxoNRHGhlfeKc0hY5KCwpS3NKHUwf82Y=;
        b=W9ly0kIT0iTdlCIh97U6o4/HKLMHuHB3E3ylI71ZfUYdVEu/PbRU54EYOPfXl38zJy
         R6dam9arSVc1YdqajWXMi183Z4Gd2SuX9OPq2ERbLityOjjQe/kbLROothO6YrEV2CII
         TJDQd+KkBGp7zz9gFYpzMe7FZQrHRvZL6j6prqVrbTxQ20BJKmTsnyYOEBIi/9kZ0Zfz
         7e0YKM9B+V/XwHKwf7KajA+tmYKyulBKFKDIdj+4PsT7VQBqvjDpJuJJesaax4hTpEaj
         zqWRC8G5S1pAjudnkdoQB4vxZrDoK4+DuiI66h4Ui5JdBbprycv47NBfDvA2PKJV/+aV
         X7Hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794756176; x=1795360976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1+dak9kPwaAumNGN0W2R+Ndio112G9N2RJ9c0aEovgA=;
        b=iEEUK2A2DP8JgUIrEes5OSUV0XlfawBqRVdOSzK0iTGPiXJnNd3GFNvnJ1pZOqkHSD
         41xk/9EgTFiBfuJbdBMyR4tn9V1Pvg7jKO7q05g0HbVBW+JJiIdeCXGfnQ2Ji4Skptjd
         kuT9U14HGDDoObVU38pqIbBvBpblx2lmvz2bxnNAv/nwUcPCWFvBeBgdGIJKP49Qalm+
         2o9XzH+F2B8sN4Ahax3wYC9Aj+70+6TBuroUEu7rf/5+CKlg3YZFpSCtawbxfGt05IJl
         jqzxC/g0L4JIMaswvOAQlFw1viOWLsahiAm0EttfCToIlDZ7gwXBCIbT88Vnyy5Gk1G7
         eY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794756176; x=1795360976;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1+dak9kPwaAumNGN0W2R+Ndio112G9N2RJ9c0aEovgA=;
        b=TQfzofEGJAgXnUzzAbcekBdzFOQMOWCcGk6ZEdkxBwbsPPj0TbC5NRyrPp7c2xzkp7
         qtUSw2FP4SUv5IjGgFgoR6qN1OxvfLnNnWpmyn2TSTc76u1Lf0zOck0GwJcp7JOCP/cY
         VLIXn4AAv8Dy3pxE0KtOBvqZ83mxcJDW4UovGFZJZq/AbpDReFxOoTWoB8PFygvLHBs9
         S7lud8qC4CYI5SAGmCiWQaMyX1PY/AYbIJ3C8mf8RG+TYBi7AmaSZF+uJ6jOkmsFJGu6
         zwilHA1JqC6WrzdSfLOugA6TEHB3R6hgdH+w3/rOj2VLH36oywCKXN1/qyUWfLAEy7MP
         qS4Q==
X-Forwarded-Encrypted: i=1; AL+hErFoKh1xnazi3C7px+Um7h0cQd9riqDz//vXLG4Nj+7myEbyCtaFvuVWhHvMI45xRuk3pUCf2zS2wg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/XP8uGMT1F5pooBxiNRmoOixo0pbrKbzVB54vbAnyg/l3whgIg
	IN1Q3Rdl1t9Y73XfSPOl/LV4V36oHlD3j0pba+cQmOU6UGroQqxMwSV3K/wFxhYHfQL9T1QYfT6
	PrWP7wVa7D8Qit51T+8zZ+f49omyFulU=
X-Gm-Gg: AYBFou1VJjjjwN+MPvKh3b82Lq8ThG3ZtqtMmJsinf/DnEyZZqL3PD54swVDHLGh9nC
	lc3oyMHhIIF1PgWr0rtrTG831PHTDYURCRc5KnAKYIFaSsugM53sn9JbmtW0IstnJzPicK+AW2S
	GA9XJx8zJWEEdXAAW4xic1atPIboEpT1TQKg+lGmYvFx9mqm9pGaUGmOctl7vDXleT/AGBzqyki
	OhjWpgnWkLF5mAeo7ydIM32ERIEvqySJTq+ZIPdEv3bwbQVykAsfzxU+a+YvQzzc3BlPH5ZYrpE
	4v32guNCW+9k7y+4tIzQEGRgUgRH9uQm92oxnZIHjFmJBEMl9bjnerWxFbkcxmhz0vYlbApA3BI
	TfQE+ACUlJSdLH5lFUp36YON/Tldct0ogAyUtSwYRVprOJdoDIo/J4OelrqxBFF5hu1Z+btCY8I
	dQIm8+xCQpkPaEMVM83Zpj3OHf6C8uwGm+FBz1
X-Received: by 2002:a05:6830:2e07:b0:862:c089:d895 with SMTP id
 46e09a7af769-862c089dbf0mr1013904a34.0.1794756176420; Sun, 15 Nov 2026
 07:22:56 -0800 (PST)
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <6a1694a9.17ccd394.1fa6b8.0001.GAE@google.com>
In-Reply-To: <6a1694a9.17ccd394.1fa6b8.0001.GAE@google.com>
From: Ming Lei <tom.leiming@gmail.com>
Date: Sun, 15 Nov 2026 09:22:44 -0600
X-Gm-Features: AclHuK8-pxaRjyDkZdkJ2W897yja8qZPqsmqLZiMLov3D_UVzwagRhySVd9PH_k
Message-ID: <CACVXFVOMfnBahRrUEMU=3O6onJWAQiEfPdEzFhUrFQ48MRspxw@mail.gmail.com>
Subject: Re: [syzbot] [io-uring?] WARNING in io_wq_put_and_exit (2)
To: syzbot <syzbot+b0d54b9e81de55179e47@syzkaller.appspotmail.com>
Cc: axboe@kernel.dk, io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 1:53=E2=80=AFAM syzbot
<syzbot+b0d54b9e81de55179e47@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    6a97c4d5262d Merge tag 'for-linus' of git://git.kernel.or=
g..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D17a41ea658000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3De327ee9a867dd=
6b9
> dashboard link: https://syzkaller.appspot.com/bug?extid=3Db0d54b9e81de551=
79e47
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for D=
ebian) 2.44
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/5cc8b6debcbd/dis=
k-6a97c4d5.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/649698f0231f/vmlinu=
x-6a97c4d5.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/b297958f355b/b=
zImage-6a97c4d5.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+b0d54b9e81de55179e47@syzkaller.appspotmail.com
>
> ------------[ cut here ]------------
> time_after(jiffies, warn_timeout)
> WARNING: io_uring/io-wq.c:1370 at io_wq_exit_workers io_uring/io-wq.c:137=
0 [inline], CPU#1: syz.1.3756/22484
> WARNING: io_uring/io-wq.c:1370 at io_wq_put_and_exit+0x36c/0x9d0 io_uring=
/io-wq.c:1399, CPU#1: syz.1.3756/22484
> Modules linked in:
> CPU: 1 UID: 0 PID: 22484 Comm: syz.1.3756 Tainted: G             L      s=
yzkaller #0 PREEMPT(full)
> Tainted: [L]=3DSOFTLOCKUP
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 04/18/2026
> RIP: 0010:io_wq_exit_workers io_uring/io-wq.c:1370 [inline]
> RIP: 0010:io_wq_put_and_exit+0x36c/0x9d0 io_uring/io-wq.c:1399
> Code: 00 00 0f 85 7d 05 00 00 48 8b 15 9f 3c 4c 09 4d 89 e7 31 ff 49 29 d=
7 4c 89 fe e8 cf f6 13 fd 4d 85 ff 79 aa e8 e5 fb 13 fd 90 <0f> 0b 90 eb 9f=
 e8 da fb 13 fd 4c 8d 63 08 48 b8 00 00 00 00 00 fc
> RSP: 0018:ffffc900077af8c0 EFLAGS: 00010293
> RAX: 0000000000000000 RBX: ffff888033fdb000 RCX: ffffffff84f4b5f1
> RDX: ffff888030d4ca00 RSI: ffffffff84f4b5fb RDI: ffff888030d4ca00
> RBP: fffffbfff1c81e50 R08: 0000000000000007 R09: 0000000000000000
> R10: ffffffffffffe7c3 R11: 0000000000000000 R12: 0000000100027def
> R13: 0000000000001b58 R14: ffff888033fdb018 R15: ffffffffffffe7c3
> FS:  00007ff97ac796c0(0000) GS:ffff88812446a000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f4b79c90b9b CR3: 0000000037235000 CR4: 00000000003526f0
> Call Trace:
>  <TASK>
>  io_uring_clean_tctx+0x114/0x180 io_uring/tctx.c:248
>  io_uring_cancel_generic+0x7b9/0x810 io_uring/cancel.c:657
>  io_uring_files_cancel include/linux/io_uring.h:20 [inline]
>  do_exit+0x344/0x2af0 kernel/exit.c:916
>  do_group_exit+0xd5/0x2a0 kernel/exit.c:1119
>  get_signal+0x20ff/0x2210 kernel/signal.c:3037
>  arch_do_signal_or_restart+0x91/0x7e0 arch/x86/kernel/signal.c:337
>  __exit_to_user_mode_loop kernel/entry/common.c:64 [inline]
>  exit_to_user_mode_loop+0x8b/0x4f0 kernel/entry/common.c:98
>  __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline=
]
>  syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [=
inline]
>  syscall_exit_to_user_mode include/linux/entry-common.h:318 [inline]
>  do_syscall_64+0x706/0x860 arch/x86/entry/syscall_64.c:100
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7ff979d9ce59
> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f=
7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff=
 ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007ff97ac79028 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
> RAX: 0000000000018ff8 RBX: 00007ff97a015fa0 RCX: 00007ff979d9ce59
> RDX: 0000000000018ff8 RSI: 0000200000009b80 RDI: 0000000000000003
> RBP: 00007ff979e32d6f R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007ff97a016038 R14: 00007ff97a015fa0 R15: 00007ffc1552e588
>  </TASK>

It should be fixed by the following patch:

https://lore.kernel.org/linux-block/20260930042335.16199-1-zcgao@amazon.com=
/





Thanks,
Ming Lei
