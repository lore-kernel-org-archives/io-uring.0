Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281334;
	b=IVXMbFX8jPD0qV/b+AhifVzzlYZi7icm4atUxj/DG4tGX7CIjAhh5kNwfJiYb4Tm95Xr
	 u340vg7q4skcjvmJL4HmEOZn4nbA8LpeVBXmKzWsmquJJ8RrFii3KMA0+d8MxO5DSC6gu
	 nQEsnWQM/I7KvuIEE1QcXgx+WgB5cFqJYO4F57hD0wcicQBVNtA8IlCWisubWFVScamKN
	 NgaLnp2vNGs0FrkZ4JjNtr2Yg89TQrrtKWjn/D+qLy6PMlp8LDZEpRgZgamGdWFHaUYLZ
	 LPffpjXATML6I/x1i8Ue3hdjB22ib2ce3bFY43ejIwpLbNvfQdyPvI73QCDu9oc3r3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=O6CTOI7Goyf3DK/jXbQM9sZjnDLqWtwiiqPhDSY8VTs=;
	b=LSQ97QN5EFEJguLDnjk55WZkxuSVHjP/9e4fxgHRAjpy2PFMKuKS3bzRMNkL4jNR5vEt
	 32x2ykSsqJ38GwTrfDTI1CHj94tEUv5yAiBFLSaNNY1PC6y6usBpUE/egra/WFnC1YKKt
	 OVb5nUePmdNgOIXwJo2NwF1dpLEd2gMADIBmPES1S72nKlZUhjBD8VVXltv05PXUh9NrB
	 hK7pAgfgWvWyOrA92MYqZJM+sCFrXjlYIwEL149Ndz9XsfsuWz0I40D/9ojJwoHsCeNjP
	 zWAwU3JlXub3p+PIJCdsH7VPdYqZbeZnJjXjWmWzFpHG6f7xAkoTbuYiDB/Yl3bQoSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VQbL3zQr;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FABE606A321
	for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 13:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FABE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VQbL3zQr
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-18cdcfc05ffso2896901c88.1
        for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 06:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793281332; x=1793886132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O6CTOI7Goyf3DK/jXbQM9sZjnDLqWtwiiqPhDSY8VTs=;
        b=VQbL3zQrWIOVq4Z7tmllrXNp/F9Y/1vAbgkzY+NsMf49zm1WyIRTnXF5yUY+a6teZu
         1z7uiJ4jFHbGF+/iqGwEBEyDxle5Ef0QMEaTRWXO/ARS73wZmzQn4UGlARXyd81GTlG9
         ba+SuIPs7AOuuoWqYnJSqxcIzINoWvVsw+3K8pW2ZKfVCfUeuyZf1xJRQW/Mv7nXcFfv
         1QU18Cd2F1llrGeRNyDskRjAjvv3AZ46W2Sz+bPHUxPBuAA1ZRsCPw61qknLU7r0UorP
         uRcxoYRLeBXw4+xJeNoxM88JWSsdrg3NfI5Sa9trAT2uWC55hRcbeu5Su3xykZifEcwp
         7lvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281332; x=1793886132;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O6CTOI7Goyf3DK/jXbQM9sZjnDLqWtwiiqPhDSY8VTs=;
        b=TcQwAkZeXu3oWrX1G/ViOSI/LEKJGEzlZd0vjaQS/LoCygUMuqLLzNkD9LVeVTcYFd
         sFR3IZPh1maNcmdud+sqN7DMKt4XyJmrRgiud/s5nVyNQnKhBpJJes0KFzOCrXsyJv+V
         eDGDDY5k7tPx1RdLO9T8UeGkUZ5v5PHCgtn7e8n5LKWbRJHil9qUPWCgk5kFac2MkkSS
         IVxGu1+1i087M/h0GGSGZiB9b7K2EUAmJfnVempj4Un6AFYt7cbUsY4Fl+Um1Ny0S4Sx
         mjBJIfpx6TDO2N1uJ95Jspz8HLekqlGoZhlnTB78T3OUi7A+AekoXW23Ni5lBCd/u5lR
         3sMg==
X-Forwarded-Encrypted: i=1; AKwUvBzZR4xbUxI159Mh3u8i/cAOef9cWdg+0L4nW5Zi0j3x82J3MEKGuZqHXPbf5JXr3l6SaDHMDGtp0g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJK26ZpcFz93ouPa0klT3f5Bqm8R/L8xRsvcaJhB7Dm+k/nMiwS
	Rhpjdhxnr3fyP5O8o2u8p/O860G0qONaY7i+jMyrD8JwelQA7UmLrYoje5PiBhCdLg6y7XvBkSA
	5wu4RLuc=
