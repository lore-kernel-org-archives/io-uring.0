Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AE64D4896;
	Fri,  9 Oct 2026 11:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.136.29.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545770; cv=none; b=LRbB8YLnV5p8h31Bq0rBDwUUMaIAKWrpVQNk23x7lQP5mWoTOQ8bG0MbRLAdEP9/4Z3Feus3lb9mtwvdw85KVyH0BTV1ZyUKxsOAho3lOuCa4tQsKv2qJrGeELWJMEv4ddUi8hoIVEP7H9mdS/JPb1iHZX2zTGo6X6WIK+uCe08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545770; c=relaxed/simple;
	bh=XDoZ2up+6bfp6DC+i8Poi+UhDZOU8q3P2RCAufOPQd0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=h1Ghf6P9lwGS3BqqFq8cba3f7VvT4XJ2FEMmdvIpuoSdACtpEfgqauVksUp0aU//ZWY3NHQlMbDhUwXCarfUtQYsx71R7+ZnnDcLm4FXxBk55JwiIaweGD3ebuwHpm2MiIzd49zJXeFIqHXTDhtuJjTVu1n/6HvCjN44Io3qFIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com; spf=pass smtp.mailfrom=proxmox.com; arc=none smtp.client-ip=94.136.29.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 93F9947922;
	Fri, 09 Oct 2026 13:35:50 +0200 (CEST)
Message-ID: <a2b107b5-7489-4e0d-87a2-3cca5dc7b142@proxmox.com>
Date: Fri, 9 Oct 2026 13:35:45 +0200
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/wait: make check for pending io consider cached
 task references
From: Fiona Ebner <f.ebner@proxmox.com>
To: Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, t.lamprecht@proxmox.com
References: <20260427165910.683941-1-f.ebner@proxmox.com>
 <81c9150f-1f19-417f-bdb8-ada97f0b8ea2@kernel.dk>
 <b4d2aa36-8301-4e58-be3e-1451267b8c43@proxmox.com>
Content-Language: en-US
In-Reply-To: <b4d2aa36-8301-4e58-be3e-1451267b8c43@proxmox.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1791545750055

Hi Jens,

Am 28.04.26 um 11:52 AM schrieb Fiona Ebner:
> Am 27.04.26 um 7:17 PM schrieb Jens Axboe:
>> On 4/27/26 10:58 AM, Fiona Ebner wrote:
>>> The io_uring task's inflight count also includes the reservations for
>>> task references from io_task_refs_refill(), not just in-flight
>>> requests. Thus, pending requests are present if the inflight count is
>>> larger than the number of cached references.
>>>
>>> Co-developed-by: Thomas Lamprecht <t.lamprecht@proxmox.com>
>>> Signed-off-by: Thomas Lamprecht <t.lamprecht@proxmox.com>
>>> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
>>
>> Looks go to me! Just needs:
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 7b72d661f1f2 ("io_uring: gate iowait schedule on having pending requests")
>>
>> tags added, I will do that. Thanks for debugging this and sending a fix.
>>
> 
> Thank you!

it seems like this change did not yet land in mainline kernels. Should I
resend with the added tags? Or is there some remaining issue with the
change?

Best Regards,
Fiona

