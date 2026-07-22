Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32ECE3546C2
	for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 13:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727464; cv=none; b=Lv/tskZcosfAvoE1eHVFyMdW24tLMtYUTCfyE4AQvyB7x1tpjT75nb0v5SognPyGeFXmNcnZj7lovomhR72Gi9UyTmJestygrNw05AH58/rIGAs0SnboW+gcR9rcYNwAv7TYYWgWFV0QGDoZPtMsPP0p1s/rwect3CpyxB9Sihc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727464; c=relaxed/simple;
	bh=RJvHchPobcsmC06bahci5r3mCA8ciWppAQIaovII7V8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gWDB4ysYIeHujfr2f616fQo2Ps/V8CWZwcQ3T8Aw2ohgcZucEKIF0CjzCkt+8Mzl4VM7tnOMoz1AXzr7ulcD9TG8+OH4jCT9zHHGif3fR9stTEmvmxM2z+jIxMVReMWv7TRIu5AHQTR5YfSH0c4jPy2POjYXc6cOSrRvGVdRtjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=YSAE4TWK; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="YSAE4TWK"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6aa9606ddadso518294eaf.0
        for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 06:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1784727462; x=1785332262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hCyltHX2ojoLIxBY6MxHYY7KIuNnjboGDeAzVREn8V4=;
        b=YSAE4TWKrhLJQs38Kt2wli/k+AWUSka9peBMoF2iylva4sG236otpzEOobJMEIjtnG
         INa/t7c/vdNb/wkg7XkX0bMdzQ6j1eHoQN3yY9GpqhmwnV8QBi4hV/Vt365rEdaek8Z8
         kfkHoFX01vnyDOaFdzU2y8yx6arUiJK1/yj2L6HT8HN7Vfs1JClMURu9VZ3gwxGCvMCN
         cserG2gf+S68KfsEvbQvkQohW9KGuoIxrvSrSEKJF/cT8nA5rIRoxCL0jm1Fy1yMCsyo
         lf0RDOWF48fnTpOZTxr0TDE/BwGxyM1fiyQpSoAaWL7R/4wwgqcVpVWMF0qnnix43Qys
         ggEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727462; x=1785332262;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hCyltHX2ojoLIxBY6MxHYY7KIuNnjboGDeAzVREn8V4=;
        b=UZ5PQkDu1Nnv8Vde9v8qgJABdP4ijPSGTK8mgjsyGe3Cgs2XnmCJmKXyET32aHY2xS
         P0XCpU+aXOq+LQo4LS+8FPMP++U6TP7c75tz/SMKhR7r6N7g15l/4IllxSX09b+rhKoB
         EMO4yQLc+ry0uS5jME6pd3QjBAdAojD3mv9L0+73OCSo2rMsgxUi5oWuGm6DLQ4Lmgla
         Vo7bT0LzkyQnJyRX6SRws8gQlnqpr7epov2Rr38WRfCXc8QClNmGxLcaIz+LEKMwwX7g
         ont4LnbmI3TksYAaCYS+FYAf98c+8wzon+sUkMEsJZCg7CoolUhckU7QpkgK0FMqSYI7
         ctpg==
X-Forwarded-Encrypted: i=1; AHgh+Rq+6MtTpDSkUyOgxWrLXhjl3W903j0bT+VjQ3i+X95z75fROfDdwTHpmWrBEyebbKVeF3YdqWJTGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxF43rHx8euJI76d+jfqk5XiwhIr4l4WswKX6Cb/6uFg2+M6H99
	BUyeNwf1vahMmWoSQgew46gUpFWWkE0mpr7PN06BZu1WFYOuSz7PiiQDPZYQ/dsUpvY=
X-Gm-Gg: AR+sD13AOSf/u6DDkl9a3sBO/dHuxqBzhj0Ta0yo9GmlpPBo2hhcZj3Zs907S94mpeB
	0uM7+82vn8v3TtKR77k4gtPsZ+sFseTs/c3jt0JHXz6MHqqrCk40rgc4cP6gqBMjOcR0Kzc1ivH
	2YQ6xzrHQEcOWhKNSakb2JofWo6Ldj2Aqc8OX8dBJ6fOAqNlg9qog1W3DTypqgNNPlXv50dUosE
	LPZLzFXeCNcSN2M1ThZG+WLcUGhJerjguoZFxspTbSM/zcIe6T7zMeMPmoEb0sLXwG70UH13Aen
	FeS66Wh9vv2S80pfpmDXIfBukDE5ZCpd5P0BuNWLeKahQRq5CjODzuebTqGADhtqSNuob2H/4OM
	B2nmUKc0x0i3D4bncfeAKp4ryl+RpWBuh84Dr/afAC+5jI2gk26Xv8C5D0ku6XOoT+CCuQqjM6e
	hNop0+59NBHb2ZyPI+/jg1IX/jwM2wjA==
X-Received: by 2002:a05:6820:4c17:b0:6a3:8023:f344 with SMTP id 006d021491bc7-6a5366d2840mr11308365eaf.2.1784727461936;
        Wed, 22 Jul 2026 06:37:41 -0700 (PDT)
Received: from [172.19.0.220] ([99.196.129.101])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aa79301fe8sm1534595eaf.10.2026.07.22.06.37.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 06:37:41 -0700 (PDT)
Message-ID: <e54748e0-1dbd-433f-ab22-22e6a4495b05@kernel.dk>
Date: Wed, 22 Jul 2026 07:37:32 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/rw: fix missing ERESTARTSYS conversion in read
 paths
To: Yitang Yang <yi1tang.yang@gmail.com>
Cc: krisman@suse.de, io-uring@vger.kernel.org
References: <20260720114116.21830-1-yi1tang.yang@gmail.com>
 <902127f0-83b6-46d2-9e7e-71cee4d63016@kernel.dk>
 <CADd-6Fxdk3Y2RyzvJAfA0i1Go5U-y=9__vCdy+FdzcOWwnK18w@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CADd-6Fxdk3Y2RyzvJAfA0i1Go5U-y=9__vCdy+FdzcOWwnK18w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/22/26 6:36 AM, Yitang Yang wrote:
> Thanks! I'll send a v2.

Thanks, applied it - can you send your test case as a liburing test/
addition as well?

-- 
Jens Axboe

