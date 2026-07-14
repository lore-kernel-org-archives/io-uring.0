Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F2643D4F7
	for <io-uring@vger.kernel.org>; Tue, 14 Jul 2026 09:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784020929; cv=none; b=BKKr70XPcy6bQtjjQYN6niEBD/Dqydkb9UJnye0+CCBY4P1BN0n3DSygQTkM2KUbPswlv7xeFEXLpOcmWtxp977kyShGHDgpiuzJX7kcnO455hAbpE00uFy35Hy2lJrV1U/1QYD4rCgGfTNP9laHL5A5uQo5CdiWeZfWUEJLIAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784020929; c=relaxed/simple;
	bh=W8OT6ovmAQkwBwCI5qoFSNzG+sz1ik3/qbazlMkp4fM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tOeFzbP+H3TZsLh/ACIlQmFj2LKjoj+N3RwUnlGNRpKnXUX2OJfN7ViS1ssYjpr/N9kvzrwC4MSTLTD/UfZgjcMHyq0Q5EFMS/rzj/Tj7EOu+/MNFTZieLP684lXrlNTtXjW2w+65guVa7nLwfW+TG94sWbaHcszjmeNsHWqg74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JlMpiiPu; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JlMpiiPu"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4798bea72f9so2192925f8f.1
        for <io-uring@vger.kernel.org>; Tue, 14 Jul 2026 02:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784020926; x=1784625726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ersi/mYvINkBI2FWvIZV+GjZx0POxK8U4eXz4ZcSu2s=;
        b=JlMpiiPuB/c2oZZrBc95DV5SlirlC+vI33zg0SPOc/HulQ6PRfzknxCCkoafPIpvrP
         /EJj/1KtO89mjrSwAg804DK5vh0COyxGNwuawFtnFZ7KMBigbh7Zzl57kK43Uc+sUCpE
         GCcqSMQeeV9CRff6mbMZEH7sAKA5t6q/8IcQVSdLwXCGd07VBWMpDWIVtj2UX6ZZVhsX
         0NgcdbBMpU5zzjkqiMRgF/+NQWG+NLTSjvp/R3LTfmwft2KTKXT4bD3XsaWvDLQ9qOGc
         i61iRKqNiiAd7ancftpI04EnANyP1jtq9AboinBkMGpTe2fYXFve0PE4fjxU28iAycwY
         oXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784020926; x=1784625726;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ersi/mYvINkBI2FWvIZV+GjZx0POxK8U4eXz4ZcSu2s=;
        b=AnEaRsZ6JdKmfltnjUZ14lmEpRIzrWviXS+9NGJYv/Os8ga9GvFJChjNWdVkRneR5q
         ueGhCX+gj+5l9FDlj5veAoNnQZUBn2E0FRi8c8+oZoqwjAyJkY6Krpp6fvh2JkKotJF2
         7H6+OVINjQ+ofM/Ou4wN6p1vkNMkKfY04qxOhoMqWXsYkif300+OL/ffeJFqW5lonLHM
         sNqQ9c6lp4CgZUte9LRnz8qxfQ2/O5ubCiV4vZw/nXBkNCekaqHRxE1TfbyfngAG8Q+l
         j/Xb7fudIwHod3I9jy7tqWPLgCqVQHaMhTcFp5wYYvXBt/dUFx+F4nFegcLZSpZuHlrm
         umlw==
X-Forwarded-Encrypted: i=1; AHgh+RqEyEna+/dF8uT0hLQy2ByMmN4kWEwnc/5aDMpC+bumLShklm8sbI2Mm9Jx+mZCz9tKeE/2x9+tsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwF8RTPAy5kCW0ysB/LL8gojv64VlYdRVrmIV5+vJqtaDaxb+sd
	aNANhuzsb7I2kwbEHZUKe8ou3swrw6PRskHhfzjNHmbJsN1t2oS/TlgX
X-Gm-Gg: AfdE7cm0q301Njqaat/rTKMmYJyUWpob7LyPNWLy6han/v5d/XaGeWVrJw1dNVWqyQ7
	v9Z7BhQDLMdClOreEHyc7fyKUsA7BP8DME4sn0dNY/mz9PKsmZZ3KJiPrVIoW2Xe5n8JcWbwd7x
	UQ/WnsCVyj476Tnpjy6f1h/G54S7pUVcdoCj1jHX/+GRLA6zXQPY+4twci7a8kV0gVMPuQ8fImf
	66NBABDxGP4W26Lfg8RrgcXnvDmXy4hXdxtXPESsImgh0S0GcmKuPeMz7Jmbv1XC9aM6kI802o1
	WLz4rL3+FevjIYqll7Af6EKlIcdRi03Sa+EzDVnUuVnbFw86cyr4zYAyxWKMN2DKXRoAy02RWQ4
	ZPdlRJSFayyW0leUkJv6BTL1syxsSLTrX7A3+uCkOTW0UjzkU9o3469bwWN1W4BfxPHknbhjeTJ
	fgao6ky1Ac+Vb/psZNKNvF8xyIDfVMBVgkxCu5H4BaL/mrsyGC1PAysXDlKx78Vfq9uVtH5Tpd6
	nx2mgZsIuR5CNrwOshm1dBM58BDGxzPEeZVa05w74IHWg==
X-Received: by 2002:adf:e186:0:b0:475:6c34:2120 with SMTP id ffacd0b85a97d-47f4887dd78mr2004457f8f.18.1784020926324;
        Tue, 14 Jul 2026 02:22:06 -0700 (PDT)
Received: from [192.168.0.207] (nat-wifi0.uniroma3.it. [193.204.167.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f476e9d02sm6291743f8f.19.2026.07.14.02.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 02:22:03 -0700 (PDT)
Message-ID: <619bb771-1038-4ec1-8d4c-17dc69df33d6@gmail.com>
Date: Tue, 14 Jul 2026 10:22:03 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] Add dmabuf read/write via io_uring
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
 Sagi Grimberg <sagi@grimberg.me>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 io-uring@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>, Phil Cayton
 <phil.cayton@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <cover.1777475843.git.asml.silence@gmail.com>
 <20260713071828.GB30168@lst.de>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260713071828.GB30168@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Christoph,

On 7/13/26 08:18, Christoph Hellwig wrote:
> Hi Pavel,
> 
> do you plan to resend this series?  A lot of people are eagerly waiting
> for it to land.

Absolutely, I'm going to finish v4 next or hopefully this week.

-- 
Pavel Begunkov

