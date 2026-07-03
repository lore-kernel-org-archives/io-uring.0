Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED79B29D267
	for <io-uring@vger.kernel.org>; Fri,  3 Jul 2026 17:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783099241; cv=pass; b=gRZQNFICe9ROiYM9QZ/KkYCCVLIxPgFfT2MQRiNhViGasUyOkPL+A0Dm1axOC3cSRTLS2UK31zDt6cRP452wSbA7QEBBrqG0ymsk9reC4AjNGbhnQFY3VzVKZFq1D3Whcvy3/otnf0qT9Ljv7XaH6BOMdp+Y5Qfapc1Dd9/tiTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783099241; c=relaxed/simple;
	bh=eWpA7/MG8Iivy3rR8IxDXJj6ZIuFK//jiTkX5NcEqZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J3dYM2EPwdorVR9vdUpR7Xn5LHfV744InyUPGvsKxkJP8pa7PNaoHoS0N6iaNqfrukVudXNqP0ClekK4E53wNOoiDxHWQ7wqRDfWpyBaKCOLkb4Wu1eVLBxh58Rms98Rz/6PJEH+c4yE48WV1AN0jfOOb4L+nA8D2AkXKG+NbhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tI2fOKHX; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tI2fOKHX"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39b38d3c929so6744291fa.3
        for <io-uring@vger.kernel.org>; Fri, 03 Jul 2026 10:20:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783099236; cv=none;
        d=google.com; s=arc-20260327;
        b=seQE0b/4NLU3ALqbUzGHs/LcKyazkloTi6zaGdHEY90ScvLiWRleLYq90bChEqNnZM
         ETkQvMaFnrDP+eV71f/Wwi38N/PMe+RG/HbNHsiBag4+pj25t0qioly1StH0w1UeXflo
         FCw1/0J5d/BoLbxIlz9k0f08TG3bfB4K5wv958jGRstWFNAGBsA30c9nE+SpLdsmJMd+
         4LJHabbnt4BQpvi0zM3RQD25KDmFnhGfxLs/CjJASMW2t0nIKAYpa1CsVxsSH8ClJAVD
         wPXdekeLtKCNwp8AnGMTs8dfsAq4BEK67OC4QugutwWzMYSqOx717L79b+qXkDWwpdI5
         7WZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RBNIhFEC01mUulafTKatZK031nfGWwbJkiWIAiLGP+Y=;
        fh=N26odN4vNyzdwyDn0Do7J8PorZ/33UxOVA/Nc32Hvbo=;
        b=K8QLy/ho2tLFWRk7JrBQxvizjCqii8nrfYDQ4q4JcMNQEvw2ms/2U5Att/HibjPt7x
         BSWDp6pQhr+kA7u9zbbmUCB0VR5WbzUocIoZtod+915vy07I3U86x/EYSJMJ6Ee7KA0y
         kAWPQMAD1uaiEbaK05Itza3ASoJrO6yPAfjsCaOFynqjspxcwvBN4aQwwFpVTmuSLLq9
         owdTNEebXjIQhPZPHEdKEjHaWhQvIfpSuhLJRPpUyoPghygcwmI0Ai2EC34iXuYAT0ol
         qQJS8KtLiw2L0BA1HBHJ2Fg6muE3KuLaqrk3tnnpA9T60s22aYKEHnBS4tf9WTpsM2qc
         ndbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783099236; x=1783704036; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBNIhFEC01mUulafTKatZK031nfGWwbJkiWIAiLGP+Y=;
        b=tI2fOKHXW++vVVUFuTKsBiFGrUBXFBBPZ4ckF+YJirJmc6qSxNewpk34eS4PPReQIF
         J42PIY3fsUZoDmlphoe0vv6yWKmkIH8zTzaaXO8bOSmos9fNRSK1NL9FF+DXyZYx0veW
         1En1kwSKfaa4nEpaj/8XkZ4mQ91T0pkxp9nt/eNBMGNMdyYB4YKX3Ps2l+AePAc5yOmE
         j1xUqxK+mP0+o2T1sQVoRNrQlccb2PoIQoqVwNuM/5fCvGBi8r3IcavQqgqSbKxjiL1i
         ISz53eHD4KlXrN3qbk95oJ1iNfpe0/6YGNwaCFoByWyZVqEd4a+CTuiM+d1Vyh7UbQag
         nNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783099236; x=1783704036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RBNIhFEC01mUulafTKatZK031nfGWwbJkiWIAiLGP+Y=;
        b=KBz01TPZa4T9CHISsrmviqqOeBCkwH0usYESywMJpUGoy5StNXzG/QO54g8AQMe1nr
         sAh5HCn3ft5oY8o5ieARUy4gRzoLehbzBiQeUofMDg5jbeFZGozLVcW+2BD7M9tJJdnV
         XFyiNovS1DIpj55rl61LnlWd+OsypEvaoIVlwlR4StmUnXOfJwX9HylR5pmlLz65jxU7
         hVwEv8uhn+m98P90WYc4BgUGr7IFI3ban5VoqorkWpZRqeWx3E4qfb/WVdWxxX5mXlVf
         w/MdoTxL6NH91ZnDnqEa8PLn0fS7L3cEUtL7cz/Um7F5t/WtTd6136K6kCtwsWrL2DPn
         nsmg==
