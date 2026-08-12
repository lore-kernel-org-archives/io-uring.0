Received: from oss.cyber.gouv.fr (oss.cyber.gouv.fr [51.159.188.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6837536F415
	for <io-uring@vger.kernel.org>; Wed, 12 Aug 2026 20:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.188.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786566707; cv=none; b=iDqISFf6oecmG28UlV63KlhrvcDsRBpe+jV54ieykIyK4YBPgcN542d0b2FgmS7uYC/AMwLXiRAl6wo+S9dbXLN5KfguLBOh5U3IeWsSXMwvTk0yuQbhZ4eK+xqlWccobOHOy00wxDn7cdNhiLYhB1FjAmemguEXz9MZB4HRzAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786566707; c=relaxed/simple;
	bh=in0hqeed5AVxq+PUOrsZClUV+nf49uajE1f3xQd5+vY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=byqYwEPTLh/4oxD52ODwpy+wi8aPIuwbyCd9opoJdiacVBxU5PCevnwNcAlJKM9JzYODt7GQevS/5GRQdCyoN2o6hVPQ8tbRk326OEIihghNwxN/fskxPKdEJqRtRCTbLcFtmsSBdD5QSBICIWdPlMdEWR735Crm8lnWOtH8ATM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr; spf=pass smtp.mailfrom=oss.cyber.gouv.fr; dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b=bhyZCI6P; arc=none smtp.client-ip=51.159.188.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b="bhyZCI6P"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oss.cyber.gouv.fr; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/qOhfugf4rgGjgFLQbglb4MVW5O8ytwxggNeQikXEas=; b=bhyZCI6PdevAJptzB06/eBdMD3
	EOzg3ASARCr0hbQMwHBhyeLwGWVVAol1aTSewol+HzmX04c9kWfF9WKtbQwHHFkCOxcs2iGBpXsLu
	JIQwWigzt5VofTTk4CUT6nA7BdFmrFRkeuUH398HJ7IZPOsu6Yae2ASm3Xg+jvpH331Dlv/DwaN4H
	CMqpt3rUWXq4Ee6vPE2YhwoDmSvVUim87aOEQswBw6MA90PgocLTfgm/F5YNH3ELaszUaPIDD4FI/
	OpGKtdXf/SqwXyLNd6O0pan2uX9cNFzkoNin4F3IMr8lIdcJ7MXCP7gxPgh21iNJ7n8qmp8Anrv4F
	SY/CnpkA==;
Received: from [151.115.150.205] (port=52324 helo=gepetto..)
	by pf-012.whm.fr-par.scw.cloud with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <Jeremy.Jean@oss.cyber.gouv.fr>)
	id 1wuFc0-0000000BTh4-3qnc;
	Wed, 12 Aug 2026 22:31:43 +0200
From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Jean?= <Jeremy.Jean@oss.cyber.gouv.fr>
To: io-uring@vger.kernel.org
Cc: =?UTF-8?q?J=C3=A9r=C3=A9my=20Jean?= <Jeremy.Jean@oss.cyber.gouv.fr>
Subject: [PATCH] io_uring/rsrc: reject overflowing regvec bvec byte counts
Date: Wed, 12 Aug 2026 20:30:42 +0000
Message-ID: <20260812203042.720348-1-Jeremy.Jean@oss.cyber.gouv.fr>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - pf-012.whm.fr-par.scw.cloud
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oss.cyber.gouv.fr
X-Get-Message-Sender-Via: pf-012.whm.fr-par.scw.cloud: authenticated_id: jeremy.jean@oss.cyber.gouv.fr
X-Authenticated-Sender: pf-012.whm.fr-par.scw.cloud: jeremy.jean@oss.cyber.gouv.fr
X-Source: 
X-Source-Args: 
X-Source-Dir: 

io_import_reg_vec() converts the estimated number of bio_vec entries
into iovec-sized storage when struct bio_vec is larger than struct
iovec. The conversion still multiplies nr_segs by sizeof(struct
bio_vec) in size_t without checking for overflow.

On 32-bit kernels, a registered buffer large enough to make
io_estimate_bvec_size() return 357913942 segments wraps the byte count
from 0x100000008 to 8. io_vec_realloc() then reserves only the input
iovecs plus one extra slot while io_vec_fill_bvec() writes the full
bio_vec array.

Check both the multiplication and the rounding addition before
deriving the replacement iovec count.

Fixes: b4e41050b212 ("io_uring/rsrc: raise registered buffer 1GB limit")
Assisted-by: Codex:gpt-5
Signed-off-by: Jérémy Jean <Jeremy.Jean@oss.cyber.gouv.fr>
---
 io_uring/rsrc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 8d0f2ee24e0c..98dccefd801b 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1653,8 +1653,12 @@ int io_import_reg_vec(int ddir, struct iov_iter *iter,
 	if (sizeof(struct bio_vec) > sizeof(struct iovec)) {
 		size_t bvec_bytes;
 
-		bvec_bytes = nr_segs * sizeof(struct bio_vec);
-		nr_segs = (bvec_bytes + sizeof(*iov) - 1) / sizeof(*iov);
+		if (check_mul_overflow((size_t)nr_segs, sizeof(struct bio_vec),
+				       &bvec_bytes) ||
+		    check_add_overflow(bvec_bytes, sizeof(*iov) - 1,
+				       &bvec_bytes))
+			return -EOVERFLOW;
+		nr_segs = bvec_bytes / sizeof(*iov);
 		nr_segs += nr_iovs;
 	}
 
-- 
2.47.3

