Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFCC38AC80
	for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 16:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785428711; cv=none; b=gdMOvx3QdkpZpgMox52xzVNoKwbjk2zxxBi3DUAL1zcMnbax0JsT+KFnVa51xqo/fEUQYVltybU5oofzMuX1qv5j8wJybA9HMcGxRo2/SNTj8OhpATrqsbH9HRl7LF7GFRrcZG5wrZwVIORBVBUDXG+HkkX0khRuFYjqL90uIko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785428711; c=relaxed/simple;
	bh=CWxVLNPMf30pt4+VlSY6EdX1cU2VxBfirKfTyTscMUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R0grfpD05KOXmN0P7W+pkKIF86blNdHCV+/VIP2PuuzsjqPGz7+4DoNecsvZV3IkQWqfxgW1DR9l2pLuGZpqRkjImRlnIKLYzf4nffvPujIioAu0xZ9DGS9v5V+Tx4i7XsCYPE9ClcPE032ps5i/ULfGpqxfCtpKKsZBo7dMhTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=reimWQUr; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="reimWQUr"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7eb63dbd229so784301a34.1
        for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 09:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1785428709; x=1786033509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FCMCSSOZLCcsJg++A7AOf3GHD4mGUbbc8wGpe4AWlYQ=;
        b=reimWQUr82xbVTT1L/4jtcE7nT4/00gXhZ5co4mKCiMzs2c4lf6vsAWxSzWceVZiKn
         hnnuICguxlIxsXtkXc8Kv4RXJYq1/TMh698A1T3ctXb/KZ23ZsYMNxI/2RbhDKfFri4x
         7tXkBFdYcfaJcO8xFjSTreyLWnY6foEUKyBQ3FFQqTXK9PLz/Ogqq7S+CR7AN4khY2qS
         lgHD6IpstIOAngy7TGa863YiVPhxJumJLaAfcw06xpU88q8Jhi8aeDbXk03giuEMMfve
         QA6olvevyN2sqgwnBPfiH8iNgGkzTiVXHPrBSTmK5BxtT4FPdszPJJtjr3BTMhOVnMxf
         k+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785428709; x=1786033509;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FCMCSSOZLCcsJg++A7AOf3GHD4mGUbbc8wGpe4AWlYQ=;
        b=egHp/mNAvHWgSEZJhhiWdH7BlTDCjesaOh9lv2iCHGlh7QfFyXic1eMFqVa8w2VdlQ
         dBynO6CYUC9DLFPfUX9DK/8grHKvb6vhMMs32eaYDjz9Cwfm/a6OII7IVMHet9ImEHlX
         +CJpHytK0MuDU4Egj9AieTlplLBZe8VYp34YTXbpxGgmdejPyNlrIvNNijAVtMMgJp80
         eg0ALvnnfXhFP7Tct/DDUc3NjUa8AvGMu3ajtm3UoUvSkWnLcFFGK2o/KMOhDSPvF/o/
         YAC/NJYQGVXpv3anLzNtprSR+E1AFn6f56w1o16azLL/+ZOtV/30jlESYcsVaUjWSzvz
         B6Qg==
X-Forwarded-Encrypted: i=1; AHgh+RruSSftn9q+qaYpKE3ZBz9T52DUy63/RxCuCUuyVzmlLwSZOTg/pU1mxVG9dMgpw8yQe9+nYx1rjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9KMoEceCBqHneR5qXuGeCM1Uc9rnK+qvmHPLTSC3PBSbuKGeM
	Ta91xaa+YIxrynK62l2ha/CZ6X8YZIZmxAwS57ItnsNtWaP6vrr6+B6+NTXTL+en4eo=
X-Gm-Gg: AR+sD10MTBhT7L3iJPfvdjijcCA8GpBFxuq62URtIA4hqLDEjVYVdAkrIfMSJOu3gfm
	qAtcKqsQrXi2mBB1f0MvkkA82TaAHhq0k95Yulg86+ZGbGlkGyBPtmZ6ldqIdKRwvlHgHJ7ERqY
	mQIQ1CaR8WwQiq6PuXKbOoFlPBjr1Gr4OQq3uR4BTBru9VClM3i5wE5UDXLG4pAysD0TgrQtrIj
	eMbrkRHWBIuanMhaoE4VDE+UG/PpfsSWnxc0YXjyE473zcNf8KO4r+T3dVgeE6GxmZz6hNaxGsZ
	w+aBF8et2e9egrpCR5qyaqsoGKcthwlKkIDrKIV8ptIVCX/xgXTtgvxLn1H8yUwCAbf63B7Tmu1
	h4OU9RqEgA/z/KNGysSBMswKjd9XQcR9LQXOcTmCwZhZSGNhhC3qRmUmOh/JN73HTft4KSqM6Ra
	paJIRIcFOPYK5j2LnqXRikcsgBGrA192RUUZGmsB+HKgsZi7cAvjyVmxL+Wvxcdc5rorK2ZGMhA
	zxrfD+UShkGl564drScAcE7fWGf3KR1gpztYIEonCfjlw==
X-Received: by 2002:a05:6830:6b03:b0:7e9:b673:cbfd with SMTP id 46e09a7af769-7f0430f11f7mr708390a34.7.1785428708795;
        Thu, 30 Jul 2026 09:25:08 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f00d5f4dfcsm5084595a34.10.2026.07.30.09.25.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:25:07 -0700 (PDT)
Message-ID: <a50c6a4d-5c25-4cbb-baac-f622728f2693@kernel.dk>
Date: Thu, 30 Jul 2026 10:25:06 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] io_uring/epoll: disallow adding an epoll file to an
 epoll context
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Xi Ruoyao <xry111@xry111.site>, io-uring@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, brauner@kernel.org,
 =?UTF-8?Q?Juan_Jos=C3=A9?= <soyjuanarbol@gmail.com>
References: <20260514140817.623026-1-axboe@kernel.dk>
 <20260514140817.623026-7-axboe@kernel.dk>
 <605939add4dfb674bd7ab39ef8dbd3fd22e754e4.camel@xry111.site>
 <427b15c8-c168-4e2a-ac38-b00dc00400d3@kernel.dk>
 <CAHk-=wjeSgFEr3WSO1C1sPP+fy+Mt5_EL9WXW-s11BOhD_S5Ag@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAHk-=wjeSgFEr3WSO1C1sPP+fy+Mt5_EL9WXW-s11BOhD_S5Ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/29/26 9:09 AM, Linus Torvalds wrote:
> On Wed, 29 Jul 2026 at 03:54, Jens Axboe <axboe@kernel.dk> wrote:
>>
>> I think it's pretty simple - if libuv is using nesting already, then
>> we will have to revert this single commit before 7.2 release.
> 
> Yup. What a horrible interface epoll is, and now it's made io_uring
> have any bugs it has. Oh well. Horrid or not, the first rule of kernel
> fight club is that we beat ourselves up to keep compatibility.

Exactly, no other recourse here than to just revert it. Unfortunately
my io_uring-7.2 branch is from pre merging of the epoll changes, as those
went in separately. Hence I can either prep a revert for you separately,
or you can just revert cfa1539b24af yourself since you have the context
as well. Let me know what you prefer!

-- 
Jens Axboe

