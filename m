Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9F4313550
	for <io-uring@vger.kernel.org>; Sat, 11 Jul 2026 10:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783766943; cv=none; b=njEO4mngR0+2xCftLHaYLecJ2POgNKq/J5eMQ4F0H5CaJRSlGD5tDdxjxFdM9TnxZMgXL8XogTfaa2c11ws7557mKppDE0zg44hRZ3rs+JKklqSnSdMh/75Zvk7Pql/bMGS7ATOOJh4y1+4a7Cxe7xB0z5v8pb1t9/wL5UEKjHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783766943; c=relaxed/simple;
	bh=4QcSpgEoF0nWn5Y9kPAa7ADc4/e/LpiGpOgPc2Snb3o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cmwMOqL9jIs1tZXT3G3NOrD4//BnuKPVpGgOHAUyb5TOAO05BWw1W6klbLYFCSDOzRKukyuPqUrtv309+T3BDQdEBWqEM6Q9+bVPL0OgRn0+UxA7OK0pVx2aPbPMlQDv2L5fWimxaRDyDOcbgQbaM9h23ErtF1xhImEnnmNSvEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpqyhHz+; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpqyhHz+"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15bf399d3bso211754966b.2
        for <io-uring@vger.kernel.org>; Sat, 11 Jul 2026 03:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783766939; x=1784371739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=au7GYuxpuvO8X+mfStKR1O+GhXnwrR6hrIqMke5JJ3A=;
        b=fpqyhHz+5fwFFDiAJcoEAe2aSJy5DExqZiF4yZYLqGjX30yiJO3JuYREi0QNuhRcfV
         4I8u2KYD+1+6NFJUkM2a44W3qrWEr2GFZXtd3Xpv5rS6PGIq80kK9ur/xEUl1aNt6eAc
         MPH1FlBadhNwR7tvshSNx88BLAtR3KKlITVHdIIDFvulfQWgUqJoZGDoaXgDMAIwWv2A
         Wmc6JtBt0tXEob5KIx2278z/TLiArxocpZg4KLqMB2CQGrobo7IRJLcsJV7ZujDLIEON
         4qCmDFbDbvcDneedrp/H3twbx+G81p7xcZ9MwFX9O8qALAi17VNM1qxPQEc1D1j4usJP
         cdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783766939; x=1784371739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=au7GYuxpuvO8X+mfStKR1O+GhXnwrR6hrIqMke5JJ3A=;
        b=L8z3xEbUa59Ocni8FQbeDQGBeSzGuMtfE93haCd0urr+qSG+vqQAzZSH5ZpowuT89U
         nj5BTAArsOKyWE3eaH84bYOoxOPkvdFObSIiWgzIniqhq3RPrHiFVMfyaT72p/jM54XE
         AVejx2T0AaWozFgXxrjsbr60vqbOpkr4i0PagN4y7ZAQFIS8QiDmucurES/Zdw3Rhdvl
         Ps5Aphfl+th10GvIc3sNIy+XKTR26kD0jBRA/FzoQxvV0ndWG4QPWFC1J716dGBoz9lC
         OrAAc5Myrfj8EvLkgA18scpsd6F8zuJTcnPQJNEP7IXqrqp0wqBPCjs/+g1OpYRbp/G1
         yUxQ==
X-Forwarded-Encrypted: i=1; AHgh+RqXLQvmUULg+Pbx91fxOCXj34rt8JTt6kt9jVcVPWJqItKeRw/BPc8c/kcDZaSNoGuMmb2JXfcBOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoXCZqjr93K8dj4dLfkJ18ejQxBLvDJUtrVzZPUaNLbFwnS04Y
	MpzoVhgSUrtL9/PGQ3Isk6aMT+MqOx4EieZITNiagmTOQqr5VfA8ITXf
