Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769378;
	b=PfVFKT16iWm2361EfBq6XGaI9arzMWTCjNXs4UEluxWxFA12dBwHCXD934lNsJXuEuZ7
	 ajAjWJ+YDNwGMXXORoOCYgGZxhawwLo713Zqw9m/BIeo5uvkXDxW5NHK2V5CKnRgX9q5Z
	 keMTdit/DCqZJGPxzpU0AFXY3FO8QhM9LQ2j8rvgvqxgu2XYfdFrqyYgDmpKCojyXNGSF
	 GQFQ+rI4oCJ/9YHCDmHwM6YylF8n3odrJCGvL8T5HhggOzVdHWE+sq+x3cM1dzZaon+bj
	 CrPRU5G+2Vocg2l3Ft+3nbXHLx4LNskT9K6AE1lg2YvNXeL8DzsEhG33vqbAiQozfkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/XKIXXQ3UIAhONGG2sXhMuUiyRVcSsnmp8iX7lnpXaQ=;
	b=4jXbo0FFgoYsR55Ob8rC0GPQacF/rFJLeG7tsmTEJ+iNmSa5bVGgeEXh/77Dv+VyrC8E
	 ndxM0ERw7d1dH01a4P8h5YUGHjLASdXPS8GcA0nB9OyM3M8p0ZPmWvv3ovBJAfkdP1So+
	 go4hrD0O1aqzZYQVedSI32b0hZjbkQVwLYGYFC4WXhMp01y29EH604oEmo2anrETYyKh4
	 6RhFwBa9DZmP18xTTpvfWduf35hWiSxLdUGRFtBKVEGurvUoeaIOcUt8rURrijv+7crnx
	 Ba0VS0P4xlnKlR3xiiKwHjZ+09E471I7Ioj1u3CSTdInXSPgNQbDzWeZZ5gQGlB2aAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Ff1y+tre;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0769D606A31F
	for <io-uring@vger.kernel.org>; Fri, 23 Oct 2026 15:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0769D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Ff1y+tre
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-14394530ec6so1466499c88.1
        for <io-uring@vger.kernel.org>; Fri, 23 Oct 2026 08:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792769376; x=1793374176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/XKIXXQ3UIAhONGG2sXhMuUiyRVcSsnmp8iX7lnpXaQ=;
        b=Ff1y+trewxHWLvgWqOFQjl/KOJuftTw8pGMbsAbkEG6utYuho6TZXK29qMcBpBZU3J
         tfc2JEuXc9bdcLuaSDLezjA+ybjEe+TlJKC0vFPKqyxpS5+wgAxVJEvbBzrqh2ehIt/U
         /R4TBBCbjmwO+z9gz3jVOqUESpYZ0WJWXh+Bm4mbi3oTCddvZAHfORcaJcBMB3JKwknQ
         KOW/QZIqDcjZWxMRI1sPMh8xOb05Qk8y3s18UK7DnGWJFjRsknnfafKY76RFNuqFcNV2
         cze/air3P/VGXCn/eKOtDnJS2ow3yTmRYFddLYRB7maolVeujNWBueDMwPOoi8EELiIs
         khGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769376; x=1793374176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/XKIXXQ3UIAhONGG2sXhMuUiyRVcSsnmp8iX7lnpXaQ=;
        b=BTCLlJfI5LGjhw8l0QxVlRLVOAkJz7x5hJh8XiEmiraPeHCb7zgSyYD3hMHSG6+iRG
         FcpGcrsdoi+MPlX+uXotGejLlZDBYJL77qc1KG+eLerzcuaYAYSelt9IiWLdSEkcrFh+
         oaJbiaDXo9ttceKA3GowBslqcaz5dQ6FjKwQ5Ci2N3YZC2SHgLMcGgTXtRHSTg16dG34
         8UvhXRtWIECqcerybRam7ZNS1eZ4mTTMUHXaPZxznrtOpX/FxcSj1s+dDD9jotCB6yfd
         /3hXbFzNqwnxRR2TDpP7yflInQJLEf3Czks85KzUDEmwn/9fQJRKmIiAxzSQFRjG+DTW
         Cdvw==
