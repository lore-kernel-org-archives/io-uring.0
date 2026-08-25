Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D69E485CC3
	for <io-uring@vger.kernel.org>; Tue, 25 Aug 2026 18:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787681491; cv=none; b=Ik0JaoGV2VaWTb0bDvlVspMGR80QoxAApIiT5vim/mJHEuGRV1bOwECbNQ2A4bTYiV/Sim+xXEHJ5zyUxrfffCkXMf7cH2izN/umwqWro7q3mGsTvS4ABcbW0LKChF3byWmb4dQLg3OWo2Ii9PU+kXiPdoVGwXVyboWzB6vuwuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787681491; c=relaxed/simple;
	bh=8LTMiilxRKxEpRQ9qXa1k/tYlVZwEKVcRdEoec676P4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ap/bI5EhVL6lcfuuhLsjnPf+YBbWmULMZXmefY/7Ydfq9wvuQMtL7Oq4Ql8bkN9WyNPOeBgrXF2oLuxCtFOT5OZmKLgXuJHl20oVApbBeCZXEvdWKax6Kql4eyMN/ogJhwhc8h1grRb2i2om/7nQf5j1bGBeLsqUtgERazVU+SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=PRCOef1c; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="PRCOef1c"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e9f1f24cbcso148231a34.0
        for <io-uring@vger.kernel.org>; Tue, 25 Aug 2026 11:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1787681486; x=1788286286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVLGjH/4cRIyTeDl3IahVFbiHa8Lkd8VxiWt/wscO3s=;
        b=PRCOef1cOfILfVKM4TskCCFR974XmX4s1P6feqgZOsh1ovfTzrgVt9IQbazDEs/Xfw
         +uICZfU15VTGIYu13HhTxAfD6VsrBG8R1e5TBqQRMQOBzTwZhOwjNC9uCKwqiXIKCHVG
         MzJXe8xj3zy46F5nHduJGsqC4TSnvOc2hMk9Ql81/LVw3PujtHfCarGLVyqLq67EiPFz
         YN84fdtTj5jwuXPUzEW8bOxo9bTGiGeV5eHZrpKGNvE3mniLRs505gRGuKGpVTbXJ55i
         IBP3AQFt2ka5iYEYZVHQY66z+lZlzgDnLs83fWINRyKxX9OUfhOAZZzk1H5KYcphoAXN
         5o0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787681486; x=1788286286;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVLGjH/4cRIyTeDl3IahVFbiHa8Lkd8VxiWt/wscO3s=;
        b=iMbvL6Hvflr2NzAc4X1nhz+UA0HgInW7wMqmjvLDWIjTifLTfHXgkaoj98vaRbwHAZ
         jSCo2rntOksRfAOk5rhy6UVDvkaSgMHYHPtEaa7CJlYruYHXa+heSVD3Njj+CRSoQN8I
         yHxn6kZgfFYo/AVxULGYAL/3hqyAmCRRAf5U7geNnL5/yolFFzjxSy3XxYbwbCwpMgIz
         T3DQuD838+N3H4jX8UoQ7YqjxB8YviTwFzOBbBhsFEBXN0Fu2RkFcs5duRFyXYA1HrUq
         k+Ep5LceVLO4C9r2wZEr7uQdAVu0jOcA6kpJOXznFdenRsFObS7hzyCdcGpiRPF/u1vL
         NOVA==
X-Forwarded-Encrypted: i=1; AHgh+RrLXRKOiEDQoh1+tP9Wk31YSGXHz1n79f19txFn/tG+7byR0nVCdmrHxw5UnHdYmPaquQKEuNlP4g==@vger.kernel.org
X-Gm-Message-State: AFuF++kbHTsMT0AtUixxj6EdrL3olqRvvCH/b7W/wL18lEdLPI+gxv+X
	nj2Dh3qG0c0DFDQNuakCC5e1Y0vOrVnddsyM0iwtWCfVy+x5SA40p7LMAhRLOzIHg+F90YfsEWw
	rYbOcg64=
X-Gm-Gg: AR+sD10JNVHY+4IXIA/c6kHyygqG0MGJC/bdAeJvCeheASYolKgtZ/EOPr9ByZx5Dq9
	e7oOz5fYJa6FeD/YKv3qMv6QuN897uQfG/uVvxVZqIXDajXB/IPbrOMOaIq8QCtTx2DAD5i86sR
	ug8UobvXwuKsb7sT6i1HmCQg1J/Ph5SojtdsotbafE0WkvLP0uD91gFhYoaAvb8kuNH63919V3b
	9r5L8XtW3Ihf2aFkAd3Dwk/BvHOsSDSfAle7rmVRAGnh9JG8t6vTarHpgMtmEsnsrbXs67qkdmF
	kTduaCZkuvv1WPPwWxezrxSY6TuXBcS/iQKhuCulwsXX5IU+NSZA8aP6p2hAYHCLYhoHICjkng1
	/JMSiPsXwkKe6z32ReKgxHecsMMLFokoaoBrwIFHFM1TazlSiRSs92e+Yw64JG/b/TSB4CevZQn
	8Jl6To+YgM2SkjeDXT77H7QdQAsd3qgfjT43M4fc9IhUDleCLbze9pgBuSUsRABJ1FwLdONtZlL
	4xblZD13giolJcuVjzsJTo0i8m0UBL1IybhIQ1E
X-Received: by 2002:a05:6830:6ed0:b0:7f1:e04d:fc4e with SMTP id 46e09a7af769-7f4aebe8194mr6315769a34.2.1787681485832;
        Tue, 25 Aug 2026 11:11:25 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4c4424de5sm185250a34.17.2026.08.25.11.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 11:11:25 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Laxman Acharya <acharyalaxman8848@gmail.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260821103317.91437-1-acharyalaxman8848@gmail.com>
References: <20260821103317.91437-1-acharyalaxman8848@gmail.com>
Subject: Re: [PATCH] io_uring/query: cap user size passed to
 copy_struct_to_user
Message-Id: <178768148488.43624.9542937429211727465.b4-ty@b4>
Date: Tue, 25 Aug 2026 12:11:24 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Fri, 21 Aug 2026 16:18:17 +0545, Laxman Acharya wrote:
> io_handle_query_entry() clamps hdr.size for the inbound copy_from_user()
> but keeps the original user value as usize. copy_struct_to_user() uses
> that usize and, when it is larger than the kernel result, clear_user()s
> the trailing bytes.
> 
> As hdr.size is a __u32, a query can request nearly 4 GiB of zeroing,
> including on the error path where res_size stays 0. The interface is
> reachable without a ring via IORING_REGISTER_QUERY.
> 
> [...]

Applied, thanks!

[1/1] io_uring/query: cap user size passed to copy_struct_to_user
      commit: ba77efee1b95b4ad7559b1cdbe7cd7fa36dca95b

Best regards,
-- 
Jens Axboe



