Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793058730;
	b=4INlCNNg8+sy8fpZnFl1WuB5heVyLswXSZ0BwUzV2gHRH1KWePJYU3Bu9gWkfgTQ5bzX
	 8yiJ5QLedsz7/xKhR4if/t/DUpzTcY8KwSNBE3piJ5iFilu1ZnaQmZe+qBiTfw903MhZn
	 iloRQsllyw5l4EF9IkxGAPLS6YGJCEfsepMZvOmmxLfxTkQhJ43/oyowRvv1zIatsr7tP
	 gONcZtvoPcE5wnqzTC2pNoUtp1TT0C0Yj70ye301xpiRH2jLPunh/YA7wmpeyiDB4yy7h
	 vQJucZCqO7QvIkn7d12KnwA5zSbXT9nkQtLOmSvW9/j/o1GyIqZfdlbVz5ROp9mZjRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793058730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wkDgiw/AqsIfVPHoMoSGYbq8gYoliaNoZ6zCaoCS6us=;
	b=08ZiVRCpyFapSnvm+vHVHs+GhlbmdQrpnrK18rGpQy5LmDnYSTOeBFM1KvSBSrZg/vW7
	 DMWl95EPbtoiF0fji8F3I/cPeU0IN7RENZMd8wfbc+uz1RRwcIi8QTodCT3ehH+V7PZxX
	 LaPDF4CKMpMzXbiT7tFoiK8E8u+gmR4/a+Xc/kHUqLQnWXo3zcLFZaRKQhzLLML8ARFvH
	 elAHL7m9+5EegEd06hKzfF4XFHOzdx1eLQhtlIIrMfdpDg/rzu2hUNcAemEc5QCY040Xb
	 X+IexRO8v1IYiM/ebPQNyYtUJE6OG4LfeerPFB8k8WQhLoNq4Cj6sgE5Nn5lpBwNOlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=IrwijN25;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7AF606A31D
	for <io-uring@vger.kernel.org>; Mon, 26 Oct 2026 23:52:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB7AF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=IrwijN25
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c34bff61551so525173266b.2
        for <io-uring@vger.kernel.org>; Mon, 26 Oct 2026 16:52:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793058728; cv=none;
        d=google.com; s=arc-20260327;
        b=RvlX+EoQqVc+rEmeI0VXPPuwqCc1Hl+8hfdjfYlGLHO5tuWmGHdK+X6CDj1H09dCeO
         Oz55PxUZcGIM4oB26JE3YjKBLQ+t/aKJEDRLSA0eVitlhdgw4SUuzYaZo/xdUr+WfnLS
         U2uJ5wfw1h7yuxvZNKGIsabQPFfwmnBuBjXAMPbQ0OlRN+TYffAC78wPMxCFrw7pWhXo
         zdJLWrqRywRDKQEGsAAxE2N7scSFso291h5Z0HtCchZJ7NslXKq7XxfIA8dqQVgOLWqK
         AVke0MLseEqt/+uQJx+O7YPrH26aI+9zKvG94PExyEjLCtDWSL9i/rCC1kTViajjmh2D
         +3Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wkDgiw/AqsIfVPHoMoSGYbq8gYoliaNoZ6zCaoCS6us=;
        fh=uQHE1eq8EWC+WFPu+l5dAxO+YSyuNotYMOz6/h60Wq0=;
        b=C6Vdp61vlksZiZSNInSxMgP77j1rVLwdVskc3IvawpYbUKx22XtZroSzN2DRBfYI86
         5K6ja0NdFXW5Y/NrMi86RDDqsdn3KUSah0pMPutwBaad84A8AtEvFTkvZyZ52gPz2xRj
         ECRXiJ/3uh30keu3VJ1J8EO+FFnt6s9mYgDWPK9CFmXZDaxNwCLd7QoKRVpOcU2xa6qu
         d79pUUdHsjhViOgqvi2wy7vSXo4xVQXRUkEIbv8IKNBx4emO22KpExWjhKkQr7FycAGK
         /S/iLotduNqW3u/p44rLKDCBBlnXN6LUuMXTaW2QOlD9lYKn7lqiTZH/crI8qyxNJZgT
         oooA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793058728; x=1793663528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wkDgiw/AqsIfVPHoMoSGYbq8gYoliaNoZ6zCaoCS6us=;
        b=IrwijN25Y5XuhkNoEvpxTGUzu2F8Fw7yumOC6bQX+sv9sI5cIkUQ+8qDyW8Rn0leIE
         KD/M3UgHYaJH9qxw5QEzap4cvaO8QRp4WvUy/b8d8qlbP4zjT/NLwA46mVK4rk5TE67Z
         hbcIs7JRXy3S3BU1Zp46QexhDFTfTqhgb9F5yDiJoNepIvxVOAnGlUkvuMj53pVOulEq
         nY7AospiQUxyoh3b4b1zlSlhp0Xm7S9U0DWHUHqyywQpS6V9BxBGr6qPvm7+SL/x95K4
         vKS38fvl7h/D+VqUiNNcMPjyNlpB+LfGZlaoNjHo8oTsgp0eeolgiheQhrTjRg97kEV2
         ylBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793058728; x=1793663528;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wkDgiw/AqsIfVPHoMoSGYbq8gYoliaNoZ6zCaoCS6us=;
        b=q2J0UqUkYM74uXPGmkEhWVtRcWS1MlP49LTR6UJOGoiK/fys+8+kTh30HHayDj9U6I
         AlYbxuivJE8aWV902++rqnaaweKThdHHVa6T6jz9v7MFalbHU6sjv4k3QDfyBTCPywwq
         KMfJJaPt5rBwzQuTJVF/hCL6h/O2Lx/KZkm9ofyb2isN489Jga0m3sTQ4o00R+pxhXX/
         O5K8st2uW9hWyjRvp1sQ6kGxe7ejarWQphHGNbmVthBT3ZmYIPTmhA6Gqm+mJmRsQKjr
         7v6GwIkof9567v9NuYcWdSiaFBEZloI3rNIqOFAvbpa53y69EGaXtQdZAWtqFwAKoOQ5
         KMfg==
