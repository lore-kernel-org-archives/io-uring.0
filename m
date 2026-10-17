Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC04B3BB133
	for <io-uring@vger.kernel.org>; Sat, 17 Oct 2026 17:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792258966; cv=none; b=O1pYpZloOMVMRozPF9Zg0A6MnOWmSS2tGWpNQPBCa8oAgsISdyzGj2KeArl7eNDhZ4LtPFVsb+jMefVj9FHCNtet7wJfEmKfgTT3ssLXkMcnsVPMQkUA/9+F7PZk28uJd3qxRW3rs/DcN7cIo0Oy+Y3Jw+U5Wh7tFBFNWu+9w9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792258966; c=relaxed/simple;
	bh=b/lwLchtB3+8tZDaht+Coeh/3wH+oEPNg88ZX6OrS84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YDC+BU8AfprlS06KUemmy7LL3domnKl0SNjZ36tzIbsll+V/q6ueXY2vuXKcCCdmai2mCu0YOWzVWTkXPs+D+HhYHIDyVJLqXt/KQEQ3jvS3XwTBmRzhtFzt/2GaNf8LOk7mnAfdWSrqO0q3ay3NP1ur+VpJrqtM3D6nfnk3xSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpNnyiEp; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpNnyiEp"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5338f65913dso10185341cf.2
        for <io-uring@vger.kernel.org>; Sat, 17 Oct 2026 10:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792258965; x=1792863765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b/lwLchtB3+8tZDaht+Coeh/3wH+oEPNg88ZX6OrS84=;
        b=EpNnyiEpcfCgN3J7gR+VxhAF896S4bQBtLvtrLJwklSmc3famuOsDCHoN5wp+PUYZt
         mqSmcUoJPGarmhD/xjcaHwOA6nJC+Ge7qYqLG1SCXd8y0ewOBJsXIrw4BgS2ebL/zxsD
         bteMk5oOG0vQ/N5AdlbTod2lLQdq7cXUzHKU1THixGbeJwGe5ifPTQFeCKY1iZBSnLis
         W9R5blxdIC4kiFnzdOh770T7OdpnM3xP8H1QbDHmk/dcbwaJPx2BfNJvo1EEu4V3ag1I
         GB/f0RHed63h0HJLlQ6CiTP30SjZlwwmUTQ4x3iW7NGruNDGpK7Ne1roP/zjGfFw3BbK
         4+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792258965; x=1792863765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b/lwLchtB3+8tZDaht+Coeh/3wH+oEPNg88ZX6OrS84=;
        b=Xyf5ZhWBAKvN03cOvBeDGceQILYOfy4ZuvWdNdnpVMZJ943TsNU1qvtZJFcyCxaOrI
         QyApZ9DXT0PwcKEFzt19CxIbMawdCVWUQHnSIo4n4AVMId7VnTEJe43I5cmSAuU4AYKg
         kafi4c8AHPrxHnGw4JJSKk+ZoRnzkN+nbjWY7oKSyF2eEp/ckW48QQ0aytAruQQWvKm9
         XPGppajBmlTQSHxdmAU7GbJ744W44+QrOG53AdsZzmFsKS4OPvRvypZD70dnJwCLtBwo
         UNiuDOKtVe/2ONOXZEbUgzsbQJeyBdrqoha1FblsFG+TYHLzkmZtRVe/uBvZVjNSAp8h
         DKpQ==
X-Gm-Message-State: AFq9FYJgJgvO46o9E4QLaLo6NGC9jw83n9H8NTQy2cDx8MsZvblX649U
	ivwAF4BvIRTzEEX+2f4GEonUeIQPaxUNS4MWY2P2svMI/x+jH2ofH2bP
X-Gm-Gg: AYBFou1b4ypy5OscW2TPFIEPtv8SANry2p/ow/i9rn0hglXqPT4YaCHdaOgpVi5bu9C
	gvRUg1P2cZ7bN+7a0B7UB7UNyPE8ds9ILhFcsInH5U3KY4hGuV1BHDIIktGy0HB88cyKr75fMBQ
	DqY1CzjFtrRa4/dV5b4CAGYS8u+1ls4u7Gu/yigipM2fUe2KYgw9aT7vLUDG/O57Tjfd+b4IZaE
	619NbynkpiIyIdZwZC9kbmwQqWKotQ3R0lJpPejUsMVwLUmO9vRPsxSWTSfvLVhvONShjKl1d+l
	lcw7XVOfQBJuCc8Eg38PtOS9bpAuBCRYQDIElACMi83nUe+Rp4gq+NxLZljR5viBl7CUHVFqewv
	TSO7KW7b9Cey45IFq29dg3KW5TxSle+33Bm4PEGlGRDzj0ogtoI6tvpkBTX0YTkAx+ULiG2l+0V
	Kj4noVuKEhK7iUQ2SYvA0W1QIJxcDd82mVrAN6I2GTZ59tWr7W14h0rOe1c3/3hJQ5B5z0
X-Received: by 2002:a05:622a:558c:b0:534:8eb0:3158 with SMTP id d75a77b69052e-53645c1e804mr45466761cf.5.1792258964648;
        Sat, 17 Oct 2026 10:42:44 -0700 (PDT)
Received: from debian.lan ([172.245.89.240])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5363c24f7b1sm37092681cf.24.2026.10.17.10.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 10:42:44 -0700 (PDT)
From: Maks Ivanov <mi9992828@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-block@vger.kernel.org
Subject: Re: Question about asynchronous blk-mq tag waiting for io_uring
Date: Sat, 17 Oct 2026 20:42:32 +0300
Message-ID: <20261017174233.456797-1-mi9992828@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261008214137.1267424-1-mi9992828@gmail.com>
References: <20261008214137.1267424-1-mi9992828@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jens,=0D
=0D
Just following up on my question below.=0D
=0D
I need to submit a preliminary bachelor's thesis topic next week, so even a=
 brief indication of whether this problem is still relevant and worth inves=
tigating would be very helpful.=0D
=0D
Thanks,=0D
Maks Ivanov=0D
