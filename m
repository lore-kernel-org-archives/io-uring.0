Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794756143;
	b=CsyCM6Qne+vwZu/b4fQivuPr0oT34kIkGVCE1vGvY8dlx44IJUO73lbKIm7zpfG+iXXl
	 IDmdUMdghgbr6dW4uIfyyqVfDOe0AYk88fC2k21CkaL14usW9zxbTU0mYEalywO/mCKod
	 FKRjYNZg53bfHdGL3bPpgNcMVV5HBSvEJc1Prl/5MmQOZtpUDMRKdN+7d9xvSrKHLl2xp
	 ecB7uFHy1OTtQEdpuNeys6hM2enkoheLlvrSq7HBjqfijJ9MLZ0Z6mTslg+XPJ5BpSEoV
	 gImpTOIoAS8M/jN9XssuqhCG8QWdNK3vboKTdKhPFOA9z3gm34VewViTr0NQRok4tFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794756143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Content-Language:To:From:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=GXRlkSfh9P7H+WzFyD+5CF3sbI2VhxyU3eV8QBlajVc=;
	b=m6w1FErqdCSnvxQN3N90w1ATZzEAq6XsusNuOPu0rQfq3tkSUG9OU8oLWv8gNBsuuFGC
	 qn65ODEZm8GfeSZGS+Tas5ySxg4ovFyzt+Fpv5MML8ODu0BJiXWdQFHY0llx5Ian0pKXz
	 QKX+feH4Af6pKZfBcyufU2XWLI3BPBLuGEyBOjPpxhHsg1UOd3L/SQ73lO8sQA93bha7h
	 VpqgCjC/j9PCUMTvQ4rvD+4sJF1Plg0arUS2njNaxxN0pDWNp/2MmjFAqg6sDM5tYKBsy
	 LfbzCkFv63LsBnh52IrxP3pa36sd6PkEVGpJO2KceZ8+fHGRHuXV64CcXvp6MWGyL6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oFJpBqTu;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BA4606A31A
	for <io-uring@vger.kernel.org>; Sun, 15 Nov 2026 15:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53BA4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oFJpBqTu
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37198ed3727so4154940eec.0
        for <io-uring@vger.kernel.org>; Sun, 15 Nov 2026 07:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794756141; x=1795360941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GXRlkSfh9P7H+WzFyD+5CF3sbI2VhxyU3eV8QBlajVc=;
        b=oFJpBqTu8Q6eikW6NvNL+v3AyJ/xA7IaQnRetd7WmO4CkfuXePynTFru58epSfLwbi
         ZeOAuALpqN9WbWiHNbr/HFt2J0G2S60tZVqlbmP+/84RCgcTnGnhXDPmoM19DokQ5Pbq
         BqOEmj8MJ7Mavt+WOJlMSYb6peFphXKe+8OoVKWyvWlBnzH1DSe4ZQQqwxzZvEwzMXLl
         oPoTZtCP1IJnc1hmGPEcC/JpfLxBO0w4P1rxqihumcLRvf7fSiLMHkXzKs7TllwhaR5R
         9RFK0gnhKkZRIo00UbH2u8S8DCt3DPUobdWbyqDZawjtUaQkRjCSVrt57NVOHF/FT/GA
         21rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794756141; x=1795360941;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GXRlkSfh9P7H+WzFyD+5CF3sbI2VhxyU3eV8QBlajVc=;
        b=ttvWtBx12lQb0/SjZ8A7AnI1lrT86GJ+eNL4N5FKe+r7i95kyc2aMVhLFUEtXZe9SA
         rJZk6vtIgni47Aq5L/1YKgsxAl3mU+ocaWGHLUA8P6erW2ty/+KxYu6QKHgGOvbvyq+o
         LS4PyUq/cfS0Jh86ltxRHdS0ENG9uknYWIF8Xar/iJC2A8208gMvsbPEA7kzanlMfgJf
         rkyUMXd/QszJL57BCENqG/A+U5fKc0ZhN/C1Q+izryu6Asm+IHbsBlFCG5S92WVfq4NO
         J082RJOqPedZuA2nE38gO2maWIQRl83I+zDAcQQDJtmOYnDd9PUvwnx8IBWLpWIgy/nz
         MqfA==
X-Gm-Message-State: APuU4Z9eqV76Bvx95nNJJV+Ls6ZoGsGmqlzZMHz6ZmrjeVF3KWaq2cFA
	u2az1xhFvkPAEKIJLg6YngRlwuQAS48v8ClOD/okgEBMl59hjv93y8n+S+boS8ayOIFeBmd8V5n
	JDql557Y=
