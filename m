Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883763;
	b=ErGAbkQ6FlEztBacilrV7FgUGhYMIcqyfn3z9MX3/vA1GKu0eBCYCIOS1pB0DC7aah8f
	 ZTQPmzCWPv4GW3rc+2PJew+VWt/pYF/dwq7WP7ZTp02KW/uTUyI0UeKFTPM8pWCXKiDrF
	 375NxLS+RjG8GwDhNE6egvYxQoxVxIYZGL/h8Bl3DHIvVeJ7gi3mU85QC7LABDyDNjZTT
	 6ZTA3y94Nz1ssfBsNKb6zLuwGcDryzh9bY3hxmcGeFrkRyR+K0it8101gvqyvLuKGl8e6
	 ATQ+efO5W2g4G+lRKxleLoRlf1lkFir3RQyZ0KSBsx1ixqlQVJ4y5scfEHQEj4OdbDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=Ey9PCEftuBoU8x0pc+FrBSPfEFBtgOJpL5SMzZRoz74=;
	b=MWHymP6RvlprZUuResOALU2k9G0ZRr1285MiCnUGXv7Ew4350ljw6PAJgYsatEaDaHBF
	 enSmxNbGGug9O7zDIRyU89SqOFXYDtRiYAsj5p9zZiJIAm2x2lGAou6DsjgUKcfbhn5dZ
	 yxe2jsQEJyBuUK+aoIX7ny4PRA1TXVxDqKaB+YOCAi8NRiGeejWaJEWi1vIc9nrlKB7YO
	 It8TCnQ+LDl5ZZenVKT0a3R0cKllBbxVBy9YZlFEQL5GbOZMpNFzKCU3xrcXLsHIcQvSt
	 oOTx2GRHK+To/dutRXJa2/4tWZidZVf+Nfd8/SWIvSPDiZxS9wmKcN+4uZgUqK2XqUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=s9+DVmII;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8564B606A334
	for <io-uring@vger.kernel.org>; Tue, 17 Nov 2026 02:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8564B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=s9+DVmII
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-14394530ec6so5263362c88.1
        for <io-uring@vger.kernel.org>; Mon, 16 Nov 2026 18:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794883763; x=1795488563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ey9PCEftuBoU8x0pc+FrBSPfEFBtgOJpL5SMzZRoz74=;
        b=s9+DVmIIWCDG9HeHzsECghSBUVXfmm7UNmxjemVVWdirrUdGtTMMOMGBYW8flo33i8
         P6zybL2nARNkx5SFm3d9onXu6Vm+EX5SQscUJF1L8qbDCLUJaEubK9vpHWlHpSSFuRjn
         F5U0tR8FlqgPz3gqNBdgajYHUYqdpV4QGFiuguLcftD/cr7HfBMzTB+vpi0CE0yPKgzv
         WI1/2U6uoUSWP9lfm0PSov7bNp3eDK1TC33lZYisUlmPHgAANF/TC12ZfUSrHJt9GQ+a
         JQi94m15ju8NBRckN3emDUzgkiPixG2l8ZjHWS3iiHBeec6yAX4FfJed/UkE1nigf2SL
         R+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883763; x=1795488563;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ey9PCEftuBoU8x0pc+FrBSPfEFBtgOJpL5SMzZRoz74=;
        b=ZaXlIzOt7v7UQLFhDs3xWuP/Ra650FVmQm49lG6NpZLdsSMWtZWatHtLoIYVQyrWtO
         TmM7WLiLmbPfllxtOY1y7l9iVS00laB8k7WUmmqmz0u8IgjHoJxDfOOUqH47fyefx+1o
         9IXrWWz/+AX3rJW15ezDVZcbw8ugEf9e4HVTrKOzDd0DT+CnAid1oRh7AvhtMQSP+xYb
         Wab093lkHhS/gddYyI6o3v1zmzk8Wzb/I3t/YIiCMflU1midYfWOOP6lDSzgstQVV7q1
         uwArziW76vFkyBDMRXrc0KDrvINfTmXgetSj6be57rJgnveqyq6L6xpyCurwlr2ewZGL
         awQA==
