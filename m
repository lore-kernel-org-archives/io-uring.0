Received: from mail-ed2-f39.google.com (mail-ed2-f39.google.com [74.125.228.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B30F439F98
	for <io-uring@vger.kernel.org>; Tue, 15 Sep 2026 19:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499362; cv=none; b=GCm2qo/Gzm8uoCeSJVuLyTrNniIGeiC3rgvnf7UsPtKsao09XBHq1nhnIDDnbA9ten1oDomtMLK2ta93tZ/dTNt1TNZnhfwDRMa7l+4LtIwYWw+uWmgP+W4g5zG+o7Je9Ncn1Xb+YE3eDBUGGIDf83/mXBvqQ/P7EucC4xbxm7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499362; c=relaxed/simple;
	bh=AGk4y8oFpNibhByHKIxcRS7KnQx6z20Q8VC6dFl1tNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ueEXYuHZE8K9zaXgJuqxna6HtsXXaNQaJ2vMrGXlxtD3DTTYOrQP/Y2aXuuXTHli6vOGbKWxIxf0FZU6j67WVx46D5/ywYiv7/lAWUaQTxvH4NTXHH6VGNTFHOpWMX1EAWY/ogwn4Jkm/iOVD1cOGyNBn7xNptbJUQnXQUA41o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CSrtt9Un; arc=none smtp.client-ip=74.125.228.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CSrtt9Un"
Received: by mail-ed2-f39.google.com with SMTP id 4fb4d7f45d1cf-6aa0ee64afdso275825a12.0
        for <io-uring@vger.kernel.org>; Tue, 15 Sep 2026 12:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789499357; x=1790104157; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XFFk9jJtDswBQpA8QWIooO6lLG4HdlvPT/LqykRjG+U=;
        b=CSrtt9Unpbm2RA3J8D1Piu8PqBvT7/aa/KZ5CE3c3D++Q65F+8LC8PQhJ+YAQkLRZF
         FOCbEfcedihMauvO8i4QEZYDfsgCMc/AU6Y/5BuRF/k4i643ZbHqsUyNas20hZQzkd2E
         0RZUaMtkje/C5faG2xlXImdyEwn4T014v7tJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499357; x=1790104157;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XFFk9jJtDswBQpA8QWIooO6lLG4HdlvPT/LqykRjG+U=;
        b=zn0dbX3t0cPEYYKXqRSI//qox9Pr10fdotxaOV75pd80LAkd12SwZwFc61S0WjdUF0
         yh/O6gXlLQGUiNvHMHG13w6Ln1YYmLxs0ZXumz+9fg+HgFbwN9AePz1s64avv90zFm+p
         0xjvuLurkrAodc2dwy9VbhHcf/jXptJ39rWGXP1+cUbfGBPJxIOzSPUqG2fgvDQLuKbt
         CWXEq0DY73MHhRJtA1CHUMBRuzqGq/IGaeEXRBzwu/OhLrSRJB+DLijzD0LonUFjtW7N
         tQ9p30V3thjHikjxeCi+Vt3yuNjSYUMKcbjeJu5slKSV6YWEiwjt8ozri4uW6j1Ct58Y
         3YTA==
X-Forwarded-Encrypted: i=1; AKwUvBy3eyaTojLjmUi0ETBVhnG/CAxBsZHrU1DAFsE6OjELE/QGouMdicIWmjnzPM3dnFkcvrkyI2HRRA==@vger.kernel.org
X-Gm-Message-State: AFuF++l+/6c8YGh3gIvcOzQE4hUCJ92rYhrRyTA0b75iE3KpTDbxXEiD
	Td7QK5XhIfdlpbHkS3PvKTPtVuBN6S1HIZGPFXGLpwlrqkYNGxPioSxy3ncYZ4xAL3pesZIbuTW
	I9ImVDas=
X-Gm-Gg: AYBFou2xdk7rsD3KgBm6rvWnLOvpkN9KNnngGGT4M05mRU64WfCAkdifn+X3iMblDRg
	+IDx139cuCk5aw5YVa/Zxbr6KNrKP4XsA6hscslhrL21aFgC8bXDxglgeQhcfPRVU/uuiyys9yA
	JzIa5H+cAmC1+fpbETM1JIy4LafvScTRfQVgOgFkBAt/AAUUkrANCIomAjeWwNx8pvONCu91jr0
	ZJkagbI3SiwRN3XAZmQTNn4VTAGNYWxbYGWjIyPeL5z0IOsOs9vcEUITcZzzITksaWPtWWB1Y9j
	VSW9JLMIzfIbiII2QuarHP5ez3YWFYMULUlPYgstrAiJAOySV4BomFPlph2uDLXvb0YfA2PZr7v
	aOesNNSH3IKCL98EuqtS1x/jS/I59TdeC/NZsJn1OKFaNagRzpW9D2J1etRm5JPOLcw2rCK05TI
	1XctEGWtUSNd7s+8ozJ7nc00J44lP1StlWIHpCIiu0VdvPS2GDSDbiRTdOV0j2WTa+Wa93iFNoK
	QvKo37B2AJwoqLfuspe2evDXqOoQD4UWIQBUsZq7MPCk7hJs0c=
X-Received: by 2002:a05:6402:a5ca:20b0:6aa:13a8:beea with SMTP id 4fb4d7f45d1cf-6aa13a8c5abmr2284784a12.21.1789499357228;
        Tue, 15 Sep 2026 12:09:17 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d2b0899sm139272a12.31.2026.09.15.12.09.16
        for <io-uring@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 12:09:16 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663bfso33744666b.1
        for <io-uring@vger.kernel.org>; Tue, 15 Sep 2026 12:09:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzTNo03t/wY9jgHZJrAkRvuJ8A0keRZtfpAE99awHMP/pblUNYOvfN/dC2vZeutqFj4dA1ksfD9TA==@vger.kernel.org
X-Received: by 2002:a17:906:7309:b0:c25:47a4:fedc with SMTP id
 a640c23a62f3a-c29b839a057mr1176039766b.2.1789499355710; Tue, 15 Sep 2026
 12:09:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
In-Reply-To: <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 12:08:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi3Kkqgfg6zUTHpQoZNL2VOB4vYqpi6RX0WNO++29UtyQ@mail.gmail.com>
X-Gm-Features: AcwNN1VCm0LMG7z3Jned014oJh6WBcf4uOx0OBk98_hrtHKbrhcQiMMJ_A-fmB0
Message-ID: <CAHk-=wi3Kkqgfg6zUTHpQoZNL2VOB4vYqpi6RX0WNO++29UtyQ@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Jann Horn <jannh@google.com>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, bpf@vger.kernel.org, 
	David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sept 2026 at 10:52, Jann Horn <jannh@google.com> wrote:
>
> Is this mainly about stuff like "we installed a file descriptor and
> then the following put_user() failed"? Because if so, I think a nicer
> fix would be to have a policy of "if userspace provides unwritable
> memory to a syscall, just keep going and pretend the access worked",
> and maybe have a sysctl that kills the process when this happens to
> emphasize that userspace should not be doing this.

We've done that before, where we just ignore put_user() errors and the
user gets whatever the user gets.

It is maybe not optimal, but it's fine. You can find quite a lot of
unchecked put_user() calls with a pattern like

        git grep '^[[:space:]]*put_user(.*);'

and some of them are in core code - see the two in kernel/fork.c, for example.

One of them says "if userspace has not set up a proper pointer then
tough luck". The other one doesn't even bother with a comment.

The scheduler has two cases too, although one of them is admittedly
for another error case.

So yes, saying "if you pass bogus arguments, you get what you get" is
a valid model. It's perhaps not the *preferred* model, but it's not
wrong.

It *would* be wrong to take code that already has error handling and
remove the error handling, though.

                  Linus
