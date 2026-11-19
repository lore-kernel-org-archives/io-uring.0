Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795089430;
	b=AcSuDirJ2KDB7GOLH/e0ruotvNSj4wb7qizJAYAcUCCvMouWm48157TV1cgSYqlY9QA+
	 rMpGJyYKGDQPvUnmGHAqVj2EAojpoflZ36IO2txal2TbxX4iKpl9/6NtxQDkvDvPVbwkp
	 UKnGTKaqxsP7PtLV4hSi3BMB6vgg7EAPQPN7ZIL6RoqE0MGQCpIBzqQo8oJg6f8EPvxdl
	 aQFwlv8Fy+pBJUe/Rh1WI9t7xQoEYQvwl4t731ZVTIfLFWDMebWXu+siZDpE2Ig2kFsCG
	 BIfERIKviwnrYL5JbcM/XUYfUh69IkTwN0JXXymVP4GO8mdoNXq42i69EnBAi0eGRCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=zlJH4+t0mXQ/RY9w29YgUuQUml1Z0NJ3e214jG9j+bE=;
	b=JX7lsqpYybIMXrdaUF3IdyRgzIbDbNAffqAiioIqHTSoWcWbb/VBGAlFZ7ziGwPqBDJi
	 SAcNbBd5YPVBY52jC08OvCxTSO2r7V8oOmIW8hTnNTY8RUPzDzwZcwk0WM+Ql3ZDpD9/B
	 ioMkQQMcASXcHMrKgMiK51hUaGJfJtJQxyoNzgYXS2h2Ip8Q3ZSr4glzjiAM+HHpH4B6q
	 k0Qrv29e34o3asJyzfrB0/a7zOA33A5K8EB0jbwtIXRDDhW6arGthtILomH9IGCGlwjV9
	 VdWO7nEzbxZmXv8OF1ZuxgRRo/AIm9AK5EkIgdOtbwc4+TcMFWZRL7WHCicyJubMrwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K3dI6WCM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54619606A32A
	for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 11:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54619606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K3dI6WCM
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b6f42095bcso3306272a12.3
        for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 03:57:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795089429; cv=none;
        d=google.com; s=arc-20260327;
        b=pWk+9LDEGTaLW1knSUJPEC44ZM/EYt1L/g5yEoaUFJR4pdW0ZYc2RUjUqX3eaFZabB
         d6ly+ABJPWPXKLKBUljN8WhNmmE+mBkrE6AdrcHrySqwvVMvMB/6QbtLCehbYxX8FF1H
         +psYKaKwUbg8ZKzLqdyy327ckLXFYLyD3oqYGR8bdc+TgsCskpRBNFtOYjcbzuFxov8K
         53tQNbDINa6AV8u32+vFoIHBFGOm++4TOSOvRrranDdFFv4nne7ewLYyzaZ1+Iw2Z6BK
         LIYCDGTV+VlhfQ+AR4CNRfr69Z6ifMaWFnn5UN93TJqqHVw9uZvI9YMwKGJ9FUgLNnwp
         +hfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zlJH4+t0mXQ/RY9w29YgUuQUml1Z0NJ3e214jG9j+bE=;
        fh=SmggdOTmmC+BoeHOikBXVY5kT7yZqJv2g6igeHoxpvA=;
        b=BtB2pif2ekIujzd3GttOJTIz9m5HP3O1ctgx+ZdoEl/rMZkr+JGWKiu6ecRGcS69QL
         Wgwz6EM6nDAc6vxLzO85aoVNXqgxI5qEgBr595IXfQ2w5QU7HxlPt5nfFmlk2xhphMnk
         WtnNnModVCGGB82u4Jfc/ue59/O3XRRmYdMZ1DrmUmTQ7k1AstaOtSRLsSXwJ9PTSsjc
         ZyzeYGZWBKPlNCnoweyRrDTTYse3FcnEN4617Jnu6rbCt2muBLSs5X0Oc8tL9Kk94wiM
         +q81GJys0WJ6XIjMrmKcHA+iBOzME/ciOXjqH0n+ZODdvXkDIjZ4WAum0vimAUJgDPH1
         V6Ag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795089429; x=1795694229; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zlJH4+t0mXQ/RY9w29YgUuQUml1Z0NJ3e214jG9j+bE=;
        b=K3dI6WCMFECyf1dQvj6+tjaYhjJfKrNWoVtixGzRQjg9hBHKLgJUV9jS2ejMt8mV70
         FUaP+VD0fcCJw8DuPW228fHRIs6UC5YTRaFCorGpUjggIzvfceeT9VDXSeeAsIM4K/Y0
         dI4yB8/W/9IAkbZvuNywYM1ulat3Tvp3Njr+CBFpEqydko3cMlGXfm79vX29MEwCUULD
         4PXKV0848aTIpdf/FMtlUEqvpn85CPFioJ+cx/TIbaDofkrnexNAEQtyqz4Z5zhLOoRK
         MPjWIUb1cuC0LQ8yBW88FLiqjvp3WQoK8vkiqGXnwluJMY8FROgTztlluOynaxTORKBO
         XNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089429; x=1795694229;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zlJH4+t0mXQ/RY9w29YgUuQUml1Z0NJ3e214jG9j+bE=;
        b=hjh94F63NRDrHOt5wMMZTSMwnXokmp7hJOssZWuHSNnWihaNOO8qR4rzT7eZ9Np8Om
         FO4RMb3vlCSeykmnHRoq1qW1nyUV+G2aLtQzAhcCf8GFC7ybZZf66BdWoLq5EZgnytVB
         N0gdEvkO3QA0M2/7mbAZeueSVi2UY4eKRhuZOEJi6HhH8cGnxBdR1Ojj3HJjCDcIZ6X5
         WB1NhS7WYusNnbTQidByDmTmWLuAbIeL9YxHgjQTsGH+HrHkcLkTjcpiWHdLEDdo9pMW
         vkd8UlECPl7W8IdIymlG1W1MvPPOEhAsI39u+TMBQXs3MPF0bqpn9i0/GIP96pUfIYMJ
         QuRQ==
