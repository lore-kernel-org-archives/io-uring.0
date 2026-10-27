Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106213;
	b=tJ7Sn7tK2eNXJLqk1CFRICm0BazkPp0CoqCBn6+/E13cgH/deOShKac9p7GxXNb0ZKiu
	 kLXenVOVVmDkRizG+1bdvYd/bN8uaknbyr3NCWfUlwlezgSsCKJq9SU/1u2JZsBYKpqFx
	 qC5eVSiIt8eeK9EV2t3SshNSG2xAiKgc+wrR2pLiKj4J1q/5HWR6GX/2HP5q5fFp64bAq
	 I9GtJAYyHcHwBdIQBYN8AvvboePrmqq4edi+5VK/nEEE2TBMdNnbVDyydiykVqKsybC7I
	 FF2C1s9nQD1T3MUPfGiRXCltX4TSRbcJvI76T02xxjCYICN+8YQRVn71VCjw4KfT6cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ReSdqMrGBGnsTnwVh5aa3vwJIfFSFewN0arb4MIegpw=;
	b=JfbSZhEh+Op6USJ6UT/K1q68vwt3WoAjHKK0jZAb/LRwOR6X08LfbpZAvWg3kedpmpRO
	 N1q+hMOWTLNfFk5MpuX8LVlZib58xrifiM9PFgqcFBPZryRDjV+JtwnJdK0ttDVqYMzaf
	 w946N9ENEP+iSayqtQhRaM0hgxSthkQAYH8r973Zz2/f8tOGBSTRSeucBB91AiIk+Witr
	 NHd8in7jPQ55/cNJ8njNBA6B2cVkOwwRB5tZTNjkSm7enEonzSbVIEI/0KE7/FV+fQTPi
	 H19LKllPmRALj0SqNY1ITZvdrjSxHSKsEuc5aT1f4eiVBlG5o+Zbdh6vSGS555yjcEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=pwZubLos;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22D5606A32A
	for <io-uring@vger.kernel.org>; Tue, 27 Oct 2026 13:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B22D5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=pwZubLos
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36a17a332ecso554798eec.1
        for <io-uring@vger.kernel.org>; Tue, 27 Oct 2026 06:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1793106211; x=1793711011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ReSdqMrGBGnsTnwVh5aa3vwJIfFSFewN0arb4MIegpw=;
        b=pwZubLosiPicmF6eOZkcnrmXKaKA0onFcjm5mWUKQ+V0EFxJ+Ny1krsU2gwo/ukIqh
         rqUN13guldw8LZ6tfWAc0W2WKHDNYERK7ZP74wB8FueP2bBNXK3u1ZjeRuGOc1sMSpQy
         f3eWBeCGblNzaC23usWJLhwYcfBo5g6Z5k2g0M1kQ1V5+BsNqMY0omu3RhL3UmBhhDTa
         II3fH1sqsbJAufYvRV/OZbxhH9TbAV6O6b1ChNbIP8GO+fBZZHGIh7N6bSQxHIKc/44V
         Wm7LF9P3hc7tBhnnSkWAUwBcF3UD9Qp/uepks4vAFBlxZ8Qmd3Khnm5hhAYEDg5biV5X
         Zk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106211; x=1793711011;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ReSdqMrGBGnsTnwVh5aa3vwJIfFSFewN0arb4MIegpw=;
        b=j7eQkIkV7cW18nlDwtnfs4ykmWrrR/RfJVimGd0teSnYWrAkljURchpRuxBwRo+YKz
         G4LeaMAlh/QMYjpd5/vkzpk1MQSkrwzadi6UazPO+XPC6plsTVAlqLBrpOmGe4eBQ5tz
         vek11TzYR0ktRj39e+Rwb0LgVac+6D6XnxuHOfjOchT715bIPPYFIHni1cseqrLvlpux
         5vbUwiSZ4CGz4ubCy2sOqlqI7t0dhj3rt8Eh/Dz8S4IMLHpAisQmto+lvafJW5banBos
         A4SmUZFo1jBO4/wf/agwij70kbBwdJ3Z5wIJ510u1msKjHO4DII76I+1BhlvzRxq/Bn3
         SIbA==
X-Forwarded-Encrypted: i=1; AKwUvBzydl8hCYi6irVLxKBqaA0NHqp/kpP3doUd9KqXvF4a9CAgbrDdFNqMK8IkAyM1OBKpNTnzHWc89g==@vger.kernel.org
X-Gm-Message-State: AFq9FYK2tmvLzFpoS9U+d4fF4BxdAMI3d9epWKgg4Q9xGGueuC5z1G8P
	iWwBMxdmq1/p1ashx+anV4sBDgpvVqwp1oODozUP8Pb0yOK7VZS06nAkkksyWEwJzlo=
