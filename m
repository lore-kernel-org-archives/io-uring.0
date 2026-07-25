Received: from mail-yx2-f2.google.com (mail-yx2-f2.google.com [74.125.224.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F452EEE8C
	for <io-uring@vger.kernel.org>; Sat, 25 Jul 2026 10:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784977037; cv=none; b=q6bdzpXjzDKkRgKiHnm9lR20KetsoF9Js8xJh+byXwR5wPIspolmCVwQeOszn7tbpX9R9iwZJQhikrQ/MjK/FuB5/hFrDM7nsPkYO8VcQpgyCauq5e33Ry4Fy254nhyMmiwzIReLmjrytdrS8ROow4KWXzfZXaDkq+hc7mwccB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784977037; c=relaxed/simple;
	bh=opocQP8/75Tnr6acLHAcO+HFzRI8+w2EfwgcW+DE3gk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=swDudEGsePBMsQo7HDO2fw+J3QnS2FwLoFpE/m2FCmq59PhSfx+ZYEYa+uTKNjUI70Hi0a7uWtygY2Z3Jsz1zeSYtaSUWLBqaMYMh7hMZqL4KU8B0GtNZ6x96ds/eJ/xyLcm/YLuDFb7ASPurEclp1qH9JKC3rAQi+/ZSHgDyNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=FoWc1t7d; arc=none smtp.client-ip=74.125.224.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="FoWc1t7d"
Received: by mail-yx2-f2.google.com with SMTP id 00721157ae682-81c31ee9700so2691707b3.1
        for <io-uring@vger.kernel.org>; Sat, 25 Jul 2026 03:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1784977033; x=1785581833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n3M5piIMo6U18b7y0I/vtDAh/xfSo5garlAfV2kj4EE=;
        b=FoWc1t7dqzfi69OQuSyZfMHaMU0mJdlImTuQH+w1lyfzFg8N6upnQRCaaYsDbEq+OO
         vEGYVva1Ey7RfPzaRB55CtElHVg+hWrQPn54tLyV71SbHXpn89ynVIk8eCQBQy81rZbP
         lRl/+hy8T1PVmK8CGH8KhD2HEnNcyJRgY1HiR0a2TSGcBcVR5JtqFUSuVZRY5e72e8hH
         ip18Yw90L8aifaEjEhs8BoPtq3QJYFzlXB6tpPG2I5meP2r0huiIK/Jx350rz3eAcsmk
         m9RX26tXE8srFDIUx3m4Y7V8sTmpdo1/pfiQXm5pE0vpHyqENuPs/qIwE0MNTL/z/bBP
         laVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784977033; x=1785581833;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n3M5piIMo6U18b7y0I/vtDAh/xfSo5garlAfV2kj4EE=;
        b=DI7m81NeNdU3tugxCDky/3IfTr5Ex5PUr6qdajLijmqHLXqaCNctU9BFLW2TgTkG7D
         /ilJDhhRWmRtfpULJfDKi4nJcOmM6B2hzxyiCcRWrJB+cQxf2OzTSVHxOrZHjQgbrLv4
         wIU86Qo5yAdqUV6uwwYYhen8mMNznNdOG+tm2BsiM6Am4flm9CmA3IV1+Yy8rCk7ebxd
         0blQS6UMgEgU9F9BCcSLjqETNKxOgH/cR2e+cbvkX2XYi11a3QVMgC/DYGs67tX3vQ+U
         FvYX7nYUHwOEspwOcWogDuuNbef94lPImdTRZz4VE3/oZC0LjnJrJr08MxsfNPxon2Rh
         yMuw==
X-Gm-Message-State: AOJu0Yyu5x/XGcdGnzCovfQr+3hok4VXim17x/E4vlDi/pVuMSCpsK6u
	3P9eM4m0nvSlEX1nuProt6w0ndluvTKfL+5jdoyK1Sf9KazIsZ3214/BHN+u52B8k8w=
X-Gm-Gg: AR+sD12upJsfJI+TlSglHmTpdKcyyKnjhyg0++AfiAwLhTF+e3rZYmbmasP26tKuZ9+
	K82lOOE8Gm9scxybqHuSJ8m5rO6qakhWVNK7s5aR3w+MfCsC2ctVIr89OHrc0FVMxKGrmR6LXSO
	TVIblC7hHLjrIYlpjJogfA1ULCwImHrZ6NAHI7vsHlY/CnnbjCIhoDAjqMF2Moi4fRQG+27O8mQ
	1jKUsGJas/0TovmmxYla/RoK5eJcepdsM1ynVoRhGRS1fhdKXFjVEwmllEwfNwFSzP7sqDQwwV8
	p4tSRM8+jkWZesHVgtAkqaguKvPdq8cb97tpkg7U5CY32dIxfF+vpaVtBeHNvh2Gv57KMFfojd2
	icrS8g+a1hvgHdu/Entz6w8vOjG0otMs5KJoebphnUiUFFUUd5l9mpW2ruG9B9f+XpaYHF6MzDC
	k6iruWaNLSn2C6iFJpRrb7f9t9ecGHx6IGW2ZXh6d+hZ1bF+nb4uMEO0A=
X-Received: by 2002:a05:690c:6384:b0:81e:cfc2:c46e with SMTP id 00721157ae682-81f69e7878emr6404117b3.60.1784977033252;
        Sat, 25 Jul 2026 03:57:13 -0700 (PDT)
Received: from [127.0.0.1] ([12.11.118.66])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f657a076fsm10783967b3.12.2026.07.25.03.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 03:57:12 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring Mailing List <io-uring@vger.kernel.org>, 
 Ammar Faizi <ammarfaizi2@openresty.com>
Cc: Yichun Zhang <yichun@openresty.com>, 
 Changcheng Liu <changcheng.liu@aliyun.com>, 
 Christian Mazakas <christian.mazakas@gmail.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Guillem Jover <guillem@hadrons.org>
In-Reply-To: <20260724225905.747718-1-ammarfaizi2@openresty.com>
References: <20260724225905.747718-1-ammarfaizi2@openresty.com>
Subject: Re: [PATCH liburing 0/4] Upgrade to Clang 23 and git tree link
 update
Message-Id: <178497703112.1414958.567921667205005096.b4-ty@b4>
Date: Sat, 25 Jul 2026 04:57:11 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sat, 25 Jul 2026 05:59:01 +0700, Ammar Faizi wrote:
> This series upgrades the Clang version used in the CI to 23, and also
> fixes some new warnings that are now found in Clang 23:
> 
>   iopoll.c:26:12: error: variable 'no_hybrid' set but not used [-Werror,-Wunused-but-set-global]
>   recvmsg-inc-tail.c:66:25: error: variable 'no_recv_mshot' set but not used [-Werror,-Wunused-but-set-global]
>   reg-wait.c:26:13: error: variable 'has_kernel_regions' set but not used [-Werror,-Wunused-but-set-global]
> 
> [...]

Applied, thanks!

[1/4] test: Remove unused global variables found by clang-23
      commit: ca274ec7289fd4ea56f20651be1814b9614b2745
[2/4] ci: Fix the wrong `cc_pkg` comparison
      commit: 3a6320a6008afee1c8febf16a9aa1428084a146f
[3/4] ci: Upgrade clang version to 23
      commit: 4acaaeceb71cc5915cf11f9a2463c1467d460847
[4/4] liburing{{,-ffi}.pc.in,.spec}: Replace dead git tree links with the new one
      commit: b12a090919b400b401e5eb35be2065429fb6489e

Best regards,
-- 
Jens Axboe



