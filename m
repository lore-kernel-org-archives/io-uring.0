Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794804338;
	b=Anb5/o2Lpj5WYDs0EjTjVrEn4Zu/bc8URVM0Iv0i56kiVLmOVYqLSmz28AdO0T0dPb4B
	 HLn1LANjoqgQ/fQYSz8iHzBFR0Q6W02FRBay4lw3R64pn29XzROMGbAUqtk+tXqHWLE0C
	 1dMpOPil13ld3z7M3ZWzUqj8bcAZmPU+j0RqRE/nALMP6J+JmHVqt024S4MoKf5gcYQ6G
	 R6HHKbrRbYAUwx6aC29IeP7gHsFH9J5H0icpze5iHAxa2oGI4NESTUGZzqxUrH2eT08F8
	 MUKOsmcPyJEPjDFmYb49UoH18MFXT6MdDIhmNPOb7BTMy/KsUQRx+jdIb43ownk89tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794804338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ec+zOuX2/4uGXoYQx4K6Gp4ALgZ8Wm0wKK8/NlJwSAY=;
	b=M8sZuNMAHet57iLX2iJYZMPckgu5y+EW60gWJqRfe54TGpcxVyti7E+jF1WdBRvSCEsg
	 oVv++ejQ/5B6gPv9AdiI1QirxKPXwdw+IKfMqpacVtkABrn5rg9MVnqOhRLYyI/xB7mM6
	 7kuJi98AS5upSdEm47sBzieZuPKicGSJsk6oayFkieD0WEcU4UXLfdR0rIj4IUZc8hOg8
	 rDVdc4wm7Tk10iJDZFh0kCFXjevOrQdi94Vzs6xpmCxFmaODUbRi7eg7osSQQ+ZIwHhkh
	 YE3EdqL5J3cjuigrf9bQCnLUPQYoV7vw/giIktvPEW//mksGTlUgUFEqV98pAXH16JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TNoqf9wz;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E92606A330
	for <io-uring@vger.kernel.org>; Mon, 16 Nov 2026 04:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91E92606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TNoqf9wz
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3b4944abeso543821c88.1
        for <io-uring@vger.kernel.org>; Sun, 15 Nov 2026 20:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794804337; x=1795409137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ec+zOuX2/4uGXoYQx4K6Gp4ALgZ8Wm0wKK8/NlJwSAY=;
        b=TNoqf9wz05Lzm3aTExLxVhy6/mWh3w7aFIgKXYAVle50jREqrlZ9rKJnj+KQc1UVI6
         hHp+jmF40HuTPbK3eQEio/MnXRFMKVurvVp6wP+S+tIJc+mOb3X4iMuU1RJefJVKnteq
         fPycibbhRaZL2OUNxlyDWp5dqkj9IgX3jtRnWTzQNTGp4Besc9LR10pOXI6BmQXfT/NF
         u8E21BBGPHAew8raNRK7dwVdmv+ZTaPVBZhY8XSQP+rtM2DnF1+BTew+wa5G2jy4siOw
         N6mY6DqM1/+TmaqcAe49dEKMd5LjBtHeHvRfXdYoAst2c/w0Atjgda2yvioXloFwrONb
         3cCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794804337; x=1795409137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ec+zOuX2/4uGXoYQx4K6Gp4ALgZ8Wm0wKK8/NlJwSAY=;
        b=DH2i7oWAZKHCBCS1pPjAlGO69D6XDTL9D1O5nPztCBVw+DYZLFBqjgITF4gMegof0S
         aobvIB1jbK3uzhLKViP0pmaq/bF1oQpOgd5COiPmKoeBFRLFlEx+LQU6jAkMJDLf0mqC
         leiBMFbubiOQM4XthbSOxaPs3QFfclECu12444rKkXjauTyww6eEH+CgPKnAT/8ZNWdw
         eYqyvaXWJ7TNpNdPM4zJ6Twkt9nkVDVhRMUg+xbHwULSm4EX4a06uFzpm/1/Syc+LTvN
         K1NXfhZy2++IX32jK9N9xVUTTCpL660v0b9n/+K+mNRqTCeJT39K5LkCt/E9rKTv+Bs2
         UJ3A==
X-Forwarded-Encrypted: i=1; AL+hErEarlDWqRQd3wSWj9ZCEkUektOqSNMCFqedl4h/V7/FTTsJdpchn3kpGWM4MN8SgytwFmHGZTuZLw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/J3Bd9kkIJo+M9zZkhPuBXUyDr3YNdTSA6O+bwGrlUA2OOZjXf
	jOFXccgYbMccAWK1Ifh0/fEOujWv9CB1yW2AUNoM6zt+izqCxBelpc6Ym8VcY8HU8bs=
