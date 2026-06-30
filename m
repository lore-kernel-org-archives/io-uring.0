Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4D6322DB7
	for <io-uring@vger.kernel.org>; Tue, 30 Jun 2026 23:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782862505; cv=none; b=kJS+HZyVUmPpcsgCYgN+JojrEVx0TXDbEYSrz3ADKRmrRVz53RkGTqFqlJzZQOVNO6cUZ/WBGzI0P3vedhpuzfzq3JZXPF7N+IT8/iEEHTYDMfGM2VavHKts7aLoBlDA4f3ottRyFtjkf/Az8mvBG9QCIiGMNXYwQPWfY3B/pQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782862505; c=relaxed/simple;
	bh=MUEYGjynnoFNYnjc03hd9My1Yh74tKixWgBnm/PfMFY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZSWjx0w32LTSJqI69fZKP45atBLzUX2AQCqGf3875MewuGUf0FPFAo+zZu/b9gGC3kdwzrrr5V4Aw0+w8WFnqtK6OlcnKqt6aPWVBg15vQgcMmX8vFHv2pGEu50NV/md+QgkiBQ8AqL98XtSxlyPKpbi32p1Bgelj2uQ9qcwj7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=p+gF2srQ; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="p+gF2srQ"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7e9b7dae39dso102820a34.0
        for <io-uring@vger.kernel.org>; Tue, 30 Jun 2026 16:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1782862503; x=1783467303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXaNCuPOpbl2nMSg6eBIdqb5XNbhZ3AQF3inJGb727o=;
        b=p+gF2srQkqXxCeGWrD0KLu3Wgr+7UG6nwgKm7F24UHB69uxiYsRFv9fe7LfnH0Z28v
         3YWI2LEsQO5cOFJy5aFKbI51NVnN3Sl3YzKEarFz1vgeD1XI3AzWEdJRAn5T0erCKd+0
         1rn++ocwXbFsyGwzZW70y8oiCmjF/K8tNTFc9c/XvgLYEYgDdnJEhVQpkQpw74q2f+CK
         kCJsF3Hieat4rpBulBfunL/3CJvjGcPi6Duw0KJ2n2k8vOjmtXOO0+a4gqZ7034TX4dH
         naW9CREh9GYhx9Ef8wnCWTlw5MsNTVlmPwrGZvS/FQ4AaB4MD5JSm9o1MVHfeJp54hzf
         SFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782862503; x=1783467303;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iXaNCuPOpbl2nMSg6eBIdqb5XNbhZ3AQF3inJGb727o=;
        b=k6SJEjnWmvSaairL3YNzX/KTVJu8fNdsp7QhC25cw5zw7UYOCgaQGnWtdkhu0KAa47
         KYOJnvrZS8oy18bAcVaohVAr2bJOFanmhkkrsk9Ep082iu5w9tB+8q7seQIip0YfY8nb
         ge6VcK1a2jQjRaeMQSJEryLuw4epDsz/cGJpkT95TveaHtR81a/cPs5/ZXIMAL6oVsRH
         b9VFwY0xeSJ9ZVtZf5WWtNdDssEs1pnmSPWrH3yqoA8rofu1CT2MYo6nLZLJAj8abjlM
         tl7ahiFn1x9nziAtxYsk5IzP6UzMST5Ok4yMxXsGDbRqJG16xOSLFLs9scUVrQjHAaSY
         tPXQ==
X-Gm-Message-State: AOJu0YxCtXkrchdA1R9I7uXuZwH40A0nhJxu4Kxblm4EyUrCVhbfw4we
	6uns4oJPgMMWEkjEtSp9cEA7xqQAj71qzMi0iXb3v77eKb92shTELJm+Gd1WXh2jZh8=
X-Gm-Gg: AfdE7clACwDoXRu5f3uU2nCLgGhOj22JWT5HWW0wb0cPQ0tEAIiYNGcbC5UWbjWNlPy
	f2iBI2oLNPuIb4Xil0V8XIbZzifwj/ss3abBw/g9JkATqph47RLlXvHW1YkrQ+w2jmQioSltbC0
	JocsNKwTXfiLLB+ru4nep8lIvGJ/EwnLkMI1iNlVsbDhNWsg+q1Qs/g7hMSG6SePfifjDLQAOw7
	ZSBJosPmkw/dW/dLASbNxZrpuw7rE9tLMOJBss9r99B9hdHvEyfyWXf4J6BUa9fGWZIp7E12JLo
	ME15Dc0PNJVz8diI43QsIzWVDRELRq3jN0GuCwGrrgjH2xaXCHG9UQMInDqZeCylIyA+gfRPV7q
	bcRlaA4POanmUNCK7Vp3XzOqgP9mYfdDWJAsI2I0OO5C+AQob2AofsImdW535jMu1Z4y6bu+XBJ
	S/l3HJXU3rrvSM3o9wtVsp9BcuwkUomMa6ggcNM0ZrdL58502qqi38uBM1nLBNMmdGjRXsWvMOT
	8wU
X-Received: by 2002:a05:6830:4901:b0:7e9:ebfe:a0a7 with SMTP id 46e09a7af769-7e9ec78be1fmr4659459a34.29.1782862502856;
        Tue, 30 Jun 2026 16:35:02 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ebf891e0sm3539517a34.4.2026.06.30.16.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 16:35:02 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, Robert Femmer <robert@fmmr.tech>
Cc: Dmitry Vyukov <dvyukov@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, kasan-dev@googlegroups.com, 
 Jann Horn <jannh@google.com>
In-Reply-To: <20260624090145.1715865-2-robert@fmmr.tech>
References: <20260624090145.1715865-2-robert@fmmr.tech>
Subject: Re: [PATCH v4] io_uring: annotate remote tasks for kcoverage
Message-Id: <178286250200.176362.12773693148044387806.b4-ty@b4>
Date: Tue, 30 Jun 2026 17:35:02 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 24 Jun 2026 11:01:46 +0200, Robert Femmer wrote:
> Fuzzers use coverage information to guide generation of test cases
> towards new or interesting code paths. Syzkaller, specifically, makes
> use kcoverage (CONFIG_KCOV). Coverage information is not collected for
> kernel tasks unless annotated by kcov_remote_start and kcov_remote_stop.
> This patch annotates io-uring's work queue and sqpoll tasks.
> 
> 
> [...]

Applied, thanks!

[1/1] io_uring: annotate remote tasks for kcoverage
      commit: c905736a46892e4776efc7f50888d67715d6ec08

Best regards,
-- 
Jens Axboe



