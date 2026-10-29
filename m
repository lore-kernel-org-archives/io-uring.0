Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793302593;
	b=rzA7mffNmwqSfeXzwk1HNBM+sEZ/NlLhfTUu1fkNxYaZDBE4ttm/uk1e1DHtRhskGGBi
	 Plz9iA/oyU9ZVv2yCKj4KA3ZD6v2ER8qyuGvdFm1IZevEKVqrvVSNr7Q08P7SuM/ePmUE
	 fBEEs6dGnF+0KPbX3lpY0sCM+hI1HRoKGf8AN5SW1CQBl8A2IDWjUNoo/Krc0ZKXnO/mc
	 wdXvwyw0PeLv/eHqvbO5d7dUFMdfhdfvRxj6iJiUkhm+JeKiYl3m+SbDCFYJPx2Lf/lgT
	 ppKrKKXJlYTScK1DKJ084SGfkBCJSD965CaWWPJhuJUOdPqJnIz85uhgd1yG/TMQYmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793302593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=T43zOE0CfYbaUmSOOajIj+EeWl8J0bX1OwYg0FVcUt8=;
	b=ekyufUkfiOviuVVkd3ImDF8MzHPnVpnpK+5ZmZt1qQA7O4yTmf4Or3m9BOmRTBp9zUpn
	 cWHqhmDj71mDcaPZfnvb+zGGpanEXMD3cqg7etKJv8F6Oo9Rv6M3ecrw4Rhb02804pvTk
	 r5NtE7AH4Kyk+e69u4uDPiGHvnAdBw9fh8X/4b4irmT5Vje+jcDJjEgkws7RNQkSI5T6R
	 H5aLLE77wK+JO354ZVQqNVp75N7UaQp/NKFMPEM/fUt7dxJ1ZInDLJg/k4tgOvAjdZumC
	 dxDymsHXpOfKwbX73Pvg2SCkufUzkfz9J3sBSAx86o3fwq3DlBnhgoHb6+lGLd++wCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IUZRBU0V;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9BE606A31A
	for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 19:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C9BE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IUZRBU0V
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-48ed188ee81so1270068fac.1
        for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 12:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793302591; x=1793907391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T43zOE0CfYbaUmSOOajIj+EeWl8J0bX1OwYg0FVcUt8=;
        b=IUZRBU0VaSUXpxD3YZeFYLO9mdVfz8F/b6sh3h68DP4kGiOaf6qH4D8yykbvJevpFd
         2F5lYNBiBOntjQLifBd3m2KiCOSewhNDPcnMqB2vxHoBdekG0/uSg82UDxDWVttuVv5M
         npRzFJbR/xH7MCFsuZKcCZoZzihWVWnq1+038a9MU5ganGxbkLR5TLy0mZhLBzrIA9S2
         8qRJxVGpO1jVxc5Vyt0F7OdJjTGOasWCgcn2Iip8yMygv/PnKQJJ0ilzzwh8wFh+iQFN
         yRso9wjY07QcSd0dht1DzxV1FO0Trr38b4XRyEQ/yUSbcIeZxyiy2VfPu9Gkcp9CWnvI
         svqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793302591; x=1793907391;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T43zOE0CfYbaUmSOOajIj+EeWl8J0bX1OwYg0FVcUt8=;
        b=uimt3hldeyGXQaAXvNdQUyfnd4RTd8d31roYhGpiOl1mZpVt7knVMiGB0whtZ//1eX
         zKCSOe2Fyma92q1wl38DCqv6OP6VwPqBVtXotPANOF5e25piDphTZa8jQZcHRb48ca0/
         QqzRmlp0MltMA6GyEqVK0Md3k5XpZdpl5MmZtyF3NgowFoP23lkFHG/y0FYIz4ykzR+P
         MN+BaF+M7GyaPLtyj84iap/KjE38f7SjKlbYT36CPTZgcr4qjr1zWwRjYDCB3NxBUTBP
         bRabPOy3ydAhHtr9deKm40T8sRdVfNVe80nIxVq9kdAgCGvs8kO7UNmXY+06DyLowPz+
         ypMQ==
