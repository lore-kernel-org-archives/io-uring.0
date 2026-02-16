Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CF32BE644
	for <io-uring@vger.kernel.org>; Mon, 16 Feb 2026 11:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771241879; cv=none; b=tk1rLf68avTjTosjfAxiRav9KQEVu3xP6VpAOzzXJq13H64Qfn49qDaamK/qkt18AjqcjqsZLnyKu/HRqV2sE2gOq9cbg4brkW+Ovnx7dJblQC9PNA2aCnTks4MSGCV4DKcozZu4ViltBTj887l3/Z9EdevGMheVa5L6cf7/0b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771241879; c=relaxed/simple;
	bh=9SwJIXNatGa13MIbu7yYNg7OiZpFMhGhfwjg/TPZMTg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tzWsMIlq1H5mnOziBwQdXzT0RevCP/7BgrvofNUCzmej15ayfEcmpZ+BaCdYOtLjkLTwD5BgpvQP2AlQJwUQFGsQhXgOan/pA9wkRRfXIQF8cAsJH980BWQC2zygNPS9MQ42piHJ3Zqslai2GPbCsp3ySu9BHhmBXIC3Q1Gz5SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PhT1ihxA; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhT1ihxA"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-437711e9195so2122000f8f.1
        for <io-uring@vger.kernel.org>; Mon, 16 Feb 2026 03:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771241876; x=1771846676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ie7sanvQ2WlrCGUEyafWbbgTttCDULhAbUZjCyVHztk=;
        b=PhT1ihxABHra87j2/ALm2C+EgfF/uExBMprMXoY/A8bLgZjaoXCCrNUJ0u04jz06mt
         KIws8eKfSuU+qqj+yImLpmZ3MBdS7hbtUQhJhTE09E2W6KPYDPjis+axwwNQxkmmJ8yQ
         VfJlIHCTLZZJkktQpaaQ1WiC8jXXGWcC73FvH8fDbJYWkhUmYrfoH+UFzJSSrnrN+QAA
         nEiXiEuEiSom85PBUtQLCMkbb/KhfsDwz5Wtts1xvejRYd0lMi7840KGzvdif8QO1P9E
         Gu34cOACd/30f1Sqaqmb3UkLjn/bv03liL4gjNBpQtwua5GLmddqRHSoU9qfTYVf8Rr6
         HPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771241876; x=1771846676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ie7sanvQ2WlrCGUEyafWbbgTttCDULhAbUZjCyVHztk=;
        b=J3/15XlVtAzUaLPiMNGrajiDCsP9DmRoGJ86t6B1pTjZdglkgRKpCNMQJNEA0+EIjJ
         I6s4KB+vMvGeE+m+NqDtxG0irmkB1HvUC9o7n1HqqTy5t+87SeWnLmW3kz+eiQcMI6g3
         eJGc1mWx26y6pNZoGlnky4iR/7ghL57H+ycMZhvtO27gxOqxYkkfPLnDODGdJKUuN8Wk
         ZHJt3DRjFmFdsZi5GzyahvZjYVma9fRpqH3Pg/Pp7u4g0UXlACKtXWD/pW0VZAeOm3VN
         hPa9CuM3c6y3Dwm0LXvOkL8UjzmpisAkQ1J7NSYZoa/MjupwgTqL8XACN1GiA5FiNR7c
         hREQ==
X-Gm-Message-State: AOJu0Yy2qA6jEMX6nlH5BEf6fhVPrw7iZVa3bHmp3TfoG0laaRUe5CfX
	jESNN/3HyRiQrazeIh57B7lmzEhhGFZmGcnOd5Dhoq4TW4HqV4UOm0poSZbsxRkFoTxOeA==
