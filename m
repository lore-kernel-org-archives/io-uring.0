Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716263;
	b=HD+DIDR1DiaPDUe/dNPkPEJeTYTAL0HWtQsU9A68AUmZSQNUlX7zlkjALR3AxTKuzKfL
	 Vn4tnuAUbhhdsZD+7uS7DpEA95JyKb8QUjCtynUXOctyzZ+c6clAN5RWE+JSvzJzS9bBY
	 EHKKV0f3xz1jrcz9WtOvDa8ydT0NyZJkdBnYqFpxjtUIiD0F7jnx2KT/J6xlpCnbf3c3/
	 JHV7VJrZcAtRycWAelQNTWWoZAiqcnupKikDkpWZNN0tw1GUY26dlrrRxf564jQi93Y9H
	 PoHbJV5eMKskSDPQ8NtvW1yAH2+HtFx7LNYor6Adsxv8/Syaz2TLzDpdiZHVzkIY7Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=BTySiT4CrPOODl9YOV1nelrNFr1QsD+JxPopoY3txQA=;
	b=zGdC1rP4gUzVn3BwnBlyAG5ufrIUZmsi5N2Jc/t0PuMxkGD2qrbfZ1vKiQx12oR79okn
	 3eSh8lwmq9Tp12KKrkNrR/BB1TQB3iuIVbo9nfVQGDj4JBdKVgeHcz4t+ehT/MK/SoAmz
	 /kqKWbEnfO9SblAqPEztTVagtpSxfMMMd3/4WItHm3QUS9VdNh1NOkyoZ4Af4FTeH8ekg
	 ZsXVEIROIX++nbjZPXl3SZGMAedV5+vyI9nA5rC07B/ZPavwyvdATVPNwKtMnCsCgHjxE
	 PPPn7dHVB8YWLslPO2FvVvo0uMP94XdtFhPznRz+xKyacWpi/k1XuoQmkI/5Ie/i7/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hpl39lt+;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99751606A332
	for <io-uring@vger.kernel.org>; Tue,  3 Nov 2026 14:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99751606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hpl39lt+
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-14394530ec6so5584749c88.1
        for <io-uring@vger.kernel.org>; Tue, 03 Nov 2026 06:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793716261; x=1794321061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTySiT4CrPOODl9YOV1nelrNFr1QsD+JxPopoY3txQA=;
        b=hpl39lt+1qTrI8kRcvim91PiMFAQRRR+f9nUT5vwtZytXDd/FttfTH6iHIo03yuyxl
         yRLqt4EZwoBlcCFgHW9bIzxE4lCrVSzXEw81wz2cixex7oTQY+asFmneLAvrr8RRL+6d
         XSigfM8vnhtLWXRnvszPAQWTJDNtgsgKyBlt1TGHDkiw1i+86OePnUG21PdBvMS3YVO3
         xlT/5eVwhxM0lZDf2MRBIfE9pvzZfo54IV/VlguI1EEIyrU3Jxf7YQ0uw872LCHettZu
         bYsLxfJXD+qT4u7qbJVSFKbubVM0HzMk7Jfn2ENt1nyKuQbUVxgLphwzI/tqXUz7zzy3
         GhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716261; x=1794321061;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTySiT4CrPOODl9YOV1nelrNFr1QsD+JxPopoY3txQA=;
        b=yFh6F2pMXx+AryMVVvkvu5B3Y8qMu0O/dUYxvzGbcB7JVrd8ntfKGEXVHPuoFgk+4X
         mM/XC36Pk5tiXQiFsAiKxwoavDRTCXrICEoR8bFKwbh7a/AC7VA2ctjWNzXxXcPokbf0
         GGU2csIlf+rnV8IS8M66W7AlGyRg8cukPaSs2Q5RSECv7XlugI9BshJDSr3kWyfYrLNZ
         RJoKUNGf9Vf4aDZ6Ylvub2gMA22K+ol1T+zDEZzn9sOoAdkTdu7LzJ+Q1TpDLEAieI0Q
         mz2kRAkXZBwnUJtjx2gv/YEthPAr0bH3/yBrpPFbPoYxuOLVE00jOz0tPLfrBH8oqWsn
         bo/g==
