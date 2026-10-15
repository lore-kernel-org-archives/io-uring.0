Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E340E4CC293
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092754; cv=none; b=JuPiBrw6QRjwG8Ip+R7I8ueob80cOoRlzgnIXFNIc3W1IMuGMrFrbtaYN5XnKVyzRNnTI8ArzwIw1CYuBvSA+UoZ1YehScLlbt74Z+cNu4cea17PvYPrplzBOQEMn5B4fGnsPfwOR+G0muRk7btmbLXY5XLqiSiofL+Tiu600Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092754; c=relaxed/simple;
	bh=5WVKOi1B6P+cI4AselyU7KIMpTfkSJXy6MvbeKE+0Rc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HQvel1kKd5JlbGE5IW2elw+A1QID2WAcvAxN7rDWx+iJU1Okm5cnYMmgYG8q0Q5O9M80QvSVTdcxPgms+RKeqYkq1rq+nI1aozxbajQxZ3/14l/TuFIXjoav7hZtgcVfacHoU9ooKPT0rtanYBEmhWHcayEQbAu8F/ov+PFahXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=YC5Y9yue; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="YC5Y9yue"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93e515769d3so484559785a.3
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092752; x=1792697552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8z+feyns4q8hROoDZt7JKrgvA/JsHrNE6c6J8jbRSkc=;
        b=YC5Y9yueWTfcbnYCXDRkSor2azng7wqiwlVw68T7RKoTl/84/hZfdI1GxN9RYLB8k2
         kZsCVCb70fOEUmFEHMa4vTS0ePehkgi1/QDlNzPgv7YTseW6MqAEWf1j+GCAAh/3LD1S
         ElBni8AWHDKG8Wr3rushmuKb11W5duoTOJ2WdJsBGxNTYfXLo89idkShPJbYE0DSKVFC
         GYf0ccMkSNICpty207chBbgcvL+UR7u3iePbU3Mf1Ila7ZQ5IgYMrXOG3M7t5kBU0H99
         k11Wz+v2w6Gg05tCHI1aRWMuEKbx+XRxlDPYuGTtZMNOUIiWj3UkSDVHlLeqTuukg9PC
         f9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092752; x=1792697552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8z+feyns4q8hROoDZt7JKrgvA/JsHrNE6c6J8jbRSkc=;
        b=05KHLMQU9Db032cFF8qoqaCi7hfDI4ZUxByjZ3i9o02Cw8ELBZOdI4x+MSQk7U35w5
         vQFYk1ED/qWz/jJ4gODS2bNcxCkFJtMfmSVKcttx84t+qF5Bq3zXfOuQ5MqpuuW6t3/d
         tomlgOuwnOoUirekyP7n+CSCB4vIfujlIAVnPI2IW8QAl0w+ELIEOjsYIdrZrSKCmJRg
         mHzprxcrFpclo5cibrdKzuix51kcPgFpDsDHdlwmIwaRTNitDq3x7RwnbHPEfxCdSKS8
         7WG8m8b2y/KbBCV+Ldc+EFYvHAS2+ZA4hFE08zVz/RdPwgVbq3K1phPqZgPyAFykKFxF
         6lOw==
X-Gm-Message-State: AFq9FYJN5Q3+D6zrU1Xxz11zBFhRTi3G9hMbyHZsLG7BYUFUTTlVFyKi
	2Ztq1FhgckqDWoAot6IuLyrnnQT+wuQmw/Mje6hrWv5YDHMBxAj0iyG/qHGQBWwd0hSOItYspXc
	eurhY
X-Gm-Gg: AYBFou2nm4pm1b7SebdpQy2b2XlZ/xgHAjfmA6VEjCDNOc3CuwSpQa3U4pUtAh9pgWP
	bQEl2iOCVpo/R5asFcCwPGyCH/ZF3EgaZF+Dkqx7qyYbXe/RQClQZYOnPmxLPI10ca5vOkW5gtC
	MLugnLBabcgrqvXj0idMYI+PEM/752U/IUEjPyukZtfSd5b7lgUkF7BFfDCf+mVjwoE3KzkyyCr
	dmFO+2NWXR8P3ocZp9g734PUdFuyo5IYaWhLUSBErxcBbCj6rcKkZh6+9qZZoKbxs9IGcYRijAX
	z9SDA0nohQey19otNFM5yD6/GvRelyY0gmuCCezNKmurYmUzqABbQxb+R8vOgWjoRpEnVu05v7n
	FSL/0dZ0soQlTVYysdylwztlu+GGKIJ6PJtoSBVcL5fCGyCh4J5nd3Cc1WX3wZDkMVUyCq6zeLz
	qR1V0dKbzYXut/Xj21xjWerkRuv1t0SUP7D2muvSBXBc3oyjPbRL0cca76PBbrDg32v+BprrdRB
	s7IyvLO4PUjYIY=
