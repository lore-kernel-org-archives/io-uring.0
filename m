Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B736248F006
	for <io-uring@vger.kernel.org>; Thu,  1 Oct 2026 19:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790884780; cv=none; b=Qda5pySKE6Krh8ycqoGVOytruEDzn8pbZy2ZT9xjsZ6PXdkXDHCvAw4BQnZ837rt/QkQiQYXGrSEQLvwEb+tzM02vd7yl6YZ4htfwEBiKGsYyZoV6qclb6ND0cYreN+qiZEZQf/kV9cspSbgKZEzm33F9tIi+6ZH7oef5UdPz30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790884780; c=relaxed/simple;
	bh=NsnC98lLEmPtzcI5SMcnYMNXlik1DQeccKtACiMtII8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hrp9AI2U5HQcLpK6P+XI+DK43HO7UjN+rTBarSrqc7IKWPb3vw+IlEjl5mL8wXcxYGpAPkzw4D7iWRyotW9ahlz59WonrTjrNMl0O6AcKGieXTDk051voK7IJ21nGQMloj3UMr3zv1SrQEEWafIc5EkHYjoc/0FiEd2SLpvcIyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20251104.gappssmtp.com header.i=@davidwei-uk.20251104.gappssmtp.com header.b=KqD23dGv; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20251104.gappssmtp.com header.i=@davidwei-uk.20251104.gappssmtp.com header.b="KqD23dGv"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33be7dfcfc1so8757219eec.1
        for <io-uring@vger.kernel.org>; Thu, 01 Oct 2026 12:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20251104.gappssmtp.com; s=20251104; t=1790884778; x=1791489578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OlXZfN2jIHCSSReMxEXaJOTvyPeL6Xzu27uw/Bz4HZA=;
        b=KqD23dGvULJkKYgH9Bah96o7VukM4ffhkL5rSvi512UNtjD96q9L3j143Sl6xdDDWc
         F6lWoHJ9DT6m5PcwdmJmh+VZxzIvLaXwvjTOIY+LpZ4I6Y7w1cawfYNPINrPXCAbVQYi
         ZatCOiQbFIbSsxy6fYjkB1Y+DvEkDUJkp5EiHbwj21osPDOBGXsm54aj11GAUTR7cou1
         rZwowTiE3FqbEDHUxzg/eAZ2Vt/tT//qZlTgEWDTgberYqpBxBTk83EF2rPwpaQWvvMb
         8ny0sAw9ATrgABsMxOGeO8EU6E3bxZl8+l52WT9BXQvlgnjKIL7nSMiEce9ZlMxbn0BQ
         wR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790884778; x=1791489578;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OlXZfN2jIHCSSReMxEXaJOTvyPeL6Xzu27uw/Bz4HZA=;
        b=TNKnU8jiUNE8YEPVXKVSkHjR47h/IpTnvd5JjCEXBD5/ha/GTlbgp3sm9gHu9fpU38
         XBm4g3fa32UU2iBPjeuTW22/+iC4IOuQWWIsmzZ2ZIh95l6HtvX9CH6yT2StcsTBOL5W
         ijGPe1U6znkVeD/jwVW92gD31C3+qFTqtAGvEuh/MvbgPTuRoYUmYY1Pl8XqdJAtu7lu
         TYY5V89GC+YLiyp4cl6MFKlxtJmL7WhHxg+isdQNMDS3JcWIW8hEljKeTTwK+SFXoDNt
         cHsRz17CABR26HAfWSN6+Is0kEmZsorFxlJxUZ7AEB2hPWn2tpBbXg8DtRuKVy5YzIm8
         vY8A==
X-Forwarded-Encrypted: i=1; AKwUvBxhNJoZFzFay6QhEk0XMNODcUnay+w0t8lRhR6lqALXYnWZnkl204hJS5h9jDFGSlYtFXZr/boXRw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIvQjDXfqV99jZWLe/7Cnx1Ghul8b5zf3SczCYmB9ScV3L2JRKR
	2q6olFIUNiViHZDMwMtRT3O2a0/52fjXMQz/QaMozYg5VhuC/txxkcR1NJSNsgEXpx+1WQdkJGa
	4dEMV
