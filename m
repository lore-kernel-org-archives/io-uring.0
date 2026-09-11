Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3C34BD79B
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 21:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789163142; cv=none; b=XOonprq7lJfPMJKDAlQOv0nQxWG7m0y8WcKTceDdxJvVB4uPLDx65YUYbrCvYlp1FIKX0i1owzsnV+iGn/ZZPPkJxqehfO4pSDi5fWTNlCR5ANM2qkjGWrcxewtcK51EII/JUnUyR7eJ3RXKejrsoQdd57Gb7EhbtEif4dmxWdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789163142; c=relaxed/simple;
	bh=EFpnGXFg7Dpc9IAzzJ2AnGl3jwtilY+LHWCkCYpJ57o=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=abfA8pm+XZimE2KkxUMgHC3sCfzaWMn6RGPYSvZYt4N6PH6vv7gt/4FmTQf5epsJJKaCP5YHItPRxvnojnFnSKpCLxlY27+SNSVoXo42+cDH03xXGRP5AjelDxF7gKaViTQsdvf29eW50pBS9b8VEZCthFKWkbW3Xvh8yOhAfz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=n0C4riVQ; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="n0C4riVQ"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b37a2ffef2so31428b6e.3
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 14:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789163139; x=1789767939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Djg1kbYc8KAYfIfIL1ACzR48Cmn//kJGwbSqiTyXnMY=;
        b=n0C4riVQBIo3VnNKDQPDoUBmamsJhRrTNcqCFKLHaXMrLxsv5IHubL35p6mPUVXkBQ
         bm0XfDGVI93+qLeyj1HXCP+EIGQtH1up3HT0bQaE3rbik2ouW1PsECicgzvzJTdBx2g8
         gzys0gI47iWqQIAJbGKrJxUDhjvwyNfnH/gSOxv7WNGJmajzDXC1N44Zpb1bKISvOxBc
         4j+KAto1rJHD0VM4mx61OU9xE12eeIqjtdL4g0FQM3R8Mb759r3joMPF0tYMNLRYwr1P
         eBPtgFUw7c6kaT8sXW4owvEe683NwG3M/7Mx2LoqTG5OfP+s3ACqYpk77lgShIWhmydi
         nx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789163139; x=1789767939;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Djg1kbYc8KAYfIfIL1ACzR48Cmn//kJGwbSqiTyXnMY=;
        b=rReZktALvMXxAtxi2wpK6ODeoKcrykdn3f4C8vbVKY761aGaHDaZYnH0+RbUWsMMqO
         IKiZg9ZY+htyEUmmhBnls2Yh53hw2/g+/ctUjha4uw3keyPwF67lMcRhAO/ldQCkpGbP
         9JHhMOZj8TO+LLSOR5kOGpOu1FAoZEM6DYchTEy4pWh0K/iEc795VMaSzQWgiROF7LQa
         Rd5CCxKrF/kmMeCq/JfSlcmbhh+2dcEyuLqPUDs3a3wpDZ2WWHJ37IvKUU1jg2jNK83z
         BqJrH1gE/3D959W9bSqm7/ecctugqmcvcR05YKO7FzaLcnpsaPejF4dhTK32IRGq9dAh
         untw==
X-Forwarded-Encrypted: i=1; AKwUvBzM09ECLQIZscZBx+7i512xKTRokATMUNok/ZSmFecDPq9/HmFInFR+Pzg87HyV+ZM3NB+FO63DBw==@vger.kernel.org
X-Gm-Message-State: AFuF++lXUu2UfJpDNGncJYOuhk2E+bs4Q9Z4NoibNaOY821ED3ttcfbj
	f9Yza/iyr0GbN1zizPBejt0GjgOPyUiMPDOTCksgKxItDVPHTdzUsErEy7cu04452gw=
X-Gm-Gg: AYBFou2rFy/nQJaKaHXUs9TseCX/Qw1clA5b3U/KuUpp1fozAC1QIwH7m8cZ3d3fGr1
	/U9yQgoHyrvEdvCbv9AdokyU0XSKlGZ7Y0TuEjzcIHQ9PxCI5lv8iRSccsT+xD21MMXks0EZK9z
	FUODEh107j9qGS2FQXpmnpMeAoDSJfEQ1P6Z4UTj8uO9Cpfwx10yaohxxFx9JBrJp23GJIlyj7T
	lY1K1L7mzPvPgIx6awN9K8eGIL2jG2y/hTtDau7GIIaDpI3sXJ/hOeBkIuRH5eisxuIrcfnaV0t
	RR2j2SZZ0JspqvpfyiHqnzfA86tmpGd0fI6No9XfhX/jDibp5V6sAy3p2KknKplGmWceqtmSrSU
	8kAe0p5jdtW4SNnK8KCJXeINJ2oxqlEMoC8mg2Jh1RWAWH03Eetx0tIKOmLhJlOtyXYngurYbgZ
	pb6f9xtEBP4W2WcGKMsEdd7xhar8WrybzNsNcpaJYbQYrT5mqJ7u2KmucgpbziomFZ8OObE0D0C
	W28rPcRVZ0ynHRijOav12gGykK6N5Glsiu9rXaVcOTmIP+HC2OJAoevDw==
X-Received: by 2002:a05:6808:2f18:b0:4c3:7695:d76 with SMTP id 5614622812f47-4c4a71e3ab3mr389049b6e.6.1789163139089;
        Fri, 11 Sep 2026 14:45:39 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4c32eb4274dsm3260110b6e.1.2026.09.11.14.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 14:45:38 -0700 (PDT)
Message-ID: <fb210ac8-b00b-42ff-8fc1-6f9243302b61@kernel.dk>
Date: Fri, 11 Sep 2026 15:45:37 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 io-uring <io-uring@vger.kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] mailmap: update entry for Jens Axboe
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I recently changed jobs, let's update the .mailmap entry so that patches
are attributed to the right (current) company.

Signed-off-by: Jens Axboe <axboe@kernel.dk>

---

Linus, could you pick this one up directly? Thanks!

diff --git a/.mailmap b/.mailmap
index 7c02242d4ed7..29c556cf597b 100644
--- a/.mailmap
+++ b/.mailmap
@@ -421,6 +421,7 @@ Jens Axboe <axboe@kernel.dk> <axboe@suse.de>
 Jens Axboe <axboe@kernel.dk> <jens.axboe@oracle.com>
 Jens Axboe <axboe@kernel.dk> <axboe@fb.com>
 Jens Axboe <axboe@kernel.dk> <axboe@meta.com>
+Jens Axboe <axboe@kernel.dk> <axboe@anthropic.com>
 Jens Osterkamp <Jens.Osterkamp@de.ibm.com>
 Jens Wiklander <jenswi@kernel.org> <jens.wiklander@linaro.org>
 Jernej Skrabec <jernej.skrabec@gmail.com> <jernej.skrabec@siol.net>

-- 
Jens Axboe

