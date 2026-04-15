Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F2A30596F
	for <io-uring@vger.kernel.org>; Wed, 15 Apr 2026 20:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776283982; cv=none; b=UdcfMWGcZasU4vbLWnjAry7vVdYYCN7bKIbf/BHkyHpavKBJcYaspcSZz6Ir0J8Hz151ztVKgjYqb3z9PrTXZG1q9XrpHxpjqQvLgMTDEt7b+SqL+IbXSrN7rj4Peuof8nNfszGRKr1bH9mR+W3kaoMmoMVJg533+n0mRQCyLL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776283982; c=relaxed/simple;
	bh=mJUG23rXdu+V8mQ+sEemXDMiGuh8FpWyrKm/6LBVGhI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iKOZ5PGj5TLa93UT89HAflqRrBlMIpMi2Y+3+8nIZJ+Ht2BURXDkK2fR3wtKQ8qNxn5jVvJeGsYvd4vyIGwU4hodOacAwksJjCxFL1gwpyUnQmAZtxCXlBZiVdJaeqfnZrkf716NAMMXF4u1d8Gsic05EjAxAXg55kqvrLc3lO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=Jcm7k4ns; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="Jcm7k4ns"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-689f648d0adso2279476eaf.2
        for <io-uring@vger.kernel.org>; Wed, 15 Apr 2026 13:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1776283980; x=1776888780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/OLbI8lLqy6u8ezJgbpYZCyaOeorXpab4QZzlM/PosA=;
        b=Jcm7k4nsq5SayM45J6lk/hs2/gLOYImzoQ0GbxUo/KbKSUy2u+utbthbAZAcgU31X8
         Kc59VxkHxjXH075J9TtS4ax1ajkkiP3f89YP6WMy56oZgm0rdsIt+qbHWjWMfw4KgPEQ
         NuwGz+xnQcJPX4j1npmyvZmR0RHI2JT8DlfZGncqSRsi2TEENs8+Yye20hqN8oOvaOY7
         Wr7V78Hoo9Cc40sm4wDlCYIZEpl8Y92Nu1t3KZlszW6//RFqRFrVPE2hBD66EjwYDBAR
         fLGQ/fQon9I+2WGo0RxvDcZ8efuHqQdDGEsAOGi8Rij0tMxSaaDQYuYbCsb4T/DEwiUf
         nqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776283980; x=1776888780;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/OLbI8lLqy6u8ezJgbpYZCyaOeorXpab4QZzlM/PosA=;
        b=Q/js5j/Hd0XB/caLFyBTqHNYQwiFpjTE4Z3ffdgL2eOBWP/p7tAx9r/L9xdcYgfH8F
         ZAhN/NJQXHT2c3G9CgAlTh2sUHzHVGzuUcSvoQYzuJlVhG548BgZncpdhj44rQAGSpUM
         /usuGiKp9bYLjhe62DVte9Ci5QJIO9vz0EcqqcX4rXQTXL02/gHVP/7f7owlz2KoiU5f
         G+zZcyAPykeiMXY7s90H/HWJq6X8vxVJ/SBATSK3UU0xAeNFX0VLrJWRqkXujyTyK7RS
         fKJSvY7EJz9e+FZ8b8eaBbU1jgc4Gu5ukCR0neY0EWEH3Glfuxuy1F6tfyP0oWAmN38L
         ef7w==
X-Gm-Message-State: AOJu0Yyz9avFk3BzERdqkCR0vHKX6MlNDCf3xgO5TKYmiJ86262JCYgK
	iaT+MxvOuzM76YBK9PqEGStFUH7VdzFQ8xS7Qaw1X+OkDwicvvdC3kAJZ0DKvXJE/Q+4YWPxyOw
	afYPp
X-Gm-Gg: AeBDieslyFMPt98sqV3O1JzRENfKmIjsGaYfN8dyiFiNeM300CL08o/IO1l9iuUQ5TI
	dLvp8Ko4iTjEy9sW1p2j6elPQwwYhA4iDBLycx+F4NRznAPW2DDh3iagqJL0+Hhsj+3y2jMI7RS
	XfzRGuTJGDc9HBjTHw6MZ6IvBkNBTZslpz4sgRj9KsZgQvF0749zpULvWn+qoKnEWHSOhtMH7Ns
	YmK18iUar1BwgS94YsJFAhO3QhhIx0TX6Hjhz53p/JpdDeVqIYvIANVoQr/ESFAcAqV+rBu6AbF
	SeI5gakht+TUpkZ4Fwmc6gJ3M7Tmc6OWv0vEfeyVuuRGMlH2aEurSrrYq7wVOHQq7zVi6AKiSUc
	27h35NSUYC6zzctIZtAWQPBMEmd59iQUI4SKTtkoneqq3VRSbLCE87Qzp3ziN1DYgetQfUi6NU+
	ZEXj3+RcawjuphnKNvT8W23ERH5Tu/MbXGtlU4AIe1xg4zjNhNuf9TCQxWF90ac316TfLXTHKJD
	ji9H+glGYwgQfguBd8vEYDecMreWXFsszoB6mpg
X-Received: by 2002:a4a:ee06:0:b0:68b:f68f:86c6 with SMTP id 006d021491bc7-68bf68f9c32mr11900044eaf.27.1776283980369;
        Wed, 15 Apr 2026 13:13:00 -0700 (PDT)
Received: from [127.0.0.1] ([72.170.223.83])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6932ba69701sm1577878eaf.8.2026.04.15.13.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 13:12:59 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <6fdc76568f2066bf0d7f0349088883ab29e6cb63.1776004188.git.asml.silence@gmail.com>
References: <6fdc76568f2066bf0d7f0349088883ab29e6cb63.1776004188.git.asml.silence@gmail.com>
Subject: Re: [PATCH liburing 1/1] tests: don't assume tail/head layout in
 bpf
Message-Id: <177628397700.681988.6965217830149845654.b4-ty@b4>
Date: Wed, 15 Apr 2026 14:12:57 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sun, 12 Apr 2026 15:30:04 +0100, Pavel Begunkov wrote:
> Keep separate tail and head offsets and don't assume they're placed next
> to each other.

Applied, thanks!

[1/1] tests: don't assume tail/head layout in bpf
      commit: b195ba2723f0850a574424f408841c340436abca

Best regards,
-- 
Jens Axboe



