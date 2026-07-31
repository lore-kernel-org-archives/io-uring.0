Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE078282F01;
	Fri, 31 Jul 2026 00:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785458424; cv=none; b=WXO5SAV2kI6m/b5xcBaTIZ42z42kb1g82UkWKs8OmcXGKs9spj71lt8os8nBgjbB1YDPXKqhXVf9/p/lCKAawYkKrCKYAdvowPhmn60Mprh5o+RPJHl2XyfzGu71Dnm0eal9UIHy/wFgxNy1Fjh26X94THf+HFyF/Iu/7BgDUgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785458424; c=relaxed/simple;
	bh=SO53roWmK0OC3Xmf0fOiSeWIzO29R+CnnTPsLUYbKQw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PrTesLCFjbJD2LCJU7IvleI/YE4162+Ysk2QgYriaxqNLun2FDhzX3wJwQhFIA5vN/oKzI6mlnKBbLBAZbkrCXTtF+eLXicmZ4bBrhfULDYPNg9wtsNFH4iBUro0aN9MKhPizVB9U3ykWp1W97/P1iasIOxWasBujFM8AD1eiyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tazp/ER9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tazp/ER9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D73C1F00A3A;
	Fri, 31 Jul 2026 00:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785458421;
	bh=/35lJLDJV6ArYETn9esG9Hw3rvlVe8FW+aClHs5+Am4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Tazp/ER9xESQewHHaHFyJKmBBX28CF2us9flmtKLKvomW+ibzYIr2/fjp3Dveafqf
	 q5nXpO+FH7SPfpK+b6pwX0o/hsFIcvUwXW2OnG5LlW/+4Cx98KdKP0pjutIPkUAvBO
	 MEiCCPicaSQ9QjKO+aY9sfdMQMT+TFZs6PRJJsEzRxej1W2KrqjMaVYrpSSCsaKSvF
	 fou8oHi/6Yr4LiMNpvZzYqMTzAFV8X6RdpLiNLpakAo4gZEnngfXyGw76tff/XsDOU
	 bFIGQkc51mdOn8Hcq5n9YJ8SQBjmyFDCb3bBTIlMloFG8wCHkbJibtEVJ1UCQ+51u6
	 a9oPy3FAg/fMg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 3E591CE0F82; Thu, 30 Jul 2026 17:40:21 -0700 (PDT)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org
Subject: [PATCH RFC 4/9] io-uring/rw: Use accessor for hrtimer_sleeper ->task field
Date: Thu, 30 Jul 2026 17:40:14 -0700
Message-Id: <20260731004019.3530210-4-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <e76a426b-f65c-4357-b263-96506d877136@paulmck-laptop>
References: <e76a426b-f65c-4357-b263-96506d877136@paulmck-laptop>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hrtimer_sleeper structure's ->task field is used as a flag to indicate
that the associated hrtimer has expired.  This means that the hrtimer
handler can be storing to this field while other code is loading from it
to check for expiry.  Note that additional races appear for hrtimers that
can be restarted, which could be argued to be a user error.  However, that
is no reason to let the compiler introduce additional confusion, and to
this end, the hrtimer_sleeper_task_get() was introduced, use of which also
has the benefit of avoiding open-code access to hrtimer_sleeper innards.

Therefore, apply this accessor to the io_hybrid_iopoll_delay() function.

KCSAN located this issue.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Frederic Weisbecker <frederic@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: <io-uring@vger.kernel.org>
---
 io_uring/rw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/rw.c b/io_uring/rw.c
index 63b6519e498cd7..4afbc3ceea0bb4 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -1291,7 +1291,7 @@ static u64 io_hybrid_iopoll_delay(struct io_ring_ctx *ctx, struct io_kiocb *req)
 	set_current_state(TASK_INTERRUPTIBLE);
 	hrtimer_sleeper_start_expires(&timer, mode);
 
-	if (timer.task)
+	if (hrtimer_sleeper_task_get(&timer))
 		io_schedule();
 
 	hrtimer_cancel(&timer.timer);
-- 
2.40.1