X-Gm-Gg: AYBFou0c+2xkM7fgRhAuKpMlXkQeCNEgQaWyPSeZbYDVM9kzgOw/rCLCI8CSH1Ve/3v
	hbHlhVoNOV455VlZEx0G80nqa3QkWtkwb3+dBeQGPDRPDAm2yStO3jTv/gEqtV63KB6zM6oqiyu
	cIl4eUo8/LRxsSlgZWGeCUutPBEHp0bz74HgqwRs8hzUK1prIudvtoe+4hYERhYfOuLbk8y0IqZ
	uqPHklSAITN4qlRMkIAHuWq8MWz9Xx6VPz+jZ/0I+EHStGsSu/OtdCN9ZcqYcuIL6R6JoQXYwwp
	rAFLXkaY9JseZ/yweoD30GfF3Mg3zhl9Bc+TR+4j85aLEtVSry2Wg25MMJJD59V29RScIjrhogw
	9h7wbiEF47s6yMLiHVwKCe5U3oQh96SoegytFymvfM/hNpZ1izcmav7g8wgjdfzZRHKQHzDU04G
	lGD6MBKtXNG87pk5PKqn7aPaVK/lpwtCa/+QjKvUGj0x89lwEMmmk+tHIlgOfxEdZ7v1bXQHZTy
	xpHqEG7EKr4upFC+hpXRao1BH5z8S119xIMPQjkfNoi+nDnDCUU3MX9W4b0w6+s3eMvDBNXgSF/
	myYo38Jg2pG3OT001rSPf2ZKUjfx6nT7COknNU8Xp0W0872yfNW3rJMkO7vaxQoikewBqAiSbri
	DE/FAM5nT0cLv
X-Received: by 2002:a05:701b:4201:10b0:1a3:8d5f:6f93 with SMTP id a92af1059eb24-1a6cced6334mr7561828c88.17.1793281332099;
        Thu, 29 Oct 2026 06:42:12 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75e1f2de2sm14760120c88.13.2026.10.29.06.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 06:42:10 -0700 (PDT)
Message-ID: <502f31ed-dd70-469c-b433-577ccee36c3f@kernel.dk>
Date: Thu, 29 Oct 2026 07:42:09 -0600
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
Subject: Re: [PATCH] io_uring/napi: fix list use-after-free on PREEMPT_RT
To: Anvik Loitongbam <permissiontogallop@gmail.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
 Olivier Langlois <olivier@trillion01.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
 stable@vger.kernel.org
References: <20261029102244.141621-1-permissiontogallop@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261029102244.141621-1-permissiontogallop@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/26 4:22 AM, Anvik Loitongbam wrote:
> Commit 45b3941d09d1 ("io_uring/napi: fix io_napi_entry RCU accesses")
> converted the NAPI list teardown to list_for_each_entry() and
> kfree_rcu(), with a comment claiming that list_for_each_entry_safe()
> is not necessary because kfree_rcu() defers the free to the next
> quiescent state.
> 
> This assumption only holds while the surrounding spinlock section is
> non-preemptible. On PREEMPT_RT, spinlock_t is an rtmutex and the task
> can be preempted while holding ctx->napi_lock. The raw lock inside
> kfree_rcu() only defers the preemption until it is released, and the
> release still happens before the iterator advances. Once the task is
> switched out, the context switch is an RCU quiescent state, if the
> preemption lasts long enough for the batch to be flushed and a grace
> period to complete, the callback frees the entry, and the iterator
> then reads e->list.next from freed memory. The same pattern exists
> in io_napi_free(). I did try to produce a uaf on an rt kernel
> build, but it did not work.
> 
> All list mutators are serialized by ctx->napi_lock, so the entry after
> the current one cannot be freed before its own iteration. Caching it
> first with list_for_each_entry_safe() in both loops might be a more
> safer and correct approach.

I don't think your analysis is fully correct. On PREEMPT_RT, spin_lock()
should still be an RCU read side critical section. __rt_spin_lock()
calls rcu_read_lock() after taking the rtmutex, and then
rt_spin_unlock() drops it at the end. There's even a comment on
kfree_rcu() callbacks in there too, it should not be able to run until
napi_lock is released, which is post the loop.

IOW, I think this patch is unnecessary - there's no bug there. The list
safe change could be done as a cleanup, but it's not a fix.

-- 
Jens Axboe
