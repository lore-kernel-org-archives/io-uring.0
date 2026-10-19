Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437187;
	b=fc+jvOUJtafDrl4RNWvtcdhlIjDKyJoLdXe5ntET3UwJHAtVN1BmMjYfQwFEv/MoEtN0
	 yDX+WF75PZC5HUkJdzZV1jD0ThVEcAuR8fTtiEyUNObNonujSCWUV+xX9sa0b7x0/13RX
	 hOQo4JT8zdXO6oC2Lbn06iAC9AK8lyPKniKQkJOBzxg44XF+wcNK/Ygu+OZNqv97955l8
	 az2KthXCWP41jy+f9nTPDxbYIlCjhOcWmOncrRwCp8m5mqG9tYUgySb5rQrOHaGyhax+E
	 P4UhScM8I60b5FueuGLkKGqPgsHJWIMKRAhKuBMdBpnuPREeq6zERZuIKmDfEWtDfUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=JlYuJFL698MPXVE8UPk93QJm/Q3q10vd5sQJv1hUa+M=;
	b=pujBTOa/nfiIXnIZOIbPy3lNg6oG5rllXk2XLLY0OXwTb8xMOSY0kjC5KquNnEVrpzwK
	 eePKQE/lNd9R+J04m4pBn/MXwm1PRGjmiM9cIokpQVPMOepf16wAg4hiqXakTy2Ti15m5
	 li/E3Pn7QNdh47mN8ktzA1opf3r4aTaEddCSs+KDvHCYNAfinz8UI2QQuL5wXfeKPJZ++
	 fx+NgUBZhFqrAtwGdBzPZIzAA9AuEoOGFhHnfo2R4cXaoDNAOBIhdRolOtHx9MftYcWEA
	 NdRXdy9MI3/fsWeGdnIYJ3o5uwMHgMkgjoB6N9fxC1SpV99fJ1OrwMWOdKo07ANIjHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=ehcUHhqd;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A4F606A319
	for <io-uring@vger.kernel.org>; Mon, 19 Oct 2026 19:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89A4F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=ehcUHhqd
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-847ac7ccd85so1071325a34.3
        for <io-uring@vger.kernel.org>; Mon, 19 Oct 2026 12:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792437185; x=1793041985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JlYuJFL698MPXVE8UPk93QJm/Q3q10vd5sQJv1hUa+M=;
        b=ehcUHhqdv7LAsfYWK9WpM7vkkCvXaZnvosnqo7AqRtmWKd2hRMSZOu3mtYiXX9DUB6
         P65CFuXOdhVpi0F/LS+ta328YpW80vsOPoSyTfqu6ncXmNMZV9tSS2gqfpV4arVmGhsL
         5WamlmOYi830m0yrB++Shi5d8uG0RhafYPdWNeEz5e4E4FavY+SjM3r8DgunhCWFwPSQ
         OiRP0GXzSIQ0LZnmya2uSeQoTWMib2scV+qCTPOkOasY4Lc7AeWiP1KizpST3UUCwTde
         /sNkvtmmgPkdlgido/6lO7l2j+Dx6Zp9u/58DRqnbvcQIPJB8bmgAD2MJSOROa3EJbol
         ASaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792437185; x=1793041985;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JlYuJFL698MPXVE8UPk93QJm/Q3q10vd5sQJv1hUa+M=;
        b=T6hOdozrIvxWfEKzQLZxSytWEmShCEErA2J0xHzh5/d8VIRBS861J83/2itz82dF8O
         neVYJNqCCc5AUJKEdUHKuVF7BLsqk/u2on6LhKMt7GK0MEfEfv2FG3yNBnXrDdBrhJdJ
         UWvN9TuBJf9wq5PtoHhxXhhpkMrOny8kJ+iQzzj2XOdk84S2jE3VP7M+DrpHJ9oDXrPf
         gwuLDuJIOeDXi3KYR2CZEd8TjcBVYhyXneybOzyQPQOIF1V5f0/Nrcj1y09C580N3Gxj
         1o91PylDXzuvnOnUBgo8+WYrhbyqc8rgG9FDSNUY0ucaqHycS5rPIFji9uXpwYVFhZKg
         Rj0A==
