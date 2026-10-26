Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793038401;
	b=sWAFCF/Qgy6dmEeyrbqiS3GOtSQiG5+SvDReum74yiuObZPUwkHJ44hVEcb5roAmBVEN
	 XWVTkv5kNaMSbzwsa9Z1Mw7scmQdKcx8d0l53s1bb4L3by28mbD5451+ifpAnL4v6L5St
	 EKCNb0WWFjW9AvsUuVpXUHyMG6GaZ/uIsMJ269sJvCcI5O8dWBKRRNUVPw6HX6bqQB5lW
	 VDqNn0gbVzxo5O9kn0gAxLZQHQeoSG6wHgiAFXOTu+SKBETuAxLwWqSm3ppKZFRjic/gA
	 QFe/1J2GsWigvQRF5XsAqGyCQ9vaLM3Sl/bt8AbLQalYa00+SoESU8LJfvZ6CEjUIjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=NRpSTdUSggLdqJwk7rdsX0iw/e9J7EvfELyhW+hE4Qw=;
	b=ycAEQMBBOlMlP/64pKMoxqqw9xqpgJrok9neIDHIRkXN/VIsDFnSHEG5iyQpB8qDPIac
	 cxtpPNe9t4Q+42p7hlSryaR5osu2KuzA3+YlGw3FGe3HQ77a5TRXr0nA+EuKC2VpdqnHu
	 pv2/H3tinHd/syO8DPdhP44nNuabqgRobqmqaPkG8owW8+J23GvY0wTArlXcD623af/Qd
	 QGm6cQ2BYqe7p+d4uFTl/TBUV2lOv5aKrRarWr/9yxwjQMG8QfyELfO+bCZ2mz/IwBmtb
	 6XFCpwWPfJ0czE8ub4Schz3yArEWQYjk0/so9aIKIy/k6YTNT0HV3wWIyqPs0CtIc5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b="s/pkG7an";
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6033060A2600
	for <io-uring@vger.kernel.org>; Mon, 26 Oct 2026 18:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6033060A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=s/pkG7an
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-185fd3a4ca3so2716139c88.0
        for <io-uring@vger.kernel.org>; Mon, 26 Oct 2026 11:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1793038400; x=1793643200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRpSTdUSggLdqJwk7rdsX0iw/e9J7EvfELyhW+hE4Qw=;
        b=s/pkG7anTRz/Qi9FOAGlomFuzy1DLwu4bfADV/a+BZudH4OJJqnP/ugytxyvH+KVBS
         /1JrixyVMYHvhQstiFy/s8zZS7/y7rPyOvTPubGAo3bg02JVhJK0OoEU3XukTmQ22hul
         6MOjWZZOqQnhc4qsb5Wz5QfQf3W3aBxHVLpuLIwoYnn8SyyJ1IJDeQKaGM48fpHyl362
         rWOXVgEdsmFZUyviF59F6WLwHmL0YcB/FNi8sXygP7ucn39qIamas+uNBPxB3NdPMf34
         u+EUEfB6kroTkyft6YzJKjRIMumaOmo/ojC0VbQRp7pWj8YYaNNZ8MM7CxJmWTa0gIyz
         FRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793038400; x=1793643200;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NRpSTdUSggLdqJwk7rdsX0iw/e9J7EvfELyhW+hE4Qw=;
        b=FPA5HFrj81fcP2MAqC3miwKsRsO6bjgLxMrunlT+CGvbmnCNyirka+dHCmfZ6sxUbW
         uHiEbLM76BPXN1AHH5M+l7jdJxFIwfEyZLqeUQl6T3EgBxjYvTjFW2miBsRzBn0asVaF
         sgGYVIltXErlcdToYPiMy2LU+Ziw3USOZpzAuaSetHTsAhEalpK1feAx3vXk7FNqzAOt
         Lg77LGFbz1N1YfhFeS5Xfor8rcXor1eOJuHLx5bq36jrBLVkO1nS32cuIEhN3YCkoimH
         qH52FzPtIJXeo9mz29qqcx2EjphfIDOWMVXshXY+CnAiyZpFp4zTJ9aWAAD5qE9NzxGm
         ocoA==
