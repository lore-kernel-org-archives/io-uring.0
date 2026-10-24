Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.21.23.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792859733;
	b=Y9fUxDTfowY2S+YfHGTs7pvdu7l4I/mhhH9NKLOnllgM0N2RUV7GcPRLIMPWMRx7SoC7
	 a/+rWbPJxhGyNRA7xOAt5INDyPNbrP2zj4T17zrruTRje6j536YTxIWl0Mm8FSPZgPEx/
	 i67cxbpxmExFOuzIw40ND9rhLmA3bmL2eNPrEiJTFJ/MTsUZt1ZutKFhToukZ3rClavxW
	 yEr16LF7w4o8/DQRgrZAnusb/B6NMBUMlbQPa60kThVfjN2UCQeE8PPQym3uoxncQP8oG
	 4yYbqZTGBQPpkGNOhbyJzrJoM92zEtb5s10IYO72zgr1ne1y72VH1jXoVwxeC3H/SUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792859733;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:From:
	 To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=QPF1WDCjmQVngH0Pzcp/3vVjOR7E4xWrL9rC7dCFP+k=;
	b=DVtgPLDim5X8LXclUkK0HQ4YHSiLAcDBMcHAcHD5AANAYmSRwmOmn9A9cUVMxm0uXzKQ
	 T0qNMU+j3FwXK97HvSqnGlPEAlXYVk7qD0fGaQZ4m16kfxIOUruUY0lI6xT1fxPuJnjFl
	 PpBgtujZzIuDvDNhlC7vq/KVHe175VVSMon28W226TP+89HboZDjmU0tgsbD4Ruul7c4F
	 cvLA3AjAk5LZbddNrCPiv1YOvXQFnyQWSaH8z1f1UhsendU6do3Ca5u40NGAYeKNn/elO
	 t/sq648BsFh9vuJd/rtsD/gyJVccWo1sXs3qJZSTR+hraa3V0ss02ACm+2UnmDnXcCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=disroot.org;
	spf=pass smtp.mailfrom=disroot.org;
	dkim=pass header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=RvONffRo;
	arc=none smtp.remote-ip=178.21.23.139
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7707C606A31D;
	Sat, 24 Oct 2026 16:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7707C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=RvONffRo
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D0EE280949;
	Sat, 24 Oct 2026 18:35:23 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PaETcnp9qweD; Sat, 24 Oct 2026 18:35:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792859723; bh=iNgJQC9Rf+vfkcgCpD/nzFu6ClZORINB4lIkG9BLV70=;
	h=From:To:Cc:Subject:Date;
	b=RvONffRoGAitnLO+cDHZrrRx0C4n/s44oqFelXGlDTj0UAQtjPO0WmTc+uYmXtwjp
	 yz8OUKEyPPbPEaRMSt2SbjcISV6LOCDloHC2EfXGUl9Q7fp6trDyLOyf2eK2YM+yqn
	 sn6/A71t+GSVoHHZOPyu0+l0jLkxX8sqWd+ULeZycEB9MpMdaqbCPZwEtmWVyV7QYY
	 6Gk5hYauYe2xOoleVyxjJimaYCvdl2gie+f760HzNkf8lIHtLFQ7smw5hvsnu5YNag
	 MoJyomtOa5063YYzoBlYqfkKKzV1XvqLJkvmRNYrqV1xzv/tWUZFuDa+d8LrXpDB8w
	 hvFccJjyn/AzA==
From: agxr <agxr@disroot.org>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org
Cc: agxr <agxr@disroot.org>,
	linux-kernel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH 0/2] io_uring/cancel: futex and waitid cancel results
Date: Sat, 24 Oct 2026 21:31:23 +0500
Message-ID: <20261024163259.19372-1-agxr@disroot.org>
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

io_futex_cancel() and io_waitid_cancel() return the number of requests
they canceled, where the rest of what io_try_cancel() calls returns 0.
Commit c74193430feb ("io_uring/timeout: don't end a linked timeout with
1") took care of what that did to a linked timeout.

liburing's futex, waitid, io-cancel, sync-cancel, poll-cancel-all,
cancel-race, futex-kill, link-timeout, timeout and poll-cancel tests
pass on both patched kernels. Unchanged liburing tests pass with patch
1 and fail with patch 2, where they check for the 1.

agxr (2):
  io_uring/cancel: count all canceled futex and waitid requests on
    CANCEL_ALL
  io_uring/cancel: complete single futex or waitid cancel with 0

 io_uring/cancel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


base-commit: ecb6817b769fd7d71af2c9f446188649020b2e53
-- 
2.56.0

