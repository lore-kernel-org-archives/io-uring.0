Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DD837CD2B
	for <io-uring@vger.kernel.org>; Fri,  1 May 2026 22:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777675980; cv=none; b=hrypAhmMY+hd9U1kKFbfh+JCiS1UGTkqRYC2zSpw5U40ayNJHrmI6XYKdqpg0PY4Er74w5ItcOqD9U78n5dTRksxiQXXTjJDW66IucOX1JFQbEzF8Y1lKEuWDaNp+el/y7S+3FrCWKy4cLJe5XBzQzeDkDTwFXm7GPlbTE2W0y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777675980; c=relaxed/simple;
	bh=3izMdYi0Oj1T72GfhQd7zAMqTtdcIaItfGc3eM1Tt0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ik/4++LMFP/Srqzf9sz9gLvGI5OlhWpIblavPPvF65udR4WRVke23zzJy4I3CNbk/CdiLahmlU4kcbsNJsv/eq3qoV0LMGKx5Ax/phw3aqaxcLHeKkYmBN16vEWu1bwV/CUKrHMXkl/yXO+mJoc9KosECP67OdqvTu9A76tBtwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s4HB6Avd; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s4HB6Avd"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso27133715e9.3
        for <io-uring@vger.kernel.org>; Fri, 01 May 2026 15:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777675976; x=1778280776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxJdrCJuTrOiQKeCXfwytRR+Gy/EZWJBx9r5t8TJi68=;
        b=s4HB6AvdtsIEZrWYAx8KZuGFYSqaiTHI4+vYSo6kHESCIuIOhAG8fj0jKA2lcd5AYS
         gZkHbfvCb0fAa+AAR7AENx762y3YdIFapCCwbUu8/76EI1cSvKNMto6lYgWKZWxTjai+
         jTar6zie2vYT54VFOwDIZSOdbxg/8aF1Bj0DoP6362lGT24fvgeX7pcxAjx3esi2jv/O
         1g+c7sD797tZY3kV3G3JGRpnpv5O88oDUt7ITuCEtbVzHuFQbW2ro/wqA9fUEwe1fqq1
         2cPcdXI/qbXpuxF1dZyG6IHGGq2+Qv+r8DKfeHQROmSHxcUCWleED3yRVPClGT4xmT6m
         y5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777675976; x=1778280776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xxJdrCJuTrOiQKeCXfwytRR+Gy/EZWJBx9r5t8TJi68=;
        b=XCEM4xXJxJuWbSj31CPwE/+n3qO8giSr49+zG068wyugBAsiYs9eywbCXunxlD+Y7+
         l/QZuD1/qXFI0BU63wn4fK/P5/LsEewRwWkdX+8kkNWmAKN+RjsHCU4K6ElvWGHY5PID
         8z8aHh4CJ3C6N4uwXw8Va29VmqvuH49H9LAkZxkalCQZrcNthYQ8dwXMYw9mRqky3QsH
         6xTvkJLY694wbt+1DB52nRsZuAYtxZ9316nZTWCEwJNIQlZ5ct7W9qhJ0GlIJI55akeY
         3JZQcZwbsCkPoubv2+qgOTpHV3y4I1/BqS54KcmzABlTkxRRZraStQgCGudTvUvSC1q/
         Q1LA==
X-Forwarded-Encrypted: i=1; AFNElJ8nlHtmVh8xPURpoc+cLtqSneFMEjodujvcMEDzIzsaow3PQumDzFBdcB2DDasBIc08qUqwwtSRIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFmxfW2meOzNqdHihWXxqC2aDfL3STyF0s7gpxVDmtrIvYHsZz
	x2b0JYcReBJlhzHTwS4UBwjKJ7udk6n1Q5YQ+X7vqqklGEgXZ2/DSqQkMQhOymqW
