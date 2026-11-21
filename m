Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795294799;
	b=3VXYHLgijaCF49cz0zxjsz0B9hLm5QWEUo8fhNIpsLw6++g56ouA9xelb/2j7JUXXqJn
	 Vrhp8k3dL3w/kWyw7DDh6hAq4F0zQlqsUl6dmreHtxF7CF/3LsgdxYKxtGPVS3fSbZC4/
	 ZLnuU/DXQi+i617f4NVI2OoDjjPRxRmkLx/ng3HrsrPNlnrMWEyy0/O+pRLBsbdRBxH8+
	 q1GMjWvVwDzGAeQKnvHlpjXmbEJCj56xy0vOb8yMNfImFr4iexvNk1b4T4RROXSauKz/K
	 b3OwLlfvJnltylDCpSps91PCrE5bITRvuE7FaZByiOOcRQhkKSRxHVGwMNTgM5TSy5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795294799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=rNw2ecWt+pedjRV7G84Ccjw1Wl3MuYIFanxv93/iz/o=;
	b=Q/tTiQ6qYY4/U4oKHs82ZC8AuSq9oJd1R0QXL2UFTHi812bYc6pRbdY64KtfKy2nqA3F
	 o/P/+yQnq6D3UDY6zAbIxikaCoRiWmJffIxp/ni42AG3GTUYjfn/7NDD0j9avZ+Ah3CVk
	 71rrZ9AKPLDOLzrpE7HpmF2jIrMdQovxxyY1e65x/MvZRfjNEV7EYZKT4+/Ax6F0OCNSE
	 8Ai6dDHAfvUBgdtxUTLItpqtm8/nj8hlvmVs0IlyqX5Jwmi9u1z+QQvvntVR6SamSZ4Cl
	 ATAONEG1CwpeOwkXzLDITVfxHfAeIH4box55gMx5cv/IItJBTOPLmFfGtm7LdoEqAtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=lvjj7xOd;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F88606A331
	for <io-uring@vger.kernel.org>; Sat, 21 Nov 2026 20:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0F88606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=lvjj7xOd
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a2af4c8d00so3737158c88.0
        for <io-uring@vger.kernel.org>; Sat, 21 Nov 2026 12:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795294797; x=1795899597; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNw2ecWt+pedjRV7G84Ccjw1Wl3MuYIFanxv93/iz/o=;
        b=lvjj7xOdw3xTA4GkmGztyREs3+ozvUTHWhnvNJgZ+DxBrXYHSARYgIVqE0UJyKYRJq
         dm74/jbZ4y1n1sd270cLncz7f9DBhoAY/Mp9/Gn3QmQNW8Bais8ObIngA4JAHKprOgvQ
         Gwng0HJDwDlfNxVJ942VYOyzl9eRWgTBJDgWm3QahlFJh9C2oLG4U9PKC+V12BS6yRWv
         zCQQZu+JszG9I4DyzAXIxv+3suJ6jXc8mA4sQoy2yZv+oOJPYsld2bxYfmdxhTy1JylS
         vMTHUUXnUaDZVf6mJi8j8hEZp35f39V4wUcQ6K/fivTDUCBGDyBOPzrh0K/eipCO3ArQ
         WB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795294797; x=1795899597;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNw2ecWt+pedjRV7G84Ccjw1Wl3MuYIFanxv93/iz/o=;
        b=cf5Msd5ywIpewLdQmrBBkfQfbhVJ3CUwJB+isGp0cN95YiQnPZPkB4YBIjsQFzpwAm
         9fRLPp66XLH4LaBn9WqU2OK7FzF+NF3Q1Qow+3kDQgrPnERMXGeHIxiMfr11bzGs2fxZ
         UCIzayK36lVnNYdnmlm+B2JaJ2I/I8et/Peh9HQQ5RqFTfIORWkdjTiWshT5GYvsWV3C
         mDJYcRdg1POH2+KXcqaIwG2W8Aa6zNJyC4CoVvJ4TleL9uwaGo0x5ILbTlz7E7JwgFag
         WI9f9JrXuXcmNMSV3l4/MmJ4HoWT3QXzYRnGlUqtAO0wyGPm7iNzJrFDZk/Xfjdw6coi
         IDxw==
X-Forwarded-Encrypted: i=1; AL+hErGu37fEJB+zxmMv8AhjdIB4orK/vUxwU/e0hLOqLI4rRrhYcO95Ojz33xd8nxjSt9a21tZKPmXVcg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8HB7Dt/BTUwvnxGxfziqVnWer12ZLfBf8Jne+rVx/ZCx5UCqjy
	sN3fFN4/wZZUL/bWU7YNDPAJ9wZBNuM3oecA8x+7gI7o4FlJyJjav/Hs4TgX6JXpWKlvKTT/sRl
	9VV7PDiA=
