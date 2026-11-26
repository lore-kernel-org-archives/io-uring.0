Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699736;
	b=MgXZMGG+A+vX/+DcpufOkRqN79t0qPXyK8RZ4cQxk6T+fwbImafmCWDvgd/FHyLiVz3y
	 0hZJMfRMPT1EaQShTncJdP0SlQaO7+By8v/5d6ubtnhRUY0JJac+ApIoXk4vrG0BoMnmm
	 Z2fOa0Vj62Fi/5Hkbh9L4TC8qpUq1p6Wi8cGbkgETq2WTgQnRCZ3U2z1RkwpFeIH1AkeC
	 h5ZwMx0zX6bd+aWJJiZARmDes8/POYXhowbSOT9+XhLSuREzLf28FzT9HZ0CFusQcxO50
	 gG8SOsYt400H97RC9MRF25M5udpcCJBl2F7Bun2kzRJnT5d8Zpt9jjDTeL6Zds0q0pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=khDlV/uVb7yVp3Pf5oNr3rLfI0ItUKfUVqPraLCpERk=;
	b=BhCtxb+ux4xgv9jwTmN66ongrKvIQNWI+3cpzYJc9nK7a26mtq0qu36zT1Pv+oNOdP62
	 1+gc0XsV9hnnJPrJquRVNnuZnVpUKEP/Npco+bUl+i5HQNprWYNObGdC58Ccs863ffUEZ
	 EG3z1V0mxywDv+s8IFjDF6InCy9onG6HCruSBM75CMsN1VHMejDsjUXEHmUwVi+0doetV
	 Q/mETvmF13Le316gnHLawUA6nK+6Rd9eMYHVUX+jKwgyDx+9N1ssPjIFyw3ZOssxHdR1/
	 ukRCvjRgdJyMgO6tBqSquxoUQtRfwG/og9dFSErVdEjSi+0iOnZdPKB/QNGTfT+ECuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SH44WdX9;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7CA606A31C
	for <io-uring@vger.kernel.org>; Thu, 26 Nov 2026 13:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D7CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SH44WdX9
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso50971635e9.2
        for <io-uring@vger.kernel.org>; Thu, 26 Nov 2026 05:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795699734; x=1796304534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=khDlV/uVb7yVp3Pf5oNr3rLfI0ItUKfUVqPraLCpERk=;
        b=SH44WdX92ksXSRH+ab8E2oa08/03RYfoeEv268K13eXX+hq+PjRe96ouXLuBO9hKcE
         TNhcFXICNFW02wGh2k8woc6/qES2xRJ9qAtYUbuuvs3p+vjj3mASqGHYjUqSCJcWZSo1
         A15BMGgb5HDo4nSHEmAEWSnSaFWfx6pQPlPlps6uer5KdJvJjYuWGJnthqjnVBgaXr8W
         WgabKNnixiSPU4wbFskSChCt8R674GfUL1nZzxGi3DreppPRB53Eq/thl5xhzM4HVUBD
         jOhB41iytFgIj8yM0jFnbkK9JGdqrWex8dwdf+KJeNE23DDPxJSn/gAlk2ghkoiqR0bq
         8kIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699734; x=1796304534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khDlV/uVb7yVp3Pf5oNr3rLfI0ItUKfUVqPraLCpERk=;
        b=sCP+w4/gnUmfD76SzEl+Q0JmeUn5ptKMoy3tcfFOhbNY89+H/kn7fw4mg1yknS13n1
         xjmOIoHbcLKnXQCcgSMheo201tfEwZ6tSP+PEHZKJw2tLblHuXg8MF5JUco4Oz2UDHAN
         SCcMWVmTyXgeIO6qqbuIXeYnKNBcHmSCs6toSlMJ1o0G4E87rNXysZ9jhbc6x3TPZDpM
         amU8feYoh1Mr52T7bXjNPe3Z1IPoZIkTnUGOSXd3x9CuTblGLGpPBNgFWIinpFYo5v0I
         g/9zIDdRBfV2yKoFfi8knJKfQ1lABPFJVtDxDhi08hoc5YKLfaGcuwNAc/WXUNXZWIb6
         WWpQ==
