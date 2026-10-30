Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.207.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336641;
	b=jBI7fsKgqU0mBT+5fS2kunBI189qRZrKtAVHAwMvxhYUfQXrWSsUnFjuZ7w7tTrS4VY5
	 DFgGYAriA/HtQvDfIrBNNLzWYyaCupE98uG9t/1M/1Asx4wF9f/FURx6clYXMHRXCUvOl
	 /OLFmj8NmdSYOS7/8/b1aYRuDVlMA2C3FLpXZHNQzE1gjRhEBQkCYpnnLdamuofMhP6HH
	 1nPBUIu7ZaRtLeaOpC+55eYfKbck/hgoLvsXzxItcZWWjWb8AQmz2V9X1xztys/VQXrN6
	 4H+OltRn2JRK2vPmWL4fymgk4itUwhQnDvKaD+fKtbGoB/iUNu0TtQkbjy3DEw2ykKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336641;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Received:Received:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-Smtpcorp-Track:Feedback-ID:
	 X-Report-Abuse;
	bh=Wbl/xuEn0Kwx8i0cp0FlXtd52MgQLMm91QNASCMIyoY=;
	b=nP0jpZpVGBiruG1cuKjms/zZhTfF0TGRkrtgxtDGkKyRcmE34fH1BnU8VAqdAeecSq83
	 igBpQmG1YWeJMX3LnpZ1niGDvEY7BG0RPmKV2hH67dEL+B8OqlB9EpWhTGING+/giVru9
	 3od6g21h+YjO6Ijn5eUSBxfiUHfotOBdMA7oje3GVL87SRFmV9wtAwtZJGtVzX1aNq6/Y
	 s/DgxMBzlxjVkcqNM2yiUpKGW8j7HJmxBNVVYPjLkBhP4U1o5LAbc3E+Fex+N8lBGqENf
	 gi2c7pvp2h9pyZwb5099tlLeXHA8YnVAL7W2bJZvjNSPm8p/dJzU8hB0IhAFWl+RfEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=shangen.org;
	spf=pass smtp.mailfrom=em879706.shangen.org;
	dkim=fail reason="unknown key version" header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=miusa0.a1-4.dyn header.b=2at8sClP;
	dkim=pass header.d=shangen.org header.i=@shangen.org header.a=rsa-sha256 header.s=s879706 header.b=TdPg9cgL;
	arc=none smtp.remote-ip=103.47.207.181
Received: from a2i949.smtp2go.com (a2i949.smtp2go.com [103.47.207.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA16606A31A
	for <io-uring@vger.kernel.org>; Fri, 30 Oct 2026 05:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AA16606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shangen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em879706.shangen.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=miusa0.a1-4.dyn header.b=2at8sClP;
	dkim=pass (2048-bit key, unprotected) header.d=shangen.org header.i=@shangen.org header.a=rsa-sha256 header.s=s879706 header.b=TdPg9cgL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=miusa0.a1-4.dyn; x=1793337541; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Date:Subject:To:From:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=Wbl/xuEn0Kwx8i0cp0FlXtd52MgQLMm91QNASCMIyoY=; b=2at8sClPNXYV5au1MDE3PC0eXn
	ejWYZCMcssnovDj6drgg//UT/t3+zBj8i1wRixsrHOdbvgIhNC+a1tkbJUAd7xLCJg270SpV3bCJ0
	GHt4dk/7kY/rMuCr60+ipQ6NdUd9TyjdKZpBqrXjaEC55hVcJtlvnk4eaWRH0WKIIqsSn8mvXZ8xC
	GYDS+3Dy+SQr+IAIcAfN6otX3iNEfLTwZUX0Cpeo+OxANzkLD6XJv0sn14glh+VacOkIVaukh1YyI
	1KS8YITBFWw//MTe14q4BBRVSTriI1VJBZFp7CcC1zyJhWuyX8LsgnTy2sY5BBeUkhMmm4Zb/kMv9
	NTZrfx5Q==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shangen.org;
 i=@shangen.org; q=dns/txt; s=s879706; t=1793336641; h=from : subject :
 to : message-id : date;
 bh=Wbl/xuEn0Kwx8i0cp0FlXtd52MgQLMm91QNASCMIyoY=;
 b=TdPg9cgLleD6g915echBxdsV9qJxeWv3cW09k8lr53VPwD6gWyJs0xysNNnX32EMSD+GR
 RXXOoPlXqGof1msXqJs5Yem/SNnKcvKaOTlE+Az3FB4xWQl9YsQs2KP2mPkSggk/BJ8x1Pa
 NHvylLwox+Q8hG536lQ8CDA9uJdYql3V82nLKte3VOpwRTMTAFuBsGy1toVBWrUiLRuA78w
 kQZh3P+pvo9+uAhPwFnJ4sihKpJTXsPtPLE2rQiWvicY9MvTkBGFNxHoNtU6y3hfbnWCxa+
 GZ/lSB+rDr0wGujmuopi7VGJSUdCev3shem46L81NuirykNrYBzqe6HzJRVQ==
Received: from [10.143.42.182] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <sim@shangen.org>)
 id 1xMemT-gL4QLv-P3; Fri, 30 Oct 2026 05:03:57 +0000
Received: from [10.195.244.224] (helo=sse-laptop.lan)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
 (Exim 4.100.1) (envelope-from <sim@shangen.org>)
 id 1xMemT-FnQW0hPtGB2-hP6T; Fri, 30 Oct 2026 05:03:57 +0000
From: Shang En Sim <sim@shangen.org>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org
Cc: Shang En Sim <sim@shangen.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH 2/2] io_uring/poll: cancel all matching requests in one pass
Date: Fri, 30 Oct 2026 00:03:17 -0500
Message-ID: <20261030050319.1448530-3-sim@shangen.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030050319.1448530-1-sim@shangen.org>
References: <20261030050319.1448530-1-sim@shangen.org>
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
X-Smtpcorp-Track: fcDV38W2G6Tl.idCa3tc26CNF.7BJn9QhQDwX
Feedback-ID: 879706m:879706aL5FzMA:879706sz-CVcCaXL
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

