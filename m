Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134723;
	b=dI/YLIxSj5pOw/d/92UWBO54KLwXqVudGvi11JNih7oxNGAXoQdeDc5Wrw35OmNGjwDY
	 PFMGmKl0y8HXXmrc6TG9SYgBlntvVeIR20jeuCePDyylmnCZ1+s6bYSjFUTbQT5BlbIo0
	 nMIiOLfCdyfoc38N7dVF2/U+YDAZJRhXsyVE97iZArDDgbLhXf1MKBJsWeJn0+Zqixhhq
	 LZxzDK34/6fXDAWnDrMBVgFl4y4yS8xTNltOdQfIrMCi6oilh6nGSkYJVneSG/v60dvdF
	 ohAfUcv5CxkINyPv2XxQS+/lvKnzri6/zEAvFQAa0jSCpT19QhvVo7eteQwEiZizfeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=mZzEzgMMxjB3j+vPh5g8u5NJjrN6f+VQAyZJOgWj1P0=;
	b=XDA3T0KtLfpVeNoblQfdBUIUR8cmNY7dOPUHM9bxiofA6f4cPQsNUQTXrfEzp976Nqk4
	 x9dwzaM2oCBLtY5YgmZ+ygMeIWozU38YTFctjQdIogVuN0RUUwArCYsxxjuJOi1nJ52v8
	 9g3aDJ0jx4HDr0HA4/c+uM79RPC+ZXVy5IGPFjLEJSJmAgTbD+Q1xgIQ9bmqHyRmLu/De
	 Foa0JaIztFVb+lZi1mb4Xo95kZpwHEwNLfSkFG6uJry77X07gLBK2v+Ms9pRhBXuOzcq6
	 M7YT+JiwFxHfSvk7+hgdR1uSWnR4D4Bk5F+BqWiosSVv2+AA1xXCjrarTEx8JWy76xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J1PZDsZF;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A086960A260A
	for <io-uring@vger.kernel.org>; Fri, 20 Nov 2026 00:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A086960A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J1PZDsZF
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so77022eec.0
        for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 16:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134721; x=1795739521; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mZzEzgMMxjB3j+vPh5g8u5NJjrN6f+VQAyZJOgWj1P0=;
        b=J1PZDsZFoBAXVvY8eLaT3O9ZAxsKHQPQZXVEpTBdAF/zGKg2Yz5aa3BWEF/jSek5Jr
         J3xF+pqrXvgbWIMVnaqbVbdUxElYIsIH+tJYALqOqxLkcMUhSCHsuRMD8HAPIpLKaoYW
         4/MwUy0c8p/OzEv0bDCBWuDkOBx5o8PscdEBB3qLQ9RfgDU4vXPYpDE3t3zsK1SPpRcY
         h9L2yZt8MhkdGQma/ctNPuJVV106bV/lmPIQ9JVrHl1BQmR922qMxGprNIA4pqnbz2tJ
         lO1WmLpm7cDaZf57/6aCtonm6Pp9+O8XE++K/6rWIJn8VnlbuY4xrM4W2d5mStYHtMRq
         u3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134721; x=1795739521;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mZzEzgMMxjB3j+vPh5g8u5NJjrN6f+VQAyZJOgWj1P0=;
        b=GUJ/V3qng37r2TlTC8VV+JdncmWkyOYHPU87gYEPw34WueLIIRw/Ok1aq8RolJCpFa
         KpsD+9E6Nj0XtUpGzmdxmzvRQgYIwMhFzRKu+teFZNdXcEAy+RbaFyybAH6o1AK4kuP2
         QEjpKAmgR4Ev77ft5EkIJX90FDAfsb9RMICUCMiyN3UhTy5vbyWjWP6cZs3QNhQ1IQy+
         DFU/eQebdEefxI2R165bh6d0O3w2z+YoxOJ8x9EmrPwwhGOtWjDaZedxbl7PdizY6OEm
         zFxJP92W1sFW20yb1CQMdLz89GqKU8dWpaRhJCWNZ0lqw7En0fB2HRbKjeFp4T5PZJvL
         MMKw==
X-Forwarded-Encrypted: i=1; AL+hErFKgljSL9eoGKvfd5Y1Cvj3GI+ZHb8Sl6UpQCuYtygoTMO7SXCZ5rSp/9Q1vF/CTQv6DtLxMwt42g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+sqVnlCLAhOxJ3i9klB79GSjfGz/wV0IedUqoSg1Y6GSeJD0ID
	Gj4LeqEiT3CDRgjYnGSCvgF3hSQ3kp7hRT77QaTIo7Wn1Si3xO3R7I9B
