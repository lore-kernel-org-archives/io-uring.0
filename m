Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740241;
	b=PsO1MDet6hW2WOu/42b+vebKE38wEupJq8f0buwUDrutOcBeEKjEIYwLLUggLyaXpTYH
	 ifmTCpFxZynMWL3FUS6SxoHTy8Ts6z4C+lD+lH0PNuD3bGLGjLohuYD3/mpbGtUOT76cp
	 aibB6f835VVcNdFg239eXlb/vi52QrqBex6T+dDcrOsEguALdHABwN5kg43Mh843tVvFm
	 cQDr+6RrCB3Oe5ucTeKp/IUlkR3UKWN7uCeOz6ZWWMyG7K/qlnzloKRLaDOCi+UaEj+9D
	 A1pPtcp4XoT2A97ugrB7vyuOzi1Af00uUMOdIP5r2VlcVqSEYHfC4jrhOAYdjdpcRqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=A7yet7bNUGU/RyXzncjxH7DLySnxGsONxDgtEr4m4dg=;
	b=d7F8mkldBnpWzHGIY8nzjooJn58XcjRro70UC637YrmOWFChzRftUZWSSYGuU4iaMMOZ
	 Tm6lQb52TPmgVHMgLtNt4qeZQcGNSdYy3xufbLicRuJC5MsXjlncO3oKTD/x4fgSXYuGi
	 cnzFPxjFjz2BimbUpqjmGnlUDQ7oPCsQ5qfwexmc4mTV/fqPOnZ9zaELSBhThaBLWg4R2
	 Kew3bqPxGydQnY0HdT+LdtzodjM9muqLAcy0LYUIhiOWXw8Z8gAaLQ8L+2kfpbWd+59ty
	 FEkNO5dQslizBu1ftsHvTM0WpQy4tZtX5md8ArcepHSbMfEjlSMuLeA3qKsZB+eUUPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Ounw8mkg;
	arc=none smtp.remote-ip=209.85.208.99
Received: from mail-ed1-f99.google.com (mail-ed1-f99.google.com [209.85.208.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F85606A32D
	for <io-uring@vger.kernel.org>; Tue,  3 Nov 2026 21:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98F85606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Ounw8mkg
Received: by mail-ed1-f99.google.com with SMTP id 4fb4d7f45d1cf-6b1bfa1c11bso816038a12.2
        for <io-uring@vger.kernel.org>; Tue, 03 Nov 2026 13:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793740239; x=1794345039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A7yet7bNUGU/RyXzncjxH7DLySnxGsONxDgtEr4m4dg=;
        b=Ounw8mkgFtf6+zH3alwTPHKUO/74YIZJGseoLYrfw6gV0XbXrarH92plKAN0HRJi57
         FIiPfPlivLg2rswJSEMcZWe04RaKEFJ2q99S+ZQ7nPtbIDLndpQx4C9I9xX9Om5q8JzM
         6UsO9ceubdM+4oSDTpkzTpAiJJ+Ustuhcphw+b0JD9q/rJaNRMaEAvLKN4b3uXMbTptz
         gJ7ImwXkMD+ofePSQnB7DJzp5ZFjh9mTxbCwuKDmFH0/jESXuDE/rSLBoK7v/uiiGS3D
         jh62QVkYoTh5IWjCqk3bvJB+nsPRI4AKpV3G9ub3tFU4PRQ63YKvWu09iNqHCvYbh8yA
         gPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793740239; x=1794345039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A7yet7bNUGU/RyXzncjxH7DLySnxGsONxDgtEr4m4dg=;
        b=jrplan8ojtUQBKyJa+4NlIs2/La5CjixQ0KALPeKaQ8clmP0ibH93PVx+waJpxFtZ6
         IvwXUlwqihkL3+LQCoZB6uY0ORR/tjUgvVu54N9QopPj5uO50k4SftnJxoONBgAhXynf
         7WVq91BwfWess6PSOJtJRITLwoDEaAxC03xBg3T3wQDNa77JpJJoSZiQ1qxG7ZhUl76T
         OS/Tt9i86Q+dylridm6hs3NZrpkGIKB6igIv5ybPcPqDvtv/uwngnfGzzOBC5nJirAwO
         grHGsbjR3tqT8L1TAVpVHK5rqTgAqgvf4r7P2DIexNy6K9sfkyYbLFV3Hj2uE4jrR0WE
         58SA==
X-Gm-Message-State: APuU4Z8ERtQA7bZx0/vXnLx4K6nCHse3aUbkjGZY6O+M1rgM96xYxEf2
	Ib075rQDMABnznqQMJFCzMc8pJlu9hc6rhwCmUEUfAjozJNu346bKWXL/RmUkveROgmVwfLtcNr
	lsVDJS4ZQem8c79y3q90eqXis6H7YfQKThqPL2W7lukUg7Cb7PNPm
X-Gm-Gg: AYBFou32Qyd6I0p26xL/ec1mdFo6qo1N1eUv/XSQEEe8Dj4Jk+Y+cmcCnAUZxc1Jknq
	a40sgayOe/zb9+f70u4oTXOYAXyCZ/KG8UeZd95JML0LeKJYo4ehim2otsiJkZ+c1WpkG8JeA3g
	b6+ThuhZgD8HOtpXnTKypGMSRR+fTbcjFQ7VS9PB/2hGHoWWyzh/TdRJCu++2bfgmlK89qHGiDJ
	yHp+s4z2EiW7ZTcu0+UYnLOwr/44GPPlTQoDdJ/ueAjVk8iZerJ7/3+A8Y9qX7UaCMmGlKHY7Rj
	cfySHbgWrdZm3pGfVChS0QnVlwKExkU3LuvNfYJ/lYvQ+le8emhPGXgorffms8His9jpPiWfXwH
	FFQ3nBBPGqKQ+pyAP
X-Received: by 2002:a05:6402:c4cd:10b0:6b1:b5b8:b695 with SMTP id 4fb4d7f45d1cf-6b4d32859c0mr11809190a12.0.1793740238934;
        Tue, 03 Nov 2026 13:10:38 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 4fb4d7f45d1cf-6b55ac1beefsm12173a12.4.2026.11.03.13.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:10:38 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [IPv6:2620:125:9025:23::204])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 90CCB4041F;
	Tue,  3 Nov 2026 14:10:36 -0700 (MST)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 8DC1DE40437; Tue,  3 Nov 2026 14:10:36 -0700 (MST)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 1/4] io_uring: split io_uring_alloc_async_data()
