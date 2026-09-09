Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06E957C73B
	for <io-uring@vger.kernel.org>; Wed,  9 Sep 2026 14:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963044; cv=none; b=cLrHt31lkt8IIGVdvuHhqVeZwQ/ZsWie5eEdLM8P3gFKR6F8NQG2LDQoqgf58zAUeND1rTxgVrpn3B2w6UEII8T1sQ+YfqW9s/Vu09RfaW/PHzON9fSmKooXEAXIgmC4Xfs+M29ZN05+nEGiTMzLJNN1c65x+A3uqgrXh+Yo+Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963044; c=relaxed/simple;
	bh=vxjwuEhsoW8yHsheIG3MSVpcHVM+rf2iCLljipPWTDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EUg2vLim4wdHmTBKzfXjgGl9doYN6GSwpW/8x+DEc4aMx2JncTG/JpTyPtx8SP6OuJn/rdw9wFI/ZwXrePgAJlYCj3Ooz7/O6hQK6lMirPqrCXoJds+OyW3RHCUss2DMeaOocxyZeMr9f9gWC83BN/Q//cIdcJ6cAOXWL9VHY8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=ReZCWAT+; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="ReZCWAT+"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc9ab667so268189fac.0
        for <io-uring@vger.kernel.org>; Wed, 09 Sep 2026 07:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1788963040; x=1789567840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SN4bIFfM62VV7sUmVsxrc3nyc1CuoB6PmtfW+NV+gpA=;
        b=ReZCWAT+K8xcEE8oSvpy+ixl2zhYGm0Z41GKMT3Y/gr3pYjJC29sTLKL4SB3/bYukJ
         9sH3PV4Z3P0mw8SPSOv/bw8Hh0EJsKnIJ5RTJiIjaIcdikLKncWQnSwBZ4sRA9h/+erv
         6xyv+8l84Q9mphKnYMjL4XwEl2xr51owaK//yJGL3Dmm4mUx6g+5nwbt1G/5CkGrAw7y
         wJY7bAy9MB6d5CvuO+igWH56fM+OWhs85V7rkCuwaPtYvb+3agvkV9QaBtA8wotesGCh
         ZHcx1VXhNWQxaGL1alu0scJYRYRr93+4nGINlXe2Kll4e9hwY+kNLijf7qnV8bKR5uIv
         pNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963040; x=1789567840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SN4bIFfM62VV7sUmVsxrc3nyc1CuoB6PmtfW+NV+gpA=;
        b=NfJFSgfwx1ijTQavGTUMe/xJFb33gDI4xKqOmq7DVwSgtjZIp3ARs3F0tGRJEUldG2
         b4nN5snI3g3pAGF8Cj9uGnRNv3sSS8lyLZumhh6Phbepw9jaH2/4pF45SlSH12RBeBxF
         0AjDehAGHxU7zFmWnxTtgEoKyZXyx7DQw+4aUuhnuulE7i7EdLnsDwadH/FkvIvz5XUV
         bLjjli/BGOK4sQToRRcXy9fvWC8o0TUHecUbbsKGTCUWgOqB0nBEQipQI0AeEHXhByXV
         n1lPI0TTgG7evrP2yVTkWYkTRtahDHQxX5TeuTigmHvk+HRmkrlsR0FU6eZe40TqSdLH
         NJYQ==
X-Gm-Message-State: AFuF++lDigFr3KLrN9FbqnMoNFCseGZ99xYBmxhV8JWl0H4Gvo/i7Oyi
	bnTJDM+YVSvWuKL5u/k4ScZGG+Dy25pZGdc3JB+VAFStxyk6XoYR/CBNuJ9+MDIJz+TFBpp+/Tp
	ZX+fTea4=
