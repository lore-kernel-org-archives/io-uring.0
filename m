Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB6F4A3D3E
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092693; cv=none; b=RmQG/lcHkKDgm8IJLkbp/cn+eF5kHHpsy2zAIz4fMGwowvJQUxs4aHeJuGbODCj2He2MWQqx7qNx1EHYRsFGXKGWmHbp7A4m96vNLKq4SLcxmtuGyYowbkJSbaB7kLtUlSYtTcXDsS9nbFNOVoAjZSZ9RHxeGA7+rgsnfWfZSIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092693; c=relaxed/simple;
	bh=xLC6cO9/i9EaVhhkveQ8Ns5Ch+POaLwDPXVcmiGDJIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PQLYsZQtf80emQOW6JkC+fDPNCMG7zA7CwNtuV1+yTmn1McFS7lB4iOSa/3tS4zJWTNo4OJvPXHKL6fRL18/YugwYIXDGEBd8uRWygTtnb2DDKETjKAUKuPY7D49p7UP7U41+Bzx9Ry7nl8XC/ensVeHGDzYPRpdlv1qMUKBG2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=nDiQguOD; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="nDiQguOD"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-917997ab0d9so66413336d6.3
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092691; x=1792697491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvR0Z3b+MVDb+o+kmydCYHqhDPi+NhQhScgqftE0E70=;
        b=nDiQguODFflpZJ+MGMl3kU4vV+hE7YjFbdizO2bIKScoz8BABjLZVLa/SxZz0j5zLg
         s98YDmh0g/yb/Om9goQd/57rTjCY/KBj9TJlBW6lxehs7wICV2nYViseEfCNuKf1e11d
         qYALFHT7b+joM97uPur1oxGVjZ7ntDzX2lPtlSoyVxh5PFJ1itJ9q+LunbgDJOQoPfsJ
         WHxLhL1QGc5KnXa93neaIrQtJD+KOpAu/dlvuAaIMvUPBM2d9H0q3sc8S+kxkMqgxd8b
         uhVpirdkuE27tSmbsLoT5izPXqqGLtzG94A+cRCeya+keV0Z0vX5wCfMNJRbWYTz+jqc
         zTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092691; x=1792697491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvR0Z3b+MVDb+o+kmydCYHqhDPi+NhQhScgqftE0E70=;
        b=U021+1OT0zucvADT+GM8loEZEYbzgDwcdSrZm/nup9j3FTmcyd/DEF02fjzfo4d78l
         q11LR0EM6rdIkdMWCO5iYXAfPS6fxFqenWaBG9ZY19ZHu6pBh/EbB2bI12/4HAdkJtQ9
         TUFcUhEJWrdrmNuAv7FthChCZBNqXC79YW8PDFW3m3AuuvFOqJ5E/XT38G5zVkyab9tr
         13q2BT/REL6RMt9AGuMssHybmNj9erltzUsN4E5sA1BBvH6wvbsGaViSHg7YaMmv1Bj1
         2bj2BjZhA8JMr9WldSPYokp6ENrxfBXSCrJNxOL2olrpXEr0GxxuNjteARoQNQw9pUHA
         ivyA==
X-Gm-Message-State: AFq9FYI2evpenEPFNqM+E8A6EXLg2PtQr6J06Tza1bsUIaTpDvoASesT
	fFQd83FCtQxekgBQVN8lII0aoLa04QqAUC3TrYDWFmvWRFH8RkfbGPndDviziwCcGfA=
X-Gm-Gg: AYBFou12umUE82MdoY2LT5pccvtN5b6Pz6rBoNznU8E5apOTSQI0iZiQj/lJPXi5x9z
	buS0eY1selefmBD9OuhjJvriTQfDEU3ySgTqGkiljQ9hddhhL+Jc98asWqsCm22ObgyYj+Jogpn
	Kx4XBnKupyKm3NmPgSv4vLqfZhlxdrtBFea+Y1IVly3iv81RllUgOOKEHrL1Wx39s7Fa1fjil83
	RkdbuJUBMLEwAxEprr2OnmuYU8RmF83NoMMKjzoxqZm09C7UKVjehTXCbCDyxYxZ0lLQ6tEFePY
	yM9vq7LQsFqaUzMXWMG3n6ij9YNaEzpmfiFDp08kG1btj5EH+12XlmKNL3WJFb5IyRRNjyAU/Qv
	8vl1ryesoGOfYCkSkEDElXlzE57gnKFGAIYIPI03ga2XxvflYvSHK6G7r1LBhYC6FBr8208RviZ
	yNgMWCoFMXQZss7Z8GD4y6vsmwhsQ5YA+32quOsEcZVwk4pbI7yNB8/MQGHNorFO4oxrfvbmn84
	/xlkoc1hbKvVds=
