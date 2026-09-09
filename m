Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A922550DB1
	for <io-uring@vger.kernel.org>; Wed,  9 Sep 2026 12:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788955988; cv=none; b=HTx+TOwLMzt/yGMkksp7oe8fF8axwSIX+ZLAxYnu05/O+tvMRNmdzcSOMpHSn4osUur9juN8l0elRCq+P4Mu5mjOqTJ78fgwzwf+IEP726SRBFyxxJlhf2lWmuUXs4EVFDHeUyJXItf41/LfB9lhjPOkj27G+xDlb0RlO4bbCUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788955988; c=relaxed/simple;
	bh=YgpBxgo5YofLBw4A7X3QhxHUmNkjqC1fwunjTx+7hIY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=fjY4Ygs14lkL5r58a8H6/ydwALkw2MLfdpJi4xafUi4hgGA05zbSaBqC4UOVAOrSr+TtagF4JSYgpW39gHNr1XHWofP8T7EFQNzamQLEbRFnryBGkjlgswqbuoDdtiELYhIR8W4cz1j8TkXJf32XXdyh/JHMm8GVd0Rxn7UmbjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6a313ec13ceso7023121eaf.2
        for <io-uring@vger.kernel.org>; Wed, 09 Sep 2026 05:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788955982; x=1789560782;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UvYP6Qzj931TtA4FMiDKHWlI/21Br1rJ1AJggB3Ijk0=;
        b=g4/7aAdzyY9O5szIEWQ+QC2yTeerUktPIcoNrVyFbaLziOKlMTpHEqMOI8E/bk/1j8
         lMRocawd2ZfqNeBiDw+uWSV4WZ0N1RfYPWmsUvU0PWiJlTGPUgtLeBN7Cl1w4mEHmANw
         u5//sow1t2MqKQbG9boeDDsKIUEgfLTO32guF1gEkjWGo76UbpE1sX0pGLMPJ2+7VlU6
         wD1pHjGuy2L+XPx/1L8X2ZpvJmUQgE987sBO03o1StGZPr+Qq9g+5gCWvuCHKug7zUZb
         t7OGS7v08CY1jRDSTwuklSe1im0kACzc4uvjh0KqT4IVv7NqlX/+KFHfzQjVvazU6zGK
         rgSg==
X-Forwarded-Encrypted: i=1; AKwUvByR64yoj2kUmr3MVC7fmm6q56emIZyETT47Ehg5sxA/YdDMBrESFkb1i9r4SS1Gm1S7QuTkocisPQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nRGu2pVd4HagGsKNmVa2O+borH8VjaMBjeyC5Q/AT5Ldeiv7SS
	ARKMklNp/sA0LziBCN5a5bm6LlDSggdvXcGzSf/EGVEVM7vET6B4UkrY0NUBE4/GpHFv97z3wAy
	nCUbQUD0t7gQnYzLQdAwXwqNOSeZYzWyX206PvvTq+Bax44BQWFB8RrGvZQo=
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:3106:b0:6b1:39b1:80ee with SMTP id
 006d021491bc7-6bee53998d1mr631749eaf.24.1788955982411; Wed, 09 Sep 2026
 05:13:02 -0700 (PDT)
Date: Wed, 09 Sep 2026 05:13:02 -0700
In-Reply-To: <05177a9e-111c-4595-a7ef-d3de398f0a85@kernel.dk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa14d4e.f2639fcc.29487d.0003.GAE@google.com>
Subject: Re: [syzbot] [io-uring?] [ext4?] INFO: task hung in io_write
From: syzbot <syzbot+2eb3d983669d3e49d4fa@syzkaller.appspotmail.com>
To: axboe@kernel.dk, io-uring@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+2eb3d983669d3e49d4fa@syzkaller.appspotmail.com
Tested-by: syzbot+2eb3d983669d3e49d4fa@syzkaller.appspotmail.com

Tested on:

commit:         57ab5080 io_uring/io-wq: don't trigger hung task for s..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git syztest
console output: https://syzkaller.appspot.com/x/log.txt?x=127b7af9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=679ea3cb74b430f3
dashboard link: https://syzkaller.appspot.com/bug?extid=2eb3d983669d3e49d4fa
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
