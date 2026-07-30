Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C24D357CEA
	for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 20:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785441734; cv=pass; b=fDaFYL9PrpVCdMgh2Gc6Op8gwWqTayNS7Kap7L7pk83jMT849TllG7DyjxHAycv6tMUTSlOUhXNIkv6P0rMCJOEKF+93rl5eZCdhfFgjH4Tgh8XVesVlQGkEd54Nk/AmfAqho3vKbDQTta0p46qq4RZ57//Eks1+EXLEajO9f+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785441734; c=relaxed/simple;
	bh=qZzJvUfZRso2RO/UiJzxOrayFiOAibqbjT0CxiatzVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OyLvU9mN+Aktw0C7YUD1DHwlxR+ZW2t9kC9/nheovY/C/oaSmwjD7QRh0oOTdOoOGsdDkfknqBIbMEFYZw+SbiR/vxixeJqo0wNtlLLsQvlzcam/u6CgG9LwLONMv7KU7SM71FOGQ2ntAFnrAKaH/n8YzrtC5yxIhAkb+sa3s3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q7TSNMSp; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q7TSNMSp"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-69fc6a09b5aso384082a12.3
        for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 13:02:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785441730; cv=none;
        d=google.com; s=arc-20260327;
        b=GgBpbKXwaDqIzW2ihQxannVniJtH6WooTHguBYdxu1UuMWIugk0HOmBLW2wRJlLHa/
         Ub5v2ruzm+y3BbAueVqy89AtCPvple9VKdlS+Q5EUgr+T7FTO1LyJE7C4kcdcs65K8PP
         Lyvp/dpS4rdcZLf+k/tiLgKzk6+JAodkCaAt9rmCBXtnw4W7cMZvjnkdJIKvqbyrVCKO
         GJH3rYRUvchDEAw3tgSMhTYAp4EiraHHV80rQaSbBhvgTxVrCmngdtl3E1LCgor/Imyv
         JLpklJqdkwDMEcxdkyuHYq9rdoizPiBMaSVvhQ0Czz3bZlDBEhtOyqoWKPLpvionA605
         n02w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qZzJvUfZRso2RO/UiJzxOrayFiOAibqbjT0CxiatzVU=;
        fh=LumEXeIgKEUuLh4Q/Uk+mShlFd9h8ChLOOCv/CDnRes=;
        b=CmNk0aBACS0acoEgC27Ar1H4TPIdCexdyMhrckXujRvCkgtuLsKJjmrV9YSPlDdoz9
         GbzC55VzSfj3UjgZQ3NQ5N2cU8KUx0aE5YGnusxU+RWX39IUGbXivuoIxwzNMzAT5GdW
         3izZw5yuK72VzbGUugPYrqDTvPIhHAJgzUYdIf3imIOoDNrUvFYDJ7DWn/a9MRMwkkLi
         h7qzJRxPbw303HPIidIe80ZjMLMjiwId+J0dQGi2oGeC/NAmiYBTzRlDeqKDixZ9lwDV
         gC59XurJUSVqAFNaje5EhdPH4+iEioOSdy3dpyG9IQuKik7twqWmAVAS0coaW94xXbp3
         HWng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785441730; x=1786046530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qZzJvUfZRso2RO/UiJzxOrayFiOAibqbjT0CxiatzVU=;
        b=q7TSNMSpXT4YEcFIPnfZKwpk7cEGsUr0fZdC6VOD+7xe1tX1gG1xz6Fpl83OIEoM0e
         0vYdSCa591l4hwNc852NAgxP8xUWeKgsURfUCPkK06cqQNT9u+NRYBdmYhKYmn62ZZ3x
         C3p5Zs7iIRRi+7f2z1CxE8y8LaojmfkPFNjg7JEvyzNZq7RXEadzGziMUT6w40feaM4W
         RDffI97aPoSDXD+ynKi2eJPFEhelGvk/bINlW28+g+jNgb+A+lHRP0yG9AUdzTo1O2EI
         BkhpyW2FL4ryomoowCfHvAUPj/QPZ6mOp5GN8E4k6FiAPQ1PpQZAllq1ovTnKGr+PiHV
         rQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785441730; x=1786046530;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qZzJvUfZRso2RO/UiJzxOrayFiOAibqbjT0CxiatzVU=;
        b=eWjW/omAAAwG8nV4EqaCuPfvJ4d7PnggxaWjwt4Nrf6dCl15ufsSdGTMr0SsCADHbu
         ztNATsby3WhNMBTKS8LIzrKO9TwpvOhT55IUG3KX9KFU8c1eAAhRrwGv/NnbSS2XrPXX
         sLW6rZlLwvHtha/uQmgbzYMY/nr1xFoHbamzcNjO+clMRiZ5EvHkm9c4BbvMy/6UZd5h
         ymRDleqs+l0b2TedhK8d/YFxHqRbszV2B6SzLzspue+CtaaYxsrutKSHQKexhlJ8AAnt
         bvHBTVLjTXVcIgrV0cVnduG47LXrSW8oX7AYRX8Q0ItsjSHsYhbXOCiETbtU7mAavUaj
         ATug==