X-Forwarded-Encrypted: i=1; AHgh+RrkaSEz4AXLVAGbY2IALG25ofCsonkrbFoC8oSCGadU3Q72rEUekfGzKnhgyqXXilgrnuRCykMe/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yznadmw4LaInJLdOfKnxK1mluIy387dcbvlieEtHYE4CvdPruwc
	WSrMGBCCtULwf7xQ+mmVQWrcp8jlSunosPF+3v+Ab6JtltjTbM//UqWlz4+Q1ol5Cc5sGMtEzaR
	GSiGwxPqQi8+puLmaHbVv2yg0vOWGQRtdtTPO3oY=
X-Gm-Gg: AfdE7cm8OHOkfC6VkEG2MQNYbX9ikreaJcFWLTe9Mkk6or84UytkIATUbA6dIZB8ype
	9SJYj/jVQ6ESJN5NSCxUiucVMOlWZKDKXX13ib0f4bOzHJpY4Bk5M8jfZI6v+dFmuB4hPA+KWYs
	dE+ju2AKEq/o1s4H8juIwlFHDbpR5MwgnSBfz6gC3q1TaYW57omD6aKXZpqSxLnLnVeD0vAdCdC
	0Yxt5qfQZY8uSQYKTPqGEav9KrGc0bzB3B/e5s6bi2kg7Mon1zIQ7/YwKWEGf/2ae9aR0JIaB7C
	HJiCShepG1K5rj2cyausG+K+u5z9sZmnPtv7sbv70uA5
X-Received: by 2002:a05:651c:198f:b0:39b:bc9:90ac with SMTP id
 38308e7fff4ca-39b53da1bc8mr80851fa.30.1783099236215; Fri, 03 Jul 2026
 10:20:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626150946.287781-1-benjamin.james.carey3@gmail.com>
 <85d1f999-7778-4c74-9d72-b8ac8500de31@kernel.dk> <aj6jQyJd3zmZFcwx@kbusch-mbp>
 <1932a509-4e27-485e-8e09-1da67e0082c8@kernel.dk> <aj6p3kZy1a8Mf68S@kbusch-mbp>
 <94614dd9-9351-4a64-83dc-4fc87e377e59@kernel.dk> <aj6tTiAB2NIol9Tf@kbusch-mbp>
 <CA+KFGSoyCSRzgamm-38oyAtEsqd7wZZ8awL79P40x7a819EK4w@mail.gmail.com>
In-Reply-To: <CA+KFGSoyCSRzgamm-38oyAtEsqd7wZZ8awL79P40x7a819EK4w@mail.gmail.com>
From: Ben Carey <benjamin.james.carey3@gmail.com>
Date: Fri, 3 Jul 2026 13:20:24 -0400
X-Gm-Features: AVVi8CcCbQbsL0TG-ihzWQwmt0W2bRgf73ZSolIjPPWz2MbqxDI1jH3s7RcCxQk
Message-ID: <CA+KFGSoZXejMvA5WNBSy=TVxiEiJs1-bxHXkewk8HtCR5m8sEw@mail.gmail.com>
Subject: Re: [BUG] RCU hang with io_uring nvme polling
To: Keith Busch <kbusch@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 1:33=E2=80=AFPM Ben Carey
<benjamin.james.carey3@gmail.com> wrote:
>
> After putting that patch into the kernel, the fio job ran, but most of th=
e
> I/O's completed after about 2 milliseconds (makes sense, given the offset=
.)
>
>
> Ben Carey

While testing the patch we decided to trace the amount of time a workload
spends in blk_hctx_poll. We found that, for a test case with 8 jobs running=
 for
10 seconds, it spent ~71% of its runtime in that function alone. We ran thi=
s
test with an Intel Optane mounted with NVMe over PCIe target but have obser=
ved
similar behavior on a VM, measured by:

perf record -F 99 -a -g -- \
  fio --bs=3D1K --direct=3D1 --iodepth=3D1 --runtime=3D10 --rw=3Drandread -=
-time_based \
    --ioengine=3Dio_uring --hipri=3D1 --fixedbufs=3D0 --registerfiles=3D0 \
      --sqthread_poll=3D0 \
    --numjobs=3D8 --name=3Djob0 --output-format=3Djson --clocksource=3Dcloc=
k_gettime \
    --filename=3D/dev/nvme0n1

Again, this was tested with nvme.poll_queues=3D1, but similar behavior occu=
rs
with higher poll_queues, and also on a VM.

This bug seems to pollute our experimental results, and thus stands as
something needing to be fixed for us to continue our research. Do you all t=
hink
there's a different solution than the timeout?

Thanks again,
Ben Carey
