Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110027;
	b=pjOBnz5cJQWbTTJxYToqlHxxoE4Ub3Pt4pgnxLa5MBGWhHJVQgLb/DxoBNykyC79qFS/
	 FF6n7oIiVgvBrANly5f8ylvutm+1VEOXEdADnPEe31jUJMDUVo9zey7LThMRmBtHwWlOA
	 4uhIEV74VKhlzV/j/46T/bjdB6Bnzvk4phKXkKvVyLT5qrVrOYg33H9bTr1UINYla4Yck
	 YUr9+ebYnBgRxCHRHC/lIJEEeV+3rl8gUhKH6eTOQfrX8O8vY0/Nr3IEclPDNB0NQ9fAD
	 7VMNmBih771czDcukf7oBk6Bv7TFcT+vI8h8T+Fugb814bKcXI4OwsSv/q8RG+D+Acg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=geEHBOsHqhUNfSSVJmW+sMQIMDUdwtY/T8KmgLUvz5U=;
	b=YWXY/9hSnzAv0w45lvrRY43BF/VVCTeTS4HIq6+PIEzbnf0/ytVMlXIsejc/o4K3Ttqe
	 c7OyaPSgPZ9ydyXIp1KilfsiPeZqlUHtBORZAIM5ULI+NxxTnt5vIkoG/IPCY7W+bKj/0
	 bXtZxIVlkSerFkD6Y5hvZcL42wZnBUJ8shKrLSLTvZ9OeYERWfqGp0hFIgZUrrdcjavcl
	 Mzyyv82w9Wx0KteSDXKx5lrEpj9PgA5nldbyTNjWkW7+RG2FU6oAGJA40r1fLNveLynnR
	 /VvlTvtU0n6VTnwnSOixAKuWfYo4nOXnL8zWBOGJTZSb+21ufIlL/afQdwGsT3t86PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YWwSjmiC;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451C3606A320
	for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 17:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 451C3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YWwSjmiC
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4ad60ec5eaaso1170459fac.0
        for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 09:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1795110026; x=1795714826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=geEHBOsHqhUNfSSVJmW+sMQIMDUdwtY/T8KmgLUvz5U=;
        b=YWwSjmiC1bodvs4Ykw+YDaRgbeaUD3moaLRw2fYPUK/fqCit3AmrWbmypoeZhcPq68
         W/Qk1KDJwBmtuzSaodP0sseZ0WOfKWwofkzxhVb/zWfrQqFPpEhHW66Ut4dw/kQLTFhz
         TCI3sh1CQRENbJPy0uEaZOAvRva5J8z4i6Qc8YrB2wSdCIS/QRNwrbAj3aOkB3TWyaDk
         hW/z78WX8blP1pPAqGF9JF3JfEOWQSkLf53O4rMVbtrX+zF+o/X3oxXJp90cjLly5RBf
         GZcXODs9eA0PlWXBGAUjJ5qKRJ7UWl4ugCDE+Fty7czzo7HBuiOdgREEwDUCWrAQEsJ4
         OUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110026; x=1795714826;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=geEHBOsHqhUNfSSVJmW+sMQIMDUdwtY/T8KmgLUvz5U=;
        b=1X+U5tb7rLSbQyy9TtnamYV97GyWaC6d5RYb2CI1x03wnlglnDiyG6zPD9CjbUS3Zv
         cTZwR8ySrCJNcsm00xNHVenHxScm5LL1pju/hDKm6Ig19XCI/kWVEBhZASaSdwY1BEuA
         7kzQA+LdxOdbqyQ4cqzfEBGFLJquFg00qlVdZduV/9EVXoywEn74QqUo4oRl2EcByJb1
         M3v3PxhohdHoP4jL5/+IIIze/ruvu2KWLXGrtuWiKf+cy7BIJ/Kn9TuusRSYFJc7IXIL
         83GDFbu/WeXsc5BtYP4p5hr0QveTm3wpSnWDPOXaUTObHprA+chPlPk0wFcPnyMiXvrh
         9HtQ==
X-Forwarded-Encrypted: i=1; AL+hErF3nMufCc1pXoUyg1zAYNXlYoUereZ5tLh6B6oRLe+VJ5sRNGP4FUdlWRWyuCMH1ZTnTBUj6lamew==@vger.kernel.org
X-Gm-Message-State: APuU4Z/DeUZ1zFgk+bKZmt7vEjoT5vmBb80Almju+4FrzHF7yDceRh3F
	ee8/Tupjl5NiAxDmT2a7lMivsaQJ8Lh+nd1AA9+bmUb1iYV21zjZUm2/Rn8IHEQOWgY=
