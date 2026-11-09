Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794260985;
	b=q7BP8MaFX7JM/2HHFqJrhvFQUFCC+btcFceRheaMZQXy2POtvcf6SiQRbUmE3h9q7D1b
	 jcxgzFD/sI8axSxsw6c1vZz/c+arJSU726m3ra8C/kFaJ3We7SU05NRiGIqx2YBZQMVCv
	 Kq455FKCkC1y3BNoSnKEaCSLC6xuYjnGXPkMjsIJsGTiUBeASAzgKzkoec0YxbA31RbHC
	 Jwb0HWIu8z7NNL377HnRON4tjcIuVY5nMtXOUkzfSWt6BJj+1TsngX1BX9senr1tScTl8
	 IlhNmg5EaV2Kx2Jd30m9hTaiMh8dGsVhhcd/KkhzTL8zdYBuQHzT7TV+LLnDBhRVMnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=kIPvUyy58FluJNp+/4hObdnVo8Xv8U2P/+DLXfONN+A=;
	b=NMs41Dp8N7uJvgmgoWryeakQ3LPCmOPXDZjDzQDKbmRm1JfhXg9/unGAREBZG0P69/Ng
	 /525DzE7SDIDQ7fV2PrixfhxrrI1jA6LqQsc7TZ63hRwVktOQZtfRWrP6IB9os3bH455t
	 b2xbJuAF6jWM7tCfAtf/M/3BtrCGQVmGct0HBbsBw7V+HVHxL6aFzdXIl62E0UVXJlX0e
	 0o1P0URkb4K92hOqnocS0M6+LYYWIEoSX7V+KFnKVBES6PZxRVDpcCdY7JyNOFpi9wLmk
	 7PQllKxkRhc+TKKFl1F6f+CzzK4OTkmRSiGaduXgN3eGLEss9rlv0hmVERJMc0WvMaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="P/5X1NKO";
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A1F606A331
	for <io-uring@vger.kernel.org>; Mon,  9 Nov 2026 21:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86A1F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=P/5X1NKO
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so568173b3a.2
        for <io-uring@vger.kernel.org>; Mon, 09 Nov 2026 13:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794260984; x=1794865784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kIPvUyy58FluJNp+/4hObdnVo8Xv8U2P/+DLXfONN+A=;
        b=P/5X1NKOtIip1FyBmDSV4p0wl2ud61ENGtVnUGBVCAjEcvdt0YUwj455lJmo9UfqMt
         vCOhEAmZ4yrEzAb2eT5Iv4n8biEztSWh0scwKCiXrk1MmEA3o2mXwAjpM6ETbakkQYg0
         vNNye0WeTz+ceNZPeR5hJT2cNv54WQgI7/V5URcrhNbfO9DNd1MAUP/8kj5qivrPUoVL
         sLAHqfryiGqWxigTQpR/0hk9aw9CHzGbrRJB4zwn7RREdvd4AY17qM8kIfLHJM3z7kuz
         HGwIQlp3cOYg8a8CznYLh0PlnYU6Ug6wU9OaDqzjVyrTJjusApj909yqk/ur67ohJS5g
         GydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794260984; x=1794865784;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kIPvUyy58FluJNp+/4hObdnVo8Xv8U2P/+DLXfONN+A=;
        b=PSSPOfEMZmkrrhqKVUfKscJxoWqqL4X9EkSwsi6lCmP67+hSy1QYvPQWwH2AEZ3GY3
         HPAUTDw7SFZp0B61KEnuDQ5FLuNizehuDTW+rxex6i8EXd3kNYwy9VDRu5gGJznoGEjz
         lLVvocruXMGT0a1RzqCixzpVbIniJ/gxAR+I/fnAldQwQzLCk/qejRG9ooHW+dNTh67M
         RoMcHoZ1b+gl6BrtdgDtB0AQVLZ5U02lD3egXGTqoTIA7FXRmJEAK/1yDWKqK1LopNMH
         q4Ze2qJV6yk8zcyH0zy0203DA0jub5feVUHSwDxVLbBIS+Wf+5HJMxFh/q76vLRWs1ap
         uDnQ==