X-Received: by 2002:a05:6214:762:b0:91b:82a6:d2f2 with SMTP id 6a1803df08f44-91b82a6d8d8mr214112766d6.11.1792092690515;
        Thu, 15 Oct 2026 12:31:30 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbaae645sm3468536d6.21.2026.10.15.12.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:31:29 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:35 +0000
Subject: [PATCH 11/43] io_uring/io-wq: don't strand work when a worker
 exits
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-11-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092658; l=3862;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=xLC6cO9/i9EaVhhkveQ8Ns5Ch+POaLwDPXVcmiGDJIs=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNw3GxUzAolJM+Vr9PCk6Z3kSyjJVX4p3iq21aAvUJ3mlBaUu8cs+yWUqIGvnasp2KvnlKh6ZAT
 feeE6kPoxKQQ=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A worker exits if its idle timeout fired and it isn't the last one, if
its affinity was changed, or if the wq is marked exit-on-idle. It decides
so after it found the work list empty, and until io_worker_exit() is
through it stays on the free list and in ->nr_running:

worker                                io_wq_enqueue()
io_acct_run_queue() == false
                                      queues work
                                      io_acct_activate_free_worker()
                                        wake_up_process(worker)
                                      // found one, nothing to create
acct->nr_workers--
break
io_worker_exit()

Nobody is going to look at the work. If other workers exist, it has to
wait until one of them finishes what it is blocked on or hits its idle
timeout. If not, which is possible for the affinity and the exit-on-idle
case, it sits there until something else is queued. For exit-on-idle it
takes a task that closes its last ring and sets up a new one while the
workers are on their way out.

Make the worker take itself off the free list when it gives up its
->nr_workers slot, then leave ->nr_running, and only then take the final
look at the work list. That look and queueing work are both done under
acct->lock, so either the worker sees the work and stays, or the enqueue
side sees that the worker is gone and wakes or creates another one. If it
wants to stay and finds that its slot has been taken, a worker has been
created in its place, which is going to look at the work list, and it can
leave after all.

Fixes: 38aa434ab933 ("io_uring/io-wq: add exit-on-idle state")
Fixes: 05c5f4ee4da7 ("io-wq: get rid of FIXED worker flag")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/io-wq.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
index a3a650813629..89b598b724c4 100644
--- a/io_uring/io-wq.c
+++ b/io_uring/io-wq.c
@@ -703,6 +703,35 @@ static void io_worker_handle_work(struct io_wq_acct *acct,
 	} while (1);
 }
 
+/*
+ * The worker has decided to exit, and has given up its ->nr_workers slot and
+ * its place on the free list. io_wq_enqueue() may have picked it from that
+ * list, or seen it running, after it last looked at the work list. Leave
+ * ->nr_running as well and check again. Returns false if the worker has to
+ * stay.
+ */
+static bool io_worker_retire(struct io_wq_acct *acct, struct io_worker *worker)
+{
+	/* turns io_wq_dec_running() and the scheduler hooks into no-ops */
+	clear_bit(IO_WORKER_F_UP, &worker->flags);
+	atomic_dec(&acct->nr_running);
+	if (!io_acct_run_queue(acct))
+		return true;
+	raw_spin_unlock(&acct->lock);
+
+	raw_spin_lock(&acct->workers_lock);
+	if (acct->nr_workers >= acct->max_workers) {
+		/* a worker was created in our place, the work is its business */
+		raw_spin_unlock(&acct->workers_lock);
+		return true;
+	}
+	acct->nr_workers++;
+	raw_spin_unlock(&acct->workers_lock);
+	atomic_inc(&acct->nr_running);
+	set_bit(IO_WORKER_F_UP, &worker->flags);
+	return false;
+}
+
 static int io_wq_worker(void *data)
 {
 	struct io_worker *worker = data;
@@ -740,9 +769,14 @@ static int io_wq_worker(void *data)
 		if ((last_timeout && (exit_mask || acct->nr_workers > 1)) ||
 		    test_bit(IO_WQ_BIT_EXIT_ON_IDLE, &wq->state)) {
 			acct->nr_workers--;
+			if (test_and_clear_bit(IO_WORKER_F_FREE, &worker->flags))
+				hlist_nulls_del_init_rcu(&worker->nulls_node);
 			raw_spin_unlock(&acct->workers_lock);
 			__set_current_state(TASK_RUNNING);
-			break;
+			if (io_worker_retire(acct, worker))
+				break;
+			last_timeout = false;
+			continue;
 		}
 		last_timeout = false;
 		__io_worker_idle(acct, worker);

-- 
2.55.0

