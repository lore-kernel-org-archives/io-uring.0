Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626193;
	b=oFlWkpJvGOUM3PtJkIkeVCRsElDV2vEU9bQNZllMVtHLVp8KrA9GR8dW9786ECxKcWRa
	 ilfv6lgIvslnbwdRWGEJrfbrqXKNbRfHYt0N4Cjweyldxj/PhYv8K4ttCu9iYljqDWGnU
	 x/F6bw9iGiGfZ82P3FxGEIBXlrU1a0LlVPJmjcLnatK74lLXJKD0pZmbt70ziX7YYcqba
	 VhNGDrDKVdMgGsv4sF2LRktMN28cVRZkX82eQEX+fsz+tbTyKMvFkMz/Kq9E6cGITP/0p
	 OG6VGA0oePxOzGNztXoOzaYJL85+0F14dOLZlG/RIyXAUTQs3h6+yR6bftAfN+x33Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=syD5xMgCJX9R57cVNyg5faQC4LMstP0feWZqYieQ4Sw=;
	b=3+u35j2qrNqJSyxEpCJod64dvybsBj645henN9Xe8sOAxCH94URJBeYCgQFUr1oRDqeL
	 VIxgN3I4QA0Yo3WQiR7NqaxP5nX0NOTMPSA959HDTgdBoJxZLa+rFn6sTgFFuCtLy0IZD
	 MapgV4+3jvCsMVbDmt/J1sFEBuoVjbpRFfvhMf+cE83soR9ebog98w59OlPl26VZmsr8J
	 gzCk5npzRNcIeylqXGhr64NQ9BvNyfPX3oflLdukYk91NWv2jVA/EZTLMm1PClaXtcau9
	 y5Wm4CaHMyalJZBPwKvFuByRWNtR+4ysKAI+4ye7693m2/nNi1lm+m1LzKSA/38l9Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=DyXEYzpK;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FE3606A33D
	for <io-uring@vger.kernel.org>; Sat, 14 Nov 2026 03:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6FE3606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=DyXEYzpK
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b1c2c31a6fso121146a91.3
        for <io-uring@vger.kernel.org>; Fri, 13 Nov 2026 19:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794626188; x=1795230988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=syD5xMgCJX9R57cVNyg5faQC4LMstP0feWZqYieQ4Sw=;
        b=DyXEYzpKPqKRz5b2woll3HBvFoNtyTGCXekbuWf/DMNmadrLdgr+tdW6n09w+qbZip
         VfJsY9iT/1f/q/s0zILRVwOgqEJ3L8px+oDpCKjfPfnGT2UdfS71qXWT/jK7H9VouVgB
         0jr8nxe1yXsBz2+9hpShLiUXBCJefZogxgurAByIn/D+jBqAI/W1zU2hl9MjcWKcBSsS
         UOm1pMvILHI3Z5FrvjYz2VkyGZYk9OeNQqFIsE1QV4Yu2OLQnyHaULUTxnncXBvXOvA6
         YjVi/NZzIdbWbA1HcHtpelHya8uzxl5EEaO+LH82LIx/moKrjEcC3Jf5+vv4cMADBWpE
         nrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626188; x=1795230988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=syD5xMgCJX9R57cVNyg5faQC4LMstP0feWZqYieQ4Sw=;
        b=SBolhBQSN6TT1vr/pCtYtkJrkl+TCs+BR19aX571DxOmoV1kxxyCmcb+n2GduiQBwC
         ERnrhggwm7hn4fvhlekWAK/JKMRqScM5lwxK0Svhawyoce9J+YUA4kcYiBB9dkj6oaNK
         wZedQ29MD5+N3hPKbrEhP3uL5yjzboQdadr+LgfBK29i/tbXRFv3/MqLvOvp31VI33lQ
         kLCIR1+n9GTvVM2tkQVQYATTQMhT3aLvV8UH+edJRlRZTJubp5lvKvGzQ/oqhFms/AeP
         QA4z8iivtQf/Iq7fdJtiGSh+qZ9emrLGIJDW4mCmi/ODreJoSg4wKvYFwEeSARYF0R/x
         TapA==
X-Gm-Message-State: APuU4Z8fayNyOluOak/eTkW7bqRZ0hnqzwdxPplVRAgeymkIl2rHjQVV
	TRyhMUhCk1FbWGYfAEu3BxzlyUKmFsezt40dSgH5nWsyEjZbmPG+jqaAG1Q6C6xTr48TffEaDPX
	WsPq///+F+Jp68loeG4+/wt8D7W3tyJLTumr1ddEfj541GhrigbTz
