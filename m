Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795130580;
	b=bjmr4xuR0iOk6Lk2/89WnkJct24JTtB58pPXB1HNWlvBZbEWeT0VYm5XQqknpZsUPMeg
	 4hvUqq2SA/S5GKAZkpXO+KvHp+r2w2cwLy6xWbH9FTAdA9Bp3nrr11v3gJK10OEBunnEB
	 +jOVGljS8pxuwdx1VGmaEmccubR5S+6bOYUpQkTlrwmz6SSDdHr9R5yDESGpaeFW485gY
	 RhGbuuM9aXhL68iS1dCILLUF/A/sxX3nMoBx/Z/ns0K+exnO3hyyHc8B3YCXM7v+kqVR6
	 BFVcAddBggokJ6oxv8BCh5rzswc0uhBlE0RlSVIKRVWWNBtOkwBVRdtEVDeZVowsYdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795130580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=1OWXSRbdtdzLicFzuUAaijNOxktkEI2AOEgHXTBtgjw=;
	b=wmO7J7Q937lRHQqEtCm3lMxn7Ww4yZGy2d60l1Db31TIibqm/LXwfAwV/Yt73iBBWaVI
	 7N53Tynz8lDNzx7d2p744MAuVvHK4ZDNr1PlxzKliBffzpsGILeu1uG6udib/Q2+ZP7WE
	 Lo8QtLs8gsckMGeFpdrPNd74XE+dcpvx7hHiFG7NfBPlNJtPczD+++K2na5gdNEP3EG+Y
	 Pjznn0L74fuFTiZkN4hbhkWlkOtxHNMD4hpeO3i0udA/B0gW05nQnMt1naTP4u+vLe0S8
	 lxjbL6f8MlptfSeLpjeuhpq/HMseTKsHqLakShmWJS1kBGH9LHsL43JV0THmxaVfF4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WRMaTf7g;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD70C606A320
	for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 23:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD70C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WRMaTf7g
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-382f4710a17so419098eec.0
        for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 15:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1795130577; x=1795735377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1OWXSRbdtdzLicFzuUAaijNOxktkEI2AOEgHXTBtgjw=;
        b=WRMaTf7g7EgkAKTe1y2ylKPPW37zfrZ8ZRO7fKJNx4nq/xCPhQ3BiCtpluq4hh296P
         9VNtlRUjwsojOcZcMmkIQUiY4bYydPTzA0at3KrJJyeiUrCe1Jn8NfKRI0AI6zXGW/iz
         VG3h/T1cRVzTG/8/+0eNF3Z+jV+FeZlXyBDWhoK1xYNcNy1zkyUmKaPQQTw69zygH3Dw
         yYvhSuDDTQQ96HuF3OQuFUWFe/YkQrrwGCj7PmSmMuHQB8EjIxy+WR6X583hG1EmEFm1
         SMJweXZrvcxmbh9aC5sL5lhDwrOAwcMnR1/IDr1XIoCZ0VqiG7n5d5khZ42Q7vniOopd
         6few==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795130577; x=1795735377;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1OWXSRbdtdzLicFzuUAaijNOxktkEI2AOEgHXTBtgjw=;
        b=0Z6iycG12Z3J+AeP8HiIKSHW26emTfnynj0nrnkagKtgqtTByuReGf13fLgSpiEa/d
         MIXK9IlZx34sN7LDsJfTZfEUraL1F3OTqImv8ieHE5gjnCYiHfqlwj8hzA2rzD8TiNt3
         UDj+j0njA8nt8mqSKCp1867fyIDH8xDVHABWiak1l3pUyLFTGPQsstl5ieWOgCyS5rTD
         NRs1xyPogtfHwV56U8Fr2LS3CwJTZO6d9aEGjWL3hDpw3I683kLCFemU09sz/gshzVUA
         8wyNEBmGew0r6Bb0vMnGhkqpYVxGe+sOO9xyviKnK/bXXnmmBVqZE/OeUbwhFY8gICZm
         YknQ==
X-Gm-Message-State: APuU4Z8aqYkVO9xAyeiFOlIaPS1swoFgxR18mHHeNdNHmHIWWDJmxqan
	zuHT/1smDCP3SgO0uWL2OmfW0ktBxjeatwDO/73bJ9pJ8TAky/DBDuWzSL+zqA0K/WY=
