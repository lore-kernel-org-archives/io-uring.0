Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793814505;
	b=1xNTP8vg6L+Jb3zQ5y84X9ZQARK1CO4fxsXc7FGtU0m5EfMVnxSp8H7OdaFBJfLjFDjR
	 saEbBZYs5WEks+cESPFv88ZGc0UThXbLc1idmbtsIfyOXq9iG2a57stQ9jzD6CHeULrVd
	 eLM0NsJf8dLw+VhwLrSrWNaOv737BdENi4rYgySNNEl4tsTma++m5o1alGmEwzIwRPkIS
	 HxbtqMzdSkKakcfXg47+RM0pEMmYm5VLsqp3f/QTBpej+hDprC9/VmQsOkKrriK09kMni
	 V/ZmediyReQ+rS1Cp1gNIn2FirriHcAjse/GGaQirVkxDuTgdD2UovFD5sNoZYH1z3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pQfWpTnKI7hryV7zCcPG5wFNwdjuO/kamffqV0JV8uM=;
	b=AlzVuDev1Wqapf/cJLUaIU1tDr4J34BcNR41BilncChVHfGrgAQS4+Mrp9o26zPrg5iq
	 I2cuftpZDe+4NrEefVlhRuH+TM0FmDshUez2OF/1YGeaBxGZkbCug1rqlUcS9zMsJ/SdA
	 BHgO+M22HUEvIrUsyP62WVH9tYKf3SAFofAp6/+QzYNhMtr8xvTdfSPceizNvxLppmEqB
	 iDOD8uq3OBfB9Wz066RWZL8HbbxFZrNcKg6+odNWXcoTxS5VdEwdVINTdA2lAxPHIVJkC
	 eggcxZoJkJwMiJ3x9HZmcP+pura/PVqWz7r3xm+yOsw5EAW+2Xa26M+fNQAND+St40Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JatD+w2S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0570D606A337
	for <io-uring@vger.kernel.org>; Wed,  4 Nov 2026 17:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0570D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JatD+w2S
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso926011e87.3
        for <io-uring@vger.kernel.org>; Wed, 04 Nov 2026 09:48:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793814503; cv=none;
        d=google.com; s=arc-20260327;
        b=WJe2/VDF1bw+hubxIGKGB2SO0CXAm5eLrHPOuAvvPPh8YR00QW3iHHsmBJSSHnfiIL
         ql3JafzqccYb8GvrSlzFDheiEQekTf5RvxmxP6zC4qNl2x0sORU4fKn25E98w34TFvi3
         5V49ZmdeGa2PrMwNki/dPEsHocSbl/ABu7wB2Ah36/A1A//EUJeqghRzoueJuAboCPzM
         VCUg/4yA4r0rdYDWPCuVCJXGvPiwo6i3En5m9JX7o4px7S+FT+cqR5TMPNTqnYWHk87a
         xxnlPjZ9GU7Xt41urLqgmDBEsP/BnfU2BLsYasuDjYNtUg3DJGQQiIcH0vnBO2EKXJyi
         ZOww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pQfWpTnKI7hryV7zCcPG5wFNwdjuO/kamffqV0JV8uM=;
        fh=3VCnz+l7MFfkyJ8XtxThje+kIuC6zAglWE9jMeFgwYI=;
        b=TfayFiSBZN1bn/W3oZvv41E2lYt47WCwBWEBZhYmoWAYakrI3Jt0TlPEwTEHZdUdlU
         eCIXKWHRDeK28OWJEvI5y6rUfDvzwF+u1rMbA1j/eaNPepgtdIDUkHzvGKBFH8CJmaBD
         mGad4Wn0chF51U+gguBW5YxdJRIZOuYMLSgCrXi9JXZpITxGV4ZDNh8+OOOjIKrdjXhE
         BKLTIlJIymYk+gtfv3y8mVhsiPYe35o7uE6DqdZWzj+liUzArTbXAV8eyd1xsRL7dwsX
         mQS11JBjPM8KmiJcqPCvcLpLbI6bCmEepz9yOdWIMME7WGdLxygje3wj8t2y3TQymCg4
         +XCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1793814503; x=1794419303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pQfWpTnKI7hryV7zCcPG5wFNwdjuO/kamffqV0JV8uM=;
        b=JatD+w2STBYEIpmUrL91mTYfUwKNN9WIMAju9cLVgJd8MPBXzN2ilG5DJno3Fq/Fvd
         PL0x+7T7W8+zeCyZZO5KxNPiXNREA+0BNftOrBY8ZlzXi+C8oaq2bnaaml9hCvcZekOW
         H3WiLY25lorOeAc7sRonD7UX8KxkL9OOzMeB7hsskQptbYkyZfEyyS6NGO/B4yYY/uAE
         9mRtW4B/i9GWA6ml91lEm52ChAMh1iVwB50SX00WnHZedPRj8nqHz/i34BC1rKYuUaS3
         b2XYtxQ6I7JCrcSWtYNYLfWp16n4pvmmJMyBz/4Oai1G3/AYc4lSPgKvK5kILg7zeAqc
         9Ivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793814503; x=1794419303;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQfWpTnKI7hryV7zCcPG5wFNwdjuO/kamffqV0JV8uM=;
        b=yZDx/ZJhzg8oKgX9KMH/gjKg6jKJFiVbSbXHK+vRB9zYxcrndH7bB/8B0q/0+oYpgw
         WvhXp+ydpN47L2uXXD9VbI7BXQ99qumnHcGfRwn77OvXOa+ugRvBScyElf0TdfrKgb7t
         A5aa7oln2HT2F4EK650ZZIFcF9PUnKDy43VAuOWeUjoAfLcvLlQ7VSIjKayE1iLlAiq5
         qLsntVduzE+EqQZfZtXzTJN2NKermDW/myCxq0e5tCM7Fu21bq0/eS000C0ecRb/pdUU
         O+Hf/4anbsG6EBIAtDmdX7mG2QqXSLHe5EUIAtkuZLfD9IHqUtapATJ6slrpdAzvVxCp
         WGYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsQ6KVxi3lTLfk7N2Xrd7MV+jcvGuFIwQ4ULfPRCM+ViZZQh1+FJHChqIfqXJr5Jar6rnRAAbcJg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8TAiqJp3Tt7Eth3NxyJM/XoZzHBpulQAZ85BK3GIPv9tiIP7nc
	qe+66Dmc7Gsr3cZ9wcxBB3CeFhN+yJGwF1sN3PZxFBTvSN7jcpmzZEGFiXwC2gl/gdY0x4If8ob
	hNMLE1ZqkSljowoKRkJYgRbtdEXyn68LMvQSCDVX+
