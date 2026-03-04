Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D8428726D
	for <io-uring@vger.kernel.org>; Wed,  4 Mar 2026 02:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772592200; cv=none; b=QY7T0UGaYALky2pFMO9w236N+oyPV03ugiUWTOavcxE5Lt+MMRsfo315t7hDIuaW34A4bF+w7QooftdE0WsAhs5NW0FLuJAxnIe49iPmeo/9XdsLEjAuRIuPAToVjLTrFgB8PKbJF1RMARxlLI3drIINyeNueUr83w8RfB3cCPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772592200; c=relaxed/simple;
	bh=gZDucJZNiqyC6wEwPHP+1tEMO/8GgbNa2iI5dEFvHIc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tfJw3VWKZnfoKV0YdC2M9jk05Wp2tSoKespI95StwXR4p1k9kSEubX3XCLtFicvKeenI7qKH/c5cJhMWEiWnZNwfzadIUB7CXKEpJGKNC7xVjFvCpuhpLm+FY0/isNSKBPQYmQNS/aPaCuB2GfIE39OKc3upYiOAJsW712RLzw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=R4IzB+iB; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="R4IzB+iB"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-45f194e9a98so2463681b6e.3
        for <io-uring@vger.kernel.org>; Tue, 03 Mar 2026 18:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1772592198; x=1773196998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=olGvzGnK884LIKgHUdGsxJO2+aaiMfZ7Qy8nahnwFFk=;
        b=R4IzB+iB3jjpChYw+x17jMQuF0ajJkK6vuZYvY/k6BDUNDTqE0xef9tjmhZDzXOym1
         3HAkjMhV9t1+c6OT2RHcMnV/EwgyeMmwtTYptfGJFYrM8sqUyB3k2cwFLiLKOr6dLrmx
         tmdow82qVTfkmx/KSCeI4psVdSrA9TA93GpOLgbei19I9tHZVk0GzQqQ13uwUntSIaVO
         TS5DLfduCjNCYg4Wo80lEBHieT3v6ogTLEYlVYgMvr4/qI8yb9hmCQ3DnPE4/DRvVTAR
         D8J/Cwem9HOgFI9B+tPe9mZHTAesaYuZuV9VVuThqn3sbAXp/0A0C3iiUsB0IWQOPSnK
         QNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772592198; x=1773196998;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=olGvzGnK884LIKgHUdGsxJO2+aaiMfZ7Qy8nahnwFFk=;
        b=uBaqA+nxGrUS6zgOCaNir+9ZWqIp3U43GWUed6pVwwvctPXPqzi0hEE8ZPYdqe9MOS
         +7lf4RzuN6BeTt8h4F7xmuBHUJb3EH95BF/hsaQG3NF5Al0lhnC+cq1XPq+htB8ZDdMZ
         rOhl+TWqDoDXqoutQan05WGcVWVyJwrYpNScKxln5yhygymyvjwyN/nLjy0GlhgbVEts
         6L4gC+YR3Px+orV2vX/FC5ai5Da9dm34L+0GemGuuDY8Ostl4OhqFgN/9/eYsjxAbtWn
         rd0/J9qCpk5ROdJcpvFHLNLjbyty5wFlSI6VZButoGKVhvC0aRNYk/691eXsfJeAJYH6
         gRgg==
X-Gm-Message-State: AOJu0Yx9f+oL24wwCio0u2zluWZPFG83JpD95ha+ep8jS6z7sag30GbI
	tyAo0dXkCS0DoHmcH92F0FxtHrqIdSbejGAfMU9nn0096i000DbQDyUZQJ1TKLd6KGQ=
X-Gm-Gg: ATEYQzxnBrTmN5KdH/21uapi49ehlojCfvaSZkDma89vaYtc2e84GvRRo5+DIpMcP43
	5vCqbYR8oGeB7F0MVXBfGucubZUUuClElbT+hbdMemCxUTQE+gD1nz256UovWLN3WxEJfm056ZT
	3VES5Sj1dpO2nSQQDVHGeatxU2FxrhFeIqLBCUgX1za4XdoMt+rsCTl5youO0YMuZa41W8Db2xs
	gw2DUWCwl72Qs8MerrtH9OBTcjj/v8b28weIL2V9oz8WdpD6PJBOYmIcd6PRUKqYulQNMStvjX+
	K/wVynQked0ueibrfjzHVE20auPedpIuG3hpV7+gD3tRi6VUAYRGkW3iNt8zcktUcPx61nskM5R
	gsap1KvXz+ZRH/KIjV55xGQWif+CLQ3+AjuJooR61FNK0SaT7BIWGyBRw4iACGUtvlzrasXjCQJ
	X8bX3xipVZZZJ5W/ahQIWEJwriL/Luq8CkR4t2VsNHYxb/6zcYpSor1yY3mR0PHCo9JDRl46J2B
	pvP
X-Received: by 2002:a05:6808:c3ed:b0:45f:2719:32ac with SMTP id 5614622812f47-4651aba62dcmr310851b6e.21.1772592198010;
        Tue, 03 Mar 2026 18:43:18 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb352592sm10570750b6e.1.2026.03.03.18.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 18:43:17 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: Pavel Begunkov <asml.silence@gmail.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260304-uring-typo-v1-1-152bd7474dde@posteo.net>
References: <20260304-uring-typo-v1-1-152bd7474dde@posteo.net>
Subject: Re: [PATCH] io_uring/mock: Fix typo in help text
Message-Id: <177259219665.19488.15072428169240272252.b4-ty@kernel.dk>
Date: Tue, 03 Mar 2026 19:43:16 -0700
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3


On Wed, 04 Mar 2026 01:42:57 +0100, J. Neuschäfer wrote:
> Fix the spelling of "subsystem".
> 
> 

Applied, thanks!

[1/1] io_uring/mock: Fix typo in help text
      commit: 9e7dc228bb6d4afa74dd6bab4f3aad43126cc2db

Best regards,
-- 
Jens Axboe



