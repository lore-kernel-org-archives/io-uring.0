Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2E133AD9C
	for <io-uring@vger.kernel.org>; Tue, 24 Feb 2026 18:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771958356; cv=none; b=REQON+UghG59jn+Raz3v4GrrsxqYrWXUPQGTBoZJVYzoidWoP6uWD6gLT6fj8uzyoUm0hf6cPbobKveV0ldRFkPOzmz6opHYwYV67m/CrCkWSJlhftzkVuVM3m6aDWYNCs+vhP70Qse16Bgut61zErro7Rptjh0kyhz9CHqatuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771958356; c=relaxed/simple;
	bh=f9tq7Z1kiO8tl0OTx6dfSejjWL7J59iylc9Ot2jqXZU=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=Mh78aQn+3h20NES5zzBEYUKYH/SJpdZmDVAFW8BmKWWkhYuxmp0yjdISzQ6IO3axS4zoobZ4rLFrwy8IKIO55tm6jpFq7N591sEd5tgknHvPOH0DktxPNGUQi9B0P5MOAuRmw2CVS7Wlp35LVF7rw+8yQiMPfZesZHqoYPdZA8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=eIG1meQc; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="eIG1meQc"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-463f00cda04so3480738b6e.2
        for <io-uring@vger.kernel.org>; Tue, 24 Feb 2026 10:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1771958353; x=1772563153; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBTDEJZp+82WEOKAWTqxON7yMT6y1QFNKvnkUneEv/s=;
        b=eIG1meQcZUZkZHgOfzt9h0kBASVUndiZoiSvC7kZ6GqYxu/NsEtWp2wCTx67YASHcY
         r9jtplvTBMp3huUAmk8TXNK6wmBbj9ikmnykF2Mo291Y9en4TtFYEM5Upc+XqxSlZKC3
         rf8qspZe5WR/WrfNTwP35vWh/UVKb3IXGvlXYdcN+UcYydztAfMUzz+nJHEz1kMNRpFY
         r/Mto9pdmCPe167bW4Z6HzU9NvKse0mg4QGx70pgRQ8u4WVH2Dg5l5VvIm6tKg0BGB/R
         zMmvtJD92qTs09dz7vjGA0PM2qxVtgV/fBcAp+/DHjWDOafah7D7m2WO73rgPyI9zKEo
         rjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771958353; x=1772563153;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NBTDEJZp+82WEOKAWTqxON7yMT6y1QFNKvnkUneEv/s=;
        b=N2J+TJBQpat/3kLjHVodtaEJlvNINcbaJ37vm0VkOCyH4DXJvV3Op2Uyr1A7kqTDqh
         EJ/2T8VYbFJ1ouwOzYRDl3llmvCP97Tu5PtSljmA+C24p3tHdiHZnsf3CQ8A+uXplyMH
         lR3cm3BSfoTHKm3xd1dP5aKRq7i9ihdPLil335QeHbCvP/R3hQZMilOhYU7V8T1kOhz7
         Gc8Fcv9ZZ41qZm0UJ6wELGZsw+YVG/mo+BEEVMc5+JH/J/IFruXOq8Hskf7PM0OPHz8N
         kuVS8EX67vrhBJL+JKziunUl4ntNnChGtWeaADoz7LkaSejHtHiUp/ZdGtd5ZPhgkMQB
         IR3A==
X-Gm-Message-State: AOJu0YwMWnWZu3Zas3UrGtSc6W5Qb9FyuOOTmXR/XHYaOQHpdixymt+6
	ZKMCihOsqt6N/zb3CbuNh911sThfDJglkUhWYX/An8qgDZcM05lglRH/XOCuqr32TSzo5DwKCVZ
	SxHN3
X-Gm-Gg: AZuq6aINigeuAv2OhkA9sutZkq3O3fdsUJb16OfcoX1PH+CkF9V+9oYPlD7fOOGvixM
	1X7s8nqIYpU3JzX/Vk4eKXzFrBn5b3q1kVWaA/H1xH8JGaAqq/7ij5y8IsJkJvLV6ld/FKCUolo
	rfM2attfFDIW2QoAMXyowUnDcmWCRMLDTa1RSJKfx7EcdGA/xoVmppNyV2HLcotJg08tUNMOTpj
	yaJ3ONdQN7N+tE+acbpN4XfpeGqT8/9qoWZBEe+RzV5yMCXXmR8fhvrsQojBc2qB4BY8fLGMfIe
	/qjVoiTG5gNsdSMkifBPBjsprqqn6RDlQJ2vN8eMT08mlX0fFIZPSJVTZ27fymTI1QrRUH1s8xa
	NA2y08QvDY9TY4wKcNDRahFVEAjTi4NLSbYtkfemgdeQ8e3goCdouyZl47MQWKLROOnBLQ7P4IU
	2vgXySoOcix1bxa8BQ3z8lPkAXcby6y80G8r2/wfLIRYpoiObXCtPDYTa0zU6tECBj4DvXQYwKF
	pZPtUs78Q==
X-Received: by 2002:a05:6870:a10c:b0:409:4a88:aa53 with SMTP id 586e51a60fabf-4157ac72fa2mr6420787fac.13.1771958353182;
        Tue, 24 Feb 2026 10:39:13 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4157cd55637sm10014489fac.3.2026.02.24.10.39.12
        for <io-uring@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 10:39:12 -0800 (PST)
Message-ID: <bf698d49-e7bc-4939-9778-3698a2f15db2@kernel.dk>
Date: Tue, 24 Feb 2026 11:39:12 -0700
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: io-uring <io-uring@vger.kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] io_uring/cmd_net: use READ_ONCE() for ->addr3 read
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Any SQE read should use READ_ONCE(), to ensure the result is read once
and only once. Doesn't really matter for this case, but it's better to
keep these 100% consistent and always use READ_ONCE() for the prep side
of SQE handling.

Fixes: 5d24321e4c15 ("io_uring: Introduce getsockname io_uring cmd")
Signed-off-by: Jens Axboe <axboe@kernel.dk>

---

diff --git a/io_uring/cmd_net.c b/io_uring/cmd_net.c
index 57ddaf874611..125a81c520a6 100644
--- a/io_uring/cmd_net.c
+++ b/io_uring/cmd_net.c
@@ -146,7 +146,7 @@ static int io_uring_cmd_getsockname(struct socket *sock,
 		return -EINVAL;
 
 	uaddr = u64_to_user_ptr(READ_ONCE(sqe->addr));
-	ulen = u64_to_user_ptr(sqe->addr3);
+	ulen = u64_to_user_ptr(READ_ONCE(sqe->addr3));
 	peer = READ_ONCE(sqe->optlen);
 	if (peer > 1)
 		return -EINVAL;

-- 
Jens Axboe

