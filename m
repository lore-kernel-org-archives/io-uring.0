Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34B442124B
	for <io-uring@vger.kernel.org>; Tue,  4 Aug 2026 03:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785815866; cv=pass; b=DDwJXYtiimy48EPgItxPiu3wFfTTo/UKZFvx1kbSxG3qH6Y7/y4HgsMKehIh/tNQzGWKQxb22cUW0FIjONXjfe5gsCveja0DQeTDATDh1RRvbQTU48nM+hxv9rvS1HW4/Zq2MMQT2A60oerCzVhK5Cz53eycWTPn0ZvueZ5gFjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785815866; c=relaxed/simple;
	bh=gm1y3HjSbfjetP2qj6SkQ/PvAerOiP935sq/jHQIUpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=necLvpnS4+s6lntVLdcUWwhvnAsXPLK0FC9sKb3HENm/uXeKK4exdl22YFSx8XEWE9GfouOjI7lmW47U65WCQXrWdo9adf6cswQfyJQ5IeKcZDjnjTsrO9NnGQImdJh0ksMYuAnlbyBCMMK4h30jHAKN3Fhfiv+9++78n0AzZ7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNvzzOC7; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNvzzOC7"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a17f91so5273470a12.1
        for <io-uring@vger.kernel.org>; Mon, 03 Aug 2026 20:57:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785815863; cv=none;
        d=google.com; s=arc-20260327;
        b=UxJNIyfbMQB0UNquEb/ldGtyGzBrlH7uf5G45ma8S4NyxZmeS+YstrQJ5qMGWGpvFm
         TCmaJBKV+XXlbv7VS3JvDtdOfrPPs9zqUeB4Zk4rPompja5U4i+CwN0xCj9ytE0PQ802
         TX9kkBXURRArspQnGYCqKuIflC613YbNdk1RgnkgMS6MkouHDyATE4WV6VFu/6UFCDHF
         vd25eHsIr5wpFDn8wQmEA32wsoJRVHBlvhi6OU18pFTgb27Ug4nIUdB5h/J+HNYSKJC7
         BxPooCq+jb7PPc6A43SOeD8Yjrmmp+oShehxLoWsLmJqBxo3gWLLbvsjH78DcBCpGjNX
         KpnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gm1y3HjSbfjetP2qj6SkQ/PvAerOiP935sq/jHQIUpg=;
        fh=hPOlmlBph/jEVNE6Ji/5Sk6AMwNNcmye+1OWMunSd8I=;
        b=ga23C54LVMg6uZyqxShA2KlvbGlq9W5k3CDcFBmXHRpJW74BfIz/Da5V/WPU1gZ2g4
         Y4/XNt+Q6xvrxLJoV78AE0zxu2Vry9Y/rpdFBygzy87+YmIMxA1gQWEw130BU+z9qIIw
         0HfzthXPdalksldgEJHc6OnTlmn3/dYJ9Aytb/5R+VddzVAF+0xPKl6KlwW4IxUgYozK
         NRA4Ax2eYfqvbhqhhiWBQ/V/2QQfmuuTKRU1PZjTgUQRN3YZy345BfgR/E77/urLYtoU
         fvUqVRTHomtwfPRUbjKqYX2UCLd+EdqEUra6ipSryKfZHtba1UsR1/JBug/I63iCdqM+
         j+zA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785815863; x=1786420663; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gm1y3HjSbfjetP2qj6SkQ/PvAerOiP935sq/jHQIUpg=;
        b=iNvzzOC7T+K6dFDsC7BPI/8812nLPWZ8xKNQjTTB+r6oytcEjbc1RWorNUPKvDdHck
         i4RGYFDO/jiaD752XcQJVqCI53MeJO5/i3srduU3fzHICb7LkTBytj1isk8tUUJVzG01
         1vOhPobqlF4FwYJRUyooka0mDV6Dtx/6Y5vR5WvvcI90Mm7hNg9cMftK1QhrR8N4EgsH
         KOHv02SDN9fn5oXtGDIVfDVslXVJE+ofhcCntSU5avMF+uc4s4iyRCDsxOKnRFhTvm3b
         fGuQJuza+9eopn9yZ16QSm3uKp2Jv1Th4woti1nXZUz6dCqOKHQrjGo4/Urv48jd/0xm
         ZTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785815863; x=1786420663;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gm1y3HjSbfjetP2qj6SkQ/PvAerOiP935sq/jHQIUpg=;
        b=SFZuLEkJCe97qYgQbyMs/bu+7c5p0LfgLemSSJvU2gedQLDdKNnBZ9WvTnvh5T9f+G
         0jD/NlI2GQh9Zr+97AB8gOuX+kMSss2kqERMvWBDsNlYHLk+IODxXPjmU7GEkndYBplp
         +6p1DWQ9nIQvgQiI4n9rk8x1w0uj6nS9qm5sPbH+z9eMXqCFKjsY3b7TyJuWNSAR7pWd
         zxKU6ZXFuy/dHOWuRWH8DOV263t4kE96alzcWkoHu1f0EY4mCmSLcSck+vcg1IGysEul
         RLtRuWmGbOlwA7uT94PzuloqCTOw4zmS2HzlIY5EqQ85XICI9AVKMsLkxEEpBAhlDUZj
         fU/Q==
