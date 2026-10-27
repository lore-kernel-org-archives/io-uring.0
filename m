Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793123182;
	b=XH5PvL3UKiSdxcq/fQgCkJGqcc3kDfRCqtq1s80M/+wKaWUYpm/hTfYsqPhym0AbZ8n+
	 6IrSL5pPi9cjL9pntYxJsFgQwEl5SF+OrAS0Yl6KaqNzrtPl7Bo+jj7Z7KS7xw5Uq/Iyc
	 nzy/qmyISPjofLzUrsglXejjTI+Ck/07H8Bbo/+EdbMDqOfDLWkOpRkv+jUgVRvWlk+dx
	 qtpUUjaFkpz3UeDxBL15SFbKfX4Hil5q+nkStYw1NPVz0WIUIILqqyOJNodNFuRD2ASqG
	 E056+K5a6+OsSuTyFHAjJ7Wf4FvA1pBWZYexxtq1dKiGZSiCYtUn34kojtbXjDoMYSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zJVDlsrsrfYz550OKB/3hdZdazvfDU9t83gGSE4oBec=;
	b=uXmA0m0vY5hiXPN6b+5287l6kKERMA94JEfpPW03bdP84c2TSSP1QmAmpLw1TlDa+5X5
	 iwEuSJ8ih0pR5UhxUf01UAO+x8Hvo9aC19EqCm11e+rtSWytbqGjqOtgoQsgduVwlbAzX
	 34Su8mZYcWN2JIButqNGCS/Q27HrShdE41TUwrXL1xXFwRAcpbsIpBsxXtwV2N/w40Sat
	 PLbxeYAaMkDPnukJzVl+TO5ZomdXw35VreCZgOUSQa26XQhE8El/WnsNh4RHy6yHMWQMs
	 1VDrpSkk1taQEyNi9izdWv00PK2tD5ZYqvdpz+NxI2UlN5y0ob/TWKmjKxt0GvN9QDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dJZrWgbc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3888E606A31F
	for <io-uring@vger.kernel.org>; Tue, 27 Oct 2026 17:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3888E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dJZrWgbc
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c423b145922so9773066b.3
        for <io-uring@vger.kernel.org>; Tue, 27 Oct 2026 10:46:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793123181; cv=none;
        d=google.com; s=arc-20260327;
        b=QaUuxYr2qDYxSkK44pmpRg/+T50edKZF+vJYl+t49CJAfwcxztMoIl9SAIvm83J5OO
         WO9nJd4HB2VuqCSh5VcRiDlJ2VPVTIyFawRK285Q6krQ7LZU1szLu0aaCsbYzUHauZVi
         dDTjajnAhcxY0C2xHKY9Y0WeBIy4OKfr7CghzwkXTCT1K1fHMPkvLY6QcHBO0ZEKuzoY
         jSWsaAGF5/G3IGNP6BkwgtqkIvxyP38bMYnwHWF/fx6uvdZDxPdW/oloQoOZzlvHJl2I
         0dpzqFQVnN1K2IqOAFRCNICFjmrEf3dNtGfBS4KjqtyfeJDnMcQAVZuda0O2LKLNHK4E
         GxWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zJVDlsrsrfYz550OKB/3hdZdazvfDU9t83gGSE4oBec=;
        fh=1GXG3TaEm+XQ9KBg1ejew4n/HHXBTTs/b3FUB0YYnSM=;
        b=DWnoyj1okim5B79EDcNmCyK1IK4S9sUoeY9eTNn0fHkvZG/gAkubwYetVeCiAZRATd
         NoLR7URuKKvIwHQmGRJfhZsg5pOzrOaM8GVt5e1PGkPBn9bIdcCwEiG6FGmIMt7d5MUb
         W6hknjDv9jBpFeqbjgn+Y1kjB4JIPbRG+LvmcsoV4ZshLzFogxOj/bonr4i4Pb36PWCG
         bEDrNvK146jiySAZFZZyL8nM62FVRXzkcA/3pDyC1rtGWBLs9R75gWZH4J+1IbHrSOg/
         QpKxuO9GN/0QlHeKqQYZ/aOU6MezwDmciFy0/CohqBRsJGzJm8/TLVDFGW/joFy542mT
         8eaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793123181; x=1793727981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zJVDlsrsrfYz550OKB/3hdZdazvfDU9t83gGSE4oBec=;
        b=dJZrWgbceCcvybGI6S+yBWHGKTnRTkeoo+QAXarbXhuJJrcuUxjX6DL3VJxyeJguO7
         EIXUQuToxD9Oj2ADRK5huhz3YAPfLd6CErpWQOPm8uk8bar6rE79bi3bMLs3pZe51bGu
         X4MzPetzpkt4sIfnqO30iZNgo0TbdVmPtmqopEkvLhUnsg2bhmTSLgRVVzhYHy701dNf
         Q0OtvKJRnZ80/E3NbSjyx0npRgDvtmNSPb01SZjgkwzglNyd+xHEbqih3MUFsYvHWiHM
         BQc/ZWywC5lvAnEYkPeZz4JTWFyCYlKLP3X73YxsX8/hg+Ad4REwmoFnONsNmbYY7MNG
         Lt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123181; x=1793727981;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zJVDlsrsrfYz550OKB/3hdZdazvfDU9t83gGSE4oBec=;
        b=MX2LUtoWRZymcufqjp9oDrrMN3AVCUoyhPviV8GRWd9V8gBeEX6CEjXbsGHAVxgJF/
         sCJigRuFpcZDbB3Bz6dG3b09XZU36vmoI8BkLrXniwp+6xFOfWhhbFxjzC9+Pj7hx5s7
         j1+uFdKHJ80D6q0NGTx6OfqqP2Lf9urkAcCzYfLOAtR6vQotvicHm11GgWarzfMVbRm8
         uCpLpZGQFqy+dn9UyNQLBpWzoMKpDd5+P6c2I+9VbUnfQJMBa3/cRnturtkN5xG/+U05
         kw5cuhX0nG/FizoUzb1rhhg3blQXyuL3dHIckOtvDuFmOljXJgg0/M3EaTzkQQTdGs3k
         4AgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzg8pe8b8h1uLg6XrGhwRIviNax/opYZ1NstjUfCzXdnEizGu9nj+FFjTJqXBOlhZwtoukzx2a3Vg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKEeMf2CUmsXXip4pSZANrNVIqRbFJtrkRdCAMT+nVES7HbHMIo
	6WtVPIliNbW8W0PZAw2O46UyyejONZ4e2byvJwkZ136twdiDLjBWeBg+Q+Px0rvhdRIEpxNpHgk
	Vx7Mz07M0Z+ftUSFmRQNZpepIgWzdc3M2oMvSQXW9
