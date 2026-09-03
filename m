Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDB233688F;
	Thu,  3 Sep 2026 03:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788406772; cv=none; b=p33d3hSvuPP7XHwFQPMQCOLZXteQdjNztVxknWAnpiQ/9f5q2es36wsaoaNymnB69yNd4o26ZN1ZpHW+4nUEjPGCLdhhaF9Cqw1LgNRKNyl3+Ty4BuJ6WszPxYQ5Y00wmW4mgfjLGaJWofuDuRM9HaoFYShZmVfaZC8iSzX5TzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788406772; c=relaxed/simple;
	bh=jPxnNaewyQ3zKCPYBENwz+kSC8U8o0nePsKRoR9zp9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ge5CRdG3tL2tpxFVpnVgqQ9rZl5hH7yHv7a1PlhMObiJ9a25Am8XPXFwVatRTobuXgXDMF39enNYS/icox0MqW31RkDMgLZypLmNLscV0IYdvGbCwcT/XmRgSHrPmTdD5LA9EZgMzLR7Ps+aY6higZngFghF2w0pHibqaJGsSbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eONIKg6S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eONIKg6S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 428591F000E9;
	Thu,  3 Sep 2026 03:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788406771;
	bh=82kzWHSOmd1x9WxILriZ8d9rAVq0omjkDFX8jZgoX9Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eONIKg6Sy7XT7apHckYDaImtFaAXwLZ7R1M3Vg1SvKSZJOL/cZDAQzn/UJ7TBBQuO
	 mL9F5FmBRIl7I4r27Zfh5JluDquRGqtOIV3Rgut5mnI6ZtYfgoFvvxNMV5aXN+QFLg
	 SKUs2wcr88BUtb3C/6W4G9e5LubFegnD3JfR1H/VVf+lllAI6bpmYCAXMiakquQYcF
	 OdxMpCXrn56leHv0cp1yErAKP57SzZg5LGUcljRPGJ85YMSu7yx/I4/sQPUQd3Eb9J
	 XK1oeHF7fM/Fk3ra9MJcIzAmQ9yNPlaJWryRD+icDy6uKKzix08lxPZqiieGb6hdco
	 EmXIWiPWPubcQ==
From: Kees Cook <kees@kernel.org>
To: Christian Brauner <brauner@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kusaram Devineni <kusaram@devineni.in>,
	Jens Axboe <axboe@kernel.dk>,
	linux-kernel@vger.kernel.org,
	io-uring@vger.kernel.org
Subject: Re: [PATCH v2] signalfd: don't dequeue the forced fatal signals
Date: Wed,  2 Sep 2026 20:39:29 -0700
Message-Id: <178840676820.2647250.10962752052192481814.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <adO3HG8bvwRPcmte@redhat.com>
References: <adO3HG8bvwRPcmte@redhat.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 06 Apr 2026 15:37:32 +0200, Oleg Nesterov wrote:
> These signals should act like SIGKILL, in that userspace must never dequeue
> them. But as Kusaram explains, io_uring-driven signalfd_read_iter() called
> from get_signal() -> task_work_run() paths can do this before get_signal()
> has a chance to dequeue such a signal and notice SA_IMMUTABLE.
> 
> Change signalfd_poll() and signalfd_dequeue() to add pending SA_IMMUTABLE
> signals to ctx->sigmask.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] signalfd: don't dequeue the forced fatal signals
      https://git.kernel.org/kees/c/37eadcb919b0

Take care,

-- 
Kees Cook

