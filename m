Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361AD51EDE2
	for <io-uring@vger.kernel.org>; Thu,  1 Oct 2026 14:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865035; cv=none; b=Wq0GNu+pI7n+V2JsUQDcCiBSrLvt2dnU3SKkjHE2KUKcuYer1bf8v89GtZj3MbBH1Ize3g6RhC7rUAG04o6Pd0kHyzlxDxC3Ewd0qFfCTASnmN/0hBwbHewNvyEAegPhFXRbqd0pujFQ/KR5imP4qxCjKVWSKo3/D9QEyFYvdUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865035; c=relaxed/simple;
	bh=ACbJxeoK+tQ0jwduxNk/3YbWQ2yNLFDFuyI87ek85gE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GcTBeknlRfpqgEj+fh4neqXc1bpgCH6d3F/CFAX5+0pWFWkNPMgPD/LFNEc7Ni/1YVgs1iqLh/YdEHKHDOziIP5yBvmsfdtfOmjNSROSkDToHvauyv7j7SJEqNrxQ+18vbOL9gfrxrXbZbOT0jcGKDRkmOZUfuK9mvfEpACK9Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUqO3d06; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUqO3d06"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af929e59dso2056271f8f.3
        for <io-uring@vger.kernel.org>; Thu, 01 Oct 2026 07:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790865030; x=1791469830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6uQT/hE7wfllb+ZxQNIrp7uXtAUN7ODmert/inI1vO8=;
        b=YUqO3d06tWFjInOiBkYIK96bHknJpRQ0HKRZ4JbmTcUxVoLWNOWC1Gg0QhZkbnTCQe
         Zb9yHnl3xKEU/3Zri7lEv5ugWoYrbnORetZWBsX6+Xr2TikHLxSU27KUF8VFz5Rt29Yx
         ftOp1MPnFn2s9vY4+spDKaOeKq51/4acH0vKaZ0pqJTe8iZA99LCIGrbNOBW9lXYvyu6
         ZtUp3ZUYI9l0c5bdyTl5br87Umi4cin0VI0N5qRlJA8qS++FFD4fU18MHmiJVmRxm2j1
         PME5HVrqUwz05+RyPMSXH56z6zJCoQw461tcDC4fIRB+YXnqzsvUucFvO3WLS6J0fdUQ
         4b3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865030; x=1791469830;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6uQT/hE7wfllb+ZxQNIrp7uXtAUN7ODmert/inI1vO8=;
        b=inAIjA2EYwionSDjq/xyuxrWNTtcUvqchXCL3sglm5dWXDQ1bneZ1kWwid48VvgDAD
         fdw8/iezhMYoiNRFurK6eEvl7CFfP12b/EawlYbciu62n/ZhM+z9R28WUGuOeX0i8bvR
         WfK3fg1om0Cku7qT9VVcEgRMz03Fsz71OB0ty1xyej+79odBO9CX4+ozEe2SuZo3g44Y
         v0z/jZzCF+Vb4Nub0Rxcgs4Q0I7O763XPcbWwqRq2rqME4eWMB+oL76IpCfVlPVMxSc7
         wbeOIHMQBcVLFvGTsGwNqVZZZmC86+CUPfamCsGMROUMgINlrrfh2D3TCiGWIinbCxQI
         dkZg==
X-Gm-Message-State: AFq9FYLdipJB6WLAZtFeJmekE+gHfjRs6x+lCH4BI0kWLeZGaruwKYws
	wt8QUg1jWlcdQPf8/qkCvdL/W/NFCDn1YaJFbWRI2XyPcmFg0X6FQWsS
X-Gm-Gg: AYBFou20fSdeYsL/BBxLq4wHjDhNZUW4TxJYOF5VuCqczHUcBQ2csPw0Rl4cYqOf9xR
	NSCKQ/lmyXIffz4KBoXtQNujs9w5hQ1wil849SAQ+eF/QCwaj/LqJLL2uf94vFVNmjfGNbb7BAa
	YfWy/be9qrbCAzo+EFebbwWKE2/x5aCR+LwoMNWa4Tj6D+lIkyzxhbxId2WlcxlBvuFdR+0asUB
	5WXSanXevQidQFEABSyKbGTd9s5B6VOVZkuSGpOb6V5zNAsVhnljOeiM7SYyixulTeLoFL8c0X8
	ZShAghVRKZlajqrhsiErtl1h/90XdZmBy0wYn1DFytwisvsLU8NWej9AVr9w1q86AiCmzKPRlMi
	A3+DDjELi3+IGVfVevIm+PxO8nzK9qULOvGsIFQongRGObpKTaOUx9fcvSkvrl4ogZ9jrz9hK8R
	9zzaoVchok2HyBHAzewZv0/xmjR+WOUoc+/e5Yag8+7M9Wo/+STKUDmLdjSw7jJ1H0Zj/eK54oP
	pM7vh4=
X-Received: by 2002:a05:6000:40ca:b0:48a:f571:7b50 with SMTP id ffacd0b85a97d-48b024d7284mr8291147f8f.27.1790865029297;
        Thu, 01 Oct 2026 07:30:29 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0691c4c4sm7548232f8f.22.2026.10.01.07.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:30:28 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH] io_uring: fix out-of-bounds bvec access in io_vec_fill_kern_bvec
Date: Thu,  1 Oct 2026 17:23:54 +0300
Message-ID: <20261001143003.755790-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

for_each_mp_bvec() dereferences src_bvec[bi_idx] in the loop condition
before the body is entered, with no guard against bi_idx reaching
imu->nr_bvecs. iov_kern_bvec_size() stops iterating when i reaches
imu->nr_bvecs even if bi_size is still non-zero, so the fill loop can
walk past the end of the bvec array and overrun res_bvec[].

Open-code the loop with an explicit bi_idx < imu->nr_bvecs check before
the dereference, matching the termination condition in
iov_kern_bvec_size().

Fixes: 1045afae4b88 ("io_uring: support vectored kernel fixed buffer")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
 io_uring/rsrc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 51b46e624..3d29a0c7b 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1614,8 +1614,13 @@ static int io_vec_fill_kern_bvec(int ddir, struct iov_iter *iter,
 		struct bio_vec bv;

 		bvec_iter_advance(src_bvec, &bi, offset);
-		for_each_mp_bvec(bv, src_bvec, bi, bi)
+		while (bi.bi_size) {
+			if (bi.bi_idx >= imu->nr_bvecs)
+				return -EFAULT;
+			bv = mp_bvec_iter_bvec(src_bvec, bi);
 			res_bvec[res_idx++] = bv;
+			bvec_iter_advance_single(src_bvec, &bi, bv.bv_len);
+		}
 		total_len += iov_len;
 	}
 	iov_iter_bvec(iter, ddir, res_bvec, res_idx, total_len);
--
2.55.0

