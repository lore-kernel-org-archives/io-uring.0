Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716275;
	b=yFrBBhp+A+swb362WSN9P3vLmGCZSJ2aekBKnCCgM0srd5noM5rAxHPdHESSNnm8z7K3
	 M9991Odolh+EjcmpqfcMerP7ExcL+RKG76aluty1XMJPHF5j7lKVyrsi7WWmMIuIcuqWP
	 nH7QZU4aYGKC8pc9C2zp9FiOuol4XOOH9tE/kRK2k8P2VjtpkU3+RY/AKK+vctpnE9Eey
	 cNXw2xf4scU40aEU408z9Hoc26zGvS+MG61hfvVmxoT2jddyya/WXl8QJTd78DwLBGUtH
	 B6JP0J1wn+35wz79UlG9+jD0qGYuTO6W4d6QhFaFeP8P89UV+p48/7XyEl1TJxb0eSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=mQHIItj+qvoGznmNDSAc+oLyoddjsgyl65N2G457jxQ=;
	b=Cv4t6pDM6tVgM898BZWa5ACmZ/CJVeVzcvHVjvffv2MLp8q2Y/a6lf/XNMpMd08YCExi
	 ew9HcuHbODpmUxy7sT82sIzjXlY9y9qFC7sA4f/cy0GEuXkSXf7PCoqWwM49zBmw3Mdl0
	 Lx66/iX4DUhmA3Wn4uYRSj0vkPHmqhtd/IzXpiZ1gFAA5qAGYlSLKoTLKcwIz7tkfMJ6V
	 SWoYObF7fYG98qiJAd1i092+yq8ObdvB+XpChBdOa42Ru7wO8xh9PkRMJm21CcWSVFoBO
	 /LIuIX9K4ihTgqkCb8nM81QmX8tHnW/9UcBsN9vEZwWdIw9nTefxoX+R068VdwUb6VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="jVnxhA/E";
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C658B606EEA3
	for <io-uring@vger.kernel.org>; Tue,  3 Nov 2026 14:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C658B606EEA3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jVnxhA/E
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-14394530ec6so5585182c88.1
        for <io-uring@vger.kernel.org>; Tue, 03 Nov 2026 06:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793716274; x=1794321074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQHIItj+qvoGznmNDSAc+oLyoddjsgyl65N2G457jxQ=;
        b=jVnxhA/EG8/jwWHgyUd/YGEYAOWsVLRlwNPRXwYEGVwswK2+uIGauWBraLJnUWUA/t
         h4t6pngRbbrUOVUbmqrlWAVUK3/ta+8Zown4zVadfvmTepZik3oUQ0nWhWqTcs98Qb66
         02BsiQK1wpIb/OOt8q3I/7EIuN3e8R/LQhAdXYpgMIzEI1JUwWmQnBlbKGfgtP5z2r98
         5fZlpur1KqKKd59doL9dDbmgKB2ljBPZBLjqhSkoWF9OFIM/aX5CyXWKG+MrJbtp8m50
         4lzdrVw6eECucGAexedcU/afcUfRw5ncCH4jSpuo9V/mwzGNqPLBXWXtcd0RvEigPHVN
         /0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716274; x=1794321074;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQHIItj+qvoGznmNDSAc+oLyoddjsgyl65N2G457jxQ=;
        b=eSH37wAaTbNkHXJbGXY4PZnGnAWDzUX7H6QBxS8EMpLhKE8ivRbTGd93+LPQJe90fe
         MmeOgZaKHneSqJu3NLJ3os9DIPrgOvQaR9lj3Zk9Kmbowtl6DJmU2PSUnxLWEAxkqKzK
         ROLlaYTZ2wK09Pbj0ydzAXjCzANWYfhUyEL63JnZ3mw+CiJ/msat2w/jyZUsRG2vf7Lw
         4QRxDN20oAvPtNuhyV/atm0BxXl04Gkq9Ra8MWDG0DKzYFNWGrU2+BCA7rZ9qhHXUARI
         TzNTXcAMWT85ugc/otSSWMHELzjnMjUudEVMwtB/MH9Fm+H1OZA5zVAV/tCTjfWrFReh
         cygw==