X-Gm-Gg: AYBFou21hvpON2hKD7SsEh99I+/ZJ6DWLoIRA1KLsYIcjR/WC1HF05tGQe1M5ymrbJH
	aCzJXCJqO9Fm7LUs89OOMPCj9RBv+HbvUMRHtaQnf7FzdXPDRdMBqeo9m2oqfI5lCAzBAkNjY94
	bYJ0tnSSNM3meYQTsNgLIKtggbgFd1gsxhc6v2q4GhAigG8+9Kt4qUcnxHQ4c0S6wyAAmZ5461r
	UBDAl9uuezTWz0jlftMvyDbdRuCpT8fd8arOhwsQ2GbEtGi0fdB58UttbxSSkiL2Eu4CBamVUGb
	nWsZ+bS91hRqquAqSDnvA7J5rv1GE0wrDovwrQY8HhOkfSmugHLLa2tMMgkHXHWLEZ32RKa77Pl
	TW/lrB4NW24yh2PwEO7oqajQ68L3e6Dqy4K8Ldk2TctNIVI3RKs0ZR0s5tYqLIjpygvo6HZmytG
	mwQ10HdP9tiODSUh9pAaFh/JeGvuIQlilpVAUfXV7Cv4TjwRpGnBoEHhGtcKMDK4POCRKxZX82u
	goWyfCO64dR/SCqY6sY8TcpbV0bQq2ub36ezpfZELDJwGyCJmJigvR1XZsU/q5p2gzTD3hgpA==
X-Received: by 2002:a05:7301:6f0e:b0:34d:109a:de8c with SMTP id 5a478bee46e88-34f2185404fmr319569eec.23.1790884777703;
        Thu, 01 Oct 2026 12:59:37 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1156:1:c8f:b917:4342:fa09? ([2620:10d:c090:500::5:9c83])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f308fdsm630098eec.8.2026.10.01.12.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 12:59:37 -0700 (PDT)
Message-ID: <d94ffe5e-1725-472b-899d-1a2c20845af6@davidwei.uk>
Date: Thu, 1 Oct 2026 12:59:35 -0700
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/memmap: fix non-compound alloc fallback with
 memcg accounting
To: Gabriel Krisman Bertazi <gabriel@krisman.be>, io-uring@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>
References: <20261001181752.537767-1-dw@davidwei.uk>
 <87h5j5w8sb.fsf@mailhost.krisman.be>
Content-Language: en-US
From: David Wei <dw@davidwei.uk>
In-Reply-To: <87h5j5w8sb.fsf@mailhost.krisman.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-10-01 11:55, Gabriel Krisman Bertazi wrote:
> David Wei <dw@davidwei.uk> writes:
> 
>> io_region_allocate_pages() first tries io_mem_alloc_compound(). If that
>> fails, it uses alloc_pages_bulk_node() to allocate separate pages.
>>
>> The bulk allocator does not support memcg accounting. __GFP_ACCOUNT is
>> unconditionally supplied, so when memcg_kmem_online() is true, it only
>> allocates one page. For a multi-page request, io_uring treats this short
>> result as failure and returns ENOMEM, even when the memcg has enough
>> space for all pages.
>>
>> When this happens, fill the rest of the request with order 0 allocations
>> via alloc_page(), which support memcg accounting. This maintains the
>> existing fast path, while fixing the incorrect ENOMEM return when memcg
>> is used.
>>
>> Signed-off-by: David Wei <dw@davidwei.uk>
>> ---
>>   io_uring/memmap.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/io_uring/memmap.c b/io_uring/memmap.c
>> index cb3db32e8255..cc8ac129a0c7 100644
>> --- a/io_uring/memmap.c
>> +++ b/io_uring/memmap.c
>> @@ -183,6 +183,7 @@ static int io_region_allocate_pages(struct io_mapped_region *mr,
>>   	size_t size = io_region_size(mr);
>>   	unsigned long nr_allocated;
>>   	struct page **pages;
>> +	struct page *page;
>>   
>>   	pages = kvmalloc_objs(*pages, mr->nr_pages, gfp);
>>   	if (!pages)
>> @@ -195,6 +196,13 @@ static int io_region_allocate_pages(struct io_mapped_region *mr,
>>   
>>   	nr_allocated = alloc_pages_bulk_node(gfp, NUMA_NO_NODE,
>>   					     mr->nr_pages, pages);
>> +	while (nr_allocated < mr->nr_pages) {
>> +		page = alloc_page(gfp);
>> +		if (!page)
>> +			break;
>> +
>> +		pages[nr_allocated++] = page;
>> +	}
> 
> FWIW, I looked at this recently and really think this should be the
> alloc_pages_bulk_/kmem_alloc_bulk* actual semantics.  But that is a
> bigger sell and I only found io_uring would actually benefit from it.
> 
> Feel free to add:
> 
> Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>
> 
> Perhaps also
> 
> Fixes: 1e21df691ffa ("io_uring/memmap: implement kernel allocated regions")

Hi Gabriel, thanks for your review. Yes, I had also considered changing
alloc_pages_bulk_*(), but as you said that is a much bigger uplift. I
thought I'd go for a smaller surgical fix first, unless there was an
appetite for the larger change from maintainers.

Sorry for missing the Fixes tag. I'll add it if this requires another
spin, otherwise Jens please add it when you apply.
