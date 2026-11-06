Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793985930;
	b=k9i+CGHUl9hVf+rGeAcXaRg9hzr2biBN1ZAFdDZiqjQoCYloZHZmCx6X6OAsq7naAlwr
	 z+uvXNt9es9HDnQQPP10yTf4urutv4SunMDtyR6zgXQilXRJZTVpEbjOSFctCmDVI6ovi
	 tFMeXhPrMXEByjbHO17xNvgJbiZ+giIu2yYh5plLCijAsEGrhv39SSPnf46V+uY5g+Kbo
	 rNWjWcW9r898sTMx5i0UummtvikKh1r0Nn1Ai/gZRjiMNsIJtoTjbd+6mp7ivBi4lBbwo
	 /75Kmqzo2gm3K2ihxSaiWb4g41Sryt8a8tYCtyLQfDkmBcFzaGTl3A4ZwDlqFzMDNWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fUrJNblI2O1hZNjcXmW6nSh+tuR5hYmiGJK5WvnJCM8=;
	b=lCclWzfQY0wwbr0RUj/4JHEWv76GDTfH/sGULNRyJ+PyT9716BiEtWGv2xBGUc5qZYaE
	 VSPs+8zehis3X4CqUf0MWlq81Zmq6OILU8+Y0DE+D8aU06E/05oDKBtb6w1OddvazWOJP
	 YLFwsxuBcU0n1a0q1IoiyEuh5ZTbM7nBYQNfEJst9+SZ53YDsuQkSlxUHGUl8eYGFeNx2
	 PBN+URoar+9l6zCeG2AB/b+EkJLLD01gGXxqh1fJXA3e1jAcoKSq9YEMvblWKkdOxM5FM
	 s5/I+efUfMK1jBoWCmfpuOMoGFyrRSVd/Fnsn6ZHv97wMgMrhspxFz3pMLpWT+mdUtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="ewlCk/lT";
	arc=fail smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49114606A329
	for <io-uring@vger.kernel.org>; Fri,  6 Nov 2026 17:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49114606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ewlCk/lT
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b6266b5bc4so1395e9.1
        for <io-uring@vger.kernel.org>; Fri, 06 Nov 2026 09:25:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793985929; cv=none;
        d=google.com; s=arc-20260327;
        b=XiwqHrAmsXn34HYZ8j8ls01PfTdp1T6EVyoOgCYydf/aCoIATyWDLst2eTcAjB/39K
         Zf0V8tiSoccP6SbVWYP/q/6F4653ismQtWrCSEDpPpizEIqH3oQ1O3QdVIcGe5eTzmm7
         gjJo9oumuSiTPunIopnBnq42JtyaAAfiG5a062EFKneD3xaGnDHadd3TGYLEivdnm6rZ
         +qauqKEU2NF9UI9MPdMnf1yJrRVvR5F9nsMoqynRnOpA2Dwj+kJENP/HLan2nBEPHdno
         7lw/DaCZvcdWzo6lLGAWI6cq6dao0Af44rI4CFXE3G7OKSemkZ0yH5/5SGGZ7jfbKMLL
         fQGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fUrJNblI2O1hZNjcXmW6nSh+tuR5hYmiGJK5WvnJCM8=;
        fh=PvQKbxHWz7btIC5DqYjD4JPF95UJYIaKdZ7dKeSAEJw=;
        b=kVgDMcNUpg7ixqg5DHNVkQhzVSW2wmAC5zSYd3mPiruDr5OymJDZXdLzJJDNZfXAsF
         WHoDKv+ssHIp9JfzCyDPQzooVt4LF+NbJ82YVM69iBjhnAuPhrQx+snjZ1CL3oJ7lPqM
         7YBKpAcif7kmGVwVn/edWyG57AgGoh/T4eq5jP47+30tiSif7Ov3nCe9PrbZZ3zqhCH+
         rb3wbHlPACwmM64qb+YvSonuvkUa3purW595U/uCGxwony5cqMvS1jtNdIxdrj4oOxn0
         7RXPYy4LaO2OiyqKuraDIqZLFUUy22Hsiv1ClJmgVWBOaXKjRvss3frUb/JsdS5xuJ/r
         YcUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793985929; x=1794590729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fUrJNblI2O1hZNjcXmW6nSh+tuR5hYmiGJK5WvnJCM8=;
        b=ewlCk/lTPeKUbMBQjEFxdvXeSJcIPNy2WZqd3RMZR0f4utguz18d1I/25cveVMzzFo
         RT7lseKNhSlQDjNcDMIS/DhwPwUeEMuf3p3QA2SuaR2YWynu3cJ86aMi1V+rohgW/ueU
         wdYBRPMGl9NpfqRBybmsYTfqpJAAsq2YUA3wBescnBCrmLOck2h5FL8JtaVfjtntUhMa
         atBGAqnYj6CPAyn1iWAem1TaZV6cbQ3Ry89bYsb3Y3ddSg87IS5+y0t3k5n/93i7MVsR
         kOjiJQAHUQ9kOMLGGhlfbBtqgDPKlex2gLuJNJ4aUDDAFXSR7PLhJYKjThP1OZfQlk1U
         nw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985929; x=1794590729;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fUrJNblI2O1hZNjcXmW6nSh+tuR5hYmiGJK5WvnJCM8=;
        b=n3woA4j4X44J8bw32VIq9iNS0FTqIoMrzQoX5DH7hIxUV4U07rf7JmVUU2FJjce1vi
         V5ddSekfkpW3WWNy1t8ZwQ+Ndl7DQUYgMcEhEFb8C/CWgwg+6t4/f09prBsqDFyJob3o
         2APhw3EYnbt16Q2pkVi7jufyEX9ARRNjxLKcH1giz4qMfZLxaBZv6fQarF3eDduzWiZS
         UjCLLXBTI1SkJsWYMQeMcvzVjMBR+JvopOcuiGsUC0D97TzsJ69NUK0jdm8giSLTaHzI
         BnKlyu1LNqtWfdCiFyjaOxd8xa/AYHTJQRr8Bd5j+9NtqqXegXlnZERqdl7TystkXByS
         i/7A==
