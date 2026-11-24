Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795499687;
	b=AAXwIpP6ZAI28vIc2QRXBqJjcfeGv46XrlSFiJ7y7yNxGQH6dqEveeHaFZEMY5GL5SaK
	 amCWJ9PyCrcaWwa6CKqXv9IdeV9kDRbE9U1GQeWp+aPEPdDXlSggSY/ag4TRoAzXemlmc
	 l4tB5HCcHghBp2Ypx1KSOzg1/MsrQ2nBnuCsWS8MwZQ2Dzp9XHSVdwfagWSHann8HlfdG
	 sD1K8oTc+79crQ7+04FbKEGK3yyGqeeV95gX6Ll1OSK1yQq1ZsVQuBqvwsvsHH6s4V95N
	 3vTLYWpxwuIwn8qwpMnN174m6UQVsLRwbcuVD/D3+Hv0j3iRMuKeQzM31yg6/MBZahw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795499687;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=3e7QBB72kcym82iP6oydpAeA5OXk/bKOiAvc+z3wveE=;
	b=Yr6kw9uBgjCwKl0KCW2mHbMYIiR6Io2xMM4D/37TbrCJ2rwuMCdL1Zq8GnfMqODaaGXL
	 fZeLB8Sz/bVVAUpruDTmFRlvdZZHsNHCkXC7rx281+PDjy44rCbjpz2bjHJp7v+EGSY1l
	 lfwgNdxt9Z/SC3uz80/5uqxnbtW9NEnsXZGbUychs+sViuczB5yxgzXDiyQl2FG5iQD2+
	 SnUAU+AoVA343XY2BU+tkV5V86EcoPr5wgPG6TEnAaFXyvM9e2sL2Go8ups9P4Yi/Bjhd
	 kFVVeKKfDjOrRfp2BeAUVEgtw5F5+3gQSeMSE9ml8wj5zsVKJDyRxj5o16veC4wkN2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b="W/s/ighw";
	arc=none smtp.remote-ip=54.254.200.128
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD35606A680;
	Tue, 24 Nov 2026 05:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AD35606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=W/s/ighw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1795499664;
	bh=3e7QBB72kcym82iP6oydpAeA5OXk/bKOiAvc+z3wveE=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=W/s/ighwax4+eUUrPHUP5kl7jJTEcbXXzYVcKqHzwWqxPCsy8FEmYI4q8n3Ei3gK9
	 0PMGRtTeBrAydmyWjxHC8dutELI2YQWYUyEeREyX4Y/eklKO6TYBKCduq7DDf0Mdv6
	 w5SaIBfM40jht9Tkzw3oap72Z0GPsN/rzxaJzKf0=
X-QQ-mid: zesmtpsz3t1795499660te02715ad
X-QQ-Originating-IP: xTZwHOqLub58dL/AD7z/OUR5qrV7TMNqICBogG4VmW8=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 24 Nov 2026 13:54:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8599113978558872114
EX-QQ-RecipientCnt: 5
From: Yichong Chen <chenyichong@uniontech.com>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	linux-kernel@vger.kernel.org,
	Yichong Chen <chenyichong@uniontech.com>