X-Gm-Gg: AYBFou3FHLKGpsVqWWtjAUBVwVqZ0LyX85ZzIWtgdOCvyk9muFw3qX2xkrSwNMJO2Eg
	GbSrsXtYGYyPQpu/Sr4+HiNKk+4BoueHbljWrkQH0NoyHmN8tFMmnPO11hhE92H9OUmCw9jK7Qz
	YArpFFMLN8IWgaOB1nIVZ0E1treDk9npkYfNb5mCHH4VZ7xw7uxjfcKnSEKwAuNvMH9iRd2JDcB
	HHDKjt3sTjVlSPhUHHJ7eCaFx8bWp5bd2RN0FJAHhmIOMqyPSZFGvM/Sku6vjcrgiH5xK0B/K5f
	Qr+rUV3YGGrF+5EpnBtkZkutO9vxMfGn33Dl7CtXbv+5WmcNm5NvhBmYwVkZU9dZCBn0eWoHN/p
	5WGwM1wnF+1KcCJfCSZOMhvElY/oC5MI78E3kQSWNaVJEAkzJqilOGXOTDjSy+jIeRM8kvQ8hHe
	kttvorrdBiVf17fQP9dhtI794qAoLiFnrScpFvYNV/Ac0yTCCvC1MxeOvLWACQvO6RRoAE7NLlQ
	BQlBnG3c/pA1Wf2I2E80y7wqEWk4GMU7XU3lUJ9uMcHeZqJM6n+YeTA+de2OGgrP1C3FEWf52+N
	gdhCq6gJzMV+vtDHAQOpVmONqu7ybNKlq6dxwNcHGuZKKmqpKUPYVe/enikd9WSMqv2o
X-Received: by 2002:a05:701b:4250:20b0:1b3:a22e:b74d with SMTP id a92af1059eb24-1b50312e4e7mr9645077c88.34.1794804337463;
        Sun, 15 Nov 2026 20:45:37 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm28011373c88.11.2026.11.15.20.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:45:36 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Jeff Moyer <jmoyer@redhat.com>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] io_uring/rsrc: keep the old file when a file update fails
Date: Sun, 15 Nov 2026 20:45:31 -0800
Message-Id: <20261116044531.281978-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
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

__io_sqe_files_update() resets the slot before it calls fget() on the
new fd. If fget() fails, the fd is an io_uring file, or the node
allocation fails, the update stops and reports that entry as not done,
but the old file has already been removed. Later requests that use the
slot fail with -EBADF, and if the old file was registered with a tag,
its tag CQE is posted as if it had been removed on purpose.

Reset the slot only after the new file has been checked and its node
allocated, as io_install_fixed_file() does. Removal with fd == -1 still
resets the slot right away.

Fixes: c3a31e605620 ("io_uring: add support for IORING_REGISTER_FILES_UPDATE")
Cc: stable@vger.kernel.org
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
Report: https://lore.kernel.org/io-uring/20261115163612.225619-1-teel4res@gmail.com/

Runtime-tested on v7.3 with the closed-fd update from the report.
__io_sqe_files_update() is the same in io_uring-7.4, where it is only
build-tested.

 io_uring/rsrc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 8de5737d223e..0b811d3c9c0e 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -363,8 +363,6 @@ static int __io_sqe_files_update(struct io_ring_ctx *ctx,
 		if (i >= ctx->file_table.data.nr)
 			break;
 		i = array_index_nospec(i, ctx->file_table.data.nr);
-		if (io_reset_rsrc_node(ctx, &ctx->file_table.data, i))
-			io_file_bitmap_clear(&ctx->file_table, i);
 
 		if (fd != -1) {
 			struct file *file = fget(fd);
@@ -388,11 +386,15 @@ static int __io_sqe_files_update(struct io_ring_ctx *ctx,
 				fput(file);
 				break;
 			}
+			if (io_reset_rsrc_node(ctx, &ctx->file_table.data, i))
+				io_file_bitmap_clear(&ctx->file_table, i);
 			ctx->file_table.data.nodes[i] = node;
 			if (tag)
 				node->tag = tag;
 			io_fixed_file_set(node, file);
 			io_file_bitmap_set(&ctx->file_table, i);
+		} else if (io_reset_rsrc_node(ctx, &ctx->file_table.data, i)) {
+			io_file_bitmap_clear(&ctx->file_table, i);
 		}
 	}
 	return done ? done : err;
-- 
2.34.1

