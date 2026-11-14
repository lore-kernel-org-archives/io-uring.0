Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626189;
	b=ZpiIM9QZb9pKQxCOlSiAuZL0557MzKXwM/MCWkn1IwBF04fndZuh0AXuumdWYSqLu0cP
	 a9hszlXFHXfndCnq2Fbre9nJ+WLv5Rv96lTtsmMqTjg4TKReeezCij1+9DZfgdabJ6zQ6
	 hD+aTA7VO/OEbGBEOepMNMAT5EkiGjZMPDXIjG5gHOZRXLSoRorTlL7xv2jOrf+cfpNm1
	 46qjQD91kAEOuHev2aiXR2s/4LXxJAMOPmObO/6vekwI7zZVfATdXiskUkjJ2fQmdpOY0
	 lGdqpPLJKw6NL2U9Uid/z/7V/2T9z9R8In5Q8Z3fNaAdaT3V+TBgGICa2GEonXURTcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=3uZCrEWxOH69+GTCH3HSB6MoUQF0BV83RO/XTXzhfSA=;
	b=I21FIvPkI2k8W1I/bYDNpm6dw+6BipvhsPiPDf5HxJGI2ZjTLnQlxzcieiHRxj9pUEUV
	 mDjzcXHlk+yXETgkWVJyUmV4CSsvN13sIULuGCYPOhNfMJJPUvCXSsPui6E0kfn9vWORp
	 180ejuCo2reOxvyB1b3Za4W4BTy1lHQ+ztg4qdclB3PiVnX1FQRWiLyqtpbEwvDNbjxfs
	 +q/qYqm6bWCS6VdO5aeyfk4zLaifAKH3hJb/Lf6/UVhoc6DhEIgYOukWzUbDNfYiYnmV+
	 7k7X8utAmNoLlV4zB45q10haZhOyjQVuoc5IhbPbKdWcOj3+xXHLC1rlS3ji/ooucsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=YKgvOZfc;
	arc=none smtp.remote-ip=209.85.214.225
Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E42606A8AF
	for <io-uring@vger.kernel.org>; Sat, 14 Nov 2026 03:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2E42606A8AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=YKgvOZfc
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2eac4936dfdso3085115ad.2
        for <io-uring@vger.kernel.org>; Fri, 13 Nov 2026 19:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794626188; x=1795230988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3uZCrEWxOH69+GTCH3HSB6MoUQF0BV83RO/XTXzhfSA=;
        b=YKgvOZfcTF/6HHXNhEBKkeNay2MqZJMARRZJa+geb16nAdi1bV5lLegaR+el2zpm8+
         t2vmuxLdkdG4M6VGRdfxMwWXUPi4WaKsmtUzRgHEskOtcRnygtvvOL2qX8FCRbXHS8z+
         NfVji+RpUu3um3skMNkzu5w0bLVtZ45Xeur3+SMTkZ3QY6u0Uc4b4h8WdMys3uNTJh1p
         rXK5Gvpo4S07gJ0kf2piXt6z5iy1xM883CWO13Cw9GKEMb9/Gu9/0lapnZ1uHYAIX+EL
         EIwHJk8iNCi2CNZLzhpCXKdhcPNLQGAxtmY1I6/pYwpBFXcI2pBSbUynvEWmX1C4Rnok
         nbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626188; x=1795230988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3uZCrEWxOH69+GTCH3HSB6MoUQF0BV83RO/XTXzhfSA=;
        b=CIv/lXL01MgFUa5xYNGftQBLW7yt1g0/xXZ19tDqjYVfghGQIN2N6YFLOY1DRCkr+9
         l+wMD1Wa3wmw03cOJffExIMmsd9vSdIjH5+NLgScEK/VYBZSIw3gCdYcAJ6SLB4nHgK+
         z46qOVhBhSbCObmVIzGodxxpjRKJwljkWbrSjW6Vm4C2xU6PeiXTZSq+pr8OFwkI49K4
         pUL2+Jc+UFb1N3nrjHVqr6OpS5QS0TcnzKtJTxKzGVj3WrHc9ZbHbL4zxfEX72tww2eY
         /D2Zg3S/bgt+61BBepYH646S15QXtKxkfAcexNe7sUuFaRbhzFeC//Jj1p9svFHOWNmQ
         aeJw==
