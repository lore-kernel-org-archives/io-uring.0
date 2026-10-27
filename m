Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793123600;
	b=IwcMNYL+8pYoTpi9YUyFyscdVVbmbirBaa2Xg7EidI1KulLEeX42P6OVv2gZcF3Yo25o
	 GNIMKINox8iUSBMvPa9iO2qDEo9GRYj3+ffCvg6H5az4mtQmtGs3XO9DyDUYCLFH/V3t1
	 PAMemDfRXlQ25XWx9NCldhYM+utLByE5zdodFExEX6ijr5AH7W3Cjn+dMFAuWqPiJNts3
	 J2r8sdwXdcyCeUbT7G0Ygl1qUQltuYXUvYLCjCvXDwANYURMHpZQn29DDSnOYAPJIk8TH
	 UsQZr/mtq2S2uJCz4XdVSozUHydL/HNexLw8+JziujyPLjnAEbkcgQKSwafjuBRLLwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eZ7BfEA5+mgPjgQ08MRW3gJSoX82BS/9Z3gx++ZKTBg=;
	b=T8L4HtuRhFPfPXKiPq/i/sdIc39AyRcf0QtHRRHczx8fA0AcViJZNqa+zU9jx4LS77r0
	 Lmj8TQsWXM6gMTflu5D2M6XukIBQAMplH1m3NQBz9fjn5Qe9rtG9cp490l3scFOn4lEYU
	 +SDXK2ZC+WL64yv1PvGbk1WPMKyL99xvo+2mHn8ptWFDgMZtcm5ubjPnnY1XE98QyJ7ok
	 fms43UkY9t1900F3l74JV7LXeuq0oHA63Db68zXgGOp49Y5pt1yNZQE1RWmSNLxxSD/vL
	 xKn6MPQO8lCTiz3bUBtaDIe+9mpeAabIw1v/3T3JACOc/fl6Fmk8GjIvjYP424MjXYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=inJR6ox6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AC5606A31A
	for <io-uring@vger.kernel.org>; Tue, 27 Oct 2026 17:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9AC5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=inJR6ox6
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c46d41f6af3so13862566b.1
        for <io-uring@vger.kernel.org>; Tue, 27 Oct 2026 10:53:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793123598; cv=none;
        d=google.com; s=arc-20260327;
        b=qR/Mtm0HqUNKLdr9NKmPP1cXuwxpmIX50GCyB4ZDtO/I3EOAclK0nHd8ITtCElHsuH
         ppY5Q0eWwYEVCsztO5ATn6zzDDHIs3RxnvAB7WNo67zqf5GXAFFxPS3pGBnPaoh/rtXb
         iF+s8Sazc3L87AFXK2hsNdq9tiMvcIZvVy5LONTyykf7Ik/MykT/NWqMKz+udMRuFX8k
         rNI50W2dkz/XBT5zcZI2ocYn/sgJh3otxDPRRzHH1FWRNKIFT+lRlJA3eVlxaz5a3DNa
         wzy8Acrxoi05qGGsWBhB2HihTMrJvoooveKSaNP6uCxmt46E9PcCMh0WWEC1MmwTLNSp
         c4/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eZ7BfEA5+mgPjgQ08MRW3gJSoX82BS/9Z3gx++ZKTBg=;
        fh=JUQK8rtc6DEjUOzNWxXNL4+DzyrGQyK7WzJKsWgomvA=;
        b=D99Q9xg/1kSxV8kGzy9lk/GvurIJ/6C/Af0e5ihTa3QiZ8qDXVhvJL0pglP7yEDVyI
         z9n3jcd2VgxE1oVqgclon2JgCnDsymm1WCyvHEONNbeEHqg2/DJbVhQycg08cdB2owHt
         WHnGa8+fkEpVIJMtyF7f0dHrEbeguimbGSw1YIulEOYJnVSk4EpjTo3DQCbgMORPvxSj
         qeu4igfX5+gSDdB/CMqMrxznCmQwcFw+oEL6y56Q45wEsTvPzTmyjg6JBXd6yoWIlmeG
         UgbZaBZOpev245zSEbXQhbIP9Ea8KB9v/6BKb/BwVxwZf6pYCeCoxlVXo68TAQxnFUGX
         EWUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793123598; x=1793728398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eZ7BfEA5+mgPjgQ08MRW3gJSoX82BS/9Z3gx++ZKTBg=;
        b=inJR6ox6aQPgzkJ0wZYiPBugaLW1/kUDoRUxznaXNPrxE2Wn3DkQl3afONPaEwO9sl
         vnrt6FP9OFfRf9KWlwZNng3ZlaCrfp3bQxPXGc+Gx+AORrKLJ8WZpN9m6kJEM6IAqHPq
         Jk4iMXPxJgkZqxRsoYIxQcD6CPbdcJbwTT1mEJs9Oh6VfooqjmJi5DvsYqRTbZ70S79m
         W2gdT7rvplj4k08tnzQQgxgOTLo5uqZ4a0mScYBLYVaYMXTVeZPwvd3azNIWeu6/sXO8
         zyeS5P1gD5N0vXZJTHB1IRGypOyTZEZWjLyDPXDDqsHxY4MhwV784zCuBQDBJ99Srvxy
         lKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123598; x=1793728398;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eZ7BfEA5+mgPjgQ08MRW3gJSoX82BS/9Z3gx++ZKTBg=;
        b=YMT/VX+mLZ+cW/D5J7iEHD7JRWRJ9JKSTPYNjgn2zjOkT+lrdMtqn/GCnyYCu8uxZf
         OFEG93M0GFSkhH0vVaynYBw/DLGGRmcpAPiWkGflzwoOSHPAzXYDFjMwt6WxCTs/I4Om
         yV5Vxou2cUFACdZ7Kei/qLZX3i0ZtmQIQeDe8f7luv/BoPC+Q2XB7VFkIdFIXdNWGllW
         LZSEIy6X+MO+G/1uXoUrnqmmlhmuddbnr77h0g239dbwJxmOUVgvjIGCc7XGpiRUD7gV
         7TkXiXUwZN588TwgcneEp41+cmnTbi8tlj/mvTMuHAhluc477hsvbQ3VtSO3eu/lUcU5
         WC3w==