X-Gm-Gg: AZuq6aIEMf7GDCXT2cyH0SYoLlN0HDj334zTgnBJM6K9iQy4FZH74jjRZRpQNcw0/c2
	OlPijB4qonvV/paUOYBoplquF8MPF6OLdd5mNlJZAhDSGwtZQ4T4m3oPoHiBg7YV8AzbV+ipLO/
	adts6zr0mMhNt/alpjZozFTuihKzhJSqyYTVgDmrhFvOMGymGmHyvGTpjo8abeRRWJT1IvZ6vM6
	eWukFeb4/1FNgZNBpX21CU8fDHT9CN3mzEmlDXaAwc/n9cuQ4lqoW1oNCuOoUp30bfuM5XpLh8K
	HYWSmk7+zJ5Ir+Az16ot2FOltxPUNnHRtg1aauiNKqfFy/v5mRi4FrI568QkpTc+S6YyaJ+LUPS
	HDrtdnFcj6b27zahKJQwxi3O5pqOd7lXezO9yGFG4EG96tPul1BvjLVAPmkxleYJKruCKif/tG2
	PwFhwcpgkhEPqywxDthlSibMWS+2+XoI/UEW7ZUu7f/7RJSOmcnBoMnal/w+hhV6Ti3qSHmHvkn
	zymDw==
X-Received: by 2002:a05:600c:1991:b0:480:2521:4d92 with SMTP id 5b1f17b1804b1-483710858bcmr195564665e9.24.1771241876347;
        Mon, 16 Feb 2026 03:37:56 -0800 (PST)
Received: from localhost.localdomain ([196.119.106.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483719b8e71sm242492925e9.2.2026.02.16.03.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 03:37:56 -0800 (PST)
From: redacherkaoui <redacherkaoui67@gmail.com>
To: io-uring@vger.kernel.org
Cc: axboe@kernel.dk,
	linux-kernel@vger.kernel.org,
	redacherkaoui <redacherkaoui67@gmail.com>
Subject: [PATCH] io_uring: document advise SQE field reuse for 64-bit lengths
Date: Mon, 16 Feb 2026 11:37:00 +0000
Message-ID: <20260216113701.4650-1-redacherkaoui67@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IORING_OP_FADVISE and IORING_OP_MADVISE reuse SQE fields to
support 64-bit lengths without extending struct io_uring_sqe.

For IORING_OP_FADVISE, the length is carried in sqe->addr when
non-zero, with sqe->len providing legacy fallback.

For IORING_OP_MADVISE, the length is carried in sqe->off when
non-zero, with sqe->len providing legacy fallback.

This differs from the more common addr/off/len interpretation
used by many other opcodes and can be confusing when constructing
SQEs manually.

Document the field mapping in the UAPI header to clarify the
intended behavior and reduce the risk of misuse.
Signed-off-by: redacherkaoui <redacherkaoui67@gmail.com>
---
 include/uapi/linux/io_uring.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/uapi/linux/io_uring.h b/include/uapi/linux/io_uring.h
index 883c9ceb5..7955ebb98 100644
--- a/include/uapi/linux/io_uring.h
+++ b/include/uapi/linux/io_uring.h
@@ -25,9 +25,11 @@ extern "C" {
 #endif
 
 /*
+ * IO submission data structure (Submission Queue Entry)
+ *
  * Field reuse for 64-bit lengths:
  *
- * Most opcodes interpret:
+ * Many opcodes interpret:
  *   - addr as a userspace pointer (buffer/iov/etc)
  *   - off  as a file offset
  *   - len  as a 32-bit length
@@ -37,12 +39,14 @@ extern "C" {
  *
  * IORING_OP_FADVISE:
  *   - off           : file offset
- *   - fadvise_advice: POSIX_FADV_* advice
+ *   - fadvise_advice: POSIX_FADV_*
+
  *   - length        : addr if non-zero, otherwise len (legacy)
  *
  * IORING_OP_MADVISE:
  *   - addr          : start address of mapping
- *   - fadvise_advice: MADV_* advice
+ *   - fadvise_advice: MADV_*
+
  *   - length        : off if non-zero, otherwise len (legacy)
  *
  * This mapping is part of the stable UAPI.
-- 
2.43.0

