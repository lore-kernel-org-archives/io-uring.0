Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8C523EAB8
	for <io-uring@vger.kernel.org>; Tue, 27 Jan 2026 18:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769538805; cv=none; b=gVzgM1uFOWtn3kbOIoKC17ppT7cAe6d3zWPhFGb2a8f7lJ483sCuRvL9QT//xillM3Y0XMh0XE0moSFEe/XeCiyP1qMX7YKr4XzSm2bp/eaBetea/QI8mbYIiV6Ypy7DGkuoC0RxvFDMXJwAPABUyLbLgGR8vM8S2aUezM5o3zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769538805; c=relaxed/simple;
	bh=WDjswcGmu+URwVBhj3rvNgM4OeAeViHfM2CRYBYVqrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ws49X1GfGrF4rHV7iB/GdNwXLmtygy645CWyE24lOBJwDLFJNy1V2IILNXB9mBsRrjvPBQvAmrfE/iJYmU/u9jTPnFtKRyCvZqmx8ebkaNYNJmOgxrsJWtS6DPb+9N3o4LyHDVQIkA7xongOCicyo/Xpv787V3tdwyGi5AWDNhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=zzgeREyv; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="zzgeREyv"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12339e2e2c1so79907c88.1
        for <io-uring@vger.kernel.org>; Tue, 27 Jan 2026 10:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1769538802; x=1770143602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+G5wGaTmkxTU6STxnYlAGIEvd/ULBOo/mXmy7j467Vs=;
        b=zzgeREyvFv4pzapbExqSL85QiPpwxsi4PnQjZfJqfi7G8SryfsStE6IfxiNFXWYtr8
         gCiSnFBptDT74XnVGQIXFY+49Wrh1e327CKq7z7UT6ZS2tYelkdY1+yiLF5h13J2NJJ4
         pfe7rJuqytP6+0rfnM1j//fwSS3MPXgcUwztAxUkbd0f+PXe1Bh1uCOOHIpdGxcl2t6J
         YxbJkZ7WZU2HZBS9nfGn2PUH0aYusIioDbdOaY9YNm80/G+MrOai2P9jVPN/TOcOZrwH
         5FfVLpwonbTg0whxVTUIYyhSHx0EAmdsfplA4t9a+m7bc/JJ3RJdRCPFxTSHkJMIwtrL
         nZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769538802; x=1770143602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+G5wGaTmkxTU6STxnYlAGIEvd/ULBOo/mXmy7j467Vs=;
        b=Fbv3MRkorqaoQlqhGFtjg9cgNJSPJ/gUdPu6WPlrIwzfNGnMazzxd4ZtigVMhpaAA4
         NfabLpj6FUZjBGLmUMHAxiUh1mjQBrq4gj708aV/racCv2bKcbctHcnNwsPaP7rIUlVE
         OL1J+evQT8enshGQvOCRmkzeMMhggOvln4MrLjYYEvjz3DNGKnpLL4cx36nQrEqleEf/
         yLHgcZQRe+luvEPacE7125QYOJb012WcEJpqh+AGyItjSbXNB02NEPlODKgHnClxVh9R
         LYpgefMSQThjkUfD5nAW+VFLWWb5HVKDOBLsnFj6QgA6bZ5l1MbDqQrSPI/ulwnMHvsT
         KYmg==
X-Gm-Message-State: AOJu0YxOwoNVTzNu4/omrGOyyxbHHG52xjkD4kVEJcRfVnINz2w93h96
	ZJ/MKgUD/CIY3NZwDHbcd5JRRknwYYVIDKGf2gC0+n9znhboIkbC1jNapZVr+YppP8wv4J3QPcC
	pFdxS
X-Gm-Gg: AZuq6aIBvhdFNMiqzZYUasw9B7Gk3MhEvSThTgBCS03NiYgN8wJnaC4hbLhxElgeq5R
	mz38zkv+dRuBDvf0RaLcrqXDJ7rylH+WB16U/3DEXhivN5BQ9OeGe/jUOWbqFVKsmUdknwPgV/W
	hhocsXk6mPjh/jRpgj5IyD61MkJXpGpjY3fNZZE5zkFn/xT2YG7BhcBzx7SR+wMcRCsQuDYEuiB
	ovum/EiLTq3ZmNch6U72Yp60cTl7aUq8TpAzbav0WitwX0kqCLXyf91XVhpB3B3JteutU1ChDaF
	4P39DlZuq6DR6kiVBzUSJhWNQuL+o4t2RTqN1vanw7zgHjeFcJci56rm1dDhIALuJ/vM2wZXRDj
	iWSdXXiTkVbRXl1nCT8MCcBD0P8R9fp5kI1+hFZ+L55YQa/fMPLO9ItNBsNDTQnVJGdHQfvGff+
	rfdzD0Rwi8RtiiV2EHpFnuCD4jcf9QqpfqwF56gebRSBStzf+UxXFSBwDPou3oBg==
X-Received: by 2002:a05:7022:68b:b0:11e:3e9:3e91 with SMTP id a92af1059eb24-124a0e94dc6mr1537903c88.26.1769538801720;
        Tue, 27 Jan 2026 10:33:21 -0800 (PST)
Received: from m2max.corp.tfbnw.net ([2620:10d:c090:600::cedf])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a7bd05b1sm670139c88.3.2026.01.27.10.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:33:20 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: brauner@kernel.org,
	cyphar@cyphar.com,
	jannh@google.com,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 5/7] io_uring/bpf_filter: add ref counts to struct io_bpf_filter
Date: Tue, 27 Jan 2026 11:30:00 -0700
Message-ID: <20260127183311.86505-6-axboe@kernel.dk>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260127183311.86505-1-axboe@kernel.dk>
References: <20260127183311.86505-1-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for allowing inheritance of BPF filters and filter
tables, add a reference count to the filter. This allows multiple tables
to safely include the same filter.

Reviewed-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/bpf_filter.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/io_uring/bpf_filter.c b/io_uring/bpf_filter.c
index 1409d625b686..b94944ab8442 100644
--- a/io_uring/bpf_filter.c
+++ b/io_uring/bpf_filter.c
@@ -15,6 +15,7 @@
 #include "openclose.h"
 
 struct io_bpf_filter {
+	refcount_t		refs;
 	struct bpf_prog		*prog;
 	struct io_bpf_filter	*next;
 };
@@ -125,6 +126,11 @@ static void io_free_bpf_filters(struct rcu_head *head)
 			 */
 			if (f == &dummy_filter)
 				break;
+
+			/* Someone still holds a ref, stop iterating. */
+			if (!refcount_dec_and_test(&f->refs))
+				break;
+
 			bpf_prog_destroy(f->prog);
 			kfree(f);
 			f = next;
@@ -298,6 +304,7 @@ int io_register_bpf_filter(struct io_restriction *res,
 		ret = -ENOMEM;
 		goto err;
 	}
+	refcount_set(&filter->refs, 1);
 	filter->prog = prog;
 	res->bpf_filters = filters;
 
-- 
2.51.0