X-Gm-Message-State: AFq9FYLcVgPniP3K26RpR2AFF92ZGuTkQRQhQMs+aekj+uLXkqBn4dv9
	gvFFvSN+abyFkNtffj6UHH9Aw3mKqyb7H74OLQ+5YNtSjaj/G8lSGovxz+ywamlDBvPwKpXDmp8
	j7GPzbeY=
X-Gm-Gg: AYBFou397Pyqj4WVNzkOHBGb7ObgzbYfncZIL8eoC0uFXxub48yMA6TELcD3Y7trLfN
	acVo/Qev1ETI/JM0YCqK0dBLS04T7U2n/jw5vHAYdEdJwQfhFYU8NWuRJct8NtX05rasocecjB7
	b615uj2xmh/hYc6CF/YqpiKFoR92FGjxvvWm/vanBmw/W42qQnVe2Xh+F8S+w4Rvwy5x4IUaQ7/
	OENbb0JzgEubjvVKmphBTLLDmpq85TULIIhvH9F4twjrSfIPxRUuyb2M5vJxqBqpNrVrKhoJAmm
	RUTAWxM36yPpJhcCzuLM52819stEr5inK6A0wOHu/0j1r7MIyM095YhOmW4nHCf3mwyd3j1GNVx
	3/xS8SHdAZ9PU4NirVn+aHSejT4RzRJZzfSyqn7Q/CZpmGU1XR5N4U0kTUhhxS13Jvqs7xE8usd
	H8S6jxgpkLnkqJfuysjB3IVmMlwt673mwCzXkF/GmF4DM+Ij44Fk9/NMX0JII0AmVsC2Pv9XGsI
	6NlsICZLoIQuBP3mCAMpB6Esag1wYHD4JQRLpWk5pa2g4DWQOg+9G5d0t3XJITSNQ==
X-Received: by 2002:a05:6830:6738:b0:80c:d34f:5f5a with SMTP id 46e09a7af769-844fffc14b7mr6946604a34.19.1792437184957;
        Mon, 19 Oct 2026 12:13:04 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8462659e3f0sm6669149a34.17.2026.10.19.12.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:13:02 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, Junyeong Lee <jylee5498@gmail.com>
Cc: greg@kroah.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20261019152100.63565-1-jylee5498@gmail.com>
References: <20261019152100.63565-1-jylee5498@gmail.com>
Subject: Re: [PATCH] io_uring/waitid: prevent cancel reference wrap
Message-Id: <179243718143.3127071.15080151622998954631.b4-ty@b4>
Date: Mon, 19 Oct 2026 13:13:01 -0600
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 20 Oct 2026 00:21:00 +0900, Junyeong Lee wrote:
> io_waitid packs the cancellation state into bit 31 of ->refs and
> uses bits 30:0 as a 31-bit reference counter:
> 
>   #define IO_WAITID_CANCEL_FLAG BIT(31)
>   #define IO_WAITID_REF_MASK    GENMASK(30, 0)
> 
> __io_waitid_cancel() marks a request canceled, then increments the low
> bits of ->refs to claim completion ownership. When another path owns the
> request, the increment remains even though cancellation returns false.
> The request remains discoverable by cancellation, so repeated failed
> attempts can wrap the 31-bit reference field to zero. A later cancellation
> can claim ownership and complete the request a second time.
> 
> [...]

Applied, thanks!

[1/1] io_uring/waitid: prevent cancel reference wrap
      commit: 98787d3fa4e99564d2b2bc21255b21f670c450d0

Best regards,
-- 
Jens Axboe



