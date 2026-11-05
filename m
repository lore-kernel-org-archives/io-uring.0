Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793885342;
	b=YP1Nw2kFvnieQ7iw+KKhAfLuG1IOsVmcgX54fSMpJvkiswXFN4DPBzolekgLF2d7XfFB
	 2cqPV1mr21ICdp8b4Y8hEuhpqKytrIYu7yabJrez3APzosK2jkFXFMmNowAX6YfPgPTUO
	 bKfBnc+FgwrBEim4ONRHwzZ2pmIXLd3j/jVSxZMknsJ16cZ+8NnVepGzNsYhPBjsCR7by
	 YKeUiDDzaNFK+vrxw1i8GplbIcHTf/d6nUQA7LQkh40ajoFIKpHEkGIIoLPcPi4SvcHdh
	 1KTHqQMiE4OJUx81HwAOvwHecZqXZgbziYtAv0RBKgpbu0Ik9VNQk6t+cpAAD23faVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=6mrHj4CuiNys75XCtOOzNTCjWS+enY6qZZdIQBYIpJg=;
	b=T7/GHiTBAezBCkoDaEa0WosPjR9c6l/ingPAameUy14g2EbZNGJHZK/qGfUKi8HmJxZ4
	 VAAvVlGBCE3RQFufkm03pCK/+jDXb2BNyV7xyuxRS1+NBeoPOfC9dVI0dGN+3pXpumOCK
	 2aLjv8laN4TM0ZpIOYZlRykdcFeLi6pXs+yQ4avVfqIY/6MxJQIGSwhbn4PTDbk7bBRZn
	 RPZfHS1zAkz25URphSMzyRZmJ5IpaAxfsj+yvyc90CfnML23XAyg17zCHt4KFAa6MpgqU
	 Wfr8SjaRvRLoyqytluiz/zE5ZGrWsiUbeUGPUashrUHm69jJZ/L8lh/RAI0+K7Jd5GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UWHqYAPT;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50037606A32C
	for <io-uring@vger.kernel.org>; Thu,  5 Nov 2026 13:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50037606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UWHqYAPT
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ea138a3497so11655825ad.2
        for <io-uring@vger.kernel.org>; Thu, 05 Nov 2026 05:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793885339; x=1794490139; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6mrHj4CuiNys75XCtOOzNTCjWS+enY6qZZdIQBYIpJg=;
        b=UWHqYAPTT1iJjMjkhmZN8OyXtDqZ94cllRjs9W4ou97ta+APi0O8TLMczJJRZFr7O5
         3KyQ/sDk1UzqcCg/MsDssdx7S1tThQ3RMeGpXk/4e+4Kc0eTh+HnRAid3sG0VNVciuLT
         ELUTKTMNkvmG5V9sSCTPe6qf2s55KZ7+hTNICv+hqju+upr9JQAK8Idfzg8Rlpf9jiWH
         BFn+gPXM83a63DyZmkjqU1pad7QBh/YBlP8+/+ASJqwkpH60EN9koVL/p3+vcKGrGHgT
         OWwKXdq/qesLNNWrR2hqF4d96dqvWUdfhmDvahMe+hyMCmi/xI0nt3AT1SZ3MzN7kV+6
         tLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885339; x=1794490139;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6mrHj4CuiNys75XCtOOzNTCjWS+enY6qZZdIQBYIpJg=;
        b=EXCeLtMl3str8TVIOFrrWZfMD6H7ErqeD7i3twgg62/yhH8VsdRHRydt3DqO9L3lvu
         4TFEAjdHQGdbgp9Hg1mPTHgE2kgvxkfswaj/3mIl/czY4nIgJ6CS6rCAJFlSa/cZ+zgp
         Obbci9P9agKfjKLmJnMUQsEB8cispOINKRt1Pre0MrV4iGnhLU0Gmb/WtTCOzeFsNhG0
         MpP6DlguIeAxhP2kMcgUHiGvdqq9t/28CquqlFnLyxXdH4ngps1rA9Z1DmgfyVR6+NmN
         kOpWD2mg6wRXd2lh82S8Gl5FcdQ8xpKd0rORDNf2Y5KkBnNsmolDjXKkln38au2S5P6+
         P8ow==
