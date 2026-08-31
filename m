Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15FE39BFE7
	for <io-uring@vger.kernel.org>; Mon, 31 Aug 2026 18:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199803; cv=none; b=oXmYOsOnMJ4L7XxyRvqd4cI5jAyj8R/THmd0W6k/9hYaO2MQnWM8xBnsFGsiM+AGOc97crlTKt3YFhCmhbvkopGqdb1Eir9D1ZD+kCkTMCV7REkcrIG3rme0ANaltWwTBnuJNRyjZ/A3UkZJCC2ZPdzh2SjAWm05w3mf9Ff44So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199803; c=relaxed/simple;
	bh=OUMY53HyrTCqQnkA8KrBjrrWVSQyECdBkTmSBNMfXJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E0sxnZljFqKYA4QYmBzm80MRhpfC16yyPOhVsRz5u2pgEPHWwmWTJm5ZEwNJHVzT6Kq2HfZ2zzPMKRB4tdXwf1kkjgP2YcwWKwH6STimdGZ0WwQrgNDAJGouRZ6rq6ek1mVnD6qzcU0Gd2bUyOnMkAZWb31V9ajAG1ZBE2XhpWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20251104.gappssmtp.com header.i=@davidwei-uk.20251104.gappssmtp.com header.b=dzGFFAQ6; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20251104.gappssmtp.com header.i=@davidwei-uk.20251104.gappssmtp.com header.b="dzGFFAQ6"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso69323a91.3
        for <io-uring@vger.kernel.org>; Mon, 31 Aug 2026 11:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20251104.gappssmtp.com; s=20251104; t=1788199801; x=1788804601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uFdfHylOXjETtPhdnLAsv7jcCEOZVeZCY1hqt4pQN3M=;
        b=dzGFFAQ6IENy3JO1WHK87RhnC4ljyMffWkW0uckANcchjKJ0bu1uHlWtMQxL400Qv6
         qywLnMyeqrZ0wQ+z8JKTEc/HcqynjvBFPOfXWpq+fK0JJUdbMiZnKimx9Oj2MKhCNmfZ
         a6VoXI61bVr5LZTwDUxchBqxJUcoeXDYKzjdjY1pj6EcIM8sPac9sHtJ61pNqWVoJTxK
         XBUyvOUXxD9LtZ/26kla1d1omN6d+egphBu9cT1XzWKEPe2hFwlMaMuhz8UEAO6Phy1L
         CRXkBixUvrO1RKI02WxY5+IQaNhyqEQI/+23Cw5jQET04cGwPw13Ig1kBrtFBKqHnhlg
         yDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199801; x=1788804601;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uFdfHylOXjETtPhdnLAsv7jcCEOZVeZCY1hqt4pQN3M=;
        b=Zb1xzBk6LDNQwASdhei7Zzg2luvtPiKgLgIm27K9/CqaRyeyfgL0DnTf/xsIWGeEG9
         HXxBgBD5A7oXsFoM+N1oUCTcxhU73qhfRNiQ0DoBL7ymXNmdwgJwyEEEC6Rcr07T1Oj4
         e5KVkYDJkun/2CktCDOVqaW4dMfX0PiiRO3NCu0I5iF9vKNElGYccLXqlckIbbvQcqEc
         UWQN2uk7M4H+95CITt6ynPYaXR5Dt4/6MQ9bSD1ZFid8OgpCl5jxKNq0ZCtM+rSbc544
         dpMUJIsoH2ZKZz7Vpd/dE/KsnyxRaxx5M4kEJsDKGUPkpZa9uy8Wmjj7TKWq+Qy6UAOi
         veqg==
X-Gm-Message-State: AFuF++lFuFPQ8UgKLMECHazQ8Srm94AoQg7gQ0mlSGbV7C/QLpmDFDl6
	yCD+Opl6U0dX31237tlRLo8116kK4+6akp2EPpfBXJYPioQYeVmoJuaVVUoLKzBELOE=
X-Gm-Gg: AYBFou0Gcqi/yAQCk/GoAq5tuCYhfwUMP458Gu5xZG+CopYONofXE9sRJlY01xKMfVV
	N+Ar9V764Lib8AkaqUAp1A9J98AUEugig4in4pBRg9EMhVkH7exuifg9Rfe8usZ4eHDf52ggjyc
	UqVSTO7yJB/Ud2t/zsYDjHlkBlg0bN9vIbtj6LeMWWlZAt+xwz2ngLqLqaY1Fg7JB3hK2eulUrB
	tVFym9KcSGV2ZTWJnPrnu540zvgua31JvYI60CkEkMGgPznYmd0Y8iAYGufYsCTBUEakQdEUMwV
	iMLX2mFG/Gld7WBYi5OzaFy6DJgP05eGiKg4xmHJkVd4iV5ZvGLsKPVFDmecYF53GbjLarJDCBQ
	wdcPcDyX0zyk07VIctRhH7glf+7y+783MQo5rVjGffbpzp4XnHbK7UWfGSHm+Dr16RWINjpDxcz
	zeqY/Wr1l7gD4KihZxw84qrAOatfSjsYYMzq+vw55+NF5MkVTY5hGdbGnVOu5EoJtCzclz3MV4K
	ewhj/UkHdTzMZWDsaF+9U515uDUbozi4JRKZ45KRwFu8Nm0I+Vo6Ju6jwODiA==
X-Received: by 2002:a17:90b:5102:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-396d0ea862fmr45975458a91.6.1788199798914;
        Mon, 31 Aug 2026 11:09:58 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1156:1:c8f:b917:4342:fa09? ([2620:10d:c090:500::7:1753])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0de4de3sm41695477c88.12.2026.08.31.11.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 11:09:58 -0700 (PDT)
Message-ID: <4388edf9-7248-48e6-876d-daf3bff39e7c@davidwei.uk>
Date: Mon, 31 Aug 2026 11:09:57 -0700
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 2/6] selftests: net: remove unused variable in
 process_recvzc()
To: Juanlu Herrero <juanlu@fastmail.com>, netdev@vger.kernel.org
Cc: io-uring@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org, asml.silence@gmail.com,
 pabeni@redhat.com, shuah@kernel.org
References: <20260831-iou-zcrx-v6-0-02d1d012f0fd@fastmail.com>
 <20260831-iou-zcrx-v6-2-02d1d012f0fd@fastmail.com>
Content-Language: en-US
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20260831-iou-zcrx-v6-2-02d1d012f0fd@fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-08-31 10:34, Juanlu Herrero wrote:
> Remove the unused `sqe` variable in preparation for the multiqueue rss
> selftest changes to process_recvzc() in the following commits.
> 
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Juanlu Herrero <juanlu@fastmail.com>
> ---
>   tools/testing/selftests/drivers/net/hw/iou-zcrx.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> index df6b62204343..c6dbd0ad5368 100644
> --- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> +++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> @@ -269,7 +269,6 @@ static void process_recvzc(struct io_uring *ring, struct io_uring_cqe *cqe)
>   	unsigned rq_mask = rq_ring.ring_entries - 1;
>   	struct io_uring_zcrx_cqe *rcqe;
>   	struct io_uring_zcrx_rqe *rqe;
> -	struct io_uring_sqe *sqe;
>   	uint64_t mask;
>   	char *data;
>   	ssize_t n;
> 

Reviewed-by: David Wei <dw@davidwei.uk>
