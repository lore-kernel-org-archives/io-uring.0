Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795130703;
	b=OiiYGeRtl1BUHOvvwejfLI1mPqBweyT3TbZzo9nyjuQK3xAIwzzpgyN9QclcjvKoTheP
	 AaKclhpxIQ+jqrRhGYwlofZTcZnqwagUO0CxxQr3iOn9fHNoST+Z0ox7CX0ejFc+U40m7
	 bfVPesorcvk5lua4MEppwcFEtEYy8HyVer4b6n9WUVbC/ozDsRCjf2Cg0phHkpPs991EE
	 O700ubkc2pQr3KCCYqnVLLnnLPWHO45h4KjKJ53BmI98p7sDkEDkN9oinW3Dp8oK8AF8M
	 3MRrWonSmHG1pitrdnNKygOsVExhtXBn7c3zPxFefw5KiXyuBCLSeibwnOPZKSmmCKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795130703;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=A3/j58FnCswZ+e/bDMljzhv86aLIWl4e+Biclhf+r6w=;
	b=HTkymUBI/kvvjpGqLwZ9bH/9t4mmqXsHm605RYfsRCr1/DXqD6a+P1WoLsVh5EXk632/
	 Fu5S0NZlkQwoLhUAfH7dDD+d143Aef6bUPcDRBL+ATIf0ir4ONCTlrGp3746+XbujpH1C
	 Dy9rsYx9snkLfLkhZvOl5NZywPDjzhqUi3+K5VFP8xmU7Z+or1Y9RTuTaFKV5tRMBs8+s
	 gqO4OPQAAnHev1Dfm8YbkerZrDMxyzT1bGvkRf0K9IUsN58/GkQDNHL6s35gZrUTblwC5
	 Rl16yEpWdV9cGY9yN1cSFdIx9+kYPvBtG22dhETW2FjnfXyblo58wY0mXVHPQtnCXAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LMrJHfjJ;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA909606A320
	for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 23:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA909606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LMrJHfjJ
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3282db206d3so681289eec.0
        for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 15:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1795130701; x=1795735501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3/j58FnCswZ+e/bDMljzhv86aLIWl4e+Biclhf+r6w=;
        b=LMrJHfjJa8FHEuRUacP3O32umu6ScfYLRrxWk9UT+M2wdLWFO9EnM4hOOqI6/Fq7S0
         DVoIE6I4v1tSeWgaOAUK+yLPmP30hDnIGM2g1tBFy5ujDEYFcgQQmHE4DaA9Ca3RA4eJ
         ebDCjXiLitXY6QPlH3CvskQDfs8NUkqyr/jzrI9aziefd8yKy2KoupiwvUNc+Ll/bXNE
         Yy7OOnFqsPPR44V4Mx7jajA99tpJQASkd/F/vsPFYjBNjMFN62PK8Amow5TximsttJPX
         KV0F1GjHA98LKAUwlaYXwhNDSYJHZfIv8QQJFjqquBMqZP06O6jtwCYr+bt8HeE/akyG
         HaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795130701; x=1795735501;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3/j58FnCswZ+e/bDMljzhv86aLIWl4e+Biclhf+r6w=;
        b=qwEQIp5mBfZ4zz7z7tGiQ9pPzNBHyMFy6RgoFpRe+fkGUsWx0qIY7g+eN3Sk9kE0hS
         WmsY0Lk4tKXPG9UIQs6XhvVf+Jh3OgDTHC/Dft+EbPdBgH+hNgF7p3vZ3IvNLu1iVoYw
         AeSkNkqxqPmwmJCDtGkoo0Bx8Z7w4yltt25RL9cvZer+3RV9I0mazqLgVxbAMqOvj8Pd
         GRbXsFI7L8pi0gqt+1+aZwxXD5iuS4XisDLrDoGRvtC/I89vwS6FzVST/jvgG5uWYcWR
         dbgiQAwEfQpnzDoxr5l8ci0to5TWPg9XLhQOe64XIeP39i057e5hO1GAaEweymzryBv/
         0buw==
X-Forwarded-Encrypted: i=1; AL+hErGuZj8A02zdP4Ut6iKOQ+CBeZ5m6Pfp5e4AysOdTa2smQ+iBGE2+sGaVAtG1wKWkdqvd5mqqi1Qkg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+I4FFVUktimu7MkxfmWX/5Sm6ySc5aLFNvEamG+ZWaM5mfRwDo
	WFBaBYV1LyBAhkeh2cRLUOWmzY4Wl8eqt3Uc/cHkKwtbI1uzKJndIZTCtxSP7Uj5pGJgqrSqFfB
	NMAe7l9I=
