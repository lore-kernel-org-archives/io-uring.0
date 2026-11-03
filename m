Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740241;
	b=eICQDKORgpsKsOQypEb21Th1SNO+6ydivNfH0BfEBN3D4ARd7nEgH2b+bn3p969y54iQ
	 94fjIczB2sleBuOzCvbAmy9D0c7RwYavwzzUtpFEHbQ4jAadQES5tx20ZXpTBOHabpskJ
	 HhNFkuMHnPlOYJHFhLt+5qrSbhLMad2GjLLsDN7FPWPlbkOv2unzeJRMpaus4sRdKQUY/
	 HKHt9gmZOBQWpmwXZdQeCkxHe9xnl2p3RVkYV6+4kgvEVRLu0QvGGVlaZJ7kE4tYFuG2q
	 g72hh2bv8xnL2YDLRvezHzTRtONYxJr5V+mJ8xkpV+qL3G/oACzldyNtc0Jst8Qe7EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QfgVica9FpZIxusF6VHYk1fj5PRdNjO2VJQ+laDQ2b8=;
	b=dFP0nYdbCzB/30JvYnFwN1XoZY5/lq1fFqirQCVMJ1Zk2TDQ5m3XQt8LY/EGZPEOpM9X
	 BIa+BaqBlviAONkW+MFh1fgtKAGRPsUnzKUKb1eRELHE883dstVqYWeYNwup00VggwLi/
	 wcufABh0teDBs6bVLRxeGsQCbD0+G4NKV6Pfvl1P/870mVRTZyT8YXQHMUi36Wqse1nXr
	 kQsUTaliUP1e3k5Nt4SHbZbZctamy9j6Owj3OWtJ3jy2ZUHS3hDm9jQR7MW6LrTGcxcMY
	 vqtl0fLsxW4Wj73HbDtIDANcjYzhrmx8LRfkx3Qo0VYuWEtttjTtaJ4HE5N+f15xA4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=QkJKllbe;
	arc=none smtp.remote-ip=209.85.128.98
Received: from mail-wm1-f98.google.com (mail-wm1-f98.google.com [209.85.128.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F985606A328
	for <io-uring@vger.kernel.org>; Tue,  3 Nov 2026 21:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F985606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=QkJKllbe
Received: by mail-wm1-f98.google.com with SMTP id 5b1f17b1804b1-4a5348aaba5so7005e9.0
        for <io-uring@vger.kernel.org>; Tue, 03 Nov 2026 13:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793740239; x=1794345039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QfgVica9FpZIxusF6VHYk1fj5PRdNjO2VJQ+laDQ2b8=;
        b=QkJKllbemhONEWEC5HcRlBbpO7Y32P5htwNpi1buSuukJVQOsy9/hHG+stM7ACb/Od
         6AvnEkh0xnSKRN8LfHc/jHNmWcYbZHMrlzPp6yLNGc7mJSDzD1MshYACbMrDgNvleeUT
         uV6Iqqezs5JT3G7niZw2MtzUc2enV8ifcSx54psUgm6hDHn2UsGfmU3COAZkbx3nHHHS
         FEZ7XE4ivuyjOQCJYwVvKJQnV9iWI1IwN1FmkycEUTfc3qZnndrNaRk5LgRgy8U7dnTM
         CANkpxQiegxfQe2qf0vy9C2wrSE/hvG1Ddx8+nYYMSP9wLaK7lggjIlAObOtVNOuRKgT
         pkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793740239; x=1794345039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QfgVica9FpZIxusF6VHYk1fj5PRdNjO2VJQ+laDQ2b8=;
        b=ojcZLzJIrk/k4DyRihldDcHsffH1P3xUqtzKtuKK0M7MaMYFdiWe9gkVPLsfyAjV/N
         ZqhCy2S7SnTWBI5j2ZEYhLp7XgmHM7aTYhQdjX1kHoCk2GDk6T0MiQ8pWvsllBxpRTJU
         abkRgXW4vhADSTSkT5hOiJmR5rzsvWfEMD75x5OkaZi+qZdcHcl9Tekf796bLsaOWsJ5
         V2nul4VNAOetQNjiqh76mNxryTzp2+vQaTwZhowWblt2AlzvFSxxHKW7bIGF91XRucr6
         wUM+6a7ed6tedZ4n5yYRyYe09oiTTSgiZRbQ7Vf+HFtACB1BAtAjh/fhrbTz/U+UEj/t
         +j9g==
X-Gm-Message-State: APuU4Z9UduT2vxkINjGR0EmWuICiKbc0ZAvzCX98Vxn8e+SyQ7ACq025
	0D0hImle4M+8PZ5/yrjto0bxrDlwx/rprpL/RP4269vEam8tGAQ2Vql204cpNWETpSds2/yLriv
	LLu/KLeQOR9r3ax728hbEmfEz4RydNyF2rd1BAdDTbOzdQTKnCR/s
X-Gm-Gg: AYBFou0pY0KGsXKPNqa+LZrEvalj9SuVw2iEzK0Jg4R7vt5bwhcl8wf+zBZnufreTMO
	BY8OotYDlbrBO8A0zyRm24Ny+Fu8TdWCJqVNG490zNKp9Kx7KAckrvl0L4S7xLeL28nqumh0/qT
	A6ugJZSkfbbNFDyYxQLneJtvSR9kWR2EuZqs00w4gncb4kbh8i89jRTX+quCPkEziHRRac67MPq
	Oas/U0ZviBkIplWL6GE4I+2/sfhSN0ealQIqSnMpPfCfIgU58EEr82Tzj9TSqJqjqjslGPn+SZH
	0k5Ct4GT35cCfU/XntnlgfyMOj+jxtIwsoqeXHc9Mu+Y/RZjOO9Nf0rt2dkX4oj3omhUygS0O05
	Dl7svQ7sOkHFuN5dA
X-Received: by 2002:a7b:ce0d:0:b0:4a1:715d:1913 with SMTP id 5b1f17b1804b1-4ac177538c5mr250973455e9.1.1793740238663;
        Tue, 03 Nov 2026 13:10:38 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-4b43cff40a1sm86955e9.9.2026.11.03.13.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:10:38 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.17.2.4])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 499ED402A2;
	Tue,  3 Nov 2026 14:10:36 -0700 (MST)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 3DD15E40437; Tue,  3 Nov 2026 14:10:36 -0700 (MST)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 0/4] io_uring: improve alloc_cache branch prediction
