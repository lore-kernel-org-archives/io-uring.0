Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF31D30C35C
	for <io-uring@vger.kernel.org>; Tue, 20 Jan 2026 17:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768930698; cv=none; b=en+BapnAEIk+DvmYO2Sos//e5upjZEHoyY1AIz2lB8y4lcKWYPPvRtC1k9OXkWrelQwBiR2jvPXn1/Vfz4kc1I4TvCdcVXwod99Uy2oToZNOnl7x88KNllwKm0JjrFUs2lJuz9RV2ZWH7TywGEnqnfsES+aGv4bIopHVu8TKRPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768930698; c=relaxed/simple;
	bh=ZuAcA5wTLVJVzXBAU9b/InF1XZtUto0JwJq0iIQiiIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D0O6e6JK7EK32m6PIZvIPrQalkcFposjusOiavdNaPPOd2eq+8FhZ9X9UPg9weRglzW2aZcG9YoCb/xq3H8hDDtTn2tvAn/VdGGJCasL0Em++McwwcqUATqEzR3zGGhY/3JSwHDkzd74HajDgHay3ARf7XlvaqWRkCoO0TBfP6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=sobZlLc+; arc=none smtp.client-ip=209.85.167.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="sobZlLc+"
Received: by mail-oi1-f196.google.com with SMTP id 5614622812f47-45c719bb855so2970632b6e.1
        for <io-uring@vger.kernel.org>; Tue, 20 Jan 2026 09:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1768930693; x=1769535493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Zp5JKpXjSnVWep2Xdo+/1kZq7fIPauSIaPVJiOKFmM=;
        b=sobZlLc+b4Wsdh0kz7YCYWG0+3Ep0DVMHD6LxL+lzWgL+6Lo9A8RxrwRQgy2/yDprQ
         kvDBZrHIXP6GOlEgFcMgDaPFKH2bKSUQiMngAYvwPue2YIfdaYBW1iuixhQADCOxeRL2
         o4I5rJPzBi+18fPw/hANjNmKHpWqVdotETNbA1OdD7PtwEY06Yw0XghMMwudyd634bh7
         AZ3pEFwfdh1xuEoIHqVbdIqFafFeKz9m5OHbGDNdl9SrMzWKfEeAIaBfMiJrzk4+v8Od
         7O8tUPEyGFjRL/et7FXrh60TAU3jhQWCtqkJEgxBv2hW3DVFPHFYuV6Hvv858ZJooqC9
         31XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768930693; x=1769535493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Zp5JKpXjSnVWep2Xdo+/1kZq7fIPauSIaPVJiOKFmM=;
        b=sQdWb6JggfcvNi2CQfe2mmSe4DMhpC6CQsS9RJBR0vJ+rhfm9nt1VXalPVSKyspM2B
         nsDPo56PFEyxe7Fi2x4dVzNaCmSGW1YYbxKRw7YFnC+pRXzCdAgXCERdOa9kRlDqVBRv
         0g7Aa8cMaz2cSjJAjPlOedsA9NGhfilci/IPOaAjB+o0JJyfCHScqXhSvkndlp/6PBwF
         e5TuKKAkBuzqBtc3b/MSWvIz1r6tVKBoInnoXqZNldVV1tZ1wgj/EyUeD1B5tSBZSvob
         sTkubgpYNYeCRURjjnAa4udJDWbV0gG7Oy38DybpsjeGFvkuCNfxYxA8UuVHoBsYtgmv
         rXrw==
X-Gm-Message-State: AOJu0YxSwNVryKlatEfjLkDD/23MRw4I+tivIW+jyfsVU9gR3Qp303tO
	Gh2+CYOogVtDqDtuGFCC9giCNRBthmqiNOAjv77vPyHx6ShlXJzO45mP7YBsqLS6ZQg=
X-Gm-Gg: AY/fxX5/kJ5nrWgDhvA7ZtCfw8ovHhnl+ndIHa9cZv23VyxsNUBxdvTfK2GVkWNE1nq
	GvrrErR02/6w81SrKeEjvlx5sKZhWKL27xBrBA85ZSlnpM5M+VDrFDZSwWujtZd/RIzrOQFB/cH
	xCIteqcFAOlJoNEi84JsOPHzqZCDIcHkBdZaSm44beNJDgxQ2AZR7xQpCk3wOq6LvfT+EbyRhUQ
	DNovQSKdyF+Wng5uBSqLWB3bAtsXjSbGHkhqqFuk3z3sowHZAH9zibpgK/MXCgSIswaMBsli6jk
	dnPkURUn3FU2rbkJoV7ltei7QY+5viwC+8eEccZHhD+HEituvTZgbL0E1F2QJfPwyrJbTsbFNat
	Q0rv7J2wjqIQF/Dv7nubIzc+xDzuQ/uJVUKBRoOqAAxrQHk/3HuIHBTUtoCTWqPCdKFnB+T8vC7
	JgDqwDJUHsd3m3laMvlPM94T2sRcOAnnbcTaCvw0ahDxX05/1a+yavan3PUsXyvlULUVEe
