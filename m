Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.21.23.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792859735;
	b=N/2NUB+pJ9+YftkkUgfuIDBNKsR0UYwPEeVi7opDTTnci4VdfCH+PtAumpyikK8CX3mo
	 fza8w91mKz0sZd32eKyn6AZz+LJcIfLPh6ath66BMLsuUJPpP9ABG43m5DHrSarHB1WTZ
	 pH8+/1w+VyhLnUZ3NUP0AV+Lyq4Esv5WEPNtpWBQce5hjP+W4xgrFyNfL0+czU+Dri353
	 BdORsM2clzY6RyJqR1S8a+YJcsZMB3T7smCT7kWxuQnfFdfPqmBOHpKrk4njhvFkXk7Kg
	 2RpyzaftVnPhna8hxi6KmslVTWQ2prCQkheVUxEMT2RHpEwqyJAQAOBWo4x7sgWyrTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792859735;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MQRcY6gEkOWv6JkX7ccMW9dbIba5qzHy/u5c+DannKk=;
	b=Fk7e7ol5ca3HWuzbVHpeLrWP15b6hcprlWKZ4o+WZ/OXE84THrBBjcqk7o5jb7FWWmCZ
	 AjcVD+b/HwSMeYlWcusgGaOqQknd4PzPrdfmAF9JQEhw3Ck5yt5E/+OWaj8YcpoTGEYYN
	 U3e8w2hqaNWQUOLW37HNe6knexS0+AYfKp4wBXMFr/Ww5p9uDJtj/31IBJlkWyIkKVNxM
	 Rt+mzMKja9nzct8kk7d3mevj450xXog0Nvg6hbkm1rSr6O4MF3Lu6/wJHIbGzqe2pe0yt
	 Ox1NNfXHhgxhp9MI5CV4U/sRqseOhOmyHroDo54Fv4KMn1GKdrsoZem+KjmXlzkiXmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=disroot.org;
	spf=pass smtp.mailfrom=disroot.org;
	dkim=pass header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=GwE5+yBf;
	arc=none smtp.remote-ip=178.21.23.139
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E611606A31B;
	Sat, 24 Oct 2026 16:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E611606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=GwE5+yBf
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C780D80D19;
	Sat, 24 Oct 2026 18:35:33 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKwbHi7kwV0d; Sat, 24 Oct 2026 18:35:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792859733; bh=mkcvTKsJ2IngJgJ+jkc7uJV1xbmJPioj6YWPmioFAXU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GwE5+yBfjeRZOH1DX5U7rjNPPmlVMJIdGQywS7Ka/qJJ+8T5e7VbFdyoWvUOcZgXd
	 7tuKSrXClBpYWpgPLH3AlFjfznXzHBlIKw06ov/RAzovE80+zKHzJ6o8JfFfguFteY
	 ALrFlvD2HfQI08SK4EDHt+JMqVeaPd7PbrmC+P0JTpEZ3Z9uWAfcefKVO5yYUlOVpv
	 4jGrKgHWrvMpQUmk3Kck6vBAxnw62YTMIfR+O3nQWH+gBuQn+PH2UuSZpguss+gW3t
	 P2eMKNUYIy8efVM0Y0EtuWqjXijwRHL1GoEXXqlWb61Oij/XONPxfCsMYlpO9uoMgP
	 Adr88TQ/hS7GQ==
From: agxr <agxr@disroot.org>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org
Cc: agxr <agxr@disroot.org>,
	linux-kernel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH 1/2] io_uring/cancel: count all canceled futex and waitid requests on CANCEL_ALL
Date: Sat, 24 Oct 2026 21:31:24 +0500
Message-ID: <20261024163259.19372-2-agxr@disroot.org>
In-Reply-To: <20261024163259.19372-1-agxr@disroot.org>
References: <20261024163259.19372-1-agxr@disroot.org>
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

With IORING_ASYNC_CANCEL_ALL, __io_async_cancel() calls io_try_cancel()
until it finds nothing more and adds 1 to the count for each call that
found something, which is correct for poll, io-wq and timeouts, which
cancel one request per call. io_futex_cancel() and io_waitid_cancel()
cancel all matches in a single call and return how many they canceled.
Three futex waits with the same user_data are all canceled by the first
call, which counts as one, and the cancel completes with 1, not 3.

Sum the return values of io_try_cancel() instead, so that the count is
the number of canceled requests, as io_uring_prep_cancel(3) documents.

Fixes: 194bb58c6090 ("io_uring: add support for futex wake and wait")
Fixes: f31ecf671ddc ("io_uring: add IORING_OP_WAITID support")
Signed-off-by: agxr <agxr@disroot.org>
---
 io_uring/cancel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/cancel.c b/io_uring/cancel.c
index 6f7a6cf356c2..e4b27b79b05c 100644
--- a/io_uring/cancel.c
+++ b/io_uring/cancel.c
@@ -198,7 +198,7 @@ static int __io_async_cancel(struct io_cancel_data *cd,
 			break;
 		if (!all)
 			return ret;
-		nr++;
+		nr += ret > 0 ? ret : 1;
 	} while (1);
 
 	/* slow path, try all io-wq's */
-- 
2.56.0

