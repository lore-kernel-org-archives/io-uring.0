Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793807219;
	b=1Wki8mYb226g1WuCbfEr+JIKwhqTmWO1eLGBWZcMGj0KI2YgWpoOBo8wVK8B1lY3Ye1H
	 Q7UKf+FIFTSeHwrSYDXAivOiCZ0n/hmUMkPkJiMgOFskS7TPcW9a1J9S8P5vruad7V8eG
	 qQX2/DHN3x2n/Oks2CSNTCSnPZzTaeenBPIdVJ+JRR1viaJywg3mPcq7QJgv/A7UVuMnc
	 b00gVQJmnKvpLF9EtIpf9SUGSOR4nWKeDokKcUk44uZRyAQQdySUk8cOy7C4aLlcBmpv4
	 HId7dSMPCLB8mqZUh1gqA50aSAY8fHj/NvYtVEwemVtGjFWzq7GdB36hxvOV9An/T1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793807219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=4iSX/nWU8rMCqRdOx/hltZVoYHeJpLYWf61qQIJ2Cg4=;
	b=Vz4tqdB+CCc9qGhweur1mux4/rpX79HFof/UBWzvIeQ2t1YwD0/DxQPAyPMo4fEZ3JPI
	 3VSluxR8CI2nsOcVTYYz0GAYAzmlvd9KwoTxrayihehgLprDQsA2RwH56R+5daZVOS6Sd
	 xb+DkZNvYVhQPpU7jV8Og908HEq34zMJjfExUwtoMZ8ctshvQZR6iBEcUseYoPqvKoRdu
	 iwGV15WgbS04qqXTfaXjlzh7czTJYJiRT8hvQ8F9fEpedPaSuY7aTqamwsYEbNNGGf8/Z
	 IzBJkVpG6FOQXu11NL7k+5iH2W/0NYkjD8/PyVGtMx5AIKRRn7/sJkoRf0E7qB7oPGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b9d7Xvq7;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0004606D812
	for <io-uring@vger.kernel.org>; Wed,  4 Nov 2026 15:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0004606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b9d7Xvq7
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a070755c8cso550922b3a.0
        for <io-uring@vger.kernel.org>; Wed, 04 Nov 2026 07:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793807218; x=1794412018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4iSX/nWU8rMCqRdOx/hltZVoYHeJpLYWf61qQIJ2Cg4=;
        b=b9d7Xvq7UcCxwI0UY5MepvczFSZfomz6wD6OU8cFdh0QX16pPRcpA6L4+e9FpRqIqo
         EwnQGXEmakoBOqKpIQIxrd6c/ofcSfUm6gpBb7dWELKh2cLWUS/wH07LeMhdSauqwBmP
         jgaAHWbMUr9khNPQoBvl4BEJZMa0fb/EIk1wHc3DWYNtM3Js1UIfBY2YUlI1RuBJMKDR
         y/cGwgMLQOFKepbWthFCgWUvHu7VfUfO/JF5JI4xcjnhF0C88ZVMrlvL3Pp+ouRiFmtp
         PJ95xg3i9l8vX4Vum+LVzbgUdIFAlhidZr4xTURkJ5syKNV1fq1B3Ue28c9jJxlWkeYJ
         liSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793807218; x=1794412018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4iSX/nWU8rMCqRdOx/hltZVoYHeJpLYWf61qQIJ2Cg4=;
        b=vyZ35pybXFRQhv0ef3GFQc0543YO0tQgALHVlg/kJuwo96TZ8xPIAzbAal8b93lpyc
         eXk6TPQSVcBjjU+zs9a0BWF50AauODTc0kcIXCUS6AmwMLDjPikCZo/GiQ1moZR62e8s
         3Wv761THS5685ABX+Z1YLcdAZZyd2sPp5qFaHvczGDIcTI++/0T1zLl1f3m2wVdVe+eS
         0SjdUYrdA7tlHqwkhJ+nZOMZspYx8QKJXIyApTHfTXnxrsTYKSpowGqRQt1UYPIqh4wJ
         EDxODtYK4L40LTv8d1f58L2eGZz5CjAmBzxW94bKhRLi3U2CTL36WcwC4byVBuJuYDzm
         YpIA==
X-Gm-Message-State: APuU4Z8OkU2oopvqAbkUMt8q+osPnbjMkvLg44STEkL7qQPGCns1vt3D
	KrSB0u8oo2oJXI01DEPm8MaZgqD8clA8OlYIj+iB7AZWNgvkJ+c4WWpHMKOhPLCz