X-Received: by 2002:a05:6808:4f63:b0:450:794a:6cee with SMTP id 5614622812f47-45c9d73dc40mr7793947b6e.21.1768930693510;
        Tue, 20 Jan 2026 09:38:13 -0800 (PST)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45c9dff95d8sm7084738b6e.14.2026.01.20.09.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 09:38:12 -0800 (PST)
Message-ID: <8c20196c-f208-464b-91cd-c87c22f83693@kernel.dk>
Date: Tue, 20 Jan 2026 10:38:10 -0700
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] io_uring/kbuf: fix signedness in this_len calculation
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Qingyue Zhang <chunzhennn@qq.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 Suoxing Zhang <aftern00n@qq.com>, cve@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <tencent_4DBB3674C0419BEC2C0C525949DA410CA307@qq.com>
 <b53d5207-0dbc-4e1e-93e7-e51cb6c85383@oracle.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <b53d5207-0dbc-4e1e-93e7-e51cb6c85383@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/20/26 10:33 AM, Harshit Mogalapalli wrote:
> Hi,
> 
> I have a question regarding the Fixes tag for this.
> 
> On 27/08/25 17:13, Qingyue Zhang wrote:
>> When importing and using buffers, buf->len is considered unsigned.
>> However, buf->len is converted to signed int when committing. This
>> can lead to unexpected behavior if buffer is large enough to be
>> interpreted as a negative value. Make min_t calculation unsigned.
>>
>> Co-developed-by: Suoxing Zhang <aftern00n@qq.com>
>> Signed-off-by: Suoxing Zhang <aftern00n@qq.com>
>> Signed-off-by: Qingyue Zhang <chunzhennn@qq.com>
> 
> 
> In the upstream merged commit:
> 
> commit c64eff368ac676e8540344d27a3de47e0ad90d21
> Author: Qingyue Zhang <chunzhennn@qq.com>
> Date:   Wed Aug 27 19:43:39 2025 +0800
> 
>     io_uring/kbuf: fix signedness in this_len calculation
> 
>     When importing and using buffers, buf->len is considered unsigned.
>     However, buf->len is converted to signed int when committing. This can
>     lead to unexpected behavior if the buffer is large enough to be
>     interpreted as a negative value. Make min_t calculation unsigned.
> 
>     Fixes: ae98dbf43d75 ("io_uring/kbuf: add support for incremental buffer consumption")
>     Co-developed-by: Suoxing Zhang <aftern00n@qq.com>
>     Signed-off-by: Suoxing Zhang <aftern00n@qq.com>
>     Signed-off-by: Qingyue Zhang <chunzhennn@qq.com>
>     Link: https://lore.kernel.org/r/tencent_4DBB3674C0419BEC2C0C525949DA410CA307@qq.com
>     Signed-off-by: Jens Axboe <axboe@kernel.dk>
> 
> diff --git a/io_uring/kbuf.c b/io_uring/kbuf.c
> index f2d2cc319faa..81a13338dfab 100644
> --- a/io_uring/kbuf.c
> +++ b/io_uring/kbuf.c
> @@ -39,7 +39,7 @@ static bool io_kbuf_inc_commit(struct io_buffer_list *bl, int len)
>                 u32 this_len;
> 
>                 buf = io_ring_head_to_buf(bl->buf_ring, bl->head, bl->mask);
> -               this_len = min_t(int, len, buf->len);
> +               this_len = min_t(u32, len, buf->len);
>                 buf->len -= this_len;
>                 if (buf->len) {
>                         buf->addr += this_len;
> 
> 
> I see the Fixes tag documented is "Fixes: ae98dbf43d75
> ("io_uring/kbuf: add support for incremental buffer consumption")"
>
> I think a more accurate Fixes tag is "Fixes: cf9536e550dd
> ("io_uring/kbuf: enable bundles for incrementally consumed buffers")"
> , Reason: Commit cf9536e550dd243a1681fdbf804221527da20a80 is the first
> to move incremental-buffer accounting into the new helper
> io_kbuf_inc_commit(), introducing this_len = min_t(int, len,
> buf->len);. The signed int here is exactly what
> c64eff368ac676e8540344d27a3de47e0ad90d21 corrects.

I took a look, and indeed, it is mis-tagged. The correct fixes tag
should've been for cf9536e550dd.

-- 
Jens Axboe
