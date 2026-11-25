Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632294;
	b=nQfa9jOAW0YsD4xNucthCXMixX0tPRefTuynqv3G9rLQc30Qi9CyIlFtDnsHJB2kyRGo
	 RhgPtL4x8vXHQ2t2Eoh1o+ymAxf9OChtvD7Z6z0F+MbqcC/RZPs6C7AhJ2tvP+fot/iY8
	 sV8rTx+afbPtb1LxybGatUaFb9vNrJCZNg8iPXDqMBtKpGbLBL4VDBkpDYzIdtuoQC5OH
	 SMFWOG4cLlzU+CMZ6Ys+WqLu7ePjTzWKJlj2yZoZyD6AJG9ZRu0vZIcrpauCOC3GHDXT9
	 xWBSkNOOmzapHB4PIj34j8yt/uG5zGIG9TYFF7ZcDjh8FDd5VDbnXLPhI9OoSk9y2FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cJiNJikQwI27LN/lC2tpnr3/9F1IwtB57i1aFHq5oLY=;
	b=FGxMN5Qgq8NDGcQqp6j2ZEJEYwJm5/rjB8bbPkn8Myh7i/6lsicyT1+on0yJJQqqibkr
	 9AxfGDbQ1PvUd9zpSAYBVxFiecpUKvcERLU12ARWvXDzJGzx/mXcb1/YpYswQvkFUzSVY
	 krh2fD2Gh5RZiqWRa4coMm2LM12Msi/wxQd8i/xq/BXOChcPBSBXcV+H/XmmIW+DbGjc+
	 neva19UhtJFGsCWYnc321oft3ocS1uRj1zVlwKaSxB06rDCDdgOUCQVUZH0MRNBeNSyzL
	 JhUYil2dcDXsYDhl0H++xHjuIIyKYpJL9mzBUmmraU+YBZ3i8WvCKOupKXK+Sbx+DTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=YUsqPl6w;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D236606A333
	for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 18:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D236606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=YUsqPl6w
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-71ae5389c00so3804996eaf.2
        for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 10:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795632293; x=1796237093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJiNJikQwI27LN/lC2tpnr3/9F1IwtB57i1aFHq5oLY=;
        b=YUsqPl6w7CiWzb1rS6ysEQrx1P2We3bn7cz/UML1LpAcuVF6iPmE6B/lMBz9zYNguF
         dlPlIF8lbOg9+jkl+/2CSmnjJIBerSC79AKvyIMKugEpGGiYa98UVHWmZeDKlysFB2gz
         HpSCX1gL7Ab+u8x38OZMvXbP1PiXYxdxEpSdzw3yBKM+93ogNOVIuROjATcoXDtPZ/As
         EtFCv/sjO71jircM6qDBchuZMJ+i+zu9zzQ/sqwnv7N6kC3eAokAHkTCL8tgDBNxMLQe
         Z7dDvo2ARemg+h82Yb9bPzzBZhcnzEcbGrAJBWtcVSvdPfmfKolylpTTXzNUdJ6CdQdo
         S5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632293; x=1796237093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cJiNJikQwI27LN/lC2tpnr3/9F1IwtB57i1aFHq5oLY=;
        b=VA1+T1S4wrzr9NauAldu75Z9SOLIeS3xjDtHNzPkQ70saInM8zfNGExPeBpx1YHb0u
         JkzVF8qxEWv34yx6G9yvF7NRrcL2lqdjfoz9rxb3EZ4o7+7oomPm9WMvcdAIqMDmHmsD
         iqdwhiZM1Lh3XYaCIMseuFFCaSTUAx0fZOhslXyGsnRSEv1KMcsr7nwetGQZF9MgWbpz
         Fs7VCJutBBxzj156Ofo0tv4Q/vTGgtl8kx9rIwld0C7RQ6glWREhabwN0yUwrvYpZrPF
         jsCl+yhIShyO+0qlzae8CP4+BUljKXcSiOaxHJR7lHEyhp0Sx9WS6hEem7bVA+rnd/fz
         +dmg==
X-Gm-Message-State: APuU4Z/HVEntbEtGJkboeEZNU8oqf0KdOIDIfZCQFW7Z5874elMdo4z6
	3rPQhJVV60Bq+criQvL4F4JleHu6C+XKd00eLQYBug+dGGPSqgRPaI0G7wejkY/fOJhAHcAWwc6
	iRwpxYDE=