X-Gm-Gg: AYBFou1KjApz0S7y8DkXAChnTgwXIyciF9uu6/XZlt+KZlvK8e9eJk2s7SMy449xdVz
	SG3WALWf0fnOwiulPMkuqVU9kNGI7G11LxYqGZmK7AVncOi+5uX1/S+OM+80yBDMb7ECOxTn4NT
	HbpTrczJLvnvhGNZfiZ+mcFm5TAqgZzpCL/d/E+DGdlZIv99hemA2POqENWhuHAlfx3vKVAW3dx
	p1fpZzL0gLnFxlmk16cxtsuXxQHjxvDm6q57HI1BL+6FQITuzkPcGVm5B+hTAc5SrmTcl/BfXJv
	EevxAcmCiiotefG3i71H4XFzoAj+74B7ZAjvqpvUcf5NOY6rQGMUBbxmJGNUt4F0mhkWZJVXtsn
	7VhL+OaaxJbyQcJTeBtH0XXeKU9B9Hb9MMAYYaTZ+7tHte/owOJBc/bz4j9/cMi3XIFrXaTEHbz
	ZUqaJpSKM65amqo/J9qDeR2mpubN7VnbS44BymWsHfr0lVnUterdXpeaiBrdga8basR6qABemdh
	TsXTO9JO2vjMQjY7LJqihOhrmBcsUDpzg==
X-Received: by 2002:a17:907:7b9e:b0:c41:b94c:4538 with SMTP id
 a640c23a62f3a-c46bdec03f8mr1197886866b.47.1793123179946; Tue, 27 Oct 2026
 10:46:19 -0700 (PDT)
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
 <20261026215226.3713941-6-jthoughton@google.com> <20261027110948.GI2668564@noisy.programming.kicks-ass.net>
