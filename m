Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170543BB9EF
	for <io-uring@vger.kernel.org>; Tue, 15 Sep 2026 12:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473671; cv=none; b=UhbuHB2KXACl/nyd06Ese0PCJ2zoYZ+LwIiT6qiTA4hbzaeW6IquTxESxg77LEe5tsd6Ts3tzNyvaN77jad6soKEvsoB2UN2TOHRK1j/AVw3ona2MWlgPEP7V91iSr39DVRKc1Gg1ZTMT1z0JMBXwi5nz1Wa651FCztwaAKk780=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473671; c=relaxed/simple;
	bh=JQ/yBgCAUcWNM14es3udFCXtoQZC77jRMS5iOTMYSu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qTLtwcZDWZBk8XavSuzOtNDfTMMi6QAuSkyhSMhLkKMU+gavm1rZRCXdMcRhNhDII0hMFhrwhtAPdX3MAqBSgoLTZMuWG1RA9ZOHHSAUZ90VcHOKU1vXFyL68NrmhcEXqbOkK6YbsVcBRrFpJ7NY52K2ydKSGAWPV9VDdqSTq7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=ZFjjE3j9; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="ZFjjE3j9"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633ecdeso158104f8f.2
        for <io-uring@vger.kernel.org>; Tue, 15 Sep 2026 05:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789473665; x=1790078465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WXnLznxt+LUzVKSpuZUKgVMVIlvhchloL5kq22Pk3QQ=;
        b=ZFjjE3j9PqOA2kembsSKz8nsdmpJ98MNtQayaQZWOadL/gX0qxugq/eVqa//Fj7/UC
         JsbtVfR0gfQG602Cb19kLDth0UGzDqvF+MSXt1yyPDUiHF89MQV0t7HJ6xhXrKIjGZgy
         Z0xtHzdyYQ3lAPxsZLsfgAIYXzoCCC7mSIgtcG2a34ETCzhNY1FT9gOzcOZ2nJ0q9dQa
         bhqIBcTXMBAhu/xBAw1NjQBvB6RaQueDozW8zg4jQLxj5nyOebk0tsBU37sIwDb77PS6
         oMUMa9c7sbKadd8WBS+Ad8rfo235LQbNOKtvgRociPZSCfD9Yip8bgYDGJ3aD4jISn9w
         bNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473665; x=1790078465;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WXnLznxt+LUzVKSpuZUKgVMVIlvhchloL5kq22Pk3QQ=;
        b=M8DpZy9zp8I+gJ80A6VZHISXKyq2s0Od2pzflas4ySdYZO/lCyQYfW763duV8V4DtM
         jCWgao6SdZ+TlaqpTggttdUmw3xpxarKOaHAz0utNvjIWNw9wsZcE3JiaULtp3cPPbhC
         O+e7MuXHDd4KAc3D+u7e2+j0E1pji0sl15b3GDZCReB+gHrN/DLSE4Cuj9t6/jwBDtYP
         QMt+EISuQHiqvzUci0Ffd3akojFFWB2GGfwMmp5oH4aWED04ASMinU0QESOJiX2shwgU
         Y29oMNk4r38ShJjOLOgMTpwkG8d4z/ZSOq7CkObXp0UNs6ffoO0t6oQ1svtojPsvZ+8N
         k6iQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuyy8bm6cF1sxVePsqXbMN3k3vCyUkryvFbByTGglx7e5OpTkPnOe0IuBA/mQoOqDXWuesINkiSw==@vger.kernel.org
X-Gm-Message-State: AFuF++lvjgkeWCw6U4UIF/6MRjaheYweHvGqs1ZLgpWmW1dEBPlnu2Qx
	n8iwOaUuXPbjs60fxlkLKnfDBWof6m9NraPZ5V4qDWBqPZBuilR5vM8L9+mcEW4Cpyw=
X-Gm-Gg: AYBFou2LAnL0N4dSWVfD1ODp32paeQ5R1S0lfwxeeaTBgifa2VBvyV2dBbt/jcEz5YS
	TAmsPy3PcP4S5rcz0dacM5uDftVcCxz7e/l1Nkj2IXkmzDxGIIiODmPc0nsUmRvarwhlUOnNgcH
	mDSjK6gTjMbkAukAdvL5BF5XcNvcNw8YBMa2GrySfTg/aDptp93n4OiSr3lgGQzjyU9Gcw7Jocd
	g6KNUqbQ+e1F5lDSjitgAU6bDH7PjNdR33u5DXBBoLdzx9NCK6EoT1l5CpouJxIE/41rKdAVu9A
	b+lSf1s3jiaH20ztgUEpU1xoArzOlmTwtG0VdQjHCaYkhtItl6N+aIWJqACif1guBlB16Y5SscH
	oLZJHyEVnzdtmpdqyhX2vAvwT01as8CFzsNKE0B0ZCvYLaF5+F26wH7SiR7ULwSZc4gWrlJuA9a
	lk8EyvN5Qwag4RbJ48fiwAg6o5q7T7obr60/5HXnk6Wu/wP18OBafSJiF1seNX/T5h/faTbZ6PU
	prjXvyO3VfyRE1EADp87A6HwM74LSx/2DNIzUGUF02ZClX1Pp4KfUjSq9Bjbp1JgNaTFAoWOTNj
	TH3LLq+GJKOW4hUiE/jdZ4Smyw==
X-Received: by 2002:a05:6000:188b:b0:485:8bad:fb4a with SMTP id ffacd0b85a97d-4870a952919mr622437f8f.7.1789473664622;
        Tue, 15 Sep 2026 05:01:04 -0700 (PDT)
Received: from [10.160.16.196] (150.red-80-32-100.staticip.rima-tde.net. [80.32.100.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35bed0sm35665221f8f.32.2026.09.15.05.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 05:01:03 -0700 (PDT)
Message-ID: <b860e9a8-9a3d-4a4d-950d-69bec1792144@kernel.dk>
Date: Tue, 15 Sep 2026 06:01:02 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] coredump & signals: an impossible affair
To: Christian Brauner <brauner@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 linux-fsdevel@vger.kernel.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
 NeilBrown <neil@brown.name>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-mm@kvack.org,
 io-uring@vger.kernel.org, stable@vger.kernel.org
References: <20260915-work-coredump-fixes-v1-0-f354ca41780c@kernel.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260915-work-coredump-fixes-v1-0-f354ca41780c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/15/26 4:22 AM, Christian Brauner wrote:
> Hey,
> 
> I asked Chris (Mason) to look at some of the coredump code with kres and
> he found a couple of things. Some of them I had already found and fixed
> but there's some good stuff in here.
> 
> @Jens, please take a look whether the io_uring fix makes sense. That
> kres thing added some patches but I found them all not very good and so
> came up with other fixes mostly.

Both of them look fine to me, feel free to add:

Reviewed-by: Jens Axboe <axboe@kernel.dk>

if you want to carry them. Or let me know if you want me to grab them.

-- 
Jens Axboe

