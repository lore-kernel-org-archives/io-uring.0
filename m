Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6690F4B04A5
	for <io-uring@vger.kernel.org>; Sun, 16 Aug 2026 00:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786838726; cv=none; b=cj8+GMcaWdElCbeYYuMlZZv3DBgqUK5W58uB7QUV+h8ApJ20LyI0Y6SdOyDgK6kDQP3x6q+kRHF/g4BEuPsxc+QBnOa0e3EQC+uuNa7Ol/9AJw2X5rwmlqOVXLw8zmxLj67/tUhyb+d9Q/5WAOr5888f6m7teEhVr0PBx2pLW/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786838726; c=relaxed/simple;
	bh=0vaqpP2SKBEfiAR/ANqZ00XYWypSe5/SvJ86pzl9LRA=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=PNxp/0IkEjjU64UY+7b0WAEXoJ1EtU6Q1ktgB5ig4wkFiGdPZUuJ3RLOC4Piqa/o96582wUPyT8jnhCfMYqEyCR8Drg+ujjl6gDYGLCQYxL0DS/VFoSDVMmuQ6L+HNJRMyccEtScuZWs3vrvo9MR0WBYtijDwsOMq9diLbqm+PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=dKDi1p3d; arc=none smtp.client-ip=74.125.231.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="dKDi1p3d"
Received: by mail-oo2-f0.google.com with SMTP id 006d021491bc7-6aae022f9c5so658337eaf.0
        for <io-uring@vger.kernel.org>; Sat, 15 Aug 2026 17:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1786838723; x=1787443523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aAhIwxQ229u2Ayph98kNvxqO5ITqkI4HNFKP5tZ4JQ8=;
        b=dKDi1p3dwelZpVk+N8vwz6l9yMZ/V8KS2y3Vt8AYNARYEqO4fjaOFMFSsxS1l5Qp1y
         z+QgsIdcRtxfEkWibBZaAkRgrL1ZOkhbJ428xhytpK85cunnVwlcqHHONHKSxl0Iwzoa
         l45iDDf2hqnnbJA4ud7YhaB9Li7ZbUfxjs1AjKAhNFf+xz8q2jkbK1TY0r9qTbcUCnVd
         2a99NNswZmZFOoHAnyo9HvBAkuENqnvVnVZkG3Fda5tbodJ/Ok2n0VVAKr9uAf1I4CaI
         l8jACD4aOhg4Pr9xjfKfBgz+uXmynx21dSJb+twBAwpkV3IYIWqvfHwlBO3/RPGVUWxj
         Vzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786838723; x=1787443523;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAhIwxQ229u2Ayph98kNvxqO5ITqkI4HNFKP5tZ4JQ8=;
        b=ssgKifD2pZ0VOvT+weO/yfprV9A294SDSiVzLATP6P0d+m/ZxrhFbA1hLCHHrMWZfG
         7n1oypxNs8DNurSRyAKZZCfcFsyumCXv0EkWOknhsGcOITbjMVG1k6eVMZHOCRTsi9TU
         JEaOLi3+88fz/IVq7juojJB/o7ene3KIrgGMlQLxe3jNye5revkrqGAnAWmiGv2x1SHQ
         cV1WRIgAt+K4SGb+Xme3OJLt6EhWyJrqcLOmh6auOzEKJpqal1BFqzIVY0++TwBfGpcR
         Y6u7aat5p+u0TXKaZ+a8Zu4Ipvn9eCDbIofMgijEummQzii2lpIFEmzwIpsQIGt5wOVB
         a3Wg==
X-Gm-Message-State: AOJu0YywSUqZyu12mBQ/TMrccsnPuL0bqyJbnkeivuOK6gvcS8Hb2z+k
	lBu7jbziSFKtxfFkEC6GW7sA445JG9z1wnRfAwnDlNOiMullaXKyNJzGevpA/7L07iqm8In6+9A
	GvItCxdtL2nTa
X-Gm-Gg: AR+sD12on7J2gzK3a0MfcQiqfxDI7D54M5+Nsr4/PNfO5PJK9YI0gyhoC8DXWVm3Sb/
	kAftOtdy9uaqKhWMbvE9xE+pR6YS6MVeYgf5tZvyAaIP1uYvJc/fUWFnzYPQQzgQh7KKUvuC1Bu
	TTVA42YuG+cuUxZc7HnPtG1bew4I2yVMLXMxLf4z1aJiwn3vBKdDKiyGoj7GcZolPkNqG6Z/b73
	yf3tvSSh7yoIdXKVomIuPaBzKZfPd9wwnbORO3s0vjJyu+RrAICk3G/XEdT3mbjnTqvb2JwbwIt
	iKTK8APkRZMpGKIQj4bP4PulCNWx7kAjg5ML088toOsZXTzagNqFfhC64DEfqyOxltr0LrlAnun
	pbDJYmyqgDusdwws9EZN9NAv7MIAmYAeBjb2oJvsgPdW89vwDvOPNdXgdh/91jGBIfaYoFS8T3P
	4svsg5wz+XaWXXZ6dIBY9ZZMJHqD74emWgoFqnB7niF30BwSYz5p5eXoDtu0VazqIQXAu0GNU1W
	L8oFEGKhS38avtyRlbs+g+4cjktuZbBwVMhusq18tqGVJk=
X-Received: by 2002:a05:6820:809:b0:6ac:a175:fe7e with SMTP id 006d021491bc7-6b0d6889e26mr13578079eaf.25.1786838723243;
        Sat, 15 Aug 2026 17:05:23 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45e8f976bfesm6135237fac.8.2026.08.15.17.05.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Aug 2026 17:05:22 -0700 (PDT)
Message-ID: <95f7cd18-530f-4787-8696-344c18244781@kernel.dk>
Date: Sat, 15 Aug 2026 18:05:21 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: io-uring <io-uring@vger.kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Subject: [GIT PULL] io_uring fix for 7.2-final
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Just a single fix for a potential issue on 32-bit x86 with PAE. Please
pull!


The following changes since commit bc0e8faf90e776a2f1f3967a04e8091e6bdb4977:

  io_uring: preserve task restrictions across exec (2026-07-30 14:40:22 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.2-20260815

for you to fetch changes up to 6ca662cc71df7eb4eaf1b4bcb07cd3f188ad19f2:

  io_uring/rsrc: reject overflowing regvec bvec byte counts (2026-08-12 19:53:35 -0600)

----------------------------------------------------------------
io_uring-7.2-20260815

----------------------------------------------------------------
Jérémy Jean (1):
      io_uring/rsrc: reject overflowing regvec bvec byte counts

 io_uring/rsrc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
Jens Axboe

