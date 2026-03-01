Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEB5329C5F
	for <io-uring@vger.kernel.org>; Sun,  1 Mar 2026 13:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772370914; cv=none; b=XE5abD8nPeir38R98pT2BhFXVLBhwqGWH9qi9MZwEi8befQb1ooUkhQ3q4ouBbCEwSY1knU7K3j/SwaHwrJVad73a7NzxXlFtILvPKuP34xHMVjXZ4O88WGzmV86/Vw/dKwt0QcDRSt1PayVe5PZ355ztSM6kdZPrdOMmRAsx54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772370914; c=relaxed/simple;
	bh=Yx1iWzXbketPlLS3CCBPgDy4YcUQx0fAEoEhNdJTfOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PVnuPZvMHh+V8KH/u+r6EtZicWT1kkCvrbhqYJu6+B9hPMcvMGnj8VupIdd5T98Oz9zJK4JrxGWhF8Fj8W4nGUep2PvtD5/VBHcNmceouiwN/8XhDyKnA+48sjFvr6RGo6J303ooWjjDiM/MKp+0/5EcXBgAhgiSBQxmmEqM3iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=OdlzmlSl; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="OdlzmlSl"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d596ab0917so1719147a34.1
        for <io-uring@vger.kernel.org>; Sun, 01 Mar 2026 05:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1772370912; x=1772975712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jJzjlOqnmdjDf8Tf1+clY7nIHTFcfOsSR1qI8ztRNbo=;
        b=OdlzmlSlXj2Y5lnEjJ2b6YFyHRFTuhlskT4vNy+RURmO0NPQa1YdvRrYqHXVgYvfSa
         EJRvE/BCOHyTJ5tXt7UU4+ebBxB+TZ0sKBsQgP+qTWNhBuR2WHEMfCbUazxaRKN9Bz3l
         DNQ+UsB2y0PQIXQxQNkIsxu56ZYjTy6vLe3W/CclH+dGFVBsVue8xNiSDHLqJgir0rQD
         cG6P1bYsCFCzsdER6NWWj9Dx6GUeL66XCIJ0cvtE6BMXdki8YIcgXkH3b2JDm6WhaomH
         u0NhJ8jzlNZiRrhwvXHTCbkb0drqvZ9HiSdWCr819ess/dmG88aWC0FUIe6nyE0LQxsR
         M5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772370912; x=1772975712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJzjlOqnmdjDf8Tf1+clY7nIHTFcfOsSR1qI8ztRNbo=;
        b=DYVZEw3tTKnPHiffSOK39pK5pFNbwwq7spTlZDb979SZ4OM2oTgcv9fvQggAWWGNGk
         0n14lm+Mb10ST2ImdSiif+qEg1QxxxSgWBDuZIwGaCE/6W1QznuqSV03hJsvBnN+OVwj
         +uG90eT41jlDmfvmzfv2+miqpHmTaXANjAkL5Qfua9fVIScJ0B/jU259KhKgWxO9czsO
         eZ6R5BIPPoYccw4xC8sO1etthXvf10GgL7rLkh635bQxGtXUma0LtkvByo8BDfF7KQKs
         jcFrL4RpCW+5p0dmeP3cETuC3Wh9t1J8+le0no+8ouyIFr1XlkNsTrIjKzbha5JQkAiB
         K5KA==
X-Gm-Message-State: AOJu0YzPabSJPZxOLymNDM2iXecM0qK7Pfs5rVEoRWv7lFc11c7kWaJb
	V0iZwTDfjFVr1a+bFEj9Xi73Oa5N4zAPaF89VOE9qJPdPkUoWUVrBkrxsfEvXKxEUmw=
X-Gm-Gg: ATEYQzy+O1AJEnUj0+2ltZPedgMDN2b7GAreCr0Ua03aNdJpFGfQ9EjgPSDeUdrhiKi
	/OAvnJ8/UFKjXd4/Lly5+bfFdUfOZ/+tvrWycgfuEDJ7On1bbNJmz260XTdciYidk62gsvA2twX
	G6tQ83G8r+6LVz6zpmuHKAzN974T+OxKevEqgm8I6xiZk7JVmgKyWAmBegLLJ8qYjn8vmAJ7911
	IxG5f3njfBAHt9zcs3aWdwJACYRr9vYKBHOpvbHU3hJQTUQ9R5FJzfV6pYJYguOGiw1jfdWMUz7
	F75X46K4d4cZaDd8oNw02oSFHQ81Ljgi+U+HUSj9nPnSGbX+nnqkRB9wnaGQOwMmigHXYXpw6zL
	4J7HIqWg1x57x+iIPdFugNNxhLS0Wi2fgb+zHxcXuYx9pgAj4ruWg2CHbYq36xy7r/y4gxS7lo1
	JQgDEMpPKv/YcCsLnoflA+vNbMbjurMe8RcpOdOcrpckqaFFnzdbdxXbc0R1jQ1yy7vzg+oZstR
	9tDNgODwQ==
X-Received: by 2002:a05:6830:6583:b0:7cf:d14c:ca0b with SMTP id 46e09a7af769-7d591e52b43mr5376382a34.4.1772370912085;
        Sun, 01 Mar 2026 05:15:12 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d58666ea95sm8487349a34.28.2026.03.01.05.15.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 05:15:11 -0800 (PST)
Message-ID: <eb41b6f9-08f4-4972-99d4-3340571830bc@kernel.dk>
Date: Sun, 1 Mar 2026 06:15:10 -0700
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: FAILED: Patch "io_uring/filetable: clamp alloc_hint to the
 configured alloc range" failed to apply to 6.1-stable tree
To: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org
Cc: io-uring@vger.kernel.org
References: <20260301014717.1711200-1-sashal@kernel.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260301014717.1711200-1-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/28/26 6:47 PM, Sasha Levin wrote:
> The patch below does not apply to the 6.1-stable tree.
> If someone wants it applied there, or to any other stable or longterm
> tree, then please email the backport, including the original git commit
> id to <stable@vger.kernel.org>.

And this one also picks cleanly into 6.1-stable. Not sure what is
going on at your end?

-- 
Jens Axboe