X-Gm-Message-State: APuU4Z9Pn7SsSnfOo4mfuv5YaBV1D/CKKTD2ssJKTjewIM/YwHveX31V
	7m3wkABVCF6ebfHgJjTsAkUzwdt63qCs3j/XBtSPFJfIVTCs0OqHhHTv
X-Gm-Gg: AZFdTZfbwykSmi6kN4oP0jAxcQUDLIMwY5Sm9JvkrWhcWo55rS8g6dfFAaKZqcLcy9e
	auNrsc7ieoZtYrBFqa3VLxv6QN+8VrjXtFZ91PiByWkTRVORL3kQyi/KKWnRyQBsws6MCfrSTxa
	JQW7dxPSIsoJSR1DlLfPUxYra+Lu0F5KESH8ZJwjiWrXpaI6lHKXhG6IV8O5JOf9xLlikd2+3c+
	1y5ylASac+xViFmMuh6bf5radLnzPxdH9g9nVxTlk3PeDJphSiale6gVSiCFvjNBSqEiMPt1eGg
	ZDyMfUw+K1dB8qY1OuihN403Dy9gjIoeKcwP42bPDj8TwDDANbsjTBKC/Kwvitx+0P+5B7q1nQw
	ZX8M3Lzi/lZlDD9nT1jqphGFS38XMTX1j809g7pIbjPRLoBimvWBexcuHocvDP2r2i4spUuwnW2
	bRGXjLn6MKBrJAQoAE7T80URLSaRTeH1alvC1liRpThw7ZEXvWs87zRpolTzzA4egvyi70n/R6o
	FrlpDUhJ05lIkIfyf4Ef2Ya++xJc9pGxSz6rFqVWTr0lfYKN6fW3SrZkv5Lj7we2pKIsX0xPmsn
	yQlTES41VMz7jRa4LY0xyr/VFM/SQZY+qruGQ1Q7j6E+wGknVdRTI/xmd5uTILDGT+mzjdZHZxb
	2FsUN2SHeYy+kGHtrt/LgC4ddn0ITYwxPc6kS2cVwQo//kB3rbaoNeAU28cs=
X-Received: by 2002:a05:600c:530e:b0:4ba:eb:eb9b with SMTP id 5b1f17b1804b1-4bb8880aba2mr414364835e9.8.1795699733503;
        Thu, 26 Nov 2026 05:28:53 -0800 (PST)
Received: from [10.54.182.141] (82-132-213-247.dab.02.net. [82.132.213.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm37152734f8f.23.2026.11.26.05.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:28:52 -0800 (PST)
Message-ID: <11a00d5a-18cc-484c-9861-37fc116f6dbf@gmail.com>
Date: Thu, 26 Nov 2026 13:28:47 +0000
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
Subject: Re: [PATCH] io_uring/bpf-ops: validate loop_step before registration
To: Sechang Lim <rhkrqnwk98@gmail.com>, axboe@kernel.dk
Cc: io-uring@vger.kernel.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261119115942.3613868-1-rhkrqnwk98@gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261119115942.3613868-1-rhkrqnwk98@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 11:59, Sechang Lim wrote:
> A struct_ops map with only ring_fd set leaves loop_step NULL. The
> struct_ops update path skips a zero program fd, and bpf_ring_ops does
> not validate the completed value. Without BPF_F_LINK, the update then
> calls bpf_io_reg(), where io_install_bpf() triggers a kernel warning
> before returning -EINVAL. With BPF_F_LINK, the warning occurs when the
> link is created.
> 
> Validate loop_step before either registration path. Reject an incomplete
> value with -EINVAL so malformed userspace input cannot trigger the
> warning.

Looks good, thanks for the patch.

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

-- 
Pavel Begunkov