Date: Tue,  3 Nov 2026 14:10:28 -0700
Message-ID: <20261103211031.592745-2-csander@purestorage.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103211031.592745-1-csander@purestorage.com>
References: <20261103211031.592745-1-csander@purestorage.com>
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

io_uring_alloc_async_data() accepts an optional struct io_alloc_cache *
argument to use for the allocation in place of kmalloc(). All callers
either always pass NULL or a non-NULL io_alloc_cache. However, the
compiler still emits a NULL check for callers passing a non-NULL
io_alloc_cache. Split out a separate io_uring_alloc_cached_async_data()
for the non-NULL io_alloc_cache cache. This avoids the NULL check at the
cost of duplicating the code to set REQ_F_ASYNC_DATA.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 io_uring/io_uring.h  | 23 ++++++++++++++---------
 io_uring/net.c       |  6 +++---
 io_uring/rw.c        |  2 +-
 io_uring/timeout.c   |  2 +-
 io_uring/uring_cmd.c |  2 +-
 io_uring/waitid.c    |  2 +-
 6 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/io_uring/io_uring.h b/io_uring/io_uring.h
index 32247529076c..a36a177559f4 100644
--- a/io_uring/io_uring.h
+++ b/io_uring/io_uring.h
@@ -335,21 +335,26 @@ static inline ssize_t io_fixup_restart_res(ssize_t ret)
 	default:
 		return ret;
 	}
 }
 
-static inline void *io_uring_alloc_async_data(struct io_alloc_cache *cache,
-					      struct io_kiocb *req)
+static inline void *
+io_uring_alloc_cached_async_data(struct io_alloc_cache *cache,
+				 struct io_kiocb *req)
 {
-	if (cache) {
-		req->async_data = io_cache_alloc(cache, GFP_KERNEL);
-	} else {
-		const struct io_issue_def *def = &io_issue_defs[req->opcode];
+	req->async_data = io_cache_alloc(cache, GFP_KERNEL);
+	if (req->async_data)
+		req->flags |= REQ_F_ASYNC_DATA;
+	return req->async_data;
+}
 
-		WARN_ON_ONCE(!def->async_size);
-		req->async_data = kmalloc(def->async_size, GFP_KERNEL);
-	}
+static inline void *io_uring_alloc_async_data(struct io_kiocb *req)
+{
+	const struct io_issue_def *def = &io_issue_defs[req->opcode];
+
+	WARN_ON_ONCE(!def->async_size);
+	req->async_data = kmalloc(def->async_size, GFP_KERNEL);
 	if (req->async_data)
 		req->flags |= REQ_F_ASYNC_DATA;
 	return req->async_data;
 }
 
