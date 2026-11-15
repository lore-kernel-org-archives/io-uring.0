Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760990;
	b=XOGd7s8kWYDknp03bF6e1+5B6IKXQjHsSqP8yQ/LrrMjUK+fYlFA/mmC/p7uxOgcWrRr
	 NEJicjTL0H16cr3CcDDJz5GycrvKX0VIhTiNxbfCsWkjDgo1Mvf5Zqp6iMyvTUAU5vsN8
	 Dp/Zog5Is951UzLF0Ba8CYFT38MvwPMOaNdcTUle/olxidzdgXxQ9cdlxf6TH1m2Cny5p
	 BLnlu+EyDMW1Jkx8cuA6lyWhXdHxbsp2AmB/nBRuikYZejvfCJYDt/WutWjWsMPaWriGE
	 o5zdfFxEPC4zS+9mh1njBx567zHdcPuGRyWA5tnPmdxEyTaSddx53106O2gX0z3LQDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 Content-Transfer-Encoding:From:Mime-Version:Subject:Date:Message-Id:
	 References:Cc:In-Reply-To:To:X-Mailer;
	bh=5TstXJPrDePm/oZp1iHWoslySj6snE3j87RkioJk/dU=;
	b=AdR+Ft1hsvldzKbkIIn6su28fKl1ztxUzC9Yz7KgYTMdHiM7ol9/I+ZLPAi2Se2iqJXz
	 al01S3vR5YX1zUNMlsoWssFPHvOXm79imQEdrHQb2Rpc3c88Ktasx3k6dusWRoeSiVv6y
	 kNgCUwk7JdBSYF89BN5F8NAg0k4iD88Nzv4gdiaN7lkMNJ4tDUgQxXI/UE5p6tweED/K9
	 9EnsqrUgVT3fZA0+HlcZFwLPGZu9pfvrJDZX8wI9DII7WtDgN2VHn2wqsCC0bm32LcUe6
	 bQiuMt0hu+gESEaVS8caTAVlsT/2vnSLACD3sP+8SRWF4Ti5DdvExiPs7O3S/rIpiag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XmP2HE+x;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFF5606A31D
	for <io-uring@vger.kernel.org>; Sun, 15 Nov 2026 16:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AFF5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XmP2HE+x
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36dbde64409so3933506eec.0
        for <io-uring@vger.kernel.org>; Sun, 15 Nov 2026 08:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794760988; x=1795365788; darn=vger.kernel.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5TstXJPrDePm/oZp1iHWoslySj6snE3j87RkioJk/dU=;
        b=XmP2HE+xtJUA+X7Df8vk9lur7AUkt4CHsLiCcwxm3jS56RYZhsjvMMB0xIXgg2vc7v
         AVuqCTcZdm8hS3DD2zVWaDQdkqRvTuRZ6itEzJ8t/yFCUQGJUr0i08HuWk73Ov8RFVKe
         LPQ9Gndp+f8zd/4AN9DmmQZHt3XKWHGaDiv1GX3TTQ4J7zs2rfkvuxdRMcNoH43hw0z/
         lJngHAPSLYXSrp03kPq7kOp1OM1HxagaltXI/zcoci6BQmVDPzroPAJD8wwgssMnGSKc
         uoQ81eAmViuk2Y1QM21u0aEFs9/LiLL4VjrM8BWN9rYHEmSsF+hRjj1ji7RG9dNUvB3d
         Z5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760988; x=1795365788;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5TstXJPrDePm/oZp1iHWoslySj6snE3j87RkioJk/dU=;
        b=qwM4YVbCEZT9AanA1VSvm3UYGVBkDzy9uHKlRr8hUef7hAj6YQA8Ja+xYClKRO7Mi2
         qG4ZQh3OpJiGFZMoeXIR2wmEGvCCZvuHgr2LbSnpYwDw3P6o+LE0FUdfntGNgjKRM58C
         /6OFi3gnG8zjRue5NYykRY2hMoxkLhd31tpWysSz70dMaQtvAMJZxzQuqN3nZXm5UgeA
         YNsvdMYWdmNm7tyHb5e5fQV4au3xqtI5XmpiSQtZaR4BHZeZhhEjkqxd4qK4hw2rlM05
         llAXtayngQUx7xMzFUs079E3ZFncz4NEgemdR7BZWB8XideuNW9T9Zf5O6EWsdrBKZh7
         K/jg==
