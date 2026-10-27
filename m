Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793075615;
	b=Whmk8i66UKxXK1ux4b8PpzAjPkPnN/kB2qr+mkE2RelnERjxGkBTYs8ExWPTgN07YSpU
	 hL03sSw3NBAr/fltFcKtMOUBS1pCsuvil4SBO7w8Z2vJnZQ0JFjjdq5zm52KlQ4dy6PaA
	 e+z6QUJcH3qSoWRExuD9Q82yJ8QLid8tyIbmfcJ3klIivIEWSFquvnmoDJV7bq9X0RvZH
	 3U2yGX8ydfjd2e/ksGPDtmupwW0ry7/7mUuxdKSNAoXhsx5UZBQTyYhdWRpEbF8+D0Gvd
	 uu5bddaBMr4svQBE3Kyh56eWmtd/36UzeluuQBDfMrz7Q+KgJLWRbmxyf+eq7A3dCDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793075615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dH+o3CTt+7i0neteTltn9mysqIJlLAgcAX45rIORgHI=;
	b=BIlFMRCJq81aDwM87lcbNfizmrdpsp/OJQV34E44eOdQCdiridU8LvwSf69iyaJCxOJU
	 ozAIFxdHoOn9YYpmZNo7p80aP15pzY9To9i9IAG+XCAdzo2B3C7tmEwrGne2Dyct+mnKQ
	 KaweVdLjACihWwcikTrs6A1jP3fFqyiAfSYKX27fxCyo2vY+wAua4EOm2Ks7hdCsJNczY
	 VqpRuVxX8HV7nlO72MY52Xm86Z0EOg3hWTYWx7QDxW0Turhy2PWvL+Vyb63swleNv94Ya
	 RohbCo1dJKY9QPUYThriQMt78+d5GMNBPB/Sd2ZreGWAn36PXw8MQr9tXMIxkHBI8SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jb8uNkHE;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36F8606A31B
	for <io-uring@vger.kernel.org>; Tue, 27 Oct 2026 04:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B36F8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jb8uNkHE
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so367922f8f.0
        for <io-uring@vger.kernel.org>; Mon, 26 Oct 2026 21:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793075613; x=1793680413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dH+o3CTt+7i0neteTltn9mysqIJlLAgcAX45rIORgHI=;
        b=jb8uNkHEzsy7JBkCMHrrZsHb72SwM9lGWXuRvK9DBX+c7Gp804CSL2AfBacz1bS3pv
         QqtCGSu33gJWp7IlceOAB47Selr/0m8KnXYRNOZxXT1vIakBLP/9lV2f+up6JO9bTT/P
         RLtjMjP0DL4KKIxcXXahICNHAw+fk9hQUglCb1HuhhknTaZhjJ3HqARnjoRQsS8DONd8
         BkqPh1bS2PZyZlO+biHC5GINIsQhz2e9wYEQpMNq2eTuOrcq/kGR8VQ3pOx02VoA1clR
         JG2G+7Lhm8Rc8d6n0rSJklFX+wxyVEWTsEgF0ss5MnMCRRA1nIj532c71iepff1LcQqs
         79GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793075613; x=1793680413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dH+o3CTt+7i0neteTltn9mysqIJlLAgcAX45rIORgHI=;
        b=biZ6kJzZTK6f3M2HqvIEFxyP4LEucQbgYKEU+OC1TsUxRFS0GTfwOkmb4gHS6aZETl
         jsOstmX673cP7rrkoZOf02GfqePGnvhIOMgWAf9CoQuJ1SsdjmDQSsKdGHi6Ftqyiga4
         yAm1gT5SvCSSwtONhJqXtPzqiL1bo5JlwBrZ7xEWGqxEjB9Dx36qgdIS8+eWVSNssaUR
         RMprg1jIehIohaMF2SIGnS4GtXVlvhcos2YAGy2PzgRSTY0ySjY/JmUu7r7Pyi27RII+
         MCCMYfmJSJyHK3G/rvI4GW6QP8lNeeCH26sY4fX9AJ/zXlfwB93inWvPtSGlpBPflALN
         yx0g==
