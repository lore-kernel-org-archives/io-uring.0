Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E65402BAA
	for <io-uring@vger.kernel.org>; Thu, 19 Mar 2026 21:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773955398; cv=none; b=OydJ2dEQs1T3UEhfucpGVaD41WJjeZ+VNF51/MfjqN8w7BPOfMfrNSm+Z6v5qETp5P64WK/XRiSEMDrweZVOWGkIRBGIPVxp41myWlxlmT/MC6LpVycogi+1HEYTYYrNUxs0gOlYYT0sBZwxeGGkgiNOrNu42PwRgoNuY5Mu9m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773955398; c=relaxed/simple;
	bh=2wrPVeTnIFyri2FKWKG8gaYb7aoCscodJonP0DqtwBs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=McvOnfQiu0/tQmPoANKONMOdm5YlyNcdNB3OmsYWEZN/yjDYCO7VOHfHZR6LlUipRboFzEglubkBUFVOYNup/ebGnWYHxHXVaFDV65zMuBCcWMu5qt6nltPHMQMeyQW2In91hfs5TUeEc4La/hzmGHDdwjKqugOpjpbi+cgZ9bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=uiav4FWE; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="uiav4FWE"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-40ee9b945d5so1008225fac.0
        for <io-uring@vger.kernel.org>; Thu, 19 Mar 2026 14:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1773955394; x=1774560194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BZ7DwngWA95gIiWuZJKiHVQcOZCPKJdl7PWZiZecc58=;
        b=uiav4FWESvTdmHkvHjH1+G3bMzJw5erofhctcjM7Xo8qCB/BKKN9tdh0HZHkMwwC+I
         QpKy4K6NuY1QbVKHOtCLnn7nNSP/2WOM3cVJ2H1fViCno4jzHPfs307pGzFTJg5oT4nQ
         yfw3+x2Vf7LRMaDj9t7jRS7DSsNsx/gib1sRuujANvFvFyFVgiUpHgLXKh7NTMswYkHQ
         AKrM4PgEkjFIRrvQPomlJ9752unpDiNXkDFFrb4IjHOpKu/YTl0V72Oq9M3F6IWahjPt
         Q5OECCC5DGJaWh/qVPwa+pzvMS5D9PeQ/hY6LD567atbaGc6VpGv2Vvvt8+bfYmWYhdZ
         4lkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773955394; x=1774560194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZ7DwngWA95gIiWuZJKiHVQcOZCPKJdl7PWZiZecc58=;
        b=Yr9Azr760WxXFxbbbXEKaXHuJ3F1xvrAWh1oTJKRyVL0ethF7yu4oSMD38o4iGyrCb
         rlbuqXvt7RypoGpzxDBqIlBmsNrtwv5/Cb794TyUcti4jMEKkaDn421Nya6OVvb2pLGL
         +EQtS+FFPCZxcqM5j6Jv+jj5v3aOSubSoSOmwoV7K8a8gfLoQHz7OPYdlpE0NFh2EG3z
         K+APMxZYqdaOMFFLrcVInort9Js7vb5j5TwCKHMSu5Ir7rj47UoQYO7mjEroHWOGYNtA
         Tdv2rTY570kfkv+rIOE3sYeXURa/pmV3AolLes1vNv/p3FxjMrzgTz9o0rqphUIMJ195
         U98Q==
X-Gm-Message-State: AOJu0Yxp8WhVPF8UNPrSAWGsQYqyn6RbKVMI9A/QtyFSs9Uy5nRFhZeu
	v/1k4Wq9oJ7UWW3Ch8dTplmKBa+dqQPAWDc3cKZDAoLQxOcSFTV1JO2KPXPAMlYzGl1WsBRCsY2
	1Giq+4hg=
X-Gm-Gg: ATEYQzyvr2QtuB6j8f55KyVkK1zgtBEcZswLfvs7HCOVCSevW2Okb5rRtR+iLxi+EjG
	NXtFbbVVQrdGQdBmNVBmY6KPsBvV0aOcaV7kqqTgGyJv+bATr4gou3SeeGkneQxJ5K/L8g7Z4ZF
	zz6LWL8Fs6p2BFqfn+G7B0+swZGdL9KDnO1SqhzwS3ComIvGUPoKsGTTrL37iAYFS40NGo+RIuG
	es2sidmN5fiPeFSRdJCAj5i8kstztihuEGYRZExTjAihreLX5/lUzW/GOuiU42rwfHjGtwnMeCr
	nk1Vi6mSapGRU97EI7BlFKDZubEf4zXW7bOfIzGigRDMC8hpjc9LrSCFa6BZi96VUXaMUquIBox
	xrwoMiMe0NE7NlRty8zmvxbDJF2ZRyRI1yOgLqto8FKziOdiEGpnwEQCDdSViozmu5KKrEjvhwy
	5CxqTvoxGUy510Y/6O2c+U+EjMB3xyH5amn3HsSCCsdKCXLwvBIcNcRIlTaf8QxRU6HRY=
X-Received: by 2002:a05:6870:71d5:b0:41c:d38:f3b0 with SMTP id 586e51a60fabf-41c1121d514mr512788fac.42.1773955393945;
        Thu, 19 Mar 2026 14:23:13 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41c148a5ca4sm186363fac.3.2026.03.19.14.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 14:23:12 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: code@mgjm.de
Subject: [PATCHSET 0/2] Incrementally consumed buffer fixes
Date: Thu, 19 Mar 2026 15:21:34 -0600
Message-ID: <20260319212309.284152-1-axboe@kernel.dk>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Michael reported two separate issues with incrementally consumed
buffers:

1) In case of EOF, or just a 0-byte read in general, BUF_MORE isn't
   set. As further completions will happen from the given buffer,
   it should be set.

2) For non-pollable files, the buffers are consumed upfront, yet
   BUF_MORE is lost as the commit doesn't happen at completion time.

Fix both of these.

-- 
Jens Axboe

