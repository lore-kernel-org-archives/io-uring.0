Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795814407;
	b=GkViTHhSs+C/wNR0lejlgmPMec+bEhaBb1zYukXOdBWQ/7NfS1HEEeWJuJNeIJELK3mm
	 57K8AD1yprNhQVB6GfJ51Ecg5uc/3PlweNbZxIrus1Zi7sJmjV02ZlCFE8ZGw1iaTAawt
	 kbs7c9VCgWJCqXqVOU49o6d7UdPGHQJ9vmj8K8DlS6F4qQnSBvMonheqkulY4QE06v9Fn
	 FiwaDitE8cZZANm0caL3+4s8MO5KU66JHi9UJ1nEDMxDmWqD5squv47vGkTJ8lN5K4NIE
	 KtvzFvU8t0SuylqPfsYQk6AEkVCxlR8Ru0gHH7ycR6jPSuDxuIoEWVRnCvYbWl1+V5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795814407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=KHHColduWGkmMFxFIDLQlFNb6NHf5yIkvDHac155u38=;
	b=2ZA3tuWtf3cehOerrgblmmoPRcLph3zc2yQTCrpUP4tiYzDv6bK1SmnmC+jf//Moyusd
	 SuS5a6nKzEISAXmotF0v8eHHXrXDGy5J0faeDwvAMrBthiIe50D3HJYBs/ewBVuPznv+n
	 m1MLxEoEYd0iR4DusFfTcsVhx2143iSTvJ3jL80YQmUhGAO/Y+lu94A5eCJVo5dumuu7j
	 FbCdx4ZM8jVPcE8PyAT8w85n1zxRj3iF/QAzQme+GTcz+6Z2/aQ46Pnd87GsiMvw0yJv0
	 gyY6+VLeHby4bwY4lJg2rorwc2erbVpJDp6snfi+ViFvDvWIUdlbzY8d985LjcI3Bmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0SeRFOYg;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B14606A32C
	for <io-uring@vger.kernel.org>; Fri, 27 Nov 2026 21:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66B14606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0SeRFOYg
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-385d8a00598so13229750eec.1
        for <io-uring@vger.kernel.org>; Fri, 27 Nov 2026 13:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795814406; x=1796419206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KHHColduWGkmMFxFIDLQlFNb6NHf5yIkvDHac155u38=;
        b=0SeRFOYgIHf0xKk845tY7Ew61fEgVRrey05t5afn/eNfocTuP4qrVuiOmmc2ZJGAzZ
         mXTtk35clO94Jdl8LcjIjc8Set0IgMoOSOQ71g/Guu/ST33xtd9QZSjHaecR/ykryOB4
         Sg0Sl0R6B0y2Uy/Jhq1zuTYDcluJXYizvqG6oLU3Bk7B+fmcQkDTioqhT40Y/TpzS01q
         VF8JKhpd7F9kbolfYzRwFE7kawAgrWcIqoXiBYHhKYStnqwgh7d8zF93WVfPk2qk0OmS
         VlYGYlxAWACfq4oGItMLrflh+mvmbsG7jcZiHL8OuDiAp7I/x3PrjnD5gtqWMdUUmawb
         s23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795814406; x=1796419206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KHHColduWGkmMFxFIDLQlFNb6NHf5yIkvDHac155u38=;
        b=h1x3UkL7/blwmPFD+4Ub4V87ayJ0CnyCk3XJ0bACSJja5M3dAyTCpLmfifvm+fq+ve
         eO9gu5I5tiz+2ac/lXIP4pudHey0f4w6wMOWSOSQIH1fu3jpzs29qC34Atw23C1VTJ17
         olCW7NxckRb6wEbwlLc78JSkGRdDx7iv0c7zaqxYF89HkbXc2QrXFjqVbqp0VRRwyUle
         WuUFUR2TnN+weh3NmXjrrod3KO1nBv6a1wCRPayOYTv59csEU3lggD4EW8MpmoA1ONWx
         CMgpsMhRVTqKlgpgvXWzsEuyt20JKRLoTD2/1nYLlq3SYruY31jrC/pFvDyWnB9rB4O/
         WIFA==
X-Gm-Message-State: APuU4Z/K6wLbK1jcZrgei2SilPWeaU1hDXnE7RxGtm32UwSaxHUTkm55
	/2DbZyYk520k6E6S1PjKEadEOTiXHAzr05B/dnkaOBTA8h1LmWtYpL/u
