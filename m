Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E39338D6A8
	for <io-uring@vger.kernel.org>; Wed, 29 Jul 2026 17:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785347180; cv=none; b=Nf71qK8yjzqqNLiqFJj8bCxh/QFZUpuvD0y0HNG/8Mr96hG6CVz9p5Z5nVZlfoQ5CWYLQH9V2H9SsUe+Kn+0/yufYnAZO8nVurAelOfTXwOOIQNyqMAzVIkecwdeT7jG6egHIHpdVZcaSJCRHd104WDsAgGgxqUjdAMBmo63fak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785347180; c=relaxed/simple;
	bh=UidFeDXv81Ur5iK25hdw53vt+RFWGx9NnnGs3apTKJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dew0ZrIP5xLzOBSKlLbCFIFA0am6eHPpCsdczznR9jOEyfWWf9BdgayHD3duH93r8X5GZNwpfzHkoydD/o0ayN9JlnBJMoiKk2tEfTUT8N+ySp4D5vxyV9LPmg3+PZuQqoWySJsULHAapbkdGWkUdFit/Oj4srunKsBJxZD01IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LhtNhxku; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LhtNhxku"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954afac04bso13987285e9.0
        for <io-uring@vger.kernel.org>; Wed, 29 Jul 2026 10:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785347168; x=1785951968; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WKE9xNdjsRTW2zyuw6/ikQhgmzmnupdLH1iSl4caYw4=;
        b=LhtNhxkutVb/rQ1a9tAjPqKS+PDo91gQzXUzhrAppUhes7wCBEtJlmBszRWptzX92P
         wX9M7VrN5dJQBY9YL+kcNbAKxHdLKpFnosAfFsgl71SDaYzQYZfc398fOvi1JKDaqoHI
         Mtay1Qdc/JnUL59ypsHrWWoZb85CA3sIiyipMb2U7BFRXgz+zPg1YJx/YTGbShyP7S6H
         F4QnP9aOsxZ91Y88DL1EIBcYtcWXvXS2O/rFN2M4KOtit3fPOLDgPEiCGFks1udshJqY
         XMtXDO9ISMyh7B6RHX4Hw+OYY+VXibFRwRhYEtyrZMJBpjC29yLUNVys6GuWV+pYjIDE
         FRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785347168; x=1785951968;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WKE9xNdjsRTW2zyuw6/ikQhgmzmnupdLH1iSl4caYw4=;
        b=D7SZAKMb2rlAU9eIuAPUv+lKtxD5jxQXoK0JOufCO4WQ9Y+vHotuFntxN9NNK3H1Ij
         /2zxYY+zWGkVV5PZ3ih0MkUvvXDt2PAJ2ySWkv77J3ywVBAhzdeEiyeS9dRAeIo3Tton
         D6Jr5z864XrVkJHnV3PyBPdVqNcFNyc1ajGJw6rudTiKSlyNAn17+018Ez9WTt2mQ3b1
         6pyT2yX5xVgegy/nu5fguSunoSNrMNL8n3hVySRTYzCBihTMmtemxO9h6p3Sm3jJ8oQ8
         dfnWN6R5CnE11e2ll6ARjHQwxFcajnBa0RzT2qNS1LjjX0kexaHcODecFiNsK9f0QhbQ
         lIJg==
X-Forwarded-Encrypted: i=1; AHgh+RriyxWAsDcUC3vBJ67pj9imxc4VOOlHne5sCyKvQLmppC079Di/ARWSpzwMcapOTM40HDkO/MlFQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEX/2s/PuKqBUOQ2jD1JQo5CXvCc6XuOtgEABnZJjK9dhiA0rs
	C04ceCMSiI3tIK0m3YdBLy9mttFRs/oSuffVgBwHkGeFemt5C3H2xfd/
