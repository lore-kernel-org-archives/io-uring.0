Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C151828C854
	for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 10:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784716366; cv=none; b=eHmzeUvRMfpsjrrdTUY7PuNsGTKwwKmAdbSPHHhtljuCxga35RONLFv+x6StUBOwMAqLg6uUuqvlqdtZJrr9+8RkWmwPFLWZTmjOJPtj/aliCUCGNnvQt2Gi1XjVL3dkBT6jNKYbyN8jgKFLMD5G6XuBVg71x6d+u1ACJIitE8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784716366; c=relaxed/simple;
	bh=A0D/dFk7sg5e2+9ZXmd9skBcCE1bj0ll4q/I400gnXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uXGiWM1okp7nPTHyfZ2L0C2UfR1lXnHmjcCGKtkTZ2wUouNcXElrG4xLCm8kXnARkL4G5aaJJKiQVN/j1DsljhY0wkqZh+84Ceh/GxKhEGmKba/OKMwcr2IQbJO9Myg2WOvFqaPDh4rvz76xZSyx9uon1AZU5MbpBE45QERM9eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=VFsDnCcR; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="VFsDnCcR"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6a31b9a492aso7772083eaf.1
        for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 03:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1784716362; x=1785321162; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GLeihwkyuOSwZ0D77p/caa9cVB/Cpv97jWEzsyZiccU=;
        b=VFsDnCcRSdp5OZG3WyqIA8OsvOWLb3otV5vQk9BwvzvlxpY8HjJZoF5j8cJuNcbbPQ
         7s9Jkubn3qQxlkR2EgwqQM7TJxI/U2JuE08yinLotuGbRcUXjBmSO7KzgQ7J9VUZydfd
         +ujKnKMsolvYkjW9Cw3pLmRG3YBtIPfzRrc5YGMwnkkMJQA0DnzCpa7SNkw/EOz8dw9w
         YjY6SCrZhTL6hIweHP3w+3FLqVjwaXxMOupLMgkYbh2TODq2KOmMSvcIYQ8EpPdBlJyq
         a/Z8pQ2877JAcY4I1wYl23TMM/4wp9ptWt949CdB//COmi2sDK7YGoPDNRNeI3QZc/ka
         3F3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784716362; x=1785321162;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GLeihwkyuOSwZ0D77p/caa9cVB/Cpv97jWEzsyZiccU=;
        b=NSxBdiZKq4teo+o2zbFp0Dl276r6O8sD+8bHoXiYaMVCXaLfv9Cx7fe8rVPQfC3aKu
         FMEx1MuCuboFrjv5Cv90q5AJbi36VnHUkQ3xMurmvgrsrnx6VuAexrohoS2+zcSJFEhL
         4kOHKkolNd3hCe7sBbpR5L/1KnXMm98tvfMs4gU1PXcVbb4tZsSnjDqJ3UM4ty/DfjtK
         4T0UA5h4VRnQeNwAu6mtOiue8aULDFgG9l1Ak2uipWBrYIVIZJ9xX6eFURKOAa4kxAit
         C9IXoNslTiOXUJ4nU5BZFfKo1Gr9CoYUL0v25Cql7p8jef5JLiNTQ5DknzKXXvi+M15a
         PmHg==
X-Forwarded-Encrypted: i=1; AHgh+Rr9UdTsPdl0CiYLEiTRkyWeD7fSrdSD6Nbl/4Nn6i9rq/E+OoWKUyaPkw1h/2GMCFhP8o+VnQzQdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHfJVKo7mkR1vLIv2nVhj49VSH3UYKTGUraj8qsWgf2sFBgPrP
	7AVM/B/vHmAOAM/1nXpOFo02UcbO80yUwoVH3gDeGHMSVXZ+x6Y1FVprDpKDEFh/Lt4=
