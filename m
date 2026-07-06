Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076A23803D1
	for <io-uring@vger.kernel.org>; Mon,  6 Jul 2026 21:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783374113; cv=none; b=cq3BX7cK3+85vRw8B3QMGESbqaUMAE/2ODtpSzeRA2MxCY6KCrlN0KP76cLXJgtXVJAEb5WjaNGwtD3HEp1nOf4me+lWaCsuJzjs7zXC+glMq7favfBlUkoEk08Aq266DRHw4li3TxUlld0WHzFfD76AtWVpNIs+4JmcWGNv2n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783374113; c=relaxed/simple;
	bh=YQG/yHQXobDpiQz5hDUV1PCwhqOM7wZ00EPYX/z2V0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jZW19d0EWUJx0qakPB7vtTyGpCzhFz00JSeVTqGXz8ZW9qErvuGAR4b1SmxN8anjQbzg4eijCWkG9hLJFx1cPd1hd9Wy8WnXSR+C07jW6+ouXMWPlWBSW2/HbaIKdST6f4EqWKtrNBEFJ9DqNAauTwrZahJo6rStOYKWuzwoqvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=z9bh/oO5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7iGXsXKT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=z9bh/oO5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7iGXsXKT; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="z9bh/oO5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7iGXsXKT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="z9bh/oO5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7iGXsXKT"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4B39E75821;
	Mon,  6 Jul 2026 21:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783374110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zKGLpejoyQkdIy7FRoMgUC5y3n9xLXAWlFwwfzR6s08=;
	b=z9bh/oO5gCkTi839GuSrY8z81NJRti25W+sVtwhjbLXUXiNHgI/qYzrgXTfThK9UoHzQ7C
	r5g9AQ6K/qINZMJiA/v9VkZD8pZeDy/7Bh76j7H7WTwYyBsS8JCxyjwz4ASSa1imQrmnGM
	GAxPEZF4EV04JywelAImrsZgcqWyN+k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783374110;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zKGLpejoyQkdIy7FRoMgUC5y3n9xLXAWlFwwfzR6s08=;
	b=7iGXsXKTRWuoJZXih8BkYb3RgRdca8MWe+LCLko7ELfXRMyJutbzqTlDUYpMiprkOSvdvR
	OMGQe6EStJj89FAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783374110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zKGLpejoyQkdIy7FRoMgUC5y3n9xLXAWlFwwfzR6s08=;
	b=z9bh/oO5gCkTi839GuSrY8z81NJRti25W+sVtwhjbLXUXiNHgI/qYzrgXTfThK9UoHzQ7C
	r5g9AQ6K/qINZMJiA/v9VkZD8pZeDy/7Bh76j7H7WTwYyBsS8JCxyjwz4ASSa1imQrmnGM
	GAxPEZF4EV04JywelAImrsZgcqWyN+k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783374110;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zKGLpejoyQkdIy7FRoMgUC5y3n9xLXAWlFwwfzR6s08=;
	b=7iGXsXKTRWuoJZXih8BkYb3RgRdca8MWe+LCLko7ELfXRMyJutbzqTlDUYpMiprkOSvdvR
	OMGQe6EStJj89FAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0FDC0779AA;
	Mon,  6 Jul 2026 21:41:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zYXmOB0hTGo+HAAAD6G6ig
	(envelope-from <krisman@suse.de>); Mon, 06 Jul 2026 21:41:49 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	ammarfaizi2@gnuweeb.org,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [PATCH liburing 2/3] man: Introduce rules to convert Markdown to groff
Date: Mon,  6 Jul 2026 17:41:24 -0400
Message-ID: <20260706214132.2841060-3-krisman@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260706214132.2841060-1-krisman@suse.de>
References: <20260706214132.2841060-1-krisman@suse.de>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-Spam-Level: 
X-Spam-Score: -6.80

Introduce infrastructure to convert back from Markdown to Groff during
the compilation step.

This is split from the patch actually doing the convertion to facilitate
review.

The conversion is not lossless, mostly due to groff being painful.
You'll notice the conversion is not byte-per-byte accurate, but most of
the differences are whitespace, which is not relevant.  Other more
tricky changes are in bold/italics, which I tried to preserve as much as
possible.

This obviously adds a build dependency on pandoc, which is already
packaged by any sane distro out there.  The configure file is updated to
check for that.

Groff comments need to be preserved because of copyrights notices. This
is done by a pre-processor python script.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 configure      |  8 ++++++++
 man/.gitignore |  8 ++++++++
 man/Makefile   | 13 +++++++++++--
 3 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 man/.gitignore

diff --git a/configure b/configure
index 39c377c9..98761b49 100755
--- a/configure
+++ b/configure
@@ -530,6 +530,14 @@ if test "$has_clang" = "yes" && test "$has_bpftool" = "yes" && test "$has_bpf_cl
   output_mak "bpf_toolchain" "y"
 fi
 
+#############################################################################
+# check for pandoc
+
+if ! has pandoc ; then
+	fatal "pandoc is needed for manpages generation"
+fi
+print_config "pandoc" "yes"
+
 #############################################################################
 liburing_nolibc="no"
 if test "$use_libc" != "yes"; then
diff --git a/man/.gitignore b/man/.gitignore
new file mode 100644
index 00000000..5fba7856
--- /dev/null
+++ b/man/.gitignore
@@ -0,0 +1,8 @@
+*.1
+*.2
+*.3
+*.4
+*.5
+*.6
+*.7
+*.8
diff --git a/man/Makefile b/man/Makefile
index 0c68d9db..8b54f523 100644
--- a/man/Makefile
+++ b/man/Makefile
@@ -1,6 +1,15 @@
-.PHONY all clean
+MDS := $(wildcard *.md)
+PAGES := $(patsubst %.md,%,$(MDS))
+VPATH = $(root)/man
 
-all: gen_aliases
+mandir ?= $(prefix)/share/man
+
+.PHONY: all clean
+
+all: $(PAGES) gen_aliases
+
+%: %.md
+	sed -E '/\.\\/d' $<| pandoc --standalone --to man -o $@
 
 gen_aliases:
 	while IFS=$$'\t' read -r link tgt ; do ln -f -s $$tgt $$link; done < ALIASES
-- 
2.54.0

