Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709936;
	b=gfrKTrIrNXqxebW33Ox9YonI4xhjDD+DnLuKApHOhFxGlmXynwev7p3b9z/FldVjaR1b
	 7WhbfjOPFKiaRUUaz1pDyaPOWEw0n+5TYH/UXeeX66vPE9yUnDUahBIVPkRPIhKpbdhBY
	 UrazzpynQ9LS/ON6Z9yF+FDEEuXHigIPZ9xUndB3ATm0ro4VjgIHKfTaW300+wpIHM65w
	 gy++fx37OfXNrKRUj5RAQtV6+uYFBy1Xwc9C2KDOtyKCuAhXDHp0u+NrxH/K2wCUS8Pff
	 M6/o3nRq6RYCFRBCLN6hCk63fp95y2moUEe4OUN8I8Kjk0cySXwdYxU8kTzkItamiyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=rtZBeAu55s7ZloA+uxO3vPTR6c/NwsIGOFMs0FGmw6Q=;
	b=2igPLJtw+RuQm8ae8oZODhjDKPjBlb+MbMoQxPN5M41hvouH+wN/6wktXorUJVhgdo6P
	 SNT91J7iH45GWaj/AUKI6ixGKTWJ7aVL2gF+SVw+gw9Qzr2meadwuPt8mDSwavYXe25GB
	 u2LwL/mLoLvAkWD8aOAclwsMqcssml4NUCUtHIiBV/gHTmB3IffOAn8wlPFjrIjkflwBy
	 GbqevBhCYRsWQTeJ0YzIIZ/O1Hf2oezpVvYcY3ioAFVBrYfbGvQ+qbN3C23jb3OGRPatU
	 8Xt8Wp9B9/WeZ/vFMGYQHFY5w51W+4c29FKs620AERcQV+B3BgrkO9QnMX3YuCtrleQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=qxuxe3Q0;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C82606A33E
	for <io-uring@vger.kernel.org>; Thu, 26 Nov 2026 16:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67C82606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=qxuxe3Q0
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8d1aec63541so283940b3a.3
        for <io-uring@vger.kernel.org>; Thu, 26 Nov 2026 08:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795709935; x=1796314735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rtZBeAu55s7ZloA+uxO3vPTR6c/NwsIGOFMs0FGmw6Q=;
        b=qxuxe3Q0W5XXpl0fUvUZLskvRNe9SG5ofEfHdMDb3+R4KITuQjJ0XYanUY9xQ/nQul
         whJS2fIcQz2/4QwDDjbOMiyf/Q3yGe5H1mwdJ97pnfaykqylS40+DYolz5Qy1dnW0sJi
         +PEFJ1Pn3eHnkxQ53h7U9HJdXzh5OWXqOLTFYiPdQsRw7meUS8BS9NcsDNmvWE13L8X0
         4teNlL6KnWoa33dBm73ssubc6KHK7V3ZH3yHz/z02CFt32uQeV1UBl5WLNer/lFfji8y
         1KDJRNBVQ7IuZgsnHz454wS6PdudLpkTabwc9/A35NwoviY8aht5rBRYJ20Xj5sc0L0f
         KBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709935; x=1796314735;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rtZBeAu55s7ZloA+uxO3vPTR6c/NwsIGOFMs0FGmw6Q=;
        b=FETXjqpfj0ctJ2z3++v/S0a0MkMzvpB10ZGJBnS4E64mmPMi8qPqmhDeuPCvtSwraB
         UeIJDA0ka8Jq2mP3j7KcX+TL+9JfobF5FIVyYeVra0wVCzZW0Yr5iqUGFJ/Tfqfn0Z8M
         4mcptPAMt1xsgohuvel6+NVd7czBz2XD+5OlGBmo6XBsN3vywHFKCgM8VLLYBsw1pl+7
         a5AXlIc29J8caU1rFE3OMY3o8eCu4uxjfntF58TbsAbEsKg1ExvABTl5I2xgYpxqoczZ
         QazAk02OhU1JtvQZqlyr8jB0LbQ61VFXBFparLGyPLCNqMWd9IkORYqEiNG0FAhMgTrh
         8qwg==