X-Gm-Gg: AYBFou10p82b/lYY4rleeqYVpnAdbrtkFIAKo16Dj45/Bdb7Dz35wXKxDbyhmOcOT+e
	uNhI2tg9ikJ8dkXgBBdAocjKMcJDDdYqfLOsJSdViUp7OVfhKgZ29T7b8idk90ANF66yy123+FZ
	UL6x4V6hHpCxgnVRkPA21ROfsYpthf5UDfTjveoDKzH1vkIn2ex53UA2cHIhIV6RNMtavWtXPEz
	6Jj6pmPMbsUlUES3gveoiCNyWrwO+zFMd6ljmwxZo++bAnldfc/6iMFL8tax1iBlurj7MzOt9oC
	cJVbddPhnu0vLxxekCwOd8EoNx7ieVtRcQi7eqXluPJwgYE6puEjt01rAijiv5EghHqm05CIQPf
	lcYyzpUYzUnv9Oikwos+eanOcPozY9SfaXg==
X-Received: by 2002:a05:6512:3d1f:b0:5bf:e1e0:ff85 with SMTP id
 2adb3069b0e04-5bfe1e1006bmr5043854e87.56.1793814503166; Wed, 04 Nov 2026
 09:48:23 -0800 (PST)
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012184642.558349-1-metze@samba.org> <20261021-kontakt-hauen-albern-9053a385d79e@brauner>
 <20261103080718.GA4109@lst.de> <CALCETrU0jXA7PJwsL059O+ewqTBopdopbDwMuH-Rb8M5yLdUew@mail.gmail.com>
 <20261104073059.GA29199@lst.de>