X-Gm-Gg: AYBFou0EVatPGPMgegQCGwpS6KrQObE1hebAMx9BCOEtXTbkcTCfg4PVnncJq53rOGa
	MyIF1fW01OnBtXkLKnzbkHTPmG0CA5g2E8eVDqZaK+Fh1TN7/1qrk96WEq0l8dWRt8JMLsaxVH9
	M3nSZSU76f0sktE19pFJf8rtN8wee1J/bfxd7grAi0ty7WSiV9B8rjmJkc7qe3MKDgfMwynTcmk
	4EJ0lgjcvHsqyQX0KQvtArOKFJHNpyKteOSvgrK0klYWQEtzEWa9V7IXiVR9zfX4rfwtItku8Py
	9ptc3SzACAM3N/6vIYnXfyzq5PcG/Z7g03DFl9nbJM9+aMXFf7xcInfVriwG3lIfC0VGuhKl7sT
	j2xx0+jt63FpC/SoVsONPxwpvpk1sJtqxExD2Rd9HAwBDaQn37gN8Nw0n4ZYH2+pAw5xKau6tHd
	mPG8uw1MXIBrQBmnsnxpTzxC1PitLHHDUAU3yXAp/qMY6rDGcMp1fvUckMCRbRoEBUreyRAsIvF
	XZpfpZHprEZiqqU0JVxY33/y0/GyEfP7jq2iM9iEv9ZvR1srwZ/Fc1s2c5ydBrnYuy1BoxKM7Mn
	7J490HntUFEQ/OPfI7XULeQhEvL5M/JRRb3tYocq9onVnA==
X-Received: by 2002:a05:7022:7f01:b0:1b5:1a6c:af64 with SMTP id a92af1059eb24-1b5568c0fa1mr1258049c88.17.1795134721419;
        Thu, 19 Nov 2026 16:32:01 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:63::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm2282420c88.1.2026.11.19.16.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:32:01 -0800 (PST)
Date: Thu, 19 Nov 2026 16:24:58 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Alexander Duyck <alexanderduyck@fb.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Pavel Begunkov <asml.silence@gmail.com>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, Simon Horman <horms@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, kernel-team@meta.com, 
	John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, io-uring@vger.kernel.org, Mina Almasry <almasrymina@google.com>
Subject: Re: [PATCH net-next 3/7] net: Admit native XDP on provider queues
Message-ID: <av-TQztlq185q6VW@devvm16445.scu0.facebook.com>
References: <20261117164700.2157816-1-bjorn@kernel.org>
 <20261117164700.2157816-4-bjorn@kernel.org>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261117164700.2157816-4-bjorn@kernel.org>

On 11/17, Björn Töpel wrote:
> XDP and memory providers are currently rejected on the same device.
> Header-split RX keeps headers in normal memory, so a program can
> filter packets without reading the provider payload.
> 
> Keep this restriction unless the driver declares xdp_unreadable
> support. Admit native XDP in either attach order on these drivers.
> Existing header-split checks require frags-aware programs.
> 
> The driver must mark provider fragments and reject XDP_TX while those
> fragments remain. The core rejects helper access and frame redirects.
> 
> Keep generic and hardware-offloaded XDP rejected. Generic XDP builds
> an xdp_buff from an skb without carrying the unreadable flag. Its
> transmit and redirect paths also bypass the native driver guard.
> 
> Signed-off-by: Björn Töpel <bjorn@kernel.org>
> ---
>  Documentation/networking/netmem.rst |  8 ++++++++
>  include/net/netdev_queues.h         |  6 ++++++
>  include/net/xdp.h                   |  5 ++---
>  net/core/dev.c                      | 28 ++++++++++++++++++++++++++--
>  net/core/dev.h                      |  1 +
>  net/core/netdev_rx_queue.c          |  2 +-
>  6 files changed, 44 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/networking/netmem.rst b/Documentation/networking/netmem.rst
> index 6871dcdd700c..1ac94fc9d667 100644
> --- a/Documentation/networking/netmem.rst
> +++ b/Documentation/networking/netmem.rst
> @@ -131,6 +131,14 @@ Driver RX Requirements
>     circulation times, such as when userspace holds a reference in zerocopy
>     scenarios.
>  
> +8. XDP programs run next to unreadable memory providers only if the driver
> +   sets netdev_queue_mgmt_ops.xdp_unreadable, and only in native mode. The
> +   programs see the headers in the linear part, and helpers that reach
> +   unreadable fragments fail. Attach payload fragments with
> +   xdp_buff_add_frag(), which marks unreadable ones, and drop XDP_TX of a
> +   buffer for which xdp_buff_is_frag_unreadable() is true: the payload is
> +   mapped for receive only. Redirects of such a buffer fail in the core.
> +
>  Driver TX Requirements
>  ======================
>  
> diff --git a/include/net/netdev_queues.h b/include/net/netdev_queues.h
> index c5335e935b7d..4f6702b284b4 100644
> --- a/include/net/netdev_queues.h
> +++ b/include/net/netdev_queues.h
> @@ -199,6 +199,11 @@ enum {
>   *
>   * @supported_params:	Bitmask of supported parameters, see QCFG_*.
>   *
> + * @xdp_unreadable:	Native XDP programs may run on queues with unreadable
> + *			memory providers. The driver builds XDP buffers with
> + *			xdp_buff_add_frag(), and drops XDP_TX of a buffer for
> + *			which xdp_buff_is_frag_unreadable() is true.
> + *
>   * Note that @ndo_queue_mem_alloc and @ndo_queue_mem_free may be called while
>   * the interface is closed. @ndo_queue_start and @ndo_queue_stop will only
>   * be called for an interface which is open.
> @@ -229,6 +234,7 @@ struct netdev_queue_mgmt_ops {
>  				    struct netlink_ext_ack *extack);
>  
>  	unsigned int supported_params;
> +	bool xdp_unreadable;

Any reason this is not a new QCFG_ in supported_params ?
