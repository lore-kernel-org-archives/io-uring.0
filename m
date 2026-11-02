Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661509;
	b=T/W/wDW7veTfifgn4WdH/5GX7FjQJoC2w+IFPcl4kqSIZ7b7v27KT0l5f6c2KjlGQrB0
	 8daw4Mr8o+AwjtLJd76Obx93KnUDFLPTOsDyUayE/P7gZE2sO8nouJ848smk6K0jFCWf9
	 P5KfG9o1pHhBFsEQSPWgrauIvcvWQ7UCzW6PG8P9NlrF988Ad46qTPa5aYZVZ1xNJlX0s
	 2hhesgFFrFlD6yXS3LqfndjnD0hZymvfeI59tADmMgz1NchrRN2pWzOlDNvsJoqdNiFdZ
	 RuDSg9gokKCQFu76P5qMLh6bwbTN+eVyp9BWLWMhjsPPfioAGjVSFj1dvRRJxua+ODg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=LFVGfhguVIcON2Iuwy9nGTiu+m3FyzEBTJ2yKEsx2aE=;
	b=Ro9G8zH50AXMLSgrZHT/NfZCKROYWSZa6QNcK49v2pjGDclTE4Wzm0ZKpIxS1JbzKSRn
	 1mJZw0kyIaRIMhu+/2Ah2Md0hG9CSzUdPEfsSS8DU3kqdv/mtGDfzQWuIIY6c76CPrxKE
	 We3Lj0+uEbaWqoTKPVT4j+D4Im4vwiHVDLYp9VdAqEkdJOGwDbak5knRdZxt6qXCkHBRb
	 pNjRRKwe3cdp7HNdkZTeE/+tKWBwVZ0dc0D27NrKFohFa0onAp2fduoDkUiwzz98S56+t
	 MwxrNWjw9ZfLbwBo2AvOcW1ZV4XMFN866Vs+cu+TXVYvtiB/gh/vpnqX35aWAK9ZwuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DXKmJT3l;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3EB606A326
	for <io-uring@vger.kernel.org>; Mon,  2 Nov 2026 23:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F3EB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DXKmJT3l
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c3c370b17so6035826eec.0
        for <io-uring@vger.kernel.org>; Mon, 02 Nov 2026 15:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793661508; x=1794266308; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LFVGfhguVIcON2Iuwy9nGTiu+m3FyzEBTJ2yKEsx2aE=;
        b=DXKmJT3lCkMlwCskfFOjbDWelDzwwlLNmhIHmHwNsNRnJ0svZpkUW69UETFPWwY3lK
         VbjijYoIQ+s6KQ6vinBnRUseiXI8/sJS7Hxg16aspX82rL5MyMeTo9Z/QadHkhURUSH8
         dVaVizVG2yFsiHv1WgpDG93FWlvstODhE4+v736QFowJi+hlqkDYQ1pb5NXg6wPrAhOM
         /96ioVQgdMiT71YgQdw1R//aButs+8NhfzTiVBxk/ZNVxFsfS9weKCD8YKIaWtcg9X6i
         NRhZLsHrF2KP6WtMwRMnsPQ02d3hwOMWLhMGg7FbnvcXRCUNSAS1Q16lULwwO7tx+fJ8
         uTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661508; x=1794266308;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LFVGfhguVIcON2Iuwy9nGTiu+m3FyzEBTJ2yKEsx2aE=;
        b=BFBllsxOEJdkM9tuN6CJJxRVzRNro616xfT4BzcmJij5gioH+jnAhGzgp0Otm8hW0H
         t9lt/+M5karXvQIIbECfE1bJdXv3NbFLmMC8ziOamC3QRjnhjBrUiL5aKtgEJEp9GamB
         /qCyW/aMT+XMP8rC/cKRVLBvVhu1Nmop1AHVpqWZq2UaSj5zzuju9h8TeeNYo+3MkSsm
         Xqs1XaVbHI038foQ7EYSSUQRq8G+avr1g3wMkr/tHdTu1YKGOAWOc1GIHF4K/IowrVXi
         MSxfMUP5g1qW+iiU6oSziREjiHqSL1WfxFIWgkCyx0pyJLmcffdJRDNlT+mEtH+bV3sT
         Objw==
