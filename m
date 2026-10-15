Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8C04A4839
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092755; cv=none; b=JJ0aXerWc/VcrPj8p/mz4iNEjfxtAsUwk9RLCHE1w5Ml9M0cihToqcZ8a9den9mSpElqplcNscXxOlAnWSFBPq4aOkDgvl24Aot6HAACHtUfyAsjLhAqI91yuN1gEWceAqJglYnge9q1MaT5g5lbU9qoVve65OGFWM+JWNPgRSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092755; c=relaxed/simple;
	bh=Ihx+E0BU7CCDEhcvDOUEwSMhSj33KCOFwzjd4iN3u/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nhhRY+jD9zrwKQnlgYYb2iG6G2LH2+28nPLRgvGXtMskJLsLXIbmEjfi3hldESeQxx56x1Xmm4ES89QDk7NNH4cPUl7LDVuoBiarDFdxVYLn/8eLWqsjIUqxKvZ8sZ7LLNwE5ThS5aGyXphgbO6ca2FWnyHRV1fAp6o/lwAXoAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=L6s5dj4K; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="L6s5dj4K"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-533972e0cccso63999921cf.0
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092753; x=1792697553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fUNH9yBsm16P8gIXLVqy2nE5rFnf3wCaKx6CjEnHAVA=;
        b=L6s5dj4K6+eddXD4an7C3WefO45zf+QyRvBJWsgYo9LqPOTE2SWZ+V8LuUg4U1EB97
         AU8OFXxBj8Ay3QGlQlY+5G0cgl3ck7WTaJukf/83jMKC4OLn7T9CGQ3ni9ptkwxrlBqQ
         9e8HKseQ0+EpZwK1ChLs3qKZyZTVqq6HK2EoNjx1sQ8U6RvGMjfeqo8msQYWj8FPoiLi
         /oaQZExEl2X64CDCYGTN4vgAhiHuL9zn0lnZk4l7ReQh8tVwBtCFqTfN4Mx3uptOtD8u
         apM7wtmLHNw5sTYnNb3t/BlnMvtfIBsTcepfnSjlC+bWD+bBQhZz7kbDTTj+Q7TcNPNI
         oOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092753; x=1792697553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fUNH9yBsm16P8gIXLVqy2nE5rFnf3wCaKx6CjEnHAVA=;
        b=j4RPXM247OZdkD0rkiy4ehal/Gf61XpjHM5SPqbrIR5vtFKawfSHzdGM0MzGBt/Rdv
         KHn1Kggke/I/6QmUqxBQrkVqJzb2h2kYwuwe3ZiizV/9LshC+6S47kuocpIjnL3JyOaS
         Saas67dULC0f+LlMTlVNkDvizIkt0+cMahB8+q56TbTGYB3EIZSVfjir+gFxbb+CxrRY
         HcQYKdjGGOKIdFBqQQETQwti058/wJBEdvGRbW6+rj4FPz+mTGaqoK9TxhgZ9bYj9IiK
         lhcEh3lY76pV3i+tVUzK2UAVIRrmye+h6ABvPeU48h5fqHzfo/SAk5TvwNF2ODc+iZFt
         BU8Q==
X-Gm-Message-State: AFq9FYLJ8HuYdTmusgcuZMVfTspPSCc2x2crcsHeNnqRnlpQ7M0x8HO3
	ewBVcGh91WClMaMIaO6VWMXY89rlHxPJMLTJA66OVs1Yf2LtbwbUAvyN6IL1Wm47R+Y=
X-Gm-Gg: AYBFou0K9o9sXvbAVjltEAxSo+bhfLHj670DboPprIHFGjE8YGYvTLCAv5M8lKx1b36
	OejxL9PmekXh/CL3eS/CAVt5ZywCqmIqbfvho6f2JasO6CFHDVun0VMZGMAG0Cg5DNMtCHBAkQ+
	KQEVGZq4vywYqAtCGN/7KV36tt49OJhpPCrlIWfDOL5YenZwYYM1BHLl4JWrtUptlnFw0QlEE8Q
	GegmlxMRulLixhWkAE1nKt5tf9SA2WOvPu11cf84o6/gkrIlPkmzLBE2ocWi1QdGLYA3gzQCfpY
	qWHdEbFZO7GuiiVjwQsFneMCq9I533TBuxhzoRNtzoyd9/i9T9xe6Sg+5ij6AJDWBKNbyu0VLbu
	WdsZQI8SjVBjheHjyU52BWUkxORuYWwy7SCNt1AvRxlZq27qhtsUmJYP7cBnN1Ef01GJqIe9a6M
	lccDMudVIm8BbcKagsWulpmCO5eyo3M2l0cFA2/yDbYwlrMm6Z9LOIsgatLLV2Mwyqu2nul8ArD
	irJ/McApG7d3C8D
X-Received: by 2002:ac8:59c6:0:b0:533:415f:4290 with SMTP id d75a77b69052e-5359face2f6mr328988941cf.25.1792092753550;
        Thu, 15 Oct 2026 12:32:33 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.244])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb1af26sm3402496d6.33.2026.10.15.12.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:32:33 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:31:06 +0000
Subject: [PATCH 42/43] io_uring/timeout: don't end a linked timeout with 1
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-42-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092660; l=1481;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=Ihx+E0BU7CCDEhcvDOUEwSMhSj33KCOFwzjd4iN3u/4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJSRs2TOO1ddM1EGDfAcItxOvhKMNICzEyRuqsWzH/e/fXCmlKMhnIwm00dzC2jVcderYhhMW+a
 x+7y8qdApmgo=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A linked timeout that fires cancels the request it is linked to, and
completes with -ETIME if that worked out:

	ret = io_try_cancel(req->tctx, &cd, 0);
	...
	io_req_set_res(req, ret ?: -ETIME, 0);

io_try_cancel() returns 0 or an error, except for requests that are parked
on ->futex_list or ->waitid_list. io_futex_cancel() and io_waitid_cancel()
return the number of requests that they have cancelled, and
io_try_cancel() hands it on.

So the linked timeout of an IORING_OP_FUTEX_WAIT, IORING_OP_FUTEX_WAITV or
IORING_OP_WAITID that it has cancelled completes with 1, each time.

The waitid test of liburing checks for that 1, and has to be changed to
expect -ETIME, which is what the linked timeout of any other request
completes with.

Fixes: f31ecf671ddc ("io_uring: add IORING_OP_WAITID support")
Fixes: 194bb58c6090 ("io_uring: add support for futex wake and wait")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/timeout.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/io_uring/timeout.c b/io_uring/timeout.c
index 1cf59c494769..b219dfdf7af5 100644
--- a/io_uring/timeout.c
+++ b/io_uring/timeout.c
@@ -393,6 +393,9 @@ static void io_req_task_link_timeout(struct io_tw_req tw_req, io_tw_token_t tw)
 			};
 
 			ret = io_try_cancel(req->tctx, &cd, 0);
+			/* a number of requests for futex and waitid */
+			if (ret > 0)
+				ret = 0;
 		} else {
 			ret = -ECANCELED;
 		}

-- 
2.55.0

