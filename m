Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426DD30DEB2;
	Tue, 28 Apr 2026 09:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.136.29.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777370078; cv=none; b=RX8Umvkv56biFn8gGIuSXFdJ07PLaI7gMYWwLWsw+1nihFGwT0HWgvt/o2Dh2TXTiNxSO18+gNsuY5D48E4k59ImyHlL0gVeZ4ouEkEI+e0/g0zYn1TD3gnEMKswpVM/EalxVmzxpIDeWU6VrAsDcwjm9sV0G8y/1vkgFkBIhYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777370078; c=relaxed/simple;
	bh=4H0Kmc3DNwoiKlYtO4WCi94q61yHG17T/m0VY3QVeSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OsQw8yz9xbT++tuMyzyhx2ji1t8mbbdoCQkcHXfYHo0fVIjSkgV46a8evaUjK8BsVvngseFyc7WUANKslWxq6lifZsQc5TM17w2aZAT6/Tpe82zz/mvHyfLVBGA3RXASq9elfmXXAj/cmEaKwoEw+hHduM/mb6sPNgRNe9kukZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com; spf=pass smtp.mailfrom=proxmox.com; arc=none smtp.client-ip=94.136.29.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 302188746D;
	Tue, 28 Apr 2026 11:54:33 +0200 (CEST)
Message-ID: <b4d2aa36-8301-4e58-be3e-1451267b8c43@proxmox.com>
Date: Tue, 28 Apr 2026 11:54:27 +0200
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/wait: make check for pending io consider cached
 task references
To: Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, t.lamprecht@proxmox.com
References: <20260427165910.683941-1-f.ebner@proxmox.com>
 <81c9150f-1f19-417f-bdb8-ada97f0b8ea2@kernel.dk>
Content-Language: en-US
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <81c9150f-1f19-417f-bdb8-ada97f0b8ea2@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1777369976598

Am 27.04.26 um 7:17 PM schrieb Jens Axboe:
> On 4/27/26 10:58 AM, Fiona Ebner wrote:
>> The io_uring task's inflight count also includes the reservations for
>> task references from io_task_refs_refill(), not just in-flight
>> requests. Thus, pending requests are present if the inflight count is
>> larger than the number of cached references.
>>
>> Co-developed-by: Thomas Lamprecht <t.lamprecht@proxmox.com>
>> Signed-off-by: Thomas Lamprecht <t.lamprecht@proxmox.com>
>> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
> 
> Looks go to me! Just needs:
> 
> Cc: stable@vger.kernel.org
> Fixes: 7b72d661f1f2 ("io_uring: gate iowait schedule on having pending requests")
> 
> tags added, I will do that. Thanks for debugging this and sending a fix.
> 

Thank you!