X-Forwarded-Encrypted: i=1; AKwUvByc5+mBEwoYaGJaFqzTWKBZWM0RyvT7TqbwiyENTVoptlv6MpUDmc16LSFN+3Yl9mLX6nK3mcJsgg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKlcazM+O5ao+Ap3jQbg8k629IChY2DfPKMTt+0Cuu2kEWG86Aq
	StEKX4OxUpKJ3iwJziBOZhw/T7MoQH8Lh4cpgJLyuK/vhW/AcalQJWG7WYmQL2tg7tYjpSfNoFz
	6e7QQOnZfmVqEluOUhV3FrhrhX5/3rvsoPMw+frCI
X-Gm-Gg: AYBFou3rpnn0c0PNBjcTJ+oC7y5svTRVt1zpSmrscWyG9GOWyyq00LYWNBwdd/mnyjL
	MDVXGkmd1PbhNCh8YvgoTQ+g0MVAENu/El5amzVLEJ/CvyaWA9JSpyYm9QyIilSXzqbeHN50HK6
	jopl0NPF2ecWS6h8gVLpEKfrimh/laN/NaWisM1W1uJllnSe2WYv329GrCxD1u3PZAck4jy4VIg
	EPoS2kCEWnTH552VK3mgboEBXdx+7CT1SzZHv/R717GCr/1xqB18IpVOaNMCCOlyMrDGijjjLkv
	5yKadEcO4boWkAxCv04Xd88m5vOSRu2ZoUEM6NqKPSKGkX+S8b1tKQwAOw6lfEmdaUjMdw97HRH
	9W0D28oi3eLgreWrQbdVbgh047QfOHDIQ5gsbzc4WloSek6z/Gw7JW6ytXlcZnr4VGbfqgVy6lj
	lHf/PY0205Ph8wCBxUN1WbJbv20tOevd+0nAFy1Mn1eJKfB8LlY2JxfP6vxKsZPM0a+duDs7hQ3
	+JkTZvPqw==
