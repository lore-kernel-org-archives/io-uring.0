Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795724257;
	b=ZopO4kyvgtrnzuXnkUdYdkj28PGbXTwgzrxQmpFaEEnSz46R3vyn+w2JILOUMXk5bt/P
	 KwaDerU5ZKKkh5EmMGY0mrIFHNJi/eQoFLx+WAhL4dZ1+VtYxvx9wGWF4vBIGcMs2I0Bk
	 gyk2VTSufQfHSeioLbVo4GsRVzzMfBQP41piNj8HuoHTcsLN6swq/3UUp5nTqs20yANVK
	 HPxA1lr7tJUVUBqIMLLPAJMiS9BxFqaEHmIypKf1YYlQ9i+lmdU5H+TKCwBVpmQToljiA
	 9CSmug9hQm+taqgJ/XE62HhLBI9/lgYZxRid2JVbgGZIvdniYmHlHKuucv6eMDncxPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795724257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=VXn/XpmalFaorWxQyW2WApryIA+d6umQwuos+tyn2ZI=;
	b=web2oCe3evHcUq78jof1rHFSivvT4kuzqBoDrafR2Rq71MGPxkIEcd7551U4TXyvOTfH
	 JXgH9qxLswKYKVPKj02bQi8A0xnNt/zOaZPL4i57H9wc8Fv8LjX9tQ/16Y+FibZDuryK0
	 95BedDW+X1WXQNF7x6zxsag52i6PMJui7ObIoYI241VzN2n3tVZQk9hvxlGcAZ4jhDADT
	 AE9uYIQngylddyZ38PwEDyDh2vmOEo8aigR+5JTJqxPxoeaOot+KHzx8q6i9M/O3yeXst
	 R0EOTepxgq4khPLCE/8qs37XM+xX8CYoD53BszRVgR55a8AQ0euOVrU92v1PkCAn78w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dIXrw+PG;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5889606A32D
	for <io-uring@vger.kernel.org>; Thu, 26 Nov 2026 20:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5889606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dIXrw+PG
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b532f8a51eso17858a91.1
        for <io-uring@vger.kernel.org>; Thu, 26 Nov 2026 12:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795724256; x=1796329056; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VXn/XpmalFaorWxQyW2WApryIA+d6umQwuos+tyn2ZI=;
        b=dIXrw+PGUZ9JFJs2m6IaKkl/LIB/ng9aqcp5cpZYueYeHvzKgSF6UVxoSJfJeV3yDo
         vfHhawgOnGvwHyR7T6h8eyGAN4HfXCpBiOsD07y4j4BDjyQXiw5cf+rwbBQdX2rPqq1L
         a64HcF2K98qV8hPTQJd9nVIQg/Nmu4sAJGfqXljLu2g0SXqzT5SLrdt9PfnOLCaQIC2x
         s4+RTs4c8V8EV/X9VbeZHtN5+0WLYHpN1mR7l39YBfixENuqIPHQkFUzsMxhDyRmc3nj
         bAIrKOvMOzO9WIOWUWQXnwfM3Sl20C6UWcstdIOF+PO/fzGNcdt+/GQUUrY1r4iTrqiL
         6x4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795724256; x=1796329056;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VXn/XpmalFaorWxQyW2WApryIA+d6umQwuos+tyn2ZI=;
        b=l/5+gcK3+RYLuBku4X2J1x7TM7pdxetuXHRbadh4pL3g8TYNDeOyWs61xyr657bulw
         gkc5ZJmxCHnDqtZLRChFJ027AEGmkIlBgf/K30qjPh7w4tDxTH7LHZfCR+YQM6FUOZue
         9ifRwS6VTfh//tHA/FOGzPtI5v6pnP0KFXmZ8b6gLdR7lqV0L2p3Xx+/AA/gj+CjTUS/
         OQDz7sv5f27XI46jMa/GU+1RvjAAGgl33RCU1bTdnNj3/OAe77JWiYlstzkEDE3TYHmu
         7ej1s+f6a9d/iInx+fUT011vNf3YaNQMEW7XKVqMvD77H4kReNRr6/FyMT/8weypW7/0
         OI1w==
X-Forwarded-Encrypted: i=1; AL+hErEae9eSUDdk1+K3vD7iAe5rOrTKjyqT8VOU0G82i+18Py4jT1Zwkd2eK42D65lF/ZdREJ7u/TdJcw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9qXFtx5RPswsDKd3El6pXdy6b481scVdcmj0BJOixCQS4GqdMt
	X3HM3IwpnekzAaIFn5WU6x7k5REbLq9bWgvQJJUqz0+idKzaK0J/ZlJl