X-Forwarded-Encrypted: i=1; AHgh+RqRgkFgJgSoYtNAO3IatjTewT0zqrF+SSKpghikAHXxr+MzPu7mQ+i3uzNzM+rhjs0fv4BHLS4Oig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyHcxDCC+9ROXEOWwVPEC2dFF8R259OHlODOMIRr2syDFN09L4
	P7MigReZpDJ9KqKdwPjCQdsGVf3QnWBq/qH0o4+yVXVwzTMgMcjC7H+nsD0wn34HKmKqT9ivTql
	tu+Lk3TLgj6HmghKaTPtF1FKASnE5Pb4=
X-Gm-Gg: AR+sD11Bv6dO3MDQzQTJL6n66sXp2ZdBC7V6HrOrQRiMDMt/xwsqrzS/QYKQhxYUeYH
	NB/DwUkDqf0jLm63DzR46NEOJ91mT3A2lFDtC3AnKVTt4LIUtiasX3FhhO13r32CyzNyfejEz2w
	hyAEx+Yk2XLz+YTLrmCcBVVhCgbjZmsUXpy+Q/pLdA9PYMbI21fAce/CGqKKzNmetsZaVoKgYSV
	7Ph8GNhpz6NjbhncmeyaIXaKcOsxGHNPSRmbXXqg0PJqJO2kwl7SGXri9KQP4mGOuLQ1WYqnX1j
	Cb0WKSpujR0QSNPCu5EwGLn4USdgp4YLwM9sCZMVG3D8Ea6PLBzouqMskXwH0OpVnz/8AlZmfwx
	w
X-Received: by 2002:a17:906:d7c5:b0:c1f:6f31:2880 with SMTP id
 a640c23a62f3a-c1fbcbbaf9amr92661266b.50.1785441729813; Thu, 30 Jul 2026
 13:02:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <amtbpwrhlNGJ9OK6@redhat.com> <amtbxpqJ3pZwyT8D@redhat.com>
 <amteY30qxRuPzFh3@gmail.com> <amth6owVUdVOmyAL@redhat.com>
In-Reply-To: <amth6owVUdVOmyAL@redhat.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 30 Jul 2026 22:01:56 +0200
X-Gm-Features: AUfX_mxENwOXQ-caUgXqUerTbXH5sRM6Sld9GitjXaMQVP0pKFVSqUA-g6155GY
Message-ID: <CAGudoHE=GjMRKGbip8nRUm34VUud_YSqGZJrfr+Vz6Qu22Mdaw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] pipe: only enable the extra wake_up(rd_wait) for
 edge-triggered consumers
To: Oleg Nesterov <oleg@redhat.com>
Cc: Breno Leitao <leitao@debian.org>, Christian Brauner <brauner@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Pavel Begunkov <asml.silence@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Alexey Gladkov <legion@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 4:38=E2=80=AFPM Oleg Nesterov <oleg@redhat.com> wro=
te:
> What exactly do you think the comment should say? I agree with anything i=
n
> advance. I thought that "edge-triggered" provides enough info, but I woul=
d
> be happy to improve the docs.
>

how about: There is userspace depending on the extra wake up, see
commit 3a34b13a88caeb28 ("pipe: make pipe writes always wake up
readers") for details.

or whatever else which refers to the commit, no need for anything
fancy. the current commentary is definitely lame.

> And the helper's name? pipe_enable_poll_et() ?
>

perhaps pipe_enable_epoll_semantics()?