X-Gm-Gg: AYBFou2+x+IFF/TubeuH5ZSZK9+ys231EgdnpCj50T1vx8eZnvsooLKCVuWA3MQXYU7
	ilucdk6Iajt0jsgN/8Xs6tpCKL4f86Okh2lyIGntFAJF2/kNg6x0HPa+K32iB9HolfrNLQv0CHp
	lfPwma5yZSXJEAFAC2OyniUV5io3qTAvsOd27dSOOmHIP/XBGDokUvBOCbi8ZThx0ke3PCjqvvf
	R9sFj82lY7pT+1EqyYILTR6VioEM6BsbxaZ8cBiSibtwWpC81UipyY1MORYQno1DCop7oCvT1vm
	REQR7X9F2r6ikTW5Iy2QHP+87UdzzfbgJS0a0ZaSqVORHrU+zOHmjCbZAFhnMqxO3dSwWv2hwEy
	GeArwDWjXD0s9zYjt
X-Received: by 2002:a17:90b:3d44:b0:3ac:9e5e:d1a5 with SMTP id 98e67ed59e1d1-3b1b0cb038dmr6416244a91.6.1794626187936;
        Fri, 13 Nov 2026 19:16:27 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b24385dcsm2420787a91.0.2026.11.13.19.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:16:27 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [IPv6:2620:125:9025:23::204])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 1E3AE40159;
	Fri, 13 Nov 2026 20:16:27 -0700 (MST)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 1372AE4049B; Fri, 13 Nov 2026 20:16:27 -0700 (MST)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 0/4] io_uring: avoid req->flags store-to-load forwarding failures
Date: Fri, 13 Nov 2026 20:16:17 -0700
Message-ID: <20261114031621.2924144-1-csander@purestorage.com>
X-Mailer: git-send-email 2.56.1
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

clang likes to set/clear req->flags bits using the narrowest possible or/and
instructions (e.g. an 8-bit or if all flag bits are in the same byte). This
causes store-to-load forwarding failures on subsequent wider req->flags loads.

For example, clang compiles the req->flags |= REQ_F_ASYNC_DATA in
io_uring_cmd_prep() -> io_uring_alloc_cached_async_data() on x86_64 into an
orb $0x40, 0x4a(%rdi) instruction, since REQ_F_ASYNC_DATA = 0x40 << 16 and
offsetof(struct io_kiocb, flags) = 0x48. The subsequent 64-bit req->flags load
for unlikely(req->flags & (IO_REQ_LINK_FLAGS | REQ_F_FORCE_ASYNC | REQ_F_FAIL))
in io_submit_sqe() is extremely hot because it can't be served from the store
buffer and must wait for the REQ_F_ASYNC_DATA set to hit the L1 cache. On a
thread issuing ublk and NVMe passthrough commands, that one req->flags load
consumes around 1% of all CPU cycles.

Introduce io_req_set_flags() and io_req_clear_flags() helpers to set req->flags
using volatile writes so clang won't emit a store to only part of the field.
The downside of volatile writes is that consecutive req->flags updates must
store to req->flags multiple times. Where possible, convert these updates to
pass multiple flags to io_req_set_flags(), io_req_clear_flags(), or an extra
helper io_req_switch_flags() which can do both. An extra store would still be
much cheaper than a store-to-load forwarding stall.

Alternatively, -mllvm -combiner-reduce-load-op-store-width=false could be used
to disable the clang "optimization". It seemed ugly to refer to such an internal
optimization pass, and I wasn't sure what other impacts this flag might have
(even if restricted to io_uring). But I'm happy to implement that approach if
it's preferred.

Caleb Sander Mateos (4):
  io_uring: return io_req_flags_t from io_slot_flags()
  io_uring: add multishot_flags constant in io_wq_submit_work()
  io_uring: add io_req_{set,clear,switch}_flags()
  io_uring: use io_req_{set,clear,switch}_flags()

 include/linux/io_uring.h | 35 +++++++++++++++++++++++++-----
 io_uring/advise.c        |  4 ++--
 io_uring/cancel.c        |  2 +-
 io_uring/dma-buf.h       |  4 ++--
 io_uring/filetable.h     |  2 +-
 io_uring/fs.c            | 25 +++++++++-------------
 io_uring/futex.c         |  4 ++--
 io_uring/io_uring.c      | 41 +++++++++++++++++------------------
 io_uring/io_uring.h      |  8 +++----
 io_uring/kbuf.c          | 31 +++++++++++++++------------
 io_uring/kbuf.h          |  4 ++--
 io_uring/msg_ring.c      |  4 ++--
 io_uring/net.c           | 46 ++++++++++++++++++++--------------------
 io_uring/nop.c           |  2 +-
 io_uring/openclose.c     |  6 +++---
 io_uring/poll.c          | 20 +++++++++--------
 io_uring/refs.h          |  4 ++--
 io_uring/rsrc.c          | 10 ++++-----
 io_uring/rw.c            | 28 ++++++++++++------------
 io_uring/splice.c        |  4 ++--
 io_uring/statx.c         |  3 +--
 io_uring/sync.c          |  6 +++---
 io_uring/timeout.c       |  8 +++----
 io_uring/truncate.c      |  2 +-
 io_uring/uring_cmd.c     |  8 +++----
 io_uring/xattr.c         |  8 +++----
 26 files changed, 170 insertions(+), 149 deletions(-)


base-commit: ddcc50dd41d331dc66e0e5793492c3fa09941ff9
-- 
2.56.1

