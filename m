Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592593;
	b=J5ZHbuwrJVrEjTJNOX3ihRToOLpf2MhIK9T1LXwys353NQk/MUUWILFe2lujT1tWmhmx
	 XhRf2LA76q5AlG1KnxPxCBb4gjFUEgz661Rt4BP1DaR1vKvCh6cglUJny2SARrqey3MAP
	 jki6dR15dMvKQzqhxJHSFn53tAY7dY2G92pdQh+XXQP74HTWnjy/4teMrMMhditC8axih
	 ju1ZHwYK2lYL96eqYxVfDfCDkAr5q8yjl7fu7qrMZAcmjIG7By4Cun2gJ4OV4TC4oYsMm
	 a8cOygfOHAwn+EGSgh4SaAMvmu4ot8VX92ONemYJz7MCUDqXK0usJKjkOhO1xg6sIrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ry0ejq2iOovIh50a5iLZlHQmAJp0KdXz+qWiCMyE90s=;
	b=PHsWdsdTFh1EPyTBr5YN2RUiInQ6Gk2yEmF7zMU2ukjnBAWzw9y8cMJka7vJOqTEue3u
	 YQje0uI3RMypfbjWsgnf37IQZipvZJ85RWwYmKIgJ/9EdCMJi8exvRymCLzhPKNvw88kd
	 rBlHBtvYIuYKhVtAmFMywugCbxUxBZFLuy+JumOLruo1LmNE8mW3olmLEZlrazguhfxlY
	 DhqBFL0FjRFSTQM/uwyYXYtn2ikxmXEZmivm6ptSxSK4DkOymm56U7ISIsUMNzvVLbYO+
	 eDmW8TI31WogpBNCSkRrmiCt77x73uM8Op077SY90i09CNLJZ9uUBVqlKPPT1XIuc5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UmrN72zC;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D22606A323
	for <io-uring@vger.kernel.org>; Wed, 21 Oct 2026 14:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5D22606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UmrN72zC
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so6752605e9.0
        for <io-uring@vger.kernel.org>; Wed, 21 Oct 2026 07:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792592591; x=1793197391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ry0ejq2iOovIh50a5iLZlHQmAJp0KdXz+qWiCMyE90s=;
        b=UmrN72zCxsSETrtXgFu1j3IULAxtC3xJczMlP7lP2PcHwldVuoMlyDYQqycuGBWZA1
         y6UNV0K35EQgUtcF+BbxS5YF6SLD/pH96aKKzbMUmTuJKhHoU9HfAS2dodFs1gHILpoh
         f8W1T2XIkQH0ojDxb/mjKnDxHKEPnJE4xfd1+wnet4R0hmM75lrK0LADdQBs6RuhltzS
         /10fFDKI8nnhI3p8iUg++UjM603kachz10zn2bNWObtPgrRiGauJmGKlfsv3d88O51Dz
         1w36jFtVIb4Lr6Cen6OILMPUgkZMyOhWKWwiuTyhntW8olf6CGUULgy4KQZuNVJT5D8O
         F0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592591; x=1793197391;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ry0ejq2iOovIh50a5iLZlHQmAJp0KdXz+qWiCMyE90s=;
        b=p/QPN5GZn/i6MFAMsjXs4WuZvruyBp2X0RJ/Nh1Q5HvF6xyFqIr+WVkNYEbFphm101
         OC8gvTD/PvvxvOXuXTMbQ6d9beoCWI7LLRYq1zJXFl+50zVxFGYuVJ6P8/dVXM9onySa
         V16rihm6MYKu3dummqPU9201CP4XkWK5D6AJKAOhP6ZK22tO28FIqdmARQAbWFpcSTek
         JNPy5dR8hmoRCkY8mXJH41XAmJ4SSChn7qNemlKmg1ORr0SGp+cEWYiGtPK5LwU9BWk+
         lzmrIOqSSHVpucj2f4/lAZ+aB0niBzqil3a0T8KMO2+eKtvy2Vu/r//2lLd0/mgIFm9a
         Ij1A==
X-Forwarded-Encrypted: i=1; AKwUvBwLwbDVCsnyodsg+PgHf0FDDKFF4B05J0Nl51R4P8xyKrsojZZE0OMwivakGBKF7cWolkC6xQpbjQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIhD/bXwKBG3oLWkkN1xpYeLbMoMLZBacEOEhNu27mswsn70XpA
	y4UDLQtKGG1wYP/pmIpSlM/zeEOgV2dXHzwpN8P4B3PQVPwhq3aECUs8