X-Gm-Gg: AZFdTZd0oOHSsSR8R80J0TUpg7FWpPFdJtlEyUl2AJ18ENOUgOBUp42skRBPVBoVB/B
	H8gfcujvvPWpTvZQQ4KOP1Vm0M/1A7TlHpBjFyHcT1oAKWUHUhr76gyuJ9/AXTdv30OamKS+OnH
	jKvdzSl4s/KGAQGhqXBtIJl5S9qyqFPXl9gIeHvQ2gRp94JrEJhIYsKdVJf9qOrshbullVO8JA1
	pbBM7nyVaK1HzxJusq0gp/+dC9tfUgbgyzvX9E9i5vt0up/Lrn5OqhN7tKEny0H+M0E6s+bnZFq
	Kc4W5C73xPz1Wn8B+gxIw5VIh5GX3yWkxvS+rTzBCUuSIfqO4Jyu980CIepDmtchWju7kEcKt8O
	VexaQHzGFC4AfCGII5a+9fvdvEptjSg2kPBHoeatE0PKx6LWq+972F2UoADBozQ/nG3wiDcDjlp
	YjH7yA8lJf9LPlnEVx9/o9Q/sflAAHjozRBRB7DbhrsWgc/mQroANoVz5GYstXzBiuF+cOJWxS7
	d6qAdeIeKLASe8nZlwjdjEm0wBjT34YY92gTeddlYTHUz717a1vlhKP+go9XSf0FPV4nljMjPhl
	kpDhvtWiDDS7XUo6Op/VndMtkn7fLiT7TZa2FvcQIqmWiAorh7soVLaLdWgNJMr1jivwpGsqZ/D
	EdQZc17F7tOzv1aQl/ntlPQqHYe5V/BZ146dQnGmUzqEr7E3BuyESHckYvGmgtcIwqKTRIrGpGW
	sfgMsHHCeXjrKdnKfILX9pt4EiSlhchMAIji1BPxhBvolrhyl4UB81VQr2oDicy7KiE88AQkdUU
	vC+bHPbmqZDdCCp+NdXHnMFTci44NFxIjrkoq6vo5eP+1l0Mx7Gxzsep96B+n0OZkiwUouUQiW9
	aOYS9NpBgUWLFsQu8A==
X-Received: by 2002:a05:693c:88d4:20b0:386:a8de:2bfc with SMTP id 5a478bee46e88-386a8de2f67mr17929616eec.6.1795814406495;
        Fri, 27 Nov 2026 13:20:06 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:5390:dae0:7063:f08:2b4a:6d9a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm73804236eec.15.2026.11.27.13.20.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 13:20:05 -0800 (PST)
From: Artem Andreenko <miolini@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>
Cc: io-uring@vger.kernel.org,
	Artem Andreenko <miolini@gmail.com>,
	linux-api@vger.kernel.org
Subject: [RFC PATCH 2/2] io_uring: add CLOCK_TAI support for waits and timeouts
Date: Fri, 27 Nov 2026 13:20:04 -0800
Message-ID: <20261127212001.18516-6-miolini@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261127212001.18516-4-miolini@gmail.com>
References: <20261127212001.18516-4-miolini@gmail.com>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3022; i=miolini@gmail.com; h=from:subject; bh=yvTfJypiHdmknicGUP3Np55BO5/vKeWwpJXIdb7AeSg=; b=owJ4nJvAy8zAJebzwOiZnvnNTMbTakkM2ZxfmN56ORi3bbI+d5U/eGm7dcLJhpcZl6ZmpLDv3 bfw753NmQkdE1kYxLgYLMUUWRpb56/Vv//ZO6bEzRZmDisTyBBpkQYGIGBh4MtNzCs10jHSM9U2 1DM00jHQMWbg4hSAqd68gpHh34aXrUmP9mwXWTVhi/nNj66M/495rPNo6194U/WS7243K0aG3vP se07P85cMMrlx4Brfk888Spt+aRW+f227aI7b7O93WAAa4VOG
X-Developer-Key: i=miolini@gmail.com; a=openpgp; fpr=81859FAD2FDFF34B5C74463D4CE032E62E37D969
Content-Transfer-Encoding: 8bit

