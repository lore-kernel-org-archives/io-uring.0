Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4478348F001
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092738; cv=none; b=GrqZeUP5Jq0/PCM3tlcpRqFvrYWjNiLtTQTxBz3yMYcKe8B78U52aJRKaxuvFkqH592RxZ2+Qm5gi0dip2rgMBhrto8XriCutPS/nZt7kkrmdaNQ10ubTwBBybOHtuBdXG5bgjqkVxnzuVgiuZS3SyLkXgb2x8ldvgM2jijimmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092738; c=relaxed/simple;
	bh=6NWhVtKgpk0Q9yssLRYNF+keD14LBCdInzsKl9xAQbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mvhnVPd+bwmj1qpnBNzHOUziDJgQsqoEP0YwWU5fknJPdaSUYBbsvRLK+SlxQ7aBDvNsD7iXwozvh9JqdUei7l+qPOfvT7rTuOtXoqyXLyoaySYLGUWSwu8jFP22sP7ptGVpnV7KqagmVGrO2pvB3fsOHYXaYDKSpEYV2EF72LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=VSSKPaOo; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="VSSKPaOo"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-918f75a68f0so89705356d6.1
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092736; x=1792697536; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vifgdVB2yw+/mYxzZILpuEkUHc6SjjS0ZgYHuxD1BJI=;
        b=VSSKPaOoBFfA71cothb+TOhSxJ2mFBRmoF8XVYeLEqV1h5yGIcUxqyvkQfxOO8v1m8
         /NNbB8/yUP9Dft4BG67LjpHGZsIg557faZX/rHlecwyXI2EdKLggqb1tyoMqI5R8+Cgz
         FEYiBzqVyKXXvPXp7q9NhoC8s4VFsCBxQc4OO+6CLSmbFSZ9H/kIuyjRRJg7qGPr2EHF
         v/3KH5ae1sZ2USxHfSxKOOKWkd9HK9FQTFlXN8qn9C0FkyAdDqo+2v3gO5Ke4r+PGzDM
         FJbnT2wNxj+FU/w7GItiCx0+wY6z60C9zCwIY1bIZGFU2+nbySnz/Q2vePNC1acOPgJP
         RTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092736; x=1792697536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vifgdVB2yw+/mYxzZILpuEkUHc6SjjS0ZgYHuxD1BJI=;
        b=zfqC/h1QDC3p8HC0yCurjw0VIT6ibeXPJnKEXHjyWwNJr9ya8ziaqsLrYaOHFy4rtB
         b/pZ4geHT66SZjZt53JQUQMd14Y8pCuU5UU+TSbhHk5nI9PTIuwtVY1IWbJ34L8jo2Qv
         ASG2ocfRFTGYg1ud+vczHcCWgJBpKo2uh4dHD/sPVCPGvne/02Vs3RlYzLD/2gvd3hIm
         6QMbtvCgw0OkxUlyCFSb8sBD7PXERTEthjmKC8mph1PaE2AMjnb+UDsdl0Y/LzxQ0j5c
         nqK0Os9meObBdkbwCOmT+dIWtpWexWgQWr0W6lXJaQ/NXchcHZsc1Zz4wvuu0KSoUhs4
         tGhw==
X-Gm-Message-State: AFq9FYJ+BlM/enEfXwCktEkAM8Fwc10ZpaO1F/zTUMkiz71Te3jxN4af
	xxMRv7Ipri17VCyQfq+bPNo4TaGPYK+ztaP3rJfu/7sl0NwxlXS/Hb1uwYqdtPuFMBwXK6mZKEJ
	3LALb
X-Gm-Gg: AYBFou1aFzNuIzZ+7JqGbzKtTmuaKzv32uwtQ1u+mJmqq5EAR8xkoNofdaF/VstcXO/
	ohglEbigP8I09fPo6Rej1PUPZdlGmH7UKIGpOH392KRAh0GoyddOmsRoVH8btx6aZjH+i+EoWlQ
	xLFZnwTAIUoz9lz6kc8PbvvHJQfPcSY5NHiVoe505gCkS4ry3+KnXYXHSHphMtUZgEQFOP/kGQi
	AEz+WoXd896eKYKi/buJSKp7j5gCshmsDwj5Td+RMP//HwcfK25bcLMJcckzCRisc84Uc49ZOUH
	oJa/SwuFiuFDZmJYCqUm90FsCRxkDX9i2+QtaK5rphJmHCG+7ufNReMZEsAA1rdOwymwQrXN6nU
	B1gSUExkx/c3riOM2K02G2FoBEdCdqNUjZtRMrLabC4v7alQpijY2Zt29Cos+HvmB3qp2EWPiCn
	DU4KDs5DjzgjwsLqNpAH5ICMghs8XPCYwusuSHTuxUXRx83neY9RS37e2zpFH91D9yK9FE7Y4Ui
	PouvfrfF/qfp4I=
X-Received: by 2002:a05:620a:4489:b0:93c:5c60:c3a6 with SMTP id af79cd13be357-93ebd2a6dbamr3276753185a.66.1792092736218;
        Thu, 15 Oct 2026 12:32:16 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.245])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a1916b7sm12677685a.26.2026.10.15.12.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:32:15 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:57 +0000
Subject: [PATCH 33/43] io_uring/napi: make stale entries time out after 60s
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-33-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092659; l=1188;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=6NWhVtKgpk0Q9yssLRYNF+keD14LBCdInzsKl9xAQbw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPlAFW1HCOw/AK31zAROR/DFjtEy9Mo+IPhDhucaVD66yg+026iQI580Jp11A0wWp1q0PxpM0Fs
 nAkoHGOskygA=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

With dynamic tracking a NAPI id that hasn't been seen for a minute is
meant to be dropped from the list the ring busy polls. The timeout is
added to jiffies, but it is defined as 60 * SEC_CONVERSION, and
SEC_CONVERSION isn't the number of jiffies in a second. It is the
internal factor of __timespec64_to_jiffies(), HZ scaled up by
SEC_JIFFIE_SC bits. For HZ=1000 that is 1000 << 22, which puts the
timeout at about eight years. On 32-bit the multiplication overflows.

So entries are never removed, and every id that a socket of the ring
ever had keeps being polled on each wait.

Fixes: 8d0c12a80cde ("io-uring: add napi busy poll support")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/napi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/napi.c b/io_uring/napi.c
index ca1c814fa73a..53d7623e4d23 100644
--- a/io_uring/napi.c
+++ b/io_uring/napi.c
@@ -6,7 +6,7 @@
 #ifdef CONFIG_NET_RX_BUSY_POLL
 
 /* Timeout for cleanout of stale entries. */
-#define NAPI_TIMEOUT		(60 * SEC_CONVERSION)
+#define NAPI_TIMEOUT		(60 * HZ)
 
 struct io_napi_entry {
 	unsigned int		napi_id;

-- 
2.55.0