In-Reply-To: <20261027110948.GI2668564@noisy.programming.kicks-ass.net>
From: James Houghton <jthoughton@google.com>
Date: Tue, 27 Oct 2026 10:45:43 -0700
X-Gm-Features: AclHuK-GDZyG6m8BFpUMWxfSIBXFJlvlZbCjTm5c1oLpEFzow0OEe9cdwDWWw7s
Message-ID: <CADrL8HXtBxf=qixBZV5-iz1sqfZAqSrMR4ZsJTFXS0N84G+nkw@mail.gmail.com>
Subject: Re: [RFC PATCH 05/10] perf/core: Don't unwind the user stack without
 an mm
To: Peter Zijlstra <peterz@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Thomas Gleixner <tglx@kernel.org>, Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jim Mattson <jmattson@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Pavel Begunkov <asml.silence@gmail.com>, 
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

On Tue, Oct 27, 2026 at 4:09=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Mon, Oct 26, 2026 at 09:52:21PM +0000, James Houghton wrote:
> > get_perf_callchain() only checks is_user_task(current) when the regs it
> > is given aren't user mode regs. However, BPF's bpf_get_task_stack() (an=
d
> > bpf_get_task_stack_sleepable()) pass task_pt_regs(current) when called =
on
> > the current task, which are user mode regs for a user task, even if tha=
t
> > task has already gone through exit_mm(), e.g. when called from a progra=
m
> > attached to exit_files() or to the dying task's final sched_switch.
> >
> > perf_callchain_user() then unwinds the user stack without an mm. That
> > access does not reliably fail: the user half of the address space
> > belongs to whatever mm happens to be lazily loaded, if any, so the
> > unwinder may read another task's memory. This affects e.g. arm64,
> > riscv, loongarch and csky, whose perf_callchain_user() doesn't check
> > current->mm itself. perf events themselves are not affected, as
> > perf_callchain() already clears the user callchain request when
> > current is not a user task with an mm.
> >
> > Check is_user_task(current) regardless of the regs' mode.
> >
> > Fixes: fa28dcb82a38 ("bpf: Introduce helper bpf_get_task_stack()")
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > ---
> >  kernel/events/callchain.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/kernel/events/callchain.c b/kernel/events/callchain.c
> > index 9d24b6e0c91f..a451ca2a5573 100644
> > --- a/kernel/events/callchain.c
> > +++ b/kernel/events/callchain.c
> > @@ -245,11 +245,15 @@ get_perf_callchain(struct pt_regs *regs, bool ker=
nel, bool user,
> >       }
> >
> >       if (user && !crosstask) {
> > -             if (!user_mode(regs)) {
> > -                     if (!is_user_task(current))
> > -                             goto exit_put;
> > +             /*
> > +              * Even if @regs are user mode regs, e.g. task_pt_regs(cu=
rrent)
> > +              * passed in by bpf_get_task_stack(), current may already=
 have
> > +              * gone through exit_mm().
> > +              */
> > +             if (!is_user_task(current))
> > +                     goto exit_put;
> > +             if (!user_mode(regs))
> >                       regs =3D task_pt_regs(current);
> > -             }
> >
> >               if (defer_cookie) {
> >                       /*
>
> We have perf_event_exit_task() before exit_mm().
>
> Still, it doesn't hurt to be cautious. So no real objection, but perhaps
> adjust the Changelog?

Right, perf events can't get here, since perf_event_exit_task() runs
before exit_mm() (and CPU-wide events go through perf_callchain()'s
is_user_task() check).

The case this fixes is BPF: bpf_get_task_stack() calls
get_perf_callchain() directly with task_pt_regs(current), so a program
attached to e.g. exit_files() or the task's final sched_switch would
unwind the user stack without an mm.

I've added this paragraph to the start of the changelog to make it a
little clearer that the perf event case isn't the interesting one:

  get_perf_callchain() only checks is_user_task(current) when the regs it
  is given aren't user mode regs. That's fine for perf events: a task's
  own events are torn down by perf_event_exit_task() before exit_mm(), and
  samples from CPU-wide events go through perf_callchain(), which already
  skips the user callchain if current isn't a user task with an mm.

Are you happy with that?

Thanks for the feedback. :)
