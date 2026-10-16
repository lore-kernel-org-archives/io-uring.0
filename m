Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E339A3EC6B3
	for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 09:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144726; cv=none; b=MeIzdiLOgY1YFxCongD1Ta6gT1m55bJkOlh/fk/3uCnOgti+KHbuNimJ6If9a/DyR6iNGE5qVscFZnvA1n4NibtaktDQtC+VUP12GS+rdGaKfu4wa/YK4vlS1N58zHV4/5FltLbkhvQF1D9c/X5hES+1RzMIWLlPHsHgUrHF5EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144726; c=relaxed/simple;
	bh=JUlbSNC1c5FQufY/MtplDiQAm5ICexKVO8OpJNtgLGw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B6k2XSAPmoaTtFB3tnvLjBZru1i/jH/+NR8WvyvywIDx6kOCPaYNacR82C1DGBrxYTPfejDE8tqdpNeaQt8VEfIulB804QOCIxUcQUP8AJYNnqa5mBgQL7+vGQoQutIP0HHkAFFT4tJNDvq6Vwuys14pwcg9tr5op03nPNUwgOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QP12MHXY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QP12MHXY"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49d05d51553so20147675e9.2
        for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 02:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792144723; x=1792749523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ymRDCbkPH0L/MN0wvzTktChP65Muw3EavSGPIzFh+rc=;
        b=QP12MHXY7ecoeptPyMKS6O20micJHk3FJ9k7RbLRZOgS8Gc+nFR1MG8Kehq4FKEgEy
         yO9MTAlr2NRWG3ZuPV4Im6oExbHMmXXxHeC44TmCiZde98e7YXEQzda+6Bw6PVtyyi62
         30bNSui83PAaVjAH3Nzg16A5nh4b7L7J6iikmbVl2l0kbiBdwEriVyLO68ZM6oMGFDbV
         fSsifhlhbOSxvgLGjj4VP8BPTqLeNk9JXsa/X1xdCI89UkeTyPEghhC7rIu/mMhN+Y9o
         4Iz5/AacQwKcj6Lg5MrPMuj7xTp1VQO0zXJzbxruERO7WIP3EQeM8RrD/DgssD60OIO5
         Nszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792144723; x=1792749523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ymRDCbkPH0L/MN0wvzTktChP65Muw3EavSGPIzFh+rc=;
        b=bKpMWqnWz3Ln0dE0A3JuI+0zMxV+i2jFa8r+NiePrrJ9VfgOnaSfg4ySlUaUfKoYnI
         2bBDknn7eub0SIm1Gpzh0013UpHMtNKtfXYRRpAhZOEnbqXOitlJh1BdHL/2InOJKMMu
         xUPRRtqp4KRC7fLmJTB6nk763rhvdUNwq+71juBriUsT3heQ+STy+976yHMQQggraC0z
         Z5cRRIQeWdGP0nXUhxkWr/5GXA+Be3jdnATaSVxS5Oy0hVWXakgaozPLa3tdvDfs5dbB
         Rvcouz7Uxd44vdVTS/LPPzikrJ9dRF73pFd9iTdVtajXEpc+QVT1p3K2hoHo3Mppt81E
         FneA==
X-Gm-Message-State: AFq9FYJI29oSonzVfbwq5vR9L3YDLI823YWqYPN7ev1ji5fdGm2utySr
	y9V9zinWjtiUiabc3nXArvLRoH3KOdcWzNlOSCPUfs0v4n0L48t1Rd2QUKHOOg==
X-Gm-Gg: AYBFou2IO3vzBHF414OBH44XTM3zrcHu5636viUQEiNW6ghVcXVgfT/xAvamHTHU0hj
	Ub+ijsX+vxPmLZq1Cui24F4apJgcIIgUKczd5+byczVErqR/m3lWHL8xt9JwS9xZDAZJ7uwMF/o
	a9uqDMt7bKSGCDTd2eq5vhVHTB0fA0JtQp3DcrGTPF8NhvpBlLzlHVVgeGHjpirUsJ4lVel7Soh
	0lZUbz7dwVGyeMxLf2RXrFKWqKYIiCal2RmSdkuVQHDbiZiQQtdxyt5gKjzD7Xspw2GFJAoiExy
	Mnu6BW78C1Vk+eJbcr16HbitwfHZ2Sihtzm3qOcdyUmfARJWzGas7GaSG5ufhlRVhZU2B5ly7+X
	HCOKBedIz9FO+UyRo7378TuJFQsuRPpwwnJQgFDT5kairPgXe06BznIaVETbH8OyqVEmvNyb/C0
	UZlSrgIRDEfnF/dSydtbATKADE2s3b2H4YAJ8/MXJ7jApIrT3ZUAJNqMxGsHyTXQTqmBjPuKYSh
	cfm23ZvF9Z2uwBXkWklAxbkc/ALjw61G5R+iZNRjvmU61TEYvRlEvRSleQggWlQbO1th4XRSum6
	9w==
X-Received: by 2002:a05:600c:8105:b0:4a1:714d:eed with SMTP id 5b1f17b1804b1-4a18e4841c1mr461974895e9.14.1792144723043;
        Fri, 16 Oct 2026 02:58:43 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5033a2sm4133033f8f.45.2026.10.16.02.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:58:42 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	Jens Axboe <axboe@kernel.dk>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v2 0/2] clean up dma-buf-io kerneldocs
Date: Fri, 16 Oct 2026 10:58:29 +0100
Message-ID: <cover.1792144609.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a kerneldoc for dma_buf_io_init_map() and clean up it overall.
Targeting the Jens' branch where dma-buf-io sits. If preferred, it
can all be squashed into 

0d3120db2cbe0a ("dma-buf: introduce initial file I/O infrastructure")

Pavel Begunkov (2):
  dma-buf-io: fix typos in kernel docs
  dma-buf-io: document dma_buf_io_init_map

 drivers/dma-buf/dma-buf-io.c | 32 ++++++++++++++++++++++----------
 include/linux/dma-buf-io.h   |  7 ++++---
 2 files changed, 26 insertions(+), 13 deletions(-)

-- 
2.54.0

