Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF4E42640C
	for <io-uring@vger.kernel.org>; Wed, 29 Jul 2026 10:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785321453; cv=none; b=r+t/nblkqbuExtZr3NcxLKG/a95efACg4LjrntQR+WVaeoPUb/v9ebKzk+9AFRZH9E5QiKsxV6RrwLRlq2OWMa+VwryVIHzPz3nPDR3MCPvo6cgi11N16IdFDBIYGfkwWphLmD5Br1gCtlN5YMpCYsveh8kljB/jAwHDFbd2f6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785321453; c=relaxed/simple;
	bh=KMDBHWwtyZpTu40an4MnGq08B+PKsj/C5jew5swtPtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jPtbFwG5JU6T3GwBqC2GKGuS7by4zZVu7QB5+HnhcRqrpDI2Ss/Hl+N7vaBMousDHpfOXvhXGvJzZ2Dt18nNst4IhkDT77sNjaDsVzVf3sKEt/N1CW8SDEhNkFkvqq6cyBQ9ZUHZ/zHg2hcvv29+kyIi8Df6/G/j9z80rsMDfoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQuApLte; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQuApLte"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c1712a04ddaso131902666b.2
        for <io-uring@vger.kernel.org>; Wed, 29 Jul 2026 03:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785321450; x=1785926250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8KbmJYcU1SAlCdU+OP1hBT5okmuW3fRl/0GYAxB+Rg=;
        b=UQuApLteJB9kKcT40XOCwRqmqtd9RC2KId41eJaievdgrQkAkYSBBD3tGi/u/fez2H
         wEj2YyP+qYvRZa4Xtb8VcOAWrjOaeRZICTY9aIFaKTVNuRWxM+CziTXGSrcKYbSYG6NZ
         y4dx/mcV4IB2wRg7eosVnKv9HjbGYw6trbjjsQXNwJ7ddaVp0aqZSyyvGyhhhzks7Aag
         9AB/FWkuXdmVgpfxoSsRPTW6Y25+o4N6kZa1DfBxZefcNyFwXULJk8t2as6huleg4iNM
         gL+plUqY3hdAwGxRONuYMqTwo7vM0we09dnFCaHO01nkbW4UsbTgf4dRtgYw1fJ3wLhF
         KgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785321450; x=1785926250;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p8KbmJYcU1SAlCdU+OP1hBT5okmuW3fRl/0GYAxB+Rg=;
        b=VvCgCCO9uCWWRdeVx+LT0+dlIQO7TUxNcc6yLgAXL7ZMrwczjJFc1kSNlkjDnqo8uV
         5amwHAfnshQL055A6FzGjGkLxi5WMiFXKKHZSORfBhCtAj/7tsvyPXvgNa3HEbDAdAr6
         K9l/ffGJ2/8nDW0GcsQmrT62yroGPE/tKWO70dGljAuq4gP274L1RYvnH+BGpqLNoA48
         jqljMwMGggqyykT1oH+VXwXRfCMcv711TPK0wYY+SENNBNqkb2ghX9Dqqv3c/BTo82sE
         fm+Vuh6Oba7pe8moD5VWaJoZIFbS/DRFBxvGSZrqQEuM/5hAepcZGxtPFG1RNznMRo7I
         0g1Q==
X-Forwarded-Encrypted: i=1; AHgh+RpqsoXpuDZk5oxC6kKtKhnZw8fqaK4aHQaT0WLCkxqIxikVCdw36xkFh7g7SKnLu8GMDqRxtUlwBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YziMj86BvXVo3s0hL/50nQIIdsgBaAvQlJXv5wVyQcENHyk34/E
	FHWnApA6f3q1Yb/RNDVtdjfSh+jDcEZqpu9FOBP6AbRuV7Xwy5ThXMqn
X-Gm-Gg: AR+sD111HW4DrWnOA1BoxhGGPKJt5WvB2ikiJGDe3si25vcva+a94E9zKYsWr/TZQOP
	NnMvZd2JZn04mmm7T/nnGtRyfd5jd3Gg6Ns4tkEZlIdoebdLaxZyVKSUCzzSXPGefwrcMyiLfyk
	o2TfiRPz52y6VOry8kRUSTU+eIVg/qbtglGFB1PS6q1M6MaOOd5a0Yce6g5qR1hLG+6ilyKdVoC
	f3dIs9D50rnkH+K8oxuDedylMsQCvTQ7ONPWcrB9R7Kwcsyi/7BefSCw3SrTSUanXptGV2funy1
	o0CQ/KxyzE/FgtFTaM12bS7jwcFI8ZAnzE0TAsBPho2xldBmx2l1ny2RIXDfRj/P8U4ldSxoEdc
	LyxJhEfWR9j8H7Z6zWJ+5WBLvpQS15Yu67qsxe7/wVPr1fPFL1mART4uOSLLdGLP0DGK95L+uD5
	4/IPNOhWrZ525dOdvAHpYaZ43f6kgFWQQ6ZSZ4WxfkFLBkPAE7+IefLaST0BHKAiH9/WkgjZpBL
	i16fyA0l61BoKHSFOOar55a+GOpEdavZiJBoRPJSaqfs1IX0Xq5j7TlfDLHrJt7fz+Y6YsqOuyU
	Oyxu0r+79ynp0YTbD1s=
X-Received: by 2002:a17:907:9617:b0:c1c:62b4:1ebf with SMTP id a640c23a62f3a-c1f721913ddmr365145166b.60.1785321449861;
        Wed, 29 Jul 2026 03:37:29 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:640])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f84026c47sm93918766b.63.2026.07.29.03.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 03:37:28 -0700 (PDT)
Message-ID: <340dd033-2a45-49e7-afd6-95dbbbf624da@gmail.com>
Date: Wed, 29 Jul 2026 11:37:19 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/14] dma-buf: introduce initial file I/O
 infrastructure
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
 <bc20381e8daf85ac58811c344325d8192cde9d1e.1785274111.git.asml.silence@gmail.com>
 <20260729065927.GA9534@lst.de>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260729065927.GA9534@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/26 07:59, Christoph Hellwig wrote:
> The method name feels a bit convoluted, but given all the
> previous discussions I don't care too strongly.  I'll leave
> the dma-buf side review to those who understand it.

I assume you mean this:

+	int (*init_dma_buf_io_ctx)(struct file *, struct dma_buf_io_ctx *);

I agree, and all dma_buf_io_[ctx,map] look clunky, but I don't
see what I can drop out of the name. Suggestions? Maybe I at least
should make the fs op sth like "register_dma_buf".

-- 
Pavel Begunkov

