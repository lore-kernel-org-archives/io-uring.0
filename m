Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FCC4EC672
	for <io-uring@vger.kernel.org>; Fri,  9 Oct 2026 16:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791563786; cv=pass; b=jggueueCKsqdaSlXJ0jJOSP+jywmEzpcLfiQMJrE6TiLanJMAoq3PMnSe0HvwI0pu7HbamYzMLBvglRk8E4uh0H8ZJGXxKlBwWF+Gxk78+iQKfHH/o0b/R70pXLEA9s5e6VJSlY3xHA88MiJ7QEAobLjfwAXBDgEVtvpGgHv2EA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791563786; c=relaxed/simple;
	bh=lX0tsF2q3YdDjvQZqnA44IvPaNuhxZo+PRXzkTKRxuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BFrcxWvPCVoFovIoKtTLPBQodA9WIjc95mxFh6bzIkX6XyXIPme/X+VfNGjnTWU7ztl5iu8HO3HKquajTtt4tSqDo1dh4gDhFgJ0ksS2ccfMojMVP+oP/gmec7a69/KRnp/OWBkonayCJ+TqkWa02MCLMgZorsZwJRJx3YrPGAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2rcV6/x; arc=pass smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2rcV6/x"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6d290b10a35so20047eaf.2
        for <io-uring@vger.kernel.org>; Fri, 09 Oct 2026 09:36:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791563780; cv=none;
        d=google.com; s=arc-20260327;
        b=Q19LgN35EoKVLXCdSPul9PvdkUOt6iD4lCAwJOvrKZOP9NLdAWkF5v/mZbxH/08y2z
         w68DcwLwOga8VgvYYjYWcx/a8I6MtQfai18BTgt2DK1huiR13Alx922XvvKsRhURJ0th
         7R7+IkdB/LDWBH5OMiLReerb+kg3zyNzYrKZoE7uHFYOxBkw4ZbnP77FoaNCxocUmQ+U
         I5DIFvyE90aXcusgQItbVoNXRPM88LK3J2jzX3PmAdi+kLUmdB74sB0JsedUeSYxB3sP
         3iooLXyA1C1Egu+OHpTn0Vv1+GmGEyPKt6YZZQdljqoFCRC3wRRFLitK2FMS9ss6FB98
         iuxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1uyHjjKmtNFnZbUjWXycg4dD6BHAPM/N7wxrJDTWwM4=;
        fh=uVf5YuuU/F+B1YHA8skKqx1mQhSL53yKZ8/hH98wKNM=;
        b=aV+Ixe4TsWikU53jK+1LsmkVtnEmWVhLDe71lQDoPA+/a5FSFFn6HelXfHWqE1Z7Hl
         zaoNCQ02KZVkIlgrs022f94uBBJOic/X5UeeeNJu8mKTg2WpTTx5QewheIAwJVNjohEL
         lHe97F+kwu1Bx1eGZ5a1TDJz+3TjPxAbdzJrgoxzp1hG7e+ViM/3L/usdANRMvh1RS8B
         InZDo8lRk4gAgHysNFn+YfGTl2Aj6rYNDlwi5JthCpxP90cU3WLvVNpJRaZXvOGHdbih
         ghrcc4IB8Kyc69A0kGw1dIaHn1DzDbOjnO9gNLW23siEwKjkEiY7EWowM4OPst8JrlYC
         QrJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791563780; x=1792168580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1uyHjjKmtNFnZbUjWXycg4dD6BHAPM/N7wxrJDTWwM4=;
        b=U2rcV6/xcEY+pEhOzdMWu5YekoCE4vEkZYnQGdz5rZOraaPlxR10PP+9/A7I96h3xl
         gJ5KwtbTp7AXu5LBcpYQs5Oq93UIA76S6/eXe4jn8Ufe2dgb2POmbtN6F+ULrgU6EoxQ
         IeTOiiwslcQNPu6t0zYfOpVIP6MJZtyccIJkLjUJkRi6fXU+2z0yTkR3s8AKfVwjG3y+
         T5Wschel/dXqI0ezIc0fBvuYZNq/AkuYzNILqs1VyXmR5+lfRHSbudPp9owCsRczSlPW
         jEqbyXVjJQnLnGHmg1irECN8xfLwO1czur1sI0RrQ1O/k9qbArBLC7EhI2TNVq9so2Xe
         jCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791563780; x=1792168580;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1uyHjjKmtNFnZbUjWXycg4dD6BHAPM/N7wxrJDTWwM4=;
        b=SCrVoPkrefd+DpzqjutcBndIXD73uk7rRdSuDWWfNuUzZpKFDvetsmbU4OZi2xRHCT
         QMEd6WbfKp1WUtBz5dJaiy/br1yO3fUNu356frjE0TlOfFwDkgVCtN8r7EhhbWdhO+TA
         SRMtW+xcPJXzsUti1k8LLnPWhfkbjpmIo3YYz/m5VqbWxg7Lewf7gi++JVRCveWcOicB
         5S0+MZs9S4B2Lc5MycHdvV76vPctBLWj25mJ/YOlWL67AfTSu92oOGsX0AESowBniw5Z
         husIiMPgsY5lrAEp7J1cZ3uAsb6JPwde44eiRha4owR9IBY07A7JN052GFUGjJqHmB6H
         zK7A==