X-Gm-Gg: AYBFou1MfhKklBH2o5UtKCtH1FmktapPlHGHnPyPFR8DTe1sQtQjz9v4C+2zqrkKNK9
	eWqXdlmclFOpqtQna4c5Fmi7qXApBwqiHelQm+ljHVlF5hcmn6L5EU4FsnyJD7MZS0Tq8da0A/t
	VBqmAU2riUCaOwNqisEYlHEXuIapu5ZH01A+p66pgsTYk5g7cHYHkzQvmQKWViPZjBm8ztCLsld
	v9MG87z9PIBYD4meQhofx5TXkAo6GedC1hjbS5V3LGKbdCYpyYjM31qOcYxgwvQjgpOXT/I/Pgm
	XHkbpB1ZVY3lm9SqhAo6FFdkzSf/G5PRasswvQdTHQhrItly7m1bs2jC66AU0SjZh4PNjwlFitq
	8SswqHlFCQglw+j4dM9SND3AgDTPbYKe5bTtN+zpOA1DgERRMEjav96P7/VhT+zXXU4RMa/UulH
	IYV5SygY2mmra9rl6GkhfY20cADUmERTg9E1kzO2YScK5l4HqSwg2VvxMhC12MP4sKcR129Ydni
	l8nCUrXEQO4j67kaFK3tcLvzn6z4pQ2eEW0uiNwp7lICSQwAYrCbUODDewno1ke+qqzM8Xes9RX
	GAf2yVHSsKz4oMn2ZN+U5/sJ2VPE7eqbUxt1Lgqx1UqeWoCsa36Cqt6ifLe3uyYsLW9Hj78AIzo
	YBHcnW9xa+pQQhbL8LwspMaS+U5JVT4cwH4NLxABoQ9R9Ao4=
X-Received: by 2002:a05:6870:3516:b0:4a6:d389:ea78 with SMTP id 586e51a60fabf-4bb3b977e65mr1144771fac.34.1795110026093;
        Thu, 19 Nov 2026 09:40:26 -0800 (PST)
Received: from [192.168.0.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5fcb19a9sm392020fac.10.2026.11.19.09.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 09:40:25 -0800 (PST)
Message-ID: <fb339d39-d4f9-42ef-80b5-fab7398d2774@kernel.dk>
Date: Thu, 19 Nov 2026 10:40:24 -0700
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
 <2026111918-entangled-juncture-4adc@gregkh>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <2026111918-entangled-juncture-4adc@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/19/26 8:32 AM, Greg Kroah-Hartman wrote:
> On Thu, Nov 19, 2026 at 03:19:28PM +0100, Greg Kroah-Hartman wrote:
>> On Tue, Nov 17, 2026 at 08:42:31AM +0100, Greg Kroah-Hartman wrote:
>>> How about we make the "rule" that we don't assign any kernel CVEs to
>>> io_uring things unless you ask for us to?  We do this already with the
>>> xen portions of the kernel, but it requires you to remember to ask us
>>> for an id "manually" if you want one.
>>
>> Along these lines, here is a list of git ids that our initial review
>> pass marked as "should be given a CVE id".  Any opinions on how far off
>> it is, and if we should assign these or not?
>>
>>   3de16279b43d io_uring: defer foreign io-wq enqueues to task_work
>>   360395e8dbf9 io_uring/sqpoll: don't wait for the thread to exit
>>   9f5315d3f436 io_uring: free the task context after a grace period
>>   8543a39f03db io_uring/bpf-ops: clear bpf_ctx while submitting SQEs
>>   51bab09b7ca1 io_uring: free XArray nodes left by a failed store
>>   0b34e7b20a48 io_uring: charge tctx nodes and personalities
>>   075d5837bafc io_uring/rsrc: charge buffer arrays and nodes to memcg
>>   4a93427e99a8 io_uring/register: enforce per-task restrictions in io_uring_register_blind()
>>   e66907c3ba22 io_uring/net: mask socket type with SOCK_TYPE_MASK in io_socket_bpf_populate()
>>   37e425460b7c io_uring/io-wq: save worker type before dropping its reference
>>   b42c85c20d84 exec: cancel io_uring requests before de_thread()
>>   3eff68bce255 io_uring/futex: allocate private hash before waiting
>>   5cb049d2203d io_uring: don't lose a cancel as io-wq parks a request
>>   8257f6ec45ee io_uring: don't lose the DEFER_TASKRUN wake up
> 
> And here are some proposed 7.3.5 commits that came up:
> 
>   9eff9c07e927 io_uring/poll: cancel all matching requests in one pass

Agree

>   f013b6955064 io_uring/sqpoll: do the return-to-userspace work in the SQPOLL thread

Reject, it just runs limits later than it should, they are still honored.

>   cb0306c52ffa io_uring/cancel: drop sqd->lock while SQPOLL waits

Agree

-- 
Jens Axboe

