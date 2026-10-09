Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78542AF1D
	for <io-uring@vger.kernel.org>; Fri,  9 Oct 2026 14:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556429; cv=none; b=AI1RoQ6ltRfjvRT0WeKGsLYjfI92eDf+JJzREbrDEpdsMpZGXdYNASVz333w5zQHLXiZHyUho60Mofm+VJqKURZJUnb1xuFFAFW8AIiWjTCuGVkUJlm6IIGyLirKSSJOr/28STMI8mO3uZg24cat7geWlwvhYUNqRSAXympD8yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556429; c=relaxed/simple;
	bh=EJiXm8Dsks2gupnzl0q0HhcnmSRuHBlBWdlylLjcnp0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YPNKOy0ywExG0q+jdQjWG/jt5/CEb3FNgwbmv6xZ8bAsz7wHDsm82IRxxmfb46uAZcu044e9g6sBePtBr4uI6rsusIHyXEUFSWFpRvWGt21B9XEnyyW57UvsPXlp79mksdUR7f17eVGlN2Rvp8gv9JP8hVPlUboQfdBd7SADheE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=zX1mcR7h; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="zX1mcR7h"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30b6dad2382so9604246eec.0
        for <io-uring@vger.kernel.org>; Fri, 09 Oct 2026 07:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791556427; x=1792161227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BmVCNkG8K6lMWvkOR5yLGM5dHZ5EXwHVBaE9Y4/+eeg=;
        b=zX1mcR7hUXZtG+wnRdwWiw5ltq8CJ/FzijDIZ394BtSI6fL6cZpC2xiF+biZZiWObr
         2eH6lIp3lZH7fpP87uDt/xhxFFwwvM9E1NDZfShEFpJamHOhoQnl8tEYEthr+zs15y8a
         C0+3ynZ67KnyIcswG06/lEbVXJw0HQKpr1rYHiI0SV1AK/eelAleYTWCHD1Bw68WkDC4
         6/wh1XPudM7NlGcWQM/8uKVTY1TA79LknR22QIEI/FU7K0ikYieNttKDHjNoUX3fVHY7
         9xkGJ48kc0ONBTW5rKnaqUgy6zCH949mQKV/VnBUUikWGFId6UQgdW32Pen509jmOXBa
         s/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556427; x=1792161227;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BmVCNkG8K6lMWvkOR5yLGM5dHZ5EXwHVBaE9Y4/+eeg=;
        b=QwgsMpx7YzF2XYi/HLMKC7xnEkVOUENvNLGsaDrNyMIXh01DYJUTRBRiFBf35G877o
         r9rPtQaxQwLm5cAi4BRl1aKY62U7Z6bqfgR1C8oCesthBoxP4nZ3oiwSrVyWYmUzV0eL
         YSKkWXkq1zwB36agl/wQOU5/iGI4Tfv+UIbwzbxHOF8EaZ+IYaAmaVrWx/L5Ct0to1os
         pxS4+Z1jKUD2qf9X6GDQOLVyb3GW5XxOq7ve1dlHZ0D+otiwfMVvwZXoco62ztnF9wuo
         aM4P7/NevwA/rKHcStmvWG9Lnw7RnU+tfSbe1CQnTI1Ke4YDr9RgORPdYLh748yWKUKY
         /NEw==
X-Gm-Message-State: AFuF++l9iEk/53xZmeDEUfE3KHl9h0XEGCoIV9U2OFQDxnFEqkKhhNXS
	qi5pm5FYvL4S+oXISp5FWz8xZc/8sJIRleBOxS9wsoqnBCuEayJVGL6VYJL4QhL+szQ=
X-Gm-Gg: AYBFou1WtD63IFVHYasiOc3t1lFtrJJEEpIljuo/XbgjsFRMlB1U5c6PMQk4LVDw2sJ
	bHG5Yv7tV1G8JvdhGxM7fSFDvQ+q0GItQ8C65DdKv7Rea1urN2q/6NKmOISlZ14H/ejgKUptuxy
	OeMVqVlFOa1Hk1MnMKbSyQA+8MfdfSq8bxNylYPF+IeE/HPRXpJGInoWEj166vQn4vlCxA9B4UL
	sUwwonUAwDvuJ/7VWhn2+FPDFkBH48gUmUaHAUMtqaOu9wIcz3F6sxFeoakYKJjtcjmryHJ03WN
	UYGkqbHyHLYpgYNK6X8WwWB47rXm2tHBhiMakltAH0k6NDz78h/u+j6Ijb62E/xPRE9Zf9Q94Wa
	lN4BSBmJx1KjohtOBAq5fWs7YkSHaw1Kjdp70lRQq2JO3WY7FYUCju4rsJpoSHMu8Gpzbe0hfK6
	hWLbGBtab7gSF1En0sLIdggUiqEJQZwZCjur3/XI9YU3nFIeYtp0S4fg+crYUVGbuI+aS4FgQ+F
	wbqAU7kS4JahL5lc3v8No1iBM/RifdUpqgH/XH2LqnjWSxmHlDqvoJXOwhAlfeNzSgfWW4uhv4=
X-Received: by 2002:a05:7301:1929:b0:355:81bc:567f with SMTP id 5a478bee46e88-35581bc5872mr1019837eec.25.1791556425727;
        Fri, 09 Oct 2026 07:33:45 -0700 (PDT)
Received: from xps16.local ([155.98.132.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1e05esm8003444eec.25.2026.10.09.07.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 07:33:42 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, 
 Natasha Klaus <natalie.klaus@runtimeverification.com>
Cc: stable@vger.kernel.org
In-Reply-To: <20261009133807.730724-1-natalie.klaus@runtimeverification.com>
References: <20261009133807.730724-1-natalie.klaus@runtimeverification.com>
Subject: Re: [PATCH] io_uring/net: populate CONNECT filter fields for
 24-byte sockaddr_in6
Message-Id: <179155642237.219229.1342920568325633046.b4-ty@b4>
Date: Fri, 09 Oct 2026 08:33:42 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Fri, 09 Oct 2026 16:38:07 +0300, Natasha Klaus wrote:
> io_connect_bpf_populate() fills connect.port and connect.v6_addr for
> AF_INET6 only when addr_len >= sizeof(struct sockaddr_in6), i.e. 28
> bytes.
> 
> The IPv6 connect paths accept SIN6_LEN_RFC2133 (24 bytes), which
> already holds sin6_port and sin6_addr. io_connect() passes addr_len to
> the socket layer unchanged.
> 
> [...]

Applied, thanks!

[1/1] io_uring/net: populate CONNECT filter fields for 24-byte sockaddr_in6
      commit: aa5d5f8e502318e783545ba5d04bb40130b83e20

Best regards,
-- 
Jens Axboe



