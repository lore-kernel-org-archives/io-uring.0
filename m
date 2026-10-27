Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119486;
	b=B/kpWd9tC8X4g2GUO4foYv6QkOCgahRxNWU/krgOHZNvpYlbF/p38MgSiTa1j61AL56X
	 MjCYC7dcimYm2+q1plc+JNsA+YZUNyQ08DuzvtedK57dwCxfLV6e+s4jlfrD9Jhy/6rDO
	 pov+Ss/GYJqzBONMRlShGpXlQ53NjrZxgjNTfDUV8dT0KlIwwPAI03W9DipSlrETanpxr
	 w6vz1cfk/YnFQYR58J7zGh3Vkk7gliF0EoFmzjE1OO2ny6bPC5trQTjx+jRsFjZ/mLMUs
	 b7Qo/aBasHJpKvq4+waeqaGREbzV3IkXwy36WnJq1hvH1cJAMB7Kg8bGStDX5bJms0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=jR3pF5DlIFSpLhSY083BaZUgI2YoO9j0dr5wABPC09c=;
	b=TbcpIR2CiMpZfGQh/+ORzpjlGzMTwPEGWfVDrGZABJtRKA+Ca2g7d27lylpzDYxNpA9Z
	 ddqMP0JVhjNIwI0UcW2g2P3N86TLmITxFOly65kctBnFhDulS0bWgFe6wSTE3VRgTxGA2
	 1HQEt/yIlhHrfAZ6TQEJRmuuaMVI9scq7LAVPNh1gw87dzxMUAlRH+SihWwWWaT0gYPKH
	 ttJsO0vlVXA79MnYaYV2puHx68JeyQOea347VsWMtbVaR6GZ3CdCoHBiOFaKqjnFW3g2g
	 BDrF25Pcvf5NPsugGkZTWhWh35h6um0Hv5NhiNrRCG/zEtVj610pV7N5vSkrOaW4FzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fqxo1a9W;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EB0606A31B
	for <io-uring@vger.kernel.org>; Tue, 27 Oct 2026 16:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75EB0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fqxo1a9W
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6dd4f3f696aso97226eaf.1
        for <io-uring@vger.kernel.org>; Tue, 27 Oct 2026 09:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793119483; x=1793724283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jR3pF5DlIFSpLhSY083BaZUgI2YoO9j0dr5wABPC09c=;
        b=fqxo1a9WYTLm35LUzESPRP1phpUhVNHIyzUzG02eCj5qTk6apRaLImxXPPUdv+zK2t
         hYC0yi0zhA/wvFcpeQCUbmHe7iAHO/5t9c5kUz36vqCt/j6RtUsaql4IGIOQNZ1hoyT7
         8O4nVtMD3dywGwWeiCKv5fP+gM8iyjOOpqznM3/dF1OHw6EKrQX1ZtNAfyCGPNdHu5Sh
         Cfhd0zl7ycSOQbXEgdglCTShIcwn3T50gT5e3HVTE7KiU59cYr0lFEioaVCI2NYSusI6
         ErvgFgmVs3bPkQ9PQAU42mkc6HtBcLLtA6EucepiP+FV+K2rqnes0F2OVnZqCf6tYSlW
         8ufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119483; x=1793724283;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jR3pF5DlIFSpLhSY083BaZUgI2YoO9j0dr5wABPC09c=;
        b=EGUxBSSNeCg0tiq4xli/G9h5NlvTUYnhMtH1nhYKjzDJ0VCIVJqihbeFt4qv3/sng6
         fwK9c1l9Cd77cn3RNnvrOL6shb/JywGcEnpUV3r7QT2/PXGQPaDW/PPWakkGNo6Tqg4P
         ZndFJo7bxzrOmoKdA0fi2SD7kowTmGNUgDNdzgYuSiWuhV0vLSbmBkVaCut4lldqxbB3
         ivaPKFCViTQ0SV0kXz8ZzSZRwK1I1Jj83cHMEdq7m5+yj8Nd380lSOyjSFc7MM23G4nZ
         8Hpt341jkPkuag13W3FsBLmA9ARAxRABHOJpI9Fj5j+0LjKVBDOLS+j2JWKENftooPwZ
         Uw3A==
