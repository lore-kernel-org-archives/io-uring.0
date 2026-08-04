Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B4B3FA5D0
	for <io-uring@vger.kernel.org>; Tue,  4 Aug 2026 02:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785809838; cv=none; b=PHFMlXN3xIPk7PwPGxY1UkkIWP5id8esHaiOa7ZAu3STXJ9PjC+FYSCyktAMjl3X3F8BfICrWN14NYWV9pF59F2/Ybwqm/B5JZ3KpRr2SPiEomNaE3m+fEt3WCyCnDw4i3BuvniA5QjHZEWERQ9IoRNNQpq1bUeP7Is2HFX1uuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785809838; c=relaxed/simple;
	bh=K3kmaFsARFB0MVXy8SS5byiGEIlyRwnovf/RCFlAoQ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZrRhYp3+UihyFx4EHmoEppkf5jKrFaxkWa919Fj1+Beidd7OIKkfFeJ14V0loXuDLQnnjTURfBI8/5pfd4o/FSOmnPI8ZBHvKEOu477Z8tJ9pCw5ZpARqBYJUJgkMYqWIbe3rsl8RdG4v7GnjJ8R5iNUi8bcUoSAQoHNJco+cGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=Qmm9Csst; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="Qmm9Csst"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7e9f69ee6f4so3625184a34.2
        for <io-uring@vger.kernel.org>; Mon, 03 Aug 2026 19:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1785809835; x=1786414635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qofCxvfgHqvdmuJYuBV7qbAn9jPgnX3RDR7CsSpoFqg=;
        b=Qmm9Csstr7raRt2lNVDH/hya8p6Mv4ARGgO6p2pVnZrA4oHAY9FlFU+B/YCAGbOnLj
         VEkDCNrHgsigs4RGmry5qWro65AjCPIJkDGexn45+NoVhe4sGaR+yzbK3LyX0z0Vgptt
         bIyhHoGI0oZTXW1yB1U7AjUGfWg7TJKBpr3DVrxORa33GhfYZVYWR6kIvV2qQAZll6fZ
         Y9h6IU+uwRcd2kJEs21+cR7j+84ot4nUyKdebx19hU1ZaIUiZb87RABISbAqkf2v2LRj
         I7GNUxcZruvKPAn+1FNgsHPOB67SOsyVHQFzf1Y1yhu5zLbGfDrpc6rTb6XBRl6goU09
         ZOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785809835; x=1786414635;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qofCxvfgHqvdmuJYuBV7qbAn9jPgnX3RDR7CsSpoFqg=;
        b=j7pbbA5TLgAZTHQO9YVafQZsi2YZozey4xjRJeW1AWMfWm7t4AEa4hrfFyG8zCiEY9
         mev8p3bOG9WcKtbI5XdAoJIZnE7AfKhOEPfh4+EATW8HKn4sBRfzpYZrSFEp1RDZv0kM
         7WrCSWbX0xV553Ay3RW3M62mOVr/x1XhDgIB3qJsMyihXz8sFCD/oo8oxKOEgvzLmi1a
         tTPbNn1ZhfQQJvghBFgUipH3Mgm5rBYTJq0uZSIIUojI6IPidaHIIYxLqR80icrA0Pow
         sKIlggs+1kprXqz4i/Fsv960nx1n5mf3joKiKaNfqW+Ja7+bi4Cim4Dib+CBP+PbaB6k
         x5Mg==
X-Forwarded-Encrypted: i=1; AHgh+RprnGhKnBO7Ny1bLzRosE++2Jyqk4PPwVWcMIqONktoPARMzO96MPrkQHmZQffNwPvrCHdzfdHQfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkej/LWwahMRjvcf8xGp2piFtcOdzna+uOjW9tabKTLgnmmRDq
	0EZ521h5TImlZjK7hVSVLBvvnJit4AqGrRZALW3nul94VszeFN3SoFu9yD/v1YmJSiblSdueIR3
	aDEj6xllstg==
X-Gm-Gg: AR+sD12Gq9qP7rfCLeOpXu5MGf6tzBB0B/IzgnPKtSZ4BGQZMF35d/3Y4J9KutRHjD/
	GnzMn7KHNa94MZjcojU/jvoFSlDc/0n7EwHaxAlAEd7x9HNw9OfOIHze7f0oF3Z7CrXowjKCeDn
	7Az2tauo4l6QqlwXtFqIq7HgfM8/Oo7iQ+lq7kd6dWT+t16VQOMjE0FP4UWeMNpDAzzRjhKs2tk
	2Uf4bz4YBjdvet07Gshofexytq4h8qRMABErGWzLp9X6ePUVM4t/NssTavIGV6Z78dfGhI9UEE3
	CdB7G9kSvsRkGkNFJps1/jwNNnuMtd9FfYiap430xXfIUh2Nu+5OuwAAUeeY6w0go0teZWlyjxy
	GG0zeny3EhAjNXDla7od6tjBglqGlHNkvXZMS82Im2ipJ76zHporYSUl4Qy8vhmJwdRJTH3glAG
	93L0WfkfEOJjFC+V3G+a6C/9e6Q6ifPqgPgb/70QxR2Bxaa/1Xpyx2sjRlQuliHXMMu6ThmZfaG
	JPIUjsb2FBV7JBZw3KEKWvjlZai79VkEgJ6WAfcXo1RW2K3tMUj
X-Received: by 2002:a05:6830:4992:b0:7eb:c8ed:71d5 with SMTP id 46e09a7af769-7f196ef1d76mr22155527a34.14.1785809835387;
        Mon, 03 Aug 2026 19:17:15 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a55asm8914812a34.13.2026.08.03.19.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 19:17:14 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Woraphat Khiaodaeng <worapat.kd2@gmail.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260802073518.419-1-worapat.kd2@gmail.com>
References: <20260802073518.419-1-worapat.kd2@gmail.com>
Subject: Re: [PATCH] io_uring/cmd: fix iovec leak when the async cmd is not
 recycled
Message-Id: <178580983389.518281.10453902447939031176.b4-ty@b4>
Date: Mon, 03 Aug 2026 20:17:13 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sun, 02 Aug 2026 14:35:18 +0700, Woraphat Khiaodaeng wrote:
> An io_async_cmd carries an iovec array in ->vec.iovec, allocated when the
> vec has to grow and kept across recycling through ctx->cmd_cache.  On two
> paths nothing frees it and io_clean_op()'s kfree(req->async_data) drops
> the io_async_cmd without it.
> 
> io_req_uring_cleanup() clears the async data flags only when
> io_alloc_cache_put() succeeds, and the cache holds IO_ALLOC_CACHE_MAX ==
> 128 entries, so once it is full the put fails and the vec is left behind.
> An NVMe passthrough workload gets there without doing anything unusual:
> nvme_uring_cmd_io() returns -EIOCBQUEUED, so the io_async_cmd stays
> attached for the lifetime of the command and the live object count tracks
> the queue depth.  Above 128 the puts start failing.
> 
> [...]

Applied, thanks!

[1/1] io_uring/cmd: fix iovec leak when the async cmd is not recycled
      commit: bb34ae5da3365699d53a756f4c96b6ea9f8ba0c1

Best regards,
-- 
Jens Axboe



