Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64690411665
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141325; cv=none; b=p32Z78oi5gNg6D7Tt7UOi7T/mHNueFy0bHXy2JG7BFGRdlqD++wJxiRH1cNy0p+yFEFm/Fvg/RHYUVihFyrZbh6IKNi/GK2Tbcd68Va7+EOOpUzE/Gq2cAZ2und3KPLwiV91QCSZ8FH/zSMuBQDRWDb/nCmCz7GrFf9jbEmN8w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141325; c=relaxed/simple;
	bh=KJRnZ7USBDtOxaI9oLCCZhPnMHJSo9U/cVcNXiZ7Jrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V9eyxQ2HSpMf7tn5anKbbFJOSjah0HF/a0oztYqHd8TiWkR3tOlear9usTAr6WkADdKiSwF+zy8K8qui8BZ+QPW+Afrq7xbCSSPbV7Q2T73IpRYTcHY5Ouqh8kMBguUKTenDKj5Cb4kYfv3gDA6x3QKWs6YKCrFACKEhVVAa5ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=XCPu4FNb; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="XCPu4FNb"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccde2ad8so702818fac.2
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141322; x=1789746122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xN5FMpx5BomrnwwRlZAaFF7UH1EwB4frjE8eycmnS4k=;
        b=XCPu4FNbY6WeYi1MpCfIjFhynJfGO6JxH/YNqvjIrRbksojK1QaTuf9RKdrOTdCgTn
         GymY3mqZFcj18u+h6+cgX36X3NaRkfX0NLQxRUMc/16bUbKaSm/vYWOYeF2K8tgqoKqn
         A2iP96F31aekg35+EE6m8PUKMktOD3W6lrIAbj0Tgi2FloGaWqcQej18oKFSJlpUHoX3
         n2sHhDT0d8D62XwjkoxN1FZDDxfK6+CgHUwrprRnhpIoRwgU1RRvw2fRYVUCwscE+EMu
         1vIhkM0VWZFZPMdEH4ltwPR/BV2sobr1kwxSpFdlIKLcYbUrSshQZYt2UjcFMHHWMlew
         2AuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141322; x=1789746122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xN5FMpx5BomrnwwRlZAaFF7UH1EwB4frjE8eycmnS4k=;
        b=Ei/vVnylf/PsNJ8/sQwXss+oLJs+Bu61OVD+KtiUFuCF+j91ziPkMspi4GRmD8Y4EA
         7xoz6PL80kKXLE1YL+NakblJttYWGmQSgrnMnZwVRnRYwpOS3A1F31mOO9DoP/iMiCiR
         s0dryGibAdBd0OBwK0Q28QVUN15IDQydzy6YBvNO0zWeNa6K4LEAikGRNyC2QUCpQMcq
         23z4yqe74NPVYAHeoAs11MRmJhfGaPUGvhebUAtGcUx16xyO9bFwP3yH3Z9gCJC2HR6T
         0qQuBRHBtuKPUkjvnnw5LPJMQa54iNtEJ9ODm7W6WE12dCfEATs1Mj0NXB2se3Torl0M
         JRIQ==
X-Gm-Message-State: AFuF++kZ+WLNl19Epxv5IjJQ8zpjbS4IPOACH74B5w8wqlYUqb9KLig/
	LxN+BylAF70fk2jBkuGqkNiM25s9Gd83hPIXydnbfxBnCu5V+JXWSWQKlBIbSy22l9ZIZw7HMkL
	ocVtVTFw=
X-Gm-Gg: AYBFou2e7Dj7bLwLXaKtPN3pPwCFNCwgb4cKKVcc9CXTQiketalfQ4rdu6kQKDgecJR
	t4qDZ2qxGLrFRWjtUSnMzFjZ1M1xSjIbKWINXy/Zjf7KnDUk4FNYTtuu0tVr5rws4bE2NmgnKz2
	jviLgEo/K0P/ODnz94YfcXQoblXtzg4oM5tZvZDVZnDitTwZymWOOTaRE8AQRvn/NOtHH4+z0g0
	1fofqEVvq9I31iWkV2cZFU5IJxNXmbV5n6oM4ENxW+9XXHjeJ+vfgyfBoTVvKM8nxX115UITfhz
	k7E4RMQVz6D4oSqSPYAJc7eFttluwc5omHQ9liIZ49fCWWEVlc8cFa+BCbYIA0NjKU6h+nkS12s
	1jXStM5aqSfuhXHEyMdoEPvDBZ8oJr+H+QQHakohtuddEdzXAUCmxBBqyRZvg9hQDgyeEz3OTSt
	SbNic1j91GPqbZYtJVTcUgN6nWwHWWMj3mguwGOBh9zWtUgnxXy+GeENHvCgl/1jhSpXGpRfJzz
	NWcXCJ9Xq8yhvIKEpraXkQRkUeIVzRAQh1wXYRrSYA=
X-Received: by 2002:a05:6820:208b:b0:6b3:50e5:c625 with SMTP id 006d021491bc7-6c0bde62624mr6480780eaf.32.1789141322172;
        Fri, 11 Sep 2026 08:42:02 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:42:00 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 05/15] io_uring/kbuf: use io_ring_submit_unlock() helper
Date: Fri, 11 Sep 2026 09:40:55 -0600
Message-ID: <20260911154148.644489-6-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk>
References: <20260911154148.644489-1-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_buffers_select() open-codes how it unlocks the ring based on the
issue_flags, use the generic helper instead.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/kbuf.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/io_uring/kbuf.c b/io_uring/kbuf.c
index 7c309173dd19..8f04e6cc773b 100644
--- a/io_uring/kbuf.c
+++ b/io_uring/kbuf.c
@@ -371,10 +371,9 @@ int io_buffers_select(struct io_kiocb *req, struct buf_sel_arg *arg,
 		ret = io_provided_buffers_select(req, &arg->out_len, sel->buf_list, arg->iovs);
 	}
 out_unlock:
-	if (issue_flags & IO_URING_F_UNLOCKED) {
+	if (issue_flags & IO_URING_F_UNLOCKED)
 		sel->buf_list = NULL;
-		mutex_unlock(&ctx->uring_lock);
-	}
+	io_ring_submit_unlock(ctx, issue_flags);
 	return ret;
 }
 
-- 
2.55.0

