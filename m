Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793270620;
	b=ni8fcJYWZtt0CM+O7CSQEITO2YcXaRdTGwk5fLltupPtMYRoSF1VOhF5ajTiuuLQkuVt
	 KsqlFKxKXP3C/o6Su5L4+chRlZCiIpx0lx2TcytLgn7jgpt6vP6Tkr0hc1VMF7kFMRAmX
	 qQ8xSFXMcxQDPO4kjaITp7MEStCTSL0p45iOdA0mgxMI5y6VQqBYC4TslpH7NpA11YaTk
	 MdooKoCumTb3nlYHUm6MDV6OTY671lWGkuyNtMDaGVUZySCiTOtGW1lk0WIMCWpiBis2q
	 QXy3HjXy0qIRmONjn5XOAsIyMCCAYPG9kY4Ouem6xt/6sZgOGCKu/gQ9Heku9/P5YxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=6XOKkfJsefWjpOEYol68Fomb3WNK9nIfoprYMh5LhYo=;
	b=hBA+dPHVbcw3oWx6uAK13aVv3iErg1P5QC/flHWZWeVxnEfKh/VlxjBgA5jdajoPiclB
	 Fpfcz4wCPDXvuGZoyQEj6knxudhPUsa5bTKS9RUk6svxrbaMzePu70g7raz917faT7qUg
	 +3+EmFJumQpF9picTT177NQYI2c2DSXDKjc5hpUjNHN7LuJWLsYiyzZodBg1QdRrPtb/V
	 TC7UXJ6o4KrefzvB82Oufjjgw3PvDP2wtSHw4O1+cfepwfkDQyX9slLlcfFGmqdm8tLvj
	 4g9hC5JS/MfZYN1cT7bjtIXJpSrQJ3ngaBIHdXWAjyeDlZP2sjPxQE5ynRjtTcNlyNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L10ktrJK;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E56F606A31D
	for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 10:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E56F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L10ktrJK
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso17388925e9.3
        for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 03:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793270619; x=1793875419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6XOKkfJsefWjpOEYol68Fomb3WNK9nIfoprYMh5LhYo=;
        b=L10ktrJKN6okWgDge9N56XwZKPL8WktAO6uHm2Zk/4dFNgy1RlGz0BVhY52Xst5U9V
         EdqBZiljHAwu2Dh/bcfZmpppX9dE2UIE/2/Ul73rHShJ3uM7B/g6jgCByyv1SNBs7cHE
         Oz31XCk3LctSXwGXUIf+k2I04vJmTDdR4Qf8YRVS4wlnw0UnRiP2IaA4llb41qNy/YTq
         kDHpWKwB29pV8DFndNNN3V/UrutXwUwgbFM2r1cNSgwwpAW5nUReonMXawoNs0fO+EVw
         580HcoCstQbN/XHS3Fun17diEkCODOdjRJKn2VhsNUl2Ad5IBgBKGPJZLASyIDhnfAbq
         QnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270619; x=1793875419;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6XOKkfJsefWjpOEYol68Fomb3WNK9nIfoprYMh5LhYo=;
        b=NON7smfdVi+1hCDw95S+9LsNj2ud50Jd3vuTL79I2/09k7Vy1QrwBLrssCJbqWDjqx
         ErsTu/Fsd1sjd5B+y6WKJ1ggR4NVLB4bOqjVNeAw0+RUGvVU829paFJlf2YuFiKPJ1I3
         ZGR4TC4uCZ7oi1WDqOo+shQE33tJ2rXAIQdzJTr4b8u0fB0IryIOJtj/npnQ6N4/gk2y
         +n24UJbND2NAVCt+p44dB26kP0ZksK/vlGLn8kXJ7N2AZEBb2Q0tCvcs+NG6fUcg8wKB
         +oAI5zFmhuX0PTvtxGOcRIpCk2AlyZ968XXVZSPlzur8X/VhMEeu9mjG/fMf+7ikD237
         i2NA==
