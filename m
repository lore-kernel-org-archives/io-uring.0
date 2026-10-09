Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB69125AA
	for <io-uring@vger.kernel.org>; Fri,  9 Oct 2026 14:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556425; cv=none; b=TiOTOHVfYftfuX9ZHuoBX0RhfSIYp41wKk8qo/94vIiYfNoQByfiqlrf075SWio65zGFvnYho61ZXixB/3q1Z7CF45HLksXrtVLZfcx/rONNHV1HRDFbzLgSYon6NOy7YTLW3D5ugWt8sVkPZXEdVNyPsRnhSKTUlop9WT+dr4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556425; c=relaxed/simple;
	bh=PMrJ+PfRLd+U02kdR6362NlSjwr7TggK4kaDLqi4XXU=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=u8zaTr+5fOWYA+2sH4zz5gIj8m2+VYmNcVs9mOhc1lpA6rMpLq2aoV6+hfZPEM7VVaVcOKGYUHdCIr4AMUo+Xg7kdWVEY/0u3lPwzBxrRLXBa2DRteG5kFlbXL6syrzOjvaUsnFW+4XNox5h4/b/lw1mHzxMsdjHh0kfYkcZlt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=MhfXBXj6; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="MhfXBXj6"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5170379eec.0
        for <io-uring@vger.kernel.org>; Fri, 09 Oct 2026 07:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791556422; x=1792161222; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vFbM89QzEemXOL2UYiE7laOt3nLQ/WNN7aPcOJTBl6E=;
        b=MhfXBXj6TQR8dM8Dzsbwi8oajEos6Rq++jInps1no5OLcBG6/qzAWfqtBjkoqLYOSN
         D2GaYXrNl+pJgDOGDGlgWmT8hJ794kqSZHrYHRPEkBJzHCs8WbxSOhTlyJnRUfQM0v7z
         zm4RcpFaW4p2xUmmxl/OWW+zj6zh8jas0TepWu5vgF0y/gUNlA92+ePpOyn9/OM9G7sQ
         3HM+oSOl3uImNG397FcnMfoGCD+jHE+dYY08nVzFEeQe9rG817anP3dKFI4krnx+a1dR
         ss6ew7vDMq1Q8NccMQ3ILR5bK8zLxHh3NcabYyF3lsCALPENTMV6XAhRyzYAf5xmaILi
         Hglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556422; x=1792161222;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vFbM89QzEemXOL2UYiE7laOt3nLQ/WNN7aPcOJTBl6E=;
        b=XylGbxt9tlQGSGwG0A3F2ZPoRM9ZIrgwrjz0Zz4jTXoVwF/lpF+9f7iz1rU/rj9rTm
         aKrUeGAbQZcE1hUU4+C+nTc7lik4cVyUaTmgQqxoF58OrP+YMlRO5sdDbIaRYv7VS89y
         38KErI/QBQvvu217X4knacai2MKCec6B1+VbM+lItIuZ91MI+r4aEnEYI/CF8/bYtJld
         Wbb42T4wCsethT+EqMWNcgH+IDi9lhyfNFWw9ck4Ysg0LelrqNYETjcQzZW1KKOyM4sk
         bM98xLqWDp1mGFo6WOcfPwmyxGfcAR/h9NTQzsyARzpKYYd+MFMfAe6jC206v4WQhZGB
         SEtw==
X-Gm-Message-State: AFq9FYKsocEskMR2pBJBocFqXAoaugsVyXqoXk8Bi2ZZBswv9SUJJEwT
	5rMjFCIVA0OJKbdZAWGp3yqm3YlzjTKl6rLM5XzYlMzhjfyAARGrDiPws9QHOwgA18x/sja73Nw
	O7OKxYhU=
X-Gm-Gg: AYBFou2mVn2+K4D+2FeToNfSgpDcUCMME1Z2lRbcbAy9D6B4SzX3DWweoc4u76K12L0
	XgaoAr2+qIz8Hx3HTI4fL+pb8rIGU/1OBCr5ptOFZ2hPvHDftturvsX6cMNxOdBi4DnQOYPf6I9
	CXYIdpYgCHKRWH4/rFCv3uiF4lK9Aqq8fieJZBIH9un/gDOsd1deuEGKdkAB2FrHbHJFmnFBxpO
	P8kflBTFCJ3AZSH12aKHZKuvr7UGG2oNc0CS2wPiwU0JYsSF+qoOp3bIzUap5/Gq6cwNTo4+w+c
	sDOshwPR/hTw2epyH6RmCvf6BY8hiFXyVg5B6Dmc4eZhZobqJ0Z3S5C0d/1Aaqx+7KspoBEApJz
	4mGw3AIDGOEBux8w9vNS/0IKHpUqYc1FHDSaCsAo5HsExUzamUFjn/SQWa8mW0mYl2J9nEzOb2m
	QBWx0247G2DPAfBuIexWNP2jXCkK0WI8Rv9LB9iq0yrht6vTh2GJ6gtT5FuodiHpF7OskBGmu2V
	KKVZH3J2qNMeAv3gQLVlrB176Fz1BcNMj2KyukPVNJEFjCrJZ/Kn8YHxMV9foFKV789/o10K9E=
X-Received: by 2002:a05:7301:430a:b0:351:7444:8bfd with SMTP id 5a478bee46e88-3537e13815emr2696196eec.39.1791556422230;
        Fri, 09 Oct 2026 07:33:42 -0700 (PDT)
Received: from xps16.local ([155.98.132.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1e05esm8003444eec.25.2026.10.09.07.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 07:33:36 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, Eugene Gvozdetsky <gvozdet@gmail.com>
In-Reply-To: <20261009-iouring-task-restrict-fix-v1-1-a49daf55a12c@gmail.com>
References: <20261009-iouring-task-restrict-fix-v1-1-a49daf55a12c@gmail.com>
Subject: Re: [PATCH] io_uring/register: don't exempt disabled rings from
 task restrictions
Message-Id: <179155641635.219229.11431241640736819805.b4-ty@b4>
Date: Fri, 09 Oct 2026 08:33:36 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Fri, 09 Oct 2026 01:08:49 +0200, Eugene Gvozdetsky wrote:
> A ring created with IORING_SETUP_R_DISABLED is exempt from its register
> restrictions until it is enabled. This lets the creator register the
> restrictions and then enable the ring with IORING_REGISTER_ENABLE_RINGS,
> whether or not that opcode is in the allowed set.
> 
> Since commit ed82f35b926b ("io_uring: allow registration of per-task
> restrictions"), a ring also inherits restrictions from the task that
> creates it, and the same exemption applies to those. A task whose
> register opcodes are restricted can therefore create a disabled ring,
> issue any register opcode on it, and then enable it.
> 
> [...]

Applied, thanks!

[1/1] io_uring/register: don't exempt disabled rings from task restrictions
      commit: 6da8f402e362b2f546e2efb7167fc9597aef6faf

Best regards,
-- 
Jens Axboe



