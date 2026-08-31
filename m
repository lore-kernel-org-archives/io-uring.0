Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBC14CCDF1
	for <io-uring@vger.kernel.org>; Mon, 31 Aug 2026 23:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788217265; cv=none; b=SlaX/Sib7U0eCJ1AbaTwITpTBjYvW1HC4bIqPIpVT6xyEix5El0MjeGkmqwwPIl+I/g32p+7osedma2qoNvaJS+pKR54JL4qjpHHnlxeDOzBGzggsl2thsb+cgek196v0FowtGu4mOVLZYSjTNKiq5RspNAoXvtvA4XDPcRcJHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788217265; c=relaxed/simple;
	bh=j/XuCPHNc0H8vC7RmdFY523tV3hiM7GUvzOluDLOl30=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eaO9xzyvNZFj6w6bneU3bTIR/+/Htcr+PYhKGLGzkoeTK4+SChfDqqCBWDnmzoY0oguhZXs1dKTCDrU21t+q6oegCf8szoJ3nkAVgQxWYsva69l0VSUH62Vf0w2sgu6xqiv1+7/0gaMvFALT7Wh+BEqQ/PgxjSykXztGDhUXQGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=eVvdMTK8; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="eVvdMTK8"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7eb29ed2bbdso2503216a34.2
        for <io-uring@vger.kernel.org>; Mon, 31 Aug 2026 16:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1788217259; x=1788822059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IiFugxqazy9jmFjZjod1sAwuApShbjZ/5TY6yOy+29M=;
        b=eVvdMTK8lMo8J9bnFgHPcSAXhzRGqiET7qsICNC0+w2rgxtRR/Sj64/F/PRLSDaA4e
         kxIokcmHUp40oPMpHrASrmQQUHr4PpJabwBXLUFxJgUp84uPjqKexNTxjinAiZVM1UrA
         jMCY1L90Wv0wu9N1cLq/XwZzNIEjZzHLTb4Vk2kwSc5UqAMIUhNl6+3T7//zpXm/0bUr
         7EmPOS06nzT62/MEUjavoWKh2qA3a/JylmnUhBMsYgBP7X169VfVHh6EuXumkNVc6g31
         xoDAUrZtfpF1BO3udd744noysKjsnRYgZIClin85sbJacAmx6Jjb8SqNwbuTotLlzlhp
         LmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788217259; x=1788822059;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IiFugxqazy9jmFjZjod1sAwuApShbjZ/5TY6yOy+29M=;
        b=IGv0YK0Le2cBg/ojfj4hK2O23XwTtGQdawPHQ3AZha5qXMc5n/gb/8iY3KezxBG0fv
         BLOisYNI0XYaVujCCW8wBqld7GTsLM3aDwxUPZNHWou7ZMfE9XmT8PX6YZN2cxe8GIXo
         PCNhS5TqxXLl5t3aD002cOGK2LZWgTqIpeYoGNN8lWJ/CbpHi3QOCxsN6E59cUoekuQH
         qmwhn/CuIr2Yl3/WAVj4F8mw115uh2LMrlu1aohek3UnHq6oetLTXqfGcW8blkYPfkYm
         jaNgtGVPb4SeukACwQRvJxHzYbOD0c9egcbLi8dhe6cmKiRrJWBQa+UdPya43RwauT9e
         Kx+g==
X-Gm-Message-State: AFuF++mNiW1kXVV+2nSDXr43gEb4m2H8KETTX74FU9LuUBOeJdhbRg0w
	Uwxt5OspxiAqRY2lzlPtwmor7xNjVQJVsaXS5zf+ChPutyJ74yoGEIa6kcor4V6I/Ko=
X-Gm-Gg: AR+sD13rSODVyJ3odbSUm7v8ZEWYCQLQqtvsy1nRCgKhbRi2TdFAc0Dbw0UMQ8NC90w
	mXG9PoKE37aGQbJD6oMu31nzIusTjTEs2Le/N4pgDf8Mk7sE6j9TvhEpHU36q2DsQ7IqrQm6luu
	OcP4JZoq8M3V6xXtd0/x5hZHJaw5ZE9I8sR1wZvEbN8ce0lMAaTGqUrd7BNJ8xjl5gy/v0fCDxC
	scbFm9jKSSNIsqTWyW9BaPQrYRJmrUTMcl8jvAruXTuPoEmI4jjVcI0LUQxoEuKYKbiSWiI/EZs
	fFRH949aJ68Es3vmA9M93jMtlGogKdCNTs0TBjgAgD2rJoZrcFji4nOAQwyQUUKLOc97b3jXKrP
	B/nN+gyYNTtVqHlXymF8iCNKPpTWRdfDk6t7mQKOIK03COy2RjldqYvcGAgcNk44yN+PIHT6jyd
	3DQDhqMCzVXS6W2cG8HdlvS/zvIXcrb/VMnY0nB73l7x30FrRry/93RgX+cP2kCT0DPC/CpAzb7
	4wDK8fH/z1Z
X-Received: by 2002:a05:6830:6a94:b0:7eb:89e4:8f5c with SMTP id 46e09a7af769-7f687b9f712mr5381859a34.14.1788217258628;
        Mon, 31 Aug 2026 16:00:58 -0700 (PDT)
Received: from [127.0.0.1] ([99.196.128.151])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4fa96ce3dsm9544682a34.18.2026.08.31.16.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:00:57 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Cc: io-uring@vger.kernel.org
In-Reply-To: <20260831154426.115944-1-krisman@suse.de>
References: <20260831154426.115944-1-krisman@suse.de>
Subject: Re: [RESEND PATCH liburing 0/2] man page improvements
Message-Id: <178821725323.2314179.2949416836183205932.b4-ty@b4>
Date: Mon, 31 Aug 2026 17:00:53 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Mon, 31 Aug 2026 12:44:24 -0300, Gabriel Krisman Bertazi wrote:
> A couple fixes to documentation requested on github issues I sent a while ago.
> 
> Gabriel Krisman Bertazi (2):
>   man: Fix FUTEX_WAIT/FUTEX_WAKE explanation
>   man/io_uring_submit*.3: Point to error code documentation
> 
> man/io_uring_enter.2                       | 39 +++++++++++-----------
>  man/io_uring_submit.3                      |  7 +++-
>  man/io_uring_submit_and_get_events.3       |  7 +++-
>  man/io_uring_submit_and_wait.3             |  7 +++-
>  man/io_uring_submit_and_wait_min_timeout.3 | 11 +++---
>  man/io_uring_submit_and_wait_reg.3         |  7 ++--
>  man/io_uring_submit_and_wait_timeout.3     | 15 ++++++---
>  7 files changed, 60 insertions(+), 33 deletions(-)
> 
> [...]

Applied, thanks!

[1/2] man: Fix FUTEX_WAIT/FUTEX_WAKE explanation
      commit: 88add766c22ca9cee55e84145de29bd9d78dd685
[2/2] man/io_uring_submit*.3: Point to error code documentation
      commit: 914062b3b65644cb9deee25083bffe69d54f1e94

Best regards,
-- 
Jens Axboe