X-Gm-Message-State: AFq9FYLol+poAMAJPON1p+qzlyqdIxNLGw9ww5xt6mVHhRH+4rpb3vf1
	ACG933UDWyjIqQQ3TOCiu8zc1Oo5vHvIJ2mbcWAigfjmfiWZfFg7FTxj
X-Gm-Gg: AYBFou3KAmodfQ/6TK5xUCdXaj8l3IKVnl5twO2vSEEAu5iojD9gIZLlR4nOM7aZjYg
	Bdg1In9WW1ci/O9iRdcQ1PUQJdQ8Yf1dW36bx7EoCYq9AVa0yC2UcjaJLvbRiZ5I9BvbqNnGNiY
	0McZ7HGvm5iuAAsbesdpCWXNGx7EjXFeOR82NDlQnrKHnVx/6Bs7O/ayRf4Sk3WOEp0IFsEIXkU
	QYsdr5Xacpnq8y8t4Lu6Ncn4SJ427ZBgD0qcryFYQBJFvAhcJsMv7xDK/KO3AiR5FN0UN0keeI2
	4N/YkkXFeYCPBT+6LKWnvd6U4kkyveHv2ETSLEJpZrPayXSzh4E3a8ZpFgJSTczV3bmjW3gVRVU
	ULcxtVucRFFbCb22XpEehFerqoIMUjeqPmNwtj5/IqtdMmS2sBEmUtGv4chYaFgeQR4x1g48pbg
	ZMcUJ5NsQV/KEw1VWnd4nbAM6Lwvqv26DVoUtNt3Q4MLuYtZcQEXKhOgegGY1OPwRQf/Q66wpwB
	3fJKAU+hjEdD+5SFhJ3YOvSwbt9RNbxuhIBB8f061R8jcIIZW62C7P2GMvWij2TZb5J8fJusc9v
	p1rY902rAeEIP8MTcZiOcMEkkFXBjRErvoitz5OlBN9NFp+lUxR3R+pqB0RUHPg5p9jtH9dJeUh
	Vm7wHFvsaF5AsXWir6rJG6ZNuvuYPmczetgjXfEA1FlfX9c+JWb09NiGSlv3RgyOML7LGMeWkSi
	5Z5w==
X-Received: by 2002:a05:600c:34cc:b0:4a1:fa33:441a with SMTP id 5b1f17b1804b1-4a963ffc267mr124682955e9.2.1793270618838;
        Thu, 29 Oct 2026 03:43:38 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f629d5fsm47165475e9.3.2026.10.29.03.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 03:43:38 -0700 (PDT)
Message-ID: <e6b98a2e-a9da-406e-8969-3eb73b6d71b5@gmail.com>
Date: Thu, 29 Oct 2026 10:43:39 +0000
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] io_uring/uring_cmd: add import flags to
 io_uring_cmd_import_fixed()
To: Anuj Gupta <anuj1072538@gmail.com>, axboe@kernel.dk, kbusch@kernel.org,
 hch@lst.de, sagi@grimberg.me, James.Bottomley@HansenPartnership.com,
 mkp@kernel.org, bernd@bsbernd.com, joannelkoong@gmail.com, miklos@szeredi.hu
Cc: io-uring@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 fuse-devel@lists.linux.dev, joshi.k@samsung.com, anuj20.g@samsung.com
References: <20261022144501.2478417-1-anuj1072538@gmail.com>
 <20261022144501.2478417-3-anuj1072538@gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261022144501.2478417-3-anuj1072538@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 15:44, Anuj Gupta wrote:
> From: Anuj Gupta <anuj20.g@samsung.com>
> 
> Add an import flags argument to io_uring_cmd_import_fixed(), so callers
> can opt in to buffer types they support. No flags are defined yet, and
> all callers pass 0.
> 
> No functional change.

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

-- 
Pavel Begunkov

