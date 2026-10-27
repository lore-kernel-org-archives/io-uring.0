Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793123121;
	b=l6h99vKDBzWIbIdwSQICYv0OeyNLOdEXcl7inysyLgwHYL9acpmLDAkqZRqfENkhgq5i
	 5qYBTYTdNk8cmUahIE5RSErAG6DYiCzC4iZfZhh282f7OQJfDguquwr+HieKFaHXqY7U8
	 m/muUxjZNVmFRe5TJToFjQSbOOP9HyZS581ec+Vk8d5QukNYQAik8je6alQOdsnSHF/U6
	 yrLAe+jbr3HS/yHkfophiBe93R80rc/LLOnzJ5ULXUvGrMgYM0pB8m+D5Qsp4hJOTqIil
	 QkcbJpDh5VDVIYm9IfapcyIzNlSJs6/Abs8jpMxJ3EKDh8EiwEH9mqEF9OR2rTuA4jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=IX+G9SOnBii3qZVcpbPFnOSsikTG2tcrehuOi4LapMY=;
	b=Mf+RqCxnXgkYElXRFJcFjBMPJSBJfEkqx65CILJVWTtwBoqPVt7dgkj32bpMWJNu1Nw5
	 vjs1ZcGFVQp0NUIZpkPnXD36IjEp1R2jgneRefv1O8SugdeeLbRC73l1+FVSRVP38B9KF
	 PU5htdeGOeykaZAfvxFjzX37cVuRIIkvjJDgoXdaWCsEH6G1W3wFN7hAQsh4QIeAKsUQc
	 BfWzx6hljl4wp6tBN0cUYjEalzuBHAg/TTG2dqghEX92IdnXks5ruwth0RbT1OK5ZVs0b
	 1/C7Y7nrY8VqDINabCimxlnQ/rKLnFuI4rwoRSAJ5qJQAKa1Ph1GDh/ZdLkQvlM5pnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=WphOdIGY;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFA7606A31E
	for <io-uring@vger.kernel.org>; Tue, 27 Oct 2026 17:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEFA7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=WphOdIGY
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd69954c755so140228a12.3
        for <io-uring@vger.kernel.org>; Tue, 27 Oct 2026 10:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793123120; x=1793727920; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IX+G9SOnBii3qZVcpbPFnOSsikTG2tcrehuOi4LapMY=;
        b=WphOdIGYX/UvFVCsOGsOEjKfuXa3eOMnjlE/oH98dDJE5AQjaP4vNkgndW6hGi8Qni
         QZdRvdRUJLLZxdWp+Zl5qKI6/61I00l5XO0r5L6IQHA+KIM/sH0yAGXaGnzJZWkBHyDV
         Ex06G3DXIJK4/zKiaDdSjjPRmN2knZrMQtV28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123120; x=1793727920;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IX+G9SOnBii3qZVcpbPFnOSsikTG2tcrehuOi4LapMY=;
        b=fNsLVp6licYVS4oHxIaEci3OdIIr27VJ5uTUke1tw0KFa2Uk02SQavjjraaraMRVBm
         9G+Z805g4Y/sVCrjLG2ryIOe5DFr3HbBk9GlbNYVuWJJoCpiJdAm4ljH+NQF7UTW8pcV
         3VHPAbceCDDsWIHPdmD0gyJ7yAQzDYkFXGisu8LZi6WQiWei6WFHQD4B3FmLFJQCpoUb
         uoBp25NS6i+MgPGB1LBa/lnX7b2HrQNWPTZNMJPdkmnP4NaIRfuQWz8cJ9Sb45o/tmXC
         gv7Qal2FvZGwF06lVgwlUqmI2DaY1rdBTkvLk3pFlLYBk4zAqC7+1rPml4rmm/Y2Wm6M
         Hgeg==
X-Gm-Message-State: AFq9FYLt2a/JP4MAfMEK+B5XwYAtcxzpo8otWg/wgc8gqwRYcuiAEnt1
	NxXfVb1vWocb42cViIaLXm9DIWSrMi3VyhAZTnrERO1DDbf0jVV+eU1fFP6bwB8dheXKO2nkykv
	IN1Z6zeDjZQ==
