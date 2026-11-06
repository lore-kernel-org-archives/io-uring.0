Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986456;
	b=qw6TB4wSiwzHtLt8ncEFdyl18uDFObVYQPM7YLZJEU3LYcdcmTtYcYynFOYF1lgiQVr4
	 M/8kNjtt9DbETC4W/i21i7EofrxI4kg9P9ky+3xWiB7e1+S3JBEl6AaxE/E93lbLWUscP
	 S2OVt5dTRqayaggEGdIjQbYGwtHlSNUqdyC/vWVCWrnFn3q5ajIil/4MQL45/oYD49aJa
	 3o1dLIM/JsOVXwVGwqccBT6K2DYmeiHuuFr0jQyYB+5bFzjAzvf8d/cZTwMVq9H7P8Kp0
	 735IRhlUDIK/fGAuSOTFwmsjJUEPVAbbBUClh37K3Neww/FzKOMopbHCSjgIgsGyFsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=6rsNhxKU4Uq6TJj9umYTq5+bXlunuJ5/jQ9luyM1bCE=;
	b=ng4lA/kCzi8bw5sbGOMXu3YZgudOB/Op6Ph4ACl9bHJl5wTskTCBIYj8Q1VDAEYVVhdG
	 +bsaBrrjF9CMsqxnUjiTgLvaHJJwFjNWKutESX8p/XSY52k8JLI0jcap6cJgIhASc8gzD
	 bWp3R32GrM35DMxrHEDBXKwYRR/x2MdvWQRjoRYqL8oyawvmdQ/WNze9D/tjHAC8V46UQ
	 uj2yvJaBcE2OKzCOH5jdUoDhzpfw13Hy6TZ3G8gPb7m1F6rGHehiO+2qIiJt6cJsUrekO
	 7dWjDE2FMOXPiK8BhVPgt6hIrvmOdTQzaziANDeTxL9NwoIyN+WW9rp1+AjJPSM5P4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=H1n8peoM;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECA2606A326
	for <io-uring@vger.kernel.org>; Fri,  6 Nov 2026 17:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DECA2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=H1n8peoM
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so576786b6e.0
        for <io-uring@vger.kernel.org>; Fri, 06 Nov 2026 09:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793986453; x=1794591253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6rsNhxKU4Uq6TJj9umYTq5+bXlunuJ5/jQ9luyM1bCE=;
        b=H1n8peoMAqKlFFts4q7qsZyavtsxv6Xj/IKYK7QUEhpvVhDCbI3FHLnzVZ6AqNSqnY
         OQJxro7CJci/kmR/w8Ramc8i4NjtoqfL7Rts4ErC9dR97OpiUSHtXW+MqxkSctC1qa8c
         nyr7Gt68/h4GDFItq3Jzz7mW44evez2L0oINWZfvijjhPGS4NtQY6RTNTIaYublj0O/u
         5lfAbwywwIY8up3KQy1H48g3+LnMjpdhHQRemisPVk9aw2SMIHR+69TjjQ7IR8+DwDGG
         992dderweWZWd9pNy/7Sw2Pdfh3Ts/mN1pQjTwSqQ+lkE+/Pei9J0lSxNCV7WdeGCYX9
         vd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986453; x=1794591253;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6rsNhxKU4Uq6TJj9umYTq5+bXlunuJ5/jQ9luyM1bCE=;
        b=17H6v/TRxg3NlY0JxVc4r/G07MD/shaE5ncoC54MypsaKwmcoDnchgzdpVSmxlTT4X
         A7ySOQ8qxFWa7FnowppjXPx3o/KO9xDFgno9ljA8C3eignkbXB7Uqu7Y+fzsyXJxNBbG
         DfWi4/fhPFIPzEur1SCXUIlJ/VrarHhj3/MGz549MH7vPjRRI9O/MsFAqqX3haf1LgQT
         X+LL90fnSytEMsZ9saZvryMczlPLROcRIIwWQVNSqJjsl9jH/vWEP0lduXUKbnsSg6Gl
         m1u/UR8nuojoPl92cVTSPfAJEEgWXGSdESP7FevdZzLDcMo1zVpPdnpNaX3QCee4TrAW
         ov7Q==
