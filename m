Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793038403;
	b=GlQQfhXyGb2YhnJerAU1OkahGhuQwfSgN4f1RPAosbWNL69TPiz+Lc+DoaCYPqr9LBkf
	 /yrKbY4/vfyP9YGtGSXbpmc6V/IAKDXBW4iin459v+0kn4JlIgIwg/MDiHlTqXeHqGKFA
	 M5y5PQEFUg8xMRAOUrDPR662ii3B/SNpTu4C4YZWw1fOZt6Wd/9ykHGFO4i4naSxyx+/f
	 RuVCczALDzFDIshXui2pPmq7pxP7kJmeoWJ6pa+wulQ/9utT/d7vwn8hZweKxXNcXxuZ8
	 RgA3vfImqv3ufAHjScAr9kyLXaMQxnP9huq+7InFz/oskHncjsbPYn9umajSOsSSJKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=dXB+VmD7ZEvDQxrbGjciJvLVxd5eim1ROJJfAMvY7N4=;
	b=S+vV/ErLOGz+tCNZJ979mG8DEr9OY1pmXhBxvbkXixGRujW42IQRivWGABBpBLu0F34w
	 arm1DNNNT0nqJxYT88sxKWMYwtqvQNAIzZeZ6QxuRgZibO2V9YvCjnuvmhGrsVmY02JPi
	 +bPumGZ+5v4prGLjT5UrVyXtqBC5062W2ZI81hWfMvUU+eOsEAVvBpxmKRsd4IyYNu/MD
	 D3r9le+Kytg14D9SCstBTtrjcIzNR9SZZLYwtdYlVJuGyvtpbfDdgoA/rk5xXQgfoAL51
	 KSrLQ4wJO29PrzISPBGkVW6msWr/WD3riCDftf+gvummlF7lS5XucQIgskeeR7wIwTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=FxGMUe8L;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7BC60A2612
	for <io-uring@vger.kernel.org>; Mon, 26 Oct 2026 18:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F7BC60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=FxGMUe8L
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-185fd3a4ca3so2716165c88.0
        for <io-uring@vger.kernel.org>; Mon, 26 Oct 2026 11:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1793038401; x=1793643201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dXB+VmD7ZEvDQxrbGjciJvLVxd5eim1ROJJfAMvY7N4=;
        b=FxGMUe8Lp8NsVRr9DrPxz+C4cI/SGL1gmiEM5kT5s6UjbAQ/xnYp9vYay98FD47Vi3
         twptTSKBsSo7iQq7MmK/ggToT+pfM6M1estse3IKHMC7tDNgcIho+lQrJDpTzD4B5xqF
         z6H027u21pDo5+szEprwbGyMiLnzaT8Hg81/tVUB/RS0/uqfqoGRK97/hM9j1IitCvcr
         piM41JeeDVCFvzlLAuqM79isJ7ny0yT/bkf6ICdyyz2sGqGJmuxYn7v+obs/ildD4sJJ
         O37hOWXHp+yg6pdTNgv/QtxmU7ACihRRK5dFt06biTErQv6wgR3kXwgg8roHT9cEbOaX
         Olaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793038401; x=1793643201;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dXB+VmD7ZEvDQxrbGjciJvLVxd5eim1ROJJfAMvY7N4=;
        b=Xt8EkPODoP5PBL0mpJzK3zEZG9qlsZywyi3qYtyT0HQ0Tcq6TaIpFfGq2kBkesJw4S
         Wp9TNxoVbf4sEP2zMKJ24We6aDnG6MGV9+1y7QTleC3K2rv+PJv7/uNuj4QtI1+tZrlZ
         1d4EOetW3i3IinCvI85ExI6/19XhCAsCycq6KlSawxiWGfQPH4r54/GGmq3HsCb1F5HL
         NqAaNAZJwULdsT4Xh1CVjbSQ8LKqVxIqa4WRR2tLg7xtnQlRgDhk5vIFDQrs3AbKPD+l
         sqTERK1mYt/7cy0/AwiUK5LHPb7Ylk7iL8FxuCi79puSnYpHoWz34fc5famhICbbybpJ
         wzsw==