X-Forwarded-Encrypted: i=1; AL+hErHCGhcPqltum+QOrN3SFv7v56fQBqKgcU6+bRKPZmGOyhq0yTkUWk031ZcSf7hSO8+K1KRgdUvQHA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8oKmOlG+p8JJlDTNcrARnmjUT1GPVA5BsTQ20Nzmutg1oyYs5v
	4FtBjB7o0GZTXtbXpGkk3FXMXEjpx8fl0SiBGBcYJP6kjy3Xj9aKl1oC6e7KyUITxSA=
X-Gm-Gg: AYBFou1Rqqx06015Fi/+cqPz0BGfALFspWQYwPSPgGQtuazLnt4N/SKLQ5JaIZjcrCt
	18N1SZfqWZgPRxlncM2tu7tX1QHHr6tcDla0kkmRzUkrfcgSjDnGCrIdnkuW9eO0iLh0qy3FJqX
	hfxuVJeAwnYRvIg5I5subU9RbbUBrHhD++AoIcJ1GvKtvUhviortTSOmjF7xCX6FB9RS3/dLc6l
	U9wXgYxCSfikvJVwwmp7thAxcRCpVrNiniFZu6p6Zt3zSfO52JN6U464Qd45esZeR5pRZBb5K1s
	jlro0yETfi6tsy0yWdhT4qUkSGDEvTU1cVlK+5a6H+MEjrjzzAI4tV7m1xjDE51rzQpAECPiIfL
	NdtAoEg1VjoV8YdXNgYdiJtDzeBWb8oUOh97BZsmYYA5Djg8IbLnKSWqxy4y5tvq4B6PlrJAc6y
	UcdInTy/BTn3dupZzE4T0pgW1+Ze/zJYd3ALgPFNNjkmnr6qu67cA+PAjbJfuAD60IeMUBXyfG1
	9av69z9sWInD6wP7wcU6nHupIA1P+e5UwzU8TwkGspTtFrRt8QpZzewZKbMlByNTIzBpaDDe/52
	0VIxPw3/h+lu5a0BYKmzowSCaSV3hBqCdvSzrjuP8mk1TCYbuuNX3YElfVq/xAyeOqRl4l05wFn
	G23K5gT/GRAN1
X-Received: by 2002:a05:6a00:3e24:b0:8a0:3ed7:939b with SMTP id d2e1a72fcca58-8ba864bf926mr840169b3a.29.1794260983915;
        Mon, 09 Nov 2026 13:49:43 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa1b2896sm129427b3a.17.2026.11.09.13.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:49:42 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Cinq Prairie <notprairie@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Stefan Roesch <shr@devkernel.io>, 
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261027204840.7823-1-notprairie@gmail.com>
References: <20261027204840.7823-1-notprairie@gmail.com>
Subject: Re: [PATCH v2] io_uring/napi: don't end the single NAPI busy poll
 early on need_resched()
Message-Id: <179426098226.155418.4382559329615606121.b4-ty@b4>
Date: Mon, 09 Nov 2026 14:49:42 -0700
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 27 Oct 2026 21:48:40 +0100, Cinq Prairie wrote:
> With a single registered NAPI, io_napi_blocking_busy_loop() hands
> io_napi_busy_loop_should_end() to napi_busy_loop_rcu() as loop_end and
> runs its own loop once, relying on __napi_busy_loop() to spin until
> that predicate fires. napi_busy_loop_rcu() sets NAPI_F_END_ON_RESCHED,
> so __napi_busy_loop() also returns on the first need_resched(). io_uring
> treats the return as the end of the busy poll period and sleeps in
> schedule_hrtimeout() for the rest of the wait timeout.
> 
> [...]

Applied, thanks!

[1/1] io_uring/napi: don't end the single NAPI busy poll early on need_resched()
      commit: 39c7210e970200f8b17de3767c73efe64173a95f

Best regards,
-- 
Jens Axboe



