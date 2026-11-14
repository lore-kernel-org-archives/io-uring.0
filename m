Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640991;
	b=j0FTDeq/qPe8ualsI1NwOJNRP2cp23EMMVCtXzMJiR7f28oRKYBWuHGzyTsOPbjp+AdT
	 QyohZuTPExNO6aj8d7/tQfbZveheeqZCAzy9ssxAB1DrlUD30v5IsePLEN4+lPzK8TmKu
	 BhosDXXwFPW8HnheIVUdsmBQQiHQVm/1++S3jqzsrMBF8SLIc6ehOu/0BFHbIU3qF+E+I
	 VJNZPun1iSugjXXAL1hWh3RrgTRPTtGExVUtH+kxKsRF4e2uEOMoe0/SRfkb5Cy06q9Z6
	 PkZ6mr++NWLWisxiP3dQxAVct/8nXBdS/HiTQcHpuoZG31wOmQwvlAh3m5Ki6qJC0Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640991;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:Sender:
	 X-CM-SenderInfo;
	bh=DF/QJm6WdIg9kEWmwC07df3AP9Yqmus/meRt1C6Higs=;
	b=2SJt2Jxf4Ntxxzxa2NUMyABCpj7Okkx/to7hKaHNW/NI03UMX+npkmGwsobEMm5LH3Kq
	 SwhJcbQxuus2s19WZ9bIY17bcSwr29sodB04/ew3Xys9NesWdnA1pC4UkStr4Kny49266
	 Tkq+OBIa75AolK6U3Q3HQz2xk7SpfbbS2s0mWZJkfSRmXr/U/O8qorJRC02pfRbqTvxAG
	 raty+MK7hjFcor6VqtDLR0NGpDq2D1i2gyNQFGt/Wf9JEPk6Zi5p7qGArg+SgfBVU7tHW
	 +HRVbZpSnU38kVwUIe2XUScPmp8NfyWyGHAkvat2Qqn/hqOhg6fpo8fEWAMGLS03SRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FQ1+ejav;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561CB606A330
	for <io-uring@vger.kernel.org>; Sat, 14 Nov 2026 07:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 561CB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FQ1+ejav
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=DF
	/QJm6WdIg9kEWmwC07df3AP9Yqmus/meRt1C6Higs=; b=FQ1+ejavI6aM4wAKG2
	QClrtN1H1Nk78rWUrGkX6ct2inwLrkVlW7LnLv+o+uNFhruu9TEb1JjBxbZ3iJO9
	R8NS/RWR4a8A6QOTlFB4XH/Hfz6RS6EmThQKjHDkcLngJ207ThjrP8klQK1/AwMs
	m+oPeomeOcL6L9uXcqNBzfFm4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3v9tIDPhqC2tdHA--.18420S3;
	Sat, 14 Nov 2026 15:22:50 +0800 (CST)
From: Yang Xiuwei <yangxiuwei@kylinos.cn>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	Yang Xiuwei <yangxiuwei@kylinos.cn>
Subject: [PATCH 1/2] io_uring/futex: fail soft links when cancelling a wait
Date: Sat, 14 Nov 2026 15:22:45 +0800
Message-Id: <20261114072246.741950-2-yangxiuwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261114072246.741950-1-yangxiuwei@kylinos.cn>
References: <20261114072246.741950-1-yangxiuwei@kylinos.cn>
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
X-CM-TRANSID:_____wD3v9tIDPhqC2tdHA--.18420S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr1fAw47trWkJrWkCr43GFg_yoWxtwc_WF
	ZxurykZryFkr4vk340kF4Sgw1jyrZxAF4jgF97JrZ7J3W3C3Z5AFZ8trnYyrn8Jr1agFy5
	Kan5G34ayF1rZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1T5l5UUUUU==
Sender: yangxiuwei2025@163.com
X-CM-SenderInfo: p1dqw55lxzvxisqskqqrwthudrp/xtbC6grtfmr4DErLsgAA3e

__io_futex_cancel() completes the request with -ECANCELED but does
not call req_set_fail(). IOSQE_IO_LINK dependents then still run.

Fixes: 194bb58c6090 ("io_uring: add support for futex wake and wait")
Signed-off-by: Yang Xiuwei <yangxiuwei@kylinos.cn>
---
 io_uring/futex.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/io_uring/futex.c b/io_uring/futex.c
index 9e4e63ee7bc1..615eaa9104b1 100644
--- a/io_uring/futex.c
+++ b/io_uring/futex.c
@@ -107,6 +107,7 @@ static bool __io_futex_cancel(struct io_kiocb *req)
 	}
 
 	hlist_del_init(&req->hash_node);
+	req_set_fail(req);
 	io_req_set_res(req, -ECANCELED, 0);
 	io_req_task_work_add(req);
 	return true;
-- 
2.25.1