X-Forwarded-Encrypted: i=1; AHgh+RqJ1+Ujoyh5CNQy3JISgPNBBuvgjiwk6ngNhc4CyFVeeKVzwJ0CYNCq3R5WnRiyzyo5z+o0LwMpdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKie0kz173f4xRVwNAnffMK6wTT0HRaprHlxDFhpbd1VSsfnq4
	kto8dMWssu3LsKSlKeBaGGzMBeYv3ASNDipQsD6pBIj+nmvGmTbB5KIp7P0ugyB4yyrTmoKpYiP
	yWYKdf7BxxwyGHRwJLKOj8ImrlAKFiQ==
X-Gm-Gg: AR+sD12HxZmm2xJHJADkykpZ682c4dkjV2+wR07Yz2L0AQmDarQvKhO9FHrXJbzObCk
	B11MEjLClBZ4bikBrarO8qg1idcaODTiyEUEIjlNOTS4uVUxs9S3qnS6TzthLUsCYa0VbRi6A4B
	kcwbbc9Jcyu+WYzWrq9QbkrBchCA2SL9oTyy7jW2QEi8bWJ4wGNAhAG3cwOKu3xtY99WzM81UQW
	SkIOdfHLxWHVV13WhyU3RYFuEfQ3OymZkKJrbwRP0Q/F7oReV04lEi8ZUzF9lsqty/H1zbjJirW
	wUKy6ms38a5ZIHr67Pr7T5ASA4fwiiaT23TAhxmEAf62M9XsxT802qbkrGi/9pJnQjRUjMRR1hx
	CbiZ+ix87G43+8zcdizWloB8ztuDOBSQIiWVW9ESljZYhFg7E2QmQ/Q==
X-Received: by 2002:a05:6402:a0d4:b0:6a0:927e:39e4 with SMTP id
 4fb4d7f45d1cf-6a0a7c60461mr10431732a12.5.1785815862763; Mon, 03 Aug 2026
 20:57:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260802073518.419-1-worapat.kd2@gmail.com>
In-Reply-To: <20260802073518.419-1-worapat.kd2@gmail.com>
From: Anuj gupta <anuj1072538@gmail.com>
Date: Tue, 4 Aug 2026 09:27:05 +0530
X-Gm-Features: AUfX_mxCWwomdP2oAHWsA-q3XBV_o0o2posED603H5ePaS1OysZQAJTy14DQT2M
Message-ID: <CACzX3AswYsGDrmgNmgsUVaT8_QT_YCmG3OBc5k0izgsE4Eqnxw@mail.gmail.com>
Subject: Re: [PATCH] io_uring/cmd: fix iovec leak when the async cmd is not recycled
To: Woraphat Khiaodaeng <worapat.kd2@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Anuj Gupta <anuj20.g@samsung.com>
