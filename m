Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E664A3D3E
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092697; cv=none; b=qCBSQnenGYZfmie43+s1sYdJVkHeb6FYUrZW8+JCAqhpfY4BuqeFt3WTg4778kF4fdXXbsY8x0ebBO6jTJDouSohs69VO/soRyEdXfZqXR0adKburVRZA/xBBatlAeRBjPy0XjhgOiz0Ti9rfHZ5t1qgFkWdLapaUcWA19ximM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092697; c=relaxed/simple;
	bh=kYXNsv9z57Fmi3y1fJB1lCUt/61dXso6MHOBJ9gD0Zk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EU3HFiR8zsFkKa7t3HnVCitXwB+E61n1kXij+DzoGNzNvA1reiZ5G/2iS2y7fvDp7Sj7VDldSezY0UAKqDw3UWv66CvrU0B1jfaLtF7GEDj6e2ds/DyNx0t+YYy+odkow7MyOeakuIIdyOWSKsiAu/ZTymteh7NQ6VSo2DRiJVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=RpSEptaA; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="RpSEptaA"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93a40a9a01aso44397285a.0
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092695; x=1792697495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+II0PZhjaYDCZccgaXJafJfs4gtJQVd7dEattcoRflA=;
        b=RpSEptaA9wpYv/Z9d5MtTvS2KwVpWtVhnT1E+7jhHf0wkzd+hisONQCpSPJvXcp+Su
         5rxyIhOJeU4T8tJofAu5k4MCypZnXGmP8igogW2/ZgAh9NqJGQ57DyheGPHkiJeZbYAJ
         wW4vgaVh1CuGOeo7ly89py2M7IFkxR6fLZVmXWwzE9wEHcZGJZRscSBparpVrVXLyW4+
         OMJ3DbKPe8eCJBg702uKNOZXpyiURG5kcq6u5DzfJ1l+bIfjOpO572evvRgNt+2FhNOD
         iHMNsCmCi9Dx5cdgDzEjwBme4SgqzLXkOEG7kGIluqNo0K5u1KMvzZZNMJCm8/mokKdX
         WJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092695; x=1792697495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+II0PZhjaYDCZccgaXJafJfs4gtJQVd7dEattcoRflA=;
        b=ogFH/y6RcAgI2Hcm4tPP6O+bUFU7Cz/wSHF9qq6Q1UPMDwMBijl5nL8HZEj/bO+ttL
         VGnumVu/sesysl3YGDAYffpKRJUfxFN/8Hx05pgSjj4u875vGwdu8dxmRviD3U7vWjE3
         NRlKyQf8/mLM7K7389WMOqKGEt1e2AXorkQ6dbeL/JlzyC0Sgt+dw8tpsWtmRTCUFbmI
         ttbCe9I+ggG2PRLkXgl2e9iFHJkN9SBJuY/WuZk9rufLt3aiaIya5gD/k5+RtKn7BoH2
         dWshGA+/MJAhRzMaYvstFEMk5KH3AOh1e6KXtH6DC8+LzFCuTkZLhu37RgmxF2ANQUoz
         4aqw==
X-Gm-Message-State: AFq9FYIdRWQr6NBBZlC40kI0+9YLHUplr9RpmczUvAtIY60VDk1oqLie
	aSYvYmnqoXPow2YK90JCLthZTZ9ZJkT6MpcGXkh3Q5JwDTLw3yZ7yWz8UdgzckQuMN4=
X-Gm-Gg: AYBFou2jqdvirBMm1Knfa1BzxwEsMo4PzHyP1u0cUMsAUgVbwe9atfjeGqzgXB9e7tK
	wPgd2CZaKl3FpCWqORJTjam8fRAQqtfuKjpJmTWyNE0vVtxmzx1F61mjSK87nLPtDqJ4MwypBhJ
	LWhlbiUh7eGcgeoUA+o0FwM/jjXBCuxYFTuV3UQHVSqQdOsxy98Q4YV3qDKjm7qn4TCBlbTP7YZ
	AJpod6183Jkq+iOLDTplHpz6ylvSGd3Up01ba2D38ABJXfOMIC67KB+ONPCh5ug3FLB9on2a9mJ
	n9enNbNBIB0OrkZfYhyhIUxNtr+sftSxqLnjeYYzFTegd87mxk0IKC4liTFPfDZLMwJRubVqfuS
	ms6+ZqcSZpr/lpE7Br0/yx5jnR+yu+n/C+0UQKybc1Iw7OqiRviEcUvtCJh5vnB9Z0xmy2pv/CM
	F63uqHw2mo1YC2LF2LqdGgrERQgSpkK1lyfbbvRgFUSl98tUPQfAf+n3w62w9ZDO+acugW8g3du
	OOt07IeMOQ4i7Y=
X-Received: by 2002:a05:620a:d94:b0:93f:231:9ff with SMTP id af79cd13be357-93f17f5dddfmr196143285a.27.1792092694535;
        Thu, 15 Oct 2026 12:31:34 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a16c21esm13098785a.16.2026.10.15.12.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:31:33 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:37 +0000
