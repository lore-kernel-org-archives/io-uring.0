Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883764;
	b=bm9Ah2rQGfWhFhwrrc2HOdJemPZDXrj0EkX6DXL9E0wQjQFEA6WqUFmRbWAG3u65T34G
	 VufKyfVMvp/V0wmXih8tt74PeO4krkqClHHiVJud2z9nlbQo2HPq9EqOsjL6X9IQo7yMt
	 k82Ev57+4P9mr0hlDK+Vg0xGPZPBelZ7b7VsKRIIgZpNazbOzazb+nKVfiseR0wPhNmJs
	 OGTaJ2hzJkGemYGLaj2ig/vZ3LQ6XzVGAjUGwNCXJw8JHL8H7b5nx/iCjLSvpMbfQ5yF/
	 qiJWEC0enONCyUgHQ3OFUtDLnitTzEOpU4ZYXqJFH8rEUqr7wHvxZEAkbQt5PUhACrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883764;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=gUJ/mTAIlGtpLVkM7Z4srYRjyZABwmfl8+lgRfY7VNQ=;
	b=xqQhJFs/OoVcJzbUhoUFll01CTvyZ7Q8PU50fg9O78Zi67N0Q5DAN+o0wtklxlSzGCjd
	 k9fV/XBN0u+pP0WHRSRQsShpsofXp2TVcgWErMndcU4pynna1+6I3NzmnZ9Ubh6iX5SKY
	 3bXks38NEiMM2QsS9acwcRgG+X4RozS61ynX/XKF2dXfiIRSEGUKh4qh1dm67jzcUJj/l
	 6XblKX/36CSRFkmII3xY5CI1RbqTzgnOh2PMqEkXrOTfw4Ru/eMVaXv1anYeD714e2FdC
	 gsxVlHWu6XcjylXwySpCFihJHWzWiizF716/LWWg5KgooZeSq6Ihy8k5Mfv/xVuPDNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hjaLq9Vr;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8844E606A33E
	for <io-uring@vger.kernel.org>; Tue, 17 Nov 2026 02:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8844E606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hjaLq9Vr
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2037025eec.0
        for <io-uring@vger.kernel.org>; Mon, 16 Nov 2026 18:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794883764; x=1795488564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUJ/mTAIlGtpLVkM7Z4srYRjyZABwmfl8+lgRfY7VNQ=;
        b=hjaLq9VraRkmZ3WvbkBpbzvfl0aUS6cyn5IGTECbEcV5FGLXjTH2bbiPrB/i4nFdwI
         9FJqg3WBywSqI0Qv3t0Lxk1L6zqArH+bH4alapmiKhdwVUGjRXPhfQy3brAfnNx02HAY
         Q36iSD26wpjGgk4+1TduAmiu21VChpK2ysq6NoxhP2lPaElRZwD89TYFXU4kfF9Y5Fyv
         NxfvLaLtcLORHwY7GGEm8dG5H0EbItGELMfEK8RoUlaPoNR7P4pzUChOEWtrZGCWpq2y
         FzWcT45l6ZNOgVJOMnpnaPBi9Bef4eVViOjzX5g4yH48wMP6W0uz8rVzDpTokvuS8xr4
         Eagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883764; x=1795488564;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gUJ/mTAIlGtpLVkM7Z4srYRjyZABwmfl8+lgRfY7VNQ=;
        b=pMyThbK/hg9cfGtSzElGJo5XOhpp6yuS8S/k/75nQWuFvRP8Di4LkTqIGgKAoAC317
         ePU8PmieXy3GMgn8MICbUyJH/f3djWfLnrHfY7VKvx9KdvX5Cmng83eth2dBBBHmjWzB
         ZYITcm4j6A4wkEj6q37WFzLAHnH0cjaqkmdUeeaUpH8CI+/7puNMRUYYR2wDLDm+jqNu
         XXho61C/qaoQXr98B0gb7+9TBZSONH0OYtUixZpcWdPImvxAYVs9ARmnjkM6kZNlLdBF
         sW08O4MRzj1pBtP/C835j/GmDe6v97TqArZtK3uLCT6iGeEzXaovL9WgaAIC43N+iL6W
         ESyw==
