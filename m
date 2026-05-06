Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8673242D4
	for <io-uring@vger.kernel.org>; Wed,  6 May 2026 11:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778065286; cv=none; b=VVYL4Y2huvw1MeX3Zmlpdqo2+V5zbr2H9wL2kOlW70lw1Sdkof+hqJell0azIMJ47ZL0A/gaV3473FXfghsZVA6elN/qmk3WdZPGYIASBDwbeK163S2HOyMPzTDQ3ZZp9NM8Tvpc7YQUsOf3S8RknQtOUtJYBH9VQJLmSHLkLqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778065286; c=relaxed/simple;
	bh=NUYaPKzjKOVwi5lgHLZMMS0AIhNGK2Uocuug8NYtNig=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JdTTlSBOHXwVFlAhtPtPxDcfA2luP1bxAldDUFkDbjckmiZc4D/f1L7hnZcC98rxbSdY6P8u07G/5B3zlHunUbpTVUPe0ACJsqyD0Ot10SieBJrWPo3iTUzcv9gbqQ6bG337lDmol3jBILpfjboj0ZLE9oymoobrPPiBSaLiZQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=lY56e5Fq; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="lY56e5Fq"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so79376325e9.0
        for <io-uring@vger.kernel.org>; Wed, 06 May 2026 04:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1778065282; x=1778670082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdyAd+ucWdA+9xQLdqyiTZBRNXwX+2kN26xghhBKBTM=;
        b=lY56e5FqZx484IAyAYzgFOKvN7CYMddTtCrPUEvfWX1EHnxH6qaYArjH+8uVk0vMsy
         PeQidMkdzqht6QmjFexYKT6148Yi0jVZlT22tDeLvRehW01TCXd9eiX5GzBd+JujoqE9
         vFwqL7N1ShZxELVrGAZevYHmDLdLJAzoy3xzyZbVRJ11wf8Fpgrwf6iJs7P32aEKi3Xd
         9q/W+gM/VhysrTLFAlhf4x0LEaBSnHONV5XCQWftnc9fr0dMUJPUig9O/sVa6GK+4Vei
         G2N4Qy0axK+inYqz7hBN2QXkLZo6YAYijUj884E7zT3cgMyCSh0CPfTgWGhPqceGcuZa
         j+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778065282; x=1778670082;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vdyAd+ucWdA+9xQLdqyiTZBRNXwX+2kN26xghhBKBTM=;
        b=HI1loIDNdS4r1K1SnA23val7jdHrM46xqRrL9aDtCyv5Z/QHkzPPcm77SX7n4XCege
         0Lw3hDSXtHODT5ItKBdIbteJjyupaCk6iP1e8rB5T/JVd4bbLpigcPCspUktn78ifdnq
         g6yP1d3a6G4RVim4H3A4LXm0oF3p1O1nwi3sED2Nm3ZGl3qhPSYc85lto3VuWh3FiIyM
         P/YQPDBie/4DTnwoXbwDL+MOcZunCjw0VeovfaE0XMy54GibfxxOPYWYwh3muzx62F5u
         6uKdwoKiQIHVSkMJXnt9+jatdGcXWdw1iuRCjm5yU34BcVV/SLRe1RdxA1HD6J1u9/WE
         Ws+A==
X-Forwarded-Encrypted: i=1; AFNElJ95WRsuaFFsSzwnpxDUQ6wo24K+5fwRb3AkARYBg1MM+y1ia6cNyZEBovZqiyrwpbAHADK60hWISQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYQ0fGhzJ+3Z5LLur0o/h3LM4sYgHMMfz4FENUxX6TlCDWZHfd
	uBAVbks9XZ5TP26mdTr8YryaIjqlRh+VMEzoUPMTgQUbjgYRHlCpMZoJT5uv4tMZr40P50vELpq
	BqSwNKb8=
X-Gm-Gg: AeBDietnPGyXZOhq3AzQH/FGJ8mXTjplF8qjGSdwEv7bdp+zcE4aNo25YMJnfEeLBNG
	qaz/10fryUGC85PbVWElpZFhYETxfmfrc8xG1IBDbyUjcFYb3Pi5pqgePkegSUBwGGNRxAt4sAX
	M0lvSgpzzcItIwcWYRzM7ZEKAqqg3jftW2K3E6fMO4CO8PBbVoQO55SOYaWkNmXT8UBm0PzBqjc
	TLyp2xGdtkE65l1bm9nHZ+sNHqo5lH0urgxq4VokJqjBG+ffDpG5IX7l4JsNtwdtgvypVyXSz1l
	WtlvfsGm+nhwj4M+Z+8OWSjcnTb9XgDU+MI4WMUy+0MCNOeT6tmYxmV5SdxQtAniHmCTEJK8n0K
	G4yQgS44UmEn5JNa/JCCYpgcu8Qan8YqgxX/DJdgO/i4xK7zUpkaMqM1NoqcXZmOzkEu7JVtz3G
	MhuMpB1rvFeqZkzXH6ZWS/PX5/Q9TEjztCPJelcFwJHWT3ofvZu3kBa/r3/oCyn7DWU+cwmb8yj
	BCQpBRFXUlyCPEtcqMXkTXMobg=
X-Received: by 2002:a05:600c:3b17:b0:489:5022:39a4 with SMTP id 5b1f17b1804b1-48e51e20705mr46274095e9.9.1778065282148;
        Wed, 06 May 2026 04:01:22 -0700 (PDT)
Received: from [127.0.0.1] ([213.147.98.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538b6e9bsm66260105e9.10.2026.05.06.04.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:01:21 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260504153755.1293932-1-maoyi.xie@ntu.edu.sg>
References: <20260504153755.1293932-1-maoyi.xie@ntu.edu.sg>
Subject: Re: [PATCH 0/2] io_uring: honour submitter's time namespace for
 ABS timeouts
Message-Id: <177806528097.864943.13477550129316501334.b4-ty@b4>
Date: Wed, 06 May 2026 05:01:20 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Mon, 04 May 2026 23:37:53 +0800, Maoyi Xie wrote:
> This series addresses two io_uring code paths that arm an ABS
> hrtimer from a timestamp supplied by the caller. Both paths skip
> the conversion from the submitter's time namespace view to host
> view via timens_ktime_to_host(). The clock is CLOCK_MONOTONIC by
> default, or optionally CLOCK_BOOTTIME.
> 
> All four other ABS timer interfaces already do this conversion:
> timer_settime(TIMER_ABSTIME), clock_nanosleep(TIMER_ABSTIME),
> alarm_timer_nsleep(TIMER_ABSTIME), and
> timerfd_settime(TFD_TIMER_ABSTIME).
> 
> [...]

Applied, thanks!

[1/2] io_uring/timeout: honour caller's time namespace for IORING_TIMEOUT_ABS
      commit: 9cc6bac1bebf8310d2950d1411a91479e86d69a1
[2/2] io_uring/wait: honour caller's time namespace for IORING_ENTER_ABS_TIMER
      commit: 45d2b37a37ab98484693533496395c610a2cab96

Best regards,
-- 
Jens Axboe