X-Forwarded-Encrypted: i=1; AKwUvBwUFdPD+Ty55k7/MeB9Gl7sxApPwZ9AA+ZTiaN5CfwdxWOLaGdhReQndae/NhIkZHzw+IC04Q/KNg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/JXNot+PU0Ni8opYWp0oZmTbLrEfBOSzD4Tq5F3wP+Osr5G89+
	9aQ0LytlrdWdVQwzsThXha1WzDsF96t3YJn0h8ssSxygHsZx3+ugHOif2Q0h+JEN7dGRYqepc71
	/mcOGJLC/qmwloDal93bp5W7sjQ==
X-Received: from dylq31.prod.google.com ([2002:a05:7300:599f:b0:369:dee2:2b2b])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:1886:b0:35e:6eae:c01a with SMTP id 5a478bee46e88-36a4237d9d5mr17726681eec.19.1793661507989;
 Mon, 02 Nov 2026 15:18:27 -0800 (PST)
Date: Mon,  2 Nov 2026 23:18:23 +0000
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102231827.4088254-1-almasrymina@google.com>
Subject: [PATCH net-next v2 0/4] net: prevent mixing incompatible memory
 providers in skbs
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, Willem de Bruijn <willemb@google.com>, Eric Dumazet <edumazet@kernel.org>, 
	Mina Almasry <almasrymina@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>, io-uring@vger.kernel.org, 
	Stanislav Fomichev <sdf@fomichev.me>, Paolo Abeni <pabeni@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Enforce that all fragments in a nonlinear skb come from compatible
memory providers (and for devmem, the exact same binding).

Patch 1 fixes skb->unreadable propagation in skb_split() and skb_shift().
Patch 2 stores mp_priv directly inside struct net_iov.
Patch 3 adds skb_has_net_iovs(), skb_mem_provider_compat(), and
skb_frags_can_coalesce().
Patch 4 enforces provider/binding compatibility across TX, TCP, GRO,
IP defrag, skb_shift(), and skb_try_coalesce().

v1 -> v2:
- Generalize the check across TX, TCP collapse, GRO, IP defrag,
  skb_shift(), and skb_try_coalesce() by storing mp_priv directly in
  struct net_iov and introducing skb_frags_can_coalesce().
- Fix skb->unreadable propagation in skb_split() and skb_shift().
- Add KUnit coverage for cross-provider and cross-binding rejection.
- v1: https://lore.kernel.org/netdev/20261008034027.1403188-1-almasrymina@google.com/


Mina Almasry (4):
  net: fix skb->unreadable propagation in skb_split() and skb_shift()
  netmem: store memory provider private pointer directly in struct
    net_iov
  net: add skb_frags_can_coalesce() helper
  net: prevent mixing frags from different memory providers or bindings

 include/linux/skbuff.h   | 58 ++++++++++++++++++++++++++++++++++++++++
 include/net/netmem.h     | 15 +++++++++--
 include/net/tcp.h        |  5 ++--
 io_uring/zcrx.c          |  2 +-
 net/core/datagram.c      |  4 +--
 net/core/dev.c           | 14 +++-------
 net/core/devmem.c        |  3 ++-
 net/core/devmem.h        | 25 +++++++++++++++--
 net/core/gro.c           | 16 +++++------
 net/core/net_test.c      | 34 +++++++++++++++++------
 net/core/skbuff.c        | 34 ++++++++++++-----------
 net/ipv4/inet_fragment.c |  3 +++
 net/ipv4/tcp.c           |  2 +-
 net/ipv4/tcp_output.c    |  3 +++
 14 files changed, 163 insertions(+), 55 deletions(-)


base-commit: 4dd16e31135ea8437a720222df34e8745f385d6d
-- 
2.56.0.385.gac671c819a-goog

