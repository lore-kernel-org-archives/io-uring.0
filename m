Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792423270;
	b=3t7PuzRAHbxRt2F8EsLEyzDWCxEA7KZkxTSRLQIzGNCmgymsJz0zrR2GCJPgFV9Ro/N3
	 DQrM/2fKwfbhjhm8FO//FhUj3jVxs4C8+z+zn1LDx86TS8cGYswd7shgnO5fizLaAsXWp
	 tWSsgvGFw0d4YmQ+Gp7EQqJHxtFdGtmOve3enGyL+r0A19bc4c4bYXvBkjzjVnkVCWqlv
	 G9MFGd4v1XMGxZ+SlPU/tsOukcue5oqiEgQBPf0QMA7uA3bUkV4Jb1wG9UfyhuF/0haZo
	 RtNeIKuP6ehO4/kRIjvrQW1RqueGDnC2e1FBMZDRSeRDsjf3TWrupwuuaAj+00CvcTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=7Hw1nQeOT0hpBs8JWZrvFPeFAdyEee3Nf0Mrysl2Y1g=;
	b=3ImBHCZtNSKd9HuPnqnRmw7v4asVkjpXR6j2r9N52RxmY1ezaGz1uEu2x0i6Q+Wtu81k
	 Bmj8bmYaztbSMXlYlAy3NsDpaxgjaY77yowL96S7vDvuGxYKiILz8bjA5ZMcTAbOMGC9l
	 hCOtw/ndKgQ2lXFmZKCLEQNK52pa+HsWGPpQJnbsSHF4ZvGegd9SSAXJ4gKFuUQvdjQoJ
	 JHsZlAi6StY94NlwITOGS1S0VuwWaxqXfZAB/Vhn/YPVoqwDsAJT6wZFvgpe7KoJDeTwd
	 nAdHryaNuepdUy1P53ZXrwXbLYipVXFWZ87JAVGODJwkeFPF1IDQBDF5mb29oiyhPLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="RLHu+X/Z";
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD2560A7E78
	for <io-uring@vger.kernel.org>; Mon, 19 Oct 2026 15:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CD2560A7E78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RLHu+X/Z
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e946155442so18031625ad.3
        for <io-uring@vger.kernel.org>; Mon, 19 Oct 2026 08:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792423270; x=1793028070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Hw1nQeOT0hpBs8JWZrvFPeFAdyEee3Nf0Mrysl2Y1g=;
        b=RLHu+X/ZCgfkGNAcpJZzmVb+NpRYJOKO905A5pUHlK/KmK96DG3K0O6Ciu65WDhi0h
         0HIUnI9Yq6Q2BZmh1Upu9kkyS3/Ds/m6PLJSuHyroGhFOFnLfUsCRSMJBZYR0SFALkGw
         IrxfV1LMUCqXSkE3YhB16pw61uIKY3bRE9N/yF8OZAQA1hSdZy4py2sHkw9Fy+LLBGYr
         TRxcE1HO8MgQNFjQ+BqHKxe3Kn5ANB88EmfT09SEcrNpJEkN5d/I1rYF0OloKr7g/a2K
         QuXNq9jvX+AsCPhx5SBmjIFR0gwINIIo3eTob5Ff5ap/JFNWTqANrFwdPtT9AZ2o5caQ
         h5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792423270; x=1793028070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Hw1nQeOT0hpBs8JWZrvFPeFAdyEee3Nf0Mrysl2Y1g=;
        b=E5/rmeW8CbzJh8gyAEiILpSxpKrtxdIQ1RnAkCe5gBb8JRj9klJprNrY7KbWmSQ7mV
         HMDtPHd00Qf4WLRolJ/W4I8mfjVYBJkWtr18zTqhPhqHI/tvL366SnUgUrJaKyVxTRgf
         yQphvlzXmMbfVt6nf6t1zQLmMN0J8CDlq+g5hDjY8Zo0CVlNiqbARtdP8/2f6JNQq3ps
         ehIV0op9Ui4F1HIvhiiMThtGuqzpkKMwF0Mwkytgdb5ELdk8EI9YGjglKdWgN+enFEEH
         tpqHe0Ib9HmhXkseBo9XZkmKfK/V3yz76+gVfqbtR5bps5Z4/1e1TKojBXLbM5nLuYLI
         ZzqQ==
X-Gm-Message-State: AFq9FYKINJ7XIq0f4AVFoIrH3XPUH5EWeAvhJeoxP2m0mOQ6Cp8yOOUU
	ZRzcGR6gtglb9tS7l67dg4MXBWpIMhbZCitu/EJOl7ROLENuA05X/aJLBRep+LCJ
