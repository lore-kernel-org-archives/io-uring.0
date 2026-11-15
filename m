Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760559;
	b=otet3A/NPGDixZSTqIYs60XpTPTDk+Gmd3YVg3HTwTNtOQzzIOG3DmjzuKhXZN1ffNhH
	 WXlykZJM1CnV99L3IEgHWf8eJhVJkG+09UDacDB/e1RUyKix4eWh52fJ3ocRiNuqsiRaY
	 Ifs7fAR71KprWzu0FAGeY3mTHS18IqRO+bZZscjOqWT86xADeek62qbrzXOWs+xhgqa/K
	 moerExcDYd3yLMIMcC/bhn2y0uIy/Pqq4U6k2mBEIUFCT3BTPPkQy7TO7rzKVBStQuC0A
	 gBeOtUmqvHnLlTmZkxrPFEDTXebyo9T/jmeWCV7f7dh5M/P4MM/IEzm9cWQ5mriGvMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=dF4wIigZEM8rClwrr3KajflrYRJMZuf2K0t+yjrkzFY=;
	b=Bq7eVe9ZzTbuO4BUJ/rszWiIigdxgG1GwRM6qx7aupWAVrFhTNpbTNsc/wxO6tq3YDSv
	 U9g/KOvyKI2/RlVqRlRa4fAdBe/9w9p6pdaziuRJVqoCsXLKfOTbXdqP/NnYzoJ1tre0E
	 MloQrxEQBu6Ga4YW8jup3n2dpoAHMA9EJLA7V8OHF7aRmp/pFvnHeC2E4ykXR8JYBDT/C
	 k5PhXKxKauItcVqz7wKIvzvnx1ax0d+ySqJ4MGZaxj2hQB/XwWo9dIvAOC2aEOlcLOBAD
	 VI2mk2KDNvYDJw+ZVp5E0Z4guatZJ+5Rx73FREdTm4vRL0a2TAzBQz6ZgvCN9bc4bJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kNsq7Pce;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20BE606A31D
	for <io-uring@vger.kernel.org>; Sun, 15 Nov 2026 16:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E20BE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kNsq7Pce
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3791619605cso5285948eec.0
        for <io-uring@vger.kernel.org>; Sun, 15 Nov 2026 08:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794760558; x=1795365358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dF4wIigZEM8rClwrr3KajflrYRJMZuf2K0t+yjrkzFY=;
        b=kNsq7PceTQWA9KNqN8eSmwR0tZvbrP32x4vHj7FMSDvAD1FTMszpifSbDDlSFl8xBO
         otFDQWo0Nyt8cdLn7wkQnU3f6SggfS1avwaa1v34q02mcjEetcwL2oG31pbIJnlDvsaw
         WiYxxuo8qm323RTATTt+ja9psm13FRAwxdi2A3r+cI2W6+S6j3c27w9YimRixaX12KsS
         oPZoGCpM2BdyQbZ2bWUsC68pe+GfzQUsXm24bpsZ6AlKuPa+rer+/Vojdsi6OYaf03w3
         WY/0ZMB42KP0xTiHkH5s7BRjWQNO6Zo+RYNiX1oansRz7VHrVqXJjCJoTgDPwxT1GBK2
         LSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760558; x=1795365358;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dF4wIigZEM8rClwrr3KajflrYRJMZuf2K0t+yjrkzFY=;
        b=G5j4mr1DCHqiCAPgu39GAUIKANP2gg20/TpsjR3hovV5arAYO1DuCHc1XWmybD8FQN
         dK0WuG5QemHKD1UIFIaDk9LXiN3NbVpaLW8FqFH+tsKKk37bmeiuj8bmFLBsws2UePjV
         DksrODo3Ic3FjVSiJt3DFOD7CPfPMmkQZWzu1MmhXkJ3R1n6uh3ZRfif2L6RK+Nf3fvj
         4ul65gxX3pGfS1Bp+ZAd2aVfmLELcu1U6sGT0Mc5dxbLYw55+ozqY2AMV47Oz2QMH53o
         A8VHlv99ZBB85rLm6nKtBX1iCed+ZOUDoyECnjsezLP43d1Jvs/9yzU+VoQChj2NIGTG
         BifA==
