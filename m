Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6F53815E9
	for <io-uring@vger.kernel.org>; Thu, 26 Feb 2026 12:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772109440; cv=none; b=RlEzovMH9JTZ/CzB4mof7uM6GKXcZQpODl36VPdDJh48vm7bm47YhY+LFVayj1pFRezY9lEMMyiQ96Ni580c4H9z2tSzKUsb2TQFL0LhDtulom28i/f07y752qos2XNZoX7OY05jOkgOHhcy2Gg58GEpUx9Ade4yzSdoEJ24tqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772109440; c=relaxed/simple;
	bh=+1Uxs4sCFCr/De/3z06l+Ih/M148pK/yQchnDWWBtxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NEdVHo6G6fTHyaBlul2BsAbYe0SyG773R9XJX5VvVr94Tl/OwFGOrOT/5pBZ9I+NmNn5PMkEt2FXqKPeLfK+iIBf8+au8MW+oMJCsGK2Zc2xGw1SfxHW6HX9aEvrd3CerGrilcvPXc/GdSeAZEtQaLPt0B/T6aTC5anwIsHqQ6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=nIABarLH; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="nIABarLH"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-662f5c5507cso711003eaf.3
        for <io-uring@vger.kernel.org>; Thu, 26 Feb 2026 04:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1772109438; x=1772714238; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZOVykxEneTCF5yLl6mpMyii6tbNiavNGxREq+wigW4Y=;
        b=nIABarLHx4dhK+3Y/PYmngIn4ALX3Wyz/QFdvYk9EvoxAPGqYQxgySL6gFHTKU22+6
         ltXTAnRAiYhzRKyuZbuiXDPyOkQ8owwe4vcKkLbKt5qayrlw5elvb9xdYwvDYWQ/8HvK
         sJVVtptkzgQNZ8bZV5oQZ9ojOV/hDwV1wYUBoY4Of88aFDetVeMfK1wJykG9WaJ4GSL0
         s+zBIwCW0A3kS1Vlz1AJh8IDGQngs6WnheOeaR1kilH0AE+vAM7VZrzhJQUWKLqF5Nnx
         KvQV7wPxZfeAhhwRG9tH9bO8DQ1xqdkU4WNXABcer0lPxc3tdNERr80OIbl7n9/lucN8
         oXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772109438; x=1772714238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZOVykxEneTCF5yLl6mpMyii6tbNiavNGxREq+wigW4Y=;
        b=vave3uNmjlMPm3rRjYMwq4hlfYcEEtH6AJKpaCSsBgBleRtTV5iZMvTlERXH65XoXz
         mKhqa1R1IF1ux0zOVmjr0dtxC2BZteIZ1F3qos1HWWANoDAuqsBlRdyRA/EgArIr29u7
         uQ45NH7BtlEeiIulEHX/bbGhpqjpbRy4Lx/h2SwY0Jl6HI4DBPxoD1DGj//enojguYXF
         ykMOsA63LDCgSwRPD70DwNDqp6jEmtgeazCpCsryvsG9zlnhUoDOEwVYyVDMMficMy10
         +Vc1ovZT2A5OUmRWpDPyn3VopZlNfUZ89xfkbUQOYZCNSuAsAxFiDhyqQkuYlfeI5qPi
         uang==
X-Forwarded-Encrypted: i=1; AJvYcCWGqevhzUx6jyMpnxxqTca5gJms3zNCYlNXcdCLF9/O5x9l0WSw8OJZWMANwEnLAoV6v8lJO4kvTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyya8YiD4cYDazsI3U1L7WD9I1VhWhzp9NtlVq2Lj2waVhZscQ1
	bs2oCJLuA9VcaRBRGWKPv5vjzBGP7H5n7rv4Oz5ub/1Yjg13bc8W/Qfs/iCgV5xqgb4=
X-Gm-Gg: ATEYQzw3we95QVmt7Yqdvr3BAZ79u+agEAqBxGM4II7cDnr0EMFMsqaEvkMHHwLacWX
	5CyQnlurQKrvTfHeWIj2eKUiPVnBU+3gggtm4WNGF1ZorWpKzcT8q8iQqtQmiLP0jChNLCYyxka
	rPNbkoRMckjgweA+QHgDzaNybeT0+HRgj+5Q9wGMRuW2D5lYETcBx5QwC2m+F8wnJ49acHssNiX
	X32XK/YlJyjh5RQt4lpCE7PjH7CwnEWMjyULwLkAooqYuPgjRYbUJjPSURJom3wQ/3VUAIppE2H
	UJqEaTmDm/hjDzs1TL/JWB49S09LFG59h4EnXOKc9nsi/t8FuOsH342B/0D86DIY2JpQRQbRJ0P
	E9eXYJFMZ8bmIRGxSz+v4fxTdgdJpexo7gCeoqke7nbq6hbjcenAFBu1YRerFR9iigd/+l1PDHk
	MgvgThntpAcLqrmo84DFrU8qbmxtJDyA7Oc5/T8OKLeNVOoAAKdoex2fDEcfKsEA/NkyEhwUuIg
	t2LUMHvcA==
X-Received: by 2002:a05:6820:606:b0:679:953c:746e with SMTP id 006d021491bc7-679c44e34ffmr9357523eaf.41.1772109437836;
        Thu, 26 Feb 2026 04:37:17 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2bcbf22sm1424436eaf.2.2026.02.26.04.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 04:37:16 -0800 (PST)
Message-ID: <dc3079cf-15ac-416f-993c-9b81dafebeef@kernel.dk>
Date: Thu, 26 Feb 2026 05:37:15 -0700
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5.15.y] io_uring/io-wq: check IO_WQ_BIT_EXIT inside work
 run loop
To: Jianqiang kang <jianqkang@sina.cn>, gregkh@linuxfoundation.org,
 stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 asml.silence@gmail.com, io-uring@vger.kernel.org
References: <20260226062711.426301-1-jianqkang@sina.cn>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260226062711.426301-1-jianqkang@sina.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/25/26 11:27 PM, Jianqiang kang wrote:
> From: Jens Axboe <axboe@kernel.dk>
> 
> [ Upstream commit 10dc959398175736e495f71c771f8641e1ca1907 ]

This, and the one for 6.1 is fine to be applied for stable, but if you
add this one for 5.15 then please also add it for 5.10 as well. Those
two codebases are the same in terms of io_uring, and hence any io_uring/
patch applied either should also go to the other.

-- 
Jens Axboe
