Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316829;
	b=pbRD++RVkqBU9S9nk3x38hjq9tYd7Hv8As+fxxPvL43o82Nd3fhkXZE0tQv3gEt22PPC
	 gjFSBxk4c/5MbZ1EUe7l7tQqb0f3xeS+WyxI6NFzpQ9B69MSJLPUp6Hiu0jcEYJLONc8/
	 SjkNVlkGzEDgz+z0nuXxYk0QfzIrSqKg5V1YYQuLX7AbEQcaKHWDzKsxdSbKJfng5CgdS
	 HprtUPlgiJX+HxXU58ayovfGOyzapYgiFhZUyJaZxBFuR0G/8dTMTeDkXOTBAWGx7Jmet
	 QfvuuVfKG+VVOkmyVSl0utWdQvVjfIe3yI75rSxpk/KuDigYUQnLQn49JxNr/jnkjHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316829;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=SIYtpsSXUKLmHj3y4sdEOcfIe52+dEJG+otddOtS/UE=;
	b=uc2b7GXYJ5dnF90EtgenGlQgNATizGE6Z1sdUoC49KlyoDGCwRSzkrK75/TVUpeVOxoE
	 xAmAhPVrWBl8ms9NoDMQAofJz5WRLmylfnCRYMc3Ko0pm26XC2VKMmgYmhHH3hACSNxmo
	 LQtt6xzaD/Cgp3cxAdSZp5yo8WVYY92AA8xabF3MCSeOGvH/C5QDSKcUusBV+Tc1v4wFf
	 eRRGOA4KjIfYXx6rAcS2DI9R6yiP+5qMkpJE7hBKu0XoyaepFE6A9FI3RdoL1u4xJMgaz
	 TXtI16cqYgmknO+QkJVXrKby9x+PknTb/M3KRFUA8DTAGFFxSFAgjXfJ2k0lgTBk66A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hh6L3gkO;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hUMLiVhB;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46AA60A5BE8
	for <io-uring@vger.kernel.org>; Tue, 10 Nov 2026 13:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E46AA60A5BE8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hh6L3gkO;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hUMLiVhB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794316827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SIYtpsSXUKLmHj3y4sdEOcfIe52+dEJG+otddOtS/UE=;
	b=Hh6L3gkOReoFbhs5zs0CTGhzR7/VIdf6BBFiibBlRWHq97nRnIXN4IFiTNrgDLXBfVgLya
	3hB5REsQLdWY7hTdBZHYq5r1Z6/I3Vs0Blug6HIsC8w3lRHyJQPiyEElYxmCP72tZ3w4V2
	Q3j6Mcdtx60jJkjOBbOOymANTMX6qyM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-Lon9Kw-jO8-8IPqjaJP_Iw-1; Tue, 10 Nov 2026 08:20:26 -0500
X-MC-Unique: Lon9Kw-jO8-8IPqjaJP_Iw-1
X-Mimecast-MFC-AGG-ID: Lon9Kw-jO8-8IPqjaJP_Iw_1794316825
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c4d1684d1b3so184260666b.1
        for <io-uring@vger.kernel.org>; Tue, 10 Nov 2026 05:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794316825; x=1794921625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SIYtpsSXUKLmHj3y4sdEOcfIe52+dEJG+otddOtS/UE=;
        b=hUMLiVhB3b5felEGYP7ZkbJVKx0PY/bkp9rLFsBttkA/1svEW9RMoxcwcCKtPo5Ce+
         ViRj8EatoIkNF/SGH/N9b3+dU50yutnldBAIgqS/sy5/cRMI6jy28J5/mQ8D5fQtTZDq
         0JeJtS3U9jja5w0/fJtkyLlq3c8M2vzWCFYzJje3BALD/hUbcRpT5MHmBJfTg5WVRqeM
         UceObruuEzGQUnRtwYma40rbdkHEZdward9SYs3UqPm8X7sD3etehy0Fj/lcBk4+qqQu
         3BjYbqD76VecfbAcB9yGB9ciwPTmMCeJOEWMMRopch6LnP6OtGLXlPhNekgTSobFlIOV
         hLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316825; x=1794921625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SIYtpsSXUKLmHj3y4sdEOcfIe52+dEJG+otddOtS/UE=;
        b=YOWYbsAcHddStsgmWV9tiMIKGmMf51AXslmF9w7+uoIjklBQ5RgvYX1S+Rj4LRiW3K
         d9Byx7BEDw5sY3d0Zwij3OnIHCstXyZ2dncKDPSewcXuQHAWOdk5BeAlO0AoM9UhsHKe
         q6LaRJUG7fzXcPXJV/fVebPI3uXDDvbhHOPSt0Z7ZtQG/yhHjiuiomgQ3GraoUelZOa2
         D046zfNv8shJAp4jIGbrf/ewcj4jIoiKDoPaYC8K6+4BNrkewQp6czwz8fnFbRiddlOf
         AGsH1yiGptTTcSGuv/VXR31tKt0sizZDAV1MnGxnmOk1GEnXePBYvqP0uW1Jsq/Nh8qE
         2VRA==
