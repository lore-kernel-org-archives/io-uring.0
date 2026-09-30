Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34E03DD536
	for <io-uring@vger.kernel.org>; Wed, 30 Sep 2026 10:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762993; cv=none; b=srpqcgkXgDpFvTSn3bYGCigy0e1CkzN2RJONi1lZWtcWhsPGue9+gKCmgp2rQMIuNDewOOLZiVh/4mRqPNR3vHn8G3DaFsJRKR1MMPA2kADOjSEPFWgVPSpWhUeGYRB6ASHbxgjIgVjIx+5OYd+j9ayAHA3nug3GDmVp8BYuZAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762993; c=relaxed/simple;
	bh=hrw1dd3W52X2PRIBJ61p/Ixy3mLjm6opZZ+GWT4oBp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dHOe+93RL83I7Q1ceItnBJI2Vgg+vR1U6S88q0JEZ5flsBcIaQQ8qSfaxDmenrRJKdXEwv5tpOUxy1snXjRgImmUvRvn9StLjSPvYl9sHsDm3kNMbUbT6k+TgK0QwSCA17IJJNb8yLu3dxKxPMl+TBITr5wuZxHBBGbjViYHlNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bkzMs851; arc=none smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkzMs851"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6ae19959791so385894a12.3
        for <io-uring@vger.kernel.org>; Wed, 30 Sep 2026 03:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790762987; x=1791367787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ruocdeJmKgpaQFus+PucSGDLt7ZSCHmy/3XR1sTVzPs=;
        b=bkzMs851c9zZ8pLRd7lGGP1HQkdNCJPEQ9CuXY49B0eFdR7dpGB2Nur49+z/HeFkDt
         /SUCrNcWrt6mHvkiKtv5YoTO978/x0FED9JnCX0Almu9bcN+rWc6Vw9/YKgCZNEsUjMY
         eEPNYB/IE7flOrrYfumMz/Yx/kGJAuanFQkOz1UHN2Vd5QMBdgYAjUmprorWC5SOGetH
         DH3fbXlvIB1K4BuylVIKa8z6j3JzdSpqtjjxxZ/nhXwLOhcKvaNjXwDfodTHtvNH3Z2P
         mx/KKz9VOP4glr4+nStpRUBmLTXc6hFwIx1ennedbu8C9DVP9nCgNzuTcNnitLYDpsnu
         fOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790762987; x=1791367787;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ruocdeJmKgpaQFus+PucSGDLt7ZSCHmy/3XR1sTVzPs=;
        b=gsuw+0ceXH+cL9sA13KgcyzLO/F2fZ48zbim/SLXGqWCuPTCh/0aCrfe88z4Zr1c2C
         ww49h6W1/zwI59mJ9SkVgJj2UOhPgBQx9nLwIHQohTT7iwg/kMZZJyk020hyJ4awKv4+
         vf4FK6CKOOXJ3rc13V2flJm2O7QsDTAubxhbm6Vhv5eQ+RZzmuv0SQ1jUOnJhIWKPuKA
         9J5Fn6u8NJUi79BjgXqWDDAz6qdn7immq8+Ht81Tt40QcOi1zlM6iJgbZMuwMuxup17W
         RKk9gBmq4iE72Kx5ChqDxj2Dfv9XGhU4ba+QNr1apx6w2zcoP8caqxh09li+/T2+B+2J
         CO4A==
X-Forwarded-Encrypted: i=1; AKwUvBzGltLcUYb+zI4yB2O7QjuOIBioz2nx8Ohho5/kdy2j/2By73IlN370rzUouSlGzpCALqYt/ZKbqA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLwgeknPpsGiMv0NVy3zT70L75KXWkKLCoc7V1wqDaDFKEXbWVu
	zBrUn75iafLPhJppR0m+AQeORkAhegYRmrvqR7OqzQVl1RKS8HKHKsXR