X-Gm-Gg: AR+sD128jFeQQ1SqqMJnHXpF4qqhRKiooaD7x4k9DdJZQiariPQhxleMJL7JjIpvcFU
	tIu/3mNmq6pZuTr61g28kzLhppEbyrnoWnGIm3ruYLqPlURuwtSD7NlbE0zCIulAk0Qcy0MHnb3
	pwaO2bMeEbHoRcUr6v2NKoj+M85BhZfFHFlaoXMBt0xVbOcYUhEhDROa9/dxrouN/hTZzt39elH
	md6H1Lahf+5c1oKQxc4zQzWSge2MfF6pP098x/4hjJx9MV8pBRL7HRJ4WXNzvgL8AcF8BebwC8w
	kH+APqowXOhmCx8BvOwTmiiFW0lDYxF9grEoYJZG/5qmEwL3KCwnhvKw8GDa23zwx9XZUl1FlnR
	r1VqDHPj1UiQEcYAkdI9IshbXGpP0dTQohGzsAk/gEpbOZYGPRVtyKXk8CxKe2PW/QoxGd8D9RO
	KXFRixus8UqZZBpGwqBlsZjF1BbhNY3axfKq2K5xFLqSWjkJ3E6pfZnxT6zFycX9CCyYlajIqxu
	xvv5VEJoVM1fyCDQWrYKlwg+0KK7nG59zkTObfabvYqhmHzW5/GHqtPSOncT/QG++xx+HmfC5vI
	gIM4lKXmZ8Lc3N9u8K/rbz6BURXZoJv5gJu/mcU=
X-Received: by 2002:a05:600c:4fd2:b0:493:e79e:da6b with SMTP id 5b1f17b1804b1-496c6590660mr98300165e9.21.1785347168019;
        Wed, 29 Jul 2026 10:46:08 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45b1c2asm171605965e9.5.2026.07.29.10.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 10:46:07 -0700 (PDT)
Message-ID: <5afa3726-6c15-41c8-af19-766eb76b4b46@gmail.com>
Date: Wed, 29 Jul 2026 18:45:58 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/14] io_uring/rsrc: add dmabuf backed registered
 buffers
To: Anuj gupta <anuj1072538@gmail.com>
Cc: Anuj Gupta/Anuj Gupta <anuj20.g@samsung.com>, Jens Axboe
 <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 io-uring@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Damien Le Moal <dlemoal@kernel.org>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>, David Sterba <dsterba@suse.com>,
 Ilya Dryomov <idryomov@gmail.com>, dm-devel@lists.linux.dev,
 nvdimm@lists.linux.dev, linux-btrfs@vger.kernel.org,
 ceph-devel@vger.kernel.org
References: <cover.1785274111.git.asml.silence@gmail.com>
 <CGME20260728213020epcas5p1721e72ba5544abf0b61482da005120d9@epcas5p1.samsung.com>
 <26dcd0ae5c87a3ada5710b14b6894ef343cec6fe.1785274111.git.asml.silence@gmail.com>
 <583fdfb2-5368-467f-a388-6d388859c995@samsung.com>
 <0df2f832-e8a8-4fdd-a5b6-e08657c2891f@gmail.com>
 <CACzX3Atj+hJmF+Au1Yw5KMk--EHy_J=7Yof1aQNkUV0hCrdVEA@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CACzX3Atj+hJmF+Au1Yw5KMk--EHy_J=7Yof1aQNkUV0hCrdVEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/29/26 17:52, Anuj gupta wrote:
> On Wed, Jul 29, 2026 at 7:37 PM Pavel Begunkov <asml.silence@gmail.com> wrote:
>>>> +static int io_import_dmabuf(struct io_kiocb *req,
>>>> +                       int ddir, struct iov_iter *iter,
>>>> +                       struct io_mapped_ubuf *imu,
>>>> +                       size_t len, size_t offset,
>>>> +                       unsigned issue_flags)
>>>> +{
>>>> +    struct io_regbuf_dma *db = imu->priv;
>>>> +    struct dma_buf_io_map *map;
>>>> +
>>>> +    if (!IS_ENABLED(CONFIG_DMA_SHARED_BUFFER))
>>>> +            return -EOPNOTSUPP;
>>>> +    if (!len)
>>>> +            return -EFAULT;
>>>> +    if (req->file != db->target_file)
>>>> +            return -EBADF;
>>>> +
>>>> +    if (req->flags & REQ_F_DROP_DMABUF) {
>>>> +            map = req->dmabuf_map;
>>>> +            goto init_iter;
>>>> +    }
>>>
>>> O_DIRECT is checked only during registration; we should recheck
>>> (file->f_flags & O_DIRECT) per request.
>>
>> Nobody should be able to clear O_DIRECT, unless I missed something?
>> And fwiw, io_uring wouldn't be the right place to do it.
>>
> 
> fcntl(fd, F_SETFL, flags & ~O_DIRECT) on an already registered, already
> open fd succeeds. The consequence is that subsequent I/Os switch to

Very exciting.

> buffered I/O and cause silent data loss. Something on this path needs
> to reject this combination.

Yeah, I'll fix it, thanks

-- 
Pavel Begunkov

