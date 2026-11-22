Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795308565;
	b=4XHoy1UFyr/VE5woCdrEnWTyzCIlUQRJXdrkoIFeNBSoGvFv9jnRblDnRLZ4z3b5QcHU
	 pBvJ5scUmEMg7aKbMFWNLCaM/uvF0ht2AKGxrjxj5zXENGzyRQQmtyJqYJvg32HX1hPcB
	 39m6SpAhQoqro4V+MNwuRsJUWgLB//B8h/HH/aTebS/HKW69R+1D1MXmApKYfCRFjH4El
	 UfCSkdzfCzjzXtskAYx96StXAt1JMr9a0URfUqZolYPYqMsWFEMMsblCa8zKxUK1Qa+gt
	 YxBR3MkWls4Eh1lgs64By6zlDGKjPQiNMyPpqHv44KeGW7qKAGA1fpcLXfv7eRIHYTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795308565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HB4GGGiTx/77gkcgbtZkvnLnAdHz3bFsq58nhMt/PIc=;
	b=hCFwuWADcUrGnnbjvid3k/ictDXgyEpZQPMZIymZe8bVRMJLWG4YP2/F5sEsEPijCg57
	 8PRDgrJpT0/O3PoMBuSXQPv9ABM/M2no4yMQ5Xi22AiMdJkTvRxaMgJT+EukJnEAVQYwR
	 cyF5TsffiI35Y8IAxTaMbE/XBEblRKu383Ad7QdHRtDPGdUDaK+SCTgtylZcm415wGfgU
	 BLCQvkiiAfwwXQxgmyp0tRZFyEPjkNa1ZWaNemZn1nDpyPIxQSH5OXbENIYdFOvLRYNJS
	 zOix3ny8c8Jk/n9WF1lJbj5cdVA/VbI3wnol3GNZIA7fGNKIBo1q/nfvCOv8f3LiLIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=a+0K0Nob;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9BA606A32C
	for <io-uring@vger.kernel.org>; Sun, 22 Nov 2026 00:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C9BA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=a+0K0Nob
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3282db206d3so6311036eec.0
        for <io-uring@vger.kernel.org>; Sat, 21 Nov 2026 16:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795308563; x=1795913363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HB4GGGiTx/77gkcgbtZkvnLnAdHz3bFsq58nhMt/PIc=;
        b=a+0K0NobGtz8B+Z6ohea3+PQBOuq9f9JzKTQBspnxU9MlUKd23RHrnQ/U63zDmpNXa
         310pYIZWMhbPXR3V9v3T3E9gb25EjGUCgo6dUZU6lcQpR2i2Qb00GqIqPVp/c1eY/iq9
         DVeEUVw2ftb1AYegSyT3Ty9tvWpglgfj4lj72H4b2e7qEZ8H2w3VVWUcpHX20DmyO/P2
         BpLeGSUMhO6tPClhvvY1wCdP6Q/s5Cz47oA7Qp6V91+qa7DpxuzS+Ig52i4Aou/ydtN1
         VzdYp8mXweVEJ0vBNovXjjjcjuxWXGZUeevBExCzYsvcoqBEQ8K8GDplaPpwxPICCWuM
         PTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795308563; x=1795913363;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HB4GGGiTx/77gkcgbtZkvnLnAdHz3bFsq58nhMt/PIc=;
        b=ho1JzqQLT3DrqnYKSgq+QowP4oRd0Ci8fvyb1xB36AJ7rjcOcW++ELY5cXFn93GLBz
         EPhpVA/X5MKa/alrPfe2SX+WZBRQrzTZfe/RkD65WHwMec83GfGRE6JJqTKQC5F1qJNt
         rg9BeXXlfuVq+ChtjPkhCVIIeWVADSnBOqdZG6/EMo+gxoq3vYSLAGkil99Qt1yW1+1J
         nTFg8I299w4WPh8wO4uGuhSnf9ByL07ipQXzt5ucXqcpjAVhq6pSVZ6jv8aLpYj8JmtV
         iBncIwez98vae7ukH6iEyJI9oJCYopHQEDvFwB7vHKPReLPvxg36pnJSA99cXa2DzRYY
         5gVA==
