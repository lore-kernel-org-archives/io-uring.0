Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793054553;
	b=PaHBtib+YqiU9bAWXGEcortK7+gWUl/2FoTumwey9nkK5+oEljUkWNciTgaD7Frc20x0
	 s5tJG5YgGPvLBst+p52NzWHdn7NSaAKgIQK0rIZ9XdJZlVFJSBfYtWKx5DWso0zPuOtp/
	 675f+g8HjDz/lt06PBsWNQgOm/D0mkocfj75Q8teLkQbmq90bge8EvobPkCxoC/sQNoaW
	 Ote4pCiAfXsH7xrH1TBJMPT/sWElxdc0LESzIaj1+TkodabfdViepE1KjDECbWG5W1ez7
	 ZzckDutx5Nra8ErxY1LUCLFTlL8C0f4SwCLKTC296RAyIiGGopBxetAvrrs6d+tPRTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793054553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1g41ScjhVwvRbzMcxKIfOWek1hrUNmo67dv5vjZ2E34=;
	b=ESrvd6wr0yLpjxYa3AD7o1fEzbvnL+9MX8z7ZpWZ1Da1a2ksUxmg6jMSVmJJteyB53Sr
	 nB5csygq4b49FvL1I1EFLiDfadaNweHKjIjqcwrikrPIGJ7xaDTdjdhakz2KRHMNGQTOR
	 EsThMmq0aDyUwhjWY7O0q6I2FlKXwJF1jQUe6Zt9Giu+LRw7hjZkt8jiTmpEjbAnKxcDW
	 s8Wm7r8VC0u7Z9JnrvJ56RS/UNc+EQXjrSIYU0X7hgB+nMZpFOXLLTEUYhLLGZ25fjX1j
	 V8P8kNa1cbLUz9BbH8Epz+w47a5sez87YDa7b32Y9zZoHcvXSs1zuuA+3AySZJLL1xg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Ho8+h6Mf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620E1606A329
	for <io-uring@vger.kernel.org>; Mon, 26 Oct 2026 22:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 620E1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Ho8+h6Mf
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso519485166b.2
        for <io-uring@vger.kernel.org>; Mon, 26 Oct 2026 15:42:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793054552; cv=none;
        d=google.com; s=arc-20260327;
        b=I7ruJL13V7Ou6EFk9khTlPh7vpLi0BAN0ZDPEasWhPIhPkqdcbfiRrTmpxeADg3wsD
         1d+NAIl/TKh/ldTpdUAVLqlehBHzdnkM3CHHc5jTSpBNhNl14I23rX5EeXvXd4YpyZGq
         OvaoqanCG+gNV4F0ANerD2fhsX6MC2BWVLPRW5eKEKB7EnjKFpw0e8omzSXfW7vKMaoE
         UuMoD3vwBpP9MKL94hdnBSXlrHphDqAqnorv1D/Ia1OquaslopEWI7eKuhqbnpndOihf
         Yqms0JIYg/XtC33RlwSywu4H96dD7jpJRxNN2wvsa+DdezdZH3RczIEoBU9S95AT+rEC
         V8IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1g41ScjhVwvRbzMcxKIfOWek1hrUNmo67dv5vjZ2E34=;
        fh=eL3WrWEvH82Tjwt2ucENr1FT63WOe6VehTL3xHS9B0s=;
        b=rjnrQM252fntHzC6OrwYcdo4k1alx0Vm0O6O03smb23DZ6YgXe82Gey0x0ERlC4uV+
         PV6gSLTSezjBoCgIpFWtadvazmM9jWoP3VKjGw9tkRvtkgB0TyWBhQRzCNU2jJ8tIwIX
         b3aVvA+iFgk8krx7aPYgjSb1OHol8XOQqUBQd0ufZmN7v8mTpslaFx1QnFG3NHOiSmeo
         xATd1zPTcFB0+zsHK/WGKJOQbUIHE/PE6OVf/JsWIVwB43AVPdRzazSK+nYdD8jO65jP
         W7kQWMTusiLPXKiY0BBvQzPDtYTC4wd7rydAO5vBdmSG0HqVO13j3eApjH22VpJYEQXg
         Ii2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793054552; x=1793659352; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1g41ScjhVwvRbzMcxKIfOWek1hrUNmo67dv5vjZ2E34=;
        b=Ho8+h6MfzfNYBnYXWcB1Csn7RkH5FDAzc185C3faxOFFVI5Ip8rPZvUVVS9a7mPz36
         24gi8R8N3yA+KvfwmaRReqCQoQsNezGiPP1Bp7GiihlQBrxNS9eCbaY93g0l7+W+vIC0
         voQ2Heu+uMnZMYR6TuMnUotBhMhKn8fZO7YhZJ/VGMtSyWbiopW5EZJQ5vT2/6dOt2QP
         h6y7P/JEcSU5qhjYmxEPNqjJ3oooD2zuidI/sWorRbLSpg0w4GfbG7VlXLnZBZNxscre
         60kjozBonZXdnmTiD0g6qsMUd7kqNlcLdjiG7bhzjYU1/2dfEHHIUzSVvBAgpzwQCCET
         IiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793054552; x=1793659352;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1g41ScjhVwvRbzMcxKIfOWek1hrUNmo67dv5vjZ2E34=;
        b=D63v1ncV2KDjDfgERkZy5YknAX+fG8aljUnqlGcUHXWc4PHOfTJbaDf0zPePhM+Vyr
         uWZxSr7rj5MMSY+Ku5kw1WP4ue3UzRn/rk5GkprT0gqxfSWtGgWor6wUvB51zLRHuXd/
         YaTXPzM/h31dxTLP0+Pi8++Ws2ZfXprFzyzEeyWyQ3iBTOLXIv+JZe4Hf/iHMfKTjT1o
         aBRgFaUkaMNf2N1yu1t2xnZ1LDVNBE6KksxJ1FkS/q6YNCGPsNmPQ0DgQsTfwd7YRja+
         92kbK3pJ9+mu5tQ3+K1L7poFYy9v2FAB+EpICAzpOfcaXMibqLV0ygiUsjKEubugIR1g
         noyA==