X-Received: by 2002:a05:620a:3721:b0:93f:1936:b1fc with SMTP id af79cd13be357-93f1936b9eamr105986285a.78.1792092751704;
        Thu, 15 Oct 2026 12:32:31 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a1b694csm12259385a.40.2026.10.15.12.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:32:31 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:31:05 +0000
Subject: [PATCH 41/43] io_uring/timeout: no ABS update of multishot
 timeouts
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-41-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092660; l=3051;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=5WVKOi1B6P+cI4AselyU7KIMpTfkSJXy6MvbeKE+0Rc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLHvSRcbam4bbmLK5tyI9hrdaxykr0dpLoYcCiv2Nx3IzKwqjthKsMfjtM3lM2PEwEbZD1ekjVA
 MwLmlz8RkZAs=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

IORING_TIMEOUT_MULTISHOT can't be combined with IORING_TIMEOUT_ABS, prep
rejects that, as the request is armed again with the same value each time
it fires. IORING_TIMEOUT_UPDATE doesn't check and takes an absolute time
for a multishot timeout. The first expiry is as asked for, but
io_timeout_complete() then arms the timer with ->mode of the original
request, i.e. it uses the absolute time as the interval. With
CLOCK_MONOTONIC the next expiry is an uptime away, with CLOCK_REALTIME
more than fifty years.

Fail such an update with -EINVAL, and do so before the timeout is
touched.

Fixes: ea97f6c8558e ("io_uring: add support for multishot timeouts")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/timeout.c | 38 ++++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/io_uring/timeout.c b/io_uring/timeout.c
index 90d440a75f28..1cf59c494769 100644
--- a/io_uring/timeout.c
+++ b/io_uring/timeout.c
@@ -321,22 +321,29 @@ static enum hrtimer_restart io_timeout_fn(struct hrtimer *timer)
 	return HRTIMER_NORESTART;
 }
 
-static struct io_kiocb *io_timeout_extract(struct io_ring_ctx *ctx,
-					   struct io_cancel_data *cd)
+static struct io_kiocb *io_timeout_find(struct io_ring_ctx *ctx,
+					struct io_cancel_data *cd)
 	__must_hold(&ctx->timeout_lock)
 {
 	struct io_timeout *timeout;
-	struct io_timeout_data *io;
-	struct io_kiocb *req = NULL;
 
 	list_for_each_entry(timeout, &ctx->timeout_list, list) {
-		struct io_kiocb *tmp = cmd_to_io_kiocb(timeout);
+		struct io_kiocb *req = cmd_to_io_kiocb(timeout);
 
-		if (io_cancel_req_match(tmp, cd)) {
-			req = tmp;
-			break;
-		}
+		if (io_cancel_req_match(req, cd))
+			return req;
 	}
+	return NULL;
+}
+
+static struct io_kiocb *io_timeout_extract(struct io_ring_ctx *ctx,
+					   struct io_cancel_data *cd)
+	__must_hold(&ctx->timeout_lock)
+{
+	struct io_kiocb *req = io_timeout_find(ctx, cd);
+	struct io_timeout *timeout;
+	struct io_timeout_data *io;
+
 	if (!req)
 		return ERR_PTR(-ENOENT);
 
@@ -470,14 +477,21 @@ static int io_timeout_update(struct io_ring_ctx *ctx, __u64 user_data,
 	__must_hold(&ctx->timeout_lock)
 {
 	struct io_cancel_data cd = { .ctx = ctx, .data = user_data, };
-	struct io_kiocb *req = io_timeout_extract(ctx, &cd);
+	struct io_kiocb *req = io_timeout_find(ctx, &cd);
 	struct io_timeout *timeout = io_kiocb_to_cmd(req, struct io_timeout);
 	struct io_timeout_data *data;
 
-	if (IS_ERR(req))
-		return PTR_ERR(req);
+	if (!req)
+		return -ENOENT;
 
 	data = req->async_data;
+	/* multishot requests only make sense with rel values */
+	if ((data->flags & IORING_TIMEOUT_MULTISHOT) && mode == HRTIMER_MODE_ABS)
+		return -EINVAL;
+
+	req = io_timeout_extract(ctx, &cd);
+	if (IS_ERR(req))
+		return PTR_ERR(req);
 	/* for a multishot request this isn't a sequence, keep the repeats */
 	if (!(data->flags & IORING_TIMEOUT_MULTISHOT))
 		timeout->off = 0; /* noseq */

-- 
2.55.0