X-Gm-Gg: AYBFou0TyMbWkIhwr9276L+weoZU/EdaPiItSwFL9sBJcYm4RzhSPtC2xHSdTlB3xtU
	BovXT2XTVr8BxgA7pqyeYua/KXsIzQi5jBYv69VevOCWIoaFNiZVHb7iIgD4f+pKxJxDNcPsN0P
	8anO3Y7n5QZFm4GL3P3tG4sdgiS3MmsdRGtgtXlANnQPLJUfBrVeN5QUNcYc43SOxJMhNx8cTL3
	ZOfvyocT4KdKZN6wqQT38PBV2VeB16+FD9gDcGStz+onOVv90Zj98nTqj0tkvnA5Qfv7hJ2CYen
	DxQhn+SCgtjE44ePqA3qq2gCDZxN6IIq/UcDLUDpd6pfeiUdODi7TCDk86H8szu5B8RcwXLwvnf
	JweL1U693EgyhViLjiQ5swn2EB8uvBgweHHxh0lJWm7s64yEl16VWFOIKBAzatp+4RjA3nHwWUj
	JfW2/JmFPrE7Uj/5RrqvLlvKTDu1s+5J15qAxorB/Jb0QsgKFNQ1OugcMX97zYMoc1hSMzXBu2k
	JGOQVpZMcLkZuqTBjgFoos10DsXQojTVIxIMqoN7JEIpHoEdgZRWeQZfVsq6R62kFEpU2bA6HML
	I7gY/P0h/zADhs3pAM7vvSbiYqUsYclWZ9+Ti7vjfNILOvYZmOHzF9PrpOqhiJGIpl7tq1gujlk
	pGPnx7hk=
X-Received: by 2002:a05:600d:864d:10b0:49f:e941:d6e with SMTP id 5b1f17b1804b1-4a1fdd399dbmr32967835e9.21.1792592589343;
        Wed, 21 Oct 2026 07:23:09 -0700 (PDT)
Received: from [10.54.182.141] (82-132-213-19.dab.02.net. [82.132.213.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb80ef02sm83229375e9.5.2026.10.21.07.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 07:23:07 -0700 (PDT)
Message-ID: <d0c8cc97-6a21-4c64-b55d-16af783fdb59@gmail.com>
Date: Wed, 21 Oct 2026 15:23:09 +0100
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme/io_uring: enable dma-buf backed passthrough I/O
To: Anuj Gupta <anuj1072538@gmail.com>
Cc: kbusch@kernel.org, hch@lst.de, sagi@grimberg.me, axboe@kernel.dk,
 joshi.k@samsung.com, linux-nvme@lists.infradead.org,
 linux-block@vger.kernel.org, io-uring@vger.kernel.org,
 Anuj Gupta <anuj20.g@samsung.com>
References: <20261016103453.1129150-1-anuj1072538@gmail.com>
 <79627452-98d3-4e8d-9c37-ceda0796d59c@gmail.com>
 <vx4ugjq6wol6elipmwkuhtpk3qnanpwou6g73dxrjona3nepd4@pvetkgijfsx5>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <vx4ugjq6wol6elipmwkuhtpk3qnanpwou6g73dxrjona3nepd4@pvetkgijfsx5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Anuj,

On 10/19/26 14:40, Anuj Gupta wrote:
> On Sun, Oct 18, 2026 at 11:06:16PM +0100, Pavel Begunkov wrote:
>> On 10/16/26 11:34, Anuj Gupta wrote:
>>> From: Anuj Gupta <anuj20.g@samsung.com>
>>> diff --git a/drivers/nvme/host/ioctl.c b/drivers/nvme/host/ioctl.c
>>> index 3aa5d2f2dfbb..6343da1f6c05 100644
>>> --- a/drivers/nvme/host/ioctl.c
>>> +++ b/drivers/nvme/host/ioctl.c
>>> @@ -458,6 +458,7 @@ static enum rq_end_io_ret nvme_uring_cmd_end_io(struct request *req,
>>>    			status = blk_status_to_errno(err);
>>>    	}
>>>    	io_uring_cmd_set_res32(ioucmd, status, result);
>>> +	io_uring_cmd_detach_dmabuf(ioucmd);
>>
>> It's not great spilling the responsibility for [de,a]ttaching
>> between nvme and uring_cmd code. Is there a way to stash it
>> all under io_uring?
> 
> The natural place would be __io_uring_cmd_done(), but that runs from
> task_work, while the ref has to be dropped at hardware completion, like
> io_complete_rw() does.

It may queue a task work but is called from whenever. It would work
if we drop there and in __io_uring_cmd_do_in_task(), but I agree
with you that it might be confusing to the user.

> Hooking io_uring_cmd_do_in_task_lazy() would avoid changing the NVMe
> call site, but would add a non-obvious side effect to a generic
> task_work helper. How about a separate helper that drivers call from
> end_io instead? This keeps the dma-buf handling in io_uring while NVMe
> only reports that it has finished accessing the data.

Sounds the same, but I don't have a better answer, so either is
fine with me. At least with your versions we can add a warning
for misbehaving users.

-- 
Pavel Begunkov

