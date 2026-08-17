Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C513A8747
	for <io-uring@vger.kernel.org>; Mon, 17 Aug 2026 18:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786990955; cv=none; b=qSypmnV+PIc7o3EAMaf9zdxCRJ8Er6U/l63neUXI/NLNmNqOxtDHIv27E7u+wrQJFcVNpryRthpjj8i5jwFoqQqZXWawq2RLb9N9G4Xog5YsL5/M6use2gP89W+JSlD0mHXgl1fTiMJExYa3tSLtiahpLy38s72AFWJNbhl0Bd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786990955; c=relaxed/simple;
	bh=mEwyIhf4fHxStvWiRuLK6jlKpmk90wun6bWSJ+wSYbE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EVGWfdwqrVIB/CuEh0sM2a1ddMweSdxfCsrFaxvFx6ZwYpOIiLlRlyOXLxRchGFHAcDrC6i6NuVXQUzy4Zeo546ipkvJ5X8XEpbPqgPbfK+O5ppDVkUvvrZHaJxnSSv3+26GOill4p3mUGQCv685qH+QuwxPXKgpNFAp7QfdtGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=j1favINr; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="j1favINr"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7e9ecb1e13cso3716669a34.3
        for <io-uring@vger.kernel.org>; Mon, 17 Aug 2026 11:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1786990948; x=1787595748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a609jsIH11q7QddM1Rl43b89b7a3MQ3DoqcOI+aK73c=;
        b=j1favINrPUAHdNjvD4XnCqB+999WY4YkLCecQd4ehT5jkod6N0QEvWYTXM8QC+877w
         76PcmOZLxWjsIKp3sljDh8Yt1Sps/3/7MzyX8OfWWjQ1XtDbir5WPQpJFqy0Z7+G940/
         AviZPHcHCjPnFCismOHjoM2af2+tbk/uh1BZlQZeXXnJErJ0fS2FPy0g0pwBMBS2eDY2
         WBN55mqpiC9p25dlJf/47C2Leh0nqRmmt5bdnd3NZCGOLm/X7poPydO3osi32qi6Mi/T
         07sM7Ne7eqU8uEOCkIxBxIZJtyfwFB9/3DczeMcgq4kWxm2awuNVSecH0ugQlRe1EsRd
         nz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786990948; x=1787595748;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a609jsIH11q7QddM1Rl43b89b7a3MQ3DoqcOI+aK73c=;
        b=j4AXcgmLYfTS4DcU9hFvnPKRFIs7xcaWOBiLSmsvfhhGXa2LoHo52UEm3fOT9sMVZk
         cfgy+pxFzv1Iid2024IdsKvi1uP7PqZvEdvkqJ2e7FbjcxSJakX7wXiusvuO4kYnqJkv
         FcX0Vm9RhZH4A+YpWILoW2cZeKcrzo7IUwqdPhq2sW0kdxkBQKCJ/1xKcqc8ARAMHM/Q
         Yy70FJfSnvf78NWf/wjy/c4cRQHiMfxvMv4fxgIS7juGuZNx52MjCSnRZu6gvmTjDBzf
         dmAvU2nYysAMCwvEpWUwgjoyhp9nEz9QHtEuAmvJ6rjsyC0HTlxXAXzSNqHhgrBOtgHN
         BRfQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr9FfPVEJyv4GQ7/QROxIiDTRuZps7Rk4I7AEjECAyM5AOckHzGG0TviHzr9A8KwHX9pGA6BBLFQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4iCw6VGdNNqYbl+tlIGbFwU1VnZOXasPtyyWtY9m/px96MZCA
	FPu4pO2qptIGvkEqp9xGcvpKbC2tYuJj1bH8Ox3iEbP7S5rtIaDr6Q3BB8lfYy/In0OVxqUb44d
	EdeJ1n/53lA==
X-Gm-Gg: AR+sD13HsxNG7waFDJgbyAo26PGsf49VHoo7P7VS5653lVI3VPzy27zmTCPHnGmv83Y
	L8W0XQmylH8U5OWOtoyNhdBYOpxPkMLVnhcWSn2xnYag/YWbHQM3R52KCXimVhM5dweSf6AKTGF
	0sZXs17q+5sLsPP1K6qNSXNJAjrsOXajc39JOwkZKPMfS45rzC7eBglL2D0IqVk50uGolCpsm+3
	0UyI34DY2sfm30kE2hBG9FjwB2d1bipNWyIuQ7OX6wwR1NyIVThIcMYxLKDWgoaVEofzO5c+QCa
	BrhK4t3upDJRNXGQmOmMgaa/aZrfLRiY7pWQYuu1QBpWPk1r8p4XEdOj5MQnK7yZnx4XcAweG9O
	g4tAEMQPbQYmVorXDx/qeFeU+e/QQ1c/8ibOQEtoXugw5s/86+edwIgJsMvYCK4N1HHAT6+4+jr
	cXKjTZfRE2JyvSdmLhXbD6LanpxsTADSYlXzaePUhwSi1XR5e6YpO0n4gc1kMJE4r72WFc04YO+
	oMZRSTFrCLghIpsC1ey8NcCnG5eUmzzIoyGU9lC2Q==
X-Received: by 2002:a05:6830:6ad3:b0:7e9:df18:c53a with SMTP id 46e09a7af769-7f3de7fe78bmr28323235a34.14.1786990948591;
        Mon, 17 Aug 2026 11:22:28 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f41c0b6c50sm1987282a34.18.2026.08.17.11.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 11:22:27 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
Cc: Damien Le Moal <dlemoal@kernel.org>, io-uring@vger.kernel.org
In-Reply-To: <20260817082837.762276-2-hch@lst.de>
References: <20260817082837.762276-2-hch@lst.de>
Subject: Re: [PATCH 1/5] configure: shorten the message for the discard
 command
Message-Id: <178699094701.2982107.15892124818004029047.b4-ty@b4>
Date: Mon, 17 Aug 2026 12:22:27 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Mon, 17 Aug 2026 10:28:28 +0200, Christoph Hellwig wrote:
> The current message is pretty long, drop the redundant io_uring.
> This aligns it with the soon to be added zone_reset_all message.

Applied, thanks!

[1/5] configure: shorten the message for the discard command
      commit: 16390826c1ffe9e989c4b8e922d8aeec30cbe030
[2/5] man: fixups for io_uring_prep_cmd_discard.3
      commit: 96980531859b99fc21feda893c49750879e8c6c1
[3/5] liburing: add io_uring_prep_cmd_zone_reset
      commit: fae20287f440d59b12a1626ef9d7dc15f7764933
[4/5] man: add io_uring_prep_cmd_zone_reset_all.3 man page
      commit: 9d179918fcd060494c680f42eba525e9c656e766
[5/5] test: add zone_reset_all command test
      commit: 6bfe0f9180f95d23b0c7e9724d2d0c84972141a4

Best regards,
-- 
Jens Axboe



