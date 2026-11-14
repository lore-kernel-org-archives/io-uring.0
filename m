Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794679964;
	b=wEmSMt40y1O4b6C81Ag4Cp12fhD1VD0Z+soJulRTLWd586MCFim0KZ0DdbVGPCdMZxex
	 LaCr76NernQgDTdrzQZM9ZiB0fNzbuDJJmrs6WhPnM4jALPRS0AOH/D7rf5MkQiP8cEJR
	 Rp3+bnEH01+ZHp+CIdX8c0OHOCH8EXEhvPBABXUoHGkjLFcdFK2QPQcq0h0YbF9u0KD+W
	 Qo7n/6iSTxs7gaZ0brQgl9/XSeUGC2mfWzUC0tCWmlWkSjgplYHF58KtIcIjF897jEwba
	 Qeq6vWbmfmWptWrlPRu9HGa8g9na3eqC2NkUb7mp73IU6RQ7R+vn7cKpRErCeW5By2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794679964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=1HSKcZ386dxsdeEKyF2O6CNbJmYTmTebSN/jET/L4ME=;
	b=m5fsTsvLwRfNAs52VOz5Qu0maDOrKATzUkw9bWUqWosZp4yiDlyFA/61i7rqLSsCWiq4
	 SKxGOOAA4+9gPn1UpH/OyIhtzWwdo3oOJJxajqUwo95aTLU2H64YU4xGSB3pJxx+5cloU
	 OeSbnFCa2P1vmqBE2FgUtVop72HHXLfAqrZ/3tGMAdAuzdwjVb9jI3X1VqYjj7E0EqBal
	 O8c/9jv1HA+7BWblvHOI8VVOmopc4pQAw91zgfL5mO288cRXzSavhWCtAY/joqt2p0lnb
	 hGRW9JSCzJ1XG46BOHM2Ly2uKAp/ANKaomZ6oxi7WEtzYNFbqtU9K4E5Osj++nSvfdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=G36KZgS2;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDDC606A323
	for <io-uring@vger.kernel.org>; Sat, 14 Nov 2026 18:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDDDC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=G36KZgS2
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-37628596783so3634252eec.1
        for <io-uring@vger.kernel.org>; Sat, 14 Nov 2026 10:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794679962; x=1795284762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1HSKcZ386dxsdeEKyF2O6CNbJmYTmTebSN/jET/L4ME=;
        b=G36KZgS2YkgFo4UVn91i8GWeVFgU6FJTUeyRnNUic2C9jHhLreydD9U0nFLc1KZUd9
         DDodhaJhDk0exZwqzMNB8gbvEaS9f5lacEOlx8ZWbXKcXxNKivjfJvuI9itb9n3r+PyL
         3orAY7qOpRgYrhmOuRyInjYpyUdP1SItWby+udlfr3C6Hr6TC/rm/wlfcVkzmYycft0r
         QYN4dHu8aVdPU10kBe7XvWexZHyC73A28pZR2SdWq/WeVKOBefenWOT7qeDZGH1qH0ET
         3Kyp0tSJHVKCvK6JARG4BRLoz5O5Zj/7y2jeQ/SrAgBsIg11Y9jTOZf7Zhz5g4UzhHIz
         Ivlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794679962; x=1795284762;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1HSKcZ386dxsdeEKyF2O6CNbJmYTmTebSN/jET/L4ME=;
        b=ATt0x3jN2NLgYUIy2l7HhjfRVDyn1yZSfWai0MCdRfpb/4jLJg2cM+DaiORFa4jHWl
         g+K2c6aQd999WssUnhr14192Xs24/kcboyAO6AW7QTerle8K4FHN8DOKL4wWQv0cVF76
         /ceJyKNXs3DMyFBAhKcOpFy7vUKzor686hgDJrFxGPkYg7BHNQq0qdtb1iXDPsQrHeXu
         /S0W5GO2vSEQ4PmJ8Phujcf0DunfMQYSURwaREkL8K+J7VUaBDziS8MiU9xHjCe0keCl
         lHL09OHFPq8ePsiYijkg+cb2cab1ypslBRDonZ9jdJfLj96uGKTwRKFpQ6Wq4vKipgDx
         j2lA==