X-Gm-Message-State: APuU4Z/ReLxPZiGYdrJAi93DD9PzgzRKnpq/cN7i1XSEIJM4hEbO5W/E
	/0gMEqMMqxz6GZSs5ecwH9rh9NMnn5+yDEnNeDD0PgTZOhLd7aIQMG6JDp+GBOui0T8=
X-Gm-Gg: AYBFou3eTfvcTrYTq5r3gnO3VcjjaCJDUPMPKaSbJoJVILe2xY7AYTyHaqGx0hwzCko
	Wa+SzeD3O12YXvPbYTLPF+5jt44/RxeAt/NksxRRVZf+uC9RKoJt51OPBGlD+MugoH3tY3/7CVt
	6MrlVty8FI9N5P6+CfEQvzoP35yV0vInIHKNbsQlAZbSbRA8KvdMMSuZRLtLmCoCDHivnCh6llO
	bgVgSrJBM+AKCEf7FfKQ3gRmrhoYP+4pNEHBlcmOw3OvFWqoNQvkjF5ptHe0rRkCKw5NCh6wIiH
	1LKAjoudd44vUDK/LU+s5twCuWKfduZDgmCd6gCWnLmZLKviZ4+ewwTgVK+VKANbdvOgN4vSn45
	HNUaOR3TZIq2bfWSyTGJBH62EYkLK5/8ahgo0mhQl1QvVGl4dxqD22a7Qsh/VgjQbaHGreFf3xj
	pLJ9BLxDNHcxxICBgf8v2fBVXJqSRjQf+1indT2R2/vZ34BdErehBQgK/Zsc+UomL25XXXcV/zr
	prSZbH/VzamYO8nGBMM6o05Xp1WoFqRRUTC37UIwGa0jSGiB+AQaDPtaKEyCLUcqYiKinj7tTsA
	S6G0wxtJDfNqqQS+QInFZgpzVsNJf17+3QVdzlEzr9eqN+1yL7mymYmvLxcQbKCB9EK6Zi4PRK/
	eOeyEEzzKvKb8lSAHPWL962pMOv3d2vkP
X-Received: by 2002:a17:903:2407:b0:2dd:ad74:ac28 with SMTP id d9443c01a7336-2eb364a1427mr183211245ad.26.1793885339235;
        Thu, 05 Nov 2026 05:28:59 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46998fe1sm2168508a12.27.2026.11.05.05.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 05:28:58 -0800 (PST)
Message-ID: <3f0cf989-c294-44ac-8bf9-11bf69dfee45@kernel.dk>
Date: Thu, 5 Nov 2026 06:28:57 -0700
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
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: io-uring@vger.kernel.org, stable@vger.kernel.org
References: <20261105061433.1947491-1-bsdhenrymartin@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261105061433.1947491-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 11:14 PM, Henry Martin wrote:
> Legacy provided buffers store a raw user virtual address.  It is
> recorded in io_add_buffers() and later returned verbatim by
> io_provided_buffer_select().  The consumer (recv, send, read)
> imports it as a user pointer, so it is resolved in the address
> space of whichever task issues the request.  Nothing ties a buffer
> to the address space it was provided from.
> 
> When a ring is shared between tasks with different address spaces,
> for example across fork(2) and execve(2), a consuming request reads
> from or writes to an address chosen by the provider, in the
> consumer's address space.
> 
> Record the providing task's mm in each buffer, and refuse selection
> when the consuming task runs under a different mm.  The buffer stays
> queued for its owner and the request fails with -ENOBUFS.  The mm
> reference is held while the buffer is queued.
> 
> This issue was discovered by Tencent CodeBuddy Security.

This is nonsense.

This isn't a bug. A ring is shared memory, and anyone with access to it
can write SQEs that the other side submits, with whatever addresses they
want. Provided buffers are no different from the addr field in any SQE,
and the same holds for ring provided buffers which this patch doesn't
even touch. Sharing a ring with another address space means fully
trusting it, that's inherent to the design.

-- 
Jens Axboe

