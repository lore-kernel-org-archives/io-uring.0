Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427DD3B2AA
	for <io-uring@vger.kernel.org>; Sun,  1 Mar 2026 13:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772371327; cv=none; b=M9A9EgxwiTMBo7ZayV9swcfiMp3vyIMpJAYjS0UlBOk3LVaUY7459MwMlRijtL/iUNZ7eNpNS9eUFUznf3WxMqzZaI52pSVjS4TOimZNkTmBjcKxxEqbLcAm5VcITdT8Mc53qYiSM/5UoYBc6Gcny/Dhn3Y16kOj0NB+Iow67XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772371327; c=relaxed/simple;
	bh=FCQqRKpNjxREaNjutROETudC10EPHFF83+6ysUYQSrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mlAiweQ9xiX6Gs7qS2s1IIKooaK3mGVme4VRvup3OeZOk4viG+FUBSWqsXY+GdIayKJOJ5ZozoIvR0ueugyG8uqX7He/xJyUkSwLoXwj1Yu5sgmsA6Rcmama9MFeS9WKmM5f5dsXO5zpcXkair66dbKaSEA0GZP5JgWvQu7CH9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=GIylNq9T; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="GIylNq9T"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d4be7c4ebeso1421665a34.1
        for <io-uring@vger.kernel.org>; Sun, 01 Mar 2026 05:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1772371324; x=1772976124; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=scD8xisebXHg855oMh9WMcJSBqt9Q8TIw/LF4qdPN3A=;
        b=GIylNq9TTtSIlJJCOoc91Myv4JXFHoaUyhf9ECt6EYCShU1WttQ2UOuamk8k3fZ3lP
         lKv6UzX8yJYfO0le5CFfmsPadqUw7wWWxkdJqc1A+o+9rT7B9Uib8pn1NjZjoN+kvHW3
         9W0XGnzs8IXafABWRS1HpG0D8fsyPnPABbtpNTA8gBWM32eNm+sbOIzHIB0MASn9sgdI
         a2Fv/ULrNagDofqXBuwE+TXO66hkkJrbnoq0kbGaGd2qZaR59QMQkVwETdRA6+qB/Gkl
         Mj6GcOEcYxj4xKnJ/wp6+Ok+MH7FnsGdKxGbkpkO9akPJMJ9jDKUJ9RxoKO4jwbuu4PK
         nYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772371324; x=1772976124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=scD8xisebXHg855oMh9WMcJSBqt9Q8TIw/LF4qdPN3A=;
        b=wlZVdfiU1k1bbG+exizxSAlIsYWUBNnhS78tihRbPmdhGXBzVdUae0qmAlHTDJQHaJ
         JySN8Nsfj2Ar4AtC5eY/bUp3Mjse2DwhmrmvSaIlwZMPX6Vo/iKAsPhH851PJb/WdRKd
         SDTFN9f7dbewXuqq4PnCN/BhSkwgnMK9hnJS/4A7TMzcX5cAlBEYHoiUV9lSnOeaGwFT
         uOYcKAKo1E38WBoOCWczdHKQCnJYwUer+ZN3NTo6sGreNl62cbyL3bBtiUF8s98JiZqv
         A+uGAblqBIJaIrRxkKy/CVJmnDD0kN8L/GSbJdU8YNyKZxnzFemyHadgetyM3eMwdzya
         dlXQ==
X-Gm-Message-State: AOJu0YxYK12Hanh82UkQeA2AmKlYSMdLKobJQWZmX3L/qrNbn36Nu1l0
	wUrsC0zcrvWbrH032tZ5Q0/wNDogBg8XzR4q77A0KOpj91D5Qh8PedfCTLHe0j2MWsw=
X-Gm-Gg: ATEYQzzBndfbsFh1AWIpvZjTILMPPB6neT521tvClbCsMCtbUf99RTdsyyb6rXY1wQV
	rDQ+jt2Qux+UkslhmzhXMcNrAuE/4RijO90hrsICLucJq3nlKl8prPWRWgU8+nTaigL91OCucVo
	AVKI44QW1nJL9UkPoNw7kRaSkGDyzA4sUxmNATqubrpOT7CzDXuY2me7sdFXSDelcxuUEVzISvj
	3HmCyb3KggMEAItzwxb6qesuDlGgx00dMix2FcgdNMJhsflddMvsaletQHrVJ6e60QfNSTtdZeg
	ECsXcUadjmLNpa+kwMk8i0yKd0TDSN6TJoFyo0Aj7hTv0n/lX5J39EOTeFSHtSpAHSKIMNrLxQ6
	MUjry1VjjOKkxrhct+dGARCZNXzULroF47hos25UzQynCMQZ1gjH7oNlXhmp8ld68x84Ex8GLpu
	itjRiTnFC+cpzyPNmeAiDATWL2R9suLUMKiJVDb+O0tGaDnYMu+EPJvyvlsiy666L4e2OePQAdZ
	HnwusPVsA==
X-Received: by 2002:a05:6870:168f:b0:375:270b:ea56 with SMTP id 586e51a60fabf-416271049e6mr5162094fac.42.1772371324249;
        Sun, 01 Mar 2026 05:22:04 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160d2cf00fsm9236538fac.20.2026.03.01.05.22.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 05:22:03 -0800 (PST)
Message-ID: <002c2bb8-3304-40e0-b8c6-8eee7dcb7710@kernel.dk>
Date: Sun, 1 Mar 2026 06:22:02 -0700
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: FAILED: Patch "io_uring/zcrx: fix post open error handling"
 failed to apply to 6.18-stable tree
To: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org,
 asml.silence@gmail.com
Cc: io-uring@vger.kernel.org, netdev@vger.kernel.org
References: <20260301011746.1671806-1-sashal@kernel.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260301011746.1671806-1-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/28/26 6:17 PM, Sasha Levin wrote:
> The patch below does not apply to the 6.18-stable tree.
> If someone wants it applied there, or to any other stable or longterm
> tree, then please email the backport, including the original git commit
> id to <stable@vger.kernel.org>.

Looks like this has dependencies on parts of this:

https://lore.kernel.org/io-uring/cover.1763029704.git.asml.silence@gmail.com/

series. But seems easier to just do a variant for the 6.18 base,
I'll leave that to Pavel.

-- 
Jens Axboe

