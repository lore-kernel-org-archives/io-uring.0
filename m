Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F9B446BE2
	for <io-uring@vger.kernel.org>; Wed, 29 Jul 2026 10:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322195; cv=none; b=hmUHgfzvO5WzxOLvP/WEnsXREbH3Tnz61bRCNknE8aEIEMLmpU8wHLOzKGOnhRSctKkN8EX031LeEY8wCXR7w1mDGp+AYlnats7XDWn+7wtre+lLpwzZu3zapis2K4+aHEtt4m6ySpNuFLphh7f8R2wCms/HGGWJESiQif9SKGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322195; c=relaxed/simple;
	bh=iNi2nFSA8g81W+/HnLXlWmnLlyUILEZvQTRGox6oYII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Brfamh+w0vibd9GE/ia1nZLFJ6YSpWNjPPW1+WB4OU8cgDsKsj4cX2cX+hkZ3EVJ9X7NtKA+j8OPSs2dulNdyrMMHiHqWLP0Xqs+azkqn3+Y2P9m9xyMb0b28KiUR6mtLLONS8hG7BkGcCcfg/q3RhZd93BC7W5Rv+LNFglOi7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s6f7Plz8; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s6f7Plz8"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c1c52d920b8so113189566b.2
        for <io-uring@vger.kernel.org>; Wed, 29 Jul 2026 03:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785322187; x=1785926987; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3xVEH4RvIZup14rRYV4Zvxl83sd+HTGGj/jXhd9ySH0=;
        b=s6f7Plz8hCZXfh5yIrDR0xQ3OAAJW6lfJ2nNCx9b0/4iAG0GjMrmw0T2rVHZYMI3hC
         ogOq+pzXWmy0m4piruY/4MCQ6T5/GjyfZFStJ+gYah5OmM+m1d++9jRz/weyos5l098f
         FKfMfTpcSM/RQ4KFk7bZuZtsZrdsse0K1beCRAdbe3KejCBQse+RNHSN7A/poayBldUY
         qHhGuPV6sNvmWF3VcHF0EaKge4A0A3Ypobo1f3LEr7c7xqOluLhscdDkMdcrVLONA7yh
         GeN3q6i/ptpHpfZ3AghdpxRH9Iqg/z4mdXe7W5VY1LoT6bi8nFV5VNT3iV8ElLNkLJbG
         UoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785322187; x=1785926987;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3xVEH4RvIZup14rRYV4Zvxl83sd+HTGGj/jXhd9ySH0=;
        b=LOow3XUq4Y0ogbFA2NkgATXf5vl2U8fseAxyhzWLQICCaUhvzDEx+HsKzeV3uiAObB
         12oR7DBACJkOVFzUvR905CfOG4j7eWOQzYK5KxvRFfkML/6R2MbSrdi1kqRjlJgvDO1w
         cIE2cGN4Y5IHGIoWyBnEf2Ww5bm7BApZxLEKav30QsNSOz0fq58QhWJJbqRaOxJzLQGt
         oU+zl+pAyUrgIpLOHULCxSrJ7gGde0NuOgoSJ0bKHJbas4FznshgZKTPWlOjzsJJzRut
         qRPimTLxSnSJyCukxnSfAXUZKX4mJW0Ea7N/iN1BCFv/kTMQkYfqa6DbIA64Hdq/nSLs
         58Dw==
X-Forwarded-Encrypted: i=1; AHgh+Rpug96GrjXKIrUECO1UD9S9Td2XihBMcU+SsFZ6WMNyT+Yl5sfqQfk8YwkAZvHddkjutYNKynFZpw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7/ZMJUmSZG0yq1R6LxS1w869QIYxXoescVOwun5Yz85NYFKVL
	Qb+gcy+08Smtf8Suta/9bbNEQ1gfEo2yAuJCbqBhpIR22gTlTjFOYAFQ
X-Gm-Gg: AR+sD11HRowty4FXiw3reH/+Li7UuMwLgZeOArM65ptXjsoidkt71Wc3hn40wTJdpcO
	5E+9YvUYWRH76jK/5D3+21cN9AXxY7HiVjd3lr9Sl2AsVlgff+rq9OaCIKfkhM7KexXQfM8Rn3X
	U7+is/vzGuRQE+BfZ4vKzSXdm25iCiPqwVEBq8ri70kom/7E5gKYZLKn3pZtZqk7j5tmjX81vOn
	OHb6LmNAfnCv33gI90XJqJObgEWVJuBeTIg6Yzaj+lvljQMlio+OhPnHk/Oe4sNNpWZG8d6TDdB
	tOb8t0lTueUTrrytZkeXkx33JM7sf52GFidew4+VQkBMZzvjchzmlxCYmvsAAHIBATzCHQN/Xjm
	0dUj5iBIuilQXfP/VhsV+QWz2TcGhEHnukGUrEzOuUUYE+Ootl5HJh4TN9jUYnq7GLGd5CbRcwl
	40/clMfdsYlzCBYbgnxZAtMVOnePgaR4CMuXvi2Ih6u+aurQDEZ1tVI7QJOEX0V7ehDphKaHyA0
	/kHrxi32l4YkOR+rYyTHBFZFH9XvMS7vtn9+8E00yZzQ5aQtXrAvYwl1ZL9GLwLd4d6XEU/DcRR
	WtnM23YHNUv1yidszFORerjdNWYfDw==
X-Received: by 2002:a17:906:fe47:b0:c15:bea2:d209 with SMTP id a640c23a62f3a-c1f7215dee1mr299738366b.4.1785322187169;
        Wed, 29 Jul 2026 03:49:47 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:640])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83d27f47sm97965566b.26.2026.07.29.03.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 03:49:46 -0700 (PDT)
Message-ID: <c81be43c-2fe3-4403-b8a9-dd19855eeb58@gmail.com>
Date: Wed, 29 Jul 2026 11:49:36 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/14] nvme-pci: implement dma_token backed requests
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
 Sagi Grimberg <sagi@grimberg.me>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>, Phil Cayton
 <phil.cayton@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Damien Le Moal <dlemoal@kernel.org>, Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>, David Sterba <dsterba@suse.com>,
 Ilya Dryomov <idryomov@gmail.com>, dm-devel@lists.linux.dev,
 nvdimm@lists.linux.dev, linux-btrfs@vger.kernel.org,
 ceph-devel@vger.kernel.org
References: <cover.1785274111.git.asml.silence@gmail.com>
 <19e5c945ea8114320c10f7951d19197d48b59249.1785274111.git.asml.silence@gmail.com>
 <20260729071048.GH9534@lst.de>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260729071048.GH9534@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/26 08:10, Christoph Hellwig wrote:
>> +static int nvme_init_dma_buf_io_ctx(struct block_device *bdev,
>> +				    struct dma_buf_io_ctx *ctx)
> 
> Please stick to two-tab indents for function declaration continuation
> for the nvme code to keep the code easy to maintain.
> 
>> +#if defined(CONFIG_DMA_SHARED_BUFFER)
> 
> This should be good old #ifdef.  Same in a few other places over
> the series.

Going to apply both for v5, thanks.

> Modulo these minor nits the patch looks good.

-- 
Pavel Begunkov