X-Forwarded-Encrypted: i=1; AKwUvBx/PT6FtxAPVYp2cV/p8fOh43Smsaazun+qOT49jbLUX03YuasVGeCpLWI8Um0bDzXtwYmB+dEnbw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLhbzREu8n82VkVFxocSWHOh+7hZyGbo1xFmn6vfG515ITqBehq
	CzIX820KJzUbpgI2JoM+DCw3t0Ku5O15YAAT5sHdHhrtAozmJiG3JU9osxn+iAgI5KOkMMHX+Am
	aoaEE9cp+0Es6B92bhBh5E4bjNUJpM074Fd1N+tqv
X-Gm-Gg: AYBFou2F6YvAB6CCjU7FFfqRLBxxHnGBJfnGauGFCX7hxBNjvFcjQeup0XDrZm/glXM
	nm4UzjHIVAEAWvHzrAq8Zu0xV3b7srEpgmkdvg3tkPfW3KbdHqn0ppnepy+UBRdDvoeFtl8VUCL
	Z7MJBsi+qCvOE/oTd42RnBYtnkrdBmKp+nDF2GDrkBBBbipD8jh4PtxGQAAwCSR2aVnNgGn0D5C
	IAu2I5W0snxt5RELAuuIDHSVgnk9S3PhIoWnhkK+Uu+WtUlwGSJ9BNJnU/8mGy7oJ5piUpmx9cq
	Q4K7K+MmCFX6WoaSj8Mw4TS+bOImXs6SzNFoDr7DVV7EVarB8l9kilg5g9XPyZEBCb2m7XAo2m0
	rpkY8fPEiAsAi8mtAl+ax5WcUEIb6YZa1Xkf0IUy5OGCxxGxhDOZeiDwKpaQB+g4xMfnbvndsmQ
	YhWgLIaJ1RRNL116ClAvLYqSKKnCjM9gbYVO8C9zo56drjopGiRE/iHV4Zwoh8sGekv8duEBzZh
	FwBCWAZ/w/cyA==
X-Received: by 2002:a17:906:dc8e:b0:c31:e958:408c with SMTP id
 a640c23a62f3a-c46bde8b464mr1159692166b.38.1793123597614; Tue, 27 Oct 2026
 10:53:17 -0700 (PDT)
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
 <20261026215226.3713941-2-jthoughton@google.com> <1ee97e9e-3658-41a7-a879-348f51ab547d@kernel.dk>
In-Reply-To: <1ee97e9e-3658-41a7-a879-348f51ab547d@kernel.dk>
From: James Houghton <jthoughton@google.com>
Date: Tue, 27 Oct 2026 10:52:40 -0700
X-Gm-Features: AclHuK_7gnb7g4GjAy_SA5zcAxXhabVZixR-oCAtO-qS-tkfEqOEG_LlV9pvyY0
Message-ID: <CADrL8HVgOYb1hzWDJzm4sCrEAR7PL1xBv-1zTGebTusPoDsGXQ@mail.gmail.com>
Subject: Re: [RFC PATCH 01/10] scsi: bsg: Don't copy sense data to user memory
 when canceled
To: Jens Axboe <axboe@kernel.dk>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jim Mattson <jmattson@google.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
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

On Mon, Oct 26, 2026 at 7:41=E2=80=AFPM Jens Axboe <axboe@kernel.dk> wrote:
>
> Reviewed-by: Jens Axboe <axboe@kernel.dk>

Thanks, Jens!
