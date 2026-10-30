Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.207.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336640;
	b=NGVUqfGz45ilnrc0g4ho9/FEuY8OSfIk3UMQOIk/f67n9FHTgoTxGzDGrPT3cGUKe5yG
	 ANRTw5qkYMGMkkypRZjLnFSrooUREOePapfG4L99FrZ/ox7LOCVruFe6rt2ItoddQ2pfD
	 GDcWWt8614z3bMhCvuhMNonmy/mDoOi+eAEUNKGjVMT4irUbl/YGdWYgaUbHMS7eIvuQc
	 7qs7aHj6ffjL5Ejh1anv/FKVKNfORj8Xp2Ro8FOCHijuRQQQu59E/WlFYPA6OALByraID
	 CLXfKWRGUkLv+LHVkhQpsPHmXO4e0xtDnoat3NHDTYvJv/uA9hMBX2NjDhe3cwBbo/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336640;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Received:Received:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-Smtpcorp-Track:Feedback-ID:
	 X-Report-Abuse;
	bh=9MW3clqg5v18pZwU63c4oEVpjzsyxRxNLjxrPy28qGc=;
	b=dxBnGpMcqEMPXY1P5uucCIGgugSWkQclDVAFYmr/Dl6Dg2lfFRJQdBppUnJPXADoaFW1
	 KvQAhflL/1a4BK3AGW8vnkmQSYCadYo85HuttAl5q0U3gSpnHnlKZKjMRkRvcuSaWx45s
	 GlZS4f7IJYbbEEO3fU0uIt2I9OZGgH3Kwc6LZJCPwogw2jDTghHZ0XmmexD5tgHa5uG9h
	 ry7pE7VUDFfaSWitK7XHI3eQOfCTBfDjfbAS9XxuwSmAdnFGYKkhCtLaxnr41ClTwLOj4
	 mHPkgyCwjfOWbS+JU/PZhJ1DQAVS/m+Lp73s/YsFUlZqDe1HMClxC1MNi58aeNw3BdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=shangen.org;
	spf=pass smtp.mailfrom=em879706.shangen.org;
	dkim=fail reason="unknown key version" header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=miusa0.a1-4.dyn header.b=daD+jyIi;
	dkim=pass header.d=shangen.org header.i=@shangen.org header.a=rsa-sha256 header.s=s879706 header.b=GsViAtMq;
	arc=none smtp.remote-ip=103.47.207.181
Received: from a2i949.smtp2go.com (a2i949.smtp2go.com [103.47.207.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17F8606A31A
	for <io-uring@vger.kernel.org>; Fri, 30 Oct 2026 05:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B17F8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shangen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em879706.shangen.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=miusa0.a1-4.dyn header.b=daD+jyIi;
	dkim=pass (2048-bit key, unprotected) header.d=shangen.org header.i=@shangen.org header.a=rsa-sha256 header.s=s879706 header.b=GsViAtMq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=miusa0.a1-4.dyn; x=1793337539; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Date:Subject:To:From:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=9MW3clqg5v18pZwU63c4oEVpjzsyxRxNLjxrPy28qGc=; b=daD+jyIiWV5M/57aGh8Wq1Ay+T
	x1eXyWPohBhmrwhQTN4qBuM0oB97zP+H9E8zvIJ36vzR7e9X0GRT370or2qlIQ7Apoz2qdPXErwx8
	7e8SNJhm/rR0mGlvRn+XHJ5/nFEivmvJfekeQ6//yVe5DOg8sp9/iWUKCYWspErqLTZT7YbdNz3bm
	6Hs+ZGVGnvJDygoZ7KZFnC4mUVx3WakWSfh8PLfquEDHdUgJIPTYq5eai4F5joMYjwFYuilJAzGwt
	4x2BgJN9hGp0VhvsRLE3GMqyUCHHtDQ90Rj5UQdxCKFJkjfF0xuNEmIQ1UZIXxuL+qmGnF5Z3pIZ0
	WKBD0pVQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shangen.org;
 i=@shangen.org; q=dns/txt; s=s879706; t=1793336639; h=from : subject :
 to : message-id : date;
 bh=9MW3clqg5v18pZwU63c4oEVpjzsyxRxNLjxrPy28qGc=;
 b=GsViAtMqyzwoVpc/wTMz9imXiPyJbPuEvL0v9vM6xhq7E/pJLLdiYXUuTu2SYe4o0ka+j
 dCYP/axX8PN2fK2TPozBkeSY8KrqZ/pwbSiNuSyU9C/jnxVaxrgbsYPZp/k8X+HhljgUotS
 S0N4fzgkDtnGiMYl/HACXj6lZBx2EEhNmjDKenhxeT3cLqWq/VXRQILZ3mLdbpxVAT/8bF/
 lh4ug6MHaOlZmQGo8gNhZu7Xj5BR3rBp8JlnpoR8iMTOAcoM+AzGk300TAgaelFL7G5MZKf
 mP5LOTC9yJ3rAV6voeDi/w6S5a2cLVS93PWhR30+r6CxWxKv9xyr9EGvQPTQ==
Received: from [10.143.42.182] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <sim@shangen.org>)
 id 1xMemR-gL4QGD-Bv; Fri, 30 Oct 2026 05:03:55 +0000
Received: from [10.195.244.224] (helo=sse-laptop.lan)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
 (Exim 4.100.1) (envelope-from <sim@shangen.org>)
 id 1xMemQ-FnQW0hPtGB2-jeMa; Fri, 30 Oct 2026 05:03:55 +0000
From: Shang En Sim <sim@shangen.org>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org
Cc: Shang En Sim <sim@shangen.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH 1/2] io_uring/cancel: count all requests that a CANCEL_ALL
 cancels
Date: Fri, 30 Oct 2026 00:03:16 -0500
Message-ID: <20261030050319.1448530-2-sim@shangen.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030050319.1448530-1-sim@shangen.org>
References: <20261030050319.1448530-1-sim@shangen.org>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Smtpcorp-Track: Y_IxnS2ywuZ2.ArXRMkk4orBe._2A3JgZnBO7
Feedback-ID: 879706m:879706aL5FzMA:879706s3PvtaaPe7
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

With IORING_ASYNC_CANCEL_ALL, __io_async_cancel() counts one for each
io_try_cancel() call that cancels something. io_futex_cancel() and
io_waitid_cancel() cancel every match in one call and return how many,
so four futex waits cancelled with CANCEL_ALL give a result of 1.

Add the number that they return.

Cc: stable@vger.kernel.org
Fixes: 194bb58c6090 ("io_uring: add support for futex wake and wait")
Fixes: f31ecf671ddc ("io_uring: add IORING_OP_WAITID support")
Signed-off-by: Shang En Sim <sim@shangen.org>
---
 io_uring/cancel.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/io_uring/cancel.c b/io_uring/cancel.c
index 79b5c133319b..50a65fbc6ff0 100644
--- a/io_uring/cancel.c
+++ b/io_uring/cancel.c
@@ -198,7 +198,8 @@ static int __io_async_cancel(struct io_cancel_data *cd,
 			break;
 		if (!all)
 			return ret;
-		nr++;
+		/* futex and waitid return how many they cancelled */
+		nr += max(ret, 1);
 	} while (1);
 
 	/* slow path, try all io-wq's */
-- 
2.56.0

