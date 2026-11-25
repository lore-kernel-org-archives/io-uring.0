Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795625055;
	b=hMmqvfDO3e/iHZKoUCKcgZVNYJl6pZzbRDWBs0GUpsEjeQVOrWDUvpZxCVYRPHG4wrBg
	 ZXJ1gFWTrErJztG2VbBq6b5DZ6LW5suWf2FJxDunCnTTyvbkuMQ9QU9sveS0d6ezLGxKR
	 DsyhuMqxc46XJGgU5xrwm5bZgl/FHLHsqQQYnVhtUf4yaI6Bbz0RGhdDArXOTVwBJc0P8
	 naOyNMI4L/NqpY0K9GlXF1U35f49s72zPDfPbGMh/g61BjjMUT37alh3etLZTJvkQ+IYI
	 vpCHnytuz2LYPqfhx7t+ebQgI/geVs02mWtmrtWLx+8aHPwUp+W7U0FQOQ8jY5gkGlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=II/aro/lwWCAag041h9klo86GZWrpoxtriGNBQNlDMw=;
	b=u1g+5DPNsgCY4JxLlfrmAqcTyO6ntV08XSOWnFLro5x+BCdxEjaof6nLv/ClUDpl6I2D
	 mBzkidHMg8Ve78Y+A2p0oUp045CilpjfdyjpFEYZdGxVUsJH20Z41vjCzVlTrhlBkxr/0
	 IjHRcwo/zpJ+o57DvCGPljJLbQqayKYRoh31Zb74zrWprPb7ZneoQzKxhhWQfZSE5KtBE
	 GoqvLsFB3L+05RN6zSzCMagZ7/FvkzoJi0Rq5cWwNgs25QTS/ZbZfF1uYfrsKCOcYwGSj
	 o+T9mUf+eUNr9WpOXmVkRs/GniMruzo4fp4xORxCIdQYk9NU3tZu0kPieTq96r6gMCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PKZ23RQe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78778606A32C
	for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 16:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78778606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PKZ23RQe
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d21051042so113066666b.0
        for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 08:44:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795625054; cv=none;
        d=google.com; s=arc-20260327;
        b=pcZ6dnSU0by8sxUWqJHQys3WjbUPlWk2OjiPSK7cGXdw6kY+Qw8gBFbfnYDr7H/yyV
         XWZy4Fc4EgqEjQzdQDEjplt1qU8wwxJcArsWVO9+mVbBFDPfp5//GDdaK0VBOuqMj92z
         0DomXQmsWH//44+y9k2lm8EPU/yHZHXxdj7Pzjf77sfY3G/B6wJtSjduB/qJOZT3URly
         uUPNASZx81LdvajXXif0yZXrm26L6PkUBZufoY+tMSrkzjpSHfixl02TOR+eFzcRf8o5
         0pjH6VYahS3FTd/uOXEVwql27EAAxvrEuOcZNfR9oXejiDN+60IRSXe8ZSBVgCWosLcS
         84hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=II/aro/lwWCAag041h9klo86GZWrpoxtriGNBQNlDMw=;
        fh=T37MBJqmHek0JPlkj9E+4NS55VagneSzjikuaGCcDB8=;
        b=AF2yRYHFxiv5Jtstu8+VfG+xGj8wvgiZbzUdmFs0LqLke0jx59xSqmbHGDzwLmyw+P
         cfUr3oaSarfDchnYzFYdqPtfxpF0sC+X4z6E+1AXMelJptlZmqfeaSJnzsDxPDXwyNih
         9hzl2D2n9GO+SuLpqHdmYKgrHP4qowM7QxJpngHCNUlG9bLL4gXsue+32GJCVyM8SQyx
         O1KmyysS/UOIY6Zz6fn3h6zJD3k4/4XDFnRYpPWOxWVgiXUEYYRTE6+zE3Cv8sKMw+Kc
         HZ/+3kvB3rk4gDvIDLNtFfKl23Rm8cusmEpE3RA3i01n6wxLcTvkSW8EKHqcdgLORV8C
         qeKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795625054; x=1796229854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=II/aro/lwWCAag041h9klo86GZWrpoxtriGNBQNlDMw=;
        b=PKZ23RQeMEttotX4OBPRP2DbbrMEB51nwAQlsHi3Clsl60+KLwydytyVzIwS3CPrsp
         gMCa0qLojqUmZPTj1WgDWb2vfDDzy8I3ouZC6AtzVQzGhYkAtsdS7I194LfKbKzPHVBH
         9FjnQKv/TdlaTy27yqxtS+FRu+TCtlSdjsR4QOyB9tkMnDrs00BEwfTTEGdJNrrE0d1S
         i0G3BgU+8ocwt4ScMKi+JN47+02WlDqK9aHu8g0fQCVcWCnmaTG9N306L0mPKog4H/f4
         BgsXgGhnHP8RFqRdmh8kRVgxVbHO2JS8qa43xqFnpf9P4Z4Esbd1QfxvoHuOMiibIYtV
         4BnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625054; x=1796229854;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=II/aro/lwWCAag041h9klo86GZWrpoxtriGNBQNlDMw=;
        b=l0+88p7kJdysqlBosT0h0UADUTkCf6NnwiofUhfjvxZDv4LoyVwTZsdbV6dKg/lRex
         QnJDM8XNhQsRhGohLVX5pWb6hjfewoGTczO72t2JFLOlrOHORZVbtZGkW4fQDZH2rgrf
         Y6CpEEF12uEefhauj/pr4ERtVN4YxdI7e+hc9VMQ0ll9UO4mac/Dnzc6ES5Y/rck6sxa
         RIPEilEl/RtP/ad8BtCcj3r65SEIuDOCSovVcH4NO8nIdn4H2ZnvAcjfeO8aPcAQV5c3
         wDI5Al1eybuTijvsLpsB2HCb4bVE4Ebk+Qay8NQXJhr3yVSqlhIDFh0u2M31xJuRnnoe
         t7dA==