X-Gm-Gg: AYBFou2NcH33TmoBndyF2di/kFT8BSPRI43MJyf5Gc6dVbQ36SLQPeKBUAPXnLQ5W6A
	LiEQAB2R6IQefd97WYqVyDHJP7xNCjtwOq7jkVz2ahajbDxNlcDJOUlImWoamD+RDeIHW9E8Lcb
	+a1sxcGlqgAYea4NLJoxWRDOw7S3dsOpVFB1ONL3MHpB9OeJ4pLD/3x/DbctxWPlVX78igmSVlM
	NVcljegfRImQYRtilF+xNVGZk1kZLvWK28PDck9A9CrUS9MjbstM2h3BQauaaJVQrA1nVynMwsF
	bIXtKSZDgDW31VZgPIzCZUs7rE7ZApxMKWmN4d6yemRdMrXTy6xU827NWTp/1+oDaOPAIHf/bvL
	fG6RJYgOJCRX9iHrYQLBeR/tn53iM4jKKruo9myk3hKqHT2b7WIpyASuLNCzigB+VGlh6miD2Il
	KZY3pOAs8kAW8y4DUKLZUJWTcCOm8iBQVEEdsoxHBv+8pmnESeW6JR5NAmN3NLKX/IGUdCR6/Up
	+lccREJ/y/60NwxG7z7rxgsZ1FvwL4jv4fufLnJpbwHrPg2+URqvuPNhGXU+dzqJz1TUaPcd9Qo
	KT5xs2B6cN3uxrNjfR7MBhRcyyKuUC58Qi+QPAZDCy3YGUyX
X-Received: by 2002:a05:6402:27d0:b0:6aa:ec02:7de1 with SMTP id 4fb4d7f45d1cf-6ae199152a4mr634773a12.24.1790762987076;
        Wed, 30 Sep 2026 03:09:47 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae15690dbbsm551642a12.22.2026.09.30.03.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:09:46 -0700 (PDT)
Message-ID: <77db5aa5-f160-48fb-ab59-a754b100bc34@gmail.com>
Date: Wed, 30 Sep 2026 11:09:41 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/13] nvme-pci: implement dma-buf backed requests
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: agk@redhat.com, akpm@linux-foundation.org, anuj20.g@samsung.com,
 axboe@kernel.dk, bmarzins@redhat.com, brauner@kernel.org,
 christian.koenig@amd.com, dm-devel@lists.linux.dev,
 dri-devel@lists.freedesktop.org, hch@lst.de, io-uring@vger.kernel.org,
 jack@suse.cz, joshi.k@samsung.com, kbusch@kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-nvme@lists.infradead.org,
 matthew.brost@intel.com, mpatocka@redhat.com, nj.shetty@samsung.com,
 phil.cayton@intel.com, sagi@grimberg.me, snitzer@kernel.org,
 sumit.semwal@linaro.org, tushar.gohad@intel.com, viro@zeniv.linux.org.uk,
 william.power@intel.com
References: <cover.1790602223.git.asml.silence@gmail.com>
 <e99dd5221c71cbf9aafb5737468d814cb83b9174.1790602223.git.asml.silence@gmail.com>
 <5a35ad21-c9d4-4dab-a4f0-97baee6e2301@wanadoo.fr>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <5a35ad21-c9d4-4dab-a4f0-97baee6e2301@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/29/26 16:45, Christophe JAILLET wrote:
...>> +    for_each_sgtable_dma_sg(sgt, sg, tmp) {
>> +        dma_addr_t dma_addr = sg_dma_address(sg);
>> +        unsigned long sg_len = sg_dma_len(sg);
>> +
>> +        if ((sg_len % NVME_CTRL_PAGE_SIZE) ||
>> +            (dma_addr % NVME_CTRL_PAGE_SIZE)) {
>> +            ret = -EINVAL;
>> +            goto err;
>> +        }
>> +        while (sg_len) {
>> +            map->dma_list[i++] = dma_addr;
>> +            dma_addr += NVME_CTRL_PAGE_SIZE;
>> +            sg_len -= NVME_CTRL_PAGE_SIZE;
>> +        }
>> +    }
>> +
>> +    ret = dma_buf_io_init_map(ctx, &map->base, sgt);
>> +    if (ret)
>> +        goto err;
>> +    map->nr_entries = nr_entries;
>> +    map->sgt = sgt;
>> +    return &map->base;
>> +err:
>> +    if (sgt)
>> +        dma_buf_unmap_attachment(attach, sgt, ctx->dir);
>> +    kfree(map);
> 
> kvfree()?

Sashiko also flagged this one. I'm going to apply the nits from
both emails, thanks.

-- 
Pavel Begunkov