X-Forwarded-Encrypted: i=1; AKwUvBymejoJTneJc9BaJvskU1X9P0PZ5d+JkCpLZDX54o+XRxNW/d8fr6dcH5j/k8g0VKXJhlddcTl8iA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIdmyeVacDJbfi4WNVsHbxmXYlzQW0hQGkw5jbGOThN277agGHu
	3pFWlmeBPGq6zlYepoECO7+khcqHYL54Nm849zHlhX8EjDklxvNB8VM6e1rpItzNWBY25Gdw/bD
	O6cPjo9azsjLh17UOOjVebre81JNjiTWUoBPloWKN
X-Gm-Gg: AYBFou0MHocUcEX7QQZENuVUdtFXSPYTCAT3KJE8/rPW0IwAfKLW9f3mYG8YF/85fSG
	RxtajDQZyDQR5ZnhKVm+z0Eg+V3oI44qgGfF97VYXk4SfqXnVXFXjJK+ElMsGkpKfAknYdMyWD0
	2GiWvABifXXr6JUHTTtGXODE9n3c+nh1+WBmoOXMwSf1xZCsNFS+Kc2XwjntWAQvxHN02zBf2pJ
	i94S6opwCXjZrXk4EQKC/DCicih991yxhyM1Yom2zAF5uiw/8g58H5gPxGNDbNYEX8fsAfH3Fea
	IfFB5tJeOJL059JilW1Kt4B0lb70ZtIoFs0opeJokLyaAwTWTVHNow5tZRy/T9cP1maDMULnChA
	8XWJrfTJxLUQ9bCztIcPRvf29+smntXOqcpbES2VlQ8Z79CcJ3ir0rmVKIJILD8J2efq1//V45m
	knuuVDv3LSPDGO3GlgpFaVC/8Tgkh3iI9K75BpMF7FKknQje6nRRh61PkyhjoypvAj76dPHYYTP
	h1gRWXr