X-Forwarded-Encrypted: i=1; AL+hErF0kzQnQIZOquudyD1fEC7M1yjfy6lLMGnI79xRmkD7lkk927njrFL3UV7RkSkxUbStHYJGed9H1w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8n5GEcXfu8ldql2DrJ49LPLN44YhmcU4CYsCIx2yG0PH0mQ2Fg
	BNmowHn6GmEN7ShZKHkehNWafb7mXeSpIYnilac4tgg4npBZJM+geeyuPcxrd2ySUzPM1hbSyPh
	YuEG+02A1yQw11oSFtl/bWPDcDkBSu1tEAdG6p/A1ZhuFCuMvQ/Yd1+Mon9Xm
X-Gm-Gg: AYBFou021t5hY/xOotCUupldmpk8dm+ClNAgzkbk25gwZzuWTiGi/+XLVZmFeqyyhBD
	WJi+seqDN+Vj/Z6v7j+8QkfoNGpyIVohjWva3qggZH4pNO2SDBCGWve0tUD3RWt7IQwtB/FZxnT
	uHiBm7aebAIG41Wl9AdeZnvsfFcIhV7IhyLMTTJ8EBKYjdcEmKUZv4EIdAqFH/MhGaRmTnmaKcA
	LnxdmZiXp8M+c5oNXzNKEUcC1EQR+OY65R4KeqoNrm+FPIUW0dmleeBhjLPNRp3xN/sRxAZwGye
	4gJZgNj+sxeeAgCcgEuOy0lKeTkxLYs+jC1fNt6GAOOh95pIpAkvsk036zVPPF2BEgHfUs48X+4
	Gxw+JX6R2D/hAP9OO4qS+ZjmndJiwQI2/9r0WipIq7osn3jLu7XhXXbGKeUWjFzqf5zEpL5LnNZ
	L/MrpxJczphiVf65ETd9H/mILm/XKfes+uNFWZ63gEd3wYRbypXMbBKSG5Fs3IEdhvMbmTjWMxq
	sC5ibQyzeP01z8dQDO9+bnR56KTxvs+AY58znIB0DeBMxOXjz36
X-Received: by 2002:a17:907:96ab:b0:c50:5a93:3bd7 with SMTP id a640c23a62f3a-c505a93483fmr107228766b.3.1794316824583;
        Tue, 10 Nov 2026 05:20:24 -0800 (PST)
X-Received: by 2002:a17:907:96ab:b0:c50:5a93:3bd7 with SMTP id a640c23a62f3a-c505a93483fmr107225166b.3.1794316824074;
        Tue, 10 Nov 2026 05:20:24 -0800 (PST)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a5d54bbsm107791166b.48.2026.11.10.05.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:20:22 -0800 (PST)
From: Alex Markuze <amarkuze@redhat.com>
To: Jens Axboe <axboe@kernel.dk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	io-uring@vger.kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 10/12] io_uring/opaque: add IORING_OPAQUE_CREATE
Date: Tue, 10 Nov 2026 13:20:04 +0000
Message-Id: <20261110132006.3280986-11-amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110132006.3280986-1-amarkuze@redhat.com>
References: <20261110132006.3280986-1-amarkuze@redhat.com>
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

Allow an application to populate an immutable object from its own memory,
for example to retain a generated reply for repeated sends. Add CREATE
to IORING_OP_OPAQUE_OBJ; its objects support the same reads, sends and
FREE as received objects.

