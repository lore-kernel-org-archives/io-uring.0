Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793075733;
	b=j6tDEfPQWDzj5WPSyPk4Cjl87hqs/VFEI+rUoA+iGxvyAvGuoj5RAVlMvIYQdfND3xtT
	 NhqnE5mPLIq2X88tRyR+kvFpWL28MRW/+y7VFs5+ZczVMG/Ce6xjK9lEaBVfo8UtrbXgy
	 z8DRpXBGGJCqr2b0UYHgkcTVfynwgQhvqDvDtuYz6qlgIspyuUpoBwi+Y4mAZgBpJtL2z
	 ElPQ1mc2yq4FUDJP5yFGUPfOGNqjXfy5COoq02A0hMJ+Tn3lopa05gVPWiYT8BDe59qzx
	 ztByzWycF4qcuQB1mY4d0hXOu6AAhsRk3IAmeqCAlRODdrBY2oKEWBoootj25qbYatg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793075733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lvPUnqN8PL1OAu56QIuIdIBU70pIUAL/ta7uRi0Zh7A=;
	b=3DmaliFrpbv9vmZC/uSNBc5qHm4Z377zHC23KaBeHXtjY1ykoaO73njQAv9VaZFpXJ11
	 AGfjPhxgM1fTemBFaZeweE+s9lEzlqZUZUPOWzpd4p9MzHGyPSPR70jMVzd1S625gkQsX
	 4gF+nAxYp4kA+tB9YYvhuNtoU7rmONYf4RgjKGoXfOJtFxfFWkVRZb1vfjFq/3p35y+Fw
	 1HNe0TJB18sr4DBAh82W0KDoIbID3pJkKqKtjM1PGtJWYOHeU4sBwdv+3QSyU6bkgZDgJ
	 5MnkhMdKkzoi+HqE8h5nWdDV8Vt4oMCv37rS8HXa2aAVi1M56oZTthCH/WyxFLPlm0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UPYhloo7;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CE1606A31E
	for <io-uring@vger.kernel.org>; Tue, 27 Oct 2026 04:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44CE1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UPYhloo7
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so20086785e9.2
        for <io-uring@vger.kernel.org>; Mon, 26 Oct 2026 21:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793075731; x=1793680531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lvPUnqN8PL1OAu56QIuIdIBU70pIUAL/ta7uRi0Zh7A=;
        b=UPYhloo7tHG4yZGHxqzd+x+NKrxSO+DSvv+Bm8VcwLxU9FRWaGJZJieK1GNVo+FxCa
         FTpi9gVYw+ZVi2M1q6BSPNxQ655nZIYeIZSTwRVvDsZhnu5x/6whUAIma9SW6XsXUEyt
         5i0h5/sREW2SMBMS3jfwj3kb8Hoij8ghjMNedezW2bNUbfAmMVTKSwVi/PcrR3IyBsVU
         nvd2wHpk/gAvW0/TsqcVDZRdK8GWHE8eKFmfiwdcgEx0kU8i69veEZ/ScUbqxwemvCVy
         spGqVA8dILNTpaY+A1SiCRGmtB7E2IMGtxWJdXbD7DfY4s/UvO6FlThz92F0uDAXGUVP
         o0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793075731; x=1793680531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lvPUnqN8PL1OAu56QIuIdIBU70pIUAL/ta7uRi0Zh7A=;
        b=ok0KoEs4yWNYHnZdZSqpGfSeIzTl4DHpHNdOqiuPdOCIRvxeE4NivFqIWznKA8ykGC
         nh+6SBkEQlvWBxi5UazO3FnP9AVTgIgMf52YrVu2HSO4hCGxWssVJVUCIlwb7s5yJBl8
         ssrt+ScDZCus4ZsM0nKilYGm7d7jOwO/2V/SDIwH6Wh2QQjD+Y8WG3xFXbqfctG00KRH
         0gAwRzZKlVpdz7VfiDhW5dt44fxjK9pcq8YPLq73ZGf+dw4Nv9qVIJ4fyOKsM+Zfxl2k
         LkW4rg/MzSdIsZuqQK28vtKjYL440IK+zEtqJ6iyrdLnlNFM6SLFG1T3NGivHSlaYwLp
         f6EA==
