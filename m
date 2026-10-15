Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836BF42E004
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092744; cv=none; b=HCybFSyXfAW3LpgphVeL6ZYBoDmykj1skaXZ1JC82e4KOfdE4I0+Osb1Sp17D16BvLNJOsCPuhahjuNxJvECgN+uKbMRiv4UVUzxtk9SPA6daFFY7vVmXfXmtOzu2QLK/XhuDRIBpcYb+YOS1q44vrnpiBm8wWjmCwayladB6Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092744; c=relaxed/simple;
	bh=0pg+Qs5G+HD79rj5MXCk4uS99zWc6lgzPPgCAVPaS7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y0YtmJwLZjH/5hhxkX4y857B3AVkdwgfqlXK/JeqfK+K3Z/VvW+A1gFR4fNOT4u6Lkl76lBT8+gOjMW7GPG1GXNmm8wvs+F+ZWPhkTKLd2692rcWS+V74ApiLAMNag8o/oTaZgM7UQJ3JPqAGj2PTshlVK8/56ertmF5rf8TY9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=adXyclU7; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="adXyclU7"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93e706a6ba9so719986785a.2
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092740; x=1792697540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ot1iNHNcyf3hEAjqqbpqnWfaRf3tPRbIhVubCmDRfSQ=;
        b=adXyclU7f7CJ5Fd9r/vzUy86jXVIZ1CMUW5Z8aSu2ek/CmYVcHLn4+H/CbMuwjk2H6
         49bJ6dWNkDiY4l60O2Ht2nCmKFxUyHTQTYRgmelTqFg9WwhVAEgxxssKXfLRpZE0WqVO
         bslNIXbNlDLLvuYbFk2LadCblN+Hg3Mq0ZCcu1oMRGDbnNfiW4hdx9ISKqDFPF/4Ln4g
         e/RJ8LJQ/vCDUjzGWwyaYtt274fHxR96pK17crHlmec7bsfpRAVjv1FlIhwtdBzLEwJY
         4gp5HwPFcuGJhUERESOHIrsybzIlab7kjp73bvxqDrSyZRBn7PD8NG0urcIZarsb7DFh
         iMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092740; x=1792697540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ot1iNHNcyf3hEAjqqbpqnWfaRf3tPRbIhVubCmDRfSQ=;
        b=a6e7S5BKOMpqB6Enk1tDwwpUiEa0In3OHHEPOCNHCxoNz2nEiwEYuF5URcWcefPOLN
         WxIsn6E/4lbaDR3pvgO1T/DVATEnVa2ngm6kPsE1XYPQ9JadP/AfAbc8keiVaER1gHUc
         YC3G+wtXBZZdzD4AUfaK9kPlSs9EXO1On8pMgzfaG9JrRUPm/3MYPKI2N73dIUdFQYBH
         xmriNn99s5nXHbPx5/Ip9K0LeFBfxdh1ZeSRjo7iM+nh3/2c3gvLK90F1myH8IwSfJuI
         tL8FDIfEWRJMaXQ3FlVWXI4kk7HNutUyfoSQKqxZFRW7bO6y8dhzqz45UpioFm7ziJVm
         D2RA==
X-Gm-Message-State: AFq9FYKtz0z2YzhmmGKNRJDSIqZe7QVzci5fC/6e4Gu3x2rpqj22MxXS
	rDuFC57EpaVWRxqXdaEn3V/8WBjG/rJy8dKmzTnswcQozD1AbnLm/9RuddLB7DJ/nD5b8KdEKsl
	gVKu4
X-Gm-Gg: AYBFou0XmmYFjIXFyFP29/RCT9HNtRhYhR7mCseorAlvGm6szIEtSVeu2O5BmrOd/YE
	iyi0j+OW+qkrtZVjy8iKR3ZqNWx6cIPfdD+iHuFBNWZAxdVLUUd1S7JUhYmklTHeJRDZqd2WF2L
	VsyseQPVVE2RC4ktLbYB0VQuMsWjsfvJsdGVYWHFTMzrhdhi6Od4aikFDYypr9ffIFs5Ook/Rbx
	m5ds/RF6RNB1S0/z/PKL6VMb/0vo22XXKiCiRY7wVSHRMnfGJjdjOaR6OHyrM0MDC7SWKNbTBH9
	QZVN8/rHPusJN2p5zgBShbo3lx+dWKMdjq17NO6nOp3ane8LrEEETvg5rrKXP1U2us2CxTWvrtw
	CGimFOkqhIxyBtrdW9XDTb3EY8awwsPhsIG4Q/0KbzuSKOENaeNg4IacNeZWpG3jzPFiJ+2f+nb
	cQqrZcfgaOZAQWZKFD/JVELb0dPCHj8j8jFA/A7RgPOX7TFuwVtMgWrV1O0WDckxBcjlgcf5aPI
	W41izl60kiaujDAzXjzmTBVzQ==
X-Received: by 2002:a05:620a:2b92:b0:93c:a468:2db1 with SMTP id af79cd13be357-93ebd28ffa7mr3357575685a.58.1792092740194;
        Thu, 15 Oct 2026 12:32:20 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a1d1401sm11622085a.46.2026.10.15.12.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:32:19 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:59 +0000
Subject: [PATCH 35/43] io_uring/zcrx: fix buffer offsets in areas above 4GB
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-35-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092659; l=1307;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=0pg+Qs5G+HD79rj5MXCk4uS99zWc6lgzPPgCAVPaS7Q=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGDKoAxJOPt/YE2N4RI9F2VkJ/iL1LNIEc7OkOM8FBZGuo2h1+qIoMVd4Xf7g1QOLt3LRnIw54o
 LcC7c5MkMTAw=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

io_zcrx_queue_cqe() computes the offset of the buffer in its area from
net_iov_idx(), which is an unsigned int, so the shift is done in 32 bits
and only the result is widened to the u64 that goes into the CQE. An area
can be up to 1TB in size. For every niov beyond the first 4GB the CQE
points the application at a buffer 4GB, or a multiple of that, below the
one which has the data. It reads the wrong data, and then returns a
buffer it doesn't own via the refill queue while the real one is never
given back.

Fixes: 11ed914bbf94 ("io_uring/zcrx: add io_recvzc request")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/zcrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index cc9df7e64a40..6d7abb1636e7 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -1645,7 +1645,7 @@ static bool io_zcrx_queue_cqe(struct io_kiocb *req, struct net_iov *niov,
 		cqe->flags |= IORING_CQE_F_32;
 
 	area = io_zcrx_iov_to_area(niov);
-	offset = off + (net_iov_idx(niov) << ifq->niov_shift);
+	offset = off + ((u64)net_iov_idx(niov) << ifq->niov_shift);
 	rcqe = (struct io_uring_zcrx_cqe *)(cqe + 1);
 	rcqe->off = offset + zcrx_area_id_to_token(area->area_id);
 	rcqe->__pad = 0;

-- 
2.55.0

