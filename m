Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E64647F2F9
	for <io-uring@vger.kernel.org>; Mon,  5 Oct 2026 11:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791200749; cv=none; b=J1DDX9cydhZAElKNi3IAGdVRLbfv99uxfyV68NibIrqKiXsY5eVQOx5MLhkFu3vdr2daAe4ym0SCGV7qmouQM3Dwh/cP67JcSgh32AHTCGVP9JuUaFNg+vVjLgMKTjDkJXqMt4PvqiALaV5vwGo7itdOBDYsTWo6ZgZKVzX2jWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791200749; c=relaxed/simple;
	bh=ZkH2ZoyFF8jXmocTrDGUE79ENJOStFm8UfOKX52vbLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j31jb9Oxik/4FkbT+3nPX0GWcE2id/k5ULyA8uwN3b/tDRB6T0Kd2fAHKoRkO4X6fpzD35jR7bxeFrapEzA3zEH7lrRswpqOkxq8lSjsPSrbxAsUnhVPrqES/iV97r7E0SJWyZzROgQsdhZCXlZ0dKT3StubqEXpsJtS/TYVLf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oLvkzRQj; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oLvkzRQj"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48c58132824so465284f8f.3
        for <io-uring@vger.kernel.org>; Mon, 05 Oct 2026 04:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791200744; x=1791805544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CiogbugpChE2nuDY1/c0G9NHgdsv6JGGhiKd4//mw4Q=;
        b=oLvkzRQj6B3wn6g+GBOQbg4QEY801fSpX6Y+iaT5nUVCpccBnw3PpAFJhBhX3LBn/V
         h9Z36ZH3SCRn9BLxEVVMI861hisMPix9IzSAO3CvO0sQaoUsCVEsdQJOQNPFmcxrlV1J
         4CIiZTiUW5Naal1BuFM4b003nBctAm6EQbEH661idHug8xIePQAeyo17ZDj9ypZaKxY3
         XHm8EiUQERz46r5sN4J6JDMBMJhXLjsT7fYQ/d2V+wCh/iEb59dyeVxJVAWCJ56pckQr
         Lhx1qA4iwvMMeKu71T6xgF6dCJPlRDPY5FxH9bShzzu2/C1/FiLRhlMuM4l17N3cDCi+
         7XnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791200744; x=1791805544;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CiogbugpChE2nuDY1/c0G9NHgdsv6JGGhiKd4//mw4Q=;
        b=TSWrJaMaxmJtzNg5QU0gqzaU3ZDq89JuoBrYTlFcJfQHiS7lYghSdrDEyj0v4NVpLi
         L8tZ+biqlDsnrmf81AJRjtxrr3H8byllQ986mma+s3sjVKaDmh4iwjUsYVwAJMcXVooS
         uR4l1IqMUPDHBeT4+RlcnTXH4GWqzjx6Z5iCzEDzZWvhYBHi1Q0F78IVLzKa2kDBUifL
         gNz4YVykPHVz0CLKwDk7952IqOdHm6HrTA17Z2nStvj8nuVXXrrVFCS06J5EUtN21EXI
         lBsPY1aqAqFnhQEaq5omQdlbf4x5huDkWdQ847xLh/oL57mcHJr773H0t2q5/Q9xN1+N
         Ncag==
X-Forwarded-Encrypted: i=1; AKwUvBwtGgLkP63+TuxC8WSTUwzR3Iqhw6rAQhtIvU6/HBO/76YoPZ0I/goOy9OIPYE6tDu/IZFEXFVBpQ==@vger.kernel.org
X-Gm-Message-State: AFuF++liMZlGUer0CFw98BsjDZg2A5hMRU4iEFhHmTe+PNu6mDM9OlWY
	BoxqzazraQBOja7c6WvmiQkAOzRj5IuYFSmU7z1ekqOWA4fyk9RkUCJV
X-Gm-Gg: AYBFou3rddlHUHaKdtsFx0nQl9mQScTPlDQdq0nSaBpw2s9hEK/aS7O0xjYfLSEpC7d
	3U1bp5kBpxpawncrdD4pcDRZMI08w3EXzq0ylUTkgsQBi63csiQ/i92R95l9Xb2nreacZ8Qa56B
	BUSYRKz3IQ2zBoasOJ7bD2UJ7TMhevESaIn9jdRYftd1w0d03MeUN7bKmWPCESAjKhG/VLWNSbt
	gSXffXNQDPGq8rLQbfZxqirOp1I0vwuMRS8fVkZYI4MyH/p9YFKZ4rACTl88TO3mhq8hySn6xO+
	0zzMA1qqoyefh8iYbKEHqAsiPeOSAFOJiBdmWC+HZsWpJzr2+9XgtWLQheqmlvWx9IOP1GErj5O
	za1MR8Ug19Jqa9Nu5lhnBQbU/RJ1hZrFeXgCMnNqulZHkQqQEisJvdmvbgC7bJTanRetSDOfR3H
	tv4Hi+WUBfgJoZ5dZ7A0JdBtrFxxh2Lqwmv+5uiZoEoYhPBs+0CFwCGWw+zX0evzYAV4b02eVw6
	p4GezRbr5ZlRxWx/6N4Wzoo3Cp88z8LXKEKy7LREQLS2Fv6bQUh1aVuLiQQp6RQKp1lX2P7/AU=
X-Received: by 2002:a05:600c:c165:b0:4a0:108:3b54 with SMTP id 5b1f17b1804b1-4a02758e674mr183842705e9.32.1791200744219;
        Mon, 05 Oct 2026 04:45:44 -0700 (PDT)
Received: from [10.41.30.1] ([161.12.45.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027735be1sm472096485e9.11.2026.10.05.04.45.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 04:45:43 -0700 (PDT)
Message-ID: <cc7fb229-7e6f-4ccf-bea4-864ddbd36a02@gmail.com>
Date: Mon, 5 Oct 2026 12:45:40 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/13] nvme-pci: implement dma-buf backed requests
To: Christoph Hellwig <hch@lst.de>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-nvme@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>, Phil Cayton
 <phil.cayton@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>, dm-devel@lists.linux.dev
References: <cover.1790602223.git.asml.silence@gmail.com>
 <e99dd5221c71cbf9aafb5737468d814cb83b9174.1790602223.git.asml.silence@gmail.com>
 <20261005091554.GD10727@lst.de>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261005091554.GD10727@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 10:15, Christoph Hellwig wrote:
> On Mon, Sep 28, 2026 at 02:32:22PM +0100, Pavel Begunkov wrote:
>> +static void nvme_dmabuf_map_sync_for_cpu(struct nvme_dev *nvme_dev,
>> +		struct request *req)
>> +{
>> +	struct device *dev = nvme_dev->dev;
>> +	enum dma_data_direction dma_dir;
>> +	struct bio *bio = req->bio;
>> +	struct nvme_dmabuf_map *map = to_nvme_dmabuf_map(bio->bi_dmabuf_map);
>> +
>> +	dma_dir = rq_data_dir(req) == READ ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
>> +	dma_sync_sgtable_for_cpu(dev, map->sgt, dma_dir);
> 
> This can use rq_dma_dir in the argument.  Same for the other DMA API
> calls.

Will change

> Btw, given how larger the dmabuf code is now, have you considered
> splitting it into a new nvme-pci-dmabuf.c file?

Let me see

-- 
Pavel Begunkov