X-Gm-Gg: AYBFou0QTmwEWHFxLUBJSpz2MeSU0Gaz8k5U1ZGFLHgj66eUhVdjAQSGo08UuZnmRK8
	qL7PCOahgrY29gslOurG3b31gzjmB0bQrtUNZtRxlOtX8ePtXeSIs0rjtWYm+22rNRbmeUb9113
	LH1ZfM7GJ6j8Giuma/AVeJ/X+QI2d0/nm+YbB/aAW2sefA1DdHjnxPKtyUSi3p5jeueC64aJ3k1
	VAAVhwW4aMJa86YbqbasEUQPlVmgWr6/mi9T9wqPeROgJ8jlVrDMAiWpAfRraCdA6Dc8b0hebVE
	35zF3YqnBetY6ZAJ0xCK4AZ7RspDjvi9Xdik4C6T/YOF99Two0Y/cybqt09whWUXZhrxAzdn7S9
	8KVdNMxvcx25TpoDvimrfEmkD0kyD2dVIwBXBzl1SeR8L5JuG/5pxqP9ZiiQZM42zyeHS1xNtdY
	8vq5AVIjksopgopknIMUbHiMXfa/1t47hzAJavXvHo4d2unLcwFnK+n+i7ZGoc/dHQo4dz577Ms
	Ol7a+yVUCYVGtD8swrGz/KrSZvw2SNxmQjeDsOklh+g
X-Received: by 2002:a05:6870:e0d3:b0:475:a153:2dc0 with SMTP id 586e51a60fabf-47c51926187mr570751fac.22.1788963040435;
        Wed, 09 Sep 2026 07:10:40 -0700 (PDT)
Received: from m2max ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47a7585b25esm5406514fac.11.2026.09.09.07.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:10:38 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: juanlu@fastmail.com,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 7/7] io_uring/io-wq: put the request file before posting a completion
Date: Wed,  9 Sep 2026 08:06:17 -0600
Message-ID: <20260909141010.21064-8-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909141010.21064-1-axboe@kernel.dk>
References: <20260909141010.21064-1-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Once io-wq is done with the request, put any potential file that request
had pinned upfront. This ensures any file references are fully put by
the time io-wq posts a completion. For registered files we don't need to
worry about this, as these are canceled/dropped earlier.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/io_uring.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 32adb2d26d17..b5dc55bba195 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -907,6 +907,24 @@ bool io_req_post_cqe32(struct io_kiocb *req, struct io_uring_cqe cqe[2])
 	return posted;
 }
 
+/*
+ * Drop any io-wq request with a file upfront, otherwise it gets deferred to
+ * much later post CQE posting.
+ */
+static void io_req_put_file_iowq(struct io_kiocb *req, bool sync)
+{
+	struct file *file = req->file;
+
+	if (!file || (req->flags & (REQ_F_FIXED_FILE | REQ_F_REISSUE)))
+		return;
+
+	WRITE_ONCE(req->file, NULL);
+	if (sync)
+		__fput_sync(file);
+	else
+		fput(file);
+}
+
 static void io_req_complete_post(struct io_kiocb *req, unsigned issue_flags)
 {
 	struct io_ring_ctx *ctx = req->ctx;
@@ -919,6 +937,8 @@ static void io_req_complete_post(struct io_kiocb *req, unsigned issue_flags)
 	if (WARN_ON_ONCE(!(issue_flags & IO_URING_F_IOWQ)))
 		return;
 
+	io_req_put_file_iowq(req, true);
+
 	/*
 	 * Handle special CQ sync cases via task_work. DEFER_TASKRUN requires
 	 * the submitter task context, IOPOLL protects with uring_lock.
@@ -1480,6 +1500,7 @@ void io_wq_submit_work(struct io_wq_work *work)
 	/* either cancelled or io-wq is dying, so don't touch tctx->iowq */
 	if (atomic_read(&work->flags) & IO_WQ_WORK_CANCEL) {
 fail:
+		io_req_put_file_iowq(req, false);
 		io_req_task_queue_fail(req, err);
 		return;
 	}
@@ -1555,8 +1576,10 @@ void io_wq_submit_work(struct io_wq_work *work)
 	} while (1);
 
 	/* avoid locking problems by failing it from a clean context */
-	if (ret)
+	if (ret) {
+		io_req_put_file_iowq(req, true);
 		io_req_task_queue_fail(req, ret);
+	}
 }
 
 inline struct file *io_file_get_fixed(struct io_kiocb *req, int fd,
-- 
2.55.0