X-Forwarded-Encrypted: i=1; AL+hErGvkQE07pj4eBeZFjuvIs68dTS8OHmtiIx/3kDdpWi1M0CBnMj2rXRqedDXDFHSv6uvQb74MOfsAg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8mAoJjCn8l8ACNhtmqfF1sfk5jAF0fgQJGTQ/VOCBcKsZAPfxo
	rHK2X5aretgYKFmeFMbV6peoVXRwmZAzJI5ehZtPI3wluRqU5HVhYI/TIE97aMhvnW7CVuyVu48
	g5BHzG6+Yjisx6p/GMuQ6faOKhsLjZkXT9CqJy9zo
X-Gm-Gg: AZFdTZcVkXOfeszZ5LYsMerVd4uc3bWBl3l+R8Ikr2X2Q8AHgCPrIGctFHDXwEHNfgl
	QC7oUe7oXGCDB0gm+xc45cVVXwVv0SvaHV2eB2zMyuUFk3uAB6XvtPqrVWIlWAyVuz6b84u3jsM
	yuUcpRs+INX83OMWAHpAwOZDkaronlc8tRZwYta5HprR60nfhxeeOtW1GuC20n5tPy4xa2RH8Du
	hsvWl7XGgS2aYM14J+NvmMmQq3OBq29Vf3JI0K4Hpdw10LFzSWzx7J0yNrBGZLuXZvyFcxAsca6
	rO6Y/r+k+bC5EBV/5f7JyUariomK/s1kHv8a4ewC4CAebUoBI18qB9LKKQY6UwFvqp9meWkENf9
	4oByqxRuJmIN8WfrgThaxjOW3jlkhClSMEpVheTkL4XAodF/jdTAP6qCxLgyggLbsg3QOGawwSq
	om97QN319jFSmKSkXIJ1ttTBsDAerpj49cKRi7ReNpyEP+hTpZCyo=
X-Received: by 2002:a17:907:6d22:b0:c51:40e:847a with SMTP id
 a640c23a62f3a-c513a1e6fdfmr1639688066b.0.1795625053094; Wed, 25 Nov 2026
 08:44:13 -0800 (PST)
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <ac22215d-3e58-4aab-851e-47c30836e058@app.fastmail.com>
 <20261027231728.1466446-1-jthoughton@google.com> <32fad21b-5bad-4640-97df-ef0f638cd9e9@app.fastmail.com>
 <CADrL8HX5vb1PGDpWzp-eR0rNfsMCVUhFa9vp_WZZx2eJZ+dfXQ@mail.gmail.com> <1a99e5fc-129e-41e3-8420-101bcf04b366@app.fastmail.com>