X-Gm-Gg: AYBFou2wJ2+NkIHkASeL3BYrRUAkuoesyW9uIooCn4sKR+4F7J12pzmiDwIPQAj+f8G
	apqrnXmYufUpuq1gz7nEJEy2jCuvA8KN9XorKBzhDqIUchPO89MmKlpdQ/tR+2sCN7s7vzxjBq8
	Eo3aG02o/pWwJoneoExD0KVw9HLgsLYwNvYGPj82YAl4ekPnV9xt7u12LJ2hUTuFqNAnwlwMdpX
	Liu+d4Oh3D/4PbgFT/wqLPOhksn66cKq6CKXMzIYxNzyoCNZrTvKMzy6hUuCqpNm4Gm0h4IwxB7
	10UwJv98DGpM87EwctBEtqjLJQJeeoOyLqgF85SkM1F0b+tF74pHgPuuc8PRe47p+/4zbe7/9Jz
	FODLzd8SeBi/uwy9S1doyUXM070PJUN/eNGGIfNDG8jPBkqJodutoa1ontK//OXFmcDkSNwQ6Sr
	529UmzMi9snZXAq/+3y8w9ol57xoZ6sxVX5I3BKJ3n0c64xpr5n1NxgK8C2GK3LLD9QBFWdLIJs
	5fjbZu/FI3GippsoDttwANILNMUtgUR58NBmKrxoVDywLdxGczT/KOm6C/MMJZ/asP8d52dvBUP
	vzOuYQ4PAcJFcAHvA7bggZj7/lG3PGgjYKrVAaFCzv6i0V8=
X-Received: by 2002:a05:6a00:44c5:b0:89e:a122:fa28 with SMTP id d2e1a72fcca58-8a9be589f16mr12906931b3a.12.1793807217910;
        Wed, 04 Nov 2026 07:46:57 -0800 (PST)
Received: from ubuntu24.vpn.host.chaitin.net ([124.77.157.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09b569495sm1176805b3a.37.2026.11.04.07.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:46:57 -0800 (PST)
From: Yuansheng Yang <0xbeac@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org
Subject: [PATCH RESEND] io_uring/rsrc: hold uring_lock across index-alloc put_user
Date: Wed,  4 Nov 2026 23:46:55 +0800
Message-ID: <20261104154655.81876-1-0xbeac@gmail.com>
X-Mailer: git-send-email 2.43.0
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

io_files_update_with_index_alloc() installs a fixed file via
io_fixed_fd_install(), which drops ->uring_lock when the request runs on
io-wq, then put_user()s the allocated slot back to userspace.  If that
faults, the error path calls __io_close_fixed() by slot index after
re-taking the lock.

The slot can be closed and reused between the install and that cleanup:
another fixed CLOSE plus open/accept/pipe/socket, or a FILES_UPDATE, can
put an unrelated file into the same slot.  The error path then removes
that file instead of the one this request installed, ending an unrelated
file's fixed-table reference early.  This is a correctness/DoS issue, not
a use-after-free: fixed-file requests hold an io_rsrc_node reference, so
the node and file stay alive until they are done.

Hold ->uring_lock across __io_fixed_fd_install() and put_user(), and do
the failure cleanup with io_fixed_fd_remove() under the same lock.  This
is the same class as the io_pipe_fixed() fix; faulting while holding
->uring_lock is fine, the registration paths already do it.

Fixes: a7c41b4687f5 ("io_uring: let IORING_OP_FILES_UPDATE support choosing fixed file slots")
Signed-off-by: Yuansheng Yang <0xbeac@gmail.com>
---
Resending with corrected Signed-off-by and without the CVE reference (being invalidated); no code changes.

 io_uring/rsrc.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index e0345c3e76..6c85eb50f0 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -570,13 +570,14 @@ int io_files_update_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 static int io_files_update_with_index_alloc(struct io_kiocb *req,
 					    unsigned int issue_flags)
 {
+	struct io_ring_ctx *ctx = req->ctx;
 	struct io_rsrc_update *up = io_kiocb_to_cmd(req, struct io_rsrc_update);
 	__s32 __user *fds = u64_to_user_ptr(up->arg);
 	unsigned int done;
 	struct file *file;
 	int ret, fd;
 
-	if (!req->ctx->file_table.data.nr)
+	if (!ctx->file_table.data.nr)
 		return -ENXIO;
 
 	for (done = 0; done < up->nr_args; done++) {
@@ -590,15 +591,28 @@ static int io_files_update_with_index_alloc(struct io_kiocb *req,
 			ret = -EBADF;
 			break;
 		}
-		ret = io_fixed_fd_install(req, issue_flags, file,
-					  IORING_FILE_INDEX_ALLOC);
-		if (ret < 0)
+		/*
+		 * io_fixed_fd_install() drops ->uring_lock when running on
+		 * io-wq, leaving a window where the slot can be closed and
+		 * reused before put_user() faults.  Keep the lock and undo
+		 * the install under it.  Faulting under ->uring_lock is fine,
+		 * registration paths already do that.
+		 */
+		io_ring_submit_lock(ctx, issue_flags);
+		ret = __io_fixed_fd_install(ctx, file,
+					    IORING_FILE_INDEX_ALLOC);
+		if (ret < 0) {
+			io_ring_submit_unlock(ctx, issue_flags);
+			fput(file);
 			break;
+		}
 		if (put_user(ret, &fds[done])) {
-			__io_close_fixed(req->ctx, issue_flags, ret);
+			io_fixed_fd_remove(ctx, ret);
+			io_ring_submit_unlock(ctx, issue_flags);
 			ret = -EFAULT;
 			break;
 		}
+		io_ring_submit_unlock(ctx, issue_flags);
 	}
 
 	if (done)
-- 
2.43.0

