Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA74B503BF9
	for <io-uring@vger.kernel.org>; Wed,  9 Sep 2026 11:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788951767; cv=none; b=h253nCBpRenyintmMNqM5EbMtkEWv9lYoBrQc7PYd7ACwfvV653FY/yZHCVJGKxeFliQTsdOCuNOX3eJojz8OhgZvQF9drvCey5tQgARu+n7q+z3WL27BfY+Hm00T4vYvw51X12q8079+mdyCT1DYPRB2cwVDyJ+EJQHIb3zjVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788951767; c=relaxed/simple;
	bh=/KNkqL8brsMMGc5Cqzr5HLntXTDWrBVEovCUk8D0+MM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=u2AFXtiyq5d+Ln7+86i12XU5dacUQxo6dNOuBbUparGj+uTeB5a/oeeJhtVlR9cH/277hLiMBej+yXGfsQMbs2BTep/ptTer4wQEiSUcLUZ7p0UqJPEF7J6yZqUroOVv4bvCvWwpa3tdTq9rQXJOam+nzpry71Twgb4fN5MJ3Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=PzDW+lfQ; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="PzDW+lfQ"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-7f4f0cfb29cso30874a34.1
        for <io-uring@vger.kernel.org>; Wed, 09 Sep 2026 04:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1788951759; x=1789556559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tZczqCxuq41VAhV724eZUITtJnRnt+MmYaUhid2/07k=;
        b=PzDW+lfQBEpFLI8b75gyc8ue8zKJWHtomeWlbHdeq4HAMqHCoKFuGr2SlvSm5fbzmZ
         QGesMF1rCd1eZFev4EkwM0Jaa+wHFrgTqy0ArZg6nVwk2i8GmbB7YNzadI+0HU3lvKVs
         wlO6yy5tO6WKyIVHs4/Tl0GQtbmh6eSE8dfgiPjuKeurD4+SKBt+19vgQwNU7amlT8ex
         D4AH5wWZnEO+kS3AmwIr3euIUABBC2RAz2wRNCEcjilcjB5SmpYuqLULDRp2/7VdzgVl
         L8PzfX1VmcKGPmKau4tuYT6rktk0eMA68OJHdb84YwIIvIOF5Ts4TQRWCo3hSxjVmBct
         BDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788951759; x=1789556559;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tZczqCxuq41VAhV724eZUITtJnRnt+MmYaUhid2/07k=;
        b=sSwiUKcfygAohJCEPuy7Ds1Yhq8akVfFo/K7EKhZS7lEPyOkaNm79JnccrVfPcR49t
         7a4CDchFyrL1vZBBKWBq+P+t4WcN+8WigyjlV7dr0NakOpwkJ/LZo+rFVeRHQ3lc7n4X
         mDs0TlcHqq1O+hIIKAgbEHNnfkQa2paX4fuftxiXR8L2NWhhTyOJjjUZeqsTLSq3y+d1
         Q9l65sLofAqYHH7Z4BrOQRQ2wVMqVGoBQCdF3qSMLmyfzKGR4+1Z/SOkvX8ocyzEge7K
         R19rDS87LLnlxuS59KLQG0hSRewu//+mz1Gn0EZIyVH4HwIcIAaRPvJGP0iffW/UF8X9
         hr4Q==
X-Forwarded-Encrypted: i=1; AKwUvByTSQ78GthR8VXTX/CJFhbFEziEbesZWijM44SD3i/bLe3Zesz9z0Zj8aUFmqyuh1CghJbfW+vPTw==@vger.kernel.org
X-Gm-Message-State: AFuF++kL90RvAS55RPqAJWv6tol0NVoMNbqP7Tn4tiCC9S8CaI3XTjdE
	o6sDP5bEanwB0vV5NFJ/UX9i5fKbDF4RXT0LNG//lQ2zuO55t+uYuvN+cIATKXG5jMo=
X-Gm-Gg: AYBFou0g8+VjnJR+J6zrfY7EHOxSN2O4HiXZnURd2xK8hSAXTgDXCs1A5uQyWX+O1Mc
	ZCiNUGX1BP7WDj2dOi+CGCSh0KntxBbqMdirtHVv53IJ5IWYmenX4GPhD+YNLI1jvLuVA+vuD/4
	fH2xLqI9OOcbFeRusRqt3V6+BzIc/37j5jyR/h/PkQg7fLNeuneXdmK5tKBmNyPiFBzhPv4luzB
	JEQoOZJR40NOD5VpPpGdZkJX2YxeS37xwnW8PVbzuAa5zHzTJ8j6eyx7FkfuUMx4DW5GgDOP0zE
	5l+8A4GsRlPOQbQ53Oevapz9kqTjyARcaIZc9KtnqdAsh4CaCB7wGefpyrhXFcCP5JSjS3hGTKK
	RNz0/sf9bcMqXJtyOPZqOeLkknfO2xo4BtwA5h87p+RSxgS9XPkjCYFcaVzSXpLDOXON4hrcq5E
	mWCCCpOt27v3Mt0jgCE7UiUU3Lx+u1eOqb+LE9AtGLwPxRAddMHyOmhyL51RZx3znx041yenitY
	y6Skj/sO+HPLoodz5Fz/tBl+aDDixr5cXzi3mxozLoqUqJjRmdOkAqiWw==
X-Received: by 2002:a05:6830:6404:b0:7f7:f55a:4bcc with SMTP id 46e09a7af769-8020ee08c65mr696250a34.8.1788951759157;
        Wed, 09 Sep 2026 04:02:39 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7fa888f614dsm15905601a34.15.2026.09.09.04.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:02:37 -0700 (PDT)
Message-ID: <fdc957c4-2b98-4b76-9bce-06e4d27c233b@kernel.dk>
Date: Wed, 9 Sep 2026 05:02:35 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [syzbot] [io-uring?] [ext4?] INFO: task hung in io_write
To: syzbot <syzbot+2eb3d983669d3e49d4fa@syzkaller.appspotmail.com>,
 io-uring@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <6aa0876e.f81106d8.285f0a.0005.GAE@google.com>
 <31ab7ab6-2cf5-4fcb-a6cb-05fab461e742@kernel.dk>
Content-Language: en-US
In-Reply-To: <31ab7ab6-2cf5-4fcb-a6cb-05fab461e742@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-7.3

-- 
Jens Axboe