X-Forwarded-Encrypted: i=1; AKwUvBxtPEEGT9W8a+SJaNQb/5X08Rn57wmq9aqku9ZnKQ4KELTxdxpIDB6D931lHH9L0isCfUUavCzxzw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8xEk4QBw/CCuQfYzWEVxbaMAgV6uaNAAADPiypcaLKpR4zDLLO
	Wh5M1/vFypyJJWt7/XT4lHAbch52AdrUS7HBiCQ99bQokG+2ZwFeOyUDCBKb8xrG7S1/PAQWKan
	q3kVbXyXZTe9bRgm0qkubKtcWNKOqIMbu7bNUdepV
X-Gm-Gg: AYBFou2Ywjq6fLc2DyUAfBJBVTr2Qi9biOAR9otvmAQP9O8n861bP7Ydf3xKZpm2erj
	opFDqHp1mCAT2In6gleSvrfrxSoAwLU8gNZVfysC8RiFzKQdGpxxdAFOJh60I1nInGE5Fj5y0mi
	4FdprkxzjrdY8sKbIxxxj8E2cf3+dIXakWJZNZAqNqHNWjHCOABUm6mmb7VATvAcQu7dTHyC/uO
	dobpW6ImAQSMcZ/mRoXtF3t3mTxmw4rPlnIUC32vO7R7NID92PKIM9RfVhy6ZBRl1r2BYpP+wA1
	T0qzDbC59DBUY4M4+F66VM3naR/AjY5TAfLzAWICvNlT/48BtD/R7hEyhjlzWsXyRKyLOfLCSGo
	BN9U2qkZqhPT6oE9Cy6vluhHC0J1LynM+vlig2rNZ2+2nfpQ8mJMi1RRNPo8wGVVVBtEOWAseF9
	oLx9NRx40GMTL+iwFw2dEpdWJP+lGqoxK85oSLIcDj4Yru
X-Received: by 2002:a05:600d:644f:20b0:4a2:a8c:22ae with SMTP id
 5b1f17b1804b1-4b78a315689mr14125e9.12.1793985928307; Fri, 06 Nov 2026
 09:25:28 -0800 (PST)
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106131829.3228926-1-cui.tao@linux.dev> <20261106131829.3228926-3-cui.tao@linux.dev>
 <1e18fcfd-785d-43cc-afd6-d181bf8305eb@amd.com>
