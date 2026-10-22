Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792682848;
	b=Ibcc9ZPM6vwMJ3VOdaFLbvepjj6Zq1ccJjR/1FyAPjw4WmcBxKCJjaW9HpnW9tdPJLs6
	 +I+E9jS8I/H2Fi2QPQY2bcGOLIL/BSsZoStp7+vce96mP+yUkTzp+fXVj+wHrK9BmD5L8
	 S2bA4w3pxPfqX0bfwZFovL1IaFqs3QjzSa5HXr4fj2kZ57wJAxyK+ilv17QtyuU5MJwgw
	 Jjp/WDhPRmSRjbY//Wfg9xnmE+86S2JxIdORMMEqXYlxEtpEfcweeuGQBUlojuF05mMoS
	 msGO9Ci/kKB27j+1QHv8aILY7T4WRyMf6wxn/I5ritwgr7/STp1moPdvI8pLYteMzJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792682848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=FXOE4N6n0/t2DcXYw4BhESic6bUh9806SUYcFnKtZVk=;
	b=T5Loropxqtem2orZ+dUK5WY8WOx2Dr6XqKfyR5iwoIjJSPEEOb+Epia0PJaoPyb1qNBr
	 IP5yuP79bFqVMb6yM+SciS2TrEocI+RwdMKmPNY6pFnO56wLJb8VU3oM5Rxp45OXmMa7y
	 Ult10PMFZQrlZiNrwyHG1kkn7puJ8TBmlMfde/2Rvdefrd4Nd9K2EWX0CFiGyo/ZUD3QD
	 ZYIFrFjhYII92dkIu76QXfgzCO0QN2yTJAE1Ufu4yhRdTFu/n8G1NF9qsVtC/Ai3w9WCq
	 /taO1m1lYSN70tiQONY3d1t12MJslZnvonSG6f3s6YtJ+v8uV1s8MR0sJGSMFKsQW6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=M8kHz8Wn;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650ED606A319
	for <io-uring@vger.kernel.org>; Thu, 22 Oct 2026 15:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 650ED606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=M8kHz8Wn
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-825b40f8a26so1105998a34.1
        for <io-uring@vger.kernel.org>; Thu, 22 Oct 2026 08:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792682846; x=1793287646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FXOE4N6n0/t2DcXYw4BhESic6bUh9806SUYcFnKtZVk=;
        b=M8kHz8WnpuM1sfJlZ58r/lWloNo5cChvhLL1NURcp/swz1Iy5czMzAmSkLdbu4EpvN
         fwyx3JnisAlRWkcF2Cp8Q0VYe8rATfaMO55BA055Xz6HuIq2ixvcwKS6sTSOL6TP7TZ0
         WbvbX5LVIVll3W63+c6voVqom1O6pTIhuF7LHWsvbIipMYbSMYofRo/ROi7Un5dRi63l
         iS4mNLIR5q7mgv3hL4f6+Ar57Vhb2a4BXXq8Ex7/2efsW8POkKMTqhitMX7XYZQbR4Ab
         PLDEHorF2qDQ94TGRLcfEGbUVBEqA3AjffVFxRnG+js+2IhyK/PxySFYkHE7FepeIiy4
         oj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792682846; x=1793287646;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FXOE4N6n0/t2DcXYw4BhESic6bUh9806SUYcFnKtZVk=;
        b=pVKCH/6Pq5Ioh0ONwslUBdhSYtH8YaWw4g+1CcQ36w8Dac515UpuCRXxP7z72dpurH
         i7JG7xBF+UNZ51LS6Yy16130bHzdTx7+ibum7eQnJlIS/RixHnIJkkSEWkBUGY6clOzO
         t+N0QHQzT5wCjmvLSOP28+m/sV4kmLx/wJuAUUv6ZerNA5XwvicdGJ8rs48EI5RqCg1c
         6hx8p2ApS6MjVFj0WFNe73ulGs0phHBeytUrB/yQk3KE3vuvUIS0aJRn97pznvzblOj6
         KRMRJN862N33FjC6PPNjlvEyzgXr9qiTJ5sK2Yrng9ELP8WVVYYnfx1v0FcOR9S/6NcP
         5GPw==