X-Forwarded-Encrypted: i=1; AKwUvBwrP5xUIJGftzsb3H1aFG78BitQY+ou55vm5wDjAhzataSgxMJWHCvg84aQ8EnNiZcnlOyKrfGy+g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/mS03gxSOH5VP85k7GODHkGsQbQgbEdIpinSXt5hExspL+GoHW
	T6/dU6mXgUpgO9RtENpzMOPwwxG8etql3PKSYLZbB/QY+vmHf2kFV9pbkqjPHSDW/Bg=
X-Gm-Gg: AYBFou3fsVCP1l7uLM2WnvGRX9AJY43xjOTCOcklRqzVFaohWLZnRSk5wbNzkQI10s6
	nd9OS1+JeeGwHKrQcazhFCN/LCuiIdDZHCXQeat4eIf9uEbUKn+aB0OBpVw++66zGkajZzumkAh
	AW82G8Wks2mOqDv5RBg7PexMWgt6ncaUyywu3WwUv8YSYqsLfKF3maWxsPHh+YYEJJXC5Cvi+Bv
	EMwsKdzbZqdK5jhT6EQA/bw4aOsakIXTiNRz7WJhzHt+v6lgTqM3ixWgYeikULO/Bo5ASIAynNt
	BE7tdem0mh29pmWCb/411sHZx2w2y98Xi/rqeYQJCQ9RKYI9lly/zBkOMvFrrx+s3aMAsby5qrb
	IDbBbQRKAVucrqLXcnZtN5yobVX1oEGCN9N50McWrorpiJeDuUcxFN6rXIe5xp1Yr8NpRCw2tHZ
	cVURD6r22Nb/Fb761RX5tXufr4ohOEbEZT9dipBRmIj/6QlzQkRfNlkCzIFSVMjR+Hi5Sp6f4t9
	1EBLvpsTlx9LogAtdedV/ixtLLrBtLRmOVZ+0/v31ADXdrz2uKmxDpvWj+YkrrIpXaKFKu4mD8g
	ENWQaJO9+wDilNcAkhq0xo+7IyEd0TKBcatnEiQhwc3eUKV+NIVhAEOYdXC89GY4Vj4akZ7UwnC
	kOHCJd29q+p9z
X-Received: by 2002:a05:7022:3a03:b0:152:9e88:daaa with SMTP id a92af1059eb24-1ac5f181628mr22731309c88.36.1793716273870;
        Tue, 03 Nov 2026 06:31:13 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23b847348sm9534779c88.4.2026.11.03.06.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:31:13 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Pavel Begunkov <asml.silence@gmail.com>, Kyle Bader <kbader@redhat.com>
Cc: Kyle Bader <kbader@ibm.com>, Anuj Gupta <anuj20.g@samsung.com>, 
 Kanchan Joshi <joshi.k@samsung.com>, Christoph Hellwig <hch@lst.de>, 
 Keith Busch <kbusch@kernel.org>, Tushar Gohad <tushar.gohad@intel.com>, 
 linux-block@vger.kernel.org, io-uring@vger.kernel.org, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Martin K. Petersen" <mkp@kernel.org>
In-Reply-To: <20261029155821.2983229-1-kbader@redhat.com>
References: <20261029155821.2983229-1-kbader@redhat.com>
Subject: Re: [PATCH v2] block: only fail dma-buf bios that need block layer
 PI
Message-Id: <179371627250.3691261.14418388073265426531.b4-ty@b4>
Date: Tue, 03 Nov 2026 07:31:12 -0700
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 29 Oct 2026 15:58:21 +0000, Kyle Bader wrote:
> All dma-buf (P2P) I/O to a device with integrity data is rejected
> today, at registration and in blk_mq_submit_bio(). Only a bio for which
> the block layer generates or verifies PI needs that. The block layer
> then walks the bio_vecs, and a dma-buf bio has none.
> 
> Reject only those bios, and remove the check at registration. Then a
> submitter that attaches its own PI, for example with
> IORING_RW_ATTR_FLAG_PI, can do dma-buf I/O to such a device.
> 
> [...]

Applied, thanks!

[1/1] block: only fail dma-buf bios that need block layer PI
      commit: d734b6433b2fd248bc25a2ea1fa60c34b40ba15c

Best regards,
-- 
Jens Axboe



