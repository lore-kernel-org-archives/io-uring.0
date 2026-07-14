Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F16A3D1A82
	for <io-uring@vger.kernel.org>; Tue, 14 Jul 2026 18:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784052924; cv=none; b=PQvhHeWjWuSm407l+mbFEF3HnLauL/4MnBRCUhIqtNC3oGkYWWsASdTsHvN1Zxzom5COOCUgQfFMKHPGLkJpexxaw2nNbMYrv7WGOSWXcHXtUtk9n3RjX3pvnlek6t8ikNChzFGF3YeoJsRQCRAEcq1oHyK9XbIOrCp6K3SyBG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784052924; c=relaxed/simple;
	bh=RQyRz2x0B87C3KsROHKivHuHxjFF4oCHA/vmK16NX98=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FLMOfxkQp94sINZmATZ8GFnL/RzOt0h5eWPXvQ8XGdF4LxbDN6uN7ocM3QVliV2Yk5rCpbwExX2UjjG+7+0JQWiASoXBRcWih49/Oqn2o0oWMNrX1hNtjDoNFIxB8JJJ7K4EUyfNLXmpQInCDKcivQBQ+FC+L4M8i3BIzGJQKZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=bdzf9y/5; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="bdzf9y/5"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6a1888969ddso2648555eaf.3
        for <io-uring@vger.kernel.org>; Tue, 14 Jul 2026 11:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1784052921; x=1784657721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ahHJxIcQu5sgoDGcIqk+Fhw53tp7ZJzFR6fsOIY6gHA=;
        b=bdzf9y/5B9ym7n3vc4Qcv+jE1kvH/mOTf9ZS0lIK4qKtlhE643A57nVhRezLuJ6TB4
         XJh325eC3/i721QRxdaQI+STM3fdopwcmQBDYc7E8ox2sIq2t50K2fLb7QF2LImduTYs
         U27Xn/GBUJxY8mAHPFTttDIrJyrxX33w6Z70h5nmAqUN0ODYXllou8BJFeEeihmBZd6+
         +7z5hBisr/gdiTBnrOkdjtpqIj3OC0gW+10CA9unuq9f1hqBeBflKG4GvHdaG3eoYEvN
         3QdATr42JfRUhoY+1X9p4hmsrn91l3RaES4cYHNHSuho4ca+aadTM5VyCN1i/Mw3aGZj
         moAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784052921; x=1784657721;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahHJxIcQu5sgoDGcIqk+Fhw53tp7ZJzFR6fsOIY6gHA=;
        b=nhmoiUlMcOUOycP2Sv0kGS8Hp2wNl/n0OKV3zO/7zW76LxCxoEyrWrM1tx7Lib6KP9
         Of07xjbyzZlBM2+4Fu1gQXQXHOC2INZZXm45ZN3ncce7c+uZg2+l5aXdCsopsA1bTvy+
         53YaUJ9HNCnsRGsmpwvVIm1uDCRoXVBfZYhlxKA3MQLmoaGWEhTpqPHuIVOZZVEaXJUn
         BgjCQH0ZVRLW+GEEnQXjaeyZLp47Hv0EDQkny/ABlY6mqd7na/tXF197dUCKKaYaTCj+
         CSD/Gu5/KxBnlKhij66oE7p544MOqfLC/cJhFbB4vclZpVTV9YjglNbtA7Nz1xQo9BGs
         NAjQ==
X-Gm-Message-State: AOJu0YxxslKrLAmUaC0TnjSnv1F0NISxutV4pHinKkLEFrtE2rPiP77k
	6Ra6FMKBJNQHbN/H5azgK8+uq6nn4w3IBeXAAEYmQEPt/Q6BNSyv4rNgMIJvauSIOue13XuteJE
	BkcdYIUE=
X-Gm-Gg: AfdE7cn8xhSYch0wF8+DBrulO4IM0T+8dtPiIhtXBH1vhL8SrB+05kMvI5GJvBv8mus
	LEDFMo3GL5QyHL/tlhdJgkWXXzj2sHVDNTmfiAM03nTGZZ7sanHmve0lLKMFNBbZ3y5astMzAZ4
	ZXbTwn66XhflP9b3sNsrnGjOn4xjoXdfPMh4qC5r9wDsv9nbEwCWWnysxpFuZtaTzbAT3PVCagB
	X+/T7EmI9zJuualPf+XsZng1b0D5URZ+78uvCcGlOQJtoG3Vyw4b+KLOWTuwfjOVkMTc4JwJtIm
	m3aO8b5lT6U3tGf1VA4C+A9pYn3No/40dmUEH1HKZR4QJJnd1EZb+6qae0JZB5iLOozIIpZfC41
	Gv1VjEA8j9c3LP7rEywUQePY7TOYukw/321mYPjzfLq9Lfj4RreEwZRcF5/EMa/Ee7d2OX+htqM
	H2MUyloIM5sQsUTyyzDGrEUUSFUhQhbxSlZbByO+agn+D71D0mB1wvk9+wp28dpT3wSA==
X-Received: by 2002:a05:6820:1f02:b0:6a1:656a:9a03 with SMTP id 006d021491bc7-6a3cbc12b8cmr1642046eaf.70.1784052921102;
        Tue, 14 Jul 2026 11:15:21 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451b64192adsm14611854fac.18.2026.07.14.11.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:15:19 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Jaeyeong Lee <iostreampy@proton.me>
Cc: io-uring@vger.kernel.org
In-Reply-To: <20260712142612.188695595-iostreampy@proton.me>
References: <20260712142612.188695595-iostreampy@proton.me>
Subject: Re: [PATCH] io_uring/kbuf: free the replaced iovec after a
 successful grow
Message-Id: <178405291867.1280771.1049344580537073999.b4-ty@b4>
Date: Tue, 14 Jul 2026 12:15:18 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sun, 12 Jul 2026 14:27:12 +0000, Jaeyeong Lee wrote:
> The provided-buffer validation fix deferred freeing a cached iovec
> until validation completed. However, the deferred free uses arg->iovs.
> After a grow, that points to the newly allocated array. Without a grow,
> it points to the cached array that remains in use.
> 
> This leaves the caller with a dangling iovec in both cases and can
> result in repeated frees. Only free org_iovs when arg->iovs actually
> replaced it.
> 
> [...]

Applied, thanks!

[1/1] io_uring/kbuf: free the replaced iovec after a successful grow
      commit: f1596ba3e6b390aa0fef8466afce44efecf39d8d

Best regards,
-- 
Jens Axboe



