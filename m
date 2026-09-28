Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D360D4DDB53
	for <io-uring@vger.kernel.org>; Mon, 28 Sep 2026 14:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605894; cv=none; b=IRubDzx7WBLWCiuL6UNsq+3/sdhdnbwbX1SIZSNmVK9vL5+sdDzMUcEHeC/wFegg9XU+WaHjrCe+dxbFlV48f8ZN1WPIkUiGTyAUcQ8T1NLSCsv09pwkw5hL22D7ATuBynv4gJrnw3ZEstSOSkv+80soxPduEpl34eJ8KPa4Nbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605894; c=relaxed/simple;
	bh=D3TXq3ux30ZNnfK6lC/HKLzji/G3Th4nc3cSemt7ugs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rKUOaLVjXHU4pJD4e1SlpcBacVHfEsZgcu++Ho0QWWlchZpnnwqYMY/LmFl69Nm5RbHj4FMVyXcsQ/TiIPMs4eu4DH/9WOh49HFaLag3WZdaHKUBnTWNbH4tNz2kZ/RpVbxwmlsY4dS9t/sCkF9c7Ykab4Sc5COCcwRs1C3F97o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=00aMNaGV; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="00aMNaGV"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd025d07so2578021c88.2
        for <io-uring@vger.kernel.org>; Mon, 28 Sep 2026 07:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790605884; x=1791210684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1z8ZKhhaN5u9NWisVj47vzqbZOwB7wmqGzyey1IEdyo=;
        b=00aMNaGVqCsBfl/3kMvAjybg2Vic0g0YqY2HqJTRC6Q2Th1V1wJyLgQVmlOTsHSDb4
         AKEa80v6S0UlWvhwrEY82BLapMF+5Lt1A5A+ucnzCQAC0zGPeXaSy2uKZs78+Kvt8pbJ
         fb9dtu2ZNG5ZEXe45PgSkKfJUHoNqg0qNF+s0ydacdGlcQwxHxeXErNaukIeHKexvMTG
         eHgw5rO0e0o9+rL0OTSHkc+AragEgST6rVHV5cjXDeZl3DiEfvBAMulO8gXjf9B1CAu/
         3ZxYr/g+YMDSYPSIqm2NenDTIKVTHTZCOGsNI7Xm/h0BD9eeaVRiqZuKwvGBXlyROsd+
         bMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605884; x=1791210684;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1z8ZKhhaN5u9NWisVj47vzqbZOwB7wmqGzyey1IEdyo=;
        b=RP7/wCjmLMu8AoxQtxOhJkBj7Y1H1aB8u1LR4W6lnYHFkN7JN73YgGb3JJFohYzEup
         b0W7L6EsnggDYlfrpP23og5OiPCIcrww1Wf6JHgrY8oeOegk1xrJ0S3Z6I5KxPAcsiLs
         3ke97d1wNCMRhaIZOfQ7eg8ml+TFnMOSKT4HeLG59++15D3IZfSrdfE9rBU/sdNDZ6qV
         FiHb1fPIVEjpYaRhhW4lsIdp798rSDE4QVDX4Y+49IKtM7rOVRrlfKH8E1BhyV1zrSVL
         FYqbVdLIDOohtmMLirUmsxBcYs41Hqn2DGOW/5wDYSrhSsWoAk+iex/D9acInadymgzi
         +71w==
X-Forwarded-Encrypted: i=1; AKwUvBy95QjY/fqTQm2heN61/ff69/JhNDRkvadYvnMH4VEY8fgP/Dg5Aifaf7lngJJpVyxlcp26iVJcLw==@vger.kernel.org
X-Gm-Message-State: AFuF++kt+V0bBDDKuyyU6B4DU7VmWNmBym7TXeZV+68Dum279wrD/d5a
	4ucuu0ih+UhLXJsvhW3XlL1gH0LmH+9wGXQvCMf6Usyb+vUNrs6AhBqXIRQqGtwQO2Q0CB7DlGp
	+GQqSTiY=
X-Gm-Gg: AYBFou2Xvpt1lKaJmw0qEdLNCUShdxE50GAf9+IJdvYKdaEvenYSIjJrh7iv9tcneEY
	lgSZ54iyw4lx9ph2f1Yz7ONvMj82BlXw7tjvmm82l7ejNwAUUw+daGqbquE2LaUPJUyDj6A1HjH
	sytms8AbjSPcVhPrXfZvK4tRr/IYBei9SoVpAfXpHVxTbDZH6qdS5FhI2e/BOryy1QlV+a7xmez
	HIiMwbczHAg1diPl3sL+WwZpMWURszciSi3rf9wyHwTyG+dRCnHm1NZhDy7FXI+TMmsbAScQbPa
	kCBOyKwPNWtjMx6ZcGRkrQLOucipGC+Bo1KcuaVFQdmrO06PvBWoI4HmB0dXE0AGwNfoIZVF1Eq
	69naQ04SZBs3W/9PFJEXLMgztc5C77T9CX5hZwAeJMXYTq0/kIuvtQ+0wgmJ9xogcvqbhwrCwS1
	RaTFetWmFPImTY3wDAyOyy8vd2ix6yLZ2xxaULYjPtlaCE+rOU+jADv6s+8ItOmevShvbgU+OIN
	FwKNq3DR+m9/WwrEqA86uSze5zcg3OWQrB6RERbfzViKD+5d3+ozpjtVA==
X-Received: by 2002:a05:701b:2616:b0:144:edc5:32d5 with SMTP id a92af1059eb24-146cfec8ddcmr8983096c88.22.1790605882718;
        Mon, 28 Sep 2026 07:31:22 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad9e097fsm28616577c88.13.2026.09.28.07.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:31:21 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: lollipopkit <a@lolli.tech>
Cc: Pavel Begunkov <asml.silence@gmail.com>, 
 Willem de Bruijn <willemb@google.com>, io-uring@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20260927074206.65427-1-a@lolli.tech>
References: <20260927074206.65427-1-a@lolli.tech>
Subject: Re: [PATCH] io_uring/cmd_net: end TX_TIMESTAMP multishot when the
 CQ is full
Message-Id: <179060588158.984285.6234217255544312653.b4-ty@b4>
Date: Mon, 28 Sep 2026 08:31:21 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sun, 27 Sep 2026 15:42:06 +0800, lollipopkit wrote:
> SOCKET_URING_OP_TX_TIMESTAMP arms an EPOLLERR apoll multishot and, on
> each error queue edge, posts one 32 byte aux CQE per timestamp skb. Aux
> CQEs have no overflow backing, so io_uring_cmd_post_mshot_cqe32() fails
> once the CQ ring is full. The loop then stops, splices the unprocessed
> skbs back onto sk_error_queue and returns -EAGAIN.
> 
> -EAGAIN is IOU_RETRY, so the request goes idle until the next poll
> event. io_arm_apoll() forces EPOLLET and draining the CQ does not re-run
> the command, so the spliced-back timestamps stay queued until an
> unrelated later timestamp produces a new edge.
> 
> [...]

Applied, thanks!

[1/1] io_uring/cmd_net: end TX_TIMESTAMP multishot when the CQ is full
      commit: 3a3d93070c5ec8b8049d57025987ba313420bda9

Best regards,
-- 
Jens Axboe



