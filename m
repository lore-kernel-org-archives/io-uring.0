Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1D03C276E
	for <io-uring@vger.kernel.org>; Thu, 10 Sep 2026 20:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789073736; cv=none; b=Lx2VMRrOkcanbytKubd+ZluH4MiXC40kRJYteC7gAEnV1No9RHVthNPRSeoMeJzj/IZboUbr3N6uqtCs/TDtstw1efQ9yOjNu2fZuGaj8dnTMBs66YdwaY85HdXVFETz7oUmjmBr+OSq8XCTDo+L3sjy5MbLsuCiXtis5l9gckQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789073736; c=relaxed/simple;
	bh=UY2XndqblTUXCDmu0W73JbWw75AHqJSFdH4toNPJyog=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DAHm0n3cmmLtr87pjfxhnPZxEgOJ5aEYZOfAKjEyTw099Pk7FYDVQVn69xUvckbZa2pbPO3+bj1vu0vHL9YJIqSbZy9OjgjJ1PVu9ZfZZq/JSiED1z2SCmybSu42UiaGyuqbUt2GOWDdRuqBtwe+KwsMvaJRF11t2Sk4WiyzdhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=xFURFx92; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="xFURFx92"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-7f4f0c89e35so148119a34.2
        for <io-uring@vger.kernel.org>; Thu, 10 Sep 2026 13:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789073731; x=1789678531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7BgPIv1ZQw0ml091p4qej1j/5Et1QAUdr/a/BWY2itQ=;
        b=xFURFx925LNabTvRpPuRALJP/xAFhkZ1lXG+8SReVSnWfOIHm9j+gmvdAIF+9/ZttA
         ZCNbv+2S7SlMnfI2h1njj9CMPPOVo04bnfLOEiL0Yz8051uHnEV/QvEr+K3+voVOf1ou
         bdYKzQTFb9kzH211On71QFHoZ154WsMAFPqRnADq4be/Kjsub+5WLIKBy/bZxT2k+PiZ
         vPy8cEuJxWkXjJut2FRRQ+BT4ssDeFaC072OtIk5A9WVfpggWD8dDfWQkA418O9bORrG
         pae6oxIYVaH8O3kYFdhDmsByilxAInKDHRCDiv0YwjWSusEKk29wrEEL8gn36i6fHJep
         zhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789073731; x=1789678531;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7BgPIv1ZQw0ml091p4qej1j/5Et1QAUdr/a/BWY2itQ=;
        b=LYk+HyxKyKQczGM052mfB/uhwyTbwBh/9IQHgmcZOKNBxl7y2LXIf6b0EfdwYQQ1VO
         SJyxHwR+/8/K+Q8Eu9TD/6CI5fusC/a8obEsGgeMxbA2B0jJLaInPfWUIq2N4F5WDx55
         vMv3gQXUEbRGm/9llSOKeCmjE/au9m/jLGmP505s1j4neKfxIlLfKqLteC0oRbt2o/zd
         nM36l+UcyxcwnQOlISIQXFSlWP9OPZPszSMcksTSYE+f5vrNaPbEnpb7vdYOXThEWXZt
         6xIDLCFHuYwbVDV7J2dFlqPa/DSNMIk36PGPH/GLerw3g8rPPxAGE+dtMbyy5pt3s6iY
         kLDw==
X-Forwarded-Encrypted: i=1; AKwUvBxSOPnI9uwXtKgA6tUtVIc5hSlflNRPT0KjX/FePpK5yMXM2RRq5Bjwm3Oo7JzevtxUuSKffXpz9w==@vger.kernel.org
X-Gm-Message-State: AFuF++ndRlRyd1+FdmiUer6O+13lQlCz+Prehv6VDWpoPMgxfs55xEbO
	ogI7RZlpHEqxr2ydQtJpJgCRO8A1pxsv0WzJ8hYROB5vebE7uo5I03r4oSyN6joiZmE=
X-Gm-Gg: AYBFou0+INsdGJiRis61jRR8+h7Vgoqv32ITwe4OKeE2XSli9JJ8oZDLfCt7o7VBfEA
	Ex1mtVKMlWJjQSga6MwhjtfTqneZEKGEG9DpLdK0YdLiEmy+NUqAwJxsFVTX1bZX4Rt28xPg1sm
	ldOShDxT4R9wIUIkY0jS3BiGywA1BXe4W6zXIcN9Q0xdNA259FDJbBdWcfpk0CL3j/wXEnKJirv
	E8P2FWGVEH7Uglg7BjRo5sVUlW4Ak5K18h+X8qQsDSxLSvUQ/yNaVdgZmo7ROKujkzgeSrQMteM
	UZ2s0ueRoN1sSs0sjOPBoukKmT3HwC7d5dZP0Z+BynhxaW815Dtwbk8+zBYS7IyrmFYuzYPUmxg
	QZ+f6hP9l8zoifBL9JKSuDZuzZ7vv/oNbLjXyLCjF4NBLfg/czoaDLYAJMDkOgFboX/Sfqxegqq
	sTPlcobsS4h5awrr5khANahDR4QJW/GDJTeH0J5CBnCMut3JfnFcKk+lmZvKIXt5dQQradcRslr
	O3neD8WnfKbD6oD8U5tL5Pb4QNn9PdxxUq4Dv3FaWirLsbZPfg=
X-Received: by 2002:a05:6830:67d1:b0:803:3878:bf59 with SMTP id 46e09a7af769-804001c3c9fmr433555a34.13.1789073731594;
        Thu, 10 Sep 2026 13:55:31 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60fe54asm635779a34.15.2026.09.10.13.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:55:30 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, 
 Caleb Sander Mateos <csander@purestorage.com>
Cc: Joanne Koong <joannelkoong@gmail.com>, Ming Lei <tom.leiming@gmail.com>, 
 io-uring@vger.kernel.org, linux-nvme@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260909155848.2069290-1-csander@purestorage.com>
References: <20260909155848.2069290-1-csander@purestorage.com>
Subject: Re: [PATCH v3 0/3] io_uring passthru: set result on blk-mq request
 completion
Message-Id: <178907373014.484803.6342081621851413599.b4-ty@b4>
Date: Thu, 10 Sep 2026 14:55:30 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 09 Sep 2026 09:58:45 -0600, Caleb Sander Mateos wrote:
> io_uring NVMe passthru currently receives the NVMe status and result in
> the blk-mq request completion callback nvme_uring_cmd_end_io() but
> doesn't post the io_uring CQE until the io_uring task work callback
> nvme_uring_task_cb(). The status and result must be plumbed through
> struct nvme_uring_cmd_pdu, taking up 16 bytes of the 32 available.
> 
> Store the status and result on the io_uring request in
> nvme_uring_cmd_end_io() instead of nvme_uring_task_cb() so it doesn't
> need to be passed through struct nvme_uring_cmd_pdu.
> 
> [...]

Applied, thanks!

[1/3] io_uring: move req_set_*() to public header
      commit: 7acb6aa7916023e072eadb9e45e34a4b3f5801bb
[2/3] io_uring/cmd: split io_uring_cmd_set_res() from io_uring_cmd_done()
      commit: c54cf3476674a6a01c61da85fa32aee9f07c0741
[3/3] nvme/ioctl: call io_uring_cmd_set_res32() in ->end_io()
      commit: 11773ae6da9c9d92f5d1def78f7e70a9f1fa7b1c

Best regards,
-- 
Jens Axboe



