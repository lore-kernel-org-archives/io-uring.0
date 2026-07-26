Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934303E44E8
	for <io-uring@vger.kernel.org>; Sun, 26 Jul 2026 22:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785104844; cv=none; b=dJQjxFVumo6Hga3S9y3Vrm2CnKROdUcAUrxea+S3idFwUiFG3BnaZXbxW7NUcKexgPPU7B1ARvAzParEjDYRAjAQypvKUawv4jViQSNJtj7eSAnAo1gOTTk9RaoAs0nSMQbaKTVEkzUw2nBgFJXmEoewJAxvEswrJN+znwylvrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785104844; c=relaxed/simple;
	bh=oG/knSFdjzhxsmCGbrAhtRUtzdUqbxJUaXODKQRDvF0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=E05MtslmHH31iYijGY2UJJY8KCwHGuiu9fWxPB6mKhm3EfvkCy+Ncl2iZqIidRFvpQ2wlLElWJ0KNDBE9/DV6Lmd9mxvjIqr04w05icD6GD+EKPCTXQw2mauXmB+V+jtfU8AhgDz7SZqILwuXs7kNb/ZMDU+eCzZXLhD1F4uKAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=Mz6MAu/M; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="Mz6MAu/M"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-902e4af2d9dso31799316d6.0
        for <io-uring@vger.kernel.org>; Sun, 26 Jul 2026 15:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1785104839; x=1785709639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uwlxafwo6x02l5VqlqsdBq3q4cfpbQHwvvNTffzRYMw=;
        b=Mz6MAu/Msqo/hacpWp+tGuifZ+ZwRNWfxUUYz1oZHJpISaGXwLSfxL6Ews9KTDvvPj
         RD4N2Le33H8f8bFY17T6vYTEPRci9nHCCYYRLa865CQRehJSTqW4IX1/sPgK8yIuTEtN
         O40HUdOkPO223NTQbF/1j9KvsOtAEMdRbtaiZmj6yAuAzgiMgxdymtuu8Xc2QgCsDwxq
         ihUiCEk8Efja20KbBAbFNOrAJRqEeEszUJ+eq8WtaPFGhgprUpGxrtAtjCWuwKPVHFHD
         OVk9GQQZSV1Pgb+TrEuJqN2SdLkOyAm/ijvFfWfuOM5MmdXPxF+5dlzKE6sKiV5nSBiG
         lnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785104839; x=1785709639;
        h=content-transfer-encoding:content-type:cc:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uwlxafwo6x02l5VqlqsdBq3q4cfpbQHwvvNTffzRYMw=;
        b=LMGgTURL5LGAK4JjkFyp/hyPGkFjpbdMkYPi02lzqb0iJUSOt9BoqtfHvS96EOwkEI
         +HDyHb5tj32xV6ysiNpkr0bENrAYIg8jvgCWjSbVGFTJxVgWWB1xrbX8xlgAzPTAIVzz
         NH8jpK0dTJB0esgEjiw2vHOYoqGg5FVUdJX+ZSqSU5/+1ZFCGp+PKPByJflGLWr1ueUc
         p6mMtZM7TiirrWyavubSbpsp3WaSpkPH8W1nMZ6t/+cFq6nbqgIAHOaHEwXuXFPKlcbr
         /y0tMaQf14lgMbOkTyOO5vgURLcAwz/csEsOqXKS7yMkO6ReGsIpcUK/C0tCVyz38UB3
         RZmg==
X-Gm-Message-State: AOJu0Yyn/LT/+FX5o2+lfqW8MiYKmlbvhSLdaVJxHeCpYkIUJ2lmWHzr
	1XnqbJRq0WV+EuaADNOrcCutgXUzB2p21G9UmnS3uL2aHTre0WG7OOw3WhmGxFk0JjBgQYpnaY/
	9wK1sjP4R3Q==
X-Gm-Gg: AR+sD10lOdm5K3fGSfrYgxm93eYPWdS/hGppXrhHEkAlbT2IIWcaAoTD6cyLMJRpKY9
	xKKGWywJNROLu/vdxugVx+P3L8leFmFaAOfRD3F2To3TbX9778GhwRcqwi15sU/go6jyVMA/ckY
	baJ/X0PJIrfjvb8R/QKaxWZXPp93CPmergShDFAzV5G4wBOoFQUIjZC+E6NwK661Pdu+XcQG/HU
	Jt1wllJM+WeqJAEjmgURrTi9llZpxbtuVJ/rQrwp8ZjW6kyScxLb1QevlNM0TpS5QPHJberte1k
	9gfql5flotlxeMMpJLxKEj2ZogPbQZ8L1vtDui2lQiuCnAkZE4RHnIc1WhEYb9RD8UmwTAJFXa8
	ay7vUj1sBpAhvedr4GyCLIduERIX2zaG4KnS/OFv6ZOMXWiECcY8mvJOWQubxOHz1k5Kxr8mcTj
	33CdqpDP4YCgCNg95l1XR6s4zji4zbz6EQVdwO6eFcXokaSEAgnyn4sOStYB+h
X-Received: by 2002:ad4:5f0e:0:b0:901:9f0b:763a with SMTP id 6a1803df08f44-907ec6ec588mr74507016d6.25.1785104839083;
        Sun, 26 Jul 2026 15:27:19 -0700 (PDT)
Received: from [172.20.6.160] ([50.234.234.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e85241dbsm50745966d6.5.2026.07.26.15.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 15:27:18 -0700 (PDT)
Message-ID: <660d1bae-3e03-4ed7-b26b-86e22722e51c@kernel.dk>
Date: Sun, 26 Jul 2026 16:27:17 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: io-uring <io-uring@vger.kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] io_uring/net: initialize mshot_len for send
Cc: Sung Keum <kambodi127@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Commit:

6a8afb9fff64 ("io_uring/net: allow multishot receive per-invocation cap")

changed how io_mshot_prep_retry() set sr->len, and added the same
initialization in io_mshot_prep_retry(). But it neglected to touch the
send path, which may also uses the mshot retry path. Ensure that
sr->mshot_len always gets initialized correctly.

Fixes: 6a8afb9fff64 ("io_uring/net: allow multishot receive per-invocation cap")
Cc: stable@vger.kernel.org
Reported-by: Sung Keum <kambodi127@gmail.com>
Signed-off-by: Jens Axboe <axboe@kernel.dk>

---

diff --git a/io_uring/net.c b/io_uring/net.c
index 00a7df803b99..a74d15f7b7d2 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -445,6 +445,7 @@ int io_sendmsg_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 		req->flags |= REQ_F_NOWAIT;
 	if (req->flags & REQ_F_BUFFER_SELECT)
 		sr->buf_group = req->buf_index;
+	sr->mshot_total_len = sr->mshot_len = 0;
 	if (sr->flags & IORING_RECVSEND_BUNDLE) {
 		if (req->opcode == IORING_OP_SENDMSG)
 			return -EINVAL;
-- 
Jens Axboe