In-Reply-To: <1a99e5fc-129e-41e3-8420-101bcf04b366@app.fastmail.com>
From: James Houghton <jthoughton@google.com>
Date: Wed, 25 Nov 2026 11:43:36 -0500
X-Gm-Features: Aa3M54qTCDON0Zo2YJDXp5pBtwrXjTcYjv8NoqDjQS_XV_tl8JrBb-LQVlKEL3Q
Message-ID: <CADrL8HUOZs-vWRyM9p+Na-=arRU+Gx_cWMLbxHmUYnho4fAUXg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/10] uaccess: Refuse and warn on user accesses when
 current->mm is NULL
To: Arnd Bergmann <arnd@arndb.de>
Cc: "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Pavel Begunkov <asml.silence@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, 
	"David Hildenbrand (Red Hat)" <david@kernel.org>, David Sterba <dsterba@suse.com>, io-uring@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>, John Fastabend <john.fastabend@gmail.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <kees@kernel.org>, kvm@vger.kernel.org, 
	"Liam R. Howlett" <liam@infradead.org>, linux-btrfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-perf-users@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Lorenzo Stoakes <ljs@kernel.org>, Chris Mason <mason@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Michal Hocko <mhocko@suse.com>, Ingo Molnar <mingo@redhat.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Mike Rapoport <rppt@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 5:02=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Tue, Nov 24, 2026, at 22:10, James Houghton wrote:
> > On Wed, Oct 28, 2026 at 7:14=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> w=
rote:
> >> On Wed, Oct 28, 2026, at 00:17, James Houghton wrote:
>
> > So now in v2, the _nofault() helpers themselves do not check current->m=
m.
> >
> > I've uploaded a draft version of v2 here, in case you want to take a lo=
ok:
> >   https://github.com/48ca/linux uaccess-v2-wip
>
> I read through this now and it all looks good to me so far.

Wow you looked at that really quickly, thank you so much!

> >> Since in principle every user access should go through both
> >> access_ok/mask_user_address and current->mm check at some point,
> >> so combining the two as much as possible should help long-term
> >> maintainability.
> >
> > You're right, and v2 has been restructured like this.
> >
> > - The check is in access_ok() itself: the generic version, plus the
> > arm64 and riscv versions. __access_ok() remains a plain range check.
> > - The callers of mask_user_address()/masked_user_*_access_begin()
> > check current->mm explicitly. There are about a dozen such callers.
> > - The unchecked accessors, __copy_{from,to}_user()
> > and__copy_{from,to}_user_inatomic() (and arm64's
> > copy_from_user_flushcache(), which also relies on an earlier
> > access_ok()), keep an explicit check for now. Once their users are
> > converted to the checked versions, those checks can be dropped.
>
> Ok, sounds all good. If we get more than handful of mask_user_address()
> and masked_user_*_access_begin(), we can always revisit that interface
> to make sure the check can't be skipped, but for now this seems
> like a good tradeoff.

Great!

> > Compared to v1, this also covers get_user()/put_user()/clear_user() on
> > arm64, powerpc, riscv and the asm-generic architectures, and arch code
> > like signal frame setup that uses access_ok() followed by __put_user()
> > or unsafe_*(). user_access_begin() no longer needs its own check.
> >
> > What's still not covered: x86's get_user()/put_user(), which do their
> > own range check in asm, a few architecture-specific paths that call
> > __access_ok() directly (e.g. on alpha and sparc32), and arch code that
> > calls __get_user()/__put_user() without access_ok(), mostly trap
> > handlers for user-mode faults. Probably best tackled later.
>
> ok
>
> >> There are probably few enough of these that we could address them
> >> by either adding current->mm checks or converting them to use
> >> the full versions instead where that is an obvious change like
> >> that usb gadget driver.
> >
> > Sounds good. I'll send a separate series converting the obvious ones,
> > starting with the usb gadget driver. I think that will be useful.
> > Let's see how far I can get; hopefully I can drop
> > __copy_{from,to}_user() completely.
>
> Ok, perfect!

Thanks, Arnd! FWIW, there have been no syzkaller issues so far with
this WIP v2. :)
