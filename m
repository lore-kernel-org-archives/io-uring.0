Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793038400;
	b=AFmch2k2GmQKfHK7Lsa5pYAqHwRXVIQk7PODeNdeVXkwlklswFZzs45vm9B67OGY9m6M
	 xgfqzqs7cbTadqtzqh0lLHD/HN9XpgbQqO9Pd5OETW7QOFzxemZrOC4kz5x6TehotyvJz
	 HVY5OLayO5wqGnKQ+LlF5E8ojj+TjCWCQJhnPsLTBjnRBRAf1KB14TFW8Wf9RCRqgvlAq
	 sphG3g7BZqGBUhPdbQVP7bEDbmsndB5KhDuuN5TFXOQ3OhejYYFaZifoauNHOjQugWwtx
	 b13gTGOuxL8XJViQOH+bj3zT/0sFFJkcgOFwUjuDwDTfG4BuvyhaIqWFxJKAMn+whIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=5chOq6U6GTtF4NKx2As2omT6eU7uon7QFz+o6vw3QJ0=;
	b=AgxebbG1f1X8/1ff8/k7Wqj0fjQKJuQXbT/Ids4gyyNkLfZSNxB1gXZnkFdOqrtsuko0
	 KCijnS1yOz/djiPT6lMym5Fs09PwU92esunJdGKEA4lPEd+ETV1lQzFms85hfSkJW8vlh
	 GsuuY1R0G0EAfQYN/ThsxpmgReXfl/LKZL6IV26vZ2LoF+CdJzWniYXePv2rb7Tml3V0H
	 SmEES/eo4bHv2fI6DW3UvF8J6wIUqPvZb4+LT3VoVnHMB4S5AjbySk9Un2G4svlVYSeSD
	 c5aqFDOCIJFBOyMwjVOjtIx6uWpKbjP32TV1kXlXNeAD3KLtWyJzMo3zBH4MDnVP7yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=mlVKKmkk;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC71606A327
	for <io-uring@vger.kernel.org>; Mon, 26 Oct 2026 18:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EC71606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=mlVKKmkk
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1931ff67a29so1465418c88.1
        for <io-uring@vger.kernel.org>; Mon, 26 Oct 2026 11:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1793038399; x=1793643199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5chOq6U6GTtF4NKx2As2omT6eU7uon7QFz+o6vw3QJ0=;
        b=mlVKKmkk19RI0K3j73BG4MWLjg1vVMDB8Od3VPnrZUUyIwKJUQnUTL6pNA4sdn4onX
         ZMVDPT0s2FRij0qyjgkgEyYFQ7g5IpHXbdmlDhsJD6g5D4pXv7pmQ6X591+FdmTM2Mnq
         uHZ3SYxoV9L2QG+pysopFAi7/0jjaMB+RKDzThBzLFRwCmvPl2L8wL9V9x4TDMOoXO92
         iFO2i984iq3pj/dwC4vQ5y06DU5j2vgcm2ECWhgv9VqNZhsVcl/U0T/psSLrDsrOvtyC
         4Bm5PFSGHE/3eaKvPCi+XFsaFEVTjw9ngSpDxW7q8c8nQaVBn7qW5gLfqvyZUIcNnodP
         Eg4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793038399; x=1793643199;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5chOq6U6GTtF4NKx2As2omT6eU7uon7QFz+o6vw3QJ0=;
        b=paNgdJ0cIdxlrw2MKNvy/d90STxxy6rnKy53ika9Q34SJM6emTrVoY9eX9PYs9QsCT
         jGy3GcCdmN6f+j93jul4Hr86EoCFg7PzxBj3+GtG4vqwu2KVH4oFG4BRi0GsIUyQPdDD
         S2FQXjv4bh4oHYqUUH5o+2kuBsiyXZTK6McIT1Jn2pAkApgcfpeltboIIB6p/rkBQrod
         ABBHVpRo33WNgCDfGDVM1YJ9RHoDKqh70AQUD6tnhR1CVaTYHDu+9y8GG3ndzHdK688G
         qsloWZC6WcvOJRLCT6Io/pt+1g4Q9VrN8R9zmbzOLaVnY+Lc1mYZ/N6jIvsiup1fNPKT
         r8yw==