X-Gm-Gg: AZFdTZdCXNfRHw0YXQWf/FUkVYLhZcNuQlBavm1XBnVzFo4EZ1K42rpNTo9d9xTyPN0
	Qj0b9DSAk8EgJ951eLBGoc4sj0QSxqaXpPhAofdiXsB0L5aoE7CWdlzqzB6tWPrMncABJvpnWn5
	WKnyb2xgmZj356RhN+3AlftF0EnAlkPAgOZu89tPPhS24kQePF9TUALHoH5rzurXF+K0CChkXEE
	Ud30WZyAgLDln3M4c1Us7Kup5RNa/yl2hUnjCLDVt+OQ6J9B60UNblCaqNSIGp4Moe6PFbjA23C
	zbYhl/ubLULch6To1SYEH4bRx0dYnJw1Os1uXJCYx1wr6boaykg705kHpYEgulyI6+XFgyfV3Ux
	k4GKgWsDwX+QXuQWbsaxwxeJHLwcsfK0spwlD3d3dhrAABq8SJ3K2XikXxVy9ZyLdp/OtR94lO4
	1yXH69nN6QDy5l0IpwPl5eKzfmdckMGY8X1MfoE9//7OBj7mDqDIEajVGW/hMK9obHWAhw6NruP
	DpvyJeq8wWp+tdXCEAokoqCc02bvYHSggr1s0KvqRRT6qSDat0+vekulw39o2canXhBCRJon+Nb
	jd9jKlRPmIUPyhHflzptX3QsECAfU5ZhGySf50nvBohwR0x1yFb79StuD3wyHQCr+Gr0kU4e47c
	iTsDksZAWn8bdId24Zegd2P76l8Ly5stOaVGHMqdD6tV006G00ygKr1bywy0wmcwah44nCg==
X-Received: by 2002:a05:7300:2290:b0:379:24d9:cb98 with SMTP id 5a478bee46e88-3856925c033mr993484eec.0.1795130701452;
        Thu, 19 Nov 2026 15:25:01 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm1782850eec.15.2026.11.19.15.25.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 15:25:00 -0800 (PST)
Message-ID: <981f45d2-c38c-4ac1-893c-17ce3a8c3f0e@kernel.dk>
Date: Thu, 19 Nov 2026 16:25:00 -0700
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
To: Sasha Levin <sashal@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 Yufan Chen <yufan.chen@linux.dev>, dev@rebasedinc.com
References: <oMhla8VwCWoihfrmgn8znIy60W1QXI8g_v2OyB9i6sWESIDlVJlwoGGOLylJgIHRARNoieXUVRGqzeB__KvHMdXgnCfPPovs8vLMOzaMPEw=@rebasedinc.com>
 <draft-agent5-0001-re-eventfd-signal@kernel.org>
 <5d92861f-9a4d-4810-8700-b9e457ed9c86@kernel.dk>
 <2026111605-deskbound-clobber-a4a1@gregkh>
 <07947062-2974-4630-90db-1556e25b50bb@kernel.dk> <avxLtZ2YLHdbeZxC@laps>
 <8e6c1d69-9910-4c89-832a-34ecd65a0ca7@kernel.dk> <avxPlrd77WiXagvs@laps>
 <8e8bd832-ead2-4d77-9ca8-48274637d26e@kernel.dk>
 <20261119203921.972086-1-sashal@kernel.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261119203921.972086-1-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/19/26 1:39 PM, Sasha Levin wrote:
> On Thu, Nov 19, 2026 at 11:10:03AM -0700, Jens Axboe wrote:
>> But apparently nobody looks at aio?!
> 
> We do :) Here's what happened with each of them:

Good!

>> Commit: c03ce4173c7b
>> Date: Apr 13
>> Fix: Ring mapping inherited over fork
> 
>> Commit: 3adf7ae18bf4
>> Date: Apr 18
>> Fix: Partial mremap of the ring
> 
> Neither has a Fixes: or a stable tag, so they're not even in a stable tree.

Gotcha, that seems like a problem then for current maintained stable
kernels, where any user can crash it...

>> Commit: 398e3fa789aa
>> Date: Aug 13
>> Fix: eventfd/epoll recursion on poll
> 
>> Commit: d53b5aa5cfae
>> Date: Oct 29
>> Fix: Fault races ring truncation
> 
> Both shipped last week in 7.3.4, 6.18.63 and 6.12.117. My LLM review
> flagged both as CVE worthy. The 7.3.4 batch hasn't been assigned yet.

Makes sense.

>> Commit: b44341e39d85
>> Date: Oct 22
>> Fix: Request count overflow in ioctx_alloc()
>> CVE-worthy? Not in my opinion.
> 
> Agreed. No Fixes: or stable tag on this one either, and there hasn't been an
> AUTOSEL batch since it was merged, so it isn't in any stable tree.

And this one doesn't matter, imho.

>> Date: Oct 30
>> Fix: exit_aio() returns before complete()
> 
> I'm assuming this is ac4b449b39e6 ("aio: don't let exit_aio() return before
> complete() is done")? It has a stable tag but only went into v7.4-rc3, and it
> isn't in a stable release yet, so it hasn't come up for review.

OK, it was just late to the party then.

-- 
Jens Axboe
