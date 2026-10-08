Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323A93BCD13
	for <io-uring@vger.kernel.org>; Thu,  8 Oct 2026 21:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791495836; cv=none; b=maY18eL5dcrRtzrBE9Vf3Ak5HLIoAOK6JUgDfnuvt1XhkdC1xoaVROQ3UQgvwtbzT+J0Mi0GQ+BrAin1qnH1H4IsVGN7apzFNJ7pDoLTTLfAFbMOJc3g7dY76v2BzyxYNJi4BnEZuXGR76wHJlc9+403kKxsq+ADb5bbEQ1scPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791495836; c=relaxed/simple;
	bh=rjfDai8SpMWRSvJXTYPEduLGynEZhxYgh3aoDjNLf14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H0c86tmBOuhUeBmzoM+cbCNIafKC3/A+0+v6YVD+0oPBPFZYfsbMbxHcO+dt4zNvx6UxepFjOfCWzmgrxe0a5pL1h1ECFBKZwCDXpd/sDK8u8Jo9NjEqF+k2ISoZXQxcNyydlJoHABYmAbeFyMuGen+S4suaJjrex7c9i2HY+VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMxHwNAT; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMxHwNAT"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-90ccb6102a1so34182336d6.3
        for <io-uring@vger.kernel.org>; Thu, 08 Oct 2026 14:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791495834; x=1792100634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sI8Tp1gxu2k4vbKe+if+9VifCpYJLR1GitVkoGAT3O4=;
        b=jMxHwNATWXoNff+SLe7yuHIsOHvSLZRPdJKcL+HQCvNvLDc5jTuMRb6pTGJBs9m6dJ
         oVM65p6gkfySJLVbKjk2SaewvkF2un7RzPUW5RxmA7hYJ+4FjtBfjybqViDi9U4XrMLf
         PbDzqLp1dtN5Tp9wxprS1gOiFWawPgYlpmu4SCZUBVOwShESEgighDmfKlHpHsaIFikl
         N8YuBkUJSo+4jykpyLGl64Q/EI4C5+RGjESQY+04VmdH0vtDG8810Bh6UWoSJ0kURASM
         v1+/3aM/oVZyrUN5pNNZCfyBGVnf06NQK40b5XYOCo/Ox6NNobTBT4s1V+Hjx0e6q0VJ
         3SZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791495834; x=1792100634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sI8Tp1gxu2k4vbKe+if+9VifCpYJLR1GitVkoGAT3O4=;
        b=Cb39IHEPs623kZi4CUZnD8rxOj2OR5nFDzo+n4sOGWwOZbtXxO/uPtt+hRMLDmA3WM
         Y2jmrdw7vVGd6UxoSsGztE6Ahsw3yWnthKA0eOQNisfn8LdLZaL9ybslolAnWVkWTwu5
         PC5o3Zeptzt0DRrlE3sNE8uf2/54AZhX/bS/agsCMoHyJyWbAI8pMqLekTzTWIXpbF0H
         2NOuLkdiCZtucLsNUHwMW5t8W+JEsCMa5UueRIjCcsfTiwg8eBqX1q01FGbiRlZyTRa9
         wqeXHyG+ktqIjd94/RKqF4MdR9CNtP7F9NG7yesgIfi4oysjwPs4aY8tIMT5KI7tlFpC
         KHGw==
X-Forwarded-Encrypted: i=1; AKwUvBz7LF00iZ+dcLxfUiPS8iqsOHggAPFyTFKqIqE5Whi25CXI6T9UWDMD8z85MZ4ZdoXFIuj+22HGnA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJjeBwt9OuvQl6NzgDgYT/uQQEXqNEgqdocjgA2buAEvRW3BKpm
	axvaOahzK8FJukMSOjIUYyLXa4omWHDhqEdl3oZ6tVZKoe5n+xey8+ZP
X-Gm-Gg: AYBFou2sZQSLYMkPGAUQYGp5ZpKkvywC+jBhGgRZmm9/tqiaL375qTy7OvMe27YnnnK
	3s3LNwr8KtZIKwkwqJsu8cOTAoqLbF0FeipVFy1+biN5Db3nCS0gBhKzfQRAueAfhd5Tzp5MVcQ
	Gn0AFSjQCHM/gP03NgmfAMZYs3HJ/JQ8mSQDo5YvIY+7kvXK5JGBZ6N7xgauO4ilLrfbVYk5Nw1
	JrMolARaNjfqjP3YRmDrhBkeNZjXAIBGgGRAXIUGwKeM5AopCOn1bEUNjMxObZtXOtgKQWhvdZp
	zEUwrxJKUd9lGNr4WJrU9LZjwywPWkUL5C7Sv3CY4ExrA5giPktuvD2GAI44CHq1XYDNwa9ow5o
	vhYppI4kxTNX38wmpEgOF8WujoshVT9iBX7YMf7d/EGhX0dlTfkwio0BKxOk/kHH6kNp0Cm7+iu
	luNoWWp1u58wuF8RC0dBSTXRHNB18vPsT3R72BVRelNgXghbvwoLYkbYkCIpysJ7azXLb0OBwh+
	uxBZU0=
X-Received: by 2002:a05:6214:4505:b0:917:bfa7:2598 with SMTP id 6a1803df08f44-91b55578a45mr802446d6.18.1791495834104;
        Thu, 08 Oct 2026 14:43:54 -0700 (PDT)
Received: from debian.lan ([172.245.89.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b5507646fsm903406d6.28.2026.10.08.14.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:43:53 -0700 (PDT)
From: Maks <mi9992828@gmail.com>
To: axboe@kernel.dk
Cc: Maks Ivanov <mi9992828@gmail.com>,
	io-uring@vger.kernel.org,
	linux-block@vger.kernel.org
Subject: Question about asynchronous blk-mq tag waiting for io_uring
Date: Fri,  9 Oct 2026 00:41:37 +0300
Message-ID: <20261008214137.1267424-1-mi9992828@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Maks Ivanov <mi9992828@gmail.com>=0D

Hi,=0D
=0D
I read your comment in liburing issue #1492 about callback-based retry=0D
when storage tags are exhausted:=0D
=0D
https://github.com/axboe/liburing/issues/1492#issuecomment-4696489936=0D
=0D
I'm considering this direction for my bachelor's thesis and would like=0D
to clarify its scope and design.=0D
=0D
The initial scope would be io_uring direct reads on raw block devices.=0D
For requests without explicit RWF_NOWAIT, the mechanism would register=0D
a continuation when tag allocation cannot complete immediately, then=0D
retry submission when a tag becomes available.=0D
Explicit RWF_NOWAIT requests would retain their existing=0D
behaviour when tag allocation would require waiting.=0D
=0D
Could you clarify a few points?=0D
=0D
- Is this still an open direction worth investigating?=0D
- Is there related work or an existing approach I should look at first?=0D
- Which layer should own the continuation: io_uring, the block submission=0D
  path, or blk-mq?=0D
- What lifetime and cancellation constraints would such a mechanism need=0D
  to satisfy?=0D
=0D
I would also appreciate pointers to other open problems in io_uring or=0D
the block layer that could suit a focused implementation and validation=0D
project. Existing bug reports, design discussions, or TODOs would be=0D
very helpful.=0D
=0D
Thanks,=0D
Maks Ivanov=0D