X-Gm-Message-State: APuU4Z/T4mAFskEWWwhA7ZK6w8jkALiVx+4ar8ze3MLW6VGAJO/A6J7H
	50VBAnyRdcMgT4tHC1OE2jEwGz6tJa+68wJ6gOHUYNg4VxHBqtWs05NnKWF44A9Z5Ms=
X-Gm-Gg: AYBFou1rqwSkO2YTi9lw02DHly5d/lr/nZnt2//Z4tknVEYdHKIWaAlVI5lWLKvJc7M
	05z4ueoze2QmZuTu+PAW7OH3k2PHMQF1w0H31XXIl6/CjR2BvCRPsV3Mw86K1DMeu3RFv7ZG8Tl
	IGhMdguT/W5BcYgAx8OURGZjWpdOiX8aYDpvTFBxWavOd73xSe1qUaO4RJJ/D27pc2P512exb8b
	LQxNefBOUXFBy1t+dHBluK9k/tyHmSFuYqf5EMCKhW0dUPl2iIJK2PTF/6wO3ZPaV84O94mJHvD
	IlBEbQGEWskhMF/oDzuMti9D2tdGbg82tf+lFpv229azkLkBvTrmwuICZIzMFmWsjVwMtRcXwpU
	3ii0sBWJB88O/Km1hlKyVqM/lzUUWqsCnB9F8Q7UYcHca2/On0nw+a2cOU85r878r9+BWNOoSEE
	C8oeADoyN7kX2CSTGC4QEd18Zi3O/tYLPJi3MzmABNHglmAP0El9bGB9Jsx6m5mJMbMEo5rSNYx
	WDnBe3jUFneOcGfsoPa92eEYSDm9V9/WnGDx6Wns+7NTlyOp1V/GPJFkxxUFvHyiaqSDVsz0X60
	1kzTfaYshM70Z0zvYQd+HkVuOVu1XRNU9osUiHNtneun8xyRI3cBgavNLB/OTU6Ndg6WUjJM2i7
	att7kxo/H
X-Received: by 2002:a05:6808:15a7:b0:53a:e153:e901 with SMTP id 5614622812f47-567e0f42f28mr2650995b6e.2.1793986453280;
        Fri, 06 Nov 2026 09:34:13 -0800 (PST)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567e7e5f6e2sm1932773b6e.11.2026.11.06.09.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 09:34:12 -0800 (PST)
Message-ID: <a41c9599-f668-4920-93fb-c4dff42b2856@kernel.dk>
Date: Fri, 6 Nov 2026 10:34:11 -0700
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
Subject: Re: [PATCH] io_uring/kbuf: fix cross-mm interpretation of provided
 buffers
To: henry martin <bsdhenrymartin@gmail.com>
Cc: io-uring@vger.kernel.org, stable@vger.kernel.org
References: <20261105061433.1947491-1-bsdhenrymartin@gmail.com>
 <3f0cf989-c294-44ac-8bf9-11bf69dfee45@kernel.dk>
 <CAEnQdOqaGiexk6BcvU+L1xoEFDr1e6sWzm1VuH-JBJJKXhc__Q@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAEnQdOqaGiexk6BcvU+L1xoEFDr1e6sWzm1VuH-JBJJKXhc__Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/6/26 10:31 AM, henry martin wrote:
> On 11/5/26, Jens Axboe wrote:
>> This isn't a bug. A ring is shared memory, and anyone with access to it
>> can write SQEs that the other side submits, with whatever addresses they
>> want. Provided buffers are no different from the addr field in any SQE,
>> and the same holds for ring provided buffers which this patch doesn't
>> even touch. Sharing a ring with another address space means fully
>> trusting it, that's inherent to the design.
> 
> Agreed ? the SQE address fields already grant that capability, and
> ring provided buffers have the same property, so this adds nothing
> beyond what sharing a ring already means.

Forget SQEs or whatever, what stops you from inputting a virtual address
from another process into a read(2) system call you're doing? This has
nothing to do with io_uring AT ALL, and everything to do with people
using LLMs to try and find things and not even considering what those
"findings" are before sending them out and wasting other peoples time...

-- 
Jens Axboe
