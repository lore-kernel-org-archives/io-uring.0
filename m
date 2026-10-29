Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283273;
	b=ycKxXc/yJDYWNefIsgDqkTCfI2iuygJoveI3Ihc4pDXn7lzhB/99I0XTtKVRZVmFIDBR
	 K8YBYEkYnpCqPYZyep9gIyK3Ikr9+jmSdG3CrbVJbdhSA3nJ3B16njyf/oYWri03Nr8Cw
	 Vpu+Q1JrHv+SWjHom+IKAEH9/sC7F9hbLZRJp7ylrwDFlDTky/SMz76yeprAQTBqzWB7b
	 QT6+iV6ijyw7y0YWMTch7NpIxqXhgOerpO9RUornx2VriuIS2N2t/n10oQE3aFpbxOIiP
	 ph8vV+ZITP1vx9kbnu+Ng9uGD0d7ACTaskYDy/2KS8A1xdk03dejCsgXQLwMQIu0lGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=00lZgsWW0CT6Uykh+WSJbmsT91YueScgXuLixivUJzA=;
	b=UZsNRPqohtUv9AxpSsAOcfk80Tlmo51R5cQhL1CdRdhi4zEZYihoQB1QeN+JVapJC88T
	 BPvINDlQKyhOQe/FHQARHwjI1GLbfQNEt0SbbkDqXnrITMGBRZp6wUKp24S5jzfyw6P9J
	 xv2mqQFdj+/CIAthtfmGzZyk1PlITIpvvejpYesUOPSvqAO6J9WlzGi7EQNrkHj1MuzEW
	 oZ3cng8cqCgbz/T/yKVxMXAMO+C8wz2KHQH/+Z/18Ta+XzDBEKDnaOqqRdUWWR77Pq9C8
	 fXg0KfkyniLNGds9G4puUVvsMVGlV9oImrfECphqeJcYg1WTRnKgDE8GjUeGWrWx5sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uf9Bfqyn;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD40606A31A
	for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 14:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDD40606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uf9Bfqyn
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-188406bb948so1978225c88.1
        for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 07:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793283272; x=1793888072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=00lZgsWW0CT6Uykh+WSJbmsT91YueScgXuLixivUJzA=;
        b=uf9BfqynQkU+wiqJVzlGfJjl5YteHO5oj8ASqeDQ6IC12ermeFKj9c8hWsbcd4+P7z
         Y3vO6lfEVerrSdq9CAulTAn+i6sQeRptE2yiUYHJlzwDS9DSZuKRi40CPal9AiadRpwQ
         IiAGsSZQRyABq+4Sw/SsIsz2pxfA4zj/IgwK03Av2x27WhvwR86eGQ1LKwoXCTZbMZsx
         Eda3HYx0Fcaj1Yh3KeKtF6ECDyw/k9AZBWEWg0RNAza7UrXDD0Uq1IhOwmvgKPuy6zxO
         4qnfr9UiOmkCg9YudsR9TuB7J5cTMHQrw8E7EyJ+gMkasXWvaKNHgpjNwLP7glWZ3G3w
         kwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283272; x=1793888072;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=00lZgsWW0CT6Uykh+WSJbmsT91YueScgXuLixivUJzA=;
        b=HEUuP006SRASDmINVaKYY+bEtW1GCJEEWWxxsddSEBtzAyBPCrBMUEgFY1Vi/XtfIr
         4l/5x2eudSkRMdKPwLfUqTopYX3w2LTHzirKAPDwAeeTTzkqbFW/f5AlnIjHzk40TOqO
         YLJ0kMxQhV9La4WHrXKIRI1ACqCtjEgyiJWXn2WXQw1cM0kqDlXRJPrFAsaNAFHKRnyr
         US0uHrzwrsfzEC5/lhjZ5dFmKtuXhxl+sOp8EQFtNyeDICKG7zMO4PdjE/sW/P3SwvUR
         WT2vxs91ruQ5lsBQs6E1VzeHcKCOVnw0ifXA9Kk/KKxYOeX5T8WqpZhzwOan2DyJ9+RJ
         u5Fw==
X-Gm-Message-State: AFq9FYI23FugGNB6iwOfgNS1FqC2nmsKqJsYbLbHQRe8/1+ulQQL2OMt
	6VriVACpdu0gskGmmIkVXbHmc9rGXzHME94hHXbs1oFhj8ioj0Bwv48h
