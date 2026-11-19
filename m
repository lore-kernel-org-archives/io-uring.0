Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109984;
	b=g04N9cf8mY+yRGP6xd/6/X0cU3RJItLwzyYXzpLmNRuVRzxPKVfpMgybKl2jNjIiBnRT
	 XMwU4Pl6dBjjXgwSpBu93vHPUHd5O9bpkCuAqZDpusVa/8meqoa4ggx4ilYKywu/HHp2n
	 51lIO/BCyCjokPLc8jbgv0ci6GoK0EmZt1Es1dA4EgHMlCiv834ADd2tDDBOs3Ks/7pR6
	 bQgSsmDEucKDt2ckM8tx/jhwjNVdda0tC5DwTNG2SOGO6Ua2VdFidiIyzBry6fXZGL9TJ
	 sMUPgLGpYRtYZ3EF9tZqtjHXRUToKThIDiZUqoiwzkfWhDzAIkyQua/Em9ucmFK0fSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+ywdyzcZKn6sJYWX1tz3LQgdrqtJgEmzkfag0FSeeA0=;
	b=1F8eehzCoDxhWWYn2chMC1CYD4fBGoOwcsJ/QQGmb3zzDBD0+/X8/Lf63fRoPs6gccv7
	 h0c376Qcie3yWmmzv+ghc5vLIHTFWmmRsvQ6SxBdhW3/VyhPY6I01qxrWA2cZfCN0SaTt
	 /stL8juINZMX8dhEMEy5CDW8sXPp8WiyRDQxxPhWz2fHKRXJge0U2RKTNHgWouLV4qCR2
	 ejaYPLTq8qztQeMdyBExYeSwjAvDYSzNG90q2ponfdmplpgIfqK295YwCNkhceozT7dPP
	 o49BHko79g3Ozuy0zKgs/k0GBhuq6AjTs9Ffh6Ld7Lt0muG2HUhF0vLrWuNBvjioPmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GUAJdYJX;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F5F606A320
	for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 17:39:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4F5F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GUAJdYJX
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-862b98b2e47so10763a34.2
        for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 09:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1795109982; x=1795714782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ywdyzcZKn6sJYWX1tz3LQgdrqtJgEmzkfag0FSeeA0=;
        b=GUAJdYJXOEUBkHcKHm4IQRkXblmAJgAPv+WrcDvm7NvfRqbsrnJpV7C031YqeHwyde
         WGGtg71hksgW0jezij8Jq7FGHAjIwuVJWdKUkyOmTL57y4VdC8o2daJJcoqNUPxGMdiN
         n/QlqITWlKHjGLlR8TU2+u6pwoQAQHVaQDLNWseA73HZKmeaB6LTPCyUDNrSf2YhA0sT
         KaXwyGNmgV+/dPfoKKTHrE520E2vHEClEShBrDtDpRWMAzhS7Tx7w5ZweBidGbQjNLkE
         NsJnId+tfdL+spg4jJBTIS51JQ/CgJxCHrkFbA+c398scWt6GdIGjOMgXcF7fl7I3upe
         scvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795109982; x=1795714782;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ywdyzcZKn6sJYWX1tz3LQgdrqtJgEmzkfag0FSeeA0=;
        b=fs3MZBghD/x34kTJXHF3LLUrNcIg764Y0rb34wYhpuLXfGvihNQYIjLs4i5SmRuBrx
         A+hPxD3pTB3oboXYKKkEKEfgPKCKIT51NizXjIpv99lzG+mkti1baQI+97fYcfESKNdP
         aKm/tJX/VSpg6rH94UeG7EshLJw69efKRQuXzbu6j9S/Kb14IYQSdzD5d13rycor+fjj
         sVyn3cmEygS2yksNGhA0Hn8r0jkAXWu+uC2pcQ2UhNw5tdj2gD4FAEF+eXTtoqxe4a10
         i3LNUbNYk9OuAQD/4Zp8d3K1ubCveJkwDzbyzgnkZwzj4MCEvyu//MozFw6qxFiD9dEB
         v7Cw==
X-Forwarded-Encrypted: i=1; AL+hErGWBORo8RUGSJMVUIkYn+GcmdZh+CxkBN3yZTlXLbbJkFPO5+B/sbZH4mdv0WNg12ybeu/Pvjymyw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/WQVlmR51VhC7a+D8NhltYMvagnOn5PQNvoj2noPy64rGeBBss
	k8Z8aAwdcfU86LI7ewFs+PZH3fCRdKsho4XPIQ7U0TupHyH7/sd/Oxt4nZnTgFe5cuLoRVtIQhp
	Xz7Qr