X-Forwarded-Encrypted: i=1; AL+hErE1UcfTjp3L1sK8EccAJCpU3Lip98g4Sg6GOFqJ7GU9i1/NsABMbVOT/hwG8+euKv4KVO5tnW53WA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/TTaiz9GpmD3+qMhMhzbHU0RYL1n/BBHOqDxJdodMKM6XJPa1a
	wdsMe7mvumC4qoV+9axvXOih9AQYF17lOFx6nKAQ8pvgrCq2w6g5/AVKhAzx+rCCfot7fuMs7wm
	dZlzFH5A=
X-Gm-Gg: AZFdTZd0Jn7ToLCbAXef7O8/9Ccdc2HWMFnJxQveEi5EH/ZlV06IznLKC/a3ccKXaHw
	K7TKUMYiI/fg2PtjkkILuiqUS2FI9M2ekd++TqBYbRvutXU61ArwNcFbh42zA2ttNOkneMgfakl
	Jnxkf4CExBv1g0tQX3OytzoSlnUbYaf9vCP5KK50FpOV0y5K13Fmv9nYC7xFTt9/uPoxnhrNcST
	BT5rwBLidBE645lBW1KK4t8sHeUGuwHtVTTs6+OeZwdNkVrNc0sM70mqfFwd3+327lxzQGiYpXT
	BGNkj9HaSuzNIBGfzizFQ6LsR0BIGJM7oBjaXt17RuS15FE7o7ov37XBwfnl7lDZCJGpxOG+iyt
	gfSqJNCtyK0+V7II84MewHooRhx/Rhun93K5TAbRaMTs769MjymkZ3XY35KlQdIeHEQ2qP9tbtm
	5MKonZXwyzhw1zw5qj2lOguCPC4W3JZ+wp7qFvyjpUxJXwmVCkWzJCItjCQNgUCIUalby6qrkcf
	LIyafKskIaNH+zrhp4rxOFALoaDTwLmCc0vu3+ML3CBtbWzWMb8IMvSov87BpAqjVotgoWGDenE
	feMmlwwkca9lyzGL1dFCXUZvuKmzmTnIUKlgat5yC0rykNPJWbvNHcwkhyDvCjW2UFvCmBS500x
	tPF21OJVFLDP8XK/GsvpGAW/9/Sq5YauBroVBFjifA7D4PRoh
X-Received: by 2002:a05:7022:ea54:b0:193:9aa3:474c with SMTP id a92af1059eb24-1b56d7cf637mr883791c88.21.1795308563262;
        Sat, 21 Nov 2026 16:49:23 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm17621494c88.12.2026.11.21.16.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 16:49:22 -0800 (PST)
Message-ID: <35aef1da-2277-4d9c-9bf4-cbc6094be4cb@kernel.dk>
Date: Sat, 21 Nov 2026 17:49:21 -0700
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
Subject: Re: [PATCH] dma-buf: fix leak of ctx and dmabuf reference in
 dma_buf_io_ctx_create() WARN path
To: Falconet3 <Falconet3@proton.me>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 "asml.silence@gmail.com" <asml.silence@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <htm5h9oaY-vk0g9JVYJmz5XCaKe_nPoWkUJYJqDulyNvv_sAWfzSMp0T6GWt5okc8R4SyvXXpJQ3VGhetKnjEa2KGem5uCYdxpmdzUFf6XA=@proton.me>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <htm5h9oaY-vk0g9JVYJmz5XCaKe_nPoWkUJYJqDulyNvv_sAWfzSMp0T6GWt5okc8R4SyvXXpJQ3VGhetKnjEa2KGem5uCYdxpmdzUFf6XA=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/21/26 5:05 PM, Falconet3 wrote:
> (leak of ctx + dmabuf ref on the WARN_ON_ONCE path, new file in v7.4-rc1, patch attached)

Please see how patches are usually sent - not a huge deal, attachments can
be applied, it's just a lot more inconvenient than a properly sent
patch as you can't comment on it in email. The bigger issue is your
From and Signed-off-by - that needs to be a real identify, not some
leet handle.

-- 
Jens Axboe