sqe->addr3 points to the source and len supplies 1 to INT_MAX bytes;
addr and off must be zero. Preparation rejects malformed fields, sizes
beyond the store's object or capture limits, and inaccessible or
overflowing source ranges. Source memory remains valid through execution.

Issue reserves an object slot and page-rounded backing charge, then
copies synchronously under the ring lock. It uses the compaction page
allocator, preferring compound allocations and falling back to smaller
orders. Each allocation owns an extent and part of the reservation.
Copying proceeds by base page and yields between destination allocations.
CREATE fails immediately on budget exhaustion rather than waiting.

Success returns the length, handle and forwarding-only flag; OBJECT_STAT
marks the dense version as compacted. STAT counts the copied bytes. On
failure no handle is published, and cleanup releases the slot, backing
and unused reservation. A large CREATE holds the ring lock through the
copy and can delay other requests of that ring. There is no per-store
pending-request limit.

Signed-off-by: Alex Markuze <amarkuze@redhat.com>
---
 io_uring/opaque.c | 129 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 127 insertions(+), 2 deletions(-)

diff --git a/io_uring/opaque.c b/io_uring/opaque.c
index 4610e212a800..78ae19a6ad82 100644
--- a/io_uring/opaque.c
+++ b/io_uring/opaque.c
@@ -1884,7 +1884,6 @@ int io_opaque_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	    READ_ONCE(sqe->buf_index) || READ_ONCE(sqe->__pad2[0]) ||
 	    cmd > IORING_OPAQUE_AVAILABLE ||
 	    cmd == IORING_OPAQUE_COMPACT || cmd == IORING_OPAQUE_SET_POLICY ||
-	    cmd == IORING_OPAQUE_CREATE ||
 	    (req->flags & (REQ_F_CQE_SKIP | REQ_F_FIXED_FILE)))
 		return -EINVAL;
 	op = io_opaque_req_alloc(req, store);
@@ -1899,6 +1898,21 @@ int io_opaque_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	op->offset = READ_ONCE(sqe->off);
 	op->length = READ_ONCE(sqe->len);
 	op->addr = u64_to_user_ptr(READ_ONCE(sqe->addr3));
+	if (cmd == IORING_OPAQUE_CREATE) {
+		u64 pointer = READ_ONCE(sqe->addr3);
+
+		if (op->handle || op->offset || !op->length ||
+		    op->length > INT_MAX || !pointer)
+			return -EINVAL;
+		if (op->length > store->config.max_object_size ||
+		    ALIGN((u64)op->length, PAGE_SIZE) > io_opaque_rx_limit(store))
+			return -EMSGSIZE;
+		if (check_add_overflow(pointer, (u64)op->length, &end) ||
+		    pointer > ULONG_MAX || end > ULONG_MAX ||
+		    !access_ok(op->addr, op->length))
+			return -EFAULT;
+		return 0;
+	}
 	if (check_add_overflow(op->offset, (u64)op->length, &end))
 		return -EOVERFLOW;
 	if (cmd <= IORING_OPAQUE_READ_OBJECT || cmd == IORING_OPAQUE_AVAILABLE) {
@@ -2046,12 +2060,110 @@ static int io_opaque_stat(struct io_opaque_req *op)
 	return io_opaque_stat_copy(op, &stat, sizeof(stat));
 }
 
