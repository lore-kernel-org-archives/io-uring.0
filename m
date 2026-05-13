Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBE836F916
	for <io-uring@vger.kernel.org>; Wed, 13 May 2026 09:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663428; cv=none; b=RY8G8nsg/x0VvGYlB/FFHSwWOalNATzuLqyzq007Aw+KNlzSk2+eQZYD/Sjqve0w3oMpXpAixmNJpKsHEYYi5fRUSS0xmVr06BiZRMwY/ByLk92zeuBCRFctjwD+fbvyIDYH2YH7egRSdqsrvkuGH0UwL598QqD6KtjpnOqyX3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663428; c=relaxed/simple;
	bh=Uw0uScx8E1a3wIEO5ri99NR4rDuQtAaM+XVL+5J8xD0=;
	h=Mime-Version:Message-Id:To:Cc:Subject:Date:From:Content-Type; b=E7gtarH0GSjzct4w5HxIudTahBbNz//KJ6kipUS4Z+1p1Ix9xWoM7L/H+0R/wJQXxi2Nqde5Yy+WTIEcbGrFs46iPTw75qt40IDZO+IX6enLn4E2dLvX5022RynpMP+M3YCsaxHDiUmcs5WAy1uWepWPlzihWR7pZMSn3NyRwwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=I5h1iDV9; arc=none smtp.client-ip=209.127.230.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="I5h1iDV9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1778663299; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=y9nLA5PRTc6yF2cdJng5j4g+eBMacB7v/4HE+A0Ob9E=;
 b=I5h1iDV9Ssd1bg8h5q7eLtPqgfebv33khYcuDn/RG0nFrgAcV7Nu4Tm8P20RlOrSaennVp
 5pXViXz6YP9WX/iZ0/6vOtPy3Ph3sfWIxw2xRcphXOA0XoFx0SUR8xl1vhFVFtC35xAGwU
 G9U+BOg1f4t49QrXQh2fHOvohBS+7d3qefOsUNtEyk/Q+1Ld3o5qnC7gCKoWzHGva0xtEF
 xOz1I25o1cgr5xnsCGytKOPdzzC2VUsuRCPd6qpLN1V40RrwIhBqsCB3URsvJXq4k+whWn
 ZD2jMozENT3oPwHGctCILkpsTBqgfmQGDaOOqjg9iRgtSXO7kVO24mVHjWU11Q==
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Fengnan Chang <changfengnan@bytedance.com>
Message-Id: <20260513090755.99278-1-changfengnan@bytedance.com>
Content-Transfer-Encoding: 7bit
To: <axboe@kernel.dk>, <asml.silence@gmail.com>, <io-uring@vger.kernel.org>, 
	<agk@redhat.com>, <nitzer@kernel.org>, <bmarzins@redhat.com>, 
	<dm-devel@lists.linux.dev>
Cc: "Fengnan Chang" <changfengnan@bytedance.com>
Subject: [PATCH] dm: limit target bio polling to one shot
Date: Wed, 13 May 2026 17:07:55 +0800
X-Lms-Return-Path: <lba+26a043f81+76673f+vger.kernel.org+changfengnan@bytedance.com>
From: "Fengnan Chang" <changfengnan@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Type: text/plain; charset=UTF-8

dm_poll_bio() is the ->poll_bio() callback for a stacked dm device.
The caller only knows about the dm queue, so it may decide to do a
spinning poll if it thinks a single queue is being polled. Passing those
flags unchanged to the mapped clone lets blk_mq_poll() spin on a target
queue from inside dm_poll_bio().

With io_uring IOPOLL on a dm-stripe target this can keep a task in

  dm_poll_bio() -> bio_poll() -> blk_mq_poll()

long enough to trigger an RCU CPU stall, before io_uring gets back to
io_iopoll_check() and its need_resched() check.

Keep dm's ->poll_bio() bounded by forcing one-shot polling for target
bios. The caller can invoke dm_poll_bio() again if it wants to keep
polling, and it also gets a chance to reap completions or reschedule
between passes.

Fixes: f22ecf9c14c1 ("blk-mq: delete task running check in blk_hctx_poll()")
Signed-off-by: Fengnan Chang <changfengnan@bytedance.com>
---
 drivers/md/dm.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index e178fe19973ea..8f44fbbcf3da2 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -2098,8 +2098,17 @@ static bool dm_poll_dm_io(struct dm_io *io, struct io_comp_batch *iob,
 	WARN_ON_ONCE(!dm_tio_is_normal(&io->tio));
 
 	/* don't poll if the mapped io is done */
-	if (atomic_read(&io->io_count) > 1)
-		bio_poll(&io->tio.clone, iob, flags);
+	if (atomic_read(&io->io_count) > 1) {
+		/*
+		 * DM hides the target queues from the upper poller, which may
+		 * decide it is safe to spin on a single stacked queue.  Do not
+		 * pass that spinning policy down to a target queue: one slow
+		 * clone could keep the task inside dm_poll_bio() for a long
+		 * time.  Poll target bios once and let the caller decide
+		 * whether to keep polling, reap completions or reschedule.
+		 */
+		bio_poll(&io->tio.clone, iob, flags | BLK_POLL_ONESHOT);
+	}
 
 	/* bio_poll holds the last reference */
 	return atomic_read(&io->io_count) == 1;
-- 
2.39.5 (Apple Git-154)