X-Gm-Gg: AR+sD10gBU6ORQKMFzS4igljzXtW0yRla4ogxpK5awZWshhE9a2sc7MQZv6MvMJ6Epi
	cb18ac4sCpoXx2w/TDCfPmO0/KbfAph6oU252BqE/KKsghxDn2TlxioLVUFXUn3qrSGvuH7KOpI
	x1dLxazxjPoPzBllTHKToimguO4ys7/E9mJBGaM+1vdm8G7nfKO39g4TtIiOfH6Q/cZAiUREofo
	QEi3ics6WW83N1YVi0gOqt3TCcIdCbX/wdmfCwiKJ4TOAAz8YFAW0MgWjQAALFxuzaNnBMSH++e
	HDjEIdS8VTNj2X/rnUX/VS1DpB2HOHOWlnZ4goCfjatD93WtEYZ0PPeB4YTi/ys02Rb3r5yefzD
	4xaDzZxIBcqcMA3U7VW6x2Xa81r219qIjef/2vwaTlGvxOvMLxWx7ozruTwhHpgPVKaKCJa8zho
	eAGblrnSQuzF13tFHEHWFQHwOoSd0d4ZquqwUhOamL66g3yR/FW7som/6Zkccm
X-Received: by 2002:a05:6820:188b:b0:6a1:50eb:d504 with SMTP id 006d021491bc7-6a536a908d3mr11100486eaf.69.1784716362501;
        Wed, 22 Jul 2026 03:32:42 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aa79ef5a37sm1267679eaf.13.2026.07.22.03.32.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 03:32:42 -0700 (PDT)
Message-ID: <902127f0-83b6-46d2-9e7e-71cee4d63016@kernel.dk>
Date: Wed, 22 Jul 2026 04:32:40 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/rw: fix missing ERESTARTSYS conversion in read
 paths
To: Yitang Yang <yi1tang.yang@gmail.com>
Cc: krisman@suse.de, io-uring@vger.kernel.org
References: <20260720114116.21830-1-yi1tang.yang@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260720114116.21830-1-yi1tang.yang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/20/26 5:41 AM, Yitang Yang wrote:
> Both read and write may receive internal restart error codes from
> the filesystem layer and should be converted to -EINTR. However,
> when multishot read support was added, the error code normalization
> was lost for both io_read() and io_read_mshot().
> 
> Extract the conversion into io_fixup_restart_res() and apply it
> in all three locations: io_rw_done(), io_read(), and io_read_mshot().

Functionally this looks good, just a few cosmetic nits below.

> Fixes: a08d195b586a ("io_uring/rw: split io_read() into a helper")
> Signed-off-by: Yitang Yang <yi1tang.yang@gmail.com>

And this one needs a Cc: stable@vger.kernel.org

> @@ -625,19 +643,7 @@ static inline void io_rw_done(struct io_kiocb *req, ssize_t ret)
>  
>  	/* transform internal restart error codes */
>  	if (unlikely(ret < 0)) {
> -		switch (ret) {
> -		case -ERESTARTSYS:
> -		case -ERESTARTNOINTR:
> -		case -ERESTARTNOHAND:
> -		case -ERESTART_RESTARTBLOCK:
> -			/*
> -			 * We can't just restart the syscall, since previously
> -			 * submitted sqes may already be in progress. Just fail
> -			 * this IO with EINTR.
> -			 */
> -			ret = -EINTR;
> -			break;
> -		}
> +		ret = io_fixup_restart_res(ret);
>  	}

No need for braces anymore on the 'if' statement, just drop those.

> @@ -1034,6 +1040,8 @@ int io_read(struct io_kiocb *req, unsigned int issue_flags)
>  
>  	if (req->flags & REQ_F_BUFFERS_COMMIT)
>  		io_kbuf_recycle(req, sel.buf_list, issue_flags);
> +
> +	ret = io_fixup_restart_res(ret);
>  	return ret;
>  }

return io_fixup_restart_res(ret);

-- 
Jens Axboe