X-Gm-Gg: AZFdTZda55oC7mXTn4boznO2v648oZGpDDX9Xc5mcTIAsD/cdetgLWpIfL/T8UXn81p
	UMjAxgd11b23jwNnQrNgJQ8bIwu8yyGcR3OI98xwZX98ppdsf4rihst8hvYaV4QMqrkWDCtsNSd
	EukxXDHakaJcZXzcV0zF0jdNCi5/K8/YtUIRPb63A/vit2ANev3lsJ4OJ/I7OX8bIH0QTG3XRU9
	I6FuURlkgPxlC3+GWFRiBGbDDuT/+ZvEneHchRz8i0TbtcDB0Xz7nKxRZDZrj47Gq/VrjkChY+9
	RqB98hpEEyXDO8bvqS4D+Oh0zYCtJ5VKLHBcK5djgCk3q+6uQ68WVtMqIsa5oZGpfKelAsF4peP
	jbTgGfk5zfgGHPEDZxqe6wNy9z34mR9+ZTIxgE2XTFwONcj/KuHJV0sYk/PsbMy7WovwdTmS5pl
	efi2o1jYv81kEUWl4l3cjvCZe4ohC25xuUlC0AIzAohGEluWJ4J47YZRAkPpJNxt9i5h/+NZSM5
	apxADOJ9U7lE8ks1sN/+z+KfJBGXoIAdo+K2dDPZv/9gMqTlCZapnDYDt+glA3SKgrGF2C1R+1N
	m0AP6nCWK3mXULYj15Ueav0Nt/yiu9di1NuvHfZbPkBJ+bZNckizps3KZppRBShWdPNin734A30
	dVWAll0zyfUp65FlZACrd9BnGs7wxTZFx7g==
X-Received: by 2002:a05:6820:1342:b0:71b:3fec:3915 with SMTP id 006d021491bc7-71b3fec4aa6mr14163181eaf.64.1795632293149;
        Wed, 25 Nov 2026 10:44:53 -0800 (PST)
Received: from m5pro ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b37c52ae6sm12332828eaf.0.2026.11.25.10.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:44:52 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: Chris Mason <mason@kernel.org>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 08/10] io_uring/net: don't count the buffers of a send bundle
Date: Wed, 25 Nov 2026 11:43:17 -0700
Message-ID: <20261125184439.58077-9-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261125184439.58077-1-axboe@kernel.dk>
References: <20261125184439.58077-1-axboe@kernel.dk>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Mason <mason@kernel.org>

A bundle send on a packet socket with a TX ring can cause a
slab-out-of-bounds read, if the frames in the ring hold more bytes than
the iovecs of the send.

io_send_finish() hands the result of the send to io_bundle_nbufs(),
which walks the iovec array and subtracts each iov_len from the result.
The walk only stops at zero, so the iovecs have to cover the result. But
io_send() only tests if the result is below the count of the iter, and
tpacket_snd() ignores msg_iter and returns the length of the frames that
it took from the TX ring:

    iovecs                 = 2, of 1 byte each
    frames in the TX ring  = 1, of 64 bytes
    sock_sendmsg()         = 64
    64 - iov[0].iov_len    = 63
    63 - iov[1].iov_len    = 62
    62 - iov[2].iov_len      is out of bounds

The send side doesn't use the number of buffers: io_buffers_select()
commits them at selection, so at completion io_kbuf_commit() returns
before it reads the number.

The fix used here is to put the buffers of a send bundle without
counting them, so that nothing walks the iovecs with the result of the
send.

Fixes: a05d1f625c7a ("io_uring/net: support bundles for send")
Signed-off-by: Chris Mason <mason@kernel.org>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/net.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/io_uring/net.c b/io_uring/net.c
index f8d547c5e7d6..9c69f37cb8aa 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -515,12 +515,10 @@ static inline bool io_send_finish(struct io_kiocb *req,
 	bool bundle_finished = sel->val <= 0;
 	unsigned int cflags;
 
-	if (!(sr->flags & IORING_RECVSEND_BUNDLE)) {
-		cflags = io_put_kbuf(req, sel->val, sel->buf_list);
+	/* Committed at selection time, so a bundle needs no buffer count */
+	cflags = io_put_kbuf(req, sel->val, sel->buf_list);
+	if (!(sr->flags & IORING_RECVSEND_BUNDLE))
 		goto finish;
-	}
-
-	cflags = io_put_kbufs(req, sel->val, sel->buf_list, io_bundle_nbufs(kmsg, sel->val));
 
 	/*
 	 * Don't start new bundles if the buffer list is empty, or if the
-- 
2.55.0

