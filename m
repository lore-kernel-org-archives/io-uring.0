Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7401B32D9
	for <io-uring@vger.kernel.org>; Thu,  1 Aug 2024 17:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722535024; cv=none; b=i91tfGyuSqYRmTOJFMjCv4ybP0QfRcUc5v433RD9anDeqfJsej1kD38hIv4wWVbWqUzVrgnkCw8/FKRYXUoKD+0RC8Ep6HdV7sou4IIso+kWRkTcI4G80UiLxV0/knbW/ZdaPLfCIuVlZcNyPIn+4az/oOoHqBYJq63YFbS2pCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722535024; c=relaxed/simple;
	bh=tJFIaBPD3I1wF4aHwSiNr+L20nlaburnRO2nkOdfKSU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=f+eVk/ulLq9WEBw1nYS3i+UgGndVjxVriAwhXqtHzHonHaK6J0GVWrvoZD49dXIo2lImiAud6iER9xOwZfyl5gsyoQ23oSRP0LdIP5jA0Np2K3OxNw8eqOnpEQl8Y6Iya5UO9j2/etnlgXutXkIHlxgxPghEfVzB6YMt4SvBfk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3988d01a236so118477005ab.1
        for <io-uring@vger.kernel.org>; Thu, 01 Aug 2024 10:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722535022; x=1723139822;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uTvoqCovkIf0M2Cb6BMo+BCs3j2PCLmCnlJnFySAEuI=;
        b=X3mW+9FnXPl4JG3E2ZjycEg5CzmE8H9jv2GWfK90u64fL6Fch4y6sMlFiGXRzPBnaF
         4MSZALJzhhtv0Gm+EZ5CqTQlK9l/WRJS3sEHVzNG8cxdyIUdY990YajMc5fFanRwY+Dt
         0WNeRQMFL8HDbelrrr/AmgeWS5HNcmOqLPHwHoEWX9DW2Ulw/4+JwXGuRttaOK+eviba
         mG6BM3TjctLiBrADygurTzf09CbeGSQm5r2f+V0DoAaa7nuEHfQ0yeN8UYOjcLU5P2Fn
         iQjLPuAwCotuD9xYkaASYoUklxK59SAfkOfACSHnMMVZQZANe4NHUibsopn7OHvwolvn
         Cyxg==
X-Forwarded-Encrypted: i=1; AJvYcCWsge1p8qOJoInyijfA/vfcsV0+Qrll7TrtG/w4QqPTPiXrfV+8c4FEebTjpDJW8Ja0r47M2225ICTMOcf0R0aw9DmouVbzF54=
X-Gm-Message-State: AOJu0Yx0h95tJ0UfejQs8t4t85ebfIf/qlXcvwiFuULb7YMwwSPBBEwL
	YQYKQIoTDH3KrX+GUCf0WaGHa5UjnWeB4GdwIMGSlKYtQQ//62Uudeb0XgvYix8IOVSkWRCx0/I
	xxxvd/Nk2f3+MT+khwf7ZnOwvL8SrsUGkifQepWmN0MFDTSI06Y1zoHY=
X-Google-Smtp-Source: AGHT+IG4+l9yii4CrFynQQ2hbUHkXbJgIIR9UdDoQpQ0Rjl3tIPbc90HCRWBdObkYeE9g75Vy+bDJ7fX//eKFTd3xnOH+raYAhFr
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:15c3:b0:39a:e8c5:ba1b with SMTP id
 e9e14a558f8ab-39b1fc6cfa8mr553325ab.6.1722535022414; Thu, 01 Aug 2024
 10:57:02 -0700 (PDT)
Date: Thu, 01 Aug 2024 10:57:02 -0700
In-Reply-To: <0000000000006923bb06178ce04a@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001fdcda061ea2f073@google.com>
Subject: Re: [syzbot] [mm?] WARNING in hpage_collapse_scan_pmd (2)
From: syzbot <syzbot+5ea2845f44caa77f5543@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, axboe@kernel.dk, borntraeger@linux.ibm.com, 
	david@redhat.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	io-uring@vger.kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, pbonzini@redhat.com, 
	peterx@redhat.com, shuah@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit ef5b6a542b1dbb718226a5f8208be09ef405983d
Author: Paolo Bonzini <pbonzini@redhat.com>
Date:   Wed Nov 8 09:40:35 2023 +0000

    selftests: kvm/s390x: use vm_create_barebones()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14071cd3980000
start commit:   e67572cd2204 Linux 6.9-rc6
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=16071cd3980000
console output: https://syzkaller.appspot.com/x/log.txt?x=12071cd3980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3310e643b6ef5d69
dashboard link: https://syzkaller.appspot.com/bug?extid=5ea2845f44caa77f5543
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10874a40980000

Reported-by: syzbot+5ea2845f44caa77f5543@syzkaller.appspotmail.com
Fixes: ef5b6a542b1d ("selftests: kvm/s390x: use vm_create_barebones()")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
