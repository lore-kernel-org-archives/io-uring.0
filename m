Received: from mail-dy2-f33.google.com (mail-dy2-f33.google.com [74.125.229.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CA24B04A8
	for <io-uring@vger.kernel.org>; Mon,  5 Oct 2026 14:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791211618; cv=none; b=V7y43ZGwCCpOqdhTXRFASw3N8nPc9wvKWCsfzKkqtWcQr0HrFFRuSwgOv33BdAhpqHmjKkUDnmxH3myExMnHW0p5fdGpIFz4QTSVQ55RGCn1z4VOo+cQNyotvGOhR8X3jZKHw6lRMtYqNcrHnCeknPo6sv76PLh55OrlRVn6iXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791211618; c=relaxed/simple;
	bh=ynAEzLdtQD9QIuAPiRtXWY1a7bXi2WLqZA+RsZ++oOM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gS5tQFDLbqen4g3EnM9zp6m2OphguHek1iJidLrqGjemJi93rKDIg/LukOpMZN6EHmvrkkKiZtdfd2s7RoVi428qb7n/XFMv5akZtLpQhinvfW0KnG4vIDEm1O6mPiUzaz0YaxAFSh/p0Wua6J0p91MM3jEcGuEJrakYvAdlWqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=zYaq8vbC; arc=none smtp.client-ip=74.125.229.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="zYaq8vbC"
Received: by mail-dy2-f33.google.com with SMTP id 5a478bee46e88-3510f6f130bso1446629eec.3
        for <io-uring@vger.kernel.org>; Mon, 05 Oct 2026 07:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791211610; x=1791816410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qc5tnyfqhwyuYc0zbn9puWXzyBf9gY81e7x2p+mb3p4=;
        b=zYaq8vbCOmzVSuVDaTQTL7Eq1nzB2kbfHLGkiMItbaqPx/FwbAybBB3ZuuJOgYlP5B
         /5lmg0AapalqoWqZNBlnTqlO7W6aXzCGoPDlB1FiuzBdDgF6Lt0kH7O0VqCklWMkDk0r
         fT+gTQxTLFakdCugC2MBGKUOdVih4hCw5RYwKCA7bO892Z2TX5EMSL3ftBqg+B8Kt/y5
         eA9xclvPM5VJ3FA2PCoYWXxBFAJrDvORA4GeaqGxryzgxMUn//UgsGlW6gV+TBW1/3Ct
         ylJWw8mx4jOETBOBcsvFkrbL6dvCl6F+QMBVmsZ9h9Wo8jjrwdEXvsPDIsU1MbFFs4pZ
         WAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791211610; x=1791816410;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qc5tnyfqhwyuYc0zbn9puWXzyBf9gY81e7x2p+mb3p4=;
        b=ZbFRzyKu3fbNLVbHgP/KwW4zS233LALA5HWBiRXcTzDSBRtJdl31FR601fcF/o6ziH
         Kwj1CCc6SkfV3d+M6kkEeMsvCUYjsDYjDeB26VKfNJcmo9PF7+hlsRcBzUW8muJZkQpD
         7W6zZz+lhchfPnN6WwTtgGfb1r91o8IaKuyTbYtqcPPG2D7y+rHygTuMEJmv4525F9ud
         7Y6+Z4B4fd2Xn3emlpCS2puxGCALqC+CVDaoXS4volCFaCrxcMQOyw3qq6iS5pS0p2HK
         vJmzSIHz51LlJGaJ5fxTo6MxRa6D8PRXLXBHfhVDgCiK6FMJwUAnknk31XG0GPP82TaP
         A6JA==
X-Forwarded-Encrypted: i=1; AKwUvBw1MuJikl/lihvT9B+hVTlWVX2m7szHZhRWQwSHD8kZqdhhcyQHREXAOZYVxLtGWZSS+VNllHdsyQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJLEyrPaYjLAeLIpK9Vav3WoXys/m5XmHp/BCE0XTVbnAlYbPJw
	w95EHQv0ssnUu4fHE1GIc566zMsZMV2ANRE2SPke3TeN+Zh8DACzVMwqdgIc1BPSRJc=
X-Gm-Gg: AYBFou3Kt4FAEs9qDcx4pkFk1ulh6rI4gaK/lfwLz8MDSHP0ryK1eBFAaiV9ugerSGc
	F95xxfzQDqvmsOeQZ7UiOfIMrjAYpTgQPpC8YFFe49CFWsSk/7dboQD/r4VYvXHQov4lnMZMvST
	91rivPVlIT4/fSVVDb/Cq3X4XRj37fOjQCjru7mJTJkEusKvVmfQGmFjNQd88tXuvdOfn1C9OD3
	N0TGKKzLzfsQnBia+vpZ20xnJCS3EMHjflGr/OEIsdFkFM02056xzhkEdJwbKrMMDOM/KZ050yu
	Hlbfcp48Dec0pFgr944AsH6Bn8Gj+cAbSNjBsQdu7Fdys/nIv1ENiFamVNXWrmhI9I3huy25iKc
	Oa4bBwtd9ORuLwmXEw4PSfrti+sPweF9VBboQtGx3JVCsXlLGvL5HsKWQRpS9Og2qZYDth1hsBM
	b29thenTTvy50Ky2uHmEF8KuhZDTQbL7uvUE0pPRYszEuKAqkEwA4dLHmFMnSV/MP9X55+3B7zj
	TdcUXs5St9V65jG2y84AkwhdF87LnN44tThc7BdN3FKy2+CoNBpmdDykw==
X-Received: by 2002:a05:693c:8804:20b0:351:202c:c7a5 with SMTP id 5a478bee46e88-351202cdc40mr6116906eec.0.1791211609465;
        Mon, 05 Oct 2026 07:46:49 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351273aaed6sm16799372eec.29.2026.10.05.07.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 07:46:48 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
Cc: Anuj Gupta <anuj20.g@samsung.com>, io-uring@vger.kernel.org
In-Reply-To: <20261005141954.1353351-1-hch@lst.de>
References: <20261005141954.1353351-1-hch@lst.de>
Subject: Re: minor cleanups around IORING_RW_ATTR_FLAG_PI
Message-Id: <179121160864.33635.15865148233260424013.b4-ty@b4>
Date: Mon, 05 Oct 2026 08:46:48 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Mon, 05 Oct 2026 16:19:42 +0200, Christoph Hellwig wrote:
> this series has two little cleanups around IORING_RW_ATTR_FLAG_PI
> handling.
> 
> Diffstat:
>  include/uapi/linux/io_uring.h |   15 ++++++++-------
>  io_uring/rw.c                 |   20 +++++++-------------
>  2 files changed, 15 insertions(+), 20 deletions(-)
> 
> [...]

Applied, thanks!

[1/2] io_uring: cleanup __io_prep_rw
      commit: 7e3d3ed4c2e9e6c6aaf2be44f9651ae6d54cbf92
[2/2] io_uring: cleanup the io_uring_attr_pi definition
      commit: 37c3cab82dd6d3d315dc76d0eeeefdbc97a75f92

Best regards,
-- 
Jens Axboe



