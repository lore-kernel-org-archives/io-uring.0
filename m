Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EE43A8739
	for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 19:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784749079; cv=pass; b=EyP8kw60EOzuRxvQd6ah9BNP0lRGI5m5SvMuM9LD204H/8eqZyAwmN6fH+iNt2hgwdDWYP0tXULxxi3dj4WcUT8mc2tup7FGCFAhrbyPP+iytA83dga7L10SlUcluKy9T/tZYb+A5tU8qwDeiEdAoRl6bRkntcI+GHhJ+7EFcxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784749079; c=relaxed/simple;
	bh=JQzdvO2/c6W6zyFtYE1jtZo85b0xGeOpk8OnYL3jNs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kyt5G+HPfEpUv/SywKdaxUTIA5cB3WSJmklo0OpddKOvEIV3dt0l4ZW1Nm0U9yaEx/BQW6Afd2EJy4yqMCBRi1mPQl7mr8LXXjCGFanJYv4bXFFa86K0c0MeC3kzvizNyVE6CwZYvUGndreziM8P95Jj3uSxNsGvcbDmIz4QApc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m9F02x+Z; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m9F02x+Z"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cab97c86bdso17135ad.1
        for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 12:37:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784749077; cv=none;
        d=google.com; s=arc-20260327;
        b=eBix67sDvqAEWHtmY9bovTo09Z35RcZ3sOKgnzWSaVINS1NiZI0t2ZBlNFjWwejr9w
         gJw6ocGmQsIZf2VCRuMQxh1DLvfjK3PW19skD9/aOhjsY1y0sN9Fq/I/pFB4B7UZ6A2Q
         zMwX2daQQe5GZO3pll9wY7lZlYB0n9+rp5gtC4Wrw/vpn01HJiXcw9P8fMcJQBRe0O4t
         QPEm9LvxhiuWMxNEmTw7hvTuq1metd9qfF/4xqpoDRPTOv+DlgHWqkaziftHCQ6YWVmx
         84jmwbt4WD5AmmUurvMprl/wEWEHE43JNydqZ1evT74PDMWvy6tOYw1RxH2Nbz6w26bl
         hCHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JQzdvO2/c6W6zyFtYE1jtZo85b0xGeOpk8OnYL3jNs0=;
        fh=dSlZPusUycofQjA4HtMTbFjCkinFQeCaTDaPmexJCCc=;
        b=lFhdp3H8UtHZXXg5o4Bt1AlOgiLoug3voa9Icygww/Be2+3w3g2kTI7eZhHiv6+dOX
         JStj6LUW7LquSRiRu/TpYe1FwfZpUp8QkrT9esAFHc7N3NrqVDmL97hFLifXjsswgexL
         +tgCGjYC2rLTm3twO09RLfdLNDngJXeStG2S1NG6z/MllnG60Er18CQLwhz4+nhPbnxn
         r1v3SSti2+F78UG1flZjh6CccRcPrVaQM+K0nYTY232PPrDzzI2aqw6DowHpeKtKYz+Y
         Z0pk9KegDur2H76uWokQ24LevoSGQ1oh7pUed1QRkdhjN1ohKyOcaSu75/6FMmBHs8oO
         mbYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784749077; x=1785353877; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JQzdvO2/c6W6zyFtYE1jtZo85b0xGeOpk8OnYL3jNs0=;
        b=m9F02x+Zsij3Cm1Yoz5t2A0G0qjRiIdpl2Jui/4FK4NKhEr+udoaHujkmIQfU5S218
         bsDFwTuHWG+9HBiEA/dao+MaWgeNMJxIcoJs973afLCPezcZEU+GlOVGVi73roC4kd+g
         qO4bcfb5O8ddKbg8SK513ORKjIgBM8cReQYr2i9hBTW5Jg8w2Sd+L1qc0THiCJNby/CM
         +u3JKZXpXiTTWxG0SBeuj0297pm8a2y/YL6JLreuDLyvalkLXdfiaW+l9Ooes7NV49P7
         aDo01oX9SOTnJuLa0PcDjgl54TakM/OO2SWH1QukNV5E2DM6DHc+h+y6ZOBVtvSbw1xk
         3I7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784749077; x=1785353877;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQzdvO2/c6W6zyFtYE1jtZo85b0xGeOpk8OnYL3jNs0=;
        b=mwMS2Q9n5tktzoePkwN4AKxr+YGv7u4hshMyAXBHGfgKkz5utNJgVUiqK48xWglU52
         e1+k764tBTZM0pjsO6zYqakddb2bgb+7sAbTUDYR8tBoujDji9rTlp0zb+HBUm+JhMlF
         VqwXO/Jx+jfk91QTu3tAlKEftTnZQBTY/oPkQi0ArZUBeOi7oEdz2bWUNTKx4X59hX57
         Pu7Za/eveKiC3uYBpr/EtY4laP1q0UaRpEDXUv7MDCS8uxT56wCjSsGnVjGzFOrEqNeY
         4OTit9slFRCqLP7c1N4SvuXiC+RPK2BWo2WPYwzQotfxVTijIneqDYuS8/19E2NpDc1C
         f5DQ==
