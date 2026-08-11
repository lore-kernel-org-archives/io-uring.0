Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692043148CF
	for <io-uring@vger.kernel.org>; Tue, 11 Aug 2026 16:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786467505; cv=pass; b=h3zAF5Yh3nGveWAGosLRs+AuNoE8NC3G3VvSREziAcjMSTm4DBATHHsQhf0lZa8LybI63pPkWIh8OO9D8x53a+UWJzspOs0u4LDhq+Y1IDf3aPiJ9jO+4HUz/DfLIP6BPWFAVpi/Gkz8Nq+4nzAKRrR/zNJBBkOZQ4HkxEX/y40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786467505; c=relaxed/simple;
	bh=p1Idd0+BrPC57hxyNa+KXpmXW4ID+phoJh3HgUE0RFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aMu82sYR61lrw73IsgCRk9Uem+DM4FFbOCJ6NSxC1i6CDWB8iF2oQWr18u0lmV5t/MaIy0UDJqLrqsNZ3ahFOxZh6T88UbkeAyzc9IURK++FBP9dKrUCu2SAT3Ercf3DTP/QMXNsJKO+3TyRiRQ/Wgz4rNov+S0Bh/NpKzVUOFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XAOvMZ5K; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XAOvMZ5K"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cab97c86bdso445ad.1
        for <io-uring@vger.kernel.org>; Tue, 11 Aug 2026 09:58:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786467504; cv=none;
        d=google.com; s=arc-20260327;
        b=hB9xD1jHqEYOCHICRFwNZAwoPhk8JiKILGOnwnSApt9aAjX8X6p2jo/IWzlAJ9sFd1
         vKJUoHqJDgrxn1Kns/Eo2b5LE6kX7BtYtAYwmWaAJ4PlxToWZgpN6Ktvkr1fP+Mq4I58
         sSjJfV994asQ9gxZqnON2yOgIJM+z0L/UnwUuFKAtMpUhI7uEgjisfjYzCqOJbe51JB0
         11vSnge7PHQQjzWCE6rlFUjzFWqnyoh8AZfT8x5Nj/U/T65+pFUFrQPaaCZDxe6bBDaa
         7pcX108gT3A7ZlyNBAzJAw3kb9Nrksm6tm5PgRQaYRaBVBy2SbO5jtR80cs/XPvYqInw
         kkYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cWgS+W4qLbOvGJ4zW2GbJqzmR98EMaFrD9S8IoZvEKc=;
        fh=tEbCYTGdYBSLy3ocCnuuDpq46a1zqKnpr0iHUtdXhhY=;
        b=VTO0SEUxmRPhSLqgDGto8CmHQmSMbwleqzfQ38fUc5ghwFuO9+2g9kpnoKTHF+9OFK
         Zw+F+jAaDWwQRlvkJXSvWPvo3VvTrBQRvFAjRe3ycPYHLcEA6TMeEdnXG2sQCZI3rg9f
         TaDOL5PtR32GsginpO4NOix0sEFSUcWUoZts4LZRcbjAVwKGgBnrFHq0haLgqmAZO8wZ
         c1XYgEmdyBR5tkYtkS2wXhAsjsluApdj61232JrAfwLA72UEVXD3DAyiH8pjWZXUw6k9
         nKdn0bR7GOhtlzzET7mbclvHhIbucn3pomcAQH4N0TW/Z9H5XZQ9491fWsN2pC3qGmaf
         0GEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786467504; x=1787072304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cWgS+W4qLbOvGJ4zW2GbJqzmR98EMaFrD9S8IoZvEKc=;
        b=XAOvMZ5Kbhp6huQetVKNpFWlCrRD7EfKhOe9Oyoy3r9pEnyGYmSHabjnBkVZmlgKBp
         Nu9cciU6B0EOEl2lmoaPbZxWinpTK43isllxCT4j64o0Ah+1qtbfIbSfdLEccoXGN4hk
         4Ge8tgr8KG8eNwn+TtLSVeoBgSyghYQYLG3QG4sER2MUjZpMgD/sU+XMKVSn8EW8+QDq
         qP9sLNeiMSQI3/DcuQqaNz1lgByC+QPAMuPH0m5GNzny/Fzno96pdKR5h1IRk9HMnklG
         ULcJRVr91grMw+kAYnCr1jNIRPjcxnALnpSS++oCrsB3Pel9ac+6Jel10YAwjFvg4z3e
         1gKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786467504; x=1787072304;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cWgS+W4qLbOvGJ4zW2GbJqzmR98EMaFrD9S8IoZvEKc=;
        b=jE+S3Z/VApXAS/J1PYkdPXZ7ixG8eG0g+0KRWwnpsqKbaks+Uw7EqJeS29h9ys0smq
         0pD0zEbT7RGv0bTUFdbXk4e9cEBXRBJJsFaeFjigr6caSSb1hCvPKnT2TUD1ZhkdcIzO
         da6jdVyf2SqvK7ZV9waKslmyZJ0senIlMtxprvvhKLMyRnsl8vYprp52zSGseqHk6PkE
         K5isRgaNQn+OQIGYRkTbpnNz+1Vt/wnYxSnhHld/U0/4Wx95MZDBx34ErvbP/fguR3mx
         m9uocBevnf6WUQP9xgofX/bOXL0t1qhPlXTiN6AWFAjezD4P2d+CCUjssvg69IErwVsk
         ITpg==
