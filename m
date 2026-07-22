Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1ECC8EB
	for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 13:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727442; cv=none; b=UfjEdqJF2Sk7eIf9tvCQfwkMigDFyVAhHBA5XZk93ZLInkzD8Eu4P5YsN/689I1yVQ1j9EDYcQ8bTGg9AYYOunRZMfQOEMZ84kHBaYKcCdFvh8jEPqZNy3niVF+iawVsczt8koSW+ydF41Tfv0Qlg1YUaxW3t/y7ovbrYOrDFtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727442; c=relaxed/simple;
	bh=B6DpiGoerm9m3DlKhnPY/JClD3wc4h1Lk9LkpF+0tDI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DDkSXMoebxw6YMKgFAoX76aK5EOutC92P4ARLV2l5qo2dKxtNx4bX8HHq2a8PjtTLMA0cC69fI7TWnBwvB3nCYa1IBqLxB5952KtUZpj09JTtGu+6ozSvHwmp3RRWBWrLv3BJMCPyIR/AySPH41+iXJ17sM8tVie/FWrqSXFAKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=TEILQjwN; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="TEILQjwN"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7e9f1f24cbcso3786545a34.0
        for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 06:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1784727440; x=1785332240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oAPdTlgSNacIapUcDKLSVpf/yIfFiTTXS9eHbffFj4s=;
        b=TEILQjwNrOiZHReGbFT9eY7JC4sY5CYfws1tnvEipU34pwlKjszYb6L2BpaGAzajeA
         38d2EP5W79rqRC0vYtNCzLz7Ov9LcWuEgVIBC9qCJRXR5zZubWI3N2AcqzCBv1e+bsef
         UQXUIgoK9AQ/N9J3jwmnm7ZUcxrVxBei5KkRL3vk1LV+RQ0XNYG/4RXTNw/GkuT6OXyR
         BEmM0D1yBkjvueI3fmx4ELqn4udGBwK4MlHzIhe/rk3iF4RqA+hjx0BY4gcvOfGRYMDB
         sxtzBwtewijuVgVtmmc/mIMiYo7EuYwj41IKd1+Fg8UkPCFz+abOF8nC1hs8HbP7Ul/U
         39gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727440; x=1785332240;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oAPdTlgSNacIapUcDKLSVpf/yIfFiTTXS9eHbffFj4s=;
        b=HEa4nnALmkz8VktGHsYfebodELlzBZeoXAgdE7mj17rIFpmH4FbG8/0hMqmWCiiKFX
         8m+nF0y4s6eDLUHCdI79X9tcVT1VI3Ta6jTYyIkXwCvqgN4etTAuJfdIH3CZsf5wHeh2
         PT4sng7zPL5s8lfhjy2VYV7Q3/v9nrgEUzPJASpjgQRFAN9phz6iF/S1RS3cxJaeotQ2
         zkXbXGGu1KOlsTxjpu1KG4cvcG4SEpZufJqms30iVKq2zJPDVyt5B1hWAyeeL595vRYR
         eaEohI7GpilSgu2WtR0zOUTf0Y5fFKiluUVx7L4STPNTEGW8PxQ3IUj65lzyahmd2UFy
         eyYQ==
X-Forwarded-Encrypted: i=1; AHgh+RrG9DnoUHO4F2T9U9NthUp3Zz4iFAryMSZ0gjC/Qxwy0A4HEDGtlMCmM+bw3w6IcudckBtpipyYkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrnR+B4MR+oroqeLoHjBEaoLLEp8rWaLyaj/GgQ9UqcVV0LhKZ
	VlEFYUsFtDYRH5f4bDrBQXUmK6rqEdgIEyF6vuawlFVjb3MHxO2DPwOv+svfYoVnIKE=
X-Gm-Gg: AR+sD1112GMCRqruJrh5cuF8aoyH5gsoIxTzS4pnhDH/q5JiglM8F6fy52K2N/LQi9r
	Pric84pbtSD2rEgoT53teMmNkfo2atsUWEpGAglWQl6QbqWnrfwOIHbsG/AYR6nRTUpATxfIwvX
	PjQuLpXtYAr+LEka4bX2KlmaCRygV9hGz/2d9VqAGRAH6DZYIDYnFsvSqTMG5poPrB77JVOJbyX
	+T7KoI7RkhWBg02jY5g+SIDBSp1LWoP9BfKudnfTWSCWHrqSfvBVarJG7t3bv0TCFjANURwG2ia
	dOUGEigIWTQpoBpJ3OsleNNRMM6vI7P1fFixxQdUv8bof1bkyW2TV/gi47IPLaXKnsOkeLmx2kb
	8b+FWTXZnJY8teX+90Z2YdK+kp27SQitYiwkYmPOcaTh6D1F022m0KQq9l1GOgrYFmUF7V4FAxs
	KqraSuUqMJelCIkvGuLH0Lm6NWkgqvichj7Qi4
X-Received: by 2002:a05:6830:6e63:b0:7ed:ce16:7d72 with SMTP id 46e09a7af769-7ee22d3db82mr1681252a34.5.1784727439923;
        Wed, 22 Jul 2026 06:37:19 -0700 (PDT)
Received: from [127.0.0.1] ([99.196.129.101])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ee29db53fdsm1326508a34.4.2026.07.22.06.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:37:19 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Yitang Yang <yi1tang.yang@gmail.com>
Cc: Gabriel Krisman Bertazi <krisman@suse.de>, io-uring@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20260722124551.130563-1-yi1tang.yang@gmail.com>
References: <20260722124551.130563-1-yi1tang.yang@gmail.com>
Subject: Re: [PATCH v2] io_uring/rw: fix missing ERESTARTSYS conversion in
 read paths
Message-Id: <178472743437.597590.12441381990712899617.b4-ty@b4>
Date: Wed, 22 Jul 2026 07:37:14 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 22 Jul 2026 20:45:51 +0800, Yitang Yang wrote:
> Both read and write may receive internal restart error codes from
> the filesystem layer and should be converted to -EINTR. However,
> when multishot read support was added, the error code normalization
> was lost for both io_read() and io_read_mshot().
> 
> Extract the conversion into io_fixup_restart_res() and apply it
> in all three locations: io_rw_done(), io_read(), and io_read_mshot().
> 
> [...]

Applied, thanks!

[1/1] io_uring/rw: fix missing ERESTARTSYS conversion in read paths
      commit: ab05caca123c6d0b41850b7c05b246e4dca4a770

Best regards,
-- 
Jens Axboe



