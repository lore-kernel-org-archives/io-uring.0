Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805163;
	b=S1LxX3j9l+wWtCtr0fbf+7mpLkrK3KcZHyTuzV1enC98hmRaRYy7wWCERmDWk1WKPfIA
	 8xzv9K3le2iaug+UKzkpjQIgGdQp0q+R5lFByiUStQQvW8IOJaoT0bOkM8nu+BznySPfy
	 un2z0PApztbnjWd4eS/J6WAO3RhVu0U0GOnQeUy8oJ1dIuU9SZPKtRvrCpD1Z/CA7xBSa
	 gk5u5n0/CXV+mSeo3tyoJkWG6ZDnGNDKJE+x21NrygCBcHE4Tx75LmCIJWp3zEO6hEAbd
	 qQhNm3/ncYe5IU6FSCMKc5ocvQezu73gjCT1BSgD7mUj9rvm+dcVxE4yvfUUE9FjXTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=f81nS/eoKUUcZf5XKYgHZ958Mlh4VUYL+dqm5PCCe8o=;
	b=xIRTQJ0dqw3B6faL9Mv0alailBk5qRGBv/cQN3spB1nquJE99k5VkO2zwzLP01mD1T7N
	 gt1w7v02+scdkQol/BCeVP29HVRP1+DkLdcsTTlETc+LyPW13s6OMV77qjJiJrqrHxrve
	 gX1RLU8X2uHsRQ1ZxoShtZVuTN2l7RW8IV7Rp26WIhr6oTqssg3pOcK3P9oB2dPD8J2cE
	 /wpRcYGP8lq1D87LkzUIrPp0l8p7oSG7sMJ6R1X1zwh/hQLZMBtJtUECe14mksAcZaf6D
	 b/OkrPbGst9p723icQubfpRyZrvkQasqgRamyr2660tYTqv01R/RxZ7H+6oYq2/k+Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="jid3eRo/";
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E628606D83A
	for <io-uring@vger.kernel.org>; Wed,  4 Nov 2026 15:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E628606D83A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jid3eRo/
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-53ec2cc397aso388025b6e.1
        for <io-uring@vger.kernel.org>; Wed, 04 Nov 2026 07:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793805161; x=1794409961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f81nS/eoKUUcZf5XKYgHZ958Mlh4VUYL+dqm5PCCe8o=;
        b=jid3eRo/reWq7duG1LvK87LawfyOLtCRxikd6FDiPLSTmoqO/6O63Hy/6xXcqD1fMY
         vvLsJZTRFB+81eo1gxDP+vaFVJc/L7YLJazxj7Hol6rrCfSFYk3DbYm6NdWg8Lpx4pMQ
         f7yUcLER3Q6BanDMX5R1WExI5ZQEpwZae5icjgf78a1K6iqRTXsOXy1YYhDlfINxCbzy
         B45vokwN470gKmD2xjniryCODxglNrLFBBrCKoJZ59zlVKoXYC9IPuQEyiP4mWZKB4n2
         ciRv2hv7d/e1jRdfyEGWzJmwOsBzNGDKWQZDPP5eC1vuHStXpAmtVVpMr9xSlr0L+xBx
         /NKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805161; x=1794409961;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f81nS/eoKUUcZf5XKYgHZ958Mlh4VUYL+dqm5PCCe8o=;
        b=wZLs/kYftO/DlSJmSX16DuCYP6av/nszMKcZfUryAbUDobUs4gqYRecyA9H6DAqEgE
         zcnJBdHKSrj3eodikpj2GkfPRjuua3kRfMTxAJrUZdUkWUB8bgUrUesQTlBYdv1Xmakp
         fB+w7Uw4Ce2prz7CAMKj4Zk/9uNyUE18vUD+DMDW7pTlbgiIRdnC/ijTx59X6N76LZFf
         xs0hoxOnCNosmLeD39B/dv/wbs3LUma6p4fenH1/DN6//Q0AxhHnoElr04lZM99O5/uC
         m7Hn26ddi5tE891D2z5UCkl2JRCXVf7+t+j56thJNPZQq8uX/6oUajUNbXTwm9PJdTyT
         Dykw==