X-Gm-Gg: AYBFou0y2qAY7oGguXbzZNJtmvFDfaf7l7jJR4U5LnITzGu5Ka/+jJWlkeI3cqh7sEH
	ScVncQg5HFUkwie9cIva4PCo16Egh3j5t2ygBV6yx6lrX4SqQra6jMiEIeVMj/V3OUzqw6cwkoT
	kKMUwTdvJVWUc+kc1G1BorYnp38QQ8rwOvb2yBqicshCQ3GHKjTvRNAlougX1DhAdy4n/Btol4J
	WUTPFNWc/3LOMbaKSFZs98UMWSTmVzq2w1EKHUn8tj62YMsw2vkeNMJI8/l+gPf5lmk8tcrEEsU
	bqwLRnobC4apOlnldYu/3uiYt4GA4hEhH5h+xpz9YAdsYt2uKP81ldWrdFlLO8bhKcxAHm5Z20i
	hMu1lA2E46DVJqBF1DaHolxGEgAyDFYCR4BF7OVgSCtGbkLH/yF98fHV4n5maTyqtTlpN8NZOZD
	fvzGSqytkX7pemmC0qGDeayUfFrVMVCO4v2MHFiSh3xf368odEl3Esxo1qGGFSnFYNZynzqWj1o
	Q2KMqmJAdLgVnE/9NSU4RnT/yqhrX4MjRkpJ4PU
X-Received: by 2002:a17:902:f607:b0:2e9:69b1:1b9b with SMTP id d9443c01a7336-2e9a6846dd7mr72903765ad.8.1792423269844;
        Mon, 19 Oct 2026 08:21:09 -0700 (PDT)
Received: from localhost.localdomain ([122.43.72.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1501e269sm2798115ad.46.2026.10.19.08.21.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 08:21:09 -0700 (PDT)
From: Junyeong Lee <jylee5498@gmail.com>
To: io-uring@vger.kernel.org
Cc: axboe@kernel.dk,
	greg@kroah.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] io_uring/waitid: prevent cancel reference wrap
Date: Tue, 20 Oct 2026 00:21:00 +0900
Message-ID: <20261019152100.63565-1-jylee5498@gmail.com>
X-Mailer: git-send-email 2.54.0
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

io_waitid packs the cancellation state into bit 31 of ->refs and
uses bits 30:0 as a 31-bit reference counter:

  #define IO_WAITID_CANCEL_FLAG BIT(31)
  #define IO_WAITID_REF_MASK    GENMASK(30, 0)

__io_waitid_cancel() marks a request canceled, then increments the low
bits of ->refs to claim completion ownership. When another path owns the
request, the increment remains even though cancellation returns false.
The request remains discoverable by cancellation, so repeated failed
attempts can wrap the 31-bit reference field to zero. A later cancellation
can claim ownership and complete the request a second time.

Use atomic_fetch_or() when setting the cancel flag and inspect the old flag
value. The first cancel attempt continues to the existing ownership
increment, preserving its wake and issuer handoff semantics. Later attempts
see the cancel flag and return without incrementing the reference field.

This makes repeated failed cancellation attempts idempotent while leaving
the first-cancel state transitions unchanged.

Fixes: f31ecf671ddc ("io_uring: add IORING_OP_WAITID support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Junyeong Lee <jylee5498@gmail.com>
---
 io_uring/waitid.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/io_uring/waitid.c b/io_uring/waitid.c
index 2b756017423f..9ad8eadc5b8f 100644
--- a/io_uring/waitid.c
+++ b/io_uring/waitid.c
@@ -154,9 +154,12 @@ static bool __io_waitid_cancel(struct io_kiocb *req, bool copy_si)
 
 	/*
 	 * Mark us canceled regardless of ownership. This will prevent a
-	 * potential retry from a spurious wakeup.
+	 * potential retry from a spurious wakeup. Only the first cancel
+	 * attempt should take a reference for the ownership handoff.
 	 */
-	atomic_or(IO_WAITID_CANCEL_FLAG, &iw->refs);
+	if (atomic_fetch_or(IO_WAITID_CANCEL_FLAG, &iw->refs) &
+	    IO_WAITID_CANCEL_FLAG)
+		return false;
 
 	/* claim ownership */
 	if (atomic_fetch_inc(&iw->refs) & IO_WAITID_REF_MASK)
-- 
2.54.0 (Apple Git-157)