X-Gm-Gg: AYBFou0PtIITExXI7qX5eYyulYzAHAn3vC2wHeUkqxt5y+XpfsQGbuWhHEokNLzz8IH
	xXmXJ4c8Y/Or37YQE4kLlFbb1KBspuAKz7cH205G5vEvH84I9XY6Ajqxm37eWxFE5UUf4lHSVSC
	IZ3RnnD6gO5AH6n/uQj0h2HStXQWleE99uvbSm32+VQGA0+E9VkMAdfIuK88SzccmZqZv0yrz+2
	utmURkxRY/bElsBYR3qhrKymD/L17PfTM1+rT7c1lMxU3dU7VXqb1I+Jj1vZsfR3R6KkH8MYvSh
	2a+3P3qCgr7Ottij86E9T+m2n3mXAcfG0IKMEX1rMpXmUBK3Xn/SoB7CWVJJNm0zn7yMrvVO/u5
	qGXo+vsADzniwPSIGA+SO7XpRIAJojkugZt23U/Qu3FrAFWDkGMHBDu/kDlanzpwcxlck6bqBnf
	XxDlfydvW0OZ11SgKLCvVSehk7wA1H1k/f3znvMCek+QOlj1LfuEvVUlSpIgZkxtz24cFZs1owX
	oIAuVd/01mzYOjSMDRoy/zNw9G/dcPxbkjBw8m/wi1jL7QjwQHhYdmCou2k8ft+TzNee4cy8sE5
	D+w7IteqUygV5st8953hSkCTD7nGKuED8qN/mFYTV1kK0uC2T7XWQIeMM4UBml3YqDR18TjPy7M
	GprLjn1jZNJsj20PIgvx9tJofcaDEoTSK
X-Received: by 2002:a05:6808:4f28:b0:576:4595:983f with SMTP id 5614622812f47-57a0a214e8fmr761893b6e.14.1795109982116;
        Thu, 19 Nov 2026 09:39:42 -0800 (PST)
Received: from [192.168.0.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a34252251sm63887b6e.6.2026.11.19.09.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 09:39:41 -0800 (PST)
Message-ID: <535342d8-604f-45dd-968a-0fac8223acbc@kernel.dk>
Date: Thu, 19 Nov 2026 10:39:40 -0700
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
Subject: Re: proposed io_uring CVEs for 7.3.2
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, cve@kernel.org
Cc: Sasha Levin <sashal@kernel.org>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>
References: <oMhla8VwCWoihfrmgn8znIy60W1QXI8g_v2OyB9i6sWESIDlVJlwoGGOLylJgIHRARNoieXUVRGqzeB__KvHMdXgnCfPPovs8vLMOzaMPEw=@rebasedinc.com>
 <draft-agent5-0001-re-eventfd-signal@kernel.org>
 <5d92861f-9a4d-4810-8700-b9e457ed9c86@kernel.dk>
 <2026111605-deskbound-clobber-a4a1@gregkh>
 <07947062-2974-4630-90db-1556e25b50bb@kernel.dk>
 <2026111722-unfocused-ride-065c@gregkh>
 <2026111949-tinker-symptom-4279@gregkh>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <2026111949-tinker-symptom-4279@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/19/26 7:19 AM, Greg Kroah-Hartman wrote:
> On Tue, Nov 17, 2026 at 08:42:31AM +0100, Greg Kroah-Hartman wrote:
>> How about we make the "rule" that we don't assign any kernel CVEs to
>> io_uring things unless you ask for us to?  We do this already with the
>> xen portions of the kernel, but it requires you to remember to ask us
>> for an id "manually" if you want one.
> 
> Along these lines, here is a list of git ids that our initial review
> pass marked as "should be given a CVE id".  Any opinions on how far off
> it is, and if we should assign these or not?

Thanks for sending these!

>   3de16279b43d io_uring: defer foreign io-wq enqueues to task_work
>   360395e8dbf9 io_uring/sqpoll: don't wait for the thread to exit
>   9f5315d3f436 io_uring: free the task context after a grace period
>   8543a39f03db io_uring/bpf-ops: clear bpf_ctx while submitting SQEs

Agree.

>   51bab09b7ca1 io_uring: free XArray nodes left by a failed store

Don't agree, it's a small memcg charged leak, and requires mem allocation
failures.

>   0b34e7b20a48 io_uring: charge tctx nodes and personalities

Doubtful, unless we're strict on memcg violations are a CVE, as I'm
sure there are tons of ways to do that right now in a bunch of
kernel code.

>   075d5837bafc io_uring/rsrc: charge buffer arrays and nodes to memcg

Same as above.

>   4a93427e99a8 io_uring/register: enforce per-task restrictions in io_uring_register_blind()
>   e66907c3ba22 io_uring/net: mask socket type with SOCK_TYPE_MASK in io_socket_bpf_populate()
>   37e425460b7c io_uring/io-wq: save worker type before dropping its reference

Agree.

>   b42c85c20d84 exec: cancel io_uring requests before de_thread()

Reject, ordering cleanup.

>   3eff68bce255 io_uring/futex: allocate private hash before waiting
>   5cb049d2203d io_uring: don't lose a cancel as io-wq parks a request
>   8257f6ec45ee io_uring: don't lose the DEFER_TASKRUN wake up


Reject, it's just an application side problem.

-- 
Jens Axboe