X-Gm-Gg: AfdE7cmiqyM7KjCTWhNWp431R0f/P8Qwi5A1c9zZSB9KOTBfjqtAbqjeQ9SpYV8/EtD
	YMMaguuYTcRObRUNEgEtC7Ln+LdtaLVJiHUZv5KMJoV9ppfpyNjU9fyhpt+BReEg9/cb+9ufTYf
	GV0BW0WQuvK6ELD1rq+5faHJPk0l8GmoXoZ7wNkyI7TFiuodVA5Tga9++k3BN03HZxMdTtykN+H
	T52TUqKRyVoiv+teO8DCAibSPZDdFGKVRRQW/XAistaXDbaCWeyihVUYUtuaxWLMSzdO/G8atqC
	YTgxYMx0WlqyebdZv8X+82mEc69ErPWiLMqCIEP57fD4NLCmG9GiXrClDf+mVs06qseOi+a8Jdw
	UCVAI1cTnt64VBIfbEY5Bbdg6Ez2HxbRf+StvhGr5ocfaX1SPPgtBTh3LLVOYovDOrAnVADDg9I
	mUj3xxf5ui/mWKRwXiRzbzlMsBmzXHDY0jxEF+HtQoYBeN5T2OeqyFgip+l3zzJkSxPElGh99PM
	0R6EfoG4beC3MVxe/Oa7ZYuIHlZ6OZto7vfJGBGv2jeowYPeA==
X-Received: by 2002:a17:907:cf87:b0:c15:c638:d03c with SMTP id a640c23a62f3a-c161e9fbce2mr86442466b.47.1783766939215;
        Sat, 11 Jul 2026 03:48:59 -0700 (PDT)
Received: from 127.0.0.1localhost (82-132-222-132.dab.02.net. [82.132.222.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15beb53b86sm609123166b.25.2026.07.11.03.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 03:48:58 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	io-uring@vger.kernel.org,
	asml.silence@gmail.com
Subject: [RFC 00/10] io_uring: prototype for device memory tx
Date: Sat, 11 Jul 2026 11:48:29 +0100
Message-ID: <cover.1783614400.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

People were asking about io_uring tx with device memory, this is a quick
and dirty enablement for io_uring's IORING_OP_SEND[MSG]_ZC. It's more of
a testing prototype than to show the design as I'm not happy with uapi
and how it relies on zcrx, and will be redoing it.

It's piggy backed on top of a zcrx instance and relies on it managing
the rx queue and talking to the device. It also uses memory and mappings
from zcrx area. Since there is no proper iter type to pass  netmems,
io_uring gives an ubuf/iovec iterator and relies on a new sg_from_iter
to setup skbs in the right way. Just as devmem TCP, it implmements
{get,put}_netmem by referencing, and verifies in
validate_xmit_unreadable_skb() that skbs go to the right device.

Pavel Begunkov (10):
  net: pass ubuf to custom sg_from_iter callbacks
  net: reject zcrx skbs to not registered devices
  io_uring/zcrx: switch to pcpu refcounting
  io_uring/zcrx: prepare areas to be exported for tx
  io_uring/rsrc: introduce buf registration structure
  io_uring/rsrc: extend buffer update
  io_uring/rsrc: add uncloneable regbuf flag
  io_uring/rsrc: add regbuf import flags
  io_uring/rsrc: add zcrx backed registered buffers
  io_uring/net: implement device memory send

 include/linux/io_uring/net.h  |  10 ++
 include/linux/socket.h        |   2 +-
 include/net/netmem.h          |   1 +
 include/uapi/linux/io_uring.h |  28 ++++-
 io_uring/net.c                |  37 ++++--
 io_uring/notif.h              |   5 +-
 io_uring/rsrc.c               | 204 +++++++++++++++++++++++++++-------
 io_uring/rsrc.h               |  32 +++++-
 io_uring/zcrx.c               | 104 +++++++++++++++--
 io_uring/zcrx.h               |  14 ++-
 net/core/datagram.c           |   2 +-
 net/core/dev.c                |  10 +-
 net/core/skbuff.c             |   3 +
 13 files changed, 381 insertions(+), 71 deletions(-)

-- 
2.54.0