X-Gm-Gg: AYBFou08eOve6ZPkurfMVtgN+uMs18tmpzYq4TONhe5uEyYnfJMjyq9J/0davWTPVaB
	vJ7Sz3qH/eKqWwvyRO5MPl9aovhFZlKhdQQLk3vo65vALyYlT66SLZqxKUYRWDHiRJeo5baG8bj
	QFT3llEK/cy9GKCtJNkhdQ29/G33rQ5PyZtHLSxNY/c/fOH+C7SxKKf8wULDHW/X3VB+FwUnEsL
	xz/+FDYHyruRxRQjRRRXqN5tT6XAYjU2b4Pq7Z17Q/t7CcXW9r/GF4H8ATfG3wxYo0VS+M/c+DN
	2aZ4HFYyMeTsD1KG/LpMgBouyjARGW70aOHDaHEAhv0dEJ2jmlcV1000bgkUVvKbdJ3SxHI6yxb
	LmubgNE1HY/TdZN2NFE9egN1GhKLo4pP8/Xd+F05/Jiv5QVxxesre98wyuZVSHXx7/8lp7uxHbC
	c3m2XiiKQwtp2kT7sNC4a8KWB9M6BI63EqACbjfsknoCeNoCV7QoPqcMUiYhu+EJUicM/xPUN8z
	Sn4Cg2r8sL4nUgnhRUcbzUYEowIDKOLPHcZBDcO2YFP+FYoMxftN4rWcPS98mAl4j5KuAtErmHk
	YT7XvNuTqs6pk6ndYSMkJCpkzHb9DA==
X-Received: by 2002:a05:6a21:ed0d:b0:3e2:ac98:68ab with SMTP id adf61e73a8af0-3e7cd59e425mr8889813637.54.1793123120119;
        Tue, 27 Oct 2026 10:45:20 -0700 (PDT)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com. [209.85.216.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a5f66bcesm326167b3a.15.2026.10.27.10.45.18
        for <io-uring@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 10:45:19 -0700 (PDT)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso107850a91.2
        for <io-uring@vger.kernel.org>; Tue, 27 Oct 2026 10:45:18 -0700 (PDT)
X-Received: by 2002:a17:90b:58e8:b0:3ac:9706:7739 with SMTP id
 98e67ed59e1d1-3adead57cf0mr9005664a91.17.1793123118449; Tue, 27 Oct 2026
 10:45:18 -0700 (PDT)
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <b97140d2-df87-4cdf-9f0b-d5ca404d50da@kernel.dk>
In-Reply-To: <b97140d2-df87-4cdf-9f0b-d5ca404d50da@kernel.dk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 27 Oct 2026 07:45:00 -1000
X-Gmail-Original-Message-ID: <CAHk-=whLg-od86aV4HU6yC8EKh6zsVWyyvWVOcrVshvxoQ9dAw@mail.gmail.com>
X-Gm-Features: AclHuK8pwUjVyitH5NtHnOssDqiuKTG-rCghbVipSDMu8Vd4XNbNK-Rtknr7Zew
Message-ID: <CAHk-=whLg-od86aV4HU6yC8EKh6zsVWyyvWVOcrVshvxoQ9dAw@mail.gmail.com>
Subject: Re: [GIT PULL] io_uring dma-buf support for 7.4
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring <io-uring@vger.kernel.org>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Oct 2026 at 03:30, Jens Axboe <axboe@kernel.dk> wrote:
>
> This adds native dma-buf support to the I/O path

So while doing the trivial resolution, and looking at the code, I note
that blkdev_buffered_write() grew a

    inode_lock_shared
    ..
    inode_unlock_shared

in it. But looking at the two call sites (in blkdev_write_iter()),
_one_ of them already has that inode_lock_shared() on what seems to be
the exact same inode (bdev_file_inode(iocb->ki_filp))

These all went through you in the original block pull:

  1b1be9ea4e34 block: take the inode lock for buffered write fallback
  2fec4fd97cc3 block: take i_rwsem for the direct I/O write fallback

am I missing something? That nested locking looks not just
unnecessary, it looks like deadlock city. I'm surprised lockdep hasn't
complained, but I'm assuming hardly anybody actually uses this path.

                 Linus