Time-sensitive workloads such as 5G NR gNodeB DU/CU radio-slot loops,
O-RAN 7.2x fronthaul, and TSN applications schedule periodic activations
and packet launchtimes on PTP-synchronized CLOCK_TAI rather than
CLOCK_MONOTONIC (which drifts relative to GNSS/PTP grandmasters).

Allow CLOCK_TAI in IORING_REGISTER_CLOCK (via ktime_get_clocktai() and
HRTIMER_BASE_TAI) and add IORING_TIMEOUT_TAI (bit 8) to
IORING_TIMEOUT_CLOCK_MASK so IORING_OP_TIMEOUT and
IORING_OP_LINK_TIMEOUT can arm CLOCK_TAI deadlines directly.

Tested on arm64 QEMU with PROVE_LOCKING and DEBUG_ATOMIC_SLEEP after
setting a 37-second ADJ_TAI offset, verifying IORING_REGISTER_CLOCK,
future and already-expired absolute io_uring_enter waits,
IORING_OP_TIMEOUT with IORING_TIMEOUT_TAI, and conflicting clock-flag
rejection.

Signed-off-by: Artem Andreenko <miolini@gmail.com>
---
 include/uapi/linux/io_uring.h | 5 ++++-
 io_uring/io_uring.h           | 2 ++
 io_uring/register.c           | 1 +
 io_uring/timeout.c            | 2 ++
 4 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/io_uring.h b/include/uapi/linux/io_uring.h
index cf1afd11b..af86553b3 100644
--- a/include/uapi/linux/io_uring.h
+++ b/include/uapi/linux/io_uring.h
@@ -357,7 +357,10 @@ enum io_uring_op {
 #define IORING_TIMEOUT_ETIME_SUCCESS	(1U << 5)
 #define IORING_TIMEOUT_MULTISHOT	(1U << 6)
 #define IORING_TIMEOUT_IMMEDIATE_ARG	(1U << 7)
-#define IORING_TIMEOUT_CLOCK_MASK	(IORING_TIMEOUT_BOOTTIME | IORING_TIMEOUT_REALTIME)
+#define IORING_TIMEOUT_TAI		(1U << 8)
+#define IORING_TIMEOUT_CLOCK_MASK	(IORING_TIMEOUT_BOOTTIME | \
+					 IORING_TIMEOUT_REALTIME | \
+					 IORING_TIMEOUT_TAI)
 #define IORING_TIMEOUT_UPDATE_MASK	(IORING_TIMEOUT_UPDATE | IORING_LINK_TIMEOUT_UPDATE)
 /*
  * sqe->splice_flags
diff --git a/io_uring/io_uring.h b/io_uring/io_uring.h
index b2808222e..b8c2bee11 100644
--- a/io_uring/io_uring.h
+++ b/io_uring/io_uring.h
@@ -584,6 +584,8 @@ static inline ktime_t io_get_time(clockid_t clockid)
 	switch (clockid) {
 	case CLOCK_BOOTTIME:
 		return ktime_get_boottime();
+	case CLOCK_TAI:
+		return ktime_get_clocktai();
 	default:
 		return ktime_get();
 	}
diff --git a/io_uring/register.c b/io_uring/register.c
index 802cfd6a9..38495369f 100644
--- a/io_uring/register.c
+++ b/io_uring/register.c
@@ -453,6 +453,7 @@ static int io_register_clock(struct io_ring_ctx *ctx,
 	switch (reg.clockid) {
 	case CLOCK_MONOTONIC:
 	case CLOCK_BOOTTIME:
+	case CLOCK_TAI:
 		break;
 	default:
 		return -EINVAL;
diff --git a/io_uring/timeout.c b/io_uring/timeout.c
index db78059cf..43a6afd6d 100644
--- a/io_uring/timeout.c
+++ b/io_uring/timeout.c
@@ -43,6 +43,8 @@ static clockid_t io_flags_to_clock(unsigned flags)
 		return CLOCK_BOOTTIME;
 	case IORING_TIMEOUT_REALTIME:
 		return CLOCK_REALTIME;
+	case IORING_TIMEOUT_TAI:
+		return CLOCK_TAI;
 	default:
 		/* can't happen, vetted at prep time */
 		WARN_ON_ONCE(1);
-- 
2.54.0 (Apple Git-157)

