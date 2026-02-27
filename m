Received: from hr2.samba.org (hr2.samba.org [144.76.82.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679B2343D7F;
	Fri, 27 Feb 2026 16:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.82.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772209624; cv=none; b=PKz4Y4F4SZmzWSaTTOKa+1uh5nfaEv8W0HBO5R5BjxgcmAqyThgLAGLszevwEaYZdbqQ9pj/ct4sxBbO6qERbbJKcedUPjWoaEAz5vYLr6o3ppDtq+yTyfIiuJhcl5aJFtBYZAw3L+H+6FHOgk9eFAbzDNsxtHE526S6gQe9+FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772209624; c=relaxed/simple;
	bh=na4oEvv7mb6cZhlCEv0X7AOCy6JHjCOmr1dH07T1zBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZI23c5rpefchRwJ1Q5GgdGSMWt3MWYSyxR9h4IYzrl4HfgMwC/ONRMnrkbnmvH4J6zum67b1Kl/igx+zGRtYqnTTk+AU3EMG3AV7yJcJiOE55d/5cFyTJ2aBgZGyGzxyiweKBe70M/kedAYoGvQ+m0fbyovA7HTt2EuQMIC0z5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=samba.org; spf=pass smtp.mailfrom=samba.org; dkim=pass (3072-bit key) header.d=samba.org header.i=@samba.org header.b=3VFbg969; arc=none smtp.client-ip=144.76.82.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=samba.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samba.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (3072-bit key) header.d=samba.org header.i=@samba.org header.b="3VFbg969"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org;
	s=42; h=From:Cc:To:Date:Message-ID;
	bh=R7gJjLYWSj7+kbFvFsfKNjbAMTQnmOhChAMnjS83TYM=; b=3VFbg969a6JI8lP1dYKF4vQTdL
	/1sFDW4y6A0pZ1r8HKRFMPZQZNO3vkMfx81IZA9xC0BpBR+Ndy8iF9q+MTBmPshNNHAdgIwOuKxE+
	8NjcQv+KzR5xPM42+NxdnnC3RpiVdWTaNM9vLHCapsU37XJvixzvCyYjb6pKX68sibNLo0LPa1YjG
	KZ602+0mrNGFXZ7ueLiRSjvEi/XT0QZe+DdyBPfT/On0RYjJ85jrvcmaCgkRxoIz/DAYEmfzG9Hba
	uSHDbN8Tt83Yqcu1cGi2E/WNzVDRNgl9csCE6yM4iGGD6BrvsUV2Vz4/eZOQ4hwf5lbSY5RcFlBdI
	0jY9fMbsNM8jvJf29axeHWnrOS5e8vad5cxuLBXyZSgE9DrB0ms4PCE49Ij7hkGUoLew4rMwy8SMp
	2c5nEaG1gfd0zuAzKNkarAvUrdXryE9OoOOgWXFKK8rDU28su/A+tAcefgGyRjn7dSm99VMwE3w8H
	JpLNYVHbvIyHjNzJV+iPUAzI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
	by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
	(Exim)
	id 1vw0g4-000000090Up-1Udn;
	Fri, 27 Feb 2026 16:26:56 +0000
Message-ID: <6af8c485-fa2c-44a5-809e-785db72f58b3@samba.org>
Date: Fri, 27 Feb 2026 17:26:56 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/net: don't fail linked ops when done_io > 0
To: Hannes Furmans <hannes@p2p.industries>
Cc: Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Hannes Furmans <hannes@stillwind.ai>
References: <20260226220310.758404-1-hannes@stillwind.ai>
 <ad61f286-5a4b-4ec7-9586-6fbf58e961bd@samba.org>
 <CAKKrEi2Fv07qR3hTDtfQLQuYNhPqUj=FmMks=OP2bQpRnF=BMw@mail.gmail.com>
Content-Language: en-US
From: Stefan Metzmacher <metze@samba.org>
In-Reply-To: <CAKKrEi2Fv07qR3hTDtfQLQuYNhPqUj=FmMks=OP2bQpRnF=BMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 27.02.26 um 17:14 schrieb Hannes Furmans:
> Hi Stefan,
> 
> Am 27.02.26 um 14:59 schrieb Stefan Metzmacher:
>> That's by design, if a MSG_WAITALL calls fails it means
>> not call data the caller expected arrived or were sent.
>> When there's a LINK after that the linked operation likely
>> relies on all expected data being processed! Otherwise
>> the message stream can get out of sync and causes corruption.
> 
> You're right — a short MSG_WAITALL read should sever the IO_LINK
> chain. The v1 patch was wrong to guard req_set_fail() on done_io > 0.
> 
>> Let's assume I want to send a message header with
>> IO_SEND linked with a IO_SPLICE to send the payload.
>>
>> If IO_SEND returns short the situation needs to be
>> recovered by the caller instead of letting the
>> IO_SPLICE give more data to the socket.
> 
> Agreed, the linked operation expects the complete data.
> 
>> So the current behavior is exactly what MSG_WAITALL
>> gives you. If you don't want that why are you using it
>> at all?
> 
> The actual bug is narrower. I traced the root cause with kTLS.
> 
> When IORING_OP_RECV is used with MSG_WAITALL on a kTLS socket,
> the recv completes successfully (ret >= min_ret, full requested
> amount received). But kTLS calls put_cmsg(SOL_TLS,
> TLS_GET_RECORD_TYPE) for every first record of a recvmsg call
> (tls_sw.c:1843). Since io_recv sets up the msghdr with
> msg_control=NULL and msg_controllen=0, put_cmsg sets MSG_CTRUNC.
> 
> Then io_recv hits the else-if branch:
> 
>      } else if ((flags & MSG_WAITALL) &&
>                 (msg_flags & (MSG_TRUNC | MSG_CTRUNC))) {
>          req_set_fail(req);
>      }
> 
> This sets REQ_F_FAIL on a fully successful recv. The CQE shows
> the full byte count, but the linked write gets -ECANCELED.
> 
> I confirmed this with ftrace — the recv completes with
> result=67108864 (exactly 64MB requested), then
> io_uring_fail_link fires immediately after from an io-wq worker.
> I also confirmed with a plain recvmsg debug tool that kTLS
> returns msg_flags=0x88 (MSG_EOR | MSG_CTRUNC) on every call.
> 
> Your commit 0031275d119e says "For IORING_OP_RECVMSG we also
> check for the MSG_TRUNC and MSG_CTRUNC flags" but the code
> applies the check to IORING_OP_RECV as well. MSG_CTRUNC is
> meaningful for IORING_OP_RECVMSG (user provides a cmsg buffer).
> It's meaningless for IORING_OP_RECV which never has a cmsg
> buffer.
> 
> I'll send a v2 that only removes MSG_CTRUNC from the io_recv
> check.

Sounds good :-)

Thanks!
metze