X-Gm-Message-State: AOJu0YzDDdQKkDh9BiuFqWrS/s3SIkcNhvMciWCokySLBjYCE3k5i0bP
	n/DX7bJe1OndBq+PatNaAiuUu7GNswtLBhhzuG2KLnC1xRy+oLXTYqFTI1/daJ2lTvjSkFU4EIe
	UJi5dEgcfaOEJpk9JW0jKIjqbdk2MZJckD9EErQIk1jJqLt3BLmB4xST0
X-Gm-Gg: AR+sD12ZvUKn3qXuG9KWiRpBH5kH/eXKIN5G24VIFWyngx9mxg60cK4qqMZoFWcFU/k
	BqE7P053J3QCpczcY105bgwRbjxVi/emNDyEXwYUMMMvPVBYWO0I6VldByjzeV2udSFldU8ohQH
	9SdBaPJE7b5CtqCO6p51hobT9pP6rDmEX4xjiR6u/pvH9K16kpAqKqYV7nicl/t+UR/TB2ah7Ng
	bmZEYGi+Levb6cqXIw2iAFnbIJbDPtfOlD8LwTucdYCQnyMp3u+uXgTwe6UrKqi3o4t1hfAWPYM
	ilIPkKXo/2vwVKhAwJCn2Qqw2plIzMSqFxT6oYvLZzbv9d5lh1r+U84qpgfcXzBylwZ5JnDr6PL
	IkxWOBXkiGQ==
X-Received: by 2002:a17:902:e746:b0:2ce:b436:272a with SMTP id
 d9443c01a7336-2d3171a2d69mr5868425ad.3.1786467503059; Tue, 11 Aug 2026
 09:58:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1786108672.git.asml.silence@gmail.com> <f769116a3f5267f06cb9a9a819d482ddea2e0852.1786108672.git.asml.silence@gmail.com>
 <CAHS8izN4SAUCUQySd+VTbdayX-Stj+eYOqAof+Vhi=EsRb93_w@mail.gmail.com> <70b36cb8-bcb3-400f-a3f6-d038bff88723@gmail.com>
In-Reply-To: <70b36cb8-bcb3-400f-a3f6-d038bff88723@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 11 Aug 2026 09:58:07 -0700
X-Gm-Features: AUfX_mxQRJ5lJVMdC3KvfzaiGNzSb3bPiW1sF_ivLo0dSz182zuFZ-UONptoA2k
Message-ID: <CAHS8izPWWk1wxwbfLHKQQrHA1vGURSf6A9cmWMskb6aSfNYVjw@mail.gmail.com>
Subject: Re: [PATCH io_uring 02/16] io_uring/zcrx: move RQ head/tail to
 separate cache lines
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: io-uring@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 6:16=E2=80=AFAM Pavel Begunkov <asml.silence@gmail.=
com> wrote:
>
> On 8/10/26 18:35, Mina Almasry wrote:
> > On Fri, Aug 7, 2026 at 6:25=E2=80=AFAM Pavel Begunkov <asml.silence@gma=
il.com> wrote:
> >>
> >> RQ head and tail are currently put into the same cache line, which can
> >> cause false sharing problems when refill is run on another CPU. Put th=
em
> >> into separate cache lines.
> ...>> +struct zcrx_rq_hdr {
> >> +       u32             head ____cacheline_aligned_in_smp;
> >> +       u32             tail ____cacheline_aligned_in_smp;
> >> +};
> >> +
> >>   struct zcrx_rq {
> >>          spinlock_t                      lock;
> >> -       struct io_uring                 *ring;
> >> +       struct zcrx_rq_hdr              *ring;
> >
> > Is this not a problem in general for everything/most/a lot of using
> > struct io_uring? Should you make this change to struct io_uring
> > itself?
>
> No, io_uring headers are usually accessed by the same task,
> that's unlike zcrx where the consumer and the producer are
> two distinct entities.
>

K, thanks.

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