Subject: [PATCH 13/43] io_uring/io-wq: let cancel find picked up hashed
 work
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-13-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092658; l=4090;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=kYXNsv9z57Fmi3y1fJB1lCUt/61dXso6MHOBJ9gD0Zk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJde+Iwyx+sUyPpr3LmlZCyKHUF597ftHcEpdo2+7KYOk7q+rgu6cn7epme2NepYA52u+rCWvKn
 Vx7YF9XSNBw4=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

io_get_next_work() takes all the work items that share a hash off the
work list in one go, and the worker runs them one after the other. Only
the one it is working on is visible as ->cur_work. The others are neither
on the list nor current, so io_wq_cancel_cb() can't find them.

IORING_OP_ASYNC_CANCEL and IORING_REGISTER_SYNC_CANCEL return -ENOENT for
a request that has not even been started, e.g. a buffered write queued
behind another write to the same file that is blocked, and the request is
carried out. The cancellation done for a task or ring that goes away gets
there in the end, as it keeps trying, but it has to wait for each item to
become current.

Keep a pointer to the remainder of the chain next to ->cur_work, and have
io_wq_worker_cancel() look at it. The items on it belong to the worker,
which needs ->lock to move on to the next one. Matching work is flagged
with IO_WQ_WORK_CANCEL and fails with -ECANCELED when its turn comes. The
worker isn't signalled for it, that would interrupt the unrelated work it
is busy with. As the request isn't gone yet, it is reported like running
work, with -EALREADY.

Fixes: 86f3cd1b589a ("io-wq: handle hashed writes in chains")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/io-wq.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
index 31c7d6fc426b..dfdc78612783 100644
--- a/io_uring/io-wq.c
+++ b/io_uring/io-wq.c
@@ -56,6 +56,8 @@ struct io_worker {
 	struct io_wq_acct *acct;
 
 	struct io_wq_work *cur_work;
+	/* rest of the hashed chain ->cur_work was taken off the list with */
+	struct io_wq_work *next_work;
 	raw_spinlock_t lock;
 
 	struct completion ref_done;
@@ -581,6 +583,17 @@ static struct io_wq_work *io_get_next_work(struct io_wq_acct *acct,
 	return NULL;
 }
 
+static void __io_assign_current_work(struct io_worker *worker,
+				     struct io_wq_work *work)
+{
+	raw_spin_lock(&worker->lock);
+	worker->cur_work = work;
+	/* stays valid while in between two items of a chain */
+	if (work)
+		worker->next_work = wq_next_work(work);
+	raw_spin_unlock(&worker->lock);
+}
+
 static void io_assign_current_work(struct io_worker *worker,
 				   struct io_wq_work *work)
 {
@@ -589,9 +602,7 @@ static void io_assign_current_work(struct io_worker *worker,
 		cond_resched();
 	}
 
-	raw_spin_lock(&worker->lock);
-	worker->cur_work = work;
-	raw_spin_unlock(&worker->lock);
+	__io_assign_current_work(worker, work);
 }
 
 /*
@@ -623,9 +634,7 @@ static void io_worker_handle_work(struct io_wq_acct *acct,
 			 * work list, but isn't yet discoverable as the
 			 * current work item for this worker.
 			 */
-			raw_spin_lock(&worker->lock);
-			worker->cur_work = work;
-			raw_spin_unlock(&worker->lock);
+			__io_assign_current_work(worker, work);
 		}
 
 		raw_spin_unlock(&acct->lock);
@@ -1179,6 +1188,7 @@ static bool __io_wq_worker_cancel(struct io_worker *worker,
 static bool io_wq_worker_cancel(struct io_worker *worker, void *data)
 {
 	struct io_cb_cancel_data *match = data;
+	struct io_wq_work *work;
 
 	/*
 	 * Hold the lock to avoid ->cur_work going out of scope, caller
@@ -1187,6 +1197,19 @@ static bool io_wq_worker_cancel(struct io_worker *worker, void *data)
 	raw_spin_lock(&worker->lock);
 	if (__io_wq_worker_cancel(worker, match, worker->cur_work))
 		match->nr_running++;
+	/*
+	 * Hashed work is taken off the work list a chain at a time, what the
+	 * worker hasn't started yet can only be found here. It doesn't move on
+	 * without the lock. Just mark the work, it fails once it is its turn.
+	 */
+	for (work = worker->next_work; work; work = wq_next_work(work)) {
+		if (match->nr_running && !match->cancel_all)
+			break;
+		if (match->fn(work, match->data)) {
+			atomic_or(IO_WQ_WORK_CANCEL, &work->flags);
+			match->nr_running++;
+		}
+	}
 	raw_spin_unlock(&worker->lock);
 
 	return match->nr_running && !match->cancel_all;

-- 
2.55.0

