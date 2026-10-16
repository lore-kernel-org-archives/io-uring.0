Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C72152CCD3
	for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 16:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168175; cv=none; b=s0f9YYK4Ca4z280pIaZVE3yTwk2FasNSoj5nHjuKNWk4NJTFQHEoAkH7Q+ffFHXrzCLEQ4P9ASZsVinKtTKU/PHBx2SLIbnP/cCPWxZpe0QT3weI8fn86OEgSTByyS2og5KvfS5EZ+05aO7/75RKSEPAbkpQtT+YkO82fnr4+uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168175; c=relaxed/simple;
	bh=9ErjyvGtQc7fKY49tvxPQJRTDq2ogdghdBtx9fQfQYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UDOGxt80JyIs2Wj8JOhUwmJlLFEmd4KmPw6AbBTkmWREWf9uwOpdiLRyxciYNljqOxNZgJfBmwP7uEv4aaDxOXPY5QkzH6xzdkF9TKOGwjDK6MoCefkiFV9sPZxsXNipA4fbjZjBEzejUiqW6cclvXyCxaUBR2X519GvU2hPZjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=wTbYLbSc; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="wTbYLbSc"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so183816a91.2
        for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 09:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792168169; x=1792772969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uS7hidP/ZtYW51MHj0LfYJgg3snN0WaRFxiTFQxww9c=;
        b=wTbYLbScalyRYUkL9rvJgC0wnwXgtWIjbd3k4QZITPiJ9TpVzd2spQbjWnlzYC5jPw
         9xKP7T4sKK+TSsSytCdDBgvBljr+yxCoM/H8Mj7EUWlelYgcaVh0kKAcWSrT/dwkgXW9
         uhnOFCRpsh977k//UbAY7SuFh6n9u1ns0rLs4ycQZpzMjUrRUAcEcmudw6BRlXSwuKZm
         UuUcBIqdRz2zZV/jlaTTbbXUNIDlD8pHlwbI1FVWYNzhvU6+zETxuK4XNNOkjgH1i8gO
         6o+wvjhxGR5MfrGErbFqkymUo3eTiiDbVYGUlN+mcQEaDiysnJjmMmC2f3FT7MxBovjI
         j+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168169; x=1792772969;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uS7hidP/ZtYW51MHj0LfYJgg3snN0WaRFxiTFQxww9c=;
        b=UGMFwvgTY6vwexzHUOMFljgX2fagS8g6YVzZzmgt0SlDq+/WGG6r0ip+NJUj3Cerqf
         Ra2pzNxNLlipX8HxsRofQ6FvhDgiaZ8LuPJOqx1SeWe/5rbnc+JPQnxJisWySIUSEmoe
         WXWvY08Nydx1o8N4DKK6Gnfa8uR/oFSntZYRRylLdredldTL4qdsRWIQzvnLrC0cX6dN
         IjZeo6nNiP4blFir+S1xrOwpGus65/EeVkqRCthjwr9beV4peRogTYxTIDRv5wYjMF2b
         1MWFvSrTyRC25VVYlsbwlKczxlttW3OeA13BaS/cCSI2gArwZozJ8DBGpK3Nu0nKpdZl
         uc5g==
X-Forwarded-Encrypted: i=1; AKwUvBxn2NREgmLFM1BucSIZwwmiKz/gvMyI2vCSuIN4gJTOAXXydW2YxHbdUSLEL7BR/5n5499XUleSDg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLDPYyc7rHpHtXEbiKE6cQt1HXe2whEQCgHuTbGRdRcsOtShgIG
	bb0sowHLztGfAoqwJaDO+8u9UqkHsuvaWo8p8n7Ue/8an8QjUR52S3b6ZwpSBsMqzl8=
X-Gm-Gg: AYBFou1JCrW5JfCLU02+vV8gcjagq46ksyCsx9XEUhgi+ZFYVHEsbNGRpru/qJ5EGHB
	uUQ8Oi1/EbTfUGw3pTFWde2trn7RoMbLaIUoCZ/NbLdX2u2m3+1AhwPKh+uSasx9Vf0I0jY9C7S
	Nvdzt9OOrjPTBZPQrj4HrSXOBZZEEdxXQurD8Jje727HijmwYeWCXGWE6BYkw7lO9X6z4JfyCLh
	pamCJiID+vCgi4pXNuIpDiSfZFAOtZZnbgeZLUhAHTrMKC5p+0zZftQZCYrQ2NCt+NAUnKEc1xN
	J0QqMaitCOMC0qxNa+/WycrLN6PbqG+xeZt6mrR1cRt9kXEXLC2PcrqxWtHQTsGhuTFBkQrDB6q
	2KlNAVjd1vheKzI6GYHsQn4NqEvNatInN3EheTF6BOkLqec547/6Uhpw8s4oah4mk2VtWwRK6pa
	16kFIH9QTJS4tF+7DLYml7wEq8yG1XkL6uh0VnvXCYY8Wxw96a3LYOKyGsaMCv26z/GMUHoMyCf
	uX4uolSk9jWT9v89rYpf8v7V1pz945mOEtmuK0qCHbdw82BsGe0yYaa+g==
X-Received: by 2002:a17:90b:3c0f:b0:3ab:2737:3395 with SMTP id 98e67ed59e1d1-3aceefab97amr298284a91.42.1792168169061;
        Fri, 16 Oct 2026 09:29:29 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947928b4sm9461837a91.11.2026.10.16.09.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 09:29:28 -0700 (PDT)
Message-ID: <9d696969-ecca-413c-b96f-8fae5bb469a4@kernel.dk>
Date: Fri, 16 Oct 2026 10:29:24 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH liburing] examples/zcrx: don't forget to sync dmabuf
To: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org
References: <73b2654e41519acb2ec310ba1d6dc99cbafcbdfd.1792167723.git.asml.silence@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <73b2654e41519acb2ec310ba1d6dc99cbafcbdfd.1792167723.git.asml.silence@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/26 10:25 AM, Pavel Begunkov wrote:
> dma-bufs are not always coherent and we need to sync it before
> accessing. Use proper dma-buf API for that.

Can we get a Fixes tag for this please? Other fixes from today
lacked that as well, please always add fixes tags.

-- 
Jens Axboe