X-Gm-Message-State: AFq9FYI82Z/I97VEG+dYqiA4Nn+uoQyvXolWyJUo8XRKDKZmTnqme0vf
	MlmKWIcT5sFEbLiZhyeoZ9sHUyAmimcRYapiwpVz8orwzMysRfqVjMkQJpwMyP4gfQ1ltN/hoWw
	ATuJMW4o=
X-Gm-Gg: AYBFou0VRl7hU5ZXFk0wK8+A/oP987Y2eACrepJuZTn2cTbkiDWijsTHDCaAVh33fxJ
	MKB24Set+8vj2KhDbXQ+SpVSS492Wxc5UZHf+RUpzkZwdwQTGcUxReuAUWzjEf+hEIClWtQHI38
	oNibDNoo/gJvrMOMDkoWY0HE/+aS0ulAcWLFL1uq9ZWyBKCKsbi7crirKrM6m2MUTf+C38H0+PZ
	i99BvCTZY0+Ny2Q6a9ouTWc9qCYZRAk6/FGgPQObMeHi44GBRuuBIqJpL2EjKvvB801a37YHN0O
	JA0XMZMjRZyD2SRQqFXp0WOD0xu8KBut7Gll4aPL4VCefo/f40BUXK4L7nT8NloiSe4Z91FJIwa
	Yc6W1EArwo77DdxvSUxr8y3btcV2Js7ZogoQUsDf043JjQtguJ6uaXMcR0GhOYIP3MJeNjgP1En
	f9yW0XjnXoW0U4AcgXu5l8NWuZcxz7Yfy0vcgEszNSooYkMtNGjfESCUfxBV7OZI+7CG92LmVrj
	Cbut3RbBsk6ozsP116yueKfL5+06ZdcPgR+nBZizQ5oq7Nar9G9PwLOQ8LCKUsecZMEITKh6QdS
	J4Baz2KpheVXkKK5jwEIvQQb/3RmER/91Nd8nxi4Qd0ScOEhxgtxgK3vUPOg
X-Received: by 2002:a05:7022:7f12:b0:180:15be:1f9c with SMTP id a92af1059eb24-199361b4ecbmr10447007c88.30.1793038398534;
        Mon, 26 Oct 2026 11:13:18 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm23576455c88.8.2026.10.26.11.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:13:17 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, Yichong Chen <chenyichong@uniontech.com>
Cc: linux-kernel@vger.kernel.org, Stefan Metzmacher <metze@samba.org>
In-Reply-To: <20261023112209.87979-1-chenyichong@uniontech.com>
References: <20261023112209.87979-1-chenyichong@uniontech.com>
Subject: Re: [PATCH] io_uring/net: keep recvmsg buffer select length within
 MAX_RW_COUNT
Message-Id: <179303839763.792754.8466602423442934526.b4-ty@b4>
Date: Mon, 26 Oct 2026 12:13:17 -0600
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


On Fri, 23 Oct 2026 19:22:09 +0800, Yichong Chen wrote:
> io_recvmsg() takes the transfer length from the ring provided buffer when
> sqe->len is 0, and such a buffer can be up to 4G. min_ret is an int, so 2G
> or more makes it negative and the (ret < min_ret) block is skipped, and the
> oversized length reaches the socket layer unchanged: an empty socket then
> completes with 0 instead of arming poll, and a short read is reported as
> complete. Clamp the length to MAX_RW_COUNT, as io_recv() does.
> 
> [...]

Applied, thanks!

[1/1] io_uring/net: keep recvmsg buffer select length within MAX_RW_COUNT
      commit: 18d3f56eb6e6500a65d81cf265f0fe74fd9ecab6

Best regards,
-- 
Jens Axboe



