Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065734B049B
	for <io-uring@vger.kernel.org>; Sun, 16 Aug 2026 00:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786838533; cv=none; b=Z+t6N7AuRh4whiUAwq4EfDGNheJ+63gqWR7B69KipTvt25X50w3WqcCrW3d3/CAJhZiLFN9rMvdpS/I51Au0Byy/5FEUeMdf56Y1z9u2sPxWuegY/27ZE13CWnTbTJ+OaY/nSJjA9ODHh9ozf4Fee5GXc3zRwaAp4VGQHvMMpTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786838533; c=relaxed/simple;
	bh=GqUttSagT4ETj1wE3DkT68QO8u/FiAGPxorQrZjqAZQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=vGQjG4qyhGTHXVPEAex92j/QfyXQUHtfi3sOcFfAA8vf7VIi47ymZmtJxqrzTlzjmWNiVEgHLUDKvh3SQ8KO5QoB1IOKpagU+WtCUyWDX2RkCWb7VcSYdfWTs+AcfQz1G2H784nQnUQD1aHNHsVMxZJdrJRVz2/OlhP+z6KAm1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=qGQS2/D+; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="qGQS2/D+"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4a46a53abc9so1287446b6e.3
        for <io-uring@vger.kernel.org>; Sat, 15 Aug 2026 17:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1786838531; x=1787443331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yU6MEPXheXo92aZKy9P8ENbJdYjOQPQih9fC5PvmOhM=;
        b=qGQS2/D+cnQiGxrXOhHIgmqXKk8Mc/Ja0i5mC3GYd5PuaLuwGZs7zfrQUoWv3h/QAT
         pls4a9O/Ea5YeslcR+gkhWFiZBtpwd0ynDs203Az8iV00SnosxOf/fIbmP5T03giq8It
         8dNrm9zCueIiOxtggsjoARhf+A+PQCrjRKRrAmRoVfADmhRwUicPm1iy2bcfqR8amRMq
         YID5q61DGgoZIUt58KGCgRF+MySlpgKJErC6+7XGRTLE+BubQ/d7ioZTcFXaPtsvVOSJ
         Cl1Wr48BsMU+7mZSzy7gSSvyEEzlsxyhUPVidunIbPLLjCPfaNbHrhto8STpKmtEoUJp
         3Qmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786838531; x=1787443331;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yU6MEPXheXo92aZKy9P8ENbJdYjOQPQih9fC5PvmOhM=;
        b=JKDIT04YYY/WIlmmtQFqTzkIFDuQBk39gX3F3Z0Ay1VL39EclQbJoHiu+CDX1gbge5
         IizPYHo1TcguLw4WK0KxnyjFtkS3/e55rX+D5gBRIY/A03SIE8sHCkP51qfVM/UUZdqg
         /YyblmYVPQbx1Zdtb3m0eFaJlc3Dn9olRmIE3zata55IwtoR/OlgErXlPjJUY7fhlwHL
         AlYl5DPLVEyWzS0vfWmgmeGjOPRABfZ6rUaYBZYQQLn8QkcBoVq19M63IHTC+S37xI7U
         bh1panHyEnbK7FvHgGWm+aLceOrPHa1PmxRNa64pr5HZQSoGNjw87jDny2HLIO1RQege
         Cr/w==
X-Gm-Message-State: AOJu0YywztAZaPygUhcdO0dcCtlMQIe0TBuMDzZ/Ek8asVX2sAsiUdca
	AmeocNYuJiApKFzkmCuRPEiDw7IpV7CrfSOnTMvJV9b7zvTlwyb9GqDmTSlBFu8z9AD1CZBN7GH
	vMMsl35pKCg==
X-Gm-Gg: AR+sD10wOrP0Cf+2nsdZV8xKWWPlVsk+eb85xFc6j6/LQaRrcx9GazGMDMx11LCe9jF
	FCJ/KhFAYenzhfoDXdAQmz6JtKAia5OgYp5p5GrCoX0j+3pGg00JKPp2IxeBa5x5oD2r3Ijj2Sv
	++xiK4xq9tHdV+jliwzCZcOfBNCwQXRYzol7oVZ+NyXegQpaPdycO7HSnTtYrRUjVx7im6pROJu
	fgpnGspOpd4V46cXVHtYwfWnsusrGiU5kG+NVMJ0Y2aw3oMqvbIi2w88skTOnZbq+JRZwWCIBvp
	UqnrvegXCXEbt+3p0NwUOIOuAUQljmEIGq086D7DtAPK1ReqDCNaPsADuIVUuF11vXB3qwmgkeZ
	JFX613mBedCI6y066kGqh+d6Nl1CosfC4Y9AxKeT5h0Ts6st0IUAZw2fwvxC/dwI2NJcUGe+yeV
	AQY0VL5gjYmNs4jkMIauMkEQXKq39lGs2Yibh23pDwUeV1n+wy7BKkLI0JKwmVQHn/maF+B9zqF
	m5wNcZOwyhTJ5VY9uuKmWtgAQW1YTtle62UN70oKX8XEnA9jv5X
X-Received: by 2002:a05:6808:538c:b0:49b:dcb8:e2b5 with SMTP id 5614622812f47-4b241e678c6mr14731442b6e.19.1786838530882;
        Sat, 15 Aug 2026 17:02:10 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b24d92462dsm4347729b6e.5.2026.08.15.17.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 17:02:06 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Cc: io-uring@vger.kernel.org
In-Reply-To: <20260813004022.3514537-1-krisman@suse.de>
References: <20260813004022.3514537-1-krisman@suse.de>
Subject: Re: [PATCH 0/3] Continue iovec api clean up
Message-Id: <178683852578.1984298.7346721851188850884.b4-ty@b4>
Date: Sat, 15 Aug 2026 18:02:05 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 12 Aug 2026 20:40:19 -0400, Gabriel Krisman Bertazi wrote:
> I found the first patch in an old branch and took the opportunity to
> find another (i think the last) case where the same pattern of directly
> copying the iov existed.
> 
> Tested with liburing.
> 
> Gabriel Krisman Bertazi (3):
>   io_uring/rw: Drop custom iov copy in io_iov_buffer_select_prep
>   io_uring/net: Drop custom iov copy in io_msg_copy_hdr
>   io_uring/net: Drop ddir argument from io_msg_copy_hdr
> 
> [...]

Applied, thanks!

[1/3] io_uring/rw: Drop custom iov copy in io_iov_buffer_select_prep
      commit: 0ca89205857c43e02cea3ee2a342e7d3c0c8a421
[2/3] io_uring/net: Drop custom iov copy in io_msg_copy_hdr
      commit: 5ec4f12a0b01597f9a55e01618849e3a8ac46cc2
[3/3] io_uring/net: Drop ddir argument from io_msg_copy_hdr
      commit: b76d6b068e693a1bea1df9cc5af16893c39b5bd5

Best regards,
-- 
Jens Axboe