In-Reply-To: <1e18fcfd-785d-43cc-afd6-d181bf8305eb@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 6 Nov 2026 09:25:16 -0800
X-Gm-Features: AclHuK_zmhBLd-fBLwMoqE-7QVB_DAT0nisVVyTe7VWHd67XlQDn1ECR61povKo
Message-ID: <CABdmKX0nCB2hT+iMh=BB-nC=fUBPof8YvjvO-gtEw+zcHZgvZA@mail.gmail.com>
Subject: Re: [PATCH 2/7] dma-buf/udmabuf: account the page array metadata to memcg
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Tao Cui <cui.tao@linux.dev>, akpm@linux-foundation.org, dgilbert@interlog.com, 
	mkp@kernel.org, loberman@redhat.com, jmeneghi@redhat.com, kraxel@redhat.com, 
	vivek.kasireddy@intel.com, mst@redhat.com, jasowangio@gmail.com, 
	eperezma@redhat.com, stefanha@redhat.com, sgarzare@redhat.com, 
	rostedt@goodmis.org, vdonnefort@google.com, mhiramat@kernel.org, jgg@ziepe.ca, 
	kevin.tian@intel.com, axboe@kernel.dk, linux-mm@kvack.org, 
	James.Bottomley@hansenpartnership.com, sumit.semwal@linaro.org, 
	phasta@kernel.org, joro@8bytes.org, will@kernel.org, 
	linux-scsi@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-trace-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bobbyeshleman@meta.com, mathieu.desnoyers@efficios.com, robin.murphy@arm.com, 
	mason@kernel.org, aesteve@redhat.com, harry@kernel.org, vbabka@suse.cz, 
	cuitao@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 5:23=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> On 11/6/26 14:18, Tao Cui wrote:
> > From: Tao Cui <cuitao@kylinos.cn>
> >
> > udmabuf pins the pages of a memfd and hands them out as a dma-buf.  The
> > data pages keep the accounting of the memfd they were instantiated in,
> > but the bookkeeping around them does not: the page pointer array and
> > the pinned_folios array, both sized by the buffer page count, plus the
> > transient folios array sized by the memfd folio count, are plain
> > GFP_KERNEL.  A 1GB buffer costs about 4MB of uncharged SUnreclaim
> > memory, and size_limit_mb defaults to INT_MAX.
> >
> > Charge the three kvmalloc allocations so the creator pays for the
> > metadata it induces.  The system heap in the same subsystem already
> > accounts its buffer allocation;

Only if the mem_accounting param is set to true. We (Android)
currently depend on it being disabled because system heap buffers
don't have a single owner for their entire lifetime (ownership often
changes immediately after they are allocated), and the kernel doesn't
have the ability to switch who is charged for the buffer memory quite
yet. Albert is working hard on it at the moment.

Could you update the message to note the mem_accounting param pls?

> > the data pages here stay with the
> > memfd.

memfd / udmabuf is a little special because it uses shmem for the
backing store, which is already tracked by memcg under all conditions
(except hugetlb). We don't currently use udmabuf, so the lack of memcg
charge transfer for udmabuf is not an issue. But once we get charge
transfer working for the system heap it'd be good to follow up with
udmabuf.

> T.J. needs to take a look here, but I fear that this might break uAPI.

Thanks for looping me in Christian. The buffer allocations cost
gigabytes, but these metadata arrays are only 4MB per 1GB of buffer,
so I don't expect charging them to break anyone. Leaving them
uncharged is an accounting gap though, since someone could spam many
udmabufs from the same memfd and only pay for the memfd pages once. So
this change is ok with me.

> A lot of the DMA-buf resources are intentionally not charged against memc=
g.
>
> Regards,
> Christian.
>
> >
> > Signed-off-by: Tao Cui <cuitao@kylinos.cn>

With the commit message updated to mention the mem_accounting param:
Reviewed-by: T.J. Mercier <tjmercier@google.com>