diff --git a/io_uring/net.c b/io_uring/net.c
index 533afd335627..e5f7c13519fb 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -187,11 +187,11 @@ static void io_netmsg_recycle(struct io_kiocb *req, unsigned int issue_flags)
 static struct io_async_msghdr *io_msg_alloc_async(struct io_kiocb *req)
 {
 	struct io_ring_ctx *ctx = req->ctx;
 	struct io_async_msghdr *hdr;
 
-	hdr = io_uring_alloc_async_data(&ctx->netmsg_cache, req);
+	hdr = io_uring_alloc_cached_async_data(&ctx->netmsg_cache, req);
 	if (!hdr)
 		return NULL;
 
 	/* If the async data was cached, we might have an iov cached inside. */
 	if (hdr->vec.iovec)
@@ -1846,11 +1846,11 @@ int io_connect_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 
 	conn->addr = u64_to_user_ptr(READ_ONCE(sqe->addr));
 	conn->addr_len =  READ_ONCE(sqe->addr2);
 	conn->in_progress = conn->seen_econnaborted = false;
 
-	addr = io_uring_alloc_async_data(NULL, req);
+	addr = io_uring_alloc_async_data(req);
 	if (unlikely(!addr))
 		return -ENOMEM;
 
 	return move_addr_to_kernel(conn->addr, conn->addr_len, addr);
 }
@@ -1944,11 +1944,11 @@ int io_bind_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 		return -EINVAL;
 
 	uaddr = u64_to_user_ptr(READ_ONCE(sqe->addr));
 	bind->addr_len =  READ_ONCE(sqe->addr2);
 
-	addr = io_uring_alloc_async_data(NULL, req);
+	addr = io_uring_alloc_async_data(req);
 	if (unlikely(!addr))
 		return -ENOMEM;
 	ret = move_addr_to_kernel(uaddr, bind->addr_len, addr);
 	if (unlikely(ret))
 		return ret;
diff --git a/io_uring/rw.c b/io_uring/rw.c
index 61bd0641dd77..4a9538157d94 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -191,11 +191,11 @@ static void io_req_rw_cleanup(struct io_kiocb *req, unsigned int issue_flags)
 static int io_rw_alloc_async(struct io_kiocb *req)
 {
 	struct io_ring_ctx *ctx = req->ctx;
 	struct io_async_rw *rw;
 
-	rw = io_uring_alloc_async_data(&ctx->rw_cache, req);
+	rw = io_uring_alloc_cached_async_data(&ctx->rw_cache, req);
 	if (!rw)
 		return -ENOMEM;
 	if (rw->vec.iovec)
 		req->flags |= REQ_F_NEED_CLEANUP;
 	rw->bytes_done = 0;
diff --git a/io_uring/timeout.c b/io_uring/timeout.c
index fa7b0d9a81d6..fa54846ed4ce 100644
--- a/io_uring/timeout.c
+++ b/io_uring/timeout.c
@@ -638,11 +638,11 @@ static int __io_timeout_prep(struct io_kiocb *req,
 	if ((flags & IORING_TIMEOUT_MULTISHOT) && off > 0)
 		timeout->repeats = off;
 
 	if (WARN_ON_ONCE(req_has_async_data(req)))
 		return -EFAULT;
-	data = io_uring_alloc_async_data(NULL, req);
+	data = io_uring_alloc_async_data(req);
 	if (!data)
 		return -ENOMEM;
 	data->req = req;
 	data->flags = flags;
 
diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
index b5486b56ee0c..6f417bda52ea 100644
--- a/io_uring/uring_cmd.c
+++ b/io_uring/uring_cmd.c
@@ -188,11 +188,11 @@ int io_uring_cmd_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	    !!(req->flags & REQ_F_BUFFER_SELECT))
 		return -EINVAL;
 
 	ioucmd->cmd_op = READ_ONCE(sqe->cmd_op);
 
-	ac = io_uring_alloc_async_data(&req->ctx->cmd_cache, req);
+	ac = io_uring_alloc_cached_async_data(&req->ctx->cmd_cache, req);
 	if (!ac)
 		return -ENOMEM;
 	if (ac->vec.iovec)
 		req->flags |= REQ_F_NEED_CLEANUP;
 	ioucmd->sqe = sqe;
diff --git a/io_uring/waitid.c b/io_uring/waitid.c
index 986fb46639e8..0d3c248f375c 100644
--- a/io_uring/waitid.c
+++ b/io_uring/waitid.c
@@ -292,11 +292,11 @@ int io_waitid_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	struct io_waitid_async *iwa;
 
 	if (sqe->addr || sqe->buf_index || sqe->addr3 || sqe->waitid_flags)
 		return -EINVAL;
 
-	iwa = io_uring_alloc_async_data(NULL, req);
+	iwa = io_uring_alloc_async_data(req);
 	if (unlikely(!iwa))
 		return -ENOMEM;
 	iwa->req = req;
 
 	iw->which = READ_ONCE(sqe->len);
-- 
2.56.0

