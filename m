Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2BB424D64
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092689; cv=none; b=ZIKVYgooeLpxfnqLbQeoGfOVliXT6sUOYltwxKfc3olkn2VMKlWgDDWb6+7J8+tL4Ra3W3tGfd8jh0oh8BJaeNnLP1ndVVMjTBe0KX4LD+SN7QBwfhOnajf5lXzgS/WhLnQubyjL0GXriNREzm53E7ulcGvAzxkK4DK23tpIMbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092689; c=relaxed/simple;
	bh=hYWR6NUTY/NeznlVjjVPM0fb6vqYchIG5rroOeN7FXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BGSGXrw117HmRansm4beeDHJEYEl8KpDJH58rKgNTd0JndGiyxcGpWNWC5LqKYLvW9fYBDTmxK0y/JMgOw6BXQZTAyrkSsm3G1iI+gFjVxTRA0E+eRwOtx9R9pJeFieY3mghH0ZbV780xk/0qy30K+mqMf/Z0XSP+oiw9F4FO3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=lpKPU6bR; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="lpKPU6bR"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91b8b456dbeso47204126d6.2
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092687; x=1792697487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjA9DH+gg/W+oy30QoXCWOcbVBuNjWgs2dDmab5FI6o=;
        b=lpKPU6bRmYszZDX2i+z6dMMulRe601YoVt6dYLTJhEi+920riraFIR0m/BTY7sGM/e
         APGpzojW8tz5Lu1b3nN+Ev31cz/Jr46RfcbNUF8CqOb06gRAVwuKzcaFJjF6T89TRBlm
         2dy0+lwqvYCg9EfGxj10uVa+hQGB2FCL/cLrdZF6Y7L0lyauymMiIqKxoNB4Mq/7Vkc5
         pBQV8Nrzb8bZyhgDWnJRA3GQOz/K+XdkNF73MOBvi048X1jCWcX6k1O5/DkxZdiiQl6a
         y22dlLoQX+DqXVr3bgznmqW8NTPLfCJ9Ar/mPqRHQj8R/RIKW30dEOwwTiLBS2tdQQOA
         CgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092687; x=1792697487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xjA9DH+gg/W+oy30QoXCWOcbVBuNjWgs2dDmab5FI6o=;
        b=0Fy0onzd2Yva2V1ysv+KGVSIE00FYLl7PRih/lbsY1ssOqAqHWaGmt87AweketxEp5
         Po2Ni44MDI/Kk0kMsn/JG7AKZiGz79cqlFp8fQPzK1gGx/fgnNP0YqQK8kC13GHYUYdQ
         1X5Y7FXFI5kskzHpbQzQTVZnfqjxnDpG0mk6HByI//HUEF+MKq/9jVwLO0jhqg+xeggt
         Pd30dEdDoClxblESK7lrCuJtzLM9Wt7AeDlcfC/JtEzuYz105B4nCVtHGL2ElwNVKi1e
         Ibeo0/DeJsmDyvhuYnRBlJbusdgqBaQGcD8RC/dHYsNmi8upaLY7Q3wXjFVWOOhHBD+f
         OAaQ==
X-Gm-Message-State: AFq9FYK306a/+N+FHt4FtygVwKi3bOm2ZvIZl1cfzcLBF09tWb2oD0X6
	Zog61W1yiSuMBf27FOY4svvX68knzlhZqxbmE5WO+nrN/Iv6XlrXZYf8sQCWpfntCMU=
X-Gm-Gg: AYBFou2lyiYnfZ42pe1WS77h8YLeXCEpTJwQvdMUHamU5rK9e6xMWUhPgrdMcqCdt2X
	jc572VJGWA1KS3a9sjbK3hCBJgWAw2UqLTIZX7h+4G9L6Symd3gBxqFpofy2amwOLisnyavpOgF
	tB1PdxeE8djOOVVeVB4DGHH7mxQgHzag100i4j3sldzSQA5CzMwHSW9DqrNX8X9wslmOBPD08h9
	YFKCKN2Z3GjTfPyYDE4GlsH5IwSo2cKxckNYdFeSCmcptSYneJ/Ez9dH+1w9egyHSW1pphr+umG
	D3F66ZoqecPPDSw6g6VoZUtwSwKWHctPBPMuGA59jTkrsZT4kkiNKH3cIZuY2tJpDy6fTOEhgEW
	Z8RYKSRdBuFjoV4FKgUPAz9ePWgstpDxlVcL3UpPlfmifuJERFGQ8eNTC0PriVIx/ABa9e6MUUx
	LMiz8q5ZHT/14qM0ra8rlnpqBbDRrsOiVktmmJKXZh5DkFQeBI9r76tTPdWpdTvG3+eTvM2kOdY
	NqKeLx8SJzbNMM=
