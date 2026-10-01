Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620D4489FB3
	for <io-uring@vger.kernel.org>; Thu,  1 Oct 2026 19:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790884516; cv=none; b=NJznsKanIFJ/Xbh5SHOgBtRWEIL3qP6SL7sZ10bZsenoQKACXjDrBxUXzCiTXg5TDfV3JZCQHNMvYcWwZC/sjlC9GUK4epdXeIq79vaX6vB/T3NDuvhJ7uyoiVeK2hIhCYINUi/1DZSRT/r2iZDSTbY25uLrLQdIFlLkYQFJ4n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790884516; c=relaxed/simple;
	bh=m6QFNyo/HbUivnhpL3n5Jv3LWRFLievwuPKWr0ZulFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HgV/4TfF2foCx8dWfPPA6wK5yfNsDhacde2xcuQSnV5tWL9eG3dh79rPrj5sXvBdiCfDSnjtchmRW3Tecn9lvPclRuDgo5VUwOoD2i0fAMX7whMTqtbYGzHtrVns1g9RuIGCv2OkLp5z5bxOo22IMxtk4iIRf41tbpah1BCu+FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ebf6zXTb; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ebf6zXTb"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffde3cec6so32719925e9.3
        for <io-uring@vger.kernel.org>; Thu, 01 Oct 2026 12:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790884511; x=1791489311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SocnlOBrWyLM9Sz401rDDmsassHEU6pHgtVkIf4GMg4=;
        b=Ebf6zXTbGNZiMnX3DmcNWp2CNm8QCJpjXAKTZ77Neexhw4QPxPkVNvhqIpwucf5/sq
         uSNuwVdYPxsayu68ENvHwCYSvPakzPHhATdSf/D2TevR3EA0E02H5D2net25MWXumEMg
         K57c6hYl2EYBL9bzElgb8QQmA2HN0KCeFyeHAofqzzuLUIkyUP/TrclRJwwGiIYHqPfX
         shZpHVysF2DXgEbZYqIb3vF+V0UKR8cmm4YxSgrDKbGqXttn94rxaisY1/q4Kp6/hIhI
         k3N89WctGsz1rKON6wGkhlEVKSCLR904/nvtg1o254cRiGZv3G2oQeVLlOUADqpHtGpS
         bDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790884511; x=1791489311;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SocnlOBrWyLM9Sz401rDDmsassHEU6pHgtVkIf4GMg4=;
        b=ppSXlASAkYnNiru79n97UuZ3fTOdrK918Ni5i1HjbazsVxoRcAOpBlvoUbLSABvl3l
         REOH2+vCPmu8/TJFNxjCf4GKgO/xc5Hl2MV9uzNhibzqD+Bb0lx6zBEqGkg+I2ugHL03
         h4ny+uB2M2gVS6hR0zISmdq4L0wtg/f7ggEXPzs9BigIVhK2Bib6LvklWG21wwesc+Kw
         eAhATMv18Eetufs5S6lQBdbEXjGBQffd/Sbw2sU3+86nUDBJr2CIOtDMd7dbntOFzzxR
         zX+el+NdzYz0mgIhNDcVyFbvGY4X9PBIcmTjkBfbiHVhPCKmxqRcZbpuN3ibIhndgTXG
         +ojA==
X-Gm-Message-State: AFuF++kkYtYq11eVaLkvkoUMDhuIS2mYa+PdhjPkfddc0llZGIFUGBMl
	4lO1ttIHa4Raf2Die/jCsRnbsptoe8ZBmbFiPtaN9IT2l70TNQGTvkjV33H1O1fG
X-Gm-Gg: AYBFou3qtfjiVljV5HWrmJ3YxXu3Emkd3J2JVfpLQvrfsNMafSVgW94uOOWqp+1aAqN
	BZLnQoBIe0GpSLxnrD+iMtniC77Fi4mphLJveNDXZMxf5kQDMCirEZL+jJTEneWjzju4N1LNbj/
	3B/0NaxbVP088MB9lShgZj1/++OSsqu9qjinKaN2w09pU9RF1Dz8k4e/CgIpWToERBEaJhb1Gij
	vVZknrS+WyI6pZRMdo454fI8UhuWy7yS4hWzvouC0dV/ikERGtFaEgenwXgk3/yvYbsMiwqPA0X
	JzFx67Pd0aHdcu0tirGHDMKaamvgwForuxMFiZqNjf9CDTseT72ApAlK79LfJYOnxFLH/sejM9p
	n+xLMQIF3MBZAkW9JsEnYLwSunn/39rbooyUTjsNtkXiEmerI3Wj9Dj1wr/8TxJUT19Mr0V9+hi
	WwmT/fsCFysMNkUkfQFW750x7KSf2X+76HG5wCl1pusTN3VMDsluebGuKCDYrgEbPXf21rkLqRI
	bb6pHz75p+tO73QFX0=