X-Gm-Message-State: AFq9FYJzkSLCn+MzadN0p9CM3n8HZFOFPPZSvnQf3pXRjq8vzCATcais
	GLaCfKytfn9uotChjPSPPu3gNQ9p/VCzOMcSA1JbA8JuwKuBTcfru11V4t6w5Sjnt6g=
X-Gm-Gg: AYBFou0jZz435A5+l+/93D3oiqu6jrYPjM/euUDUvIY0ph+/E7R1RccuGnHc49pq9TU
	U6lUBFlucilRrDTW4BAXriJwu38wbwcNt2iqPv/2HmlnjRBFDrhjZvT74OksofaeRx/HlfAqRod
	kk0hyHmd/PUu09cvBGeYdqyxAzFt1UAtCiqvatIQU27n5Ew+RYLnIpWPkul48avUZjnwSLWOuC5
	DnMLS4PdyyOggtP+Uqv8cRlzPgIM/SKHCbW7gqIneQW8JzJEoeKwzcQcB6d48+ITd0EhX7WvShs
	PTD45sYPFitBZ3OCz3Xrk/qb67XqPXbwdVam/mCZ84xE9GpqucAwuJOYzDAc9bL8fd5e/LYEUNP
	QWTByrwGttzpS3jsB/R40t4bS0BCoysMxD/81OJvoa+JCOCF43+1uHhGHyAPcnstq30TDWs8eSc
	j9fR+RQljX+UvqrsLsdjRj5ZOwCFBNe/S9QZjgc6+85M4DnxJDI2RQsCDs7xkg6tpjm1zJ2C7oY
	nRu9bTcW3Xw/o9SNQWZcZmvKCn1DUJxz0ScoMLbalXpAqlubKKeodI6jVmTrTUU2UdGn6gDadeG
	Vz3q0BC9HGgHHe7Bqwix6xTpAc/KKOXYE/Wx
X-Received: by 2002:a05:6820:1629:b0:6b6:87cf:d1dc with SMTP id 006d021491bc7-70ba0dcd59cmr5722664eaf.24.1793119483372;
        Tue, 27 Oct 2026 09:44:43 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70bfa90c943sm7618088eaf.3.2026.10.27.09.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:44:42 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Daan De Meyer <daan@amutable.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261027-b4-io-uring-connect-eagain-v1-1-f4e3aaaa49ee@amutable.com>
References: <20261027-b4-io-uring-connect-eagain-v1-1-f4e3aaaa49ee@amutable.com>
Subject: Re: [PATCH] io_uring/net: don't retry a non-blocking connect()
 that fails with -EAGAIN
Message-Id: <179311948242.964136.2262085324990415486.b4-ty@b4>
Date: Tue, 27 Oct 2026 10:44:42 -0600
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


On Tue, 27 Oct 2026 16:09:37 +0100, Daan De Meyer wrote:
> IORING_OP_CONNECT on an O_NONBLOCK AF_UNIX stream socket retries a
> connect that fails with -EAGAIN because the listener's backlog is full.
> Polling the client socket doesn't help: an unconnected stream socket
> reports EPOLLOUT and EPOLLHUP right away, before the backlog drains. So
> io_uring retries the connect until the apoll retry limit is hit, then
> punts the request to io-wq. With a full backlog, io_connect() runs 128
> times in the submitting task and once more in a new io-wq worker. That
> worker stays in the task's thread group, so a later
> unshare(CLONE_NEWUSER) fails with -EINVAL.
> 
> [...]

Applied, thanks!

[1/1] io_uring/net: don't retry a non-blocking connect() that fails with -EAGAIN
      commit: 71537ed811107c514c0342e98902d489d6d2b7cd

Best regards,
-- 
Jens Axboe



