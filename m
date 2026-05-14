Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BAE31A053;
	Thu, 14 May 2026 01:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778722377; cv=none; b=Cdgkzdu91Da5MC5bvzb8bg3c6btI/ad5YVEYPtAjywfcYpspf8Fh9xfs9cbpR1UTZXYIGa9XZCTSqO/peCzibrqGv/7MnOhl6ErHtzWIRWMQK997Nc00wgFoEjb2RK18ZsPNXCLJQn68pXT5I+PKDIOQQH/psbfTYvVElIHumKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778722377; c=relaxed/simple;
	bh=X1Y0VIR9BQZwAP6ngkxtYijkqaCrKOH0thxIzz4qs88=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=DqdbluKzzWXdprdZX6+uOX/kC8olXrb6rudn1z+vGmWFCeG+xWyNltQI4hqPO+WWXEPB0TCxt6Kna5Rv8nooMAZH4o2ggSAZtXk2M3im9n/nNWa+PQELc6oyJiBDrvZv8zHH/uJrr/VRM/PhZuEKDfzsFi4o4M3+lAUElgAO8WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gGCVL3WXyzKHMQy;
	Thu, 14 May 2026 09:31:54 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 69B8740574;
	Thu, 14 May 2026 09:32:49 +0800 (CST)
Received: from [10.174.176.179] (unknown [10.174.176.179])
	by APP4 (Coremail) with SMTP id gCh0CgAX31o4JgVqOPvdCA--.34519S3;
	Thu, 14 May 2026 09:32:49 +0800 (CST)
Message-ID: <b4c6d8c5-1423-4443-b3c4-92c399e0cb6d@huaweicloud.com>
Date: Thu, 14 May 2026 09:32:40 +0800
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Zizhi Wo <wozizhi@huaweicloud.com>
Subject: Re: [PATCH] io_uring: validate user-controlled cq.head in
 io_cqe_cache_refill()
To: Jens Axboe <axboe@kernel.dk>, asml.silence@gmail.com,
 io-uring@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, yangerkun@huawei.com,
 chengzhihao1@huawei.com
References: <20260513063254.1122354-1-wozizhi@huaweicloud.com>
 <f8dc69f8-7191-4c60-a2a3-2fa85a089927@kernel.dk>
 <36e2e080-0fe0-4108-8a27-3be8b10ef97b@kernel.dk>
In-Reply-To: <36e2e080-0fe0-4108-8a27-3be8b10ef97b@kernel.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgAX31o4JgVqOPvdCA--.34519S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CFW5JFWruryDuw1DtFykGrg_yoW8Aw1xpF
	WUt3WYgrZYvry7Ka4DZr4rtryftrsFyrs3JrWfGa4UtFyfuFnxKF1rKryFkFWvvrZ7Cr12
	yFsI9rZIyrs8ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUylb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUFKZXUUUUU
X-CM-SenderInfo: pzr2x6tkl6x35dzhxuhorxvhhfrp/



在 2026/5/13 22:20, Jens Axboe 写道:
> On 5/13/26 8:18 AM, Jens Axboe wrote:
>> On 5/13/26 12:32 AM, Zizhi Wo wrote:
>>> diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
>>> index 4ed998d60c09..92e255e9e08f 100644
>>> --- a/io_uring/io_uring.c
>>> +++ b/io_uring/io_uring.c
>>> @@ -710,11 +710,13 @@ static bool io_fill_nop_cqe(struct io_ring_ctx *ctx, unsigned int off)
>>>    * fill the cq entry
>>>    */
>>>   bool io_cqe_cache_refill(struct io_ring_ctx *ctx, bool overflow, bool cqe32)
>>>   {
>>>   	struct io_rings *rings = ctx->rings;
>>> -	unsigned int off = ctx->cached_cq_tail & (ctx->cq_entries - 1);
>>> +	unsigned int head = READ_ONCE(ctx->rings->cq.head);
>>> +	unsigned int tail = ctx->cached_cq_tail;
>>> +	unsigned int off = tail & (ctx->cq_entries - 1);
>>>   	unsigned int free, queued, len;
>>
>> This looks wrong, as you're snapshotting 'tail' while it could get
>> modified by if a nop fill before the refill happens. And fwiw, looks
>> like the refill part potentially suffers from the same unsigned issue.
> 

Yes. I wasn't aware of io_fill_nop_cqe(), the fact that
cached_cq_tail can be modified between the snapshot and the refill
was missed. The same oversight also means the unsigned issue in that
function went unnoticed...

> To be clearer, I think you want to add a helper ala:
> 
> static unsigned int io_cqring_queued(struct io_ring_ctx *ctx)
> {
> 	struct io_rings *rings = io_get_rings(ctx);
> 	int diff;
> 
> 	diff = (int)( ctx->cached_cq_tail - READ_ONCE(rings->cq.head));
> 	if (diff >= 0)
>          	return min((unsigned int) diff, ctx->cq_entries);
> 	return 0;
> }
> 
> or something like that, and then use it in both spots. Would make for a
> cleaner fix, too.
> 

Thanks for the suggestion. I'll send a v2 using this helper in both
spots.

Thanks,
Zizhi Wo

