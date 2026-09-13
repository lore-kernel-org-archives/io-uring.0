Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741664BEE52
	for <io-uring@vger.kernel.org>; Sun, 13 Sep 2026 10:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789296760; cv=pass; b=QuQB3oAs7UgkHoh2IsoAlIzKoYNuQdwbMQFq1LBj1NNVcCj4PK2ccI0ILEz9oY5dcuws/1ibB+Bq4m+RXhbs+ViwueZYTqaeCYtaN4toaF5Sa1VyrI4jnzoRJX0zPdvqx3UOrq1CxmsyMaf76hkcYN1BUr3Wz2gHBZ0QiQ/+2Rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789296760; c=relaxed/simple;
	bh=HyVh81acv/VVqBYXU6pxEMuH4M9TDN+c0g3tvkqj9cU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ljtf9T4HyIv4UrSR03fZ3ulrPz0P+HfBgOfoH1qaFV2YfYDEHjDv+fbSr8jqF0JfBN7v83GqzpSiA/z7icyyDka97VVIgIjBsl9MxjcjaQxNyhJaquuKTduj1bbopkEo0dJcEVvn1IZ4s2CL+MjIGoIAiPttJcdi9+y71PnEM1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=Fb1IxcLH; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="Fb1IxcLH"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b20so258298266b.3
        for <io-uring@vger.kernel.org>; Sun, 13 Sep 2026 03:52:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789296757; cv=none;
        d=google.com; s=arc-20260327;
        b=EMW1aKOzaCkU/4zZCcR524skj/UXYYXu3rmTJd8GwvVwVAwG1aL656kCQAXU+8c4/P
         vEec6ibb1JujU3QtJATnGcR4B0esQtkMHHEC45tUjBM5/1ucNdCz6rub0eu0A3G69y9x
         g3mPO9bvgOgP8PfMcuwFJR20fySGeKtbCvWzil5LZSCQY8IgVeP5vDZyXRqbMUvyeRv8
         jLyHWSxfsDKFc51kfvvdYKQig3l71ohZ7mynu+EDQlEamVRgtmFKv9CA8CbnxOEjB1B/
         bwwu0LpAw9PoTuAjQM2FG/jDQgNa+E59Nm7HMV6RbkoXX7fSd8cagpE6XZZhOm0PibK+
         5Xmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=58uaTRU0ZGtZ5APM0gUBEeUjm77f4k6S3m0b9dF1lbw=;
        fh=pQ6Utr70Tm60rVutgjXdYMBcBZAPVW2zaRVkGWL9ewg=;
        b=Rfop90Jh73/99Q9DhRuDxdKiy2+ZqI69fBUOMRIB9A9G+CSyIQO1teCz7xrkIO9cu3
         7bqb9VQcKSORwS9DSYMO8LagIVbYYB/nVaKBKzrwX+VFHu10VOTSws50K/Xv1okEO5Jl
         FX0XjZ6TyIXUOvbgjs3UdwLnWEBW8Rg+gNpiJHUIluJZJSPcqNkdLiDtdrIX/KYytPVH
         MUEBBxyEzZOxVUR2WPXjIByDuCaWR7Z6KzskyafW2vrO5IHsCQmvnfJMlH1HCKaP5us3
         wGptaKTsW9swyfLllJgUKyhdGgNHLwJMxJrYCUotbA+n6jqHtgWOBNv/JWbly+mrL3NP
         Od9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1789296757; x=1789901557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=58uaTRU0ZGtZ5APM0gUBEeUjm77f4k6S3m0b9dF1lbw=;
        b=Fb1IxcLHN2rIfehzfR+zMTNISf3mmO5pctaH/xSqrvYv4sneu68+aI5PYd3MgkHfIR
         M8B7PbIOa4z5XUIU3c+oqmZsaxdztbW8twgbEdlPC21SBSj/Fe3DqlAETBOyLQBQaZI2
         P4ZRaVrKrYbPR+JCvZaMd5220FZB5/QoHbnZTHV9zUkjBOcuzJYhDJFcznAgPxQ6XVgz
         4sEEpdLQVF5dciZkfSOxmvujSLdIwz6TMP98A4Eka3Ww2JpXeAtOtMz5xLBPoe4WBso/
         JNoQsZetGOk9VUi9WPzeGOx214EumCLS1BoQPXt2eArBi3GuvURePsoIowuRsHMy28Ww
         Fqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789296757; x=1789901557;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58uaTRU0ZGtZ5APM0gUBEeUjm77f4k6S3m0b9dF1lbw=;
        b=ZMYlw9I34q5lpm1KtXFpIEwZECDYAAAxO/ZCMW3Alg83i0fDhw9WiUt04yBCgbELnJ
         MeANMzpCyyj2jtsVBFHRvf4hplJDPrJt31htl4JZ7cvQY6kFs2Pw65CVj648YQQxGGQ8
         1dCqIVr7y1wkNApEag3/s34RVCeL7X97VvzLfr6TmoHB57La3dEkTXR0SqgY8yp8YlN6
         nTNDNP8CTRO0WuhYGBe8sPd8NMBnAxxYxxXwshz8h+vhNQKDAnKvZUGQzhWyAHFfgRl7
         zHilItcudFtCXEfsjkBb2PEactVMl7sYA1YHltO4jkpjlweCjzB/fw0LGC3f55HIVBPh
         +gKQ==