X-Forwarded-Encrypted: i=1; AL+hErHtMSi6IYTwpdrb64wMCyH1JgZvXherZNN3KV2Qjd4GDlcjuUO12tmJEb/X9DiLbRe+vxd2eBxVNg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ncYrUBZzLp73v/JnemL+wkma38216WT1qs1noenbcBUgK1Qxu
	/McNUriRf4o/V7GgD4ku1jo6sXp2+/zj9NT2IRUA38ZllZrCA/jyxwB6tqPvchl852KEto/JT0R
	y7eLRERA=
X-Gm-Gg: AYBFou3iCaCE7SwaP5N0Xamk1L0x1+ecPdhWTrTRtII1mdWbhfEL2Vv6V8W+2sPpLKC
	FvkbXgwHVHT4ixT+rxQD4LWf6bGFd9OFLb5JQCTYy1E5xlVpIm1MegyIkehTGySMEVcUgRObpyh
	nfpcWjpZ2F0JyeAeSqGI3K0dJjgZCYsyzQJA0AfsQRZaTunXkH/JtTSzVnP39BXmXtCvzNGkYW0
	9U6sFFs8OHHWbGEf5gNtE/WvZjDbGbqW1+JyyQ2OTkiPL240Wks9JpHGSBGLyiUUeTh4BUlSCK1
	kBSdu6LFl4ADopOOp3sJDNfzTkjTkxZlsGzXkqmfJMlG1EQtcuoM1sRusLVza/NXreHil8e7Uym
	oFP0ASv+1JM0vhh9adebDFRbEUuUtlC+kvXvcyy4VXNbknu1fgrGIMgkxokyBM4i4Zyruf8CBun
	yrHqCK6rv1EDfCA28t/z46fIOR0nsNAsg/66o31Y8xB9RZa25PBdZsMM65FwXZmcQQzbnMz2G1u
	0UC7wGGJlrCrdVU2Mhr54Y9hdSCOGeEFCh51XC4jjIG11Vd3KVdNc5V8iEG1BWM03I0MPiEkU1i
	s/JXXdHkFCXQj793FlZdxhgM5SOjAvzjOhmSRXnVftU1zJX0MEaelnSjiAYDB5peU9BBharwwiR
	yQcmnxQRMr2GG
X-Received: by 2002:a05:701b:4591:10b0:1b5:281e:173d with SMTP id a92af1059eb24-1b5281e1db5mr5188825c88.46.1794883762621;
        Mon, 16 Nov 2026 18:49:22 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b2b5sm31493244c88.1.2026.11.16.18.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:49:22 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Cheng Yongkang <teel4res@gmail.com>
Cc: Jeff Moyer <jmoyer@redhat.com>, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261116044531.281978-1-teel4res@gmail.com>
References: <20261116044531.281978-1-teel4res@gmail.com>
Subject: Re: [PATCH] io_uring/rsrc: keep the old file when a file update
 fails
Message-Id: <179488376197.22588.6516413641440014375.b4-ty@b4>
Date: Mon, 16 Nov 2026 19:49:21 -0700
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


On Sun, 15 Nov 2026 20:45:31 -0800, Cheng Yongkang wrote:
> __io_sqe_files_update() resets the slot before it calls fget() on the
> new fd. If fget() fails, the fd is an io_uring file, or the node
> allocation fails, the update stops and reports that entry as not done,
> but the old file has already been removed. Later requests that use the
> slot fail with -EBADF, and if the old file was registered with a tag,
> its tag CQE is posted as if it had been removed on purpose.
> 
> [...]

Applied, thanks!

[1/1] io_uring/rsrc: keep the old file when a file update fails
      (no commit info)

Best regards,
-- 
Jens Axboe