In-Reply-To: <20261104073059.GA29199@lst.de>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 4 Nov 2026 09:48:10 -0800
X-Gm-Features: AclHuK-Eq4N2jhZSTZZL0t0qmXgi8zSTzP1_9JDA2j9vQXXqOcEqedbSou0kAMY
Message-ID: <CALCETrWvq3AeeZFgK5a_KWUHQ4iq1RVfPDmQ-FsZ1OPfjNpaaw@mail.gmail.com>
Subject: Re: direct I/O vs buffered I/O coherency, was: Re: [PATCH] fs: add
 RWF_DIRECT for preadv2/pwritev2/io_uring to set IOCB_DIRECT per io
To: Christoph Hellwig <hch@lst.de>
Cc: Christian Brauner <brauner@kernel.org>, Stefan Metzmacher <metze@samba.org>, linux-fsdevel@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, io-uring@vger.kernel.org, 
	linux-api@vger.kernel.org, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> On Nov 3, 2026, at 11:31=E2=80=AFPM, Christoph Hellwig <hch@lst.de> wrote=
:
>
> =EF=BB=BFOn Tue, Nov 03, 2026 at 11:13:32AM -0800, Andy Lutomirski wrote:
>> Here's a bit of a taxonomy of page cache access types that I've come
>> up with from poking around at the kernel source [0]:
>>
>> a) Plain buffered I/O (pread, pwrite, etc) -- I'm sure there is a lot
>> of nuance here, but I'm generally referring to I/O, via pagecache,
>> done in syscall or io_uring context on behalf of a user request.
>>
>> b) Access via MAP_SHARED mmap or via unbroken-cow MAP_PRIVATE read,
>> whether this is actual ordinary user access or one of the weirder
>> cases like KVM that hits it by cheating a bit and using mmu_notifier.
>
> This really also needs to be split into
>
> b1) Read-only access through MAP_SHARED mmap without PROT_WRITE
>    or unbroken-cow MAP_PRIVATE read.
>
> and
>
>
> b2) Writable access through writable MAP_SHARED mmap.

To confirm: do you mean literally just MAP_SHARED,
PROT_READ|PROT_WRITE and then reading?  Or are you specifically
referring to reads from a shared mapping in the writable state, i.e.
after mkwrite has happened?

