Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E1A2F25F3
	for <io-uring@vger.kernel.org>; Fri, 17 Jul 2026 17:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784307955; cv=none; b=eoidpHF/nfaA9JWf0Z320k9w8DbvPlFI61EdCfBTgZ/4b9HOkjqGPWBYU5uTjEw+nxWaHyHG7JceZ/aO51QHmYI/sAyF6rLMTn+GATUMP3kxGNcvSIa2S0FZ90l80fV1069l2joLrIk6/gOueJVVVp6OwEfjjICH5zWAbZyHjDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784307955; c=relaxed/simple;
	bh=Q/fKa/Fwoh4jA9zred/8z3EueNZoSfzRyYYkPt/AVng=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=g5SBASUszJLWkCeipX4T7/PjwBhna/jdlF+SgpHSnltX2mcDvZxMT6XN3TiFfzmZeRw/dRFxR3fVLIzdwXyKRI0s+eKz43kdoT6bw1kBYz8aLkahGtWILhALZ5IIUXBzBJ2jXdk7+FhIPBLL8SZBbcU2v4Ws95bzxmXSZfXRm70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=HEN3xAei; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="HEN3xAei"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7eb4d532e65so3081540a34.0
        for <io-uring@vger.kernel.org>; Fri, 17 Jul 2026 10:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1784307950; x=1784912750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b8I5WI5+T5DcLt3eSskdt1AQSIBgqqnsERlWCb+rDMQ=;
        b=HEN3xAei2NJCs4Nvesgz5NJ5rCzTW45f8fUJFghjYd/i3i2eqrpIY/Lt/0JoyELD0i
         14XfFz2TFxjxZUp/h/xvG+udn3isbJQIaKuWAmpZBY7YWSkBoCjzQlKfrAxf8zhQN7h3
         7plcN965Q7s1G4qOWFiNaFD7rg6dcACWCOflSE1kLKSMsXRh0JvfWxQgyDl5q6gKIStx
         +vbIGVD4CnM0FxA4LMVuMna/xRhYncWS1822iErQ6JwqJCbbrcgFRXtDlCyJiXeGvezv
         DyznrGGxeLzcfnwkDLukNO2FCSaX4BklxV5137lW/Om+jEaJGqEwAhwsdnxD5J9AmDYH
         hfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784307950; x=1784912750;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b8I5WI5+T5DcLt3eSskdt1AQSIBgqqnsERlWCb+rDMQ=;
        b=FVsN1Dlo84yhvqeJLf9aMwHqFFXUsdm0Hc/HCkQi8C1JAZmlSxxB8C6IPGRuIZdkCQ
         YvbIFc9w8JhdKp2L5ODxrRzET5uMxCFZWiedDr7843DOz/ZS6zi+04bwB8BBsnmFQxfM
         ywaa4pRhNpOFH0YmZgOjS19BpmxH67XZq2HO3HhcoqnFtBzJ7hjl8iVyAPWm79iPVr9y
         4f8xV96zWkyplRII6u9yatozC4appauy9NvDYrid8f+WwzfRJ8BZZkJi4mwBv92Gh2YM
         v+BJNjxm80AHNMIcxQXN4u4Q36ZxMSAZd5e6NWxJTDiqKxkLdsZGOYnuH+yxKVOG5Oae
         6Meg==
X-Gm-Message-State: AOJu0YxzE8H/bu/4mMBsgEUAHbV8IG2eJRl/bzJ7Sw+6b+bM3J8UaqmS
	i9KiuhJgtRbysZfm21yshO/1jpTCAKzOk4o/WGSzYkOJ276sBtwWMv6fM5AHLUccvoUdMgoFntz
	eR42sCJg=
X-Gm-Gg: AfdE7clR63qzkITF46RxLSg99i+1jfey3DyPrLgOxgtOU+TJMEKdwz4H/z8sbGSna12
	juoIAoxxLr8hBTi+PncoMSHMBF6qJwVxlDFo/MMZF34QJ3+Wff9lB9jcknwC0FEkSZnk975rLMM
	OR1/pcCsNtJBE+OzYL7LSMMPuknYEZdjNg55OWitb8X8QfvxposIM3B7PBcJBi0z/AkBd4fXMSt
	6nPY6xjWRJfY7UwZysEH1lJfMROK4iiPAM+vlOIPnzxPdz8gsXw7HYhELlFFn16h/I5VXqCG7QW
	pKBZCVLtieuoTjRmn5sMSbOZcmfXQPv+Mvn5S4U9pAAwGbAULHWAics0gK1SW+8ufjzp6LxZVbS
	xdL1l1DobdOGsdbDH5g/Dj/btkPiWFMSXDZ7bzvpLR1Yy2T6It0beymoH1b1qdyC+QGR4ycH5QD
	Tj9GdhVPPpQzSdHQq58tfvPXISdiVH4+YtW0UDMbBLOEFbtogThChPsw==
X-Received: by 2002:a05:6830:2b24:b0:7e6:f083:130e with SMTP id 46e09a7af769-7eda0700a0bmr1717085a34.4.1784307950344;
        Fri, 17 Jul 2026 10:05:50 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7edaf9f1076sm1630602a34.26.2026.07.17.10.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 10:05:49 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Pavel Begunkov <asml.silence@gmail.com>, 
 Woraphat Khiaodaeng <worapat.kd2@gmail.com>
Cc: io-uring@vger.kernel.org, security@kernel.org
In-Reply-To: <20260717154537.129736-1-worapat.kd2@gmail.com>
References: <20260717154537.129736-1-worapat.kd2@gmail.com>
Subject: Re: [PATCH] io_uring/bpf-ops: reject re-registration of an
 already-bound ops
Message-Id: <178430794942.612136.17341597926456772378.b4-ty@b4>
Date: Fri, 17 Jul 2026 11:05:49 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Fri, 17 Jul 2026 22:45:37 +0700, Woraphat Khiaodaeng wrote:
> io_install_bpf() only rejects a second registration on the ctx side
> (ctx->bpf_ops) and sets the per-map back-pointer ops->priv
> unconditionally. The struct_ops link path never advances a map past
> BPF_STRUCT_OPS_STATE_READY, so the same io_uring_bpf_ops map can be
> registered more than once, and bpf_io_reg() re-resolves the target ring
> via fget(ops->ring_fd) on every call. A caller can therefore point the
> same ring_fd at a different io_ring_ctx between two BPF_LINK_CREATE
> calls.
> 
> [...]

Applied, thanks!

[1/1] io_uring/bpf-ops: reject re-registration of an already-bound ops
      commit: 83d2280089bd45e5f782011275b5c7414d85cb2b

Best regards,
-- 
Jens Axboe



