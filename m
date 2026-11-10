Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318507;
	b=DguAN5qxcE9fyBLXaCbYlWwlm33kLRiIZLqQLtrFhfqbNpOXrQDEX6l9N0x1/Ffogilp
	 l25deERxSjb3MdFNhtVb1bQ14Fd40tyx0q/M3qK0zbkdd3XmFoFP+yJlbEZx0y22RUMox
	 0V5htD/khgPBrgcONOVc720CgBE9SEzcrp01Wriq0O9rQvWzLOFNrSTQJaMbt41I3RrV9
	 rC+EArcoJ+CPMp47tHjF3nIpCEwg92hQRojIUWsSxN5n+MHMmBjOkdkCUCNvhZgwURthx
	 lTgoPH2c1exOCt1Yjh7cS8zdUwqDtWMJrQKJahqSfDpDxSOBUcSLT+goZUjzhWXn+MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Qa/RCZFR0wligE06OpZS2PXhYivUpmqS4SHJe2hoXp8=;
	b=1dkNvZI/UcFL01rkyu6J2ZaFAx9ac4T3Fz/WY6tsEgWCJq1rqYM50nqMNWcK7n1BZohf
	 riooyN6ReUgFOaanyZAGtsUQQPD8tqvsHY1D5oJ4alx2hINM0I0kKUnmYFNSBR+LTf1uK
	 /qV7XU8xGO8O38CwXxMBToJOHLMqxvVOE/noQx8PPX0IADR6gk453iY2e2cFnwJtOyBA8
	 vNXvNOD98ovxcatyOTQNrAlCeUNtUj9cvtpqMF+FUisQqOtd1Yo9xTkggi2EY717VIMWM
	 sOUjfw6xWOCOkXHX48sozJAt5Xn865k6e8BiJyu/3ry1w5l2HQy/iZ1zIoI+0QULM9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HB72YQ7b;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0822960A3803
	for <io-uring@vger.kernel.org>; Tue, 10 Nov 2026 13:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0822960A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HB72YQ7b
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36f6295304dso2712187eec.1
        for <io-uring@vger.kernel.org>; Tue, 10 Nov 2026 05:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794318504; x=1794923304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qa/RCZFR0wligE06OpZS2PXhYivUpmqS4SHJe2hoXp8=;
        b=HB72YQ7bzSNDKvQpdxAzIXhw765K3FZEu89E/O9EvBAPCZqbw16+8jdeStxCmh5A15
         plkmjPO8EHmTzJvTZ5iu6BYR5NFtuz+PTB7iWBCPUIRLkCgu6DZUC9NPs+2aGFTMkAeF
         cdfF57UkHI3sFT3glI4X4YC+ImrI5h+BfInsK0pf8epb50QuCpEkzvlJabGla57nhEm0
         qtRQeJYwqKPqJFXucU+zDvokJIDv8OtwSOdgHbYYEgnnlt4BzpJeJPiYDWxA8DhLQvZF
         RWc/iO9vAht0cLG9xmCvvnyRMTvvz3L9yaRsIuNigHxgDc+jeJ0hdm5KfBq45theZ3hx
         MS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318504; x=1794923304;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qa/RCZFR0wligE06OpZS2PXhYivUpmqS4SHJe2hoXp8=;
        b=PFV0Qvz/3zIfIXczKI1H67tP0BAPkwFM+ZL/WEVDYxkcS2EtrXAPyt8DDKpjPKYDzq
         t1aGUBpajVJZsrDFFUfpzdpVVvFs/7+mQpWGZlUgpDRXQ151QZRVVqOnlthaMPtbCpzA
         Sxq6sbN8wxiJzDHHTI9BCvAsLgVQNdKW/gBChlRveD2ZgE/8GD/8EAoyNEunp/dZt/E6
         Hfwwmk2dEOM1VtamDZTIBlemKSBXnTIQySjQdyIR22D8D5sLUU3X0qIqfcVH+y0B8YoR
         LSVjzoRHMMXwlbTEhntsg6TEDyVCMW2I1j6gHtk5hs+q6LzIFjzt73qFGcHr2tXP4dKu
         QnZg==