Date: Tue,  3 Nov 2026 14:10:27 -0700
Message-ID: <20261103211031.592745-1-csander@purestorage.com>
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

A call to io_uring_alloc_async_data() that provides a struct io_alloc_cache
currently has 2 unnecessary NULL checks in the fast path:
- Of the struct io_alloc_cache *, even though it points to a struct io_ring_ctx
  field
- Of the void * entry popped from the cache, even though all cache entries are
  non-NULL
The compiler also incorrectly assumes the success path in io_alloc_cache_get()
is the unlikely one because it's written as an early return.

Avoid the first NULL check by splitting io_uring_alloc_async_data()'s cache
logic to a separate function io_uring_alloc_cached_async_data() that uses the
cache unconditionally. Avoid the second by returning a separate success bool
from io_cache_alloc() instead of checking the NULL-ness of the returned entry.
Also mark io_alloc_cache_get() and io_alloc_cache_put()'s success paths as
likely so the compiler can avoid jumps in the fast path.

The final commit is a small code simplification in io_futex_wait() noticed while
touching the neighboring io_cache_alloc() call.

Caleb Sander Mateos (4):
  io_uring: split io_uring_alloc_async_data()
  io_uring/alloc_cache: mark cache success paths as likely
  io_uring/alloc_cache: assume io_alloc_cache_get() doesn't return NULL
  io_uring/futex: avoid ifd NULL check in io_futex_wait()

 io_uring/alloc_cache.c |  2 +-
 io_uring/alloc_cache.h | 25 ++++++++++++------------
 io_uring/filetable.c   |  3 +--
 io_uring/futex.c       | 13 +++++--------
 io_uring/io_uring.h    | 24 ++++++++++++++---------
 io_uring/net.c         |  8 ++++----
 io_uring/poll.c        | 13 ++++++++-----
 io_uring/rsrc.c        | 43 +++++++++++++++++++++---------------------
 io_uring/rsrc.h        |  3 ++-
 io_uring/rw.c          |  4 ++--
 io_uring/timeout.c     |  2 +-
 io_uring/uring_cmd.c   |  4 ++--
 io_uring/waitid.c      |  2 +-
 13 files changed, 76 insertions(+), 70 deletions(-)

-- 
2.56.0

