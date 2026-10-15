Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8877F4FE2F7
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092718; cv=none; b=H1jEz/513r0hIk8/AlzVLgodjrg6tZZJrXcuToHsoJeCSP1InqnrqiosPOpxnzR7W7gev/6pbIfbNTLI0ph14Xx56PvvwjHBB6Zu5YVSVG6/YZMQrYEITCtdJf9sioZDzjGvdD/QhH5BcW86xSW/RWvtNrpcxOWKvsgLzOAZXqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092718; c=relaxed/simple;
	bh=N9mIc7CXpS/6Uy4IOsUfh2cS8MXUykK58zJiGUcIKsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eFVXK9nRZq5mZxq3pRMQNQ0/nDNLysJodkITshttFkUtNudqHRAR99e4lxcfZ0OxJp3MVh3LNXWp3whMTbkZJfWYqrk/x4HUzDFVhiDlFj4lMQwBo7jOAmmyktlC4xJ0lXjhKT4uSKG2Ub+byZ8HURPT6fAzNsoqtzZ+34aqnIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=Gt4t96Wi; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="Gt4t96Wi"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-53606d2351aso19017971cf.3
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092715; x=1792697515; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1W/HrILCJm67Eq1HvhIRQ3rwRMChvsKve2iBptgc5qo=;
        b=Gt4t96Wi1xkjQ2IAnpaM77l5NG1IpEbIdKVLg6VDomWThlBaijJ+ykW9Y1mgcQj4hh
         IWwcOZmtbcUUeXXHrYMgN+riAtO+4zaCjw4F4nKvwec1l2RnVMNCnVCOvXZ/63L/BaFq
         KT3TZk0tRea3mC+UC0crQb6d+d35HQnrKVMMiORVUEr0xAI3UlfnTkoNwd0BMrPWXCGW
         oe/S8uQ3RRSh7GvBFt4s7UG5e8gYmbY+Uaq2BXLYUW+vTYkdD22h+ASSjMvI/k2qznXp
         ThiCndreEWIhEfXOntq5jrboortYv1GZmwj1Kw+y0dH3r4ydmWbL8uV+7QeGJm+wMQch
         /1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092715; x=1792697515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1W/HrILCJm67Eq1HvhIRQ3rwRMChvsKve2iBptgc5qo=;
        b=zbDf9ujxvZ6McLQMcHveNSzN7YE2gFzvWI9jOZ3AxYtZTQLvfeIPY0rtKR/fy0XiTO
         7pN4Ui6THJSK/M249BkPQHUK4nX0iBvVymtE9o68bF4cBUsYAIi2/4s8Rx58UmaNKaQX
         yObZSqFDTzO0cIS4slQHtp3AFZa0lHabtnnH1EztFU2EsaCLxI5F1QPAqvi8dSYsLKEh
         l70wuGaiPbnobCXd275XTDRM/7kpJ5mukibMnN3HgOZEX89nS8WXjJ8Tjb6mFInm5EFX
         p4BwTn1J6WRHzSzjLT4uyObSWxEyF7U8KImQedGlJ/N77aaUeB/XxQSY+WiDzYvO1IM7
         jrhg==
X-Gm-Message-State: AFq9FYJpErraBDORYqnQxTmH4pJOsuJOmQadT7tV1rhnr8p/yF8oQTNK
	e9QMAJUWo7kWG21T9ygjvw9c70cxFnuyhbSWsrxS9sW6iAywS80Ii/K1/xjTxj6xwtg=
X-Gm-Gg: AYBFou1J1fXgGQH6d596qqXgI7H8TgtjxM9nGUH9QWTBS0K4w1fY9X/q2bf23YqdrLk
	wGn/tEvw5Ee5gPiyhGm38CKYXD4a/ctmjlNFSjIV0HzR5wRn92dePrnvPKy5L7w2p4dywgjQYOH
	5+/pbDxv33q/QZEOxmsqtwXpam1AgcztuZrGBWEaOqHP/cJYr8EL+kY/osEE3AvBNYG/3Sf2p7J
	UIgc8y0LL84SDnNGyo+3eFicPHJd9hZAN/mizhm6UYoGwZgKZxsvaJ2dT/SpOiw2Y96bv5ps/oW
	WwQngzQpGtVVC/n80lJ7tOSkPp5AAHJvXwkCZ8xv4C9dtvPgD9PABtMdHl3nWR/Owt9fWp8DAHV
	58bOMuLojNarwo2NBnoTKJsEOg/RsLYEozPw1rOOoOUvjGESFO/+dE7/4CvzKhh376QMtWmi96Y
	K3rOToi9JmfAJVUt2SV6eYg6xiE1cz8Zis629b22njQJntsRy3JO5VRHRqiCSA8yqBDVfcj/WKf
	b7FzxsFH57T448=
X-Received: by 2002:a05:622a:17c8:b0:535:84e7:5a76 with SMTP id d75a77b69052e-5359fe13048mr294268281cf.59.1792092715199;
        Thu, 15 Oct 2026 12:31:55 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.249])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362a9c273esm1499451cf.20.2026.10.15.12.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:31:54 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:47 +0000
Subject: [PATCH 23/43] io_uring: drop the CQE cache if a refill fails
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-23-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Leonid Ovchinnikov <teiny.work@gmail.com>, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092659; l=1928;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=N9mIc7CXpS/6Uy4IOsUfh2cS8MXUykK58zJiGUcIKsE=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIoXKFq4B/fUPukYSvrOpFPaTRlsOQvc6nLLja9NvYGybwOFF3A6njlJasJm6jFzBa2FHX8/jxH
 BWKu3ecSi4wE=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

->cqe_cached and ->cqe_sentinel delimit the CQ entries which can be
handed out without looking at the ring. io_get_cqe_overflow() only calls
io_cqe_cache_refill() if that range is too small. Without
IORING_SETUP_CQE_MIXED too small means empty. With it, a 32b CQE needs
two entries, and one may be left. If the refill then fails, the entry
stays in the cache, and the next 16b CQE gets it without any checks.

That CQE overtakes the 32b one, which went to the overflow list. The test
for IO_CHECK_CQ_OVERFLOW_BIT, which is there to prevent that, is part of
the refill:

  CQ ring with 4 entries, head == 0
  16b CQE, 32b CQE       tail == 3, one entry cached
  32b CQE                no room, the CQE overflows
  16b CQE                written to entry 3, ahead of the 32b CQE

Forget about the rest of the cache when it is refilled.

Fixes: e26dca67fde1 ("io_uring: add support for IORING_SETUP_CQE_MIXED")
Reported-by: Leonid Ovchinnikov <teiny.work@gmail.com>
Closes: https://lore.kernel.org/io-uring/CAECZYD5OMD9vMTzjteFMMP40Dn+SWKj9SFj=43U6uO3XMnxJbw@mail.gmail.com/
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/io_uring.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index a5fd1845a1d5..01187f00943a 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -729,6 +729,13 @@ bool io_cqe_cache_refill(struct io_ring_ctx *ctx, bool overflow, bool cqe32)
 	if (!overflow && (ctx->check_cq & BIT(IO_CHECK_CQ_OVERFLOW_BIT)))
 		return false;
 
+	/*
+	 * A single entry may be left if a 32b CQE is asked for. It must not be
+	 * handed out later on if this fails, as the CQE is going to overflow.
+	 */
+	ctx->cqe_cached = NULL;
+	ctx->cqe_sentinel = NULL;
+
 	/*
 	 * Post dummy CQE if a 32b CQE is needed and there's only room for a
 	 * 16b CQE before the ring wraps.

-- 
2.55.0