X-Gm-Gg: AYBFou0U18JaWuCR4RrZpKPTH6LGmIgkEmI40TK9NfzRgyFhcU8lEOoe7zKFrIjdAh1
	it9CXoWIrQCtfPgML63QlqshfHlzMQk7GJ07PVRZE+GadhbC5NVYNDRa0L0pIlmH9pIEmd+Bgo+
	tV4zmYJe/USa1UbUoWlgombXOiKfhPNuYQ2mPwsmuy5K74z6Q0uGiZ7mXqIZlnZt0KeNnOwGg1f
	kuQZ1bMZoTigECYTIm3EyByDkIkzPQOhF1/Ndm9SKLSzT2c9KdtlhXS0p20XfgLxueK3BChBv0X
	BkximfRIksjDvS1erhz/QX38Gl5DjgWDI4ozQq2mqhKcohFGy2z0Im5adwKLVbtih2WoiySeWXl
	1KlJE4mYCUrxNfcw6LO3tI9enJItROsmkWJdDWVnVKg07RRtms+RtR/znfPxWtGYB3g9IDjxJr5
	XXaLTiK1H6Eqic4RN2Btw18UWYO084MUO2a17h3GVpsF6GOABYWT7YH+WeoMc4GPwJNaV9ikYzU
	NI8lPDrNi+u2nTltaFp8mSUnRKJFGlq1SSDvJQp8FHNf9xWsAZyf1P1Wh56ciDveO+8CEVrgbh4
	pftpAIejQsPAypxkvGm+IC71NGIaVGPp5t4VcVU=
X-Received: by 2002:a05:7301:77cc:b0:36a:168a:96c4 with SMTP id 5a478bee46e88-36a168a9865mr1879705eec.1.1793106210431;
        Tue, 27 Oct 2026 06:03:30 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db7b23sm46576346eec.19.2026.10.27.06.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 06:03:29 -0700 (PDT)
Message-ID: <f92baf52-bc4b-432b-bc0a-f39f59483805@kernel.dk>
Date: Tue, 27 Oct 2026 07:03:29 -0600
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/1] misc: fgds: introduce GPU-File direct I/O via
 dma-buf
To: Li Wang <liwang@kylinos.cn>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pavel Begunkov <asml.silence@gmail.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mengmeng Zhao <zhaomengmeng@kylinos.cn>
References: <20260908131545.105987-1-liwang@kylinos.cn>
 <20261027090853.30099-1-liwang@kylinos.cn>
 <20261027090853.30099-2-liwang@kylinos.cn>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261027090853.30099-2-liwang@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/27/26 3:08 AM, Li Wang wrote:
> From: Mengmeng Zhao <zhaomengmeng@kylinos.cn>
> 
> This patch introduces a driver that allows moving data between a GPU
> dma-buf and a regular file on NVME without staging it through the page 
> cache. Userspace registers the GPU dma-buf with the device, then issues 
> read and write requests via the device's ioctls. Each transfer is direct 
> I/O: an ITER_DMABUF_MAP iterator is passed to the file's read_iter or
> write_iter, and the filesystem's iomap path submits REQ_DMABUF bios that
> already carry the dma addresses.
> 
> Signed-off-by: Mengmeng Zhao <zhaomengmeng@kylinos.cn>
> Signed-off-by: Li Wang <liwang@kylinos.cn>
> ---
>  .../userspace-api/ioctl/ioctl-number.rst      |   2 +
>  drivers/dma-buf/dma-buf-io.c                  |   3 +
>  drivers/misc/Kconfig                          |  16 +
>  drivers/misc/Makefile                         |   1 +
>  drivers/misc/fgds.c                           | 506 ++++++++++++++++++
>  fs/iomap/buffered-io.c                        |  11 +
>  fs/iomap/direct-io.c                          |  23 +-
>  fs/xfs/xfs_file.c                             |   4 +
>  include/linux/iov_iter.h                      |   4 +
>  include/uapi/linux/fgds.h                     | 124 +++++
>  lib/iov_iter.c                                |   1 +
>  mm/filemap.c                                  |  22 +-
>  12 files changed, 713 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/misc/fgds.c
>  create mode 100644 include/uapi/linux/fgds.h

What's the point of this, when you can just use io_uring to do
the same?!

-- 
Jens Axboe