X-Forwarded-Encrypted: i=1; AKwUvByjthZ3paeAv+ZRB0GzwXQ4f2omAAMq/0mCfQu5CV0Ye3zZhXPPyqgTXrVddRVOgX76Jgt1aCdr3w==@vger.kernel.org
X-Gm-Message-State: AFuF++lVZ1OH9D2WnX7NY9yb+uf0aGsobEUsckdZQAbZseFwzuP6aC98
	L040Hg0Q26Gme8jXcrV1CUf8i+G/yyhcOchsKhWHiurARFsuGm+zIUSvLZz+QdPT1SwN26uCesc
	LVToCOfWzovkXKVCZU2mDrmuR9ri3r+TmCwZ1lDtZzQ==
X-Gm-Gg: AYBFou2tH6MriPCKzX8nR0R1kAv7ZrhrIo5IPWnFNwjtfU6HMOliysY17OAOo6TrIzT
	uwF8gUpw26aG7RtZ24hv84NV8LyHKMyxYuinOercFPUhvVs/bvy6K8DBxmhpwNo1xGIm2YXDa67
	m4yWg8x173W5Xci2Mlt4Y/Se0tUabCNouwLx2g+avKLDpap1q/HRjZOtWnrzaB3kOi/iTP0jCaA
	msjfAJJwYVOTMUW301sAqVnqSyRlPi3smJ16rZehkMwFKBDDKnuoddTm5E85g7iLFUD6LePagW6
	f/BgmI1x8uQkvPWnGynHLabAsVEUiIjQVJrQvy/J9Q7Idb8ovI3tztj3rdJUBHUJhvDAptzrgwA
	TX/12gbV/
X-Received: by 2002:a17:907:97c7:b0:c29:4d81:c5f0 with SMTP id
 a640c23a62f3a-c29665e7c76mr1262379666b.6.1789296756740; Sun, 13 Sep 2026
 03:52:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913-b4-send-io-wq-cancel-v1-1-dcfe47275c6e@gmail.com>
In-Reply-To: <20260913-b4-send-io-wq-cancel-v1-1-dcfe47275c6e@gmail.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Sun, 13 Sep 2026 12:52:25 +0200
X-Gm-Features: AcwNN1WP8ct_c9ixYHaWQ6Oz-ZmLKWkE3wdkcaAwGZtujFfZ6emAJXtmLpUuKq0
Message-ID: <CAKPOu+-Lp4uRX1v+RXXg0g2p260bOMx2JMaP___24tR8bQt0cw@mail.gmail.com>
Subject: Re: [PATCH] io_uring/io-wq: stop a single cancel after one running match
To: markdamirkan@gmail.com
Cc: Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 12:30=E2=80=AFPM Mark Amirkan via B4 Relay
<devnull+markdamirkan.gmail.com@kernel.org> wrote:
> io_wq_worker_cancel() asks io_acct_for_each_worker() to stop after one
> match when cancel_all is clear.  io_acct_cancel_running_work() discards
> that result, so io_wq_cancel_running_work() continues into the other
> worker account with nr_running already set.
>
> If the first worker there also matches, one non-ALL cancel signals a
> request in both the bounded and unbounded accounts.
>
> Return the iterator result and stop scanning accounts after a match.
> IORING_ASYNC_CANCEL_ALL is unchanged because its callback does not stop
> the iteration.
>
> A test runs a blocking open in the bounded account and a blocking
> pipe-to-pipe splice in the unbounded account with the same user_data.
> Before this change both operations are interrupted by one cancel.  After
> the change only the open is interrupted, and the splice completes when
> input is supplied.
>
> Fixes: 751eedc4b4b7 ("io_uring/io-wq: move worker lists to struct io_wq_a=
cct")

Thanks, that is indeed a detail that I have missed in my commit.
(Bonus points for documenting the new io_acct_cancel_running_work()
return value. That's missing too often in the kernel, even in my own
commit.)

Reviewed-by: Max Kellermann <max.kellermann@ionos.com>

--=20
Max Kellermann
Principal Architect
Hosting Technology

cm4all | Im Mediapark 6a | 50670 K=C3=B6ln | Germany
General information about the company can be found here:
https://www.cm4all.com/impressum
A member of the IONOS Group
