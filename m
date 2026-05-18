Received: from mail-01.1984.is (mail-01.1984.is [185.112.145.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4DD1FECBA;
	Mon, 18 May 2026 01:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.112.145.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779066804; cv=none; b=RDLLwJyiEVFxBjU5QGO3R56sI22E0DGuxR5SLi10XFbOUeMEIV1+efJfEjaUKR5FXnh8oUqDHBQj9TOsA7fyNmjh64oY3c08LavJfttrRRJB96NKb06p5eiDIyzGwkYl2bBLnp4cpSIcWYnoEVjTyziSfwDZhR/cE+T1U7wn5LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779066804; c=relaxed/simple;
	bh=Jbb2A4UvthdQqPHd29RRijYSYdpI2biE9JJ37ZSto+Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Message-ID:Date; b=TOXCyKvdC/RJWWKM6tSKFJmbssyE9GRM15C24kb4iRuQV8xX/NPwwe313XrLdAwug8xs/ulyNEWbmM/Y+sBVdvoFTxouae0EJ3ezx7jb18/rbm3SFU0I21Avnh9DgcqT5OZYGDGEDAWiIiE1Ag9ScIPsECzuE/YdDs2rUovma8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=berkoc.com; spf=pass smtp.mailfrom=berkoc.com; dkim=pass (2048-bit key) header.d=berkoc.com header.i=@berkoc.com header.b=hK2ztIfC; dkim=temperror (0-bit key) header.d=berkoc.com header.i=@berkoc.com header.b=hVhxHIBS; arc=none smtp.client-ip=185.112.145.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=berkoc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkoc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkoc.com header.i=@berkoc.com header.b="hK2ztIfC";
	dkim=temperror (0-bit key) header.d=berkoc.com header.i=@berkoc.com header.b="hVhxHIBS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=berkoc.com;
	s=1984; h=Date:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Sender:
	Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=zH9L+k4lHTBr0IJEsUvqCBf7zPcFFneHShuH6Nh/xSc=; b=hK2ztIfCRETOZ0WY8U/z9Pe553
	sfw1325mlhn4HdBM967eEcQWWVPQcfMf6hvu8eDK5ci4CU0bxLfBmHTgPGBYu9V62QdIruVraHsR3
	pgoA7s8Bcp7pyKT7+UVkv9GLbKXJbJmihMsZ76/WsOoFHk+WOEM03G65+Wt5XRa9M3I9qG2Nayj0i
	sXORJb3SPBWXubE3Gjt3k3R22lb4GvsEWFtLT14Go6vm4NDqArYn3zCqmJPfq6jwsNErv0vDTHvOy
	jRV2y3JpznTCMZNi8ilQOGTwUFeXIeGxPiWwl8TkKCQBuvcJg2DTa3Vxkz3IMJeJZre1rsM83aGYI
	ih8eIQ2g==;
Received: from localhost
	by mail-01.1984.is with utf8esmtp (Exim 4.96)
	(envelope-from <me@berkoc.com>)
	id 1wOmXg-00HScH-1y;
	Mon, 18 May 2026 01:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=berkoc.com;
 i=@berkoc.com; q=dns/txt; s=me; t=1779066785; h=message-id : date :
 subject : cc : to : from : sender : reply-to;
 bh=zH9L+k4lHTBr0IJEsUvqCBf7zPcFFneHShuH6Nh/xSc=;
 b=hVhxHIBSsJgZ/uLuXI6evMgvKgj9TaiIpQXVPd8ONnHh0lzWnRqnPWYexkdNwSJfnkbCw
 eNWRDyJNgHeLpNFkETo7QATY7+dHq9f+2Y/nRr+BEiHjtnsWAunHL1g52z8Zl6HIfWJf9oc
 g1Fs+dmrxigfc7C50Vpx6UxTsyAC8EQMY0BBE9a7HR/9EHwoxCz6vHYgy/29+gqS9Lg8Lyz
 g6KE8mTqfw+gEO8k/XOv/3+ExIJg0J9SFGhHQnaILrusmANm/wOBzFUTeG1uh/dwdWcOdKP
 X6f9j4ybPczlKFA/BYoxO6RIYGAmBYbczj7+wYc3PjXEKeKt1RgEwIlkGsxg==
From: Berkant Koc <me@berkoc.com>
To: Bernd Schubert <bschubert@ddn.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Miklos Szeredi <miklos@szeredi.hu>
Cc: security@kernel.org,
 Joanne Koong <joannelkoong@gmail.com>,
 linux-fuse@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 io-uring@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>,
 Pavel Begunkov <asml.silence@gmail.com>,
 fuse-devel <fuse-devel@lists.linux.dev>
Subject: Re: [PATCH 2/2] fuse: wait for aborted connection before releasing
 last fuse_dev
In-Reply-To: <08d3f6e0-7745-4084-995a-95ddb77f7f11@ddn.com>
References: <20260517095846.fuse-iouring-uaf.dc5f5dbb71dc@berkoc.com>
 <2026051703-equinox-multitude-91e2@gregkh>
 <20260517-fuse-uaf-cover@berkoc.com>
 <20260517-fuse-uaf-patch2@berkoc.com>
 <08d3f6e0-7745-4084-995a-95ddb77f7f11@ddn.com>
Message-ID: <177906678512.922207.11821272786828738648@berkoc.com>
Date: Mon, 18 May 2026 03:13:05 +0200
X-Spam-Score: 0.8 (/)
X-Authenticated-User: me@berkoc.com
X-Sender-Address: me@berkoc.com
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>

Bernd, thanks for pushing back. Stepping through this against the trace:

fuse_conn_destroy() in fs/fuse/inode.c calls fuse_wait_aborted()
between fuse_abort_conn() and the eventual fuse_conn_put() (from
fuse_sb_destroy). fuse_dev_release() in fs/fuse/dev.c does not wait
between its fuse_abort_conn() and fuse_conn_put(). That asymmetry is
the race.

On topologies where the last fud release IS the last conn ref
(no superblock mount, no other fud open — exactly the PoC setup),
fuse_conn_put() drops the count to zero, call_rcu schedules
delayed_release, and fuse_uring_destruct kfrees ring/queue/ent_released
slabs. async_teardown_work, scheduled by fuse_uring_async_stop_queues
via the teardown-interval delayed_work, then runs on freed memory.

The KASAN trace at top-finding/kasan-trace.txt shows exactly that
interleaving:

  free site: fuse_uring_destruct ← delayed_release ← rcu_core
  use site:  fuse_uring_teardown_all_queues ← async_teardown_work
             (workqueue), reading ent->list.next from
             kmalloc-192 freed by destruct

Your in-flight cmd ref invariant holds on both fixed and non-fixed
paths (non-fixed via per-cmd io_put_file in io_free_batch_list, fixed
via the io_uring file table slot pinning struct file → fud → fuse_conn).
But neither covers the gap between fuse_abort_conn (which schedules
the async work and returns immediately) and the RCU callback. The
PoC topology removes every other ref-holder, so that gap becomes the
last conn ref.

The patch restores symmetry with fuse_conn_destroy by waiting on
ring->queue_refs == 0 (via fuse_wait_aborted → fuse_uring_wait_stopped_queues)
before the put. That guarantees async_teardown_work has finished
before RCU is armed.

The race is reproducible with mdelay-widening; without widening I see
0 trips in 50 iter, but the window is in the code paths.

Berkant