X-Gm-Message-State: AFuF++l0CZEWrDFaXLF0pFRlO3WgnUtwRN1NIiLrMxkAwJiYPcbFQbk2
	+YgV2qmqtKPqcO/vPzwWIa98OR7ziOHMABwIv8y84hnybb4u0Km1vAvKlSL3bpOg6Uq7qmv47Zo
	zcmurqUgHBXUCfPZ6Fs4Eq1CefO5m/2s=
X-Gm-Gg: AYBFou30BnAp2pug4lHzZXXAu0hp6r34AdWfLRYqYK708VnAcHy7bl/i7ouzdLSCVo/
	sNICz9QtvVTlViYRqbYXVGtA6oWyJ1RJIpqEKOjNKID50il8v3XGNK0w8zmw68ucT9uLVsUWAni
	g+hquFez2upiP+VG87RH7ukPwmKe5cPDSaLKzkWSuVzae7+z4pXutd1e6eIo3ZbfI1VSlf82pak
	/NYFOYS903OOEI3K9/a0UrbJiOiSM8L1GjufUNU0Sw9lwHM25f47w3+JLRT55wkVWIxGZOMUS4L
	88ovWadN6O4gEwXJEiHkaLiiY+JDMqKSkvjhmPXd6SxuhkN2uiEH9Q==
X-Received: by 2002:a05:6820:818d:b0:6d7:c2d2:3baa with SMTP id
 006d021491bc7-6ef02d89becmr1585832eaf.0.1791563780558; Fri, 09 Oct 2026
 09:36:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-iouring-task-restrict-fix-v1-1-a49daf55a12c@gmail.com> <179155641635.219229.11431241640736819805.b4-ty@b4>
In-Reply-To: <179155641635.219229.11431241640736819805.b4-ty@b4>
From: Eugene Gvozdetsky <gvozdet@gmail.com>
Date: Fri, 9 Oct 2026 18:36:09 +0200
X-Gm-Features: AclHuK9FRLKrIXdlNZ3dDP1364AR2m4VT5OKsQe73nSkIxYPEZV8zv8SqdyQv-E
Message-ID: <CADx8=FLUHGutCRP-6yxAoTOOQm+ozUodjf+7FO-6OqbxKt9nDA@mail.gmail.com>
Subject: Re: [PATCH] io_uring/register: don't exempt disabled rings from task restrictions
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No objection, that's better. Thanks!

=D0=BF=D1=82, 9 =D0=BE=D0=BA=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 16:33, Jens=
 Axboe <axboe@kernel.dk>:
>
>
> On Fri, 09 Oct 2026 01:08:49 +0200, Eugene Gvozdetsky wrote:
> > A ring created with IORING_SETUP_R_DISABLED is exempt from its register
> > restrictions until it is enabled. This lets the creator register the
> > restrictions and then enable the ring with IORING_REGISTER_ENABLE_RINGS=
,
> > whether or not that opcode is in the allowed set.
> >
> > Since commit ed82f35b926b ("io_uring: allow registration of per-task
> > restrictions"), a ring also inherits restrictions from the task that
> > creates it, and the same exemption applies to those. A task whose
> > register opcodes are restricted can therefore create a disabled ring,
> > issue any register opcode on it, and then enable it.
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] io_uring/register: don't exempt disabled rings from task restrictio=
ns
>       commit: 6da8f402e362b2f546e2efb7167fc9597aef6faf
>
> Best regards,
> --
> Jens Axboe
>
>
>
