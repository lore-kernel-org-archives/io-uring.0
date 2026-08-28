Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483613CD8CC
	for <io-uring@vger.kernel.org>; Fri, 28 Aug 2026 21:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787952510; cv=none; b=rnJWzOCB6bqyvNnSHKhwwZVSn1h4Bls2ET0K1sqyan16jwBOsgz/oDrZacUDgDY17kJDy6XBlxORjbNFcUWpM6eXyFKuDk9wke5u3JpQF9jvfOSqChSkLcxrJByETb/AhQ0ewwUC06MVuGfzB3bmwxCIiE0Wt1FOhPnPyrKnEfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787952510; c=relaxed/simple;
	bh=wwF1QrJ8qZhesTiBjZuluWkFm3OsIC+OC1LQAfo3HlA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Po0QTQt9N3jISlBc77Ax70UqO94nqFHI3gYzFfb9H49hmLg98XTnMI3NjJRbVxSNjo81gWoDbP5RJFl7KYx8Ry034XTCbHVcperzzCEsjrEJZD4pcCdRmJhXKZuu7J+iNsqi6PgHPRjPx5ULq02gyILumO6mc1+wakR/vv2mvH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=F45U8XH3; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="F45U8XH3"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7f4e6b5bd30so2023059a34.0
        for <io-uring@vger.kernel.org>; Fri, 28 Aug 2026 14:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1787952506; x=1788557306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JUcd6jIJi2fwLSrrj76EzV96ccKOdrOlXWrb/T2K1w8=;
        b=F45U8XH39ALlZtZDTI6qNc71fYkDFoM9CDqu3AJ3WzBssbdl4qsBQtaoqcsqGQawfX
         fu26TqfLkiqISXJx76sNaaks5mUTrRpai9UFBEl33we7ZbfThQvEESuTUFPA8q/Tm8vu
         ETgO2WaV4DJcuZU13PPbfyVzUXBrYUDXiTCVK/BIplAZRtcf2Cy5LHz7kLVrj4e/l91C
         MFSZ4DlUIXnYysPm5/B/S1c+6mVtWZ51UNWvjUTrcYIGj9SQDOCEEeeas9/Cm62os9WD
         AW1lgAithWk7f4ytRHaARhTvl0eXvL7RWyipwH2j/PELtT4ENKuvbsekO46L/MGbpFo7
         /mYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787952506; x=1788557306;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JUcd6jIJi2fwLSrrj76EzV96ccKOdrOlXWrb/T2K1w8=;
        b=RBvEAJx3MnW8J3HHx3EodPKSZewqnI6xArsdwH2cd3hz+/GYTzo10uNbgLN45SG/fc
         shZy2A0Ac+8mJEm0ybNkZsG+UxJmlNnaK+hIspC/ZQFIJOp435cCmkwjxr/zj/1gN3h4
         VctEmuoF1+1WgKAbwr23PiyA9xuC733J1CMXlt02O7aHpng1fus6mOnZshRaW/sJMjSK
         yZv2O0mADSjIkAv6PXenqgQiwm0FglF6IRghUTuzjGkfYY/qKwrG8zwmuiss3etHdHzK
         qJUT3v5FGxC5ZMj728ZqrK/gzOLTa9yPrzga0+F5WMYVF6OynBn2aQcX8E26922S5v7G
         KW+g==
X-Gm-Message-State: AFuF++lyUmoEt9nvMRZlefVmh/Eaoax5UTm/HNcbjNzkXpEKjHKQC7Z6
	5slKCuhgCUBkpEu+5qy4nyFn3eNJB3TemlcezdBPLbE/gzeGi5mM5J4QqBIQ7J6NCd+k5eHJHOk
	7eTck3fc=
X-Gm-Gg: AR+sD11RM04GuM+jgUcUTsHj7okGICjYapB+riwrj+f4p8A6PFWGdkrGC7K5t3tm3+u
	wn9rijwvaRI2/Ym6k2iCnqVwYRjyRdtnXseuiHREetMXd5/KyB1AIlL3XVGv2AQjubvgUEuiU5M
	qCRiidPu7Y4YJa7VwEkP+luVU4oVPVsskLJ77YtT2kzQ5vqspWAy8Te0Ih4imw0VbAoNAhMTWLN
	ZDi23CSA5dQYyJ0g3et711A0csUF269FCoucnLe4BYSln/x7XeiPATTDHxoyaqB3mrBA2BP5XKg
	NjoPKASnEcL6y3gDDWTNaMCe0frq0+SeKknyLJx+w5bpg703H+QqkCqV4ayOyHITl5MJEyWn9cc
	L3d8bd4TeMiqK4mAAaBxhRYvLA4rY/JS1BWXXe/uhotkssZEi//QCvO2bQnj4b5ntS4WGA9fd+R
	fx/HiQmQBTs7MyqFSoipKJ0XfzgeOE2ds/pgPVWC80Rp9Bm98IsvJMohzq8QHANZ/e/KmdCNtks
	ZUtdVqkHAY4hHIgDGObGqJX3yyd6IC34ElWAvo40Q==
X-Received: by 2002:a05:6820:f1aa:b0:6b1:cb99:81db with SMTP id 006d021491bc7-6b3073a8230mr2204609eaf.4.1787952505766;
        Fri, 28 Aug 2026 14:28:25 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1ce2f7004sm2762416eaf.12.2026.08.28.14.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 14:28:24 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: gabriel@krisman.be, Prateek <kprateek283@gmail.com>
Cc: io-uring@vger.kernel.org
In-Reply-To: <20260623154305.1115403-1-kprateek283@gmail.com>
References: <20260623154305.1115403-1-kprateek283@gmail.com>
Subject: Re: [PATCH v2] setup: dynamically detect default huge page size
Message-Id: <178795250472.1487722.5706318598659843685.b4-ty@b4>
Date: Fri, 28 Aug 2026 15:28:24 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 23 Jun 2026 21:13:05 +0530, Prateek wrote:
>     Replaces the hardcoded 2MB huge page size with dynamic detection by
>     parsing /proc/meminfo. This fixes no-mmap allocation failures on
>     architectures with different default huge page sizes (like ARM64
>     which often uses 512MB) or x86 systems configured for 1GB pages.
> 
>     - Safely parses /proc/meminfo without allocating memory.
>     - Adds a __uring_memcmp shim for CONFIG_NOLIBC builds, allowing
>       setup.c to use standard memcmp for the Hugepagesize: match.
>     - Drops the MAP_HUGE_2MB mmap flag to allow the kernel to correctly
>       apply the system's default huge page size.
>     - Falls back safely to 2MB if /proc/meminfo is unreadable.
> 
> [...]

Applied, thanks!

[1/1] setup: dynamically detect default huge page size
      commit: ae61c975e168d78a9d10c6d332d2f0a4839a8b71

Best regards,
-- 
Jens Axboe