X-Gm-Message-State: APuU4Z+Z9Tvrf5HfyDBcQ9KLIIBpXZO+SBBXhI4Kr4bPu42f06IKaQ32
	Nvo/WrjLs7INDxVwo8yLo6zbPAmRHCPYN7GxsAdO+iMUuRgi9L4Eva/8QK76YhcGEmPElLgzGAY
	Ja972ewM=
X-Gm-Gg: AYBFou2QuUsL/XhbuLmQE85HC+pqqtyy6Of979lvB6cnTxWYQQlZKzQ6vAVECMnDSXc
	fAe0xW4kr/CFYbiGhjHygA3DZ0eTXWaVMDTnLCc7tkMJLpSZawpr1+o/Vu6Ston1Z30eIUdbdE8
	pWhfzJ/Rw6MZHSTMbU6V8QEGXExYaUjEXK+wNYPmwznnH3Ly3CNi4P9z2HvTDQ2ayxYmfmAfbAk
	LwdeWXyuPCbgOM3eTplPDr1vIijjukkgs3R5BTpC/FGWE0ZSV+Bkz4EURKIa3N5GVoIFjXDNDas
	ULU5Klw3OtufZGk3ERpJa8pGypH6L8pR4t/k1CRyQVtwmkCcutPu6obQQ1ZFt3YRaGUIIyzmPTt
	8Gm2FvfR+WJkYAKIdhAfmEvaQzTMsmdA7oBooeDh5mKHJ761dJfDWm+KU3QNgqmz4txCOIoTjwH
	1Wws6EdDW8Jv+JuSqIViQK2S5p5fviGsu4Zxq5Y4lZdTmW18YPj5tsLiy6l4KqLhU+Pi0i2chFd
	MCZu4GRMuFTJtMIIPPINM/rXml1bIkJMDAjn34JTrOu6Eescu1OwnKthSoegQ5WwttUZMw5oncV
	WBOuejR6I3CzWFAUPMVEENK4jMfYO90Oc8GDK8rtvDM7SSPjlEH9BwnePr+apVL26FhC6gtgs2Z
	M2I7GAarZPe69
X-Received: by 2002:a05:7300:f794:b0:36e:58f3:6f0e with SMTP id 5a478bee46e88-379635648c2mr5638645eec.5.1794679961789;
        Sat, 14 Nov 2026 10:12:41 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d73dsm19082212eec.2.2026.11.14.10.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 10:12:41 -0800 (PST)
Message-ID: <5d92861f-9a4d-4810-8700-b9e457ed9c86@kernel.dk>
Date: Sat, 14 Nov 2026 11:12:40 -0700
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
Subject: Re: io_uring/eventfd: registered eventfd signals only once after the
 cd305ee3633a backport (6.18.y, 6.12.y, Ubuntu 26.04)
To: Sasha Levin <sashal@kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Cc: "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 Yufan Chen <yufan.chen@linux.dev>, dev@rebasedinc.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <oMhla8VwCWoihfrmgn8znIy60W1QXI8g_v2OyB9i6sWESIDlVJlwoGGOLylJgIHRARNoieXUVRGqzeB__KvHMdXgnCfPPovs8vLMOzaMPEw=@rebasedinc.com>
 <draft-agent5-0001-re-eventfd-signal@kernel.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <draft-agent5-0001-re-eventfd-signal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/14/26 10:42 AM, Sasha Levin wrote:
> On 2026-11-13, dev@rebasedinc.com wrote:
>> If this is correct, a backport of 04fe9aeb4f3c to 6.18.y and 6.12.y looks like the right fix; it keeps the CVE-2026-80920 fix in place.
> 
> Queued for 6.18 and 6.12, thanks.

Yet another bs CVE - Greg, please invalidate this one too, it's NOT CVE material.
Getting a little tired of chasing these.

-- 
Jens Axboe