X-Gm-Message-State: APuU4Z/5hdFcSaQQ2W3p12cAHolU+HUz15fNNTvlRknDOOYTXebU1GWn
	0/p69HT9qeSuzPjrFCaaMeq+fmCNHPVQNRDlKMA1MYpKlprRTiH1GSAjfe2tatr620YYLoeR+MP
	BFtrtr0k=
X-Gm-Gg: AYBFou13kphLKMm9qcCucbFmYz8TOs9CPrvTo40MAgn/1pHHId+iQkUQ+qlXT9P6KMe
	6iYahD10cXEuG1L7aoWMBoH9nPmdQyorQL3bJHq6N1yDB1WfFrbnQhbaA8+UkZ2lrvFN1GCy560
	Y+CWXVswk+/rYnKsgHmmHrGJGdlK5LKleOYpq1IVp5R7S95F3fAVDfG1hzDNZxOi5RCdSAhUx8T
	xS3cWoVpe1CcJAeCl3CNewo0yokNoPV0y7d82L1Pf2ft71ofM+tVvgVK+hIeZJKqu5huudHUrna
	8Wfj3c7unoPFkz84Rs3vPxASzYrSx+PC8pzfm9Ak6O1DdVZ6kwaaZrLut3VB+CPTEclTrrOozIt
	abeUDr7K5TpQ/yH1/c+/lNoF/7uaFakFvcJuvaVdgYf+ValTgZtxrX84c+7aAcxYvwLYIp/tkMa
	jyRlJANnR6OzOYvONVS+7sIXF5zWdeNOQABXugE3M6r1u5P1WRog3VoPOZ//0jUewOLms6818uQ
	8w3hqTRbP9b4r90mkgKYiXLU+7IBiEvb9VqV8ZnAT9JuuvUZq3rSN4EDucLFh4ireSToOg975BV
	t2nMH3OdMYFJfXyH62FJCI0gGGuKMfpNJpgEgrsa/UEttk1CJNL7EJQi9Nx4eS7Csff2Jb6QQtT
	TdTS8xHuPMzwndZKZFccIIuvU/xe2
X-Received: by 2002:a05:693c:4019:b0:35f:2858:aa4b with SMTP id 5a478bee46e88-379675fc9ebmr7514367eec.30.1794760988058;
        Sun, 15 Nov 2026 08:43:08 -0800 (PST)
Received: from smtpclient.apple ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm26571819eec.13.2026.11.15.08.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:43:06 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Jens Axboe <axboe@kernel.dk>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: Re: [BUG] io_uring/timeout: multishot timeout rearms during cancel drain
Date: Sun, 15 Nov 2026 09:42:55 -0700
Message-Id: <2B793643-3C34-4AE9-8473-1E6ADFE55F89@kernel.dk>
References: <20261115163547.225149-1-teel4res@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261115163547.225149-1-teel4res@gmail.com>
To: Cheng Yongkang <teel4res@gmail.com>
X-Mailer: iPhone Mail (24B156)

On Nov 15, 2026, at 9:35=E2=80=AFAM, Cheng Yongkang <teel4res@gmail.com> wro=
te:
>=20
> =EF=BB=BFHi Jens,
>=20
> I hit a corner case in io_timeout_complete(). It only shows up when
> userspace sets the CQ head to a bogus value, so it may not be worth
> fixing. I am reporting it in case you want the check.

For this and the other one, please send an actual patch. You already did the=
 work.=20

=E2=80=94=20
Jens Axboe