X-Gm-Message-State: AFq9FYJAwEvbkd5xgPVfqlrp75Cjpa9TMb9K33lMj9RuGiiFauukM1y9
	IP9qYlI1kzcYA/QFqk7CWiLIIuvLA6g+D9tQCArOhh8AxRS2w0qH04Lxww/VZiMEZ/k=
X-Gm-Gg: AYBFou3bQ7yr5ctFFPyPreYINQpmgqSzDHbMpaIDaUgb0YDtS/ySMOxxF7DYQYcjhwT
	lVanuj2Tfz1p/WfqIw69Wn9lghP4YDa6cJTVJoLdlr2/TBCtRdEK/krZG4TfTT5XKVBeo1Ftu3m
	TMPaAi+OoM8FvujtCaSRp2cQ6Zpm/z9kCbiAU/qPpqYOp270bWHawd/8pK1d+5po5WAGo0fXxPy
	yZzrWAdBUsXb0+zZ1p8lBq+2EHuXmOAW1CtaXEGN6mtcDYEqDOmXqSs/djPR/UfQtMQMWk34nxp
	Tb4dimsWLXKIA5YCKRjPjDIuRTgWW/m1P/CyYRICVd8AS5p+GTQDAvyDgf0EcFNshail4GropXf
	UdkS2a6j68XG6zimPdzjBcn0FwuIA+RFEeItobPXIPQC3Iz0khmVCvfuQ7MYdXMwWLirGRHvPVs
	8wNq+Uz4wOTISzc+7O75l4GYLjzsguRRNmL9kA2dMlfImjxFPTSPsM5TMDuQ8J1/v+WpvQoveL/
	ijgimDC6RPyDQkY3ScF7PRHfjVI2wBgtmF9YpiRgIzRKqrt/XJgJT8BSBSihiZM7Hol52drpcIv
	ZUZuywvqCOM8zaK0mw4N4ifiahTAFGD266DjRYaOd24d/sMwZkT5i1fjnQyDdiUHbQCeRYnxQMy
	0Ntz90T6jpbNkKnJu2ZpYc3wNFSM+ZlR2TQ==
X-Received: by 2002:a05:7022:7f06:b0:18a:d0b5:fa42 with SMTP id a92af1059eb24-19935be807amr11254327c88.19.1793038401185;
        Mon, 26 Oct 2026 11:13:21 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm23576455c88.8.2026.10.26.11.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:13:20 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Dominik Maier <dmnk@google.com>
Cc: io-uring@vger.kernel.org, dmnk+artist@google.com
In-Reply-To: <20261022232121.2538616-1-dmnk@google.com>
References: <20261022232121.2538616-1-dmnk@google.com>
Subject: Re: [PATCH] io_uring/register: enforce per-task restrictions in
 io_uring_register_blind()
Message-Id: <179303840045.792754.5719211139627011916.b4-ty@b4>
Date: Mon, 26 Oct 2026 12:13:20 -0600
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


On Fri, 23 Oct 2026 01:21:21 +0200, Dominik Maier wrote:
> When io_uring_register(2) is invoked with fd == -1, it dispatches
> directly to io_uring_register_blind() without checking
> current->io_uring_restrict.
> 
> As a result, a task with per-task register restrictions installed via
> IORING_REGISTER_RESTRICTIONS can still invoke blind registration opcodes
> such as IORING_REGISTER_SEND_MSG_RING even when those opcodes are not in
> the task's allowed register_op bitmap.
> 
> [...]

Applied, thanks!

[1/1] io_uring/register: enforce per-task restrictions in io_uring_register_blind()
      commit: 4a93427e99a8524f3612f29ec8bc0da5f8435a51

Best regards,
-- 
Jens Axboe