X-Gm-Message-State: APuU4Z+7YqyfkpUGUv31ywmAqkieI64wqcE0PIOfZ1+W55/vGON+a9xo
	eR4qjX17gm8imWA91q2rRETHfnFLv/x5t64FsjrPHAiNUvMR6Iab3QXNnVj/4kAdIoM=
X-Gm-Gg: AYBFou2iPQhU+hPj0/tmFdkSe1/L+JS8otZu7ITWRZ7zEEyEbd9fmRGLtGP9tU/amaj
	DCjWRLBPKScPCPvldTYHkPbkAKAZP05P1Nv3Oa+NHewSvVLrvK7sD9ctbbABuQNJScSbIKgxPx9
	RWgchZDaGSZ1GYZo0Ohy1iUBT9Y5trIetPTM7wxUJnNiUbCZsHr1dx2LgcUYZKPAnWNUnUax4Kf
	2M+vF5dWQ0p+d9jgiT6hH2c35MMjy/26USZSz0WJdefVMZ64CBA0qEaAQ7FupCC1SbS1yj8LNU3
	/kDFflur0wFpryiBUyWwSfd3xM4MPlMDBkFo+aecFv6++Wa7beqqhImAJyrs0cBgqzcESAqfcdY
	x2MFFPZiEsvOtRqWroGW/rzGlQJVrpz+3FArYY2rf9fQnyO/l94fbezz41JtBspHtX7/9DspebQ
	HmvinSs46qJSghBqDJc7TUiS+siCza97H2Gb0x1Yzywc96ASAqRY0zSbdgFH+UIodi8dEVB4Alc
	euFpTksLm/psHYvSfKu3XdyXLeK8LRU7yyu0AKl65hYeOKEIUhwEbGD5L3dYhu9s2LX+vN4GweQ
	l9oAnf+VvaB5S76GNz2rGIyAqNLtUWMsmgwLp7SPcWPh6dGHd/+lyPPh1X/qjcyPd99F2Q==
X-Received: by 2002:a05:693c:4003:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-3796696128emr8308626eec.23.1794760557810;
        Sun, 15 Nov 2026 08:35:57 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379558231eesm25970303eec.12.2026.11.15.08.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:35:56 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] io_uring/timeout: multishot timeout rearms during cancel drain
Date: Sun, 15 Nov 2026 08:35:47 -0800
Message-Id: <20261115163547.225149-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jens,

I hit a corner case in io_timeout_complete(). It only shows up when
userspace sets the CQ head to a bogus value, so it may not be worth
fixing. I am reporting it in case you want the check.

io_timeout_complete() does not look at tw.cancel, unlike
io_poll_check_events(), io_req_task_submit() and the linked timeout
handler in the same file. During io_cancel_local_task_work(), a
zero-interval multishot timeout still posts a CQE and rearms its
timer, which queues new task work. The drain keeps running it until
CQE posting fails.

Normally the CQ fills up quickly and the request then completes. But
if userspace sets the CQ head to cq.tail + 0x7fffffff, posting keeps
succeeding for about 2^31 CQEs. On v7.3 with DEFER_TASKRUN and 4096
such timeouts, the ring was still not freed 5 seconds after close.

Skipping the rearm when tw.cancel is set fixes it:

  -		if (io_req_post_cqe(req, -ETIME, IORING_CQE_F_MORE)) {
  +		if (!tw.cancel &&
  +		    io_req_post_cqe(req, -ETIME, IORING_CQE_F_MORE)) {

With this change the same test frees the ring in about 300 ms, and
normal multishot timeouts behave as before. The code is unchanged in
next-20261113. I can send a patch if you want one.

Thanks,
Cheng Yongkang
