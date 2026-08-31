Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E384746A5
	for <io-uring@vger.kernel.org>; Mon, 31 Aug 2026 15:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191575; cv=none; b=DHpocskPTEASBrD/r6KkBzJU7HEh+p4958wCqNLUJkgp344t+QzqknQuZz36OOx8BGEi1WfJwinzksC5ftM19Qz4o9KNZ6kVseQ7Gp001BqLaH4B9d+e9CTM9N6uNzl7i0WfFzNsy7XuIqhmwsjhfFJwieKVt9/glPVXSnhBo5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191575; c=relaxed/simple;
	bh=vfrCXhXMb2devZWvKLJnOMFXKhOSMYIQdcHZWswjbnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RxLpdVhClGi+Jt/jiHOfMq6AYkCoONb+nw7s36wCcpU7OG2xdcabVVjrpVBBxcc541VnX5jRqyVXWRuozYp5WxASEAsj9kyfcTvax3Tw7je03U8Vy/aHCK+LRiwaqpeqia0dgF5ul2gtR/rzryXUzQMGeTjXMEPwnUz1McgmL3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AF4B91FD84;
	Mon, 31 Aug 2026 15:52:52 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DB72713685;
	Mon, 31 Aug 2026 15:52:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OAPPKFOjlWrHUAAAD6G6ig
	(envelope-from <krisman@suse.de>); Mon, 31 Aug 2026 15:52:51 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [RESEND PATCH liburing 2/2] test/iopoll: Fix clang CI build failure
Date: Mon, 31 Aug 2026 12:52:22 -0300
Message-ID: <20260831155222.121857-3-krisman@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831155222.121857-1-krisman@suse.de>
References: <20260831155222.121857-1-krisman@suse.de>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: AF4B91FD84
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]

Clang CI builds in liburing repo do -Werror,-Wunused-but-set-global when
building with clang.  commit c5eead26 ("test/iopoll: fix over-eager
no_hybrid check") left a lingering variable that was not used, and clang
got smart enough to find for it, causing the build to fail for every
commit ever since.

https://github.com/axboe/liburing/actions/runs/30404555586/job/90427017716
https://github.com/axboe/liburing/actions/runs/30404555586/job/90427017742

Fixes: c5eead26 ("test/iopoll: fix over-eager no_hybrid check")
Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 test/iopoll.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/test/iopoll.c b/test/iopoll.c
index 98230657..d68fde10 100644
--- a/test/iopoll.c
+++ b/test/iopoll.c
@@ -23,7 +23,6 @@
 static struct iovec *vecs;
 static int no_buf_select;
 static int no_iopoll;
-static int no_hybrid;
 
 static int provide_buffers(struct io_uring *ring)
 {
@@ -372,10 +371,8 @@ static int test_io(const char *file, int write, int sqthread, int fixed,
 		return 0;
 	}
 	if (ret != T_SETUP_OK) {
-		if (ring_flags & IORING_SETUP_HYBRID_IOPOLL) {
-			no_hybrid = 1;
+		if (ring_flags & IORING_SETUP_HYBRID_IOPOLL)
 			return 0;
-		}
 		fprintf(stderr, "ring create failed: %d\n", ret);
 		return 1;
 	}
-- 
2.55.0