X-Gm-Message-State: APuU4Z///lVFd9jnMISDSvNPPO/uTu3f68nlbqMEfiLAfXcOUtR87cLP
	elsgFbTkpFCxkEs5UTXSCgheq9gCJDzSLim0ILN0nAtdOcLe6BGn8NAoWr70gBZN9WgCq20m7V2
	nfBr7G8Q=
X-Gm-Gg: AYBFou1vgtn/SAFjlNdWFjyD8y5tgwpaW9m70gT22Q3RLxLi7oqnxogjb2XqMQc8uux
	1GY8rpg628dOWrXhzXQVU+MGG/3sHYnKOQYfkMj+qV1wFZaKAn+xFl4T3iuIbDStxIvKg4OjulQ
	2flzbW5MFD8X7QByxGjlEO3Fi7a8JaYbHg72If/ci6NDcKIzt2HWFPC87hl9gPzMRRdGDRPQSb8
	RzXjkBzqU2huMK9x8DPpvSFH2ONlXb7ONOEKcsDJPb1VzFuQbaelhJiH9r3VEu2QOlxL1dPP+mp
	H0wBJW07q4LDlbDYUOggmpNrQ76BvP0WHDmx3+/PUwD7MrKhn/X8TyndgARY45v+Ny7pp/JWjz0
	W3gG8TkVSXzQuOPuWUp1EcQ1poRkxN1jW9kKU4nnAywdB1b1z5n/MLcNxfyCIF0/gA/0GI3yFb0
	qUW+xiaqIbM1MkfJL+xm39kamT8dX/krlvo6EyCazDost7CsHgh7Jx3xLS9d5tf7RCCglPA9ZOm
	dXeeeOZmCwov98LdG1ChUtUzFWgcUB5duABSZBh6ByrwUjMYKKj+K5VAIJ0TSrO0agaTXx8i9S9
	L/iN2iE8cou5o9EvCMThU6f4e0aUENi7zld4fw64/37SBItu5AdQlsr0AdhrdGt9dtk9KLQRiZD
	ifGtDhgo3
X-Received: by 2002:a05:6808:3505:b0:4f6:1ef7:6cd9 with SMTP id 5614622812f47-5640de4145emr11179698b6e.64.1793805161270;
        Wed, 04 Nov 2026 07:12:41 -0800 (PST)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f41424sm1850696b6e.9.2026.11.04.07.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 07:12:40 -0800 (PST)
Message-ID: <7cd23f57-dbf3-4175-8a4d-25b099aac4b5@kernel.dk>
Date: Wed, 4 Nov 2026 08:12:39 -0700
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
Subject: Re: [PATCH] io_uring/rsrc: hold uring_lock across index-alloc
 put_user
To: BeaCox <0xbeac@gmail.com>
Cc: io-uring@vger.kernel.org
References: <20261104092818.70521-1-0xbeac@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261104092818.70521-1-0xbeac@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 2:28 AM, BeaCox wrote:
> io_files_update_with_index_alloc() installs a fixed file via
> io_fixed_fd_install(), which drops ->uring_lock when the request runs on
> io-wq, then put_user()s the allocated slot back to userspace.  If that
> faults, the error path calls __io_close_fixed() by slot index after
> re-taking the lock.
> 
> The slot can be closed and reused between the install and that cleanup:
> another fixed CLOSE plus open/accept/pipe/socket, or a FILES_UPDATE, can
> put an unrelated file into the same slot.  The error path then removes
> that file instead of the one this request installed, ending an unrelated
> file's fixed-table reference early.  This is a correctness/DoS issue, not
> a use-after-free: fixed-file requests hold an io_rsrc_node reference, so
> the node and file stay alive until they are done.
> 
> Hold ->uring_lock across __io_fixed_fd_install() and put_user(), and do
> the failure cleanup with io_fixed_fd_remove() under the same lock.  This
> is the same class as io_pipe_fixed() (CVE-2026-99265); faulting while
> holding ->uring_lock is fine, the registration paths already do it.

Fix looks fine to me, but it's not a CVE kind of bug. Neither is the
one referenced, I'll get that one invalidated.

-- 
Jens Axboe

