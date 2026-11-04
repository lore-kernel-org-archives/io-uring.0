Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789235;
	b=FxPlcTF7UR1iOTTwM71i+fXYSuXEpSC52C5Jvury2AsfVt2qWw7oSJRNJEWYPlWpWePD
	 wuwoMVAYg7NVWuASWA5dV64t0fz1PDBHLUlapNwiuuCs7j0MiqdCyOwTxzs5aQD3FzDpH
	 I37dFBNJy+OB30qL+6C1VLHsWYzUAYZuanyWIHeTArKJsj4Dl4YtBXns/vCrZT/As4Bou
	 BNGd1wtn8Y8ygf0MMiZITxG77ht2wP5HFbv0Z5uqHXEfQ/tc1NZTrNKUzBfh9MNtcwZho
	 OT5nGq54951tbwNaDPO/AOEmgn1ezDTXddWYpq4abMneV9vMv92g6vkrg+TbAcmpX0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=BEXz1LuJIZZbDvvCWJd85Kn6TbnD1tQOEsLorkcUqdk=;
	b=vBkCO1wjfFq/ouGXBgUckhOcM2Esldyzax6MBF6NdHEGx2mbvuAucQAve1gE65pYsdo4
	 GvQoiv/GSl7rbjHFzdWjA3Riso/3COlm/wHqhQEvsMxkw/EZBRg0ZnkFhTYjfuRsZe+Bo
	 bttR0E/gwhF/HcaQ/TuvbphMGzyymudP63u6uE72OXKkNg62BmIiIIKg/99kyQpz+2wnr
	 LGhF3LY0HyAxzs2Dg0BTycs40pc3O1IEFvkQEft2L5Sg396Zqgzej6FukBSOq35u3qWAs
	 4ySHo8KPQ01XhjmnVqKbhho+P1v2prC0oMNh1OYxasA+Sr5LDhKuEIWcDSH1/Dk+72A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="w2N/DmNp";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311E9606A31B
	for <io-uring@vger.kernel.org>; Wed,  4 Nov 2026 10:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 311E9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2N/DmNp
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so4755345e9.3
        for <io-uring@vger.kernel.org>; Wed, 04 Nov 2026 02:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793789233; x=1794394033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BEXz1LuJIZZbDvvCWJd85Kn6TbnD1tQOEsLorkcUqdk=;
        b=w2N/DmNpPwIXaTpaoKT9IyTiuaSGnVMilaMapK6pvaJDjtS81qXIhfaVP7n66aHywl
         OfOAlm9wuWGF7QYi0bBk6nd/Pl9gcjM5kViunRTKN1x/1Wi0mYLLK7v5iUyg5tc4RpaE
         UPQyIPsoM2FwohtCjA9wkau8320+3yBXZaYnBgZrR8j83wOTumBxK4BEfjOJsqu6jC0H
         icvrKYAcew7gIbGGI5/w5SHFtwWq1p026cTn9j+T5sipAw26Nx2BDLbwDCiCLjtx36oP
         fTAfpazoMKgc+l6a/BOVd8yW4O2nnwhbrbxiun8YmMH4iDKvyavTpX0ifevYUaKsKv7g
         kPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793789233; x=1794394033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BEXz1LuJIZZbDvvCWJd85Kn6TbnD1tQOEsLorkcUqdk=;
        b=KMKF3Dsd00vas39LFi+ewPN3mQoEy6/keMKiX6+pOvt8tG5TQIc5T81UeN962zFlDm
         NCssAbXdz3grs9+eSBFW+Kh6b7X2W6JR/UjruY52GI6Trdz4aSUhS4kW1jLUP+ZaC/fL
         38mDF0gBlfb4Nt22Zansy6w7RlM4nLX3n/SzLQ8jLh/CxTMlofFYzIddTTMfUTd7vVmE
         qJyS2JF7gNHHr/ZQ7voeUE1YR+tlQCKB+FPY7xTDy1Bs81eHEY0vY8Im8V/Y7ooX+bz2
         Hf/ZUX+XBKbG0zbVrcPL5V8OqhJs/CAU0zTk0ITNHJvEX8GwyBOQtK98Ef8QbDVuekOQ
         e92g==
X-Gm-Message-State: APuU4Z8noSNrM+fpKE4+DcNhbYqlRo+wbbSiuMP23UE3sA3m0hJxtBkk
	kJsaqD+X2ycDQkSztHMwODz6QpCuDtc1zzhTSetk5zo29XBX0unALW/Gk/CHnBSBAyo=
X-Gm-Gg: AYBFou0Em2wP6t0ZPsGYK1U/o0eI2ejEink0pgOvtAc8+hHiffVTTitpAo+CYrW6oy0
	dzGdPLM1NKOKXPxL6heRyt30WmlAVk03xF7EXkznfaSZHfCL4YzihKdFd9qEyrIKnCOUl7zdZPB
	IPOd0Rj9m4fpO/Mwh1zn4y6EIodFFmf74CNGrVKB1hvS1cOgnlyM6YaafBHNqW2050lPeA6SKxB
	t6qfcjqQBmBK6kEKADapeqFEm/W4iQs7qE+GvqQhUBrq+n2PsupUvARQLyKvKDgScbdiTgTuhJb
	poX5246WV+aHnyxUGY/2kSRVhwYK9dP+ZdAqQbpWTeU0NrVlkknwqPzQjpaaTyCSEbZwpmBWwcQ
	e6E0UL9cXLUiIsW79+iA7J/07/4DaRF/HwMCNcWxiafZytrwHx1xk739yN1o09pZqYGgnsMDr6T
	DWFcJ6ZjtlcWEyF6HHnrbcVO2SMoGyCPJhjmK5hTfTdKsQi1bWiWt8Kn0DFbeb/4dQX6nlZKmUD
	6y9O694ki7RSteY8ibBTlScwZjsWiuoAyv6viUCwzY5PL+MT0TRdZKWdYt12TKmq50oQ/c2Z6m0
	YXdhaLX/c+eezLIoli/t+NclkFve5OsY85vylym0yJ5bq9mc+EAtA5BA7LVWClP6AA==