X-Forwarded-Encrypted: i=1; AKwUvByFNN8nkAtWep41EpE3shkDzWHWxVScici/H3UXWgbUqMg6PpCCGGZ4UDhoYn7oo2iO0A0iirttww==@vger.kernel.org
X-Gm-Message-State: AFq9FYI5o0HMHFEAp4by79gKBHy2TpLvuar8l6Mx0EX/HUnOCJBDUMbt
	sFBSuDNLu6++jcA7bfruoqezCZbVwYuUiXZmFDS1oD2gmoCRoi6UZmXHIoem5C6J3yNMPsI6UnG
	2AGhks+A=
X-Gm-Gg: AYBFou3ID6t15A5soyzPN6zVTVZ9PKla1dA9NHUZm8HFJOtrjBFcH6vlMFGnUsBYXvG
	JMvRtjlSrsOygchFyLtzz0wPc3u9pL63/SkhjGgb0QZ4OLq5btCso6yKS+CSZrtkfgn1D2JbVw0
	zAT8NpPeeG+p1r3nIXJTq38bELWBCK/vBEww+HwgciC6/mA5ZgVWM/cwrzUFdEQMsATa82iAFv4
	topTP+jv7kcVJy5lJBKB7mXQStbSIrN5eiXSWWE6Gd7JYwRGh30B3D6g4ij1qTghr3uk8IqJaSn
	6zUIOKEtrgSSZKSWePM6oFUcWe0c+rYujCtnxYAdfyPqwizXAafCEG2V9hetdMswcqoFNPyn6Ef
	kDjTmd/L9D1a8p8vYM8/vVfW5+CMXS4FOItmam91aRRIrtGHURFVbqdyLYxU65Qkj2/ozeoHQfR
	qSDHWyvbVzOjtF0Awo/dRlK3CvLYq4oRcIYjbI7j+g8LiVEd5RnKB0Kep/TCdG07Gg/Ni9DfV7V
	stsIQFWIGSX57fmSr1U2J0ecK3/viUrDLNdl8w1emaiGA/PYWw92CgCp0hlzpqFD3cDSah0TrTw
	+qtkn/swICz1XPUySvEZB0orO8julD2vtza8f5o=
X-Received: by 2002:a05:7022:b051:10b0:196:4eeb:76e8 with SMTP id a92af1059eb24-1964eeb770amr2857954c88.20.1792769375688;
        Fri, 23 Oct 2026 08:29:35 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-197eddb7086sm699652c88.23.2026.10.23.08.29.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 08:29:35 -0700 (PDT)
Message-ID: <6ef167c0-d9a2-44a5-a909-cace45ff4a51@kernel.dk>
Date: Fri, 23 Oct 2026 09:29:34 -0600
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
Subject: Re: [PATCH] io_uring/net: keep recvmsg buffer select length within
 MAX_RW_COUNT
To: Yichong Chen <chenyichong@uniontech.com>, io-uring@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Stefan Metzmacher <metze@samba.org>
References: <20261023112209.87979-1-chenyichong@uniontech.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261023112209.87979-1-chenyichong@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/23/26 5:22 AM, Yichong Chen wrote:
> io_recvmsg() takes the transfer length from the ring provided buffer when
> sqe->len is 0, and such a buffer can be up to 4G. min_ret is an int, so 2G
> or more makes it negative and the (ret < min_ret) block is skipped, and the
> oversized length reaches the socket layer unchanged: an empty socket then
> completes with 0 instead of arming poll, and a short read is reported as
> complete. Clamp the length to MAX_RW_COUNT, as io_recv() does.
> 
> Fixes: 78d0d2063bab ("io_uring/net: disable partial retries for recvmsg with cmsg")

Don't think that's correct, it just moved the check. Should be:

c7fb19428d67 ("io_uring: add support for ring mapped supplied buffers")

instead. I will fix that up. Waiting on Linus pulling the
previous bits, then I will queue this up for 7.4.

-- 
Jens Axboe