X-Forwarded-Encrypted: i=1; AKwUvBz79u0x5vcaFyh5hc8Li6dBR31+Dn++j3aQ4qxK5ZISB+aqWPyO6TxYPic0UDu0cx9YZ+LgALo93w==@vger.kernel.org
X-Gm-Message-State: AFq9FYKdWl/8VX/ZHfdCrjrBk4yY6u6XkJpfD3G3+j5oAHqbaKRq3/1H
	/mZchbjQziHEuTMahfe6f/wNs5uS4mB3O4A4FKGbw0ewyFDr6/hJwHtYasNr5Jqt8C8=
X-Gm-Gg: AYBFou1HxEj+buseRt09fWLZ8mDWPrYZKgG+DSS600jCKrW8PxyJ/qRaO37yYir4F1P
	qI+J5O3Y7yiSf7H6thOfp76fra0JwaAdtShGhwV2ekf48suahJk4gnX9zRKCKdz3b6+K5xpVDDr
	p1KJ4+X2MNLhKdirDc/wKwS7q/ItXSO6y7pQFyKqQBDGb5p/Cp5ZhO4JP1PEuCEigi5zze4QBeJ
	/3zKFL0deUf62HAncdySJl7UZMlIyz2AxrzDiIKuPcb0HQBlLCX/viwpWDjKt1Q6eeeiUV9dGLe
	P58G8aRMkQFMavJhPGRRnUsBQMzUoipsLCE257Mdyzfitk48B9jYRfHf8CJhtI4MXxEhQWbOUGW
	GtigeGy/eyaN/8d0woW/sM80FV5V9ZFWAxcyjrqqTQVbmas0fy/IqXuqi4YMR9Y1wLTBB1/rmRk
	1wAtMnOLv5P9oXBeGq8ORyYpE/SW9RyyqLmZ1IyO9M9ZLzEQMVh9hO4tqQroE7meSHjUBdAk4Xf
	3Eq8kZ72UiltRq7n3B10G+r0wsJBTLJAmj9ug80AwVCu3mPLCH73wO8y+6KcAr3k6UBcGk9o7sz
	tdXYiUaaiaCSS3BVTp+7AYs0ko11OeP3A8FMk/Lsg2qAjpF1w66NlonD2ns6QbX2zsna/0+nH/L
	Wc+MqWA7TRlo2cWJKvOt9dFyyXEjUFObJ9nkI7XVoPxxRMzDncPFEo/n18QYk75mwkyr+Wx8hFc
	y1obC03RFyDw==
X-Received: by 2002:a05:600c:5307:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4a35acc41a6mr147390645e9.35.1793075731463;
        Mon, 26 Oct 2026 21:35:31 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2ac-9b01-6900-1f92-d182-4435.310.pool.telefonica.de. [2a02:3100:b2ac:9b01:6900:1f92:d182:4435])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a55e99fsm246720855e9.4.2026.10.26.21.35.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 21:35:31 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	io-uring@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [REGRESSION] io_uring: final close can hang on a stopped submitter
Date: Tue, 27 Oct 2026 05:35:21 +0100
Message-Id: <20261027043521.99446-1-kmehltretter@gmail.com>
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

Commit 13d3783a55b7 ("io_uring: wait for in-flight requests on ring
release") can make the final close of a shared ring wait for task_work
owned by a stopped submitter. The close does not return until that task
resumes.

An LLM helped with the review and reproducer.

#regzbot introduced: 13d3783a55b758a9fa05b67835afa7e216476c61

Last good: v7.3, c03c1a14507dfaf8b856c2608f9ac216021fc222
Tested bad: d135ab453a7400a34930bdda1ef4bdc8acfac80e
            (master as of 2026-10-27)

The reproducer uses a default ring and three processes:

  1. Submitter B creates the ring and submits POLL_ADD on an empty pipe.
  2. B forks closer A. A inherits the ring fd but starts without an
     io_uring task context.
  3. A unmaps the ring but keeps its fd. B drops its fd and mappings,
     then stops itself with SIGSTOP.
  4. After confirming that B is stopped, controller P tells A to close
     the final ring fd.
  5. P resumes B after two seconds so the test can finish.

B keeps both pipe ends open and remains alive until close returns. This
excludes pipe HUP and process exit as completion sources.

Tested with QEMU 11.0.2, arm64 virt/cortex-a57, two vCPUs,
CONFIG_IO_URING=y, and CONFIG_PREEMPT=y:

  v7.3: close returned in 0 ms
  d135ab453a74: close returned after 2005 ms, immediately after B resumed

Regards,
Karl