X-Gm-Message-State: AFq9FYLmWFKSRnuvy/Csy+apCt8cj65e9Beqwvv13DqT/t7Wy7Ez1OmZ
	MBVTfuLaL26+jTrd/rhOz0oiSannD21i0B0L5I2gNQ4zJoRg0pJV41n1G/qV+LVnJ4CFmsHK+BB
	7amcvRn4=
X-Gm-Gg: AYBFou31rSZUHxZCsVrrr5B3zlZMkuxa01cx674jq2D+wnboHCV0z4Vcw3sqj1SC8ZB
	8WNGUNWu04950sruaFsdaw4KpF4nDXfTkaQrHGN3FQXcmDWAu0VsTSzTa77hR5H/GwV+cRh+J1l
	GqYseQdWVrehvtCFhq/qDx12QwYS2uGQxG9VxkOuHsHE3XXZ3jeIkHLtODTzAMj2LK9s/yHgJ7t
	V543Skmmf4gt2SukV1oo3nnek55mbsrfKWUvCz8VB5tzyep8NenmTfjgcfng9X/+Dm0/4/Ktd8f
	7a9cAN/8SHZXb+DSdry3/WFxs9938aKF4XWMH0XmQg4E5BUcr+7NvWVHcXg8nNwnro7JZzfwgWM
	G9Z5E8HXGTXsKzPXyHRSSoExAGlzQxvCeXGI0q+89v1ZLoNOQ0jgufxScYNoDknOZIPvyq9fZKr
	5O5+v55RGi5VDMbEhfzYlQPAmDulI5wLDDdenHsz0s5bfU9sxc90+Bcg0Yi1IRt6y4Do1FbY1RD
	PktUByOLe6F2pWvyfefzOqkhqvi3mmGRfXdfpz/pHkM1Apo3TJoOA8iFe7Zg/mJXdL1tfisa4kT
	S2g1S2e8fkJZ7S56n9w0vE/Qxnufs7T+N0BNiosKKZ79cywP/WR0SlhzdGD7uDc4npMj/bkkHf7
	6m1MNerGUkA==
X-Received: by 2002:a05:6870:6594:b0:494:7af4:954a with SMTP id 586e51a60fabf-4a9072fa9d2mr100062fac.8.1793302590787;
        Thu, 29 Oct 2026 12:36:30 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a904a366e4sm303390fac.17.2026.10.29.12.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 12:36:30 -0700 (PDT)
Message-ID: <4a6b434c-32a9-4649-ac5b-1478c9d1e8c4@kernel.dk>
Date: Thu, 29 Oct 2026 13:36:29 -0600
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
Subject: Re: [PATCH liburing] ci: Temporarily remove alpine-musl-build
To: Ammar Faizi <ammarfaizi2@openresty.com>,
 Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>
Cc: io-uring Mailing List <io-uring@vger.kernel.org>, gwml@gnuweeb.org
References: <20261029192003.940655-1-ammarfaizi2@openresty.com>
 <hx7hcr2iwnkvcz4p2kizv3kzcq@gnuweeb.org>
 <CA+KFgX5WrBQW4qQ9sf4UFwoR4wURjKrJPT9s=dXo589hdPxRsw@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CA+KFgX5WrBQW4qQ9sf4UFwoR4wURjKrJPT9s=dXo589hdPxRsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/29/26 1:34 PM, Ammar Faizi wrote:
> On Fri, Oct 30, 2026 at 2:30 AM Alviro Iskandar Setiawan wrote:
>> It's already up today.
> 
> Oh nice! Thanks for checking. Jens, ignore this patch.

Will do. FWIW, I've been annoyed at the alpine-musl-build
failures as well...

-- 
Jens Axboe