X-Gm-Message-State: AFq9FYITeWi/H2KAZuu2BATtgvG78dqjU6CVdOJk2zI+cYqz4G0OTGzo
	6zlnqxB1WEyGzlXiSwkCeGOMqcZBuOwnbfQ74suwgl8re8X3eliLRvvMCy0UQZqzWjX5Qpa7T+N
	stX0vcfo=
X-Gm-Gg: AYBFou26GCOzo+Li1eo48l5nDUZGvlWNMmi1eZPzhKaAW4kXxkQ6iFL5Wb8/7MTKLXW
	nb+ArzLWc88uMVBqKAtwf0Z7LBBvCl/C2S0+vPH+2PIr3tQrtHmAM0kr7six1dxv889W7kfOszM
	VwHGZ7NEixuQbpB2lph6GijbhEydIz/Ax9rrSwVXi9ybIm90YXfvC6BP+Cz9NacrQOvOtOqysNu
	P6dfOK0oybBu1LN+1TX3C+Zou06DDrb02x0SkqHg62WmBOMQDjDmtUtN6s6Q12Eeule5p1I1bnI
	dy2NsEcStlPZhVvkvnyYxBMWkMyp4sStfyh70hVBXms+BKSKiMp79IiE9IqdOlswA03/iXA8R4J
	oCBdqY0kCOMBCZilmBJtuAlTzeTqqw2vrfFtDgaAu8AAneSzjDvtMzOlxOX9HnKXlYugKuVTrQc
	Zt+9T2VvWP2Zdoi7bz/ndSJIkzvFY4GSH6LggV9QzamM0j5scaqK5aJonVOm1FGB/F0B81IEnTT
	LNrhSTaKntA5wLXVkXM2meON+EUWf+F3bzk1U6t+v/Y9GFE9V7Df4DL6DE8pOd0DzazMeOcOMJF
	Ia1CRYTMIojVcuOuKkeoSAw4p8fimkA6xpIgBtk=
X-Received: by 2002:a05:7022:45:b0:162:e05:e43f with SMTP id a92af1059eb24-19935ce1322mr13359097c88.23.1793038400270;
        Mon, 26 Oct 2026 11:13:20 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm23576455c88.8.2026.10.26.11.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:13:19 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Dominik Maier <dmnk@google.com>
Cc: io-uring@vger.kernel.org, dmnk+artist@google.com
In-Reply-To: <20261022232120.2537530-1-dmnk@google.com>
References: <20261022232120.2537530-1-dmnk@google.com>
Subject: Re: [PATCH] io_uring/net: mask socket type with SOCK_TYPE_MASK in
 io_socket_bpf_populate()
Message-Id: <179303839963.792754.4413854913656045602.b4-ty@b4>
Date: Mon, 26 Oct 2026 12:13:19 -0600
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


On Fri, 23 Oct 2026 01:21:20 +0200, Dominik Maier wrote:
> When an IORING_OP_SOCKET request is prepared in io_socket_prep(),
> sock->type retains creation flags such as SOCK_CLOEXEC and SOCK_NONBLOCK
> until __sys_socket_file() masks them off with SOCK_TYPE_MASK during
> execution.
> 
> However, io_socket_bpf_populate() copies sock->type into
> bctx->socket.type without masking off ~SOCK_TYPE_MASK. As a result, a
> cBPF filter inspecting bctx->socket.type against socket types such as
> SOCK_DGRAM or SOCK_STREAM can be bypassed by ORing SOCK_CLOEXEC or
> SOCK_NONBLOCK into the socket type.
> 
> [...]

Applied, thanks!

[1/1] io_uring/net: mask socket type with SOCK_TYPE_MASK in io_socket_bpf_populate()
      commit: e66907c3ba229399ecfb4ef032b95a4a071c894e

Best regards,
-- 
Jens Axboe



