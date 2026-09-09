Received: from mail-oo2-f17.google.com (mail-oo2-f17.google.com [74.125.231.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E57576EC3
	for <io-uring@vger.kernel.org>; Wed,  9 Sep 2026 14:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963018; cv=none; b=JsmiIaI58Ct04oUK5J9tyKuoRxEQJQ/GS2YrZNFaCj/7R5oG5yRwcpu+Dboqn0vIHahMytXATE3xD3CwEJ9jEpP3WJKAVCySRbj0wkAlVx3CcWGuo3rqT9XIqX1dfFJk20/7NVeKN1RE4+lxRuGoYU+Zyk312gci5+/hutNVxvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963018; c=relaxed/simple;
	bh=K+fP/mVlreci5c1nIQkXUbr+Ynoxk/b+C3cirpm035M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kHamR5jZ2EWeyeQkGAA59JNSmd+cUdj1/Zefu9eoeUA4DOftAfBO7bOnPAgXMwGZmh0xQONBFCHya8UzBCz2zjzLmmD4K40ueDKdZQ8+0de4cymXHzb55EbUrUBdFKdyHY4YsD/+xO8texAENnEU8i75+Za8jU1uqusdyuDj8eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=Tn2HUWbX; arc=none smtp.client-ip=74.125.231.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="Tn2HUWbX"
Received: by mail-oo2-f17.google.com with SMTP id 006d021491bc7-6b1ae739df3so506920eaf.0
        for <io-uring@vger.kernel.org>; Wed, 09 Sep 2026 07:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1788963014; x=1789567814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gz/JfRmbwNrpoq/lEvOhEUyT9co4LRecP8cMwsTAD1A=;
        b=Tn2HUWbXdq9YOcy3PgPLVEoKY+Z9bB4SjU9qfB9ZmFNuFs20sER9mtOzuJBNjHZTZ9
         SrP+A0iyeH1vKRXEL/0v6BnUAaPUlhee5k6kwKiV6dur64yzSSnKjIhZHdUipyYnYEc+
         CO+27gp3CVSYqkfXS5q3vSa/t4iDZdkOIvzzl2PFg751ZACsViGXBV3LKyBA4dat8yUt
         RAw+0hbHNl3MR5ZblEFx/f28VgITW1LLp8gL+BirHet2R3mU7PNqveuU55KaODbvMzXE
         ZigjIog3v8Fb1nRZbJunHzwJpoVxG+ZmQ1LuMCDZVqPCtJUG+07OmSnDDHupIIN0Bmlc
         qM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963014; x=1789567814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gz/JfRmbwNrpoq/lEvOhEUyT9co4LRecP8cMwsTAD1A=;
        b=FPiFWpE4iehujzr443kJoNUOd+YoUNypPNeWbfMvMLLGJ46/Oif2G1tSjDKgP9jUZo
         xC9jofa39PAZWJIp8iKgukc/0+4nbBl4GglVuDm3QGTWluF3aLymuIyIsyQ2TfyUpu+N
         ryglxk0eBN782GiVkY4bu/8A2NNA82KGkWVcJsn8pC9/nEitSAJaexo1cb7F98cfyawm
         y54208RxzBJo8hM6cSqtajZXZYGwOneZ45mICy6zxrNhANG0ZaogQTFIWgkQSMfxSR/l
         23btR6wgX67N9syp9r0zWyyFzof8NUT3gtFDP3n4j3uMs+a05v6MdhXMC7BSZwtyv24C
         1fOw==
X-Gm-Message-State: AFuF++lIX+rtkb5ojbtVafVIQCT33tTxl7IEN254HLS6NRgrrFJQ/GAI
	bzncsntWlJGzBxpXhJlo7FoVY4ftJReQn3Y+zXib7ajmoJNPxEL5bKHmkPZSQqgezFLGSBeiTGx
	tho4Vbgs=
X-Gm-Gg: AYBFou2d5m5Giqp8Wew5dP8VwkAmOG7gV6moR0C31s6Of9kNUF3kK/7Ojv79SDpDxYT
	19ceJ7qGoeSj05IoEiPSFxFYqBtnF1TTyHrig0HtaVpWy1jeHBQcjcVINmrXWrzpe5wkRPHrfzm
	KpoEOnm0SdU3Pl8sGnBczIv/nUPMI3JtwHAgd++c4nS2xkm4z+Oj/xWydeX22cSv+Au7vTlTtsU
	GAbVr27eTtbY/ra5kCk5Csa3k8Zltu3mCCiaYoyL9g5EVxc1LaydudxJq8VXEgGZiBwMXtS7MXH
	dSxT1IbcsU8h3tCXGp8uk6I2mGj337MHU1LEBFn+lAEgKOnTybrC1+anzPrYPkmmxzW0NapFtqD
	PIK6ZePuEFhvNU/+N4pBlej68FOHLTADYPtk3x4+W+SxNU9JEfeb1VU5VqKmkMurAh2RmW5ghkl
	+Cwbo0Qj//akR7KRaHT574rKd19f8dvNUhBpKGaecdA1aXuk19mIU6cTkShtmhMSNORDWvmUlSr
	sCRdd2CJdoo7+fWTs2TpwN2tEEfKS61NQSczrQWfg8WktnIHaWgCNQ1
X-Received: by 2002:a05:6820:1890:b0:6b5:ec3f:497e with SMTP id 006d021491bc7-6bc26e56788mr4379936eaf.25.1788963014555;
        Wed, 09 Sep 2026 07:10:14 -0700 (PDT)
Received: from m2max ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47a7585b25esm5406514fac.11.2026.09.09.07.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:10:12 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: juanlu@fastmail.com
Subject: [PATCHSET] Cancel requests at ring close time
Date: Wed,  9 Sep 2026 08:06:10 -0600
Message-ID: <20260909141010.21064-1-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

As it stands, io_uring cancels requests in an async fashion when the
ring fd is closed. This can cause some application confusion, if the
application expects files to be fully closed by the time close(2) of the
ring fd returns. We've had reports before where someone doing IO to
/mnt/file, closes the ring and then attempts a umount, and gets -EBUSY
on the umount. Or more recently from the TigerBeetle folks, where their
shutdown is a backend kill, and that still ends up with file locks being
active until the background cancelations have been run.

This series attempts to make that more predictable, by canceling
everything sync, upfront, when the ring fd is closed.

Series can also be found here:

https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git/log/?h=io_uring-exit-cancel.4

 include/linux/io_uring_types.h |   2 +
 io_uring/cancel.c              |  89 +++++++++++++---
 io_uring/cancel.h              |  13 ++-
 io_uring/io_uring.c            | 180 ++++++++++++++++++++++++++-------
 io_uring/notif.c               |   2 +
 io_uring/timeout.c             |  18 ++++
 io_uring/timeout.h             |   2 +
 io_uring/uring_cmd.c           |   4 +-
 io_uring/uring_cmd.h           |   2 +-
 9 files changed, 260 insertions(+), 52 deletions(-)

-- 
Jens Axboe