>
>>
>> c) O_DIRECT: not actually page cache, but it does *logically* touch
>> the same data that might be in page cache.
>
> As in the file side of direct I/O to make this clear.
>
>> d) Access via pinned folio.  We have reads and writes, and we have
>> non-longterm and longterm pins.
>
> ... and this includes the "remote" side of direct I/O if done to file
> backed VMAs.
>
> We also still have
>
> e) access through get_user_pages without pins.
>
> e) really needs to die ASAP, but various maintainers have dragged
> their feed and kept it.  And of course there's still vmsplice which
> kinda hardcodes this into the syscall interface.
>
>> But why can't an O_DIRECT access be coherent vs mmap?  (I'm assuming
>> we're talking about O_DIRECT writes, not reads.)  ISTM the kernel has
>> two ways to do it coherently: unmap the mapping (slow) or copy the
>> data being written into page cache and then write it from page cache
>> (differently slow).  If anyone mmaps a file and O_DIRECT-writes it
>> while they're touching the mapping at high frequency, I'm not sure
>> they deserve excellent performance, and I'd rather give coherence than
>> high performance incoherent behavior.
>
> Because reads invalidate the mapping they are just as relevant.
> But yes, both could fall back to some form of buffered I/O if the
> relevant ranges are mapped.  And maybe that is the best thing to do.
>
> Note that this also means we need to prevent new folio in the page cache
> from being instantiated while direct I/O is pending.  For XFS which
> always take i_rwsem on buffered reads that's reasonably easy, although
> we'd need additional i_dio_count checks (or move to non-owner release
> of i_rwsem for direct I/O).
> But other file systems don't do this, and they get significantly better
> performance for small cached buffered writes, so they probably do not
> want to change that.
>
> Leaving the rest in here for context.
>>
>>
>> Anyway, I have a sort of proposed definition for what coherence might
>> mean -- call this "weak coherence":
>>
>> For each address in the file, there are various accesses.  They happen
>> in an order -- think of this like a CPU memory model, not a strictly
>> linearizable order (if nothing else, mmaped accesses literally follow
>> the CPU's memory model).  But we broaden the memory model to pretend
>> that it applies to the logical file, not to the physical memory. The
>> implementation is weakly coherent if:
>>
>> - Accesses via mmap obey the CPU memory model.
>>
>> - Accesses via syscall or io_uring *including fixed buffers* obey the
>> CPU memory model, except that the access may be broken up into smaller
>> accesses that happen in arbitrary order, so long as they all happen
>> between the submission and the completion of the request.  This
>> includes direct I/O.
>>
>> - Accesses via longterm folio pin follow the same rules as mmap.
>>
>> - Accesses via shortterm folio pin are like syscalls: they happen some
>> time between acquisition and release of the pin but are not
>> necessarily ordered at the time that they are made by the CPU.  (This
>> is the weak part.)
>>
>> I haven't come up with a reason that this would be impossible to
>> implement nicely, except that longterm folio pins would need a much
>> stricter locking scheme: anything that wants to detach a folio from an
>> address_space would need to wait for the pin to be released or
>> actively expedite the pin's release.
>>
>> Is there a hard issue with O_DIRECT that I haven't thought of?
>>
>> And someone would need to go through all the short-term pins in the
>> tree and make sure they're all actually okay with the weak form of
>> coherence.


I should add two other current glitches that I forgot to mention.
Neither of these are new discoveries.

- short term writable folio pins that overlap with writeback: these
can modify page cache without calling .mkwrite. This has been known
for a long time. An LLM did a quick audit for me and suggested that
this can result in a bad state on NFS. It did not flag checksumming
filesystems like btrfs, nor did I ask, but from old memory I can
imagine unfortunate interactions.

- hole punching completely ignores folio pins, both short term and
long term.  I have a delightful reproducer I posted on a different
thread.  It is less than straightforward to fix without adding a way
to break an existing pin unless we=E2=80=99re willing to start refusing to
punch a hole or perhaps to write zeros instead of actually punching
the hole.

https://lore.kernel.org/all/CALCETrVpEP=3DHxVqdSP_AgA=3DU7ignwAgjz5Vi9+Z9dZ=
sX5DXeLw@mail.gmail.com/


>>
>> I think there's at least one example that I think is questionable:
>> iov_iter_extract_user_pages, as reachable from FUSE and possibly
>> elsewhere.  Suppose there are two FUSE filesystems, A and B. A has a
>> file a and B has a file b. A process mmaps b, faults it in, and does
>> read(a_fd, b_ptr, 1), and the FUSE kernel code takes a short-term pin
>> on b_ptr's folio.  Then, before A's daemon responds, B's daemon
>> requests invalidation of b (via fuse_notify_inval_inode), which calls
>> invalidate_inode_pages2_range, which removes the folio from b's page
>> cache. Then A's daemon responds to the read via splice from a pipe,
>> causing the kernel to write to the short-term pinned folio, which goes
>> off into the void.
>>
>> Is this a bug?  If B's invalidation happened because some external
>> actor logically wrote to *the entire area covered by the read*, then
>> arguably it's not -- under my coherence model, the read syscall can be
>> deemed to have occurred immediately before that write and the results
>> simply got overwritten.  But if B's invalidation happened for a
>> different reason (say an external write to a non-overlapping range),
>> then I think this behavior is incorrect.
>>
>> Similarly, if there is just one FUSE and B is an ordinary filesystem,
>> then userspace can do read(a_fd, b_ptr, 1) and overlap it with an
>> O_DIRECT write to b at, say, offset 512, size 512.  If the FS accepts
>> that, then the folio gets detached and the read's update goes into the
>> void.
>>
>>
>> That last example seems more likely to hit if RWF_DIRECT shows up and
>> some library is like "hey, cool, now I can use our shiny atomic direct
>> I/O features in what used to be a buffered I/O path".  And maybe this
>> isn't a *security* bug, but it is an observable case where a simple
>> read() call appears to succeed but does not actually update the
>> destination buffer.  Ouch.
>>
>>
>> Anyway, that's my brain dump.
>>
>>
>> [0] Despite the fact that I got my start doing serious kernel work as
>> a result of writing a memory mapped database of sorts, I've never
>> actually stared at this part of the code before now...
>>
>>
>> --Andy
>>
>>