X-Received: by 2002:a17:907:80c:b0:c46:6a50:40c2 with SMTP id
 a640c23a62f3a-c46bdee2675mr943075666b.39.1793058727681; Mon, 26 Oct 2026
 16:52:07 -0700 (PDT)
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026215226.3713941-1-jthoughton@google.com>
 <20261026215226.3713941-11-jthoughton@google.com> <3b0a8fc4-d140-4a90-b810-cbc1283fc083@app.fastmail.com>
In-Reply-To: <3b0a8fc4-d140-4a90-b810-cbc1283fc083@app.fastmail.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 26 Oct 2026 16:51:31 -0700
X-Gm-Features: AclHuK-Nhf6TYTDNWSq0v6hReecRKBdo5ExoV8oZWGVCIO9BK-126Jv082Kq0QQ
Message-ID: <CADrL8HUZ3t8RdMEeBPfqsy1_1rN0Ty9B2c4iP6OzNS12te6vOg@mail.gmail.com>
Subject: Re: [RFC PATCH 10/10] uaccess: Move the NULL mm warning out of line
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>, 
	"David Hildenbrand (Red Hat)" <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jim Mattson <jmattson@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Pavel Begunkov <asml.silence@gmail.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org, io-uring@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-btrfs@vger.kernel.org, bpf@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 4:03=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Mon, Oct 26, 2026, at 22:52, James Houghton wrote:
> > uaccess_without_mm() is inlined into every user copy, including every
> > copy_{to,from}_user() call site on architectures that define
> > INLINE_COPY_USER, such as arm64. Each inlined WARN_ON_ONCE() adds its
> > own __bug_table entry.
> >
> > Keep the NULL current->mm check inline, but move the warning into a
> > single out-of-line, __cold function, uaccess_warn_without_mm().
> >
> > The trade-off is that only the first offending access in the system
> > warns, rather than the first one from each call site. The stack trace
> > still identifies the caller, and the access is refused either way.
> >
> > Compared to the base of this series, with defconfig + KVM:
> >
> >                      inline WARN_ON_ONCE()    out-of-line warning
> >   x86_64 total       +5,884 B (+0.014%)       +9,714 B (+0.023%)
> >   arm64  total      +40,948 B (+0.10%)       +24,609 B (+0.06%)
> >
> > On arm64, this removes the ~16 KB of __bug_table growth, while text
> > size is unchanged, as a call is the same size as the inline brk. On
> > x86_64, the call is larger than the inline ud2 and causes more .cold
> > splitting, so this is a slight regression.
> >
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > ---
> > NOTE: This patch is included for reference only, to show the cost of th=
e
> >       inline warning.
>
> I would suspect that the growth is larger on architectures that
> don't implement __WARN_FLAGS() but rely on the generic WARN_ON().
>
> This would mainly affect 32-bit arm and mips machines, some of which
> are very memory limited, most of the 64-bit architectures have it.

Thanks, Arnd! I ran some build tests on 32-bit arm and mips:

arm (multi_v7_defconfig):
 - base: 31,913,726 B
 - patches 1-9: +64,816 B (+0.20%)
 - patches 1-10: +23,193 B (+0.07%)

mips (malta_defconfig):
 - base: 11,830,177 B
 - patches 1-9: +61,168 B (+0.52%)
 - patches 1-10: +25,881 B (+0.22%)

I think it makes sense to include patch 10 with these results; cutting
>50% of the size increase for arm and mips seems worth the trade-off
of only WARNing on the violating callstack. Let me know what you
think.

Is the increase even with patch 10 too much for mips or arm? I can add
a Kconfig in that case.
