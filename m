Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953C547DFA0
	for <io-uring@vger.kernel.org>; Wed, 23 Sep 2026 11:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162934; cv=none; b=NsX0/M1442dmR8YCm/kNYwgY5fpIDT3cwy5PEJM70WFd/oEd317KDRnVZSWU4moOCBVbNsST/6r+eLIAYyCI/PQdC5xmTdqJIL/xVKKb24DxMgzSz1koefxAHe3VFionfwBDosy2cSBlO+79FYBOcYgIsyotj3UDPSpEwnGfCdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162934; c=relaxed/simple;
	bh=3DtSxucf3CjotBWyk76xFHYpDJwmsiKXOFmPN3as9ig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oyV72+5mBhu5Fhd7AaGtOLinlDx/DipIhVmR+ellQatGJQg+IOV6R6YUy7+BCC76IEqZ4AxRqCEGSYI7mv7YIhXHNVJiv5slm4d350vXhB6LSQzJyGzsNMx0QsJIbih5QrxcmJHLAtM7EToFazEykwyCO1JDWk/fn0ahuPEpAyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=vNu18dwu; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="vNu18dwu"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c3735125bso350799eec.3
        for <io-uring@vger.kernel.org>; Wed, 23 Sep 2026 04:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790162924; x=1790767724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4sKNxUfIZoJNayKPK2p5wI6UulfeeiAabrrrR/zgiCQ=;
        b=vNu18dwuGEbyBIOAgcnw4HofBCs44aCD0w25qqCJaylW4GoFnV3hMmfxwdWh600bzQ
         zKzFu2PY9bbxCy9KEOze8NrKGKwYYJvSXiDoGZKV34gNdsU1xYSLxRxptT61zg/YagjD
         QRXj+PeMxie0EbR3RhKzJ5s+jYTvRmSgsocx3UhSGFH0+sVT884OlClJfH7ajdD9YoXK
         hqNyxRC+YLHfh5fiNzZtnpnntiADkNFUmCIIKnbWpIcV6zcGw2ddw0WFAeLzaz5sUqdi
         /iO/hFUyFUgOUKqf9zXP0GdoiGtuqu4jHvM9Jfk8p48aSi+PF0CVil5Jto9T+Fo2H9zg
         Vb0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162924; x=1790767724;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4sKNxUfIZoJNayKPK2p5wI6UulfeeiAabrrrR/zgiCQ=;
        b=T/hhNnnQjcw1nKcM/TMk6cOsmMDm1LJl8rdO3HFjY4klbAtokp5p+9O7McQILodghZ
         QkCOuTGlNLzqwwKp6b9WlwhpMmOi0O86HvwjVpBZsZBLfiAIPSer24xqatf2RR+8EtTl
         t1FOTFQpTFpUz4CIITuLWxGlwa4zZ5SMW8eHrqKag859qHTd7VHCDyKT6jnmMPLaj3Ev
         M+fquCB0rpwfCFt0knW3o+sV5eEQmF0y/1hJBPzX1NHAFWpWoKISctiP3rTVVgd4WeSZ
         ld786AN2izRfy2G+ct49bYzrpgFYm6WraKmq7rDLVYo0Gi0MqdjLIKxR9sull88JxJcq
         l4Qw==
X-Forwarded-Encrypted: i=1; AKwUvBx8ZqmWEUXegyCJEJsKPkByt8NMqeIuZtKw9Z68x79Bd3B86hLFh824f3CFhEBWEcNvT/5IyST0Zg==@vger.kernel.org
X-Gm-Message-State: AFuF++k1CLeU978AwtwVZQin26jpWz8UdQ/2L2tBDdkcAAiSEM8G3JVd
	ffS6Eg8vKGrnNPtKqLFENgft7I8VjZbpQt6SWTcG+PWq6yayUqU/RSD0XjJx1CE/M1Q=