X-Gm-Gg: AZFdTZdEaU/qbplQuAKbKHm9zthrIo/IcYPKIhhcRkLl+A3n2wcxhaozKl+d+2Yz3Yi
	HTFhA3C3eLRSHPXiPKMsVzKo9c/GYDXvsAsbMv/qORcN1OERJ7KaPYgubD72hWkyoxwqHDbvhI5
	kG065gxv+7TkRSIr5w/NG2WkADQhxlHDUB6js8ubteQ//6gXqBfH2nyfdeHy4+L0njXNWACo2MV
	x+qmCm/tCTLeVti+Tw+egOM872tLrH9CJ3PUTmoWgvDauXHA35zGnP2ECx1ID9aXsvV4yo9zuQF
	QrPJtaKFJ91GdbJWNUZfnpE3Rr7B6AUKE1+elAuD46gIzQBVdsZBenXhMGmQsjX9YvuWymOKpK3
	9xBYudSYmyOVE1tWNU92oTeayqjWRL+WyE2DB3PwpsvIIAbG1BeAp1ksK5kOAQ05Y72UtWRsO//
	2mSqmPYRnFr57An1JngewYJHpH3fLiQ38H8XiLRvco4PE/djfx0mFL59k78p150h6KFnemZfthT
	Jw/kHX0apbyHbnMHjaxZGPUkcZ9KNtFbp/ziNjD4PWkh3b2DT+Fp1d/yHtiaN5sTn9sdW2+Sdwb
	3dZcrQyO/5iqalojKed4Vk8V/fueqbJNCoT9NXDHIAHMwLDp6nSELcOhIEjj3mXGkbFdR7ggW58
	AJKTQ6KMpMzpQrZsKqZR4gJnRvaNRnNO7a8GavE/ZMWkRrbm9PghVThvrm66ueRAaL8MbEw==
X-Received: by 2002:a05:693c:600c:b0:36a:1bac:6bf4 with SMTP id 5a478bee46e88-38570451dbemr1132476eec.18.1795130577164;
        Thu, 19 Nov 2026 15:22:57 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385679b4d6asm1949272eec.24.2026.11.19.15.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 15:22:56 -0800 (PST)
Message-ID: <44e32552-98e2-4a4b-85fc-3aaa79033bd1@kernel.dk>
Date: Thu, 19 Nov 2026 16:22:55 -0700
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
Subject: Re: [PATCH] io_uring/epoll: reject IOSQE_FIXED_FILE in
 io_epoll_ctl_prep()
To: Dominik Maier <dmnk@google.com>
Cc: io-uring@vger.kernel.org, dmnk+artist@google.com
References: <20261119192223.2659961-1-dmnk@google.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261119192223.2659961-1-dmnk@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/19/26 12:22 PM, Dominik Maier wrote:
> IORING_OP_EPOLL_CTL does not set .needs_file in io_issue_defs[] and
> resolves both epfd and fd directly from the process file descriptor
> table via CLASS(fd, ...) in io_epoll_ctl().
> 
> Unlike the other .needs_file = 0 operations (such as openat, statx,
> xattr, and fs helpers), io_epoll_ctl_prep() does not reject
> REQ_F_FIXED_FILE. On a ring configured with IORING_REGISTER_RESTRICTIONS
> requiring IOSQE_FIXED_FILE, submitting IORING_OP_EPOLL_CTL with
> IOSQE_FIXED_FILE set passes io_check_restriction() while operating on
> unregistered regular file descriptors.
> 
> Reject REQ_F_FIXED_FILE with -EBADF in io_epoll_ctl_prep().

Seems like a case of too much LLM and too little actual thinking. The
better solution here would be to allow a fixed file, there are numerous
instances of exactly like that in io_uring. That would certainly be
worth doing, for the sake of consistency.

> This issue was discovered with an AI-assisted code review tool (ARTIST)
> and reproduced in QEMU/KVM on an unmodified v7.4-rc3 kernel without
> kernel modifications or error injection; a standalone reproducer is
> available upon maintainers' request. The fix was compile-tested with
> -Werror and checked with checkpatch.pl --strict; an equivalent fix was
> verified against the reproducer in QEMU/KVM.

Can we stop these silly disclaimers? If you insist on putting
advertisement in your emails, at least put them below the '---' so we
don't get them in the git log at least.

-- 
Jens Axboe