X-Gm-Message-State: AOJu0Yyh4tNfVmnu58jgJNl+3Ex/hcuJyLU4Dm7hZjPRKYkE2sqj/Qk6
	MJDIBPKoTXVd+htekYxMQgqlxqzQiw5/74i2JZZTNh5OhWAUgXHdn0EykazS30pTSbKNVQGm8AR
	Zfmdu1obb1sGXsQvIjEMJevoOwo7kG7kQzTYkEjJ0
X-Gm-Gg: AR+sD12BH2P8LXLRMcYDKJIJVdomFz962XMOMKB9n3Esz4LAPFgddzrR0mbDhI/VFhR
	xyvy59C/bq5gdBUmI1BFNnfhvXFzAxp1r2JjPFvIw5I5N/XXqvwPbwa1d62c+JXCG1sJrknXXMP
	SMslxtUsVRz2rxIlnR8Aa1CD7PU3vOLmTQ/jnBNPj7NH0V0QVsXU7YcnYzjdHuOpcevKX0pLm64
	i9giXHcVtKwQBGGm5gGmJ+KRbBU65B07eI47yDRwX5WZqxDZRUjCqHwR3qqbswphHQzX72lpnNX
	AJSN4i1vEUQkgYMldXVO55XLI4o=
X-Received: by 2002:a17:902:e802:b0:2cc:a859:d404 with SMTP id
 d9443c01a7336-2cfa55cd5d1mr863615ad.23.1784749076764; Wed, 22 Jul 2026
 12:37:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1784726895.git.asml.silence@gmail.com> <f95ca6717da3c8d3649a1a7f0d883a563f545052.1784726895.git.asml.silence@gmail.com>
In-Reply-To: <f95ca6717da3c8d3649a1a7f0d883a563f545052.1784726895.git.asml.silence@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 22 Jul 2026 12:37:44 -0700
X-Gm-Features: AUfX_mzp4a2QkcqWlT4Ddz69fyMJJIoO4GRgGyV2Y13YRwziHrdNsQQhoVl1-hA
Message-ID: <CAHS8izOhJN0YzQ8ybYm57Hd-Mu8PMc2a-NZ-K-N504LzEeTpfQ@mail.gmail.com>
Subject: Re: [PATCH io_uring-7.2 3/3] io_uring/zcrx: rename notif to event
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: io-uring@vger.kernel.org, netdev@vger.kernel.org, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 6:51=E2=80=AFAM Pavel Begunkov <asml.silence@gmail.=
com> wrote:
>
> "Notification" is too long and the abbreviated version is used in
> several places, which is inconsistent and more ambiguous for users.
> Rename it to event, which is easier to keep consistent. To keep the
> change small, only change uapi/ + do necessary fix ups, and the rest of
> internals can be adjusted in the next release.
>
> Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>

Probably a basic question, but isn't the stuff under uapi/ supposed to
be a stable user api? Why is it not a concern that you're breaking
current users with this change?

--=20
Thanks,
Mina