X-Gm-Message-State: APuU4Z8VPobzPe0y0vOpDY0gHKLHutVavwFDmF6uM9ntHBIiHBS/sg1j
	Gpgq2xEUwSETgGkUAu/QSkqQqSd3yw3Qf9a6mwf3sDs5uCny/qayfes2k+7MBcdVUfEXEkQNgBN
	pb8esTn/NeIth1Kz7iHr2ewRQSyJMEg==
X-Gm-Gg: AYBFou1sUV+s/lZWlW1vBuoRpTyrxjc0B44nPAgHPn7C+IMAIX+A2ooLXgO0dElL/Jk
	iruUis1QBa2ZYe0DuXkmuKjVEkQIWxGuSB9mpn6NyminG50kkSkfEo6xwgcNYx0gPdhdLm/NUb/
	p9lOUPc6ch30QP+pr1+6i57ihDQEzosxYXE07Fx+xejCk1zNVlppGlVmzcNRrIXPCAo+3KYEKjA
	u3olBI2OStFGjE5YqcsDa9qV4QXw9eWq6pEg0dIC9OApkMbp29RxfzURVHAcp4YvKjn7SYznQUM
	bjZKuse6Mg0K04fzrExzIrP7tJ4OfUCIfN4HNRdL5Qjaorrp4TVMqg2xv50Un45wCPrj24+an0c
	vNCpIBniCxHBN4qT95q1hb/oy6vjPYgBTGwuI9t6hPuZk4ccEyCbNVyRFuovByMEBYyQHMbHjlV
	7xrEUDD5y73t8F0iw23sFbYET7BUdpnAqn6N3G4JTVpkTNDpXSo6nnjKXnZQpNojGaorc=
X-Received: by 2002:a05:6402:2341:b0:6b8:50e:3bb0 with SMTP id
 4fb4d7f45d1cf-6b887f051b5mr5100854a12.43.1795089428496; Thu, 19 Nov 2026
 03:57:08 -0800 (PST)
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030014540.3065403-1-anuj1072538@gmail.com>
In-Reply-To: <20261030014540.3065403-1-anuj1072538@gmail.com>
From: Anuj gupta <anuj1072538@gmail.com>
Date: Thu, 19 Nov 2026 17:26:31 +0530
X-Gm-Features: AclHuK_SZqZJTPjuQjOc7cIWYhN7F4D2sFh9VtkHTF5WSy6wsq_qeWgrWRBsOwc
Message-ID: <CACzX3At2GfpQB7eE1S2njJONChr8DmDC5poBw4pX+pAg21cscg@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] dma-buf backed NVMe passthrough I/O
To: axboe@kernel.dk, asml.silence@gmail.com, kbusch@kernel.org, hch@lst.de, 
	sagi@grimberg.me, James.Bottomley@hansenpartnership.com, mkp@kernel.org, 
	bernd@bsbernd.com, joannelkoong@gmail.com, miklos@szeredi.hu
Cc: io-uring@vger.kernel.org, linux-nvme@lists.infradead.org, 
	linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
	fuse-devel@lists.linux.dev, joshi.k@samsung.com, anuj20.g@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Jens,
All patches in this series carry Reviewed-by tags from Pavel or
Christoph. The series no longer cleanly applies to current for-next, so
I have rebased it and posted a v4:
https://lore.kernel.org/linux-block/20261119095615.1840522-1-anuj20.g@samsung.com/
Please LMK if you have any other comments?