X-Gm-Gg: AYBFou1zQWY8uh1i2H2hlHn3QKN9YfnByNkONofI1gFXAuStFRtAANGEvoMN8czNFnf
	9cPg4W+QMTAcS77kw3oePWH36roqAx+Td9kr7rxLX8NwHndxR9faByysAnoXWUtgaozX8Jy8TE5
	dLuVIPIEG1SSUzdQ4kEG5ESFV9rakNlRYT75s/V11UtTQ0XV8lFHE+8lXYMpE+7kq70XQArLTrW
	zpQn44qhxLgQcCaxkP1+ridfirrO7KXBtxjPuzsgGNwEB76BGnBjfAdDOp+Z5zRFxwqqb9arUjs
	mHJkszaSeIPCZJj9XbLAKQ5gbE9HkJnrQw+3XO/Q9Z2VhCt1QGumRVWJeZYpUG9wgaPN8K0kS5w
	oSJp0GL4VNKKYCihHsT5aEE87KCxaaEh0HZJMvQWHZaDIF8o3+MUZoAU0uGNodFwGiDp3YVKYdV
	LuhKkQZZU5ByZ1bGHi+etuiHjtTY2JI+Z8BgdzdjGe161JTWuuPOqBqs0sr2IYG7IS2K3zqCZuw
	A9diVsmHOEAmRWgHObjzHNH/Tp87dnVCRwwhHIVJOzZTqbX459fNubxzA==
X-Received: by 2002:a05:693c:60d2:b0:33b:f588:805e with SMTP id 5a478bee46e88-33e8d7d6b93mr2288879eec.20.1790162922427;
        Wed, 23 Sep 2026 04:28:42 -0700 (PDT)
Received: from [192.168.1.125] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7c63bsm5910552eec.10.2026.09.23.04.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:28:41 -0700 (PDT)
Message-ID: <c4393178-5b5c-4645-98fb-9855b552c2e8@kernel.dk>
Date: Wed, 23 Sep 2026 05:28:40 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/15] io_uring: thread identity handoff for blocking
 inline issue
To: Gabriel Krisman Bertazi <krisman@suse.de>, io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 tglx@kernel.org, mingo@redhat.com, peterz@infradead.org
References: <20260911154148.644489-1-axboe@kernel.dk>
 <87tsnv1ynh.fsf@mailhost.krisman.be>
 <54310fb2-d4b0-4b97-bc07-68e27e462b29@kernel.dk>
 <871pal0wnk.fsf@mailhost.krisman.be>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <871pal0wnk.fsf@mailhost.krisman.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/26 4:05 PM, Gabriel Krisman Bertazi wrote:
> Jens Axboe <axboe@kernel.dk> writes:
> 
>> On 9/11/26 11:33 AM, Gabriel Krisman Bertazi wrote:
>>> It has the downside of still requiring fixes to every path and we need
>>> to handle every new case that comes by, but it is much cleaner than
>>> plumbing a nonblock flag several layers down the stack across each
>>> subsystem or having subsystem-specific details in io_uring, which is
>>> what we have today.  On the upper side, it is much less complex than
>>> your approach. It also allow us to just back off during memory
>>> allocations that would block, solving the memory allocations anywhere in
>>> the submission path, not only inside ->issue(), which we discussed
>>> recently on discord.
>>
>> I think you'll find it'll be a lot MORE complicated than my approach!
>> Backing out error handling is going to be impossible in some cases,
>> think file systems for example. How would those cases be handled?
> 
> I understand there are many cases where it would be impossible, most, if
> not all of them, involving FS.  But I naively imagine we could back-off
> those early, before we get to the critical session, without even trying
> the nonblock approach, similar to what we do now, and punt to the io-wq,
> which is not going away anyway.  What I'd like to solve is drop the
> logic of other parts of the kernel that we need to keep in the io_uring
> layer, such as which network protocols will block and which won't.

The problem is that you don't always know until you're at the point of
no return. If it was that simple, we would not be talking about these
patches :-)

-- 
Jens Axboe
