Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD404119F7
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092725; cv=none; b=ZbzpVk/Neq9TdcX1d2mHZsL0UocyTFpDPvMEj7F48lZnemYlvmB5di4ioy2F6jtm+e9kgf9JWoQurryh/KaUE9dcDAxIKY0BvWWVWzpeWTYtHi6esuB4hfTp8m/IHqs/N1q7QV50HOai8h+xW/tGVx9fEGA00JM4qiZBYUIw/Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092725; c=relaxed/simple;
	bh=wLVyeuIuzZR8O1kBnia2ADUf75j876J5bxRspm5Ds4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pJmGEN7wl1XWVtFeJR0Rs8MSx4Anfl5FOpBTBkFrBkxW/xEiGGnmH/ia9h0wHrT1f9oriqdOkSV75WvUHj2gy2ECz+yAqOgbNX0OQeYhqWtTWaLnlgfv1QvqKjXFaOCXJNVAcmSiuhY8aRPRD3I0a8x7IJmyt49q2krbiAwtI10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=MQp/sjEu; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="MQp/sjEu"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93e7ad9f78dso663977485a.1
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092723; x=1792697523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bXDG27JKSkh7z7IdAPJxXWokkyyPPRdtSlnILtWCOfQ=;
        b=MQp/sjEuranIRj6QcwKkNjIOjMRRP82ekNal4Jnt0lgkRhO/A9gOeqg0Yz0z7h/qOz
         jOX+FTwSUTs7+gXf6W7aiXBXeXHn0MDSwYJnk7ZrC4Bme2QvP8v68WIpW7w2bIoU8Gzj
         ihWNjwYEze2HfVnfnLa9Da39QL8Ua0gQJWfNkHyWvIBXy+LCwnLL7LUqH8nfhhz8zkyP
         yhv3tev7d1R/tGluyhzOcMR/k/mGyJ5DJHCXTY4aR713duMUyQQVVcReAFYjszulWJLO
         paU49cb8iM9G+2itudFkNIiXOZKW3U6WzUSujhWyNzqK1TUR64lrexT0V/N2WT7TfCTu
         akLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092723; x=1792697523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXDG27JKSkh7z7IdAPJxXWokkyyPPRdtSlnILtWCOfQ=;
        b=LcnG5cINeOB8hBLS32DXmQgw84jDdZB+zvItYky5pt6EIcI64bSGpBojTmswS45jcE
         LnXHePSC/zDxqXQPLsZzbIPS7YqOyLYuOAKJ+kcjE8Kay1FYm3qIIlyw127DUJy8o5Nl
         IAbc5XS3e8OohcoF+FabmhuZ49HBA+v+E7Zd7xAeVWzUTe12o2F7jtvlVfz8i4B9vQel
         0O9fwtUvbVOpZY3nP8aqAEVNmHpHV2AgzpLbxmwu+0axr1ojGEm2Ked5xXc3gh6m9ggv
         V4cYYvNemH5EyN4p1mjj6GHCAnMoJpWj1zoQvXOP2MvDjKuIeiNK8xcbCTJCbaxPQ4WW
         AmJw==
X-Gm-Message-State: AFq9FYL3BoegfSq2Ud7mIGhOKVedRnMQ8BaW6UBphQtNCrtaSjzTB2Mo
	DosOmT40UBlt2pkR6cdu3xlejHOLZUMxFNKrph5dTappCknDh4kDoEiKOXe0rmdF+9N6O9OxIRL
	szXyn
X-Gm-Gg: AYBFou2Er2wGr6CBDU/Aq40jG+QnMNMT3nHg46/xdnNys2zWsJfLEfRJzzEda/6P92t
	/1jrnL2HDpJg3W/H170KUflGWZ2CZg9eKUEy0hrc85cLvZsfRhWNvKhTAPLjTuOz+WhERlG7piv
	sGO1TxLh0wU2b59NAHVeHHdC5OW5vG5NdM3mGbTBhO6NybLpOgarwi+slYwtI0PCfR/GU7Kol4m
	kLLL+l20RofVUu5QoK7I7RSO9Q6Usan2vC+6/pBAFlWkTVKm8/cWjy6H/dqUZfKaIRsYKMnqw7A
	1O9FZUcIPsSOu4YY8xvwWyJWIw5Abxn/lOomDHyBP+A5z0VJp6uW3WZO8WSFUoWRKn4RH3iPDvB
	mbS0sPzTYxqx56fAjhRnvzdhvDYqixuzMHsXLAVrD+pA3sn5qe2Rl/6Gx9tpWHZTHdEOq0sWgih
	f5/DEO4g8HA9edzHApINijwYG5eY198hhODyD65SdMBJMRfDO7MMvNooxoZ2EO419J8cqMZYFHH
	RW2NENuyAk9sas=
X-Received: by 2002:a05:620a:40c4:b0:93f:116:9873 with SMTP id af79cd13be357-93f01169894mr1289999785a.7.1792092723353;
        Thu, 15 Oct 2026 12:32:03 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.253])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a16b5d7sm13104185a.12.2026.10.15.12.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:32:02 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:51 +0000