X-Gm-Gg: AZFdTZe9ZPnVS/w3G9evHeD1gsvzofih8Jim6AyxB/oPkEN1EKPulRJVA+NnGUgZ1U2
	PMH3Bvo5vJcUxsituX9lmgWk5YuYx2usYLNd6wWGNYRG7XaNEerpege3pU6xvJv3uNrhZOlf9nJ
	QtBN3Gk9NNRXwhlmYYPEn3HOsNixB2FPIcTY0MqcAy1QLLXpw9vXpIPOaYgPaa1oXskkMoMQIEI
	9pXtkzLENq7+95xGE2rDO0Plme0l2CS8W9v762nHtzG1Jklh8XBbm4229xuR7VxXXGHR/BTsQNR
	Uq1X/blZ5vopt4/dQM5lvKis3eB5ZhcsuNeES+oNhOJfZCKTLa2Ms8k51IgkcRkVpWeHwchOHJZ
	JuOqZR34LECWFYR97MKIQonaFvDEX5pe7032/n+STfT9YZ0hPJotfqeyqXuhgKEgyG9RSZp7ac5
	+NnfX6SVWvJpAQBZvmz4NuzEK0iTpsRwSHv9r3iTtXDHe7ZkMCf0Dc/Wz6Y6GfAinX0HCkOc9Gt
	nnIak+xExkh+jt5AfKnjACFzJWyIwzm3K2Ebc+1pDaPMQggJtJ4b/GStw/Bdyv1RqGbH9RhE7/K
	lk5+geD+rC9PFjJ0v92Kj1qHqqAjT7F+LyZMkSJE8F54si492QKx7aRj9AX14wCzo1ZRhr/HU2e
	kP/4j9CCrMvXhRu6obts9/7J8HCV2wa8LGW1I1MMw93pluH/i
X-Received: by 2002:a05:7022:b051:20b0:1b4:e533:ff50 with SMTP id a92af1059eb24-1b556912ca9mr7773791c88.40.1795294797090;
        Sat, 21 Nov 2026 12:59:57 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm16445888c88.1.2026.11.21.12.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 12:59:56 -0800 (PST)
Message-ID: <c4da472a-1f3f-4676-95ac-89a4a3ce4a4a@kernel.dk>
Date: Sat, 21 Nov 2026 13:59:55 -0700
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] ublk: dispatched IO intermittently never posts its
 fetch completion (v7.0)
To: Luciano Lo Giudice <lmlogiudice@gmail.com>,
 Ming Lei <tom.leiming@gmail.com>
Cc: Bernd Schubert <bernd@bsbernd.com>, linux-block@vger.kernel.org,
 io-uring@vger.kernel.org, regressions@lists.linux.dev, stable@vger.kernel.org
References: <CAFS5DSFUi28HgX8t5bRRGVqPkOZ+VqrP+LtyMiwPQhyRpTxFTg@mail.gmail.com>
 <556c4720-0159-4874-8d5b-6379566f6d4a@bsbernd.com>
 <CAFS5DSEhgk8fJgAwEn+-U-7vnBchCrx6L1uReT3Upm+AA22=Wg@mail.gmail.com>
 <CAFS5DSEsdz8Eu1vmeCkE+6eeXgk+9yS6EwqyHSeD2jkq90DZaA@mail.gmail.com>
 <CACVXFVPEaJ6oPOaoZZo_XMpywHCzFWSYCrKG=srEDpCqPRp=Dw@mail.gmail.com>
 <CAFS5DSEp13YPLwRut2OiQfQqO70s6whbLWmEQ14mt8_JjBfBRw@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAFS5DSEp13YPLwRut2OiQfQqO70s6whbLWmEQ14mt8_JjBfBRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/21/26 10:52 AM, Luciano Lo Giudice wrote:
> Hello Ming,
> 
> Thank you for confirming the apparent fix in 7.4 as well. Do I
> understand correctly that no fixes to address this problem will be
> backported to 7.0?

As Ming said, 7.0 is not a maintained stable release. That means
no further 7.0.x releases will be done, and nothing will change
that. Also means that if you're running 7.0.x you've been missing
out on a lot of fixes that have gone into all stable releases and
upstream kernels since then.

Just get on 7.3-stable.

-- 
Jens Axboe