X-Gm-Gg: AYBFou22ePTaE6RKQpoRkkhfZLjlmKjW7qgJGQ+qiGbC04zteLAhzcvgnlrrea14Di2
	nwDT3iJQcy8VzOdZdKPpvOmAfBMIoAiLn/sZRb0LNcQZ2rPHafL9Non+EoEVGdTe6jKrNnh7xbw
	JzI+4+PCXJpKXnhrM1rI/D01ZwWZAo6J/R8mBCtgJw3M2Xv2q3KtuVHvV0nyyIW8CIbN9dPmHUe
	2Qk6sPCVyBoYVwsAYWrixg/7K0RdWk8I2S4QrgDFDBk81YEqKGQPmGubkfo0atCgtrey0Dp1FxG
	k86TJkEgHDvXqbig6x3JLNe4H8KrXaUpdk20tzd/9WrsvMHKRoQA0GW9eGNkIKmEm2xIvffRk7k
	mrKiDi8o71u1bcFHlmhOe8vN1uCNo5/uRE8ek6QeOBHn2dFmoXva5HtuITqgGATAjHA5YjvU3bg
	RQmN6UOjC1xNYNiQTlURIFKy2S2xW7wsDo2Cj6ckVIHE5uKxYfceaIeN7Xa0MkQyUqYO1pR40do
	YZ2H+zPPOiMKZ2rKsLSl78gF9SgRXTkH9I/WtHvqox0SohJZaMWAqlmW+F/wC62RmWw5h18+0lQ
	LS2CPQX2WEpNufvCbtyHbZRvlxmg7Wm3yu0rKyORjZu3JldvLqhg1A==
X-Received: by 2002:a05:701b:2616:b0:151:2e62:fe4b with SMTP id a92af1059eb24-1a6ce4ebf97mr6501352c88.23.1793283271761;
        Thu, 29 Oct 2026 07:14:31 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d76814bsm15197319c88.10.2026.10.29.07.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:14:30 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] io_uring/net: fix multishot recv length limit accounting
Date: Thu, 29 Oct 2026 07:12:20 -0700
Message-ID: <179328314078.648427.10086632105828535293@gmail.com>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

io_recv_finish() debits sr->mshot_total_len with min_t(int, sel->val,
sr->mshot_total_len).  sel->val is the cumulative byte count of the
request: on a bundle retry the receive path adds sr->done_io back to the
return value, and the bundle branch in io_recv_finish() recovers the new
bytes with this_ret = sel->val - sr->done_io.  The debit therefore uses
the wrong value after a bundle retry, and the int cast truncates a limit
above INT_MAX.

For an IORING_OP_RECV multishot request with optlen above INT_MAX, the
limit becomes negative when cast to int, so the first completion debits
the entire limit and ends the multishot with IORING_RECV_MSHOT_DONE
while the socket still holds data that covers the limit.  With 120 bytes
queued, a 64-byte buffer and optlen 0x80000000, the first 64-byte CQE
lacks IORING_CQE_F_MORE and 56 bytes remain unread; the same setup with
optlen 0x7fffffff posts 64 and 56 bytes with F_MORE.

After a bundle retry, the bytes already debited for the previous
attempts are debited again, so the limit is exhausted early.  With 1400
bytes queued, optlen 1000 and buffers of 600, 100, 100, 50, 50 and 200
bytes, the first attempt delivers 700 bytes and retries; the second
delivers 200 more, but the debit accounts for 900 and finishes the
request with a terminal 900-byte CQE while 500 bytes remain unread.  The
limit could have been reached.

Debit only the bytes received by this invocation, sel->val - sr->done_io,
and compare as unsigned so a limit above INT_MAX is accounted correctly.
Non-bundle multishot requests keep sr->done_io at zero, so their
accounting is unchanged.

Fixes: 0ebc9a7ecf6a ("io_uring/net: Support multishot receive len cap")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 io_uring/net.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/io_uring/net.c b/io_uring/net.c
index 66e637a..79af1f1 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -881,12 +881,15 @@ static inline bool io_recv_finish(struct io_kiocb *req,
 		cflags |= IORING_CQE_F_SOCK_NONEMPTY;
 
 	if (sel->val > 0 && sr->flags & IORING_RECV_MSHOT_LIM) {
+		unsigned int this_len = sel->val - sr->done_io;
+
 		/*
 		 * If sr->len hits zero, the limit has been reached. Mark
 		 * mshot as finished, and flag MSHOT_DONE as well to prevent
 		 * a potential bundle from being retried.
 		 */
-		sr->mshot_total_len -= min_t(int, sel->val, sr->mshot_total_len);
+		sr->mshot_total_len -= min_t(unsigned int, this_len,
+					     sr->mshot_total_len);
 		if (!sr->mshot_total_len) {
 			sr->flags |= IORING_RECV_MSHOT_DONE;
 			mshot_finished = true;
-- 
2.34.1

