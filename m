Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747079;
	b=DJunZqIv/GhCPHdisDluf7iXENOCQ0M9w9DEAnpXTz3yY0sU1sK2c3ondPHC3iMvm5XT
	 8H0tXUQXy2twCbMHqFaeC143kZHcDMF0NwrM++Q6SgcbYurJoVFy1MmzcxAqfQp4gu4Mb
	 Y60q5DJHrIrxPdUAH8a1zV+cmVQC07uNrdnGbbJ5qJ+RjzFHZBeTFjU0UHisXaYKw9u59
	 Yye1+qy+VbrOzT2h7P5w+xc8r8Gs8G7EzJahGixxnS38nOW6B7wZkj4HmfbLWeNobuLc+
	 F8EcjvUmJ76vxmKoCQIFInRfp2KH/S4nUjPBb0eRO9dW9Qazz4izV5cE7Hr82X3qw5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747079;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=vCaGcnZTR82B0Q1HZe/LrFh7RY9Jg8eY20e6IdmanpA=;
	b=w76/0BXx5iOM2UaKQT/kMxCwk9BWbqHchfUJhJXcxqI+75WsTlO3srE1Ez2t4dYxROzV
	 BkJO/ZsWdMMBFBw4H8viP5yqVTj8hSAJEgOHhoYPwkSI0g50dUVdXX3TLLmD6J70WoV2Y
	 YW1PC+PjJPvMP8i5qlFPxQArX4kmfLf5Qa0bCIu37sKHWl48sWwpM7ZMhjZtZwON7BbUR
	 zfdJFpV70fBHLsdjRLGY2bmfbW6ExfTyf1lT5Us84MBCsjmYdAL7CJVvKzLzUWfada9Ca
	 G6//I8rNAMOQMlJjcSkYRsW01SLDhSvmhfUYEw3aoFKX11zaZmnjvUuAmj/T2ObvFhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b="EGmA6/ef";
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB966606A31D;
	Fri, 23 Oct 2026 09:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB966606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=EGmA6/ef
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1792747051;
	bh=vCaGcnZTR82B0Q1HZe/LrFh7RY9Jg8eY20e6IdmanpA=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=EGmA6/efotQT6axv2/1L/n5y6x6E1pPgxDG5/d4M4PjCSZ+Ut87Oh2NC1etME6HZY
	 KjxY3lC6sdYGj1Oa9OLI9DNYy+8rkgQ+3k+D/QlLve3L7aAPjiAzSS/Lz6U9a4UEb+
	 A7YUsNHLFFT1cuWvzOMWAQ2N0TqUvTsdbkzKGUcg=
X-QQ-mid: zesmtpgz6t1792747034t0e7b3d6d
X-QQ-Originating-IP: EdzLsubUSagEXaHTwdmDL5Ha9EjCZH/pQI4lLQ+xhOU=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 17:17:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 18435226015879681334
EX-QQ-RecipientCnt: 6
From: Yichong Chen <chenyichong@uniontech.com>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Pavel Begunkov <asml.silence@gmail.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Yichong Chen <chenyichong@uniontech.com>
Subject: [PATCH] io_uring/kbuf: advance head when a pickup empties the buffer ring
Date: Fri, 23 Oct 2026 17:17:11 +0800
Message-Id: <20261023091711.83481-1-chenyichong@uniontech.com>
X-Mailer: git-send-email 2.20.1
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
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MNbA5mkmBXEJJJaUbrv9nVE9mKRUHm2OWGmQdBResGy1RUTEHdYkLkOH
	MRQlp46gi7IsM00bAf1JIEdOnWnx2CDHokG0RNWfcmeRJqQlGvIZGJZdPIUyB3Y/2yuRIcI
	gvrvY/wjKcz1dMcvVZ+jL0Th7SQNaqnfQPIQzH1EqhS1B4hqMg4cOpw8RWKNiFBk578BEzN
	XFhSCGIYKu9KbW9LfB0rzRJyBQUcG+F7h8pcg76DWkrIQYwm1znFFAkswrMnyQY8pRWTUOU
	KeUS0rZT/x+7Lx0D5LGL0JwAARV4urcIpLs7SJ4DlxeoFQ4UPa/MLH7maSAAcdC7t46QvLo
	h3+plruaZeJqfRxBdV0KPS3rj/XFKMmDy3c5/OOFGxsUFEOPOXnQv8ivLk4rALMf5MdUK9+
	SRa/o4lNafbqqyoLvbs+RhpeGBvWbvCyxS1vwHshvDiDYUCsQVjfAJXn2EaY61xHIg8/O5F
	WC9+nBLYuS3Wj7ooCzCLl0sfg5crpeMZ+rR8FdooTGIaVvf1H7Z6Lw/UY/hOH8vure5jjyy
	3bYMHPomXrhuXDhRgOmrXJqOccFivOibLr6BYxV02DNMCjeV4G31Qxp+29Gq9jTXVYJrJM+
	Jwr4KuAy95CHHCvs19XMY9R840Zwu2H7k1YTvINlnk12mp9fkMgOZj9x7nVJMJnd3F/Tz0C
	XcNs3d5HMfi/isEkx3M8A71X8cwd3dyHsG+NJ3TF8KqgBpRIrYwRuhxYrTlbDyRSdOK1kK4
	OUzXSVLbgz/orYmkR6cxy+R/moVjgeK13SyJPbK+V2X2oUb8qkV6sW3FdF2Dc9pC1LLtZdy
	R8Arzp7FzVJL/4HZnTiPtjwVl+jzkti/sT4XMNyIBfhYESdHXell/2t/NHAde8jVzAXIIyL
	2lVjoNg3T1APMBXrBNvPZN8V94Aj+7luVyHAQccMahvQ10ZqzyEUeDIHc3/RgeKYx7RiTc4
	zCxzbZSUe3mYPsWFDrN8ifVdsHMp8dLojaOv2OT3V0e0zEyDggSxcCCSClZaws5gBt+Vc1T
	BavvS5tA==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

io_ring_buffers_peek() flags the request with REQ_F_BL_EMPTY if the
buffers it picked were the last ones available, comparing head to tail.
When the loop breaks because max_len was exhausted the buffer was picked,
but head is left pointing at it, so the flag isn't set if it was the last
buffer. A bundle receive then retries, finds no buffer, and the request,
which has received data, is marked as failed on account of the -ENOBUFS.
That severs a link, and ends a multishot.

Fixes: 35c8711c8fc4 ("io_uring/kbuf: add helpers for getting/peeking multiple buffers")
Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
---
 io_uring/kbuf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/io_uring/kbuf.c b/io_uring/kbuf.c
index c9641b6ccc8f..abf44f5dba26 100644
--- a/io_uring/kbuf.c
+++ b/io_uring/kbuf.c
@@ -326,8 +326,10 @@ static int io_ring_buffers_peek(struct io_kiocb *req, struct buf_sel_arg *arg,
 
 		arg->out_len += len;
 		arg->max_len -= len;
-		if (!arg->max_len)
+		if (!arg->max_len) {
+			head++;
 			break;
+		}
 
 		buf = io_ring_head_to_buf(br, ++head, bl->mask);
 	} while (--nr_iovs);
-- 
2.51.0

