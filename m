Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7E750AC19
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092715; cv=none; b=eod+Comn2A3haqbn6pU3OWdzIghVh/59ES6LH6waCPy5xG2hFkKOgRmK9TdYOtc4nIybZby6wU+AC/Vv7dvg3rbw/K3D5MaezlpMpmQJ87IaRb/wgwrxv5H8G74QcjsgwVQjtKMFec00e0cnEDNsD79sxdO96W13ef5+DQI9z4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092715; c=relaxed/simple;
	bh=fjM7fZZIC9JGUNipy2NpFkudgYs64fMwD3sWkxCJwcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zu8HNHqJFeughnqb1Op5YkqIITNb0v1A+CZTSToMYjIiBKKIY7iDckrTbSAeZkTUfaFjSqkKUz+i5rzzc/8M94UJ5On7P0y6brzNggZhCvvOhCPTL/gdK6tsDheea03MW74nNk5w/JxOUp6Uh+SmnBlA7IEKYM9WaOGNq4svlJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=cm9qbK9o; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="cm9qbK9o"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93e762768f3so619059285a.0
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092713; x=1792697513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vH7UPYPQtwgJkiadiY1llgqtg2FFOdh2O0dLYrA597E=;
        b=cm9qbK9ofHgOoHeqqRuQAl9YGjvo93pjHxSev9Uq37mVjsL+RWd5M+pDcW9QrKQEg/
         t5zV/8kzs6KbHxRrDRNjUYSnyXwAh2b5QI6oIW889omInP/OI6kNjp/0K2/pW+qBTdgk
         AhMrFbJ+5ThPQ/inBXwszA/4Y+7NnfvgAPh8b4pAKb54NGDI16bj1HYl+JhGf0Ig2H9v
         0LM+oQNq7Cj7FC/cNFSiYbw6j6IegiyeSQfCVoDj92LU41sJg6NL6cVQglfSjVErfiTA
         Wk5F8B+9IH3rI4mOMvIUXPT9inU5Fr9sbG7VtHDcKL2iKOZafZrHVH14ecVZcn7Ty17g
         AeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092713; x=1792697513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vH7UPYPQtwgJkiadiY1llgqtg2FFOdh2O0dLYrA597E=;
        b=ShO2u5gCM6LHXLtocTgn9VICfIq6KK0clYVwDtjIkdRn1mbDrvSlJUkIdkcmlMeAqp
         1kdByNaZo5WWPftWTAlwDoI3rJtOkqzMtMPJ5Nuqx0qg8eVuzPfO1Yqm3DY0FfXYspMB
         BvkVqeB+YJxT4jP3/+Ug+aIZhyrO7vZpOyroVj3C2Xv/dUjzYFKa4Ydac6hW30aJidiT
         cVFPYnuG5bTltNY1C72CEaG3+Nuv+hP60ZxSwqqRmuKl3Yy6vimX+UA7Wmyri7GJUlKU
         1p1oo46KzPfiW+BF+eQlVAPU2HmVx2VcA1sr5rddHlUXIZwxcdZT4uTX6me/Oiqlz4DN
         oc0Q==
X-Gm-Message-State: AFq9FYKWP+6h7cmQDObIU6uAKBMlH8UibJwx8X8Ybisb53jfaRZb5/mA
	OCr8bJ1xfapTTJbfxYqEdeWNlTpwu2Z4VqKtPzMY8mt36N4WO4ZCpl+/cttcSp5gngg=
X-Gm-Gg: AYBFou2owmtwMLq0ks0jNMDws4ImAf/x1IsKoXhc7ENPhRTmQIOofd680LhhhyfYlce
	IanL31r8E83/k/PDECEYB3yR1ZMyNCov4ZcyRATDoSBAERRRhaE3sLx9BDbNA29SRpU44+1lx1w
	L5emZJHppxV3z9mbCNFWG3kPhDmM3xAEtf1rooRje3Em+BHIB3x17wofN63YDKvZSAITkEWr+rs
	zRl8w23fvUh5Py5Vvl8STfVKq/0Arx295++/5EhSgPLS9sGfqjQbmLxffTYjlog7qXHEozDW1e5
	xc6oAuCxRLaHq+kV2Frl8d7C0WfbYqudfkKugblsynTZAgRYdGVth/9ya5y3Ox8+Nt0NxKNk0Lb
	FDYNBWH7K5C3z1mZUIt1fhK7gQjTY+21xNJ2z7zpg2jaUA6Yss78Mf88t9FBuQpM2xZjeC+f5J7
	V7OSuVTB+HSBMDFUOw3qYYScqtfDie82nSixzZhEHgyAPqq0cSvCWywInRMBbJovRng7nD6VUBS
	mAnFHROYIadOMnI