X-Received: by 2002:a05:600d:82c8:b0:49f:fd66:5fec with SMTP id 5b1f17b1804b1-4a027456b72mr15053115e9.0.1790884510878;
        Thu, 01 Oct 2026 12:55:10 -0700 (PDT)
Received: from [192.168.18.21] ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff20831sm269595e9.4.2026.10.01.12.55.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 12:55:10 -0700 (PDT)
Message-ID: <20874bd2-f827-4ef8-9855-dc8aaec874fa@gmail.com>
Date: Thu, 1 Oct 2026 22:55:09 +0300
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring: fix out-of-bounds bvec access in
 io_vec_fill_kern_bvec
To: Gabriel Krisman Bertazi <gabriel@krisman.be>, axboe@kernel.dk
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261001143003.755790-1-omermetekaya0@gmail.com>
 <87se2pwhzh.fsf@mailhost.krisman.be>
Content-Language: en-US
From: =?UTF-8?Q?=C3=96mer_Mete_Kaya?= <omermetekaya0@gmail.com>
In-Reply-To: <87se2pwhzh.fsf@mailhost.krisman.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/1/26 18:36, Gabriel Krisman Bertazi wrote:
> Ömer Mete Kaya <omermetekaya0@gmail.com> writes:
> 
>> for_each_mp_bvec() dereferences src_bvec[bi_idx] in the loop condition
>> before the body is entered, with no guard against bi_idx reaching
>> imu->nr_bvecs. iov_kern_bvec_size() stops iterating when i reaches
>> imu->nr_bvecs even if bi_size is still non-zero, so the fill loop can
>> walk past the end of the bvec array and overrun res_bvec[].
>>
>> Open-code the loop with an explicit bi_idx < imu->nr_bvecs check before
>> the dereference, matching the termination condition in
>> iov_kern_bvec_size().
> 
> Do you have a reproducer?  This should be checked in iov_kern_bvec_size.
> We make sure it doesn't go through imu->len which should match bv_len,
> IIUC.

Yes I checked more and looks like the *bug* is unreachable via existing
in-tree callers.>>
>> Fixes: 1045afae4b88 ("io_uring: support vectored kernel fixed buffer")

It doesnt fix something broken actually, more like a defensive refactoring.

>> Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
>> ---
>>  io_uring/rsrc.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
>> index 51b46e624..3d29a0c7b 100644
>> --- a/io_uring/rsrc.c
>> +++ b/io_uring/rsrc.c
>> @@ -1614,8 +1614,13 @@ static int io_vec_fill_kern_bvec(int ddir, struct iov_iter *iter,
>>  		struct bio_vec bv;
>>
>>  		bvec_iter_advance(src_bvec, &bi, offset);
>> -		for_each_mp_bvec(bv, src_bvec, bi, bi)
>> +		while (bi.bi_size) {
> 
> bi.bi_size is the first condition of for_each_mp_bvec.  Do you really
> need an open coded loop?  If there is an issue, can we just add the
> check below?

mp_bvec_iter_bvec() is called in the for-loop condition not the body:

    for (iter = (start);
        (iter).bi_size &&
            ((bvl = mp_bvec_iter_bvec((bio_vec), (iter))), 1); <-***
        bvec_iter_advance_single(...))

src_bvec[bi_idx] is dereferenced before the loop body is entered.
A check inside the body executes after the out-of-bounds read has
already occurred. The open-coded loop is the way to check bi_idx
before the dereference. The question is "should the kernel be defensive
itself or trust the callers?". If you find these kinds of defensive
controls unnecessary, happy to withdraw the patch instead of releasing v2.

kind regards,

Ömer
