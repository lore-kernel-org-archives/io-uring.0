Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8566B374E57
	for <io-uring@vger.kernel.org>; Fri, 12 Jun 2026 02:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781232692; cv=none; b=CIwL4FYPMuBBCeB2LlCRygsQ7kacXxtpCV/HvkDPtllCxyM/4dH80AhfDBwr2vsAKrXtFWk1rd7GWFQZhCGKrWbqjOxqeOeQ6/agoSK4/2MC78osQoaEKLyd2rwrDrnoPSIDvhKiRr317tMB5Gz/yh/qo548enfk8okusZPuHik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781232692; c=relaxed/simple;
	bh=qeEq+jXLKSBeftNrL0mxrAEPEAZdpztu4D0rIVaClLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oe8b9KdZIVJw6QRZKdBEdv/Ry9K79KdD23TgyEBVYo35MgXOa+xuFyyOJRo3F9KR7n+rPvx5LYBc78ER6oa8FcvSbrc+V/sROK29CZYTP83TeaOn6yWvFeTMnIzt5bCl0PVxU+wRO2zlk8oaFuUPfqj4d/gYDGKgM+cKa3qdj68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=q5ROqATl; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="q5ROqATl"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7e6fe199b81so224590a34.1
        for <io-uring@vger.kernel.org>; Thu, 11 Jun 2026 19:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1781232689; x=1781837489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vg2z6CM9xvgBbX9e8SKGvNps2itWk5mL8lT+FpybT60=;
        b=q5ROqATlmYx82weYiL72jTRKt/hbZjz4r9IQubJoqYZzQQuBR53cOdEoInTkAjLuNq
         StSUg3jaJjC6smvBeoWy8t0nkxnkKOPskVnwy/9EuCyCfFlhnrRuRX+1PJ14LM1kvX7T
         nTc/AJe3Gx1qh0N/XGsXAKIsoqdyPjN9uVTbhCvo3M+2s4t1cSfs/S25/5C3eeUYt/dv
         DrP6ePIsvpvU6E61wotqHazG9ZScHOfRrCTdMAleeiCq0xL95r6AXvPb6PNPtZ8fK77Y
         3CRNRgXGcjERUTjDg6IBbLJjqWeR1qyoRXTXcle5ikAFdVw0Wa0/3EFq1zPd/b79fzuH
         rrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781232689; x=1781837489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vg2z6CM9xvgBbX9e8SKGvNps2itWk5mL8lT+FpybT60=;
        b=WjZpQ+hE7sfLptI9MdDlRuCcYqg4zFF0Wl+Lej2ZbpcFhKzhz3TSZ6qOQunsAcUZJV
         3oSRnG/xv+z60TymePiUeT81EHBzt6VUsv8HtxKgW/Xa/9o2Z999kJr4+dj732bxjU2G
         kPwE6H0ClszR4o+cxlCQvDN5zWGzgxMNuL59NQDZ0yuQjv1SFX6WcCP1hlS+mU2B0OdM
         VUO9Ver7Hgj6g+J6IlWiu6q/FOWjXmpItN16/LpG4SBDdK4Y+k3694ZJRKXies8rf73P
         ZdD4RT+Ye8WVMHb+yo/klKDUnlVnsUph1dOG9odEXDiaA9VaanWnGtl/5WbbPCDv1Wg4
         fPGg==
X-Gm-Message-State: AOJu0YxQYYyBrFIfnnS2xi2+2tstXxtESvZ7hlaMxcAgMxmjs5DoNdWB
	AmRXR195mPc/ZHaAcA8ZJ4fcTfx1ni1bzNIpqrGvNuc0M20B5J7c9Re9AljkND7n1nqL3LOLFvl
	U60MACUc=
X-Gm-Gg: Acq92OHTZZu4MRRLs/4GrxveFCMw8+T/OwhAB7ZSUabT/7B8B0zgDnVecqLOYrWGUju
	mC5o1HU7ZtPJIZTnwDjzwlp7CUy+EKs1N49NYBIkBDr6Q89WlNlu2PQQiwLM3NZo2oczLMPSpvH
	+Svowc6sQc7FWqm/3YeDh6Ox1Pz6gkWbcciUXHec4cngATgcPJxxLItiAG5Vyqymwrt/u18j4v6
	BHQjgQHoZ1U7Wr9tw0n+lOGERjC9f/q8KaZ/8ynqqbJk6pRPGR114Z1EF4np/4RoxE+5/v4OwAT
	nr8VB6KXhVVYg62GtkxWNFISOJBk0i6+XlQDab2J+drFaiR5RrAzlW5mok0xsZ6xQBuU2fS/c9e
	opCY9AgC6ENQQVRaCpVxLLV2nOnWIRwukMeA/2MxcnMJIKHCJ/Sbdc3Ojl4f8foTnToTAAFPkOM
	bsPm41f1+kyuty/hUF/ov1h/2gwBIzocAZmAY3PA3DFy7zt2eTl0lALkdY3PlxMoahRr6Y
X-Received: by 2002:a05:6830:3912:b0:7e7:31c:c121 with SMTP id 46e09a7af769-7e784771f05mr555059a34.12.1781232689394;
        Thu, 11 Jun 2026 19:51:29 -0700 (PDT)
Received: from m2max ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e781734190sm862128a34.19.2026.06.11.19.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 19:51:28 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: dvyukov@google.com,
	csander@purestorage.com,
	krisman@suse.de
Subject: [PATCHSET v2] Add lockless MPSC FIFO queue for task work
Date: Thu, 11 Jun 2026 20:48:26 -0600
Message-ID: <20260612025125.1690253-1-axboe@kernel.dk>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

For v1, see here:

https://lore.kernel.org/io-uring/20260611160553.1486640-1-axboe@kernel.dk/

v2 moves the regular task_work over to mpscq as well, and adds a few
optimizations on top of v1. See the changes section for more details.

Can also be found in a git tree here:

https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git/log/?h=io_uring-tw-mpscq

Changes since v1:
- Add patches moving !defer task_work to mpscq as well.
- Get rid of ->cq_wait_added and the associated atomics on that. Have
  waiter set ->cq_wait_nr and just count down from that. Removes another
  atomic in local work additions, and eliminates the need for the
  atomic_try_cmpxchg() for the faster lazy wakes.
- Get rid of RCU read lock for local work additions (Caleb)
- Cleanup up mpscq API a bit (Caleb)
- Correct mpscq comment (Caleb)

 include/linux/io_uring_types.h |  39 ++++-
 io_uring/cancel.c              |   2 -
 io_uring/io_uring.c            |   9 +-
 io_uring/mpscq.h               | 118 +++++++++++++
 io_uring/sqpoll.c              |  30 ++--
 io_uring/tctx.c                |   3 +-
 io_uring/tw.c                  | 307 +++++++++++++++------------------
 io_uring/tw.h                  |  11 +-
 io_uring/wait.c                |   2 +-
 io_uring/wait.h                |  10 +-
 10 files changed, 316 insertions(+), 215 deletions(-)

-- 
Jens Axboe