X-Gm-Message-State: APuU4Z889Vz3OuUnWemB/LPfh/QhG4t/OMtGHylm24Q8vJBwNBOqFTZD
	q6WqxCmXBcd9/VwdDJY8Wn2xNtYql40e5ZVPPJHzinnVyjnUArvlN8kshO254UA+tzk=
X-Gm-Gg: AZFdTZcjfmh2/JaY/rNogp0Z7Ak4hsSFBaUgMaCJbsTf99jbvDDgh9rPJLU+Ijmak0d
	ASOHtjKvU+IvygKblfpw8ra2f9429S1o7fpQAHmwh0BSNPkpdk4VSWMHkkjSMGX2JN/bk1W2f6Z
	R0lcKhMYVSAjrZ+9dPyDYaZIADJXuElOi7KNUI6PlnoZoVlhoUnAwNL5szuC9gr17ww1R5T/k1B
	MmP21RUs7do7hIAAvc9tUcLZhG2Sn0LABf0yZQiJlZ5BiB/g49m725dk3jU8H3vhAFJJMh9lQwI
	8PeeOUwedoUHMbFjR9tvDGul9L96wS1ZN23vIjJBTLlr6lTwEsJLHiqZppDJBY0IzTUPE5K+Xuv
	WUCXLTmfLfRV7TfwZIld8BzDFpPyPCqRzKgwvDrvbLfKYfcI3vdHBzdQ7YGJ04elM+5ASL9nDma
	DWuYLYPMalTf6l6QZ12d4nHEaNPaPw9XxPsU1PfBNho2Ax+QPPPYP0d5dobqrCPkGX5YATWUmWv
	dhdmoK8Ht6KlwGaT1dJV1y0KbCy4zM/WAf28phK96yl4PCOXPjy5OcqbO4S8QYG+F5K9srpC7Gd
	wQEhB5x5DgweheEcrrdQe1d//sydQagj0HM425QUDUbPbz9iKUg3BBR3k5+7PEPlKovMWmpgxKu
	tj8/2WAQgMb392PEw1xV20wK1fZoucKKkamyVn2CBgUUWrvps1+BHqFDRqG9A/24AHvU6sw==
X-Received: by 2002:a05:6a00:1817:b0:8a0:5f63:5521 with SMTP id d2e1a72fcca58-8c8792bef60mr19479396b3a.8.1795709934821;
        Thu, 26 Nov 2026 08:18:54 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87344058bsm10863765b3a.41.2026.11.26.08.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:18:54 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: asml.silence@gmail.com, Sechang Lim <rhkrqnwk98@gmail.com>
Cc: io-uring@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261119115942.3613868-1-rhkrqnwk98@gmail.com>
References: <20261119115942.3613868-1-rhkrqnwk98@gmail.com>
Subject: Re: [PATCH] io_uring/bpf-ops: validate loop_step before
 registration
Message-Id: <179570993387.7152.8807787806232376566.b4-ty@b4>
Date: Thu, 26 Nov 2026 09:18:53 -0700
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 19 Nov 2026 11:59:29 +0000, Sechang Lim wrote:
> A struct_ops map with only ring_fd set leaves loop_step NULL. The
> struct_ops update path skips a zero program fd, and bpf_ring_ops does
> not validate the completed value. Without BPF_F_LINK, the update then
> calls bpf_io_reg(), where io_install_bpf() triggers a kernel warning
> before returning -EINVAL. With BPF_F_LINK, the warning occurs when the
> link is created.
> 
> [...]

Applied, thanks!

[1/1] io_uring/bpf-ops: validate loop_step before registration
      commit: ba0084f1402bdf2946282290a3fb0af8f3544759

Best regards,
-- 
Jens Axboe



