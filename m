Received: from mail-oo2-f29.google.com (mail-oo2-f29.google.com [74.125.231.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B7D499F36
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141698; cv=none; b=R/cUt+7ubdAJJDiZEUF0bB9ygW6LBhaF3qTd4iyp9BIu1B3lPsnz7V4UTJGI2aWowk1MMgyf2ly0evPcvpNfcX0o+6zo5SWYN1rUFuH0Tv9P3HTHMSU5OntSNUkq8ZsSS4qGuBq60kY99VzcJdaJ3akLPFTKT6tnF41aRf3cwAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141698; c=relaxed/simple;
	bh=NAAFPzaGmuQKEpro8Gsqs7LpdQtnlT9CBecDcpT4K88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k/vWSDX/8BXbJtT10atKImeNTDx5kBc+9jD9besJ1gW9mY6h3IWtXjnKBfO50p0lzosM9Te1MvcIxQa+Cyoko5eGEMebFOv++6I5wBL70D99UQOxadPHCod5VMn7rYq1JazHDySR20foSqgv/HQ1TCljGrVfVIB9YdJvwajCd80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=Guj9hWQr; arc=none smtp.client-ip=74.125.231.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="Guj9hWQr"
Received: by mail-oo2-f29.google.com with SMTP id 46e09a7af769-7fcc35eeb48so729449a34.1
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141695; x=1789746495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q9/xNmnBkQVRIiG7EKjaAK5gjKVX2Jitj24zxBWOK9I=;
        b=Guj9hWQrP9XNAS+d1+PKIyl8OQZvAkI1IVmkdGPB3kNbhyxH2WRvuqB8MlFS5sCKk7
         0CPbQRNEkk+0bAL4lFbNokciZ9hBPQi1aeCbTArXWyiEPP/V7VAZ3rX1I11AF3atnVbf
         VYUs5wNgNGXUvOVxnFuzrCkG1Y7iZlvWXr2rnM0jQKQEJvDj5eJRLkiGK2YZVbMTM39v
         dfVcDU+mEjOWzhkuEPbdnnBxO7+co1lFYAo5GtlL8GJUWYGQTSG5c/OYMqaGp3kQUfo8
         RH9jhvty9gTivtVBBl6WLl4FofDVxMYGqui1sLbadF+4P8yWp7gtt5oBBHIXAbEMJ3Yp
         l0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141695; x=1789746495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q9/xNmnBkQVRIiG7EKjaAK5gjKVX2Jitj24zxBWOK9I=;
        b=iEjAknDofKtxKtnHXNyjZQUluyJVqHeTqsdaYUszslox/yig4pUUHAQ1r3OkOlm9WZ
         vZOkxoXv7sP1/0MkLKhjZVqNNbN43aWVcItNx/KP9jihNa4b/JLWv3c74ML2VX8x4ixx
         h83DUM84e1N+nk5KtzJ/aZPtMN1UyCWFFk4OTWCLp2CG7dDf90vhdcg0+tnGXzTW/xXu
         fiCEYkLllZVnMM+/R7u1ClHqZ97pb+0C6bmiW39UydKoSlKjTzefQy29i9qhc3LMS8EL
         fkCW3K4KiUUnjxudNNEyAF9PD8S2oQIshzj11XJrEnXW2rSwmQ/cJiGzQsffWe7iyK8W
         nhfw==
X-Gm-Message-State: AFuF++mTOlB59KAacvJSqOvhZomMW6Qb0XaGNPIJ8HVtskY/m4jcJHPb
	TwtP277n3nzpQ6pWuFPHV0XcRfR+MNXcitXahrJvrJEB6fadrP6efRsFbk7M/jUYNBYPeXK8Gl8
	Bif0eXIs=
X-Gm-Gg: AYBFou1u8NjbxibeJk0HpcVWCxVSlx4xpv1CX7X9twKidQp+bj+CCbyX1bPtN3SUeTP
	NXTC/JllqZY2JW3WoY+pIKRJsYIyQqiUnZ0n2MsdlG75yh475gisg4GbrvzRqUzTWCrNUQIfTXd
	8ZXuhH137hiniaOaxf3JdR/KVBk+H/JToaGJF0a4XqixWnfHG8Ug8qQgpWSwWksRBOo0tbCXq/m
	lI6gCtD9dvb1U7AHn8HPq1dDtkf+8irjK6IaiQDGJZRerL29wAQ4LVkKp678Xm98EI1GyGWzVSL
	6muprjd8fBRM/AS0eJ3t2dERjqiaXaOc1RNxgkcbKogBLpMb24dB9fvg2/w4Y+89Ox4uAQAnpfh
	GvLBXgwBOOeNhUfaT9jn+Az5kg+FwqJqSvMuRivDa9J1tb+h8QSLM6BKOzalGvrs9DkWet1YHk/
	wev/CvGksu2bamUoXidJknanf+IdHSO7hKFr6dBGJZBSffQlGstUojpzu3PsH5kb8Cihm28cQpD
	ZCLQ2zLvE6aiO9wZUn0ORawPTiL+IZBhtqLu3phuG0=
X-Received: by 2002:a05:6830:412a:b0:7f4:d59a:1c62 with SMTP id 46e09a7af769-803fe9fd144mr6518237a34.11.1789141695207;
        Fri, 11 Sep 2026 08:48:15 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f6d1ca4bsm2629478a34.23.2026.09.11.08.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:48:14 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: juanlu@fastmail.com,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 01/10] io_uring/io-wq: put the request file before posting a completion
Date: Fri, 11 Sep 2026 09:45:25 -0600
Message-ID: <20260911154811.646705-2-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911154811.646705-1-axboe@kernel.dk>
References: <20260911154811.646705-1-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Once io-wq is done with the request, put any potential file that request
had pinned upfront. This ensures any file references are fully put by
the time io-wq posts a completion. Registered files are held by the
resource node and don't need this.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/io_uring.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 61053421d809..f96dd2d8c6b1 100644
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

