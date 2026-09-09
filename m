Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7098B41A926
	for <io-uring@vger.kernel.org>; Wed,  9 Sep 2026 11:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954411; cv=none; b=d61Qih2l6QVgYHr4C7ZBmqRSFOOSTnq99nNWhcmkGirRB6jA1sj2tP68d74UX/AVnltETy8DWNtosiKUfM0tyB7DEp6a5IzLXk4JhxBLbXIi+dSb1dhMzg4kmXkMva4/jmLzocPjt+nS7VGp71RSxMxD8hxeB4a2Fx5qrMSg5Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954411; c=relaxed/simple;
	bh=/ERtdL7Gbn2UEcmCAicOL2oG3iKCG4UiwrEeoTqqEsw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=JK/d4ZDoqjVXabm7w+TvpfUdU+0UZZ759OdMOqQHwxISLTasW1N1vtGtRR5kNPdQMAwY2kGDWzoAoxtYstATTu7Q+ct5vRUQucr/RNo/fwcbabnErypa2//nghscUDj2nCBGBf9n0v60Eps8cw0hy2wsLn343LK3k33aUaI7faM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=j+5LNeBF; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="j+5LNeBF"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4b333de9451so5016480b6e.3
        for <io-uring@vger.kernel.org>; Wed, 09 Sep 2026 04:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1788954407; x=1789559207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EdSBvbVCMly05/MnJatDjpn/i3lZQCfGuxvHm2Q3Abs=;
        b=j+5LNeBFkVFY34F3Z/HuUAhPUAy+MGF/O8DswfhcGTX3zfuBbPSKoQNjPSys4gYKMr
         BciHeQRa9ypBjihd9EQEKYPXIItexDoWvKLQ9fDN3fxBJd7tKV2ZzidsNn0DtcRxL/eV
         Yuf9ZOyA5aEeM8EvjzT0QuX13UWer8mPgu9ryxnuYRItj/eepljoRN1d1PsKgQmSr++t
         5cwVOQJe9+NvDXN7m6nR/L8wnG4N6OFrxkY4k9bI+mBg+7WllFksEqthSziZqQRIjKeu
         aQRSlqgUzULhLqMvSAh1e2X7TxTQkcEGyo9qJu8Qi5AGqYIj43W45Hu3Zve/75ouoGTX
         GCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954407; x=1789559207;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EdSBvbVCMly05/MnJatDjpn/i3lZQCfGuxvHm2Q3Abs=;
        b=gTOIbeuiC+Yd0VYNq3NsE8iVFoVC32vvAZr2UKEmffflvcSJHe7xiWKur0Vp7SQOZl
         A9OaAsilJAmt/qgOm59kRKFhKmxFskXu39D4JkkGzrtmhrNp7+cJr/JsB0c5NZRpx5AU
         Tp65cg2cBvoB8NoB+wNp/dTjBcrt/BJntO7rmyN1yfJwsa0FtRYJ1IrOXjz+a/L5etKv
         nnc/IZaT9VjRrH8/+Ti3/bcpL3g+wrPjuE9nezfa3xJmPSvABq0LricxgzmaSNRbGfZ+
         9l4Qjmc68yga2SjmLOGvTOb8/CSVqkoNWS8rhdk5YrHRTXNdZOm5ssJVxLw15P2yKp3N
         xNbg==
X-Forwarded-Encrypted: i=1; AKwUvBys/bI9U0khXPGsoa8qbIhVKNO3R2CI2OWO4vKp6i70qtbptnt+qsBwSNZjcSjIl9xpW5jPi9ByYg==@vger.kernel.org
X-Gm-Message-State: AFuF++mlwwfmSP31h5fx1OvsZoyVKxGjYdWf4g9WOcLAD8mBPK0ipSaQ
	mBnnR7L6nx8Lr7O26D8Dke/PVC2pA2skfwp4eUUI8X+oG0gA0GuEKDVhO4l/R+5lXjs=
X-Gm-Gg: AYBFou04k+rurvBUUzx+0wfrRhosz04WY+RFgXm7bF5ALC7Y/3Q5Ft4VukYoDxp1rfx
	G5ogwXwQ6GfPO6e5WzGlBn+Qek3OHi7Zt8DGaqO8TC72Ij8eW48JYlUHJlMzWR9i6kiXZ1oJCL0
	Kq1wi9iYhnYKVwOYpmAMWiWY0AQigsbBYN9SdzwIuvv2eoGGAwV2evLcEeAl8iDS3XAvuy47c5x
	prcsoIwQ9gW35rzY40risO/9d5DBBTRalX991d+dtvA5JY8D+dKSweN27qqG95cYbMqATT2nGYA
	7H0NosND5GNWu8ayLcXVs5IDv56Y/HHrXPdHzs2LJef2GrUpbuLxLeqbHNznfkd1gCaedkOShxz
	iVQwgn6BLV4KNsd0c3B8SLI/A8uE1piyTMdj99CQHNx5ouJE8Um6YQ5ml9hW2nY/VjWde6SQeQ3
	gR51At9Ix2NHZSN59uD+zHa5BVXJccc5GzTeHkZ3yeamq+y4jARzKLtAQ049uwPr/p49nWdNNbr
	8sm7SKhshMYVNeHZPzXG8X7woz5r0cqprnKpmP70ZogrKJu2Ky7rpjsHg==
X-Received: by 2002:a05:6808:10d5:b0:4b9:e6ab:d083 with SMTP id 5614622812f47-4b9e6abd419mr16647584b6e.35.1788954407195;
        Wed, 09 Sep 2026 04:46:47 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b96eaa508asm16532607b6e.1.2026.09.09.04.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:46:46 -0700 (PDT)
Message-ID: <05177a9e-111c-4595-a7ef-d3de398f0a85@kernel.dk>
Date: Wed, 9 Sep 2026 05:46:44 -0600
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

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git syztest

Let's try on a new base, perhaps it's a mainline issue keeping syzbot from
booting.

-- 
Jens Axboe