X-Received: by 2002:a17:906:4fcb:b0:c46:8733:642b with SMTP id
 a640c23a62f3a-c46bdeba20dmr991156866b.43.1793054551213; Mon, 26 Oct 2026
 15:42:31 -0700 (PDT)
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026215226.3713941-9-jthoughton@google.com> <da7bb91d95914febc9b2b981c0b8292022d6f6437ecb68ed2b717f0f4a3a04c2@mail.kernel.org>
In-Reply-To: <da7bb91d95914febc9b2b981c0b8292022d6f6437ecb68ed2b717f0f4a3a04c2@mail.kernel.org>
From: James Houghton <jthoughton@google.com>
Date: Mon, 26 Oct 2026 15:41:52 -0700
X-Gm-Features: AclHuK9NQf_DmtP280VFWB18VLK39ZMzdxZm9Qsh_-4Snm7U1eOCkiznChHcSHY
Message-ID: <CADrL8HXA3KVX9agtcExpPuaBLC-zAEWx6QgsRnQ6+cb4AZZrFQ@mail.gmail.com>
Subject: Re: [RFC PATCH 08/10] uaccess: Refuse and warn on __copy_from_user_inatomic()
 without an mm
To: bot+bpf-ci@kernel.org
Cc: akpm@linux-foundation.org, viro@zeniv.linux.org.uk, tglx@kernel.org, 
	peterz@infradead.org, kees@kernel.org, arnd@arndb.de, david@kernel.org, 
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, seanjc@google.com, pbonzini@redhat.com, 
	jmattson@google.com, axboe@kernel.dk, asml.silence@gmail.com, 
	James.Bottomley@hansenpartnership.com, mkp@kernel.org, dsterba@suse.com, 
	mason@kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	john.fastabend@gmail.com, jpoimboe@kernel.org, rostedt@goodmis.org, 
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org, io-uring@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-btrfs@vger.kernel.org, bpf@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andrii@kernel.org, martin.lau@kernel.org, 
	eddyz87@gmail.com, yonghong.song@linux.dev, ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 3:30=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:
>
> > uaccess: Refuse and warn on __copy_from_user_inatomic() without an mm
>
> TL;DR: Commit message only: it names kvm_read_guest_atomic(), which no lo=
nger
> exists in this tree; the review suggests kvm_vcpu_read_guest_atomic() ins=
tead.
>
> >     uaccess: Refuse and warn on __copy_from_user_inatomic() without an =
mm
> >
> >     __copy_from_user_inatomic() never called should_fail_usercopy(), so=
 the
> >     NULL current->mm check added to uaccess_should_fail() does not cove=
r it.
> >     It is used e.g. by KVM's kvm_read_guest_atomic(), by several
> >     architectures' perf callchain and stack trace code, and by the gene=
ric
> >     copy_from_user_inatomic_nontemporal().
> >
> >     Split the NULL mm check out of uaccess_should_fail() into
> >     uaccess_without_mm(), and use it in __copy_from_user_inatomic() to =
warn
> >     and refuse the copy.
> >
> >     Don't use uaccess_should_fail() there, as that would also start inj=
ecting
> >     failures into __copy_from_user_inatomic(), which some callers don't
> >     expect to fail in practice, e.g. __wp_page_copy_user() warns if the=
 copy
> >     fails twice.
> >
> >     copy_from_user_nofault() already fails quietly when current->mm is =
NULL,
> >     and the generic user stack unwinding entry points (perf_callchain()=
,
> >     get_perf_callchain() and stack_trace_save_user()) only unwind the u=
ser
> >     stack of a user task with an mm, so neither is affected.
> >
> >     Signed-off-by: James Houghton <jthoughton@google.com>
>
> The changelog names kvm_read_guest_atomic() as a user of
> __copy_from_user_inatomic(), but that function no longer exists in this t=
ree.
> It was removed by commit ef82eddc0e31 ("KVM: Remove kvm_read_guest_atomic=
()").
>
> The KVM user is now kvm_vcpu_read_guest_atomic() in virt/kvm/kvm_main.c,
> which calls the static __kvm_read_guest_atomic():
>
>     static int __kvm_read_guest_atomic(struct kvm_memory_slot *slot, gfn_=
t gfn,
>                                        void *data, int offset, unsigned l=
ong len)
>     {
>         ...
>         pagefault_disable();
>         r =3D __copy_from_user_inatomic(data, (void __user *)addr + offse=
t, len);
>         pagefault_enable();
>
> A grep for kvm_read_guest_atomic only finds __kvm_read_guest_atomic() and
> kvm_vcpu_read_guest_atomic().
>
> Could the changelog say kvm_vcpu_read_guest_atomic() instead?

Yes, that is correct. I've applied this fix in v2.
