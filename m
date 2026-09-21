Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4E449E159
	for <io-uring@vger.kernel.org>; Mon, 21 Sep 2026 13:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789998248; cv=none; b=iXFCQkhuYdBmNxByqaIhFLraXlWZYSYG0Vm4tlRY+PlR1Zu7cVd93mIIeROVv7Qb+x32Yu0UM4Gd1wadZCjEMIRs6XGR3MPfmL+9brrS/hbsVfu5yxZzQmUZ1b/YRYDhr0MeXNyZkI9SH0WArEwFsm2IEFAOvA8ZmESe2ifNeEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789998248; c=relaxed/simple;
	bh=Ffr27RNaF+FHzq3WbV+cwo2+VfRU0uuG7BksAI4Sf34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aQ2F9vEPCgZXIM3Rso+ZM6QxmlugtAlhfvBfSp05at4XLsI/yjn5PefBFbF5G7T+SNhLfXDAcyq2W2XM4FTcD1lkoiPpKVpl5RazyjKcfvW7WVBt4b+X/ZKSJO7hbBXbmYTz9KLcldW8Y7073RjlJ9oKIdNEK79dK9gX9rs1x3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WQ041ULT; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQ041ULT"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9a59so4267931a12.0
        for <io-uring@vger.kernel.org>; Mon, 21 Sep 2026 06:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789998245; x=1790603045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NkeBIcnXDbJI7xttPPj+BDZba0zlv1qCEuppUmdh2T8=;
        b=WQ041ULTmn8oIfDDAPegB0ryOuulWBW8xTH6dy/FNnuTaIROw06zad9G8VOvA9jhCO
         nGwwGrtltQ9w/VNo6HxG32lzeR/pNHGDZmggvzI8SepHxo7M0yP04joHR59rBWJCTiRH
         QkNZUxrc9lEEj16orPpUTEQ78mHZatBMM8chhmaT5E3YJogMM2ovjFz0bZXboWOE2ZIE
         Osr3I6YtCh4efQp+KJAUcs5SmZvKjdKhNwDJYwBf3JWvn22WDgG4emGeXAoCo4POf/Bz
         BiNQsLFOrAOIU/O71fdUJYRIrhmzmMfW6krL508dEfCqYqrsx93B/mV17uYZrjf+PVRS
         VfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789998245; x=1790603045;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NkeBIcnXDbJI7xttPPj+BDZba0zlv1qCEuppUmdh2T8=;
        b=HZgr94Z8Etx3gIeDrv31c5xrKmI5XBwxO/Hc3fwhYJqS33NX36ZarStAcHMV4LiIZj
         BThhr30zF4TyHq4OLeti/W1KTIvP6Av7t1T6hiTXPNF0Ogo3EH8iRm6FjusQVwIa9FWp
         iCB7HzMPjEE6E1Utbp4U/vq+BiirP34lSz1Ry3ND2VlZ+RiwDlQUlMm1p6uguaIou6iR
         EwbkbhnnkDvs7h8iXJl+RCWE+LQK7btikBGXS+loE177TOdnDost6lEE2G6UP2J5gLgc
         N15ZB55pssqFN3qGdIVX2+Bg9Nijr3sEGw7r0yDYzxIHyMkHCYRjoZH6zkzEEYSXzxZ8
         liOg==
X-Forwarded-Encrypted: i=1; AKwUvBxVyloQEi6AugdRaUCa/uY7o8Q3EGioAsAm5SUrTNXNoauC2ngNMgvHMAsg2yAe4hU4hPb/kqolXA==@vger.kernel.org
X-Gm-Message-State: AFuF++nd8RmRxCo77I2I1DksSD0+31KVSGoQT8rJMluZpjtQ6dvEaaRm
	Si4A4dQiUgUGcC5gjcV61NG5L4MmFyNnTyte3dx4YfGpqE+OvUYSmeYq
X-Gm-Gg: AYBFou3wqlwVxF7DRXkl84r3z34+Qbn/gRoBcgvII23LJaxcp/lzHRoWjuZtnCqp8vf
	dwYF56KdamdzJtFj51/Xh3OUsAENR7H+xawh9cFa9jI9IxIkjmenQVBhymymH3L+hntDe+/q+0n
	gAENjxN0IpAJGMg3BrFsAPYpcJAvkG/K+zNtR7+NgOIaOdjBvdi4nJhSvKwdbKrhxZt3VA2m8L6
	zuI5IQbvBNp2J0aalt7eaz6bG8lGpu6nwVYTL6WsMd4Tq4ZCSQDFLtQnItuJ9AdLJKu5smRyo/T
	3Y/6rfqO335SkpMEXtYbSC4SD6sPg18CztKWw/YYyi4XJxgiBOxO4PZoLUy2Ak91o569WmtfrlB
	nEClHZUCtsQsFpWdXvU93PXTR7shkLkCJR6y8Xtxv7YR0QNdpGF02wlx+xQ30pWqK7LHGzeIZFa
	fWjacN420J6xlfl3/DLTX+N5sJnbEwadF/Wn+ZCjJFS2ziyigqogbykQuVw1UTkMhrxLZYo40Hg
	cRcGLLe//MQW7sv30VQNKkhqsum1Dopt7CF1UECExjSYJoJAu5SmUsU0FrVUx7IO37WvoAhVFJM
	gGmD/lTDajCwPSMsA28pbM446SRDCF8dF0NX5Q==
X-Received: by 2002:a05:6402:2355:b0:6a1:4458:7f2d with SMTP id 4fb4d7f45d1cf-6aa53104448mr8100478a12.5.1789998245342;
        Mon, 21 Sep 2026 06:44:05 -0700 (PDT)
Received: from [10.54.182.141] (82-132-213-26.dab.02.net. [82.132.213.26])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67e0d3c5sm4417232a12.22.2026.09.21.06.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 06:44:04 -0700 (PDT)
Message-ID: <b3e1db34-45c8-4723-8d09-eabc28bb0988@gmail.com>
Date: Mon, 21 Sep 2026 14:44:00 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/16] dma-buf: introduce initial file I/O
 infrastructure
To: Sidong Yang <sidong.yang@furiosa.ai>
Cc: axboe@kernel.dk, kbusch@kernel.org, hch@lst.de, sagi@grimberg.me,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 io-uring@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 viro@zeniv.linux.org.uk, brauner@kernel.org, akpm@linux-foundation.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, nj.shetty@samsung.com,
 joshi.k@samsung.com, anuj20.g@samsung.com, tushar.gohad@intel.com,
 william.power@intel.com, phil.cayton@intel.com, jgg@nvidia.com
References: <cover.1785596451.git.asml.silence@gmail.com>
 <ff5dccf71e8c03d62797352c4bb5fbb7c6c759c8.1785596451.git.asml.silence@gmail.com>
 <20260808074245.85757-1-sidong.yang@furiosa.ai>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260808074245.85757-1-sidong.yang@furiosa.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/8/26 08:42, Sidong Yang wrote:
> On 8/1/26 16:46, Pavel Begunkov wrote:
>> +	if (dma_resv_wait_timeout(dmabuf->resv, DMA_RESV_USAGE_KERNEL,
>> +				  true, 0) < 0) {
>> +		dma_resv_unlock(dmabuf->resv);
>> +		goto retry;
>> +	}
> 
> Shouldn't this be <= 0? With a zero timeout dma_resv_wait_timeout()
> returns 0 for a still pending fence; only -ERESTARTSYS is negative.

You're right, and this chunk is gone in v6

-- 
Pavel Begunkov

