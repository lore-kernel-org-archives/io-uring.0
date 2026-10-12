Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159BB38F24D
	for <io-uring@vger.kernel.org>; Mon, 12 Oct 2026 18:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831080; cv=none; b=XxvgHxGezPqvMTqMJKNvwpckPbR10bHKC0iGvrKIVcbUAOMpqnX9nS1csk1ZM4Yznnp7hNbpWMVxghiU5/9BL0ywzQiBpFxOfN80um2UnJBd39ZxFssU6xnxM8PdXZriJfFg8yxBQs/a1iDREnpJQn94dY1urH/WOsKgeJaoRA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831080; c=relaxed/simple;
	bh=8mK/2QEUVVgC/6SIjsn5gSOcjpiYDhr0wY9DKzdO1Z4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LCnA5IVuDhjao9TUV8nKb6vJ2XknNBiRPE4x3Xso+BiXGo+oMOHIGuWllgDGPvtc0jnfmb8qauxtu6sjD/dV/X/mWgvf6CpY/1uBi00yfLQRRA3jqgx8S1a4DULpbaT9klGkli30aeolWSdwxExBdN+7ig4qNGXFl38doPmR/HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=J2uA/vPZ; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="J2uA/vPZ"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15756f82e8aso3427526c88.1
        for <io-uring@vger.kernel.org>; Mon, 12 Oct 2026 11:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791831077; x=1792435877; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AWMMWMvOn9l0Ln0vvnUcFHP4wKSdIdXYASt3zibxoLw=;
        b=J2uA/vPZBASdR/HSe/mHu1uf9Rnmw59p8wQYIB9lla2V+XpqBn1Skd4aWc6RfHv9gy
         BvxOV0Ad8OlSercDFS6TlxXsP/CD9BTWwRlx6ujgpvpMgSGveDBu/r/HUHyCbVruSkbo
         yG22h1SV+09JbrTw9rjzozLt1dZDtUAtBeswV4kN6tsdmJJuOKaWRwtoJkFYiWoxohoC
         QP8JGk8COs8dX+9ELs0xIBsvkQwFCGxwl6x84HR1T8klRRxPQX/Wl+4GRqdFJiYHDyDz
         60I7aFZot5ZrtHB7AKfXWwudnVocv1sAMFDgSfI9v65xsMdTlyRC5mrdSs+wdlDdb/gh
         BUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831077; x=1792435877;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AWMMWMvOn9l0Ln0vvnUcFHP4wKSdIdXYASt3zibxoLw=;
        b=Yydk7yY/A1nZ/nVzNd2upvNhWMA74vS6YC2VY0C2HOJqo/FDTdklC/wHBArW/nZBdN
         jm6SSngywMdgO9CqE5Ozig+tQKOhcTVYJ9nCTZ2H72gMpKPntrpx2x9k3e6aKhq/BAhv
         hiqRVE32NRlmVW/ICRhl5BDqQduGU/eFyAzDNsa9NdWn7/kOqvMlYNVR02msjwZTGEt+
         5N0LMc+Ns6TQTtT1cp5DRen6D9rPWWcGKh3CMcFzC1V/anTdMi6FSzDWp1znBgUpJacD
         n65M1UjGUUQ+/aAtILhjg+LFuPyBFk6ODTRSRIrkzwVzQx/VtxrP9950Ba23tG/MDajZ
         eB+g==
X-Forwarded-Encrypted: i=1; AKwUvBxg8fQ/554pXXGNSIuvrDDf1fx64HgWEpDE6Ty/qQzrtMbHteDAKZJa/tIAHqKMQGLzHPWxcx5TQg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIX9gLXX43VFzKkIYdftZRLUgJOuMe6f5q93QjdUUXwtA9RjnrU
	NoBylLLM68mjBEtMmXpFZX5EVWQ70MpanZJUxWVNd2+cGP5pG1iil069EIznKOXs0mA=
X-Gm-Gg: AYBFou3yTH2FfkVmliqb/LnJtc0/Uje45ac9Q73IMCqWVCFJjvvzVcy4lplaWaEos5t
	+pv3BPr+gw8dKeVtYc1kXqFeMyc3IG3/dRM6CcWGw7uBNTpGScPxZZlnElZh7IGXTX5TcwkrULk
	AGrtI2ArWS1zhmoPJBSXHHcnoyBXJwbQxRzayjKUEa7maK4OdtdzXmSYtEMmogor4U5lx0mFUBr
	dVwhny9jqHu7qCF3grF/q8tdT0tZb2AqlCe0I5HsrHNvYjUsGWC6eKr5wcHT5oGbobYkaGHgd2e
	TlpR1LCVlRLBAqDilUc/5az4aFr1Tu5ScA8Fuhpdb57vymizqlBnHm5Ep+EUlBoivEp7G6WK2fS
	IdaEHe9ohT+JyUTeaEqOpaKs2YbwBfyPtcZbtIQ43S3g1xIcmV9nXta/CFVdfPx5sO8l8qemN5l
	BMJ3zO4NJlGTMBL3iSmdys7DCsMrhL8TWD8zsyP20d9lrpEiLF4pZCKsjZxp1gNUOBkEEB/eNpF
	upYa0jA7/Bc+ABcSEPPeKAwROrhb53WTt3To+wtxTlNpTRbv8OOM0j6HA==
X-Received: by 2002:a05:701b:205b:20b0:148:ece:8cc3 with SMTP id a92af1059eb24-16a1555cfb3mr13553259c88.24.1791831076829;
        Mon, 12 Oct 2026 11:51:16 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2f17feasm41738221c88.9.2026.10.12.11.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:51:16 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>, 
 Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <asunjCm5Ovj_YDSp@redhat.com>
References: <asunjCm5Ovj_YDSp@redhat.com>
Subject: Re: [PATCH] io_uring/io-wq: don't call try_to_wake_up() twice in
 io_wq_worker_wake()
Message-Id: <179183107606.215281.10642628466917425900.b4-ty@b4>
Date: Mon, 12 Oct 2026 12:51:16 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sun, 11 Oct 2026 17:13:16 +0200, Oleg Nesterov wrote:
> io_wq_worker_wake() does an unconditional wake_up_process(). This means
> that __set_notify_signal() makes no real sense. Change it to use
> set_tsk_thread_flag(TIF_NOTIFY_SIGNAL) instead to avoid test_and_set_bit()
> and another wake_up_state(TASK_INTERRUPTIBLE) if NOTIFY_SIGNAL was not set.
> 
> Perhaps io_wq_worker_wake() can rely on __set_notify_signal() solely, but I
> don't understand this code enough and this patch doesn't change the current
> behaviour.
> 
> [...]

Applied, thanks!

[1/1] io_uring/io-wq: don't call try_to_wake_up() twice in io_wq_worker_wake()
      commit: e889b0e4cafddb3d68c3595dc01b7128fd35fbef

Best regards,
-- 
Jens Axboe