+/* Construction is synchronous under the ring lock, like READ_OBJECT copies. */
+static int io_opaque_create_build(struct io_opaque_req *op)
+{
+	struct io_opaque_store *store = op->store;
+	struct mem_cgroup *old = set_active_memcg(store->memcg);
+	u64 done = 0;
+	int ret = 0;
+
+	while (done < op->length) {
+		u64 pages_left = DIV_ROUND_UP_ULL(op->length - done, PAGE_SIZE);
+		struct io_opaque_extent *extent;
+		unsigned int order;
+		struct page *page;
+		u32 chunk, written = 0;
+
+		page = io_opaque_dest_page(store, pages_left, &order);
+		if (!page) {
+			ret = -ENOMEM;
+			goto out;
+		}
+		chunk = min_t(u64, op->length - done, PAGE_SIZE << order);
+		extent = io_opaque_extent_new(store, page, 0, chunk, done, true);
+		if (IS_ERR(extent)) {
+			put_page(page);
+			ret = PTR_ERR(extent);
+			goto out;
+		}
+		op->create_reserved -= page_size(page);
+		extent->backing->copied = true;
+		list_add_tail(&extent->list, &op->data->extents);
+		while (written < chunk) {
+			u32 bytes = min_t(u32, chunk - written, PAGE_SIZE);
+			unsigned long left;
+			void *mapped;
+
+			mapped = kmap_local_page(page + (written >> PAGE_SHIFT));
+			left = copy_from_user(mapped, op->addr + done + written, bytes);
+			kunmap_local(mapped);
+			atomic64_add(bytes - left, &store->copied);
+			if (left) {
+				ret = -EFAULT;
+				goto out;
+			}
+			written += bytes;
+		}
+		done += chunk;
+		op->data->length = done;
+		cond_resched();
+	}
+	ret = io_opaque_vector(op->data);
+	if (!ret)
+		op->data->dense = true;
+out:
+	set_active_memcg(old);
+	return ret;
+}
+
+static int io_opaque_create(struct io_opaque_req *op, unsigned int issue_flags)
+{
+	struct io_ring_ctx *ctx = op->req->ctx;
+	u64 charge = ALIGN((u64)op->length, PAGE_SIZE);
+	u64 object_flags = 0;
+	struct mem_cgroup *old;
+	int ret;
+
+	io_ring_submit_lock(ctx, issue_flags);
+	if (READ_ONCE(op->store->dead)) {
+		ret = -ESHUTDOWN;
+		goto unlock;
+	}
+	old = set_active_memcg(op->store->memcg);
+	op->data = io_opaque_data_alloc();
+	set_active_memcg(old);
+	if (!op->data) {
+		ret = -ENOMEM;
+		goto unlock;
+	}
+	ret = io_opaque_slot_reserve(op);
+	if (ret)
+		goto unlock;
+	if (!io_opaque_charge(op->store, charge, true)) {
+		ret = -ENOBUFS;
+		goto unlock;
+	}
+	op->create_reserved = charge;
+	ret = io_opaque_create_build(op);
+	if (!ret)
+		ret = io_opaque_publish(op, &object_flags);
+unlock:
+	io_req_set_res32(op->req, ret, 0, ret >= 0 ? op->handle : 0, object_flags);
+	if (ret < 0)
+		req_set_fail(op->req);
+	io_ring_submit_unlock(ctx, issue_flags);
+	return IOU_COMPLETE;
+}
+
 int io_opaque_issue(struct io_kiocb *req, unsigned int issue_flags)
 {
 	struct io_opaque_req *op = req->async_data;
 	struct io_opaque_store *store = op->store;
 	int ret;
 
+	if (op->op == IORING_OPAQUE_CREATE)
+		return io_opaque_create(op, issue_flags);
 	io_ring_submit_lock(req->ctx, issue_flags);
 	/* Pair with the cancellation search before any opaque wait enrollment. */
 	if (io_wq_cancel_seen(req, issue_flags)) {
@@ -2224,6 +2336,16 @@ bool io_opaque_cancel_all(struct io_ring_ctx *ctx, struct io_uring_task *tctx,
 	return found;
 }
 
+static void io_opaque_create_release(struct io_opaque_req *op)
+{
+	io_opaque_data_put(op->store, op->data);
+	op->data = NULL;
+	if (op->create_reserved) {
+		io_opaque_uncharge(op->store, op->create_reserved);
+		op->create_reserved = 0;
+	}
+}
+
 void io_opaque_cleanup(struct io_kiocb *req)
 {
 	struct io_opaque_req *op = req->async_data;
@@ -2287,7 +2409,10 @@ void io_opaque_cleanup(struct io_kiocb *req)
 	}
 	if (unlikely(op->vec))
 		io_opaque_vec_cleanup(op);
-	io_opaque_data_put(store, op->data);
+	if (op->op == IORING_OPAQUE_CREATE)
+		io_opaque_create_release(op);
+	else
+		io_opaque_data_put(store, op->data);
 	io_opaque_stream_put(op->stream);
 	lockdep_assert_held(&req->ctx->uring_lock);
 	io_opaque_req_free(req->ctx, op);
-- 
2.34.1

