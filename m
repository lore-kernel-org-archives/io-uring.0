Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930FE345740
	for <io-uring@vger.kernel.org>; Thu,  3 Sep 2026 02:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788402255; cv=none; b=cdhSVR3OMpJbOeQiqzwpWPp2pfQug1yuaWASQIG4+kdAGZnuxJRgMmYArg/yfbLc+5CwXaPQ81UMdOVWDanFdIZ2EBNOpWldUOenfb14WPh24pI6KsLG7lGqofS7ZnjVFZo2jv2+TqHuHccpke4ZgQNwXrshtLnRwXyEXpIeTcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788402255; c=relaxed/simple;
	bh=gm1y3HjSbfjetP2qj6SkQ/PvAerOiP935sq/jHQIUpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dG8sj2TMnU8FZHicw0G9JMbMpf+MB9si5iznmIajaQ1F3dC6Q2p7hJGo7mGH2tgWy4mCvs8vKtuNmZGwszOoFZM0DMROvvjJGsG1qxNXqVbM6QAZRfEQOyA6cm7LVZ1auG5MTYnJbTOFUKRUtBZXOyXyA3DonQtQ78AQbvFzZsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKtI5OPK; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKtI5OPK"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ca80d708489so405458a12.1
        for <io-uring@vger.kernel.org>; Wed, 02 Sep 2026 19:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788402251; x=1789007051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gm1y3HjSbfjetP2qj6SkQ/PvAerOiP935sq/jHQIUpg=;
        b=JKtI5OPKYgnHrf9Dnqgga0fvi2ZJ/x8+42Hn/6x6VZ8b2fqLfNt0iu05kDa5XGjXpS
         ZqYXEjybp7stvUwk0yBDEYnwp1WdSUy9OyapzKiIy9TAz3OXiMHWgxAEzc9xn23Jx8sz
         /+B2EKOL1XRUarPdgS0HUVS7d21Q/7cHbNCbuxExJ4q3Lhf4qD8SFoLFgDoHhKH6E9kn
         f8OBoLzOMMXTCc7hiUK+zvvTZ1fpT/digCAXe1UWjfW90THr7WI5ZWeGDC8pOBrZSDoQ
         OOaUEP0Elinj3QrjkaN0zku/q567yh87vuShATPnzyUJKHlM/gSepzSNT2nhn+EX82Vu
         gFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788402251; x=1789007051;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gm1y3HjSbfjetP2qj6SkQ/PvAerOiP935sq/jHQIUpg=;
        b=PFoxtqDJHg4BrQkmtrERD09EwohGhlq/U6vt+fjFl9YKsKhiD1miWv5zYF+A/AOJmH
         FUnawMhE9CBPyt/PbYPJ3yeYPeWfWTCWyXdRKe+8Y+7pP8dgTGaGxIE5p2XJNBAeDnCu
         X0mJFQ+xG+bRXSyKYVqTcPsnNonS+Tj198JFcOPY+rQLERtSvGVIHYaMddxuX2ogRlum
         UMgDt2oYt+oRwKFLf7CqgfnMR24v2c9aU80/tzv7IhPKPlUQxwkAFvQlElCJJZfOHFIT
         joW6MfeYACrTUv723XRnn/nl0WDFdwQPcCf5M5BytGraMUeG3+IQdm12xd7LK3H9gimF
         khGw==
X-Forwarded-Encrypted: i=1; AKwUvBxnnDs8gPV+sYqpZdHu7uR8xEOtG9jnx4gUBPYKdYAwpvB1RMs/92coy5sXOrPzlNWhx/iPjwMbaw==@vger.kernel.org
X-Gm-Message-State: AFuF++nGWf20GtSw5LlocK44ybmVgEnaBiAEXFpJfMuKaSOKNKRqMtTW
	c8aOWk2dQifVzDAz30zDxG6CdBidI49Te0tN/U9V3APQbUUonFph4fM=
X-Gm-Gg: AYBFou3gQJpHyNvEeTaaBLwI46LQGPuSwyFdW2QSPBbOtklsEi64iKmzAMAWqae8T9V
	20TK6K4Wtm2/HLkGUGDskv/G3XnorG6IDqBKdgbkKvmdgwqx2orm9i3kKrPB8B9yj1cU+iBOc7P
	ydkkC4CGxAyjnuyV1RiqaPhwf8h2vDIbvI2tEDw6TqP961Crk0a/VZtMXX96PLAsfSlwg0XbgV8
	Ht6bEG4jCfjouNBHXnOTVD9C3qw4mDrI5DwRnSA4ELMo0jZXa8hn29WzKha/uVzJzZnrxGgHBF5
	AX7k/4kxF6EDmiA5p7aoTWj05nzxIkS9WINxMxjtXLsl10YWd5smgcADAkafJsiN4NsXE/TLc4x
	lpAJcvmZyNBHHyF+c0uaKzxfAw0+/fOm+ERoduaJPMbHuqXZOEsQ1d0iLERvKgljBZkg+nPNBEU
	Jn8wNbvIcoSw7oh0E9ZgeUTcFsntKCuszcUmnTGZ+GF2cZinFVHcJQDczR1qpRDlwzghF+kIEgX
	RUQyzkpnV3Pc7Nkk+3tmFQRbExe
X-Received: by 2002:a17:90b:2e46:b0:38f:a81:15b1 with SMTP id 98e67ed59e1d1-39b08653554mr3443262a91.19.1788402250805;
        Wed, 02 Sep 2026 19:24:10 -0700 (PDT)
Received: from anuj-MacBookPro ([2406:7400:63:f76b:3efb:3463:cad7:ba39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm2062933eec.24.2026.09.02.19.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 19:24:09 -0700 (PDT)
Date: Thu, 3 Sep 2026 07:54:03 +0530
From: Anuj Gupta <anuj1072538@gmail.com>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Jens Axboe <axboe@kernel.dk>, sashiko-bot@kernel.org, 
	io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] io_uring/rw: keep CQE flags on iopoll requests when
 adding kbuf flags
Message-ID: <2vfjhhjzjoii2xaetvm5nadbvqfg5gamjcszsrj6ks5qvil2v4@sii3illc5s65>
References: <20260902210200.2336720-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902210200.2336720-1-csander@purestorage.com>

Reviewed-by: Anuj Gupta <anuj20.g@samsung.com>
