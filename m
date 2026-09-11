Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD9249BD87
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141697; cv=none; b=pvvg5xn+tiAGycJW0SH7L6wfqQ9vwt+hftOKEBACEpiNyvTG6zmsTSMlXXq7w5uTpdbh3l7mVGsxbrryJLxXOJUdZ/SohU0bc7tZJmAbgO7MAgyb6kS8zXnHxUA/5jM4UzSjcb4N7FV10k5dZp5eKw04+JyolQX0ci76sA2CAOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141697; c=relaxed/simple;
	bh=h8UvNijHDei4W7OVAZ9wSOVbX6CTDc+9T2UTD3X77Zg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m9dyYnIcAqpFZC75aM/tDf7cyBdelmb2GvSNgPFqAzQBlXzS9w6/dqCEPByG24VpqmtxEmNJpt+WbnFBjMFucG48spazT8HRlh8iQ9ldjwu6PuDYZOi4IX28aFXrzE+GhT7sfA8PQsPL5T2xnJDf0t2MqRBoBgjqQDJXmlH5EMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=HO5Wk0YN; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="HO5Wk0YN"
Received: by mail-oo2-f42.google.com with SMTP id 006d021491bc7-6c197ff1f53so305484eaf.1
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141694; x=1789746494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FuoX0oXU3i7p/Bzl5apZzG4UGQo8EkGX2i7Id7LK66w=;
        b=HO5Wk0YN+OzSLvs03L7FHfG35Zr/QPQ6+JzpTcSCFy5LcvsdO2gNvVpspvkhyYPTij
         qkO800LqjHn+E/xdX0qklzFZDl8FeZ9JG/qNysgMk+9+pDZziotAiNbfvK0P10w4mJ+y
         h1E6FGopMFx42w5794KGx3LL/+Ha6dWl1/GGJO7qHA55ZWXzlE+q6XUkYeh2K+24if0N
         gVi0AYcPOQ0U2LOGL/lKLClHSFSVx4sepPoq+94QqGaoPT0AQgTttiAolY/YjT6h5Pxx
         4a41hxASscitHv2MxAqoogx1u0qyqfoBK4uIBeK46RP4N68DJ7f8hmA244B9jC6ecOKc
         09Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141694; x=1789746494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FuoX0oXU3i7p/Bzl5apZzG4UGQo8EkGX2i7Id7LK66w=;
        b=ZPbYY3A+hgV+JLnI3vtcerCfg6a+01hM+aUs7mpZQj2T+IVCjqcYPhG7fCYAIfD07G
         UPrL7zfjMdAISqaWGBxtkgrQfgbWgPAJg9r+xsMQ1spVThTkA6jaCkITW0c9VPRvBpsp
         Hgx7ebMh0QwR0SQmyOv9gjdT8B3lbehhhf51mAbmuxInq9z52HbHr3ejmY22v0GaM7/0
         9Lkzv8J08W4kGKbhugoEjI+zlXKeEBaKkoFwgOgYY2yiaGxlLYuuC41f3NJZ0gOttXOA
         bOMj6jeIZTQ7ySnf1X6qpsOEHU8inqGlRzJTW0bSawBd2Dt/DgjelOip9IVBzVm5M56E
         VwlQ==
X-Gm-Message-State: AFuF++mPjjAALCZdPzd6vwbLaTSKwCJeay9Jr37Oh7Evc9NEOVFCwjlJ
	gyvlCD7/5l+QmhzB6YLRxj/DqHVsEbAxH+MDcp3cGf2RE1lJLZjSInI9FXlIM+uNP8k2OTl0p7Z
	SSWKdYtM=
X-Gm-Gg: AYBFou0bhqmMPb7xV+xdBSeqtVu9mBdb1jNUH9MCIPmfTYaXmJfMgZj5jiafIaij2Md
	ofF8XFV5Dk+lZSWdwUDPGW90Avp0llYzNSE2cdoZzwisLMlGpSb4AHgNTVnvPr6XUeg6YJaiqNG
	oOfDIyTQ50c9WPDchAxfwIPBIFOVJGfvJXuoVY2RtYHmX5SPS2mKpAP4+QHZhtHJ8vIXZOwpxTV
	iPqUErxNjtoGHsBHiSz9FjtLEQP5S1V38dopLObFZ9iz3HYv+WDMxNeR+AA2R92S5nWdnCU17mL
	cxT8+g7RLUtoP1PLDVyX9aMN05Ygy8/zDMxTtbY/EMZG6fTioxKcUHvmsXFPM74bxJd59JXzBI6
	81kRd4ihO0uBUxSTgG7wk+72js14/LnBDb2aY/g+Dy2uRtdx5llXQOx+kKTHrVXsrC+Xes/Q9PQ
	HBjF2krFF4Xyj/fMqfr0fENFROFT5j/VRdBxGn8KFC6tPY9OgJq7B3P7mVOp7fYDZflvHJqPBSB
	kYTMQMErsg3fHP4zKx4QDM/0Hfd5IkmnzQbL8gQCdTy
X-Received: by 2002:a05:6820:1c88:b0:6b1:b375:481 with SMTP id 006d021491bc7-6c0b5df59aemr5519755eaf.0.1789141694280;
        Fri, 11 Sep 2026 08:48:14 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f6d1ca4bsm2629478a34.23.2026.09.11.08.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:48:13 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: juanlu@fastmail.com
Subject: [PATCHSET v2] Cancel requests at ring close time
Date: Fri, 11 Sep 2026 09:45:24 -0600
Message-ID: <20260911154811.646705-1-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

For v1, see here:

https://lore.kernel.org/io-uring/20260909141010.21064-1-axboe@kernel.dk/

And for the current tree, go here:

https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git/log/?h=io_uring-exit-cancel.7

Changes since v1:
- Reorder the series so the fixes for the current tree come first,
  then the exit/release cancelation changes on top
- Add fix for io-wq completions that finish asynchronously (eg a
  direct read completing via ->ki_complete), ensuring CQE posting and
  file putting are sane.
- Ditto for IOPOLL completions reaped from io_do_iopoll()
- Put request files synchronously before posting the CQEs in the batch
  flush, fixing an issue with SQPOLL.
- Don't clear REQ_F_REFCOUNT from the completion path, a linked timeout
  can still take a reference on the request until it's disarmed

-- 
Jens Axboe

