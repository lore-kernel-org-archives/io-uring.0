Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ED1451994
	for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 19:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785438689; cv=none; b=WZZm1NIzTnQWI7euLGtNe6x7vRMvmx7wUOT1+UPnui7YtKyaiEmL5ptmehsg9Ytn1YkyO9eUu6LE3HMhNB31jq2SFyqDa1+EHlbFTRVbqt+Uzarhir64lAZWlP6dOU0odFUbFpbSBjuvwdzvy9Y3dDwbn9VGC7yMSt5Y+iqTzMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785438689; c=relaxed/simple;
	bh=cJ63BXZMNe1uR9WDgELx6Fj9oC9EAwfnNbOJJ077Vq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pb8BWCNRXSLO4teyOaXtObPKwEJAGu8zfurCYiAjxGl1WfQMZHYf7f27W44DAOda3Fd2l2eGxsNlZGyXxKmqwak59g+RrxpLHk+FTLYDQ9t9XCUIRqbqCdUGmDLZiCkhvi2XiLmGoOl4rYmgBskhpkncxW8i7+el+iObd2M1lAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=TXLjcIMX; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="TXLjcIMX"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7e9d7464b71so119901a34.0
        for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 12:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1785438683; x=1786043483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=50+BRi1M80OADWMBtwF8+tIWW7M6cT13tg7MUfRqqQQ=;
        b=TXLjcIMXo/Eh5AgN+poiFkHREYPmUBMuIhetTF1zjTzCUwPAY206t4/rH8HvKamkvO
         069oKewsEUvLsIXuIWawcDLeNHYC/OsrAiRe9D0g1N23UtWpr5jgDIspCHUL0wQBXOWa
         RgVA9BQPG6lJWb8ptaQF1/pRZGg2mvX3yrFr6ucRYfGOtTjSHXL2iasQIK+cajcySVMT
         hIt/x5DGZt5s5qMIWIyNSH5+v3vdTO4NaC7gySXCidI7HAEnq3AnK1lzFG+kNKdQ8Tmg
         rsv+4pPJ8p2aELeoRgV4XyZdTyOnXFnX2PdH/6dtQ+i4thd504aQse5J8Vn1HWw2WsUA
         nc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785438683; x=1786043483;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=50+BRi1M80OADWMBtwF8+tIWW7M6cT13tg7MUfRqqQQ=;
        b=tOZggCSw0dChjCRHyBCrZT9Khj8W1bA8eRYAeLYgeo3sJX3K41ppSLzxFkMo3YWVtC
         dC5f3Iof1hKoy7oQqbTOdUTGRPYSLefr+5OcPC60iZcOLXnZRjHfQv1zqkgrMz8V1P4s
         3B45rFVfyCA+bK7oEx6ceZ5Hyd+ALAC7Z3s/bFFrnxgaVd8tJwi9MceXcG2+PbzLCguc
         8ETh7TwOz7CGeFyTfYenwoE/cuqERTA2ZPdOssRyOq90ycu9OmrcbqNDa+aPi1aEjOU+
         heg1mRyY47Ws1/beBt/OVMo2iE6I45GOVJ3hpivHvAJoc0M+sbDM76aVtzDngaBf542T
         gG7A==
X-Forwarded-Encrypted: i=1; AHgh+Rp17wWg0PL5MU5oF68iEGzcx+YSZ40BKVX4SlDUcV5xynsJGmrKGil13UaAqlpgzfUJeauYFeL+uQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzxXxSmR10viGPe5XCH/lvO4mkOKhRCihAyC7/l6xoNEio5IXc
	bI187FZmNcP9K7rrA8KLD6KbGPN9488swRFM0/NIIppA4X7ZhLMFIVsaV+Kl4W5eeRY=
X-Gm-Gg: AR+sD12O+VJVKGfbwWYJDgGjJ/wz4sUPPg+1Vt4BHGSAV1nDADA3YHK5puywDmGM+nC
	ZQZXqOtjep52niO+QkPCoZ70l1NHQyng2Fl+arFnQVCVf+8MUufWTQ4buZnPn3nIQ1aA/QGlY+f
	J3c8BtDhe464b1lMBMI2/xbnS15cJAGPySHFEnkyUREm7vjNuVY/7hw3xqaJbFcKGiW4WcwfP0d
	TBEDyAhfhAJl7BOvI0mwLu/PA+LOhUTvYztEK1Uw/AolwM+gEN9zBMKi7MLFZqQNDjsRfPwuF2A
	MpZx3dlFes92ZL8fzsXCH5vkYvd6u4XpItKGlvaS2pkqcS0JIyL5baWjfRNpTcDNqZ3ad3VkhCK
	EkPW/oJdz+rmIQiqD2ISpg1JdF0cB5eOZhTL0iykHYch3kKdB4ozziueNMwrcz7j2jtCGP3dJF9
	yk6pAzWobJWCujetLI8EDA2WGrOZ3VyejWsKZMHOoehcnBN/6D9ZpdnApz9uLZXMuAkMOS3M/Jg
	zi3G5fb8P3YlRkWAlVBGgYZx8Hc1K8MuG0oiYwLS8CoBr4=
X-Received: by 2002:a05:6830:488b:b0:7ec:553b:4964 with SMTP id 46e09a7af769-7f02c15619dmr3071607a34.24.1785438682818;
        Thu, 30 Jul 2026 12:11:22 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f00d595321sm5403413a34.6.2026.07.30.12.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 12:11:21 -0700 (PDT)
Message-ID: <be4367b4-5846-4595-99cd-204b8ad48293@kernel.dk>
Date: Thu, 30 Jul 2026 13:11:19 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring: preserve task restrictions across exec
To: =?UTF-8?B?7J206rec66+8?= <fyonglkm@gmail.com>, io-uring@vger.kernel.org
Cc: stable@vger.kernel.org
References: <CAPLyb-a7bWCq0GzyOcztLm3-7H0GOP64JynosfO9k+yHy7diPw@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAPLyb-a7bWCq0GzyOcztLm3-7H0GOP64JynosfO9k+yHy7diPw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This patch is completely mangled, email too fwiw. Can you please send a
text/plain variant? Thanks!

-- 
Jens Axboe