X-Forwarded-Encrypted: i=1; AKwUvBzD9j+Twk9HHH3r4nVhBqcGpxdyet/iRsdf+dtSvkTs8374m84vVmb12IH1VIurCplrFmF2ykgT3g==@vger.kernel.org
X-Gm-Message-State: AFq9FYLv6ryGciZBsLpbvXuodbDtGCAwzxxtISRxPA+s18by8mZ7OKmZ
	xsgc9AwNQQtYHKYIaTmV2e0pIP8uZbPbVA9WBzkG9DUgE76iNInLbviY
X-Gm-Gg: AYBFou0NjJjviPBlhWj2ctc+hLYO3rcoNXb2nMJKPAp4cfMxkkSRlFjuwdt9JSltoxO
	HMtHdx5xQJdhgbpC/tsx/YdPxWAhUIJ4svbPIHOAZEgurQnFJo0msOzjlG+ijBNzI3vjf6ROO3s
	V23EfAonAKwlqJXysCdl3G1j17ORZaA0IpBBp+LGcaWhcEqUr0KF6UVR2ttXcPPe1hsmQV4O6tS
	RYtXB4y/Fzsm6rj2QwpUgYIggknGZQvXX7sblzXx0+EmwPRUMBJGlyfoAGWeUyhmkqlwlzdxi6G
	72pH5y+MPNgiqgQea5Sy/EZeK3KhSMQ0EDUHrkCjdnmG6Yzn1IYgCNWFdUIMtAGlZGwXQpmHBwY
	MjwR1xuf6Y6s08PAKB26eypQ9jqZQG2/aRgDFFLzLA0rFJWXtmlyd1xDFM1aZdI1LqQa0au+LEI
	ptpuv+SHOV8LiKMgix9qH5pdMFGObKRqOX2/CLJrUivSSEiJekPegjDnIxx++uUwWdgWzmtrB1d
	NTkjwlyK3UCTKOjoxpHKQ4dOdz6Oud2AwZn2R8h1HOWtz+wzwEg+FIM9lBPDEuP1Gdg9XowmLid
	KPMaHI6gEsV5frMSngbsZb4MR0AQbitwvravvQuFevSPR/qFJjikCsSlyviuk5z0FbRe32KalEZ
	2yxjf7sMowYSpzaOlev3tt4mcuGUlQvooyH4rlJ3hb5SAtkwPMJqvoD4svLBhUdO2c7TuKX1+m9
	md0kQsVc3LTQ==
X-Received: by 2002:a05:6000:4008:b0:48a:fe00:ad1 with SMTP id ffacd0b85a97d-48e55a0afa3mr3439452f8f.6.1793075612981;
        Mon, 26 Oct 2026 21:33:32 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2ac-9b01-6900-1f92-d182-4435.310.pool.telefonica.de. [2a02:3100:b2ac:9b01:6900:1f92:d182:4435])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecde7easm20594253f8f.52.2026.10.26.21.33.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 21:33:32 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	io-uring@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [REGRESSION] io_uring: requests can overtake consecutive drains
Date: Tue, 27 Oct 2026 05:33:23 +0100
Message-Id: <20261027043323.98916-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit ecb6817b769f ("io_uring: end the drain when the drain request
completes") lets a request submitted after one drain overtake a second
drain that is still running. This breaks IOSQE_IO_DRAIN ordering for
both standalone and linked drains.

An LLM helped with the review and reproducer.

#regzbot introduced: ecb6817b769fd7d71af2c9f446188649020b2e53

Last good: v7.3, c03c1a14507dfaf8b856c2608f9ac216021fc222
Tested bad: d135ab453a7400a34930bdda1ef4bdc8acfac80e
            (master as of 2026-10-27)

The reproducer uses a default ring and two empty pipes:

  1. Submit P0, a poll on the first pipe.
  2. Submit D1, a drain NOP.
  3. Submit D2, a drain poll on the second pipe.
  4. Wake P0 and wait for D1's CQE.
  5. Submit an ordinary NOP while D2 remains blocked.

The NOP should remain behind D2. Instead, its CQE appears before the
second pipe is woken. The same failure occurs when D2 is linked to a NOP.
An ordinary non-drain poll control still allows the NOP to overtake, as
expected.

Tested with QEMU 11.0.2, arm64 virt/cortex-a57, two vCPUs,
CONFIG_IO_URING=y, and CONFIG_PREEMPT=y:

  v7.3: standalone and linked NOPs stayed blocked for 250 ms
  d135ab453a74: standalone and linked NOPs completed before D2 was woken

No privilege, special device, SQPOLL, or unusual setup flag is required.

Regards,
Karl