X-Gm-Message-State: AFq9FYL5E0d2HJMFY4SkQa0SDgcrXshYcod7zf6dF7xo210Vkg7lvtXj
	fGvK2AqngdIqMcX851FagYHl5GhGLJxGnFkuMWCWt7WgbChf5zJ/D7+R0+3DA05ns8Y=
X-Gm-Gg: AYBFou0LXtQzYtm/0yexvMCUXYQHXRfvfqJYtFk8Cnp6TmpfqgnLnytyJ75Rl03ehK+
	JNu//lPQlLvji9GeT8VshFdIM69FoZoXLZmk00/qu3skOun5w16JFxXdoCYSSMJUePaZgPRdyUx
	7popMtOdbYWOGTqniqRpREnscAqKNxwqSsBxq0zvaDRT+psHdf/xm4frbl4dtFx9VIq57DYsNLO
	NEkNfKKYbjeqGnbc4PTcSlDbuXt6vx7RzDzfZWKH0AAK9117iIwFpRTA3NE3J8nlTpAwVRlqxU9
	ntwYq1z6GXDeVB9vFHaZ10omj8a5HYFwFYw+BIWBlFSEid3pUszmRD3AAUdZfTTMYo5Xs/1xlkY
	QAWUg2HkhpVqB2gUh8Unv1A2rBqK1R3LcFioVI0Wh08LBPIsInlaES8MPumffZWIHiZrvl2sO86
	I6r60eTa/jm0VDYjEukfB4vbTGGKbrNoTnHMM2ae4TVkDudDnhpz1Ud8n0ZoVF0YmcX+l5A4iHP
	9wbbL/BUWnC3e4ohcd/OjGSSD7hZoqtEq2hC351188j1uRQ85uEdeLfvJYaYtE4LTyV8h4ppM/2
	4nveAIanHIqy/UYxvxF1pQXTrYHFndJ9yBvwV2SwDFryglgDFdQFRt95FQ==
X-Received: by 2002:a05:6830:6f85:b0:81c:ebf4:9ff8 with SMTP id 46e09a7af769-84d09218548mr4684807a34.30.1792682846415;
        Thu, 22 Oct 2026 08:27:26 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84f7752df06sm20431a34.13.2026.10.22.08.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:27:25 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Pavel Begunkov <asml.silence@gmail.com>, Christoph Hellwig <hch@lst.de>, 
 Anuj Gupta <anuj1072538@gmail.com>
Cc: io-uring@vger.kernel.org, Anuj Gupta <anuj20.g@samsung.com>
In-Reply-To: <20261022132027.2293931-1-anuj1072538@gmail.com>
References: <20261022132027.2293931-1-anuj1072538@gmail.com>
Subject: Re: [PATCH] io_uring/dma-buf: don't fail fixed buffers without
 dma-buf support
Message-Id: <179268284528.3895788.1637304833081345361.b4-ty@b4>
Date: Thu, 22 Oct 2026 09:27:25 -0600
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


On Thu, 22 Oct 2026 18:50:27 +0530, Anuj Gupta wrote:
> io_attach_dmabuf_map() is called for every fixed read/write, but returns
> -EOPNOTSUPP when CONFIG_DMA_SHARED_BUFFER is disabled before checking
> whether the request uses a dma-buf at all. So READ_FIXED and WRITE_FIXED
> fail for ordinary registered buffers. Check REQ_F_DMABUF first.

Applied, thanks!

[1/1] io_uring/dma-buf: don't fail fixed buffers without dma-buf support
      commit: 45b716456dd99488a0cef58482120dc0474aa696

Best regards,
-- 
Jens Axboe



