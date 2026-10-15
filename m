Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028343BBFD0
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092676; cv=none; b=op2JsK4leNAzFjjC6ExgFDHwYkaweztB59Ly4wFknOYbuvDkPzmBemal0ZhKyI/9rzt9ljCEXkg84tFgLTXIlJNNO4MxOdQrhc/OBE1hcy36+RX1wKLN7RnBEEinpgarzh0Yh9fajvf60ZsonrDYgiP7JuUqcNDXVFjWSKqYaUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092676; c=relaxed/simple;
	bh=TcsuTD0KQTpCjozWYZc5rP4RtLBPFnOIizDxQgIPs/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gyT9SKARs2I0VuIRQnBnKpGTtrh08JuLDw4VpaQfB5RP2Y5BiDr7RUPB8AD/d8/KuiDNqwTtd1c/oocHHkhnX9E7HixteySHnKIwgwZvP5x2iUlMhakRivlXF2AAorgd28NWcJvOxXzrRO6658UQUA7qOXPG0eIcuGWqv8uf8ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=AzGP1LgP; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="AzGP1LgP"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91986c5cb75so20858336d6.0
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092674; x=1792697474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwxWu33iX1wLQ32Ia7VuFm25AkkXVEVYstx0ZL0nHAU=;
        b=AzGP1LgP5sah1slgfGkC4ZLAOFOtT9qRS+ZHdPfdYsU3bSuz2JRf+7BvmdPlHuc9CF
         hWtMPvwoujxwnaKfSJHsMtZ1qwaQqKf957vat1OPnZoCvCxPJpbwHpbbOyGWfee2SF2P
         nXRo9aGtM153Y4LYbmmipxtClyGuakh/8KlpWVvfRsEIaAnPtNgrVRyFqoZlyNJdvXB1
         XU+9GBJ4DHTMoJVnUuS7InJKz3t/pHmXoMnuD30s6cdfdsBA8ZVQtyOMA8cQ46VBF1y0
         n1SrWRq8bbqfDns7JKp43stRKpkhiueeQhcTzmLY0P6+l09ulvrADCH1hSaZr24UoBwx
         fz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092674; x=1792697474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nwxWu33iX1wLQ32Ia7VuFm25AkkXVEVYstx0ZL0nHAU=;
        b=owO84kIWtXUQ1vZ3d7yHFgYr9RVQSQ3mhp9fmSc2NR1bNz/SUxDQDTKEOW8azg6Eqz
         LXTqxTdBcQXStj1L1hZbyzXxYFQo2tFUcdUcrHTRqClClzMP5YW50pRxWoc4Oab2hy+c
         t+M8wGJCfgFkmleToP7Hl+LY0ID0YMbOnpsdHHtN5o3PuYU3hQrGr0KdbPXqjYbDwCux
         4QqoFB69svvDZJp36Dxuqe/NwDLdFbWaCUGZqSbz/fr1JbbG8bVIpr0bC6qp68cm7SdA
         Oq0WMpfki8ShAC7Km+NeQVHtV5bO27faYhK0Vyl4vCeDpIy9dO1qyjuEaG9B0GM4Uwm0
         8uKg==
X-Gm-Message-State: AFq9FYIA7AVf7R7r7EDhXmZdD6RThRGhzqReeSYY8nHO8459lAMOYp7/
	+n/Gx7cFXt2afcwLND38bEpYKJEUx2suNSbC33J0jQ44VjamN4k6ttyp+ClC9ge3VOOX6I4V919
	ClqyO
X-Gm-Gg: AYBFou1rQh5ypgul+AwBpqPPxbVu71hT+/I2NJFtOPaj2yvqvvTimJd8fbRtNkBKvYO
	RgyFeBV/rB7IRdPL3rD2SOT23Tm/FR3AIVCon4mS/vezZOF9kKH34upRkK+xZ4EBPLmWP104fiJ
	Kcy1SJUI97JCqzGK+e/igxoKZ1jrX65GXZSghQ+Knyu5ywBbds7SMu+254TOq1xfbtn6adic66k
	32yMOmLlT0dL7xrBcYI3LYk4lQk/n4bI61Q3bUazfociS4rXOWUJ4YR9qPIzJmRs7F1bx+bvWBw
	PwEYE9NR0W53TluEQqJYO5q5F5bZKqS0M6Xm2frS+AGXhMl8J+sBg/oM7QWLzTYzQ9GQEk9qfGl
	PVDLXSl/xmes+VCpARwOngIOxw1ukVGW+6oLTh1D8aSmHc7N4CFcyWcMPe8XHKVLiGl+ju0gpYT
	VpM9C4/TaOBLsO7xUxMJ14tHEIcFm+uOzJRwzB3riH8bcsfjgM9C5OxxS0P3pL2xcTmfcqFv46B
	y9CRyJ9vEwTZQY=
X-Received: by 2002:a05:6214:449a:b0:917:9507:79a3 with SMTP id 6a1803df08f44-91b554f2e66mr353033416d6.10.1792092673696;
        Thu, 15 Oct 2026 12:31:13 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.246])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbaae54fsm3493166d6.19.2026.10.15.12.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:31:13 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:26 +0000
Subject: [PATCH 02/43] io_uring/cmd: don't leave list poison in ->hash_node
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-2-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092657; l=1807;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=TcsuTD0KQTpCjozWYZc5rP4RtLBPFnOIizDxQgIPs/4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QL7ZfF6tiZO+L25Ae6YXJKb8lMVXfFgX5zvaNF5FBylu6Xxtljz6AUD5wcc/hGm4UyWOQX49e6z
 323e43mi4GgQ=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

io_uring_cmd_del_cancelable() uses hlist_del() to take a command off
->cancelable_uring_cmd, which leaves LIST_POISON1/2 behind in
->hash_node. Requests are recycled through the request cache without
being reinitialised, and not every user of ->hash_node sets it up before
it is used:

If a vectored futex wait is woken while futex_wait_multiple_setup() is
still queueing the futexes, io_futexv_wait() doesn't add the request to
->futex_list, and leaves the completion to the task_work queued by the
wake up. io_futexv_complete() ends in __io_futex_complete(), whose
hlist_del_init() is fine for a request that is unhashed, which is how all
other users of the node leave it. If the request was a cancelable
uring_cmd in its previous life, e.g. a ublk FETCH_REQ, it writes through
LIST_POISON2:

  Oops: general protection fault, probably for non-canonical address
  KASAN: maybe wild-memory-access in range [0xdead000000000120-...]
  RIP: 0010:io_futexv_complete+0x219/0x420
  Call Trace:
   tctx_task_work_run+0x804/0x950
   tctx_task_work+0x71/0xa0
   task_work_run+0x118/0x200

Leave the node unhashed.

Fixes: 93b8cc60c37b ("io_uring: cancelable uring_cmd")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/uring_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
index 73b606899833..b5486b56ee0c 100644
--- a/io_uring/uring_cmd.c
+++ b/io_uring/uring_cmd.c
@@ -87,7 +87,7 @@ static void io_uring_cmd_del_cancelable(struct io_uring_cmd *cmd,
 
 	cmd->flags &= ~IORING_URING_CMD_CANCELABLE;
 	io_ring_submit_lock(ctx, issue_flags);
-	hlist_del(&req->hash_node);
+	hlist_del_init(&req->hash_node);
 	io_ring_submit_unlock(ctx, issue_flags);
 }
 

-- 
2.55.0