X-Gm-Message-State: APuU4Z90aQ1r8jEAQbQTQYDB06wdtMLmMhiKQM1mlh7OIqit5iAVCaYl
	wn2XGp4fwahX5Rp9Ghwzdnb/AGCvbvbc3d0vOqfxRpNL5+qd0ARXRhP8MW8JRc0xb00=
X-Gm-Gg: AYBFou00Z/IZEkmQLX096M/7fkQ2fItC8D1bDG+tTewTLuFsN2HhQITwVv9UP9urKd4
	eziK9QnR6/YgWJqF2q3Pq7iwYu83zz18MgaHPpwx464HdR5R+Hpnm1XScYMgjbO1R7/7C5XCX21
	fQn3+b6qOlCXxQP+zM3I6PdE/2vwH4qSqYQxPOx2E1ruejFPxtF+CDwAV0wfWzxi2YV66/SUsV1
	jPwD+ea3gYP6zaAyvx53WG3YY9HHI0ZULpbkX79VF78K0bcsb/jaP2gDrcnmu4w0LH/o4sFkB9X
	5uknVs2BzCBptT8Cg1nNwoQUTITxXIKUgc8pFp/3uctuSqfEseK2PeiOgrDlx6OZhblmu7/OXHZ
	sBvwf5c2yKmjdTOn03NOEuFkrkMrPMhmTLXPtn/F9b7OLjTq21FgJeh1WVrhhq4zJY8dUncAtKF
	CqsUaEDKc7M5fgsrE1JTZiSdVfC89xPQzFwr5TBwaIbDhtChuW1ZK+BVBPy3Ljfzs+iIDKqD2VR
	JwZ8pSBG12Cu+4lQycVfRKm9UsBnSHOvCPXgugSBNRBdE1G8uohDC/3YSmxEpAZ2N1gMD38M2st
	C+9kfsANHB3njXjUq4cu/M7eQVN/0lnz7FGu98drrhHEzE+GWB0IKoH05EM88dGn9XpUlncVQed
	mvF9EyymwKF3W
X-Received: by 2002:a05:7022:3a03:b0:152:9e88:daaa with SMTP id a92af1059eb24-1ac5f181628mr22730703c88.36.1793716261056;
        Tue, 03 Nov 2026 06:31:01 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23b847348sm9534779c88.4.2026.11.03.06.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:31:00 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Shuai Liu <847807867@qq.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzbot+675af112519ca34f5502@syzkaller.appspotmail.com
In-Reply-To: <tencent_BB08960D79E0261B5C1EB1E589787734E907@qq.com>
References: <tencent_BB08960D79E0261B5C1EB1E589787734E907@qq.com>
Subject: Re: [PATCH] io_uring/sqpoll: don't set IO_SQ_THREAD_SHOULD_STOP on
 thread exit
Message-Id: <179371626018.3691261.9700356493325892513.b4-ty@b4>
Date: Tue, 03 Nov 2026 07:31:00 -0700
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


On Mon, 02 Nov 2026 16:05:42 +0800, Shuai Liu wrote:
> io_sq_thread_stop() carries a WARN_ON_ONCE() asserting that
> IO_SQ_THREAD_SHOULD_STOP isn't set yet, i.e. that stopping the SQPOLL
> thread is never attempted twice. Since commit 22d9db9fd64a
> ("io_uring/sqpoll: don't attach to a thread that is canceling"), the
> SQPOLL thread itself sets that bit on its way out, so that
> io_sq_offload_create() won't attach a new ring to a thread that is
> canceling.
> 
> [...]

Applied, thanks!

[1/1] io_uring/sqpoll: don't set IO_SQ_THREAD_SHOULD_STOP on thread exit
      commit: fca3ff9e2eee7d285585daf51942e0b5e2be354a

Best regards,
-- 
Jens Axboe