Subject: [PATCH] io_uring/wait: clamp min_events as unsigned
Date: Tue, 24 Nov 2026 13:54:16 +0800
Message-Id: <20261124055416.1641002-1-chenyichong@uniontech.com>
X-Mailer: git-send-email 2.20.1
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
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OUGgb+Q4/l1mAoAvuEg1O9sdXNDU5mRKqhkQfVQm0rIrb6PWbQuxA8Je
	uzhNGUo0I0hAHNjvsPXH9LqhzVC8yae6EynWA8F9bUb0oVJm/HkO+Xiej7dfidIqmS3MP2H
	r+JBJIxxuxQTPpvqnGPZmul4x9q0Ouln9WyCNGntX7w6+v178Pji6whxUUsyYXH7vHn0ziB
	CMQvrO4kD/GaFUy337pPtKmwj0IHgBfQ+a2xQRwlzhZMWuyLNIkWcVjAiVhfv1B18NVD9mf
	FhbhNa+vyLAqajk1c/78NJyIURk4T39i8MQIsuk81sE4YpZGaZDocIl5vmQ+TLwALJ3TA7z
	Ar0E+qQ3WYKnL0Ds9oOatBfm81RC8kSjXbARU3FcsAuvZFDOwwDOAMMEIKf+Z2p4VhtRf78
	SGEe2z473XAe3X05WZ/kBr5qRwWOvpe+EqagAHkmmQEUxS2qb7yJDhiV2rSgId9T8AFhUu1
	l7LSLlzmAJAGzh9TlF2xAyPH5KTf824CxnSmcSqezO9TMda7dIeLxv+A3vmF/VlCJae477g
	z+7cET0nVZCaaINdl45Mu0p85/Vj7teBUwLDJ/ycfKPOXzEicGlTnTVawpAUhKhK+ChLyoT
	qb0XpbQTsrzuezmaBOJI5NeUU0uQTn3HAFvnPqFuv7e4VS4Iz2WxKE8OnS8kxRqwySbZ7Ee
	2mhLITPSwiNXPg6vkjjdMhFJDOmTYtW3bNE3YzlLrfnweb1uEOSd09+uZBDPm/CB1BXhNOi
	s6LkXI7HOLPZ7VtF2G/zDjr5gt3kowdzZUfzSMp56oDbPqyP+WKT0QxVDc9/8PqJdNkdqV1
	62OgfmHRlwNPbQnQWvsbPkqI5yJTT7O44x/xjrIojdgHwxQZPJCIfMmvLVLGd+UvhqbiVFo
	RpTSje4A/KldWGOl5PDK09vqf5yF4WUfeTQtT7OWI04R7ERSegThSqrB3y2aIscgLJXfoYW
	UYvDnmtFQr6mys7XtlS88vzWtEcU3S/x+rwEMDxG03Eg1Oc+aQyumr34mKqdOTRxR9EO39C
	EP6idTMKJyFq9a5Hxx1U9C/LwIUGEpYMtK1dG7Jg==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

io_cqring_wait() clamps min_events with min_t(int, ...), but
io_uring_enter() passes the u32 min_complete straight in. Anything above
INT_MAX is negative by then, so the clamp is a no-op and
io_should_wake() reads cq.tail + min_events as a positive distance from
cq.tail. The wait returns 0 with no events available instead of blocking
for the clamped count; min_complete = 0xffffffff returns immediately,
while 1 and INT_MAX block for the timeout as expected. Clamp as unsigned,
as io_iopoll_check() already does.

Fixes: 816619782bdc ("io_uring: move min_events sanitisation")
Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
---
 io_uring/wait.c | 4 ++--
 io_uring/wait.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/io_uring/wait.c b/io_uring/wait.c
index fb1c082993a7..074cdf073ca7 100644
--- a/io_uring/wait.c
+++ b/io_uring/wait.c
@@ -204,7 +204,7 @@ static inline int io_cqring_wait_schedule(struct io_ring_ctx *ctx,
  * Wait until events become available, if we don't already have some. The
  * application must reap them itself, as they reside on the shared cq ring.
  */
-int io_cqring_wait(struct io_ring_ctx *ctx, int min_events, u32 flags,
+int io_cqring_wait(struct io_ring_ctx *ctx, unsigned int min_events, u32 flags,
 		   struct ext_arg *ext_arg)
 {
 	struct io_wait_queue iowq;
@@ -212,7 +212,7 @@ int io_cqring_wait(struct io_ring_ctx *ctx, int min_events, u32 flags,
 	ktime_t start_time;
 	int ret, nr_wait;
 
-	min_events = min_t(int, min_events, ctx->cq_entries);
+	min_events = min(min_events, ctx->cq_entries);
 
 	if (!io_allowed_run_tw(ctx))
 		return -EEXIST;
diff --git a/io_uring/wait.h b/io_uring/wait.h
index eb5ae8a6fc94..07e1e9ea03cd 100644
--- a/io_uring/wait.h
+++ b/io_uring/wait.h
@@ -38,7 +38,7 @@ struct ext_arg {
 	bool iowait;
 };
 
-int io_cqring_wait(struct io_ring_ctx *ctx, int min_events, u32 flags,
+int io_cqring_wait(struct io_ring_ctx *ctx, unsigned int min_events, u32 flags,
 		   struct ext_arg *ext_arg);
 int io_run_task_work_sig(struct io_ring_ctx *ctx);
 void io_cqring_do_overflow_flush(struct io_ring_ctx *ctx);
-- 
2.51.0