X-Gm-Gg: AZFdTZcTC30XpjHMUKqe+UsjsU+ePotI9PKHs0l9gdFANHF6e1n1Iun2oO9utcYqg57
	ew9yVR1cv/4OFSIptHtbje8xEkrei1jLb3NVWwzGuPyKdVOPWDuSL6RVZ3r5CQCNtqrmD+57P19
	D91Xw690o/z1WPVuEpeifm1cLUMeVMvPRwhzRQtpDgUqhx4NqUwcZBsrufBU7KRlms9oSuc2eWx
	OMSS0xIRMeuVjKx54IfkZEhsdV8Dofp+3zScfG4d4q09s+Uitouangk4jV3a29M6AJNk4brhpiy
	m3p4Qq0iD+bdiTxWR0cRBNOKA9cOguheCBCzzg/kYm27PrHi2F/1cAwP3cqV+gpqp8nzCJDktC6
	+UJx46nV6IQ+1sb4JIuJbxAuVoRm5wzWaCH/PNgTGerfefu5wgNXB6o5bXxSIS6a9TMHkuCKURh
	WSpKWa5w9hfEEeelAOW90c8Q4+XcvjkBhO5wpjoHCyHfrQ8rVh1ShnhCBBrUIUKBHqTQ3nD83un
	e+5ZW0iwja52S8I1iQEAyygFMsJnVa2Tb0EIArcSvaP0Zuf/8wnSNbXce1WUnTbD7TLDK2Qj1FM
	2GpCI/gRgBwHTelrv7UQ4t3am/WdpNgUoOVxNJ8pFdDmOVDB8xo/Em4RBo4ywHbixhQnt8/aF2M
	/ZB4snELzVLUGl8sG4wDKNybKZwTiSO78dAo=
X-Received: by 2002:a17:90b:134e:b0:3ac:9a5e:9ce7 with SMTP id 98e67ed59e1d1-3b41c96764dmr22000708a91.49.1795724256067;
        Thu, 26 Nov 2026 12:17:36 -0800 (PST)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b50234fb25sm3468314a91.2.2026.11.26.12.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 12:17:35 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 20:17:35 +0000
Message-Id: <DN5F4EBDNESC.3UOJRTCXCL4HI@gmail.com>
Cc: "Kees Cook" <kees@kernel.org>, "Andy Lutomirski" <luto@amacapital.net>,
 "Will Drewry" <wad@chromium.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Stanislav Fomichev" <sdf@fomichev.me>, "David S . Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Jens
 Axboe" <axboe@kernel.dk>
Subject: Re: [RFC PATCH 0/3] Introduce a classic BPF filter cache for
 seccomp
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Xu Kuohai" <xukuohai@huaweicloud.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <io-uring@vger.kernel.org>,
 <netdev@vger.kernel.org>
In-Reply-To: <309b8e49-2f9c-4a2f-9b40-8e7e7cce3455@huaweicloud.com>
References: <cover.1795139109.git.xukuohai@huaweicloud.com> <DN0AIFQ82CFP.34SDTH6ZFZC1G@gmail.com> <309b8e49-2f9c-4a2f-9b40-8e7e7cce3455@huaweicloud.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, Nov 26, 2026 at 07:02 AM Xu Kuohai <xukuohai@huaweicloud.com> wrote:
> After further profiling, I found that this collapse is
> mainly caused by Firecracker instances queuing on the
> global pack_mutex in bpf_prog_pack_alloc(). So a better
> approach is to replace the global mutex to per-pack locks.
> I will work on that instead.

Makes sense to fix it there. Every prog load benefits.
But I doubt that per-pack locks help.
bpf_prog_pack_alloc() walks pack_list from the head and takes the first
pack that has room. All loaders pick the same pack and queue on its lock.

I suspect the hold time comes from these:

  path   under pack_mutex            what it does
  -----  --------------------------  --------------------------------
  alloc  bpf_arch_pred_flush()       x86: IBPB via on_each_cpu()
  free   bpf_arch_text_invalidate()  x86: text_poke_set(), text_mutex
  free   bpf_arch_text_invalidate()  arm64: kick_all_cpus_sync()

Every free marks its pack dirty. A cBPF alloc from a dirty pack flushes.
The log of commit a9b1f19a6a67 ("bpf: Prefer packs that won't trigger
an IBPB flush on allocation") has ideas how to flush less.

bpf_arch_text_invalidate() doesn't need pack_mutex. The bits of the
chunks are still set in pack->bitmap at that point, so nobody can take
the chunks or free the pack.

What do you see in your profile?