X-Gm-Message-State: APuU4Z8SWzlXONZJ0QlNhbB1citS7wJF1mERpQCLaRQGO57yRAn+CkiB
	3ryEWhqNEoHPa/SvHxysLLBqSc7+auCVgeSTNv/QxFUmMdxPmYJXUyHaf5TC8FN9pZY=
X-Gm-Gg: AYBFou1ff3d3gfS10z9KBC4OrELnLCp6/JqYT9rbKLJLo3PmFJ49CxAT4WF11KVp26z
	NWHNKzb2SCuyAJCXpFG8fcf8LdQ0jVC6Uwa3+YGZp3Cq5CNwJKystIEy+oHdSARFOFmMbQkx6Ee
	RaUGZfCcMKkSOfgPKQko6vPBPvxXIPKWSMw+yHyV68eCdXYjTTzUXB7xMef+3K4y3wa4/YL4NaU
	vEdPeAPXV8Ib/PDvbrVuBR1z517D33R2902MVvbQgRgC8BG1l287O8Brnr+DJrIRc+vg8HWs2tC
	blGN+F6Rhf2zE38zk+3g2FopkW46g5dNew0PUABXHdEzVof6JAroRHDkiYXI7vRr2BG79JDjUP6
	teqz/j2rZwk+owXg/iggN4m8gue+3hyFb7+NzuIpHPTUnlJsD6/zXWMfdlr+g5YNs/92pe1zC2r
	EkyyI1ALyq8dDsxSnBsrFpv1LJ+He3V/hJYddEXaAuwTMzLaTCp1+OEidpYGLQXII5boGONRl7b
	1Lee1MAYyayJrpHob+oD9kiYrXJ/hC0g7BII/TG8LVDX5jjhacBVM3nLRxaWpaW5DvJPUTvxLhe
	aqF7BasaeYgpH7JqitS3Qgg4I8x4DvT5l2bMe8wg/hjrdx86aRtzkgeG5rCZawo2KoqPM3gkPNF
	4nz2zZnLZTqiP
X-Received: by 2002:a05:701b:4248:10b0:1b3:b455:93db with SMTP id a92af1059eb24-1b503131b06mr13141980c88.24.1794883763733;
        Mon, 16 Nov 2026 18:49:23 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b2b5sm31493244c88.1.2026.11.16.18.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:49:23 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rachel Menge <rlmenge@gmail.com>, Hardik Garg <hargar@linux.microsoft.com>
In-Reply-To: <20261116193146.65315-1-sidchintamaneni@gmail.com>
References: <20261116193146.65315-1-sidchintamaneni@gmail.com>
Subject: Re: [PATCH v1 1/1] io_uring/kbuf: initialize arg->out_len from
 arg->max_len in io_buffers_select()
Message-Id: <179488376281.22588.16183512803050273616.b4-ty@b4>
Date: Mon, 16 Nov 2026 19:49:22 -0700
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


On Mon, 16 Nov 2026 19:31:46 +0000, Siddharth Chintamaneni wrote:
> io_buffers_select() passes &arg->out_len to io_provided_buffers_select()
> on the legacy provided-buffer path. Because callers initialize
> arg->max_len (from sqe->len) while leaving arg->out_len as 0,
> io_provided_buffers_select() sees *len == 0 and always selects the full
> buffer size buf->len, ignoring the user-specified sqe->len limit.
> 
> Initialize arg->out_len = arg->max_len before calling
> io_provided_buffers_select().
> 
> [...]

Applied, thanks!

[1/1] io_uring/kbuf: initialize arg->out_len from arg->max_len in io_buffers_select()
      (no commit info)

Best regards,
-- 
Jens Axboe



