Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C6953D0B0
	for <io-uring@vger.kernel.org>; Tue, 13 Oct 2026 19:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919011; cv=none; b=bRmQ5AX++tWj+poXgOE8ZE035u4AhSpIl9PHQiV2hpJtJAZtPD9N/1xnMc3JxJDhCKdDgcFQVaxgcT91eZDQEjgx1GHTLa+YO1V+Sc2+M0pkuo4X3mebFfklQuVaXlsZ1PXpU5o5CplF3MSd2gR57laDHB/70l+YhmgJlDOYook=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919011; c=relaxed/simple;
	bh=NZKCsIl+eMG9fGsQjejtk9lf0m8MqeFHKmqySR38f9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PuV3Jg1qOqrAR+tiWH88OGznQ4cNKNac4dM1zqA/Rxih/qeMWjuhXdgEnGYN1x4Sam0afYk/Cv7hZyJz/p09XhC7y7cx21Ugd63SMAo9LxyScNkpuyox4m3GZy0pmzk3zjWZzjpcmwXVvsBO8LpVdy+h2fEfqT5rK4gEEb6D6Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=tLLiJs/f; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="tLLiJs/f"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6df93f00f4dso124376eaf.2
        for <io-uring@vger.kernel.org>; Tue, 13 Oct 2026 12:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791919007; x=1792523807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9LMVzPqyuXj5ApWA2StVi76ci1CLBOXVU23pBi3Y7Tc=;
        b=tLLiJs/fgjv16ZNdmzoHeA22l8fBTqjwKXQSZAxFHG0QrydUpQBIParCFiBt38o5bi
         avBRxV7jzLlj1drEnH/C3aXXSrHbUvPukcZ0And3v0BpdgM2GhAoN/0UrJ0pxULVV/4R
         0XJQckApncG0TFCW/WEefYFgNlswkWIv3OcnZxOph1q6iMbTiH1LettNuCThs+CovbvD
         VDZs5MkJF2NF1h3FCJCmQ5ZqLfHKpHq71NftsCusCH5YgvB9EHiwuTPFaJ42dGJJjVwe
         ALp1pTu1Zln74/r2cr1RCK4vy3EAGIG43BlFHNUY3zZYK32SrDiZAqpgCXr3kjiglDRT
         jh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791919007; x=1792523807;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9LMVzPqyuXj5ApWA2StVi76ci1CLBOXVU23pBi3Y7Tc=;
        b=LZXfKtmddrhvihgWyIokH3BAaJCmRfl9Ekq//AhEB1VInBbEhdpTaEpaR9OVvpwTSH
         g2vmaJBE0HYhVyMbITz1tDYjN/Igjl3ODuvx719k/SRw9TiWr4sPjqTIYiQ9v89PElOJ
         ddx/VTkwJDioK8PohhulCLBJYpI46bYkPw8ev2zzaBYu/6OTQ6SGHGGqYA8tOM7DthMN
         u9kApjSxfTTOMVmFYNg/AVrGUAhZLZV0GbwzJ6+IIt/3gX2jYO1oDiy5RaSiW9JxRVid
         afKLFsyCWrowhlYW3uau2ospVEpPDN8c629WtxH+vP0BCIP0FffKlWj8DvlwKZSEtXZD
         8E8A==
X-Forwarded-Encrypted: i=1; AKwUvBzfxh3GwEBtt4s54d39QR/hielOiw/rZn7Yai/7JEUkKKAxGdPbLeLTYvOVf0HxBrRTXv2yHQaRTA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKq/TwwJqECXtI4YHxY63ok0Ktf+fPGOEAmtiqGcrkFmD/SmLss
	VwOfmi5rMpTrb7DpZDddqI3ohebcxTNwAUK/0BIMjqNHvsHp15UpcQ+IGWDj015YJCE=
X-Gm-Gg: AYBFou2qgN1oBjdhsEDFpTxxENgUw7UMsRdwJ5dgyAtVpp8l6cSctko1O+TDzz0h/oI
	KkbTPEhpfQmgRHGdSi1ugGLoQbAwS0kgAKybhPvnXhE8AQe/wrspewkiWsyTcN10lhCfbPzLODQ
	yUtV2o8mZq+rA8P/kCItKsQxS3f3tJXMZmb+iQdmYIe1BRoUfq8gljOPGRffmF1RDMlWQgA2w2P
	MubCIuhQBf8Q3PmwREhirpDIn7FvAtm+nOzCOkXuOY1ei8Ee6Vbl0ISTZqkOHkeDcPNgFkJ0o2/
	icJKNei+xP7Rpo7OJFgh5n0DaDoSyGZy+Ee77aRG7zWAvrPTW6uEAab2rJeTes29ckKT9FMrJg4
	1TJXV9ArBqzUQyBeSxvJ+rCC86XdWvv0JiG1b/K7gcVVKPWks2kHOnEgkav+xkdllLgzz/iDbbE
	kYPF2CTWiwQwF/ylt6UXhH+d0Z5dsi8c+h5McWZZSR3HHKP9mi6sCrjBU+IJCx7JbaWpfdoGL1g
	yeVIstN51V8MYZbSTNVx1wDDoXJs2duFw9PgWjtujienzZyWmN1FYmcJg==
X-Received: by 2002:a05:6820:c8f:b0:6e2:2dcf:2cd4 with SMTP id 006d021491bc7-6ef0eec73fdmr9825677eaf.16.1791919007140;
        Tue, 13 Oct 2026 12:16:47 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ef023a1c1dsm12597782eaf.10.2026.10.13.12.16.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 12:16:46 -0700 (PDT)
Message-ID: <baae166a-4464-4065-a642-348034cda28a@kernel.dk>
Date: Tue, 13 Oct 2026 13:16:43 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/13] Add dmabuf read/write via io_uring
To: Christoph Hellwig <hch@lst.de>
Cc: Pavel Begunkov <asml.silence@gmail.com>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 io-uring@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>, dm-devel@lists.linux.dev
References: <cover.1791336930.git.asml.silence@gmail.com>
 <d00e43fa-8f5b-4a8b-8b83-421d637ba519@kernel.dk>
 <20261013141046.GA12680@lst.de>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261013141046.GA12680@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/13/26 8:10 AM, Christoph Hellwig wrote:
> On Mon, Oct 12, 2026 at 02:21:41PM -0600, Jens Axboe wrote:
>> I've queued this series up for some testing, in a separate branch. JFYI.
> 
> More testing it obviously good.  I've been waiting for addressing
> of the Sashiko comments on the nvme patches before doing more ACKs,
> and while I can't really judge the code those in the dma-buf code
> also look somewhat serious.  So it would be useful to get them addressed
> and the series reposted.  Same for folding in the PI vs dmabuf fix
> from Anuj, although making the combination work would of course be
> even better.

Agree on both of those (sashiko and folding the PI fix), but it's been
forever and let's at least get some testing done. As mentioned, it's in
a separate branch, easy to update. But if we were to have any hope of
making 7.4 and also not missing yet another release, then it would
basically have to happen asap.

-- 
Jens Axboe