With IORING_ASYNC_CANCEL_ALL, __io_async_cancel() calls io_try_cancel()
until nothing is found, and io_poll_cancel() cancels one request per
call, starting each lookup at the beginning of the hash. A cancelled
request stays hashed until its task work runs, so every lookup walks
past the ones already cancelled. Cancelling K of N pending polls visits
about K*N/2 requests in one io_uring_enter(), with uring_lock held.

A single CANCEL_FD|ALL on 80000 polls on one eventfd takes 17.06s,
0.02s with this change. With voluntary preemption the soft lockup
watchdog fires:

  watchdog: BUG: soft lockup - CPU#1 stuck for 26s! [repro:100]
  RIP: 0010:io_cancel_req_match+0x19/0xa0
   io_poll_cancel+0x73/0x170
   io_try_cancel+0x7b/0xf0
   __io_async_cancel+0x41/0x110

Walk the hash once and cancel every match, as io_cancel_remove() does
for futex and waitid. Cancel by user_data only needs its own bucket.
__io_async_cancel() still loops until nothing is found, so a request
that io-wq parks in the poll hash meanwhile is still cancelled.

A cancel that matches one request now walks the whole hash twice instead
of stopping at the match.

Cc: stable@vger.kernel.org
Fixes: 8e29da69fead ("io_uring: add support for IORING_ASYNC_CANCEL_ALL")
Signed-off-by: Shang En Sim <sim@shangen.org>
---
 io_uring/cancel.c |  2 +-
 io_uring/poll.c   | 39 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/io_uring/cancel.c b/io_uring/cancel.c
index 50a65fbc6ff0..e3d9fe8fc982 100644
--- a/io_uring/cancel.c
+++ b/io_uring/cancel.c
@@ -198,7 +198,7 @@ static int __io_async_cancel(struct io_cancel_data *cd,
 			break;
 		if (!all)
 			return ret;
-		/* futex and waitid return how many they cancelled */
+		/* poll, futex and waitid return how many they cancelled */
 		nr += max(ret, 1);
 	} while (1);
 
diff --git a/io_uring/poll.c b/io_uring/poll.c
index 4f04bda42f7f..9b73b0d88a0e 100644
--- a/io_uring/poll.c
+++ b/io_uring/poll.c
@@ -827,12 +827,47 @@ static int io_poll_disarm(struct io_kiocb *req)
 	return 0;
 }
 
+/*
+ * Cancel every request matching @cd in one pass. Cancelled requests stay
+ * hashed until their task work runs, so finding them one at a time would
+ * walk past all the earlier ones on each lookup.
+ */
+static int io_poll_cancel_all(struct io_ring_ctx *ctx, struct io_cancel_data *cd)
+{
+	unsigned int nr_buckets = 1U << ctx->cancel_table.hash_bits;
+	unsigned int i = 0;
+	struct hlist_node *tmp;
+	struct io_kiocb *req;
+	int nr = 0;
+
+	if (!(cd->flags & (IORING_ASYNC_CANCEL_FD | IORING_ASYNC_CANCEL_OP |
+			   IORING_ASYNC_CANCEL_ANY))) {
+		/* keyed by user_data, so only one bucket can match */
+		i = hash_long(cd->data, ctx->cancel_table.hash_bits);
+		nr_buckets = i + 1;
+	}
+
+	for (; i < nr_buckets; i++) {
+		struct io_hash_bucket *hb = &ctx->cancel_table.hbs[i];
+
+		hlist_for_each_entry_safe(req, tmp, &hb->list, hash_node) {
+			if (!io_cancel_req_match(req, cd))
+				continue;
+			io_poll_cancel_req(req);
+			nr++;
+		}
+	}
+	return nr ?: -ENOENT;
+}
+
 static int __io_poll_cancel(struct io_ring_ctx *ctx, struct io_cancel_data *cd)
 {
 	struct io_kiocb *req;
 
-	if (cd->flags & (IORING_ASYNC_CANCEL_FD | IORING_ASYNC_CANCEL_OP |
-			 IORING_ASYNC_CANCEL_ANY))
+	if (cd->flags & (IORING_ASYNC_CANCEL_ALL | IORING_ASYNC_CANCEL_ANY))
+		return io_poll_cancel_all(ctx, cd);
+
+	if (cd->flags & (IORING_ASYNC_CANCEL_FD | IORING_ASYNC_CANCEL_OP))
 		req = io_poll_file_find(ctx, cd);
 	else
 		req = io_poll_find(ctx, false, cd);
-- 
2.56.0