X-Gm-Gg: AeBDietKSlI3CHdmmvMftH8UJVTxZBud87zLyUlVqIBvpJPPNP6JyJMptXqTexMPK7y
	FKcgeBmwk7KfiKQgzj7oAtyIXJGrN1hy8VDz5DBSD7SZnDPZs1AP8OJ+fcwN5OcYZDygpoX3Zr1
	+kA87rAGTNLDoh0UliIHdnmuCw6C0oYDy77sh98Xe0B+w7lmX7R96JJOLNeOEaHLEN4e2sm9ga+
	ZpXOcf5BxeuMlBbKijsaS8NcMxZTRRALDOxDVgxUyXqm10sql/hDdvtSdHwX1xF0gfGfUqWsg5p
	rTjfMLFUWJZM84sh9fzKpyThWEAaemdAxSATqjQsQlW9UMGoSDtGAiixIqeT0yXgiLB3JrV/qzs
	EiLGP2QXab3hU5qWxYgPAHJFLEUkvR5kvFZkFHEfZiKbSKbAEeyvID6loFgXnZyC/Sh3L2lEgZc
	gifY39eOZ2INqXN6q5Z1YKOAA1GZeSpEYZJLrVUZAn4neNYr9RHmlpIZB+T2ccvBPVXMigYQ27Y
	waTCZ/VzxaCXIpa8Z5m0pS19/dpnUDtR39x
X-Received: by 2002:a05:600c:a402:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-48a9865f7c3mr10441055e9.15.1777675976196;
        Fri, 01 May 2026 15:52:56 -0700 (PDT)
Received: from localhost.localdomain ([77.124.36.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fe93266sm23857045e9.3.2026.05.01.15.52.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 01 May 2026 15:52:55 -0700 (PDT)
From: Kai Aizen <kai.aizen.dev@gmail.com>
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	axboe@kernel.dk,
	io-uring@vger.kernel.org
Subject: [PATCH stable] io_uring/poll: ensure EPOLL_ONESHOT is propagated for EPOLL_URING_WAKE
Date: Sat,  2 May 2026 01:51:57 +0300
Message-ID: <20260501225250.90152-4-kai.aizen.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260501225250.90152-1-kai.aizen.dev@gmail.com>
References: <20260501225250.90152-1-kai.aizen.dev@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jens Axboe <axboe@kernel.dk>

[ Upstream commit 1967f0b1cafdde37aa9e08e6021c14bcc484b7a5 ]

Commit aacf2f9f382c ("io_uring: fix req->apoll_events") addressed
synchronization issues between poll->events and req->apoll_events.
However, a subsequent commit failed to maintain this consistency in the
EPOLL_URING_WAKE code path.

The patch ensures that when EPOLLONESHOT is set during regular
EPOLL_URING_WAKE handling, it's applied to both poll->events and
req->apoll_events. This prevents a condition where "IORING_CQE_F_MORE
is set in the previous CQE, while no more CQEs will be generated for
this request."

Backport notes:
  This patch applies cleanly and identically to linux-6.18.y,
  linux-6.12.y, linux-6.6.y, and linux-6.1.y.  The io_poll_wake()
  EPOLL_URING_WAKE branch is byte-identical to the upstream pre-patch
  state across all four trees.

Cc: stable@vger.kernel.org # 6.1+
Link: https://lore.kernel.org/io-uring/CAM0zi7yQzF3eKncgHo4iVM5yFLAjsiob_ucqyWKs=hyd_GqiMg@mail.gmail.com/
Reported-by: Azizcan Daştan <azizcan.d@mileniumsec.com>
Fixes: 4464853277d0 ("io_uring: pass in EPOLL_URING_WAKE for eventfd signaling and wakeups")
Signed-off-by: Jens Axboe <axboe@kernel.dk>
[backport for linux-6.18.y / 6.12.y / 6.6.y / 6.1.y, verified 2026-05-01]
---
 io_uring/poll.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/io_uring/poll.c b/io_uring/poll.c
--- a/io_uring/poll.c
+++ b/io_uring/poll.c
@@ -417,8 +417,10 @@ static int io_poll_wake(struct wait_queue_entry *wait, unsigned mode, int sync,
 		 * disable multishot as there is a circular dependency between
 		 * CQ posting and triggering the event.
 		 */
-		if (mask & EPOLL_URING_WAKE)
+		if (mask & EPOLL_URING_WAKE) {
 			poll->events |= EPOLLONESHOT;
+			req->apoll_events |= EPOLLONESHOT;
+		}

 		/* optional, saves extra locking for removal in tw handler */
 		if (mask && poll->events & EPOLLONESHOT) {
--
2.43.0