X-Received: by 2002:a05:620a:26a4:b0:93c:88ab:3482 with SMTP id af79cd13be357-93ebd20d065mr3307771185a.29.1792092712876;
        Thu, 15 Oct 2026 12:31:52 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.241])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a16b5e4sm13113285a.14.2026.10.15.12.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:31:52 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:46 +0000
Subject: [PATCH 22/43] io_uring/futex: allocate private hash before waiting
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-22-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092659; l=3339;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=fjM7fZZIC9JGUNipy2NpFkudgYs64fMwD3sWkxCJwcg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOh4Ved0oFmwERmtKdUixOJGDC4nTwgkqSQAamScda6Q4jX1s08xzt2B2SDGqKmHcYcZ1Ewhc5c
 W4OWi8b6w5gk=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

The futex code relies on there being no private futex waiters by the time
the first private hash of a mm is installed: __futex_pivot_hash() moves
the waiters from the previous private hash to the new one, but it does not
look for them in the global hash which is used as long as there is no
private hash. That is why every clone(CLONE_VM) allocates it up front: a
task which is alone in its mm cannot block in futex_wait() and create a
thread or invoke prctl(PR_FUTEX_HASH) at the same time.

IORING_OP_FUTEX_WAIT and IORING_OP_FUTEX_WAITV do not block the submitter
though:

  io_uring_enter()
    io_futex_wait()
      futex_wait_setup()	// no private hash: queued in the global hash
  pthread_create()
    futex_hash_allocate_default()
      __futex_pivot_hash()	// first private hash, nothing is moved
				futex(FUTEX_WAKE_PRIVATE)
				  futex_hash()	// private hash: no waiter

The wakeup is lost and the request only completes when it is cancelled.
prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_SET_SLOTS, n) instead of
pthread_create() has the same effect.

Allocate the default private hash when a wait request on a private futex
is prepared, which happens in the context of the submitter. This is a RCU
protected pointer check once the hash exists. A failure to allocate it
fails the request with -ENOMEM.

Fixes: 80367ad01d93 ("futex: Add basic infrastructure for local task local hash")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/futex.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/io_uring/futex.c b/io_uring/futex.c
index 64909a2a8c88..9203998654ff 100644
--- a/io_uring/futex.c
+++ b/io_uring/futex.c
@@ -152,6 +152,24 @@ int io_futex_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	return 0;
 }
 
+/*
+ * A wait on a private futex does not block the submitter. Even a single
+ * threaded task can go on and have the mm private hash installed by clone()
+ * or prctl(), which does not pick up waiters from the global hash. Make
+ * sure the private hash exists before the first waiter is queued.
+ */
+static int io_futex_prep_private(struct io_kiocb *req)
+{
+	int ret = futex_hash_allocate_default();
+
+	if (unlikely(ret))
+		return ret;
+
+	/* inflight tracking only needed for mm private hash */
+	io_req_track_inflight(req);
+	return 0;
+}
+
 int io_futex_wait_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 {
 	struct io_futex *iof = io_kiocb_to_cmd(req, struct io_futex);
@@ -161,9 +179,8 @@ int io_futex_wait_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	if (unlikely(ret))
 		return ret;
 
-	/* inflight tracking only needed for mm private hash */
 	if (!(iof->futex_flags & FLAGS_SHARED))
-		io_req_track_inflight(req);
+		return io_futex_prep_private(req);
 	return 0;
 }
 
@@ -213,10 +230,13 @@ int io_futexv_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 		return ret;
 	}
 
-	/* inflight tracking only needed for mm private hash */
 	for (i = 0; i < iof->futex_nr; i++) {
 		if (!(ifd->futexv[i].w.flags & FLAGS_SHARED)) {
-			io_req_track_inflight(req);
+			ret = io_futex_prep_private(req);
+			if (ret) {
+				kfree(ifd);
+				return ret;
+			}
 			break;
 		}
 	}

-- 
2.55.0