X-Received: by 2002:a05:620a:170f:b0:93e:5769:e307 with SMTP id af79cd13be357-93ebd1dff26mr3581654485a.22.1792092686821;
        Thu, 15 Oct 2026 12:31:26 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a0d0718sm15001085a.5.2026.10.15.12.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:31:26 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:33 +0000
Subject: [PATCH 09/43] io_uring/mpscq: disable preemption while pushing
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-9-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092658; l=3733;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=hYWR6NUTY/NeznlVjjVPM0fb6vqYchIG5rroOeN7FXk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJTNw/11MFiYY9YqrmFkHxfeK6lleu03HRF22NJbcKmpCNhM1wuSMwATa3CBkSp+Hu8mqxAIuCf
 yLL6HcrUr6wg=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A push makes the node the new tail, and then links it to its predecessor.
In between the queue isn't empty, but mpscq_pop() can't get at the node.
The consumers deal with that by trying again, with a cond_resched() in
the loop to give a preempted producer the chance to finish.

cond_resched() doesn't do that if the consumer has a higher priority than
the producer and both have to use the same CPU:

  producer (SCHED_OTHER)              consumer (SCHED_FIFO), same CPU
  io_req_local_work_add()
    mpscq_push()
      prev = xchg(&q->tail, node)
  <preempted>                         io_cqring_wait()
                                        __io_run_local_work()
                                      again:
                                          cond_resched()  // nothing to do
                                          mpscq_pop()     // NULL
                                          // work pending, no events yet
                                          goto again

The producer can be any task that is able to queue task_work for the
ring: an io-wq worker, or somebody who sends a message with
IORING_OP_MSG_RING. The consumer spins, holding ->uring_lock, until the
scheduler takes pity on the fair class, which takes about a second with
the default settings of the fair server, and forever without it. The
loops in tctx_task_work_run() and io_cancel_local_task_work() have the
same problem.

Don't allow preemption between the two steps. That bounds the time the
window is open on the CPU of the producer by what interrupts take, and a
consumer that waits for that is on another CPU. The cost is a
preempt_disable()/preempt_enable() pair per push.

Fixes: 50cb44bd0d5f ("io_uring/mpscq: add lockless multi-producer, single-consumer FIFO queue")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/mpscq.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/io_uring/mpscq.h b/io_uring/mpscq.h
index f910526766fd..da9474497cc8 100644
--- a/io_uring/mpscq.h
+++ b/io_uring/mpscq.h
@@ -25,9 +25,10 @@
  * its predecessor. In between, the tail end of the queue is not yet reachable
  * from the head. mpscq_pop() detects this and returns NULL, while mpscq_empty()
  * reports false. The consumer must not treat such a NULL as "queue empty" - it
- * should retry later. The window is two instructions wide, but a producer can
- * be preempted inside it, so the consumer must not spin on it while holding
- * resources the producer might need to make progress.
+ * should retry later. The window is two instructions wide and the producer
+ * can't be preempted inside it, but it can be interrupted, so the consumer must
+ * not spin on it while holding resources the producer might need to make
+ * progress.
  *
  * The consumer side only supports a single consumer at a time, callers must
  * provide their own serialization for it. The stub node is what allows the
@@ -69,6 +70,12 @@ static inline bool mpscq_push(struct mpscq *q, struct llist_node *node)
 	struct llist_node *prev;
 
 	node->next = NULL;
+	/*
+	 * All the consumer can do about a node that isn't linked yet is to try
+	 * again. If it is what preempted us, and we don't get to run as long
+	 * as it does, that never ends.
+	 */
+	preempt_disable();
 	/*
 	 * xchg() implies a full barrier, so the initialization of the
 	 * entry (including ->next above) is visible before the node can
@@ -77,6 +84,7 @@ static inline bool mpscq_push(struct mpscq *q, struct llist_node *node)
 	 */
 	prev = xchg(&q->tail, node);
 	WRITE_ONCE(prev->next, node);
+	preempt_enable();
 	return prev == &q->stub;
 }
 

-- 
2.55.0