Subject: [PATCH 27/43] io_uring/register: keep 128b SQEs intact on resize
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-27-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092659; l=3673;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=wLVyeuIuzZR8O1kBnia2ADUf75j876J5bxRspm5Ds4M=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKk0iaXsrDj47ih9pdU7kX+gUBWQtAaC8OmokExzELboHm5SZAEVVip0eHLqUyiRVPzS6qZsM+2
 Zmh/WUTwIsAM=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

On a ring with IORING_SETUP_SQE_MIXED a 128b SQE takes two entries that
have to be contiguous in memory, io_init_req() fails it with -EINVAL if
it starts on the last entry of the SQ ring. The entry a pending SQE ends
up in after IORING_REGISTER_RESIZE_RINGS depends on the size of the new
ring, and nothing takes care of that. With four entries instead of eight,
a 128b SQE which was fine in entries 3 and 4 is split up between entry 3
and entry 0. The resize succeeds, and the request fails later on.

If the ring has an SQ array, the second half is also taken from the
wrong place unless the array happens to map the following index to the
following entry. The submission side doesn't look at the array for the
second half.

Do what is done for 32b CQEs on IORING_SETUP_CQE_MIXED rings: fail the
resize with -EOVERFLOW if a 128b SQE would wrap. And copy the second half
from where it is.

Fixes: 1cba30bf9fdd ("io_uring: add support for IORING_SETUP_SQE_MIXED")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/register.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/io_uring/register.c b/io_uring/register.c
index bce4473dc2dd..2ce36623e25a 100644
--- a/io_uring/register.c
+++ b/io_uring/register.c
@@ -496,6 +496,17 @@ static void io_register_free_rings(struct io_ring_ctx *ctx,
 			 IORING_SETUP_CQE32 | IORING_SETUP_NO_MMAP | \
 			 IORING_SETUP_CQE_MIXED | IORING_SETUP_SQE_MIXED)
 
+static bool io_sqe_is_128(struct io_ring_ctx *ctx,
+			  const struct io_uring_sqe *sqe)
+{
+	u8 opcode = READ_ONCE(sqe->opcode);
+
+	if (!(ctx->flags & IORING_SETUP_SQE_MIXED) || opcode >= IORING_OP_LAST)
+		return false;
+	opcode = array_index_nospec(opcode, IORING_OP_LAST);
+	return io_issue_defs[opcode].is_128;
+}
+
 static int io_register_resize_rings(struct io_ring_ctx *ctx, void __user *arg)
 {
 	struct io_ctx_config config;
@@ -506,6 +517,7 @@ static int io_register_resize_rings(struct io_ring_ctx *ctx, void __user *arg)
 	struct io_rings_layout *rl = &config.layout;
 	u32 *o_sq_array, *n_sq_array = NULL;
 	bool cqe32_tail = false;
+	unsigned int sqe128_src = 0;
 	int ret;
 
 	memset(&config, 0, sizeof(config));
@@ -605,12 +617,19 @@ static int io_register_resize_rings(struct io_ring_ctx *ctx, void __user *arg)
 	if (tail - old_head > p->sq_entries)
 		goto overflow;
 	for (i = old_head; i != tail; i++) {
+		bool sqe128_tail = sqe128_src;
 		unsigned int dst, src;
 		size_t sq_size;
 
 		dst = i & (p->sq_entries - 1);
 		src = i & (ctx->sq_entries - 1);
-		if (n_sq_array) {
+		if (sqe128_tail) {
+			/* it follows the first half, whatever the array says */
+			src = sqe128_src;
+			sqe128_src = 0;
+			if (n_sq_array)
+				WRITE_ONCE(n_sq_array[dst], dst);
+		} else if (n_sq_array) {
 			src = READ_ONCE(o_sq_array[src]);
 			if (unlikely(src >= ctx->sq_entries)) {
 				WRITE_ONCE(n_sq_array[dst], UINT_MAX);
@@ -619,6 +638,19 @@ static int io_register_resize_rings(struct io_ring_ctx *ctx, void __user *arg)
 			WRITE_ONCE(n_sq_array[dst], dst);
 		}
 
+		/*
+		 * A 128b SQE on a SQE_MIXED ring takes two contiguous entries
+		 * and must not wrap. A smaller ring may place it on the last
+		 * entry, fail the resize if that happens.
+		 */
+		if (!sqe128_tail && i + 1 != tail &&
+		    src < ctx->sq_entries - 1 &&
+		    io_sqe_is_128(ctx, &o.sq_sqes[src])) {
+			if (dst == p->sq_entries - 1)
+				goto overflow;
+			sqe128_src = src + 1;
+		}
+
 		sq_size = sizeof(struct io_uring_sqe);
 		if (ctx->flags & IORING_SETUP_SQE128) {
 			dst <<= 1;

-- 
2.55.0

