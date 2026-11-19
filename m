Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.34.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795074309;
	b=RCvO8EQSonNaVBV11PdeBrlZfan+v/wcRFlp5X/5ueYLUEOUeD3rrn5I8r6bvSQO5zwA
	 RrIHzhs6HuZq//lSNpbvIuzLMb/OcOUlfxISlY7Gtb+WUhmDQ2XUUI42OHWx/Otna/wnD
	 SpHfZ+ZhIEGBX0+bjDnca9griak13aU6MMoL+zPsA8/8w2Qf5GbYc4yhS0R7mifB3KUHG
	 ejqe7xtaRanbThlwGUYKsgpgGSh7Zg4can8GptdX3sYzSkY4xXG5q/fV4JRqR/Q/NaRu/
	 zJ33/pD5CQB2NgT9w3TgTV8XqTOgRvXS6N4/BA8v1dFxXmsnt4RlcoxA3EJ17aAwWgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074309;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=ytxnJvmC2ixuAaHjo6JSf1SNEWCrUwZlXY5sRNv+bIU=;
	b=VGFlU2fjd4apdVph8yG+e+bjOYBdGnBfD/i5fChTZzr4hyHVH8kFAZl1DSa6JBxMZuXN
	 8evQxKdCGBQC4DKUDgsOydfVjjR5o16lcWeLEETdWdcWYdUaz3kVdo6X/LSAe/cHSvGlv
	 7PUOyh3HiYkS7EBR5jZn2bBaIAjJeqJuyUGJCb6gdmYToXwWbULnu+Mkkke+dmHTasBH9
	 Pz9Uyn1t5sqVAhJh1fbP3PvTbtV/tw/ot08+peFOsRtB2PpuDrytY7CCeQA+zG6fpkysC
	 38u+jMPJhtDq6A1/ScQI0Y1ycEG2MIUfHZwqcXYvdYQP//iTmd4SroxYdzTDtixPOLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=gbvblQH3;
	arc=none smtp.remote-ip=54.206.34.216
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE29606A33A;
	Thu, 19 Nov 2026 07:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FE29606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=gbvblQH3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1795074284;
	bh=ytxnJvmC2ixuAaHjo6JSf1SNEWCrUwZlXY5sRNv+bIU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=gbvblQH3lAbpe/M7UONZs2eeFdiPdPstD7dyZiBxrA+BT5xzHX8XWGWq0jnvP2qA9
	 SzqredqhZJieEV2hWK/4FrSJSBkvuel0rNJ8dGpjA/rk63CpNFyi94H7ZaghOIY244
	 265LXdB4V7znylrjQ2aOT+TrwAl4ATW6CKTkxJeM=
X-QQ-mid: esmtpgz10t1795074279t20300963
X-QQ-Originating-IP: RQhCkk0w1sVVXidgdMvAtf8ODVAnCBRHWFEN1XmiVAc=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 19 Nov 2026 15:44:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8105951678597454203
EX-QQ-RecipientCnt: 5
From: Yichong Chen <chenyichong@uniontech.com>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	linux-kernel@vger.kernel.org,
	Yichong Chen <chenyichong@uniontech.com>
Subject: [PATCH] io_uring/poll: don't lose the error of a failed poll update
Date: Thu, 19 Nov 2026 15:44:36 +0800
Message-Id: <20261119074436.1137704-1-chenyichong@uniontech.com>
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
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MVocNrGTvdghz05os13oUpO0WWMF2TWPqZx/qF//ElqpEc2lohimwmRV
	nMgpYZIGmyInFQhfqq/Hqu/xOrcGqSB51G65V15kbEkCJUu/WuGWB0U4SflUXZuoRTvGI93
	50oEq3g1Z2d/mss9ILsTwMGYhcYIWkknHt8kogx2UmtoFOG2xKk1/2tAPrSaUPsQfLWkH51
	vPg+F1x+N25hKX+ltci2LMx9vQ4xqWrgC1nPc9hGr7ARPz9Bzbnem6zqDuzIWBSP9cwe4M5
	rEzarPbXenkIOUxK6V0bpNrP7ZOheNnZPTS5tz+slORSUte7ABxYR1tXI7tqzl3/GgIj22M
	DSuy5ox2qkT924xNnV7Rup+WW1uwE5Kc/0FJ/cYtnWAVs5JKrgAlgdt3SLGmktzIhmtTcpz
	IamRXqAb/dGRhcaFXKkE8FPBAyUFguOWhcr0fhGtc9u6ns0KTKbaqaXadmYXN4Ki2sUkkUg
	PQN1exRn9au7K9Q318z+JoQeAaCJibQOEGqTulTLPrV7kQ9MPCMHKyxgXpBZMTy3h8BRwXv
	2qLcujTm3pSYW4HcT10VF4C24qpOhGgJuqQa6P9vWj5O012j84OEPEjNmfLKzEPn0Y4Qiik
	43qkuz4nqAuv7tcTXg7Z6q/KHgVV8mBLdvfpzgWGSEd36QuFrrAlapkgOEynoppxLBJl2rb
	TAfAnIceLfher1YqtET+t3pxLEyfzlop+LilpH8C+KBciYUfqpHZbhvGDJNAPCmliLZ7JAs
	quPP1XotJS1Iw7LbLZEe7udZTIEQXpZLcUbsvbIY3TsNTT+LCLpkHTW5zw7w3NbQ2NeIXd2
	HTg2EzII33Ku7Ojivs1ujsbOdmkNvmejhQGKNvagzeeKdL1XIuxmkQJT1WiiWiYueXfGtcp
	VTC/L2CBGmGzB8vXlADqzDP/R999vp7b6SrSCUwKlAtXKc/xGb4ll9A9UkPcbsTJb5IgHt8
	5zSN3f315CAjoyEVZ+n+B5dz6Yng9CTOXo438WF2OjFIO0n+PEjmTQ1AKDrQ2JvB9Kr8cih
	JQ6qFYtlmdBWBxCPCXehmtv9kCXWtmVaR/Kd7T0j+SenOGYEc66qJXPaZunLJFifvCPXzsI
	A==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

A poll update rearms the poll request it is updating, and io_poll_add()
can fail with a negative error when the file registers a third wait
queue or when the second poll entry cannot be allocated. That case falls
through to the -ECANCELED completion that is meant for a plain
POLL_REMOVE, so the poll request completes with the wrong error and the
update reports success. Complete both with that error instead.

Fixes: 97b388d70b53 ("io_uring: handle completions in the core")
Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
---
 io_uring/poll.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/io_uring/poll.c b/io_uring/poll.c
index fc1800c..c2955c1 100644
--- a/io_uring/poll.c
+++ b/io_uring/poll.c
@@ -1031,6 +1031,9 @@ int io_poll_remove(struct io_kiocb *req, unsigned int issue_flags)
 		/* request completed as part of the update, complete it */
 		else if (ret2 == IOU_COMPLETE)
 			goto complete;
+		ret = ret2;
+		io_req_set_res(preq, ret2, 0);
+		goto complete;
 	}
 
 	io_req_set_res(preq, -ECANCELED, 0);
-- 
2.51.0

