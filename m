Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE272326922
	for <io-uring@vger.kernel.org>; Thu, 29 Jan 2026 22:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769724747; cv=none; b=OPLffTUL6RR4rpt5hiT3kDAVMkxS1m43ySy4eIWT2jt4QFkWYkDJhwbcq4dE8O5lBHFpk4K7Rm53iZNaOBptLwRCRZAlkjVW3doJdBhFRMdq8gmDMKJtMKlJEsNGhvK+UhXbeiSGXuxk/R+ncB6Hu9BJtAJVK45bGZuXJyNCo3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769724747; c=relaxed/simple;
	bh=UnEBM/Ygev9C9k3avbvD5EcBkEgRgHy0kARVEzZefQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s3cVl3C0JQXVd6fxYOJK1QmfjmLo04y8svzuKSD+4WoPBnK2+ooNgcoWiWXai5u36vdZpZhxY+fQMpqachRU45WaCeYOefWrxJn6/RTxrjs5FmEtR84MkAXmMv+NdAmK06BGUV34ySr6WZ4JwpXUhU4yYzJ9wMKTg1qeXhlgSKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 480125BCF6;
	Thu, 29 Jan 2026 22:11:48 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DFC103EA61;
	Thu, 29 Jan 2026 22:11:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UltvKiPbe2kKbwAAD6G6ig
	(envelope-from <krisman@suse.de>); Thu, 29 Jan 2026 22:11:47 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Gabriel Krisman Bertazi <krisman@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org
Subject: [PATCH 1/2] io_uring: Support commands with optional file descriptors
Date: Thu, 29 Jan 2026 17:11:37 -0500
Message-ID: <20260129221138.897715-2-krisman@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129221138.897715-1-krisman@suse.de>
References: <20260129221138.897715-1-krisman@suse.de>
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
X-Spam-Score: -4.00
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 480125BCF6
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO

mmap can be called either for file-backed memory or for anonymous memory
in which case no fd is provided. This patch allows an io_uring command
to request optional files for io_uring.  If a fd is provided, io_uring
loads it in the regular paths. Otherwise, req->file stays NULL.

At the SQE level, Use the ancient mmap semantics of fd == -1 to indicate
no fd.  This feels more useful than a flag or using 0. The later because
I'd expect 0 to be commonly used for direct FDs.  We can abstract this
details in liburing.  It is a bit ugly and it could be a flag elsewhere,
but we don't need to waste a flag on that.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 io_uring/io_uring.c | 15 ++++++++++-----
 io_uring/opdef.h    |  2 ++
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 87a87396e940..158e9823a72a 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -1756,10 +1756,17 @@ static __cold void io_drain_req(struct io_kiocb *req)
 		ctx->drain_active = false;
 }
 
+static inline bool op_wants_file(const struct io_issue_def *def,
+				    struct io_kiocb *req)
+{
+	return (def->needs_file ||
+		(def->opt_file && req->cqe.fd != -1));
+}
+
 static bool io_assign_file(struct io_kiocb *req, const struct io_issue_def *def,
 			   unsigned int issue_flags)
 {
-	if (req->file || !def->needs_file)
+	if (req->file || !op_wants_file(def, req))
 		return true;
 
 	if (req->flags & REQ_F_FIXED_FILE)
@@ -2200,11 +2207,9 @@ static int io_init_req(struct io_ring_ctx *ctx, struct io_kiocb *req,
 	if (!def->iopoll && (ctx->flags & IORING_SETUP_IOPOLL))
 		return io_init_fail_req(req, -EINVAL);
 
-	if (def->needs_file) {
+	req->cqe.fd = READ_ONCE(sqe->fd);
+	if (op_wants_file(def, req)) {
 		struct io_submit_state *state = &ctx->submit_state;
-
-		req->cqe.fd = READ_ONCE(sqe->fd);
-
 		/*
 		 * Plug now if we have more than 2 IO left after this, and the
 		 * target is potentially a read/write to block based storage.
diff --git a/io_uring/opdef.h b/io_uring/opdef.h
index aa37846880ff..5b81f82c2359 100644
--- a/io_uring/opdef.h
+++ b/io_uring/opdef.h
@@ -5,6 +5,8 @@
 struct io_issue_def {
 	/* needs req->file assigned */
 	unsigned		needs_file : 1;
+	/* Optional req->file assigned, if available. */
+	unsigned		opt_file : 1;
 	/* should block plug */
 	unsigned		plug : 1;
 	/* supports ioprio */
-- 
2.52.0