X-Forwarded-Encrypted: i=1; AL+hErFxytA0LZLYgwh0E029Ou4IHJ8EyklikaaNa6XwHdXMbN64EAEJPqUnLkv1bjMVxYS5JbpO774Wbw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8/fZvJzh2N89ODgapsN3TQz/Z+MyXmLNNzlNeZkEX4PJIHc0tG
	AnVtGz9j2B6fVLfXbw690WCU1BK/iQ+0dLoxZF8AgublMdX5zTp0z9jHc6ZK4s5Plfk=
X-Gm-Gg: AYBFou2DjVgz/E73Bwx0aX/j+oICZA8Sw7ym9UuT1UBFCh40FeVItmZSr72NcmK1yiF
	uFkngdFQY5Dv0l8WTTclt6x16R/5Eq6mASY6uuRMTyVMMTfr78rLvIOehnEuhQLrnB7zLgNjEYo
	Jx+t//VMdoLVeCzFuCAZmyhI95ZjRsJ8Lq3xZiQsCcg7bhgyaLrIxKnnrkHTZ06vG262Z7oftdH
	NtHnTrlTVi7bmYKESEigWHd4Als+0smJiXPh9x9M08/NwtiU8LPlBthzMWn5112zSr7V7mxcZ7G
	svkeambyO8/Twjpm2WYA4u4CfngbHRKOkeBN07D9PmTVhO/uiykhlP6wzY8/EbeeTJAOVewZysw
	279ApFMZrgLjYf7S+ZTZMa1ceX9fEWSQGnijxLSSDhkJrNMzJiv/b/rCnddfoaR56FvBMnRR3Ea
	8QhImzGKogaqbr4MXV1Bh4KwrEO4zR7qda6NRFuWE4vvQ3XaS09Q+ofWpRWQgaWlS9g6x86Ybqy
	TH+zR/8CYtXRuGdG6fMcNGXsYjIJlw2uGWgPoLRGmtunlJcxNkPWovpsyahqGePrHQy5wlAUZLx
	n5qpUF9N+O1c5dVE+/YaIzoTYOt9/+/sNwK5TPslV3WF/HjSaB5i3oYdpMgHUGurL3fRSaiwoo+
	FT6Mta2Ximm5nqg==
X-Received: by 2002:a05:693c:8350:b0:36c:a1ef:f8f7 with SMTP id 5a478bee46e88-3751c82ffaamr3514528eec.4.1794318503557;
        Tue, 10 Nov 2026 05:48:23 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e7d24sm11503678eec.22.2026.11.10.05.48.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 05:48:22 -0800 (PST)
Message-ID: <a8dea1a6-1f12-4f28-bd41-b751b3a9c7f0@kernel.dk>
Date: Tue, 10 Nov 2026 06:48:21 -0700
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
Subject: Re: [SECURITY] io_uring: ring resize splits mixed-mode large entries
To: n3rd <18670333770@163.com>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "security@kernel.org" <security@kernel.org>
References: <371cd386.bc0dc.1a1c5844185.Coremail.18670333770@163.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <371cd386.bc0dc.1a1c5844185.Coremail.18670333770@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/26 5:52 AM, n3rd wrote:
> 
> Hello,
> 
> I am reporting a security bug in the Linux kernel.

Congratulations on being able to run an LLM, less so on being
able to read and comprehend anything. I'll keep it short as
you've already wasted more of my time than what is warranted:

1) No need to CC security@ if you send it to public lists. That's
in our documentation
2) Send a patch to fix an issue, that's also in our documentation.

and most importantly:

3) This isn't a security issue at all. An application resizing a
ring and getting a CQE or SQE mangled is NOT a security issue. It's
just a bug.

If you want to actually be useful, send a fix. And don't bother
security@ for trivial bugs.

-- 
Jens Axboe