X-Gm-Message-State: APuU4Z/K6z2qg2hUue3dpRw1yEzNB96UHYNCSZ2p9AFf8iAjJ2db3uEw
	ms3edSEKcDZ/PBnX2i6FAwzsd6MAtdNSvKs1jlVkp/et0ADVxD1H+XnPwNVt1g1rChxR9i+i3cO
	AGo8/js3DpZs0+4/tD8rFNP8lnmcnL5oRZpBw6418XxrsarT4gO4S
X-Gm-Gg: AYBFou3KKqnvYUA7MteJn+EGqBa79RFDlNktjM9Nv22zqxX+ttLyOm4O1Tx+k1auFa0
	Qq+s7Z+XPacvAF83km44aeUu/HJO3iPtQ8kRWzZtoq8WIiWW5fWbtxofTmji+u1qWHkQs8GC5tD
	LWe8EgIEIgfsINuUT1VME4Axb15RcbsSg/Ywy/PoiJruQKkbb0yNLzR6uCmXRUJ0gdo+G9k4CCy
	bw1+hyoRw12jUe2g46ZChqvJRHMCnHDMxTGDBlsVq9XzwuLWpiUMy6uy+jXB5K/nsMkStBlFeZl
	DUmVfg1/WAI1yMdudIP7Dc1zbRWIO1GA3aQVlH9toxw0mqNHd6Qy7uEMjswpboAJ/WmSNGxxx8p
	eSJ7J4i8kgD7yJXqz
X-Received: by 2002:a17:90b:2e90:b0:3ac:77a2:18b1 with SMTP id 98e67ed59e1d1-3b1b0a44b0amr6710056a91.5.1794626188078;
        Fri, 13 Nov 2026 19:16:28 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae8da103sm6489932a91.1.2026.11.13.19.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:16:28 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [IPv6:2620:125:9025:23::204])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 66197401FA;
	Fri, 13 Nov 2026 20:16:27 -0700 (MST)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 63E0BE4049B; Fri, 13 Nov 2026 20:16:27 -0700 (MST)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 2/4] io_uring: add multishot_flags constant in io_wq_submit_work()
Date: Fri, 13 Nov 2026 20:16:19 -0700
Message-ID: <20261114031621.2924144-3-csander@purestorage.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114031621.2924144-1-csander@purestorage.com>
References: <20261114031621.2924144-1-csander@purestorage.com>
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

REQ_F_MULTISHOT|REQ_F_APOLL_MULTISHOT is repeated twice in
io_wq_submit_work(). Introduce a constant variable multishot_flags for
it to reduce the repetition.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 io_uring/io_uring.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 5db57bf675f0..28ef95851510 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -1617,10 +1617,11 @@ void io_wq_free_work(struct io_wq_work *work)
 void io_wq_submit_work(struct io_wq_work *work)
 {
 	struct io_kiocb *req = container_of(work, struct io_kiocb, work);
 	const struct io_issue_def *def = &io_issue_defs[req->opcode];
 	unsigned int issue_flags = IO_URING_F_UNLOCKED | IO_URING_F_IOWQ;
+	io_req_flags_t multishot_flags = REQ_F_MULTISHOT|REQ_F_APOLL_MULTISHOT;
 	bool needs_poll = false;
 	int ret = 0, err = -ECANCELED;
 
 	/* one will be dropped by io_wq_put_work() after returning to io-wq */
 	if (!(req->flags & REQ_F_REFCOUNT))
@@ -1647,22 +1648,22 @@ void io_wq_submit_work(struct io_wq_work *work)
 	 * right context, however this is not the case of auxiliary CQEs,
 	 * which is the main mean of operation for multishot requests.
 	 * Don't allow any multishot execution from io-wq. It's more restrictive
 	 * than necessary and also cleaner.
 	 */
-	if (req->flags & (REQ_F_MULTISHOT|REQ_F_APOLL_MULTISHOT)) {
+	if (req->flags & multishot_flags) {
 		err = -EBADFD;
 		if (!io_file_can_poll(req))
 			goto fail;
 		if (req->file->f_flags & O_NONBLOCK ||
 		    req->file->f_mode & FMODE_NOWAIT) {
 			err = -ECANCELED;
 			if (io_arm_poll_handler(req, issue_flags) != IO_APOLL_OK)
 				goto fail;
 			return;
 		} else {
-			req->flags &= ~(REQ_F_APOLL_MULTISHOT|REQ_F_MULTISHOT);
+			req->flags &= ~multishot_flags;
 		}
 	}
 
 	if (req->flags & REQ_F_FORCE_ASYNC) {
 		bool opcode_poll = def->pollin || def->pollout;
-- 
2.56.1