X-Received: by 2002:a05:600c:3f0a:b0:4a1:d8fc:8165 with SMTP id 5b1f17b1804b1-4b3c3545341mr56823565e9.20.1793789233369;
        Wed, 04 Nov 2026 02:47:13 -0800 (PST)
Received: from sagemcom.ip.net ([92.85.132.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b414b170d0sm33350885e9.1.2026.11.04.02.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:47:13 -0800 (PST)
From: Ioannis Coward <ioanniscrd@gmail.com>
To: io-uring@vger.kernel.org
Cc: axboe@kernel.dk,
	Ioannis Coward <ioanniscrd@gmail.com>
Subject: [PATCH] io_uring/wait: don't sleep on an already expired timeout
Date: Wed,  4 Nov 2026 10:47:07 +0000
Message-ID: <20261104104707.2031280-1-ioanniscrd@gmail.com>
X-Mailer: git-send-email 2.56.0
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

When io_cqring_wait() gets to the point of sleeping and the wait's timeout
has already passed, io_cqring_schedule_timeout() still arms an hrtimer
for it and calls schedule(). The timer fires right away, but only after
the task has switched to idle, so getting -ETIME back costs a round trip
through idle plus a timer interrupt.

NAPI busy polling hits this on every wait that times out.
__io_napi_busy_loop() caps the busy poll at the remaining timeout, so when
the loop runs to its end without a completion, the timeout has expired by
the time we get here. The task then stops polling for several usec, and
packets that arrive meanwhile are left to the device interrupt. This
affects one of our production workloads, which currently works around it
by having another thread signal an eventfd on the ring before the timeout
expires.

A wait with a zero timeout, or one that runs out before the task gets to
sleep, pays the same cost. io_uring_wait_cqe_timeout() with nothing to
reap and a zero timeout takes ~11 usec and a voluntary context switch on
a Zen 5 desktop.

Return -ETIME without arming the timer once the timeout has passed, as
ep_poll() already does with ep_schedule_timeout(). A passed timeout ends
the wait with -ETIME whether or not a min_timeout is set, so the check
covers both. It costs one io_get_time() per wait that is about to sleep
with a timeout.

Signed-off-by: Ioannis Coward <ioanniscrd@gmail.com>
---
Compile-tested only. The zero timeout case can be reproduced with:

	// io_uring_wait_cqe_timeout() with nothing to reap and a timeout that has already
	// expired (here zero) should return -ETIME at once. Count how often it sleeps instead.
	// gcc -O2 expired_wait.c -o expired_wait -luring
	#define _GNU_SOURCE
	#include <liburing.h>
	#include <stdio.h>
	#include <stdlib.h>
	#include <errno.h>
	#include <time.h>
	#include <sys/resource.h>

	int main(int argc, char **argv)
	{
		int n = argc > 1 ? atoi(argv[1]) : 100000;
		struct __kernel_timespec ts = { 0 };
		struct io_uring_cqe *cqe;
		struct io_uring ring;
		struct rusage r0, r1;
		struct timespec t0, t1;

		if (io_uring_queue_init(8, &ring, 0))
			return 1;
		getrusage(RUSAGE_THREAD, &r0);
		clock_gettime(CLOCK_MONOTONIC, &t0);
		for (int i = 0; i < n; i++)
			if (io_uring_wait_cqe_timeout(&ring, &cqe, &ts) != -ETIME)
				return 1;
		clock_gettime(CLOCK_MONOTONIC, &t1);
		getrusage(RUSAGE_THREAD, &r1);
		printf("%.2f us per wait, %.3f voluntary context switches per wait\n",
		       ((t1.tv_sec - t0.tv_sec) * 1e9 + t1.tv_nsec - t0.tv_nsec) / n / 1e3,
		       (double)(r1.ru_nvcsw - r0.ru_nvcsw) / n);
		return 0;
	}

 io_uring/wait.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/io_uring/wait.c b/io_uring/wait.c
index fb1c08299..edc589302 100644
--- a/io_uring/wait.c
+++ b/io_uring/wait.c
@@ -165,6 +165,16 @@ static int __io_cqring_wait_schedule(struct io_ring_ctx *ctx,
 {
 	int ret = 0;
 
+	/*
+	 * Don't arm a timer for a timeout that has already passed: it would
+	 * fire right away, but only after we've gone to sleep, costing an idle
+	 * round trip and a timer interrupt just to return -ETIME. NAPI busy
+	 * polling gets here like this every time it spins up to the timeout.
+	 */
+	if (iowq->timeout != KTIME_MAX &&
+	    ktime_compare(io_get_time(ctx), iowq->timeout) >= 0)
+		return -ETIME;
+
 	/*
 	 * Mark us as being in io_wait if we have pending requests, so cpufreq
 	 * can take into account that the task is waiting for IO - turns out
-- 
2.54.0