X-Gm-Gg: AYBFou2rAGkEaWHWJ3OARen7uzp9eaAQ9zQRq8cUhAde8vnrrB+YQW9rPjfcW+8ZNsi
	N1deMKmyDHJkSDF0qbZ25pjtmi90CxsdLGFP4RMToWHoeCMs9Qy3XHTRceMRqNVn7GDgxtoDPxP
	DrsKkBhnWpvY0Ygk3/RobLkSY3dANyGzKFzboXXg96ahGeklXxHbvYhLKgcigiLAfPpmZFuOMru
	Wv5iYU13iL/iDCk38WlOXq5cAy/fAAiRiU8jnIG6L7Y3v9+hUUSJvMDhbaonRhi8zRB+Q1xareb
	LSkOi2OFBkBx1WWe4vmMZFdwPALcA+Ycgu7YquMIzH0iypF36JhasyVeCLIo1HMWcYr+H+8xObp
	bs07AWvt4TIQt7CNkMQ1IO3mllFjlKh1JWMgJkAxttFyuVtmXjpakCP+XlXn3LTY7LOl4YlJDb8
	KD/Il86lKmhjImA+ivc4jKyR4oVZ9pOOh2iCU8tagE+NnliiMbBChXWa9y8BODOBJW6wu1nMfDy
	QqEXxpkiRYoPqwmKQIiZZciVL6bWbPBD+VAmhHlvLcFN6cY5FxwhplhFcGc/KHlcrs1uxmPM/ER
	Zp4B7r9R0yQuM+aNBHJXk9mLC6iNw1l+1bIdQzntw7u6iDBGa2i7w1TRXuZBb99W8tU5D6LVih0
	i7+EgKXw0mFaI
X-Received: by 2002:a05:693c:884a:b0:376:7640:9668 with SMTP id 5a478bee46e88-377e15f05a9mr9900180eec.19.1794756141184;
        Sun, 15 Nov 2026 07:22:21 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f01d68sm25209089eec.17.2026.11.15.07.22.20
        for <io-uring@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 07:22:20 -0800 (PST)
Message-ID: <ccaf839d-97f0-4f39-94ec-57f978cc477b@kernel.dk>
Date: Sun, 15 Nov 2026 08:22:20 -0700
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: io-uring <io-uring@vger.kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] io_uring/io-wq: show stuck workers rather than WARN on a slow
 exit
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

io_wq_exit_workers() triggers a WARN_ON_ONCE() if it has waited more than
IO_URING_EXIT_WAIT_MAX for the workers to exit. That can be triggered at
will, for example with an open on a FUSE mount where the server never
replies to the lookup. The worker can't be canceled, and the exit waits
until the server goes away.

The stack trace from the WARN isn't useful either, as it's that of the
exiting task and that is always the task exit, exec, or SQPOLL thread
exit path. Print a message and show the workers that are still around
instead, that's where the interesting stack traces are.

Reported-by: syzbot+b0d54b9e81de55179e47@syzkaller.appspotmail.com
Signed-off-by: Jens Axboe <axboe@kernel.dk>

---

diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
index 92df54c6f50c..52ba4b06b5af 100644
--- a/io_uring/io-wq.c
+++ b/io_uring/io-wq.c
@@ -9,6 +9,7 @@
 #include <linux/init.h>
 #include <linux/errno.h>
 #include <linux/sched/signal.h>
+#include <linux/sched/debug.h>
 #include <linux/percpu.h>
 #include <linux/slab.h>
 #include <linux/rculist_nulls.h>
@@ -1448,6 +1449,22 @@ static void io_wq_cancel_tw_create(struct io_wq *wq)
 	}
 }
 
+static bool io_wq_worker_show(struct io_worker *worker, void *data)
+{
+	sched_show_task(worker->task);
+	return false;
+}
+
+/* The exit path is always the same, show what the workers are stuck on */
+static void io_wq_show_stuck_workers(struct io_wq *wq)
+{
+	pr_warn("io-wq: %s/%d stuck waiting for workers to exit\n",
+		current->comm, task_pid_nr(current));
+	rcu_read_lock();
+	io_wq_for_each_worker(wq, io_wq_worker_show, NULL);
+	rcu_read_unlock();
+}
+
 static void io_wq_exit_workers(struct io_wq *wq)
 {
 	unsigned long timeout, warn_timeout;
@@ -1469,8 +1486,8 @@ static void io_wq_exit_workers(struct io_wq *wq)
 	 *
 	 * where completely overloading the system with tons of long running
 	 * io-wq items can easily trigger the hung task timeout. Only sleep
-	 * uninterruptibly for half that time, and warn if we exceeded end
-	 * up waiting more than IO_URING_EXIT_WAIT_MAX.
+	 * uninterruptibly for half that time, and show the stuck workers if
+	 * we end up waiting more than IO_URING_EXIT_WAIT_MAX.
 	 */
 	timeout = sysctl_hung_task_timeout_secs * HZ / 2;
 	if (!timeout)
@@ -1479,7 +1496,8 @@ static void io_wq_exit_workers(struct io_wq *wq)
 	do {
 		if (wait_for_completion_timeout(&wq->worker_done, timeout))
 			break;
-		WARN_ON_ONCE(time_after(jiffies, warn_timeout));
+		if (time_after(jiffies, warn_timeout))
+			DO_ONCE_LITE(io_wq_show_stuck_workers, wq);
 	} while (1);
 
 	spin_lock_irq(&wq->hash->wait.lock);

-- 
Jens Axboe

