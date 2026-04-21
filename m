Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C57B3D7D66
	for <io-uring@vger.kernel.org>; Tue, 21 Apr 2026 13:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776779897; cv=none; b=Nj5iKWrSY24RgkvS0Vgjw42pv/1iiwRYvSqtnSUJrqIKWvY/MKcPvnyxokwMHiccS33tJkYePsMe+FqAkn4vwq9497soRI+7UBVCLxf1I96QgrFeI5NppoZmGukfqhtAFFMyiQUCe2qhVwVJtWeHUZnmTK6Lop5Y69gJIvxbHzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776779897; c=relaxed/simple;
	bh=Y9oqSZf+lq9/lSAFfm/qgHMUTOvYonxFrF86FRAuFag=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=g0aNbJMXOldsYEvB/evz46pMo2IANt6Wd3BUW7riZQzpkLwbESYSc7mMB1kNVvI6JoJ8+Bdb+MkkoGI1DFeIiG1zNZs3HQXH9OpdJHdY/6b+QStWSxiLzDaYtMdZm8azRHUUDR39NPUyT9vesNUHYP05UzcLwj/eNdrxA4zlPjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=Acp7UsZb; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="Acp7UsZb"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-694891f8f75so1060045eaf.1
        for <io-uring@vger.kernel.org>; Tue, 21 Apr 2026 06:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1776779895; x=1777384695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfI7O+oTcYo2t5jHKNj/FjyQslLuPorCXOC15JNOL9c=;
        b=Acp7UsZbDhgO44NOXeh9Y6DpmTzbRG8octt9xszTurZyidzPqaRJeOVka8+jzJ2xXh
         xG/rabLSeDgpBCmlhF9JNTG18h/XjK9cPnFe7CdepkzBYjHuIdpUMkc2BcJwGYrepg/O
         LkQPlf/6/XpGu/5BSecuU3N+hyiZEugKJpAUKjA4Ag1KApNlqOTwiL/pUMFxQoXCNbqb
         qt9+Gm6gCVJoddeI7oZ2eHiK6aHad5Pjd+OEjk+Rb1xOtDBa9ite9f8XtMZGe60LPwju
         Oyf/jOWJe/YWkt+x/7nSqBzdmvo0z6eIXCEkb+1om5r20zNBPUtqrmAH2UFMdsqGX13q
         5Unw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776779895; x=1777384695;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XfI7O+oTcYo2t5jHKNj/FjyQslLuPorCXOC15JNOL9c=;
        b=CCKztPNJIL468Dh0UmZQ0SgIVz5KSbkrW5Kti+LkClXrDt0ocY/Kx7CK7hVG0c//Q/
         0awHCDXhtWX3e4+Ijd6r0qyXs/JJpp72OYb8QEFZZUFjYs76CT2eGK4fwIHEX0vJ/VUx
         jOr76EtuRn7tYnlsKoUnzL0DW9a7ud+MBkA/Lorgu3gyFoaLm7BeNYlt+7uTCp6e5mAq
         /hXllgLqhOSEC/62VXtfG9VxQegM8OlU3iKXAfoDwgoghDgX8PoLfKFxLCbc05t2teWq
         CdbBQvgJoVYYnxNF1Y/vGi/Y6EsDyQrx09hplRMR0+ACwXQ2AFCLT+n0cXIQ/Q9jVPKz
         OZqw==
X-Gm-Message-State: AOJu0YwoBBP4D71M8ux27FjFlnWrf0nviYMzgHgOxImn+/mJIPsMw69G
	XECFqMuTo4+ThtlQchn7jXgwNepFbAaecIXl8/is7erkDmlnIr1RDmfeVrhyP5JWMmU=
X-Gm-Gg: AeBDievq+KhCkFpoT99vNEHM3oxtbALz2d7tRVvEIeq9iKFsEuuZ2HhRrpQ1ksDkFEt
	GzJsF5kF4Yb2M+K0WH8BL3pw0NVo57ukh1PDg5SgUj0QVTI6SEY4Ya5eSOviBRS7JGPNBQeyuj7
	WAfmhbxHc1VERHhDKHW0ugNfeyAUZ6YsukjqPXRiNPwgOiDALLDkHj4kx9hyP4xVLeA++hBpO5m
	a4EvSzilag54IjVQthiqUK21hZixOx33clSnrSuhI7KrGjxqTE6aaAk0IHltMYh28hOaosw4hKe
	5iQevWez5CjvV4o9CL5LwFBvyp6Ct40fm5njjYPi/Q4YZXiuYQN1tTPHfh2C2K9SuZrfNTHWvkt
	ajTabFaG4YFX6LCEOrITKtKR3GijatwWgmZEgBgQ4JwF96SRRBRapS/pVmaEey6Bys7HE3Aby2J
	N2hYWmIXkaNIDlQq9mKLbbD06hZhfneZX7gidLF2p6sKpLRBqX//3rqTda8tJJxKIGqLoMd5hfq
	qVuaXYKFwepJk0=
X-Received: by 2002:a05:6820:180a:b0:67e:2905:83d2 with SMTP id 006d021491bc7-69462e3a8ffmr10404925eaf.21.1776779895258;
        Tue, 21 Apr 2026 06:58:15 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-694984114f5sm1229359eaf.7.2026.04.21.06.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 06:58:14 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>
Cc: netdev@vger.kernel.org
In-Reply-To: <2f3cea363b04649755e3b6bb9ab66485a95936d5.1776760901.git.asml.silence@gmail.com>
References: <2f3cea363b04649755e3b6bb9ab66485a95936d5.1776760901.git.asml.silence@gmail.com>
Subject: Re: [PATCH 1/1] io_uring/zcrx: warn on freelist violations
Message-Id: <177677989410.583761.7747351578414743363.b4-ty@b4>
Date: Tue, 21 Apr 2026 07:58:14 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 21 Apr 2026 09:45:29 +0100, Pavel Begunkov wrote:
> The freelist is appropriately sized to always be able to take a free
> niov, but let's be more defensive and check the invariant with a
> warning. That should help to catch any double-free issues.

Applied, thanks!

[1/1] io_uring/zcrx: warn on freelist violations
      commit: 04756ab59ac4eaf2a4f807cca8f4dde859bc02d9

Best regards,
-- 
Jens Axboe



