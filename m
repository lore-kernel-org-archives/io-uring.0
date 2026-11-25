Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632290;
	b=tRSTaTv+MHJljWW3JeKky7aHcOPCagYiu7hYf4idQfj14VmJPZzVkB6y9z1wUQh+DfEV
	 E2EEZDLZMepDeI4ZPR2d5XhDMOEF6mpEJ9q3uXrC5Xu/Sr35DwhVtsK5GiCSjnp4LFJOH
	 x5UgwjiNUXldXs97PjEDHETABzPkI+mREXHH8ewV38oIROxpKt/1MRK/Pny3M5hi84ZtA
	 wRdxyrNiV/ltfgD3LAGJ4H01p3yiOo9VCy7TQunVxfJfUzU3oQfSDQdMiaeVF+s9NXJWi
	 ZlP3RNe4M9+OzqJWSV1a6j1cp26EpQh6nyyYRkhtRG4vZ8DOCIJYx2Ys8FNdhINTfpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mG0Knt0WaypnR/5gL11ExkK9xVv6oLaF6VFqEBlF7W0=;
	b=TBzDO98vuV3AtZFs5ik5XIERlXG+yr23lGTPqtgIR1bVP5nwNPv4sL0YGum4aPXuN7cP
	 g4GWqSOvbxSm9fBIbIciusadF+UA16iqtdyBNuvU7292Pk5u3ImRDXWGlgljL7ZgzBjlI
	 IXB2A+/qzdCJSgP6D7uI1B7YkkPrOk84GJabAt/31Glkrhfdmj+Lq0FVMr23u7717Z84W
	 R5rIL1JD0hkYHxB8aV9PvyP0qgbVQmNlMoZbDA5tWxONLm6eaTYvtf4OzVR6+cUnKPmJD
	 VqcesYe84l9eyl68a3QdYbsriGVPwOEtqw5VTVBdUxIG6IYkRJvTGlpOBDWtgW170Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=eV7Wk23X;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E64606A321
	for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 18:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63E64606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=eV7Wk23X
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso3666085eaf.1
        for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 10:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795632289; x=1796237089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mG0Knt0WaypnR/5gL11ExkK9xVv6oLaF6VFqEBlF7W0=;
        b=eV7Wk23XVj3KIWighfLdSNBMuCJq5DJquRvWfOug2PeNMjy+pESCWCPpLmJ5yGi7sr
         k1fklidoIDJjUHToqZ03WLiJP4X8r/tPCsMFqhXGt8o/NgyJ/zSyJVw3Mo1c0Ax9JUys
         /3ZrvEINT4EuXEIQMWT4ZaSBnTJYqJFSax1fU4baDLFaoJxw3tzGmjfjGaxp77RVxyBY
         wsLBQ6IjF7rvvJotksNNnA258zLfRytiwIxaaOUJbiKYlVkOe61fO2qPvOeraepCstdt
         namqw4BHkOKVeX5fHYDC1NMqfL0jNfXLlfUbfnONWF+KoJkUhdufWEWfeg1o6EU77T7u
         pnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632289; x=1796237089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mG0Knt0WaypnR/5gL11ExkK9xVv6oLaF6VFqEBlF7W0=;
        b=zcjegr8GNOILAXVwbAdwjSRh8jwHm4TWUDjR81xBnwwGGMDK2OF7tcW09hd4Jord98
         rqvD1M8TNKNW0m51dolRdrW1kA44g+RXgsz3aBRgl0zvBfVNT4b/qgFJi5mipIpwxY2c
         B7hUopy4Pr3bb2ZbtDthQueO9vhDkMcvWyyjKpWQ2dKHheHNgx5A4k7d1iv4idLxf9td
         5ESlGaMZqbNsfybVtcGhU/4qxxpJ9Bn48nJXtFBNuK1JHKBfsyvt8+3Akkh3qL8hELzw
         Q+cne51aOMZoATuXmQ8XdbZ04NufiTYB8Wt5rLMOu20EPdmnyOI+OfSA/lLr+O4FNhdc
         Pj7A==
X-Gm-Message-State: APuU4Z+kIkjdXmRR6dtr0u2jKOxLkVSas7JDCzng15LTl19TE0yqe7Yq
	1OfbQgNeJ9WvN+myBckw9JG89C7fITkAtr4wFtGC/y57VJZQDfQurdtZ4oFknBn2xSex79TRTSA
	2nYRHbTw=
X-Gm-Gg: AZFdTZdFWo8CbHZdbk2EZbrmaappmsKqeT1LZ6d9rGYwebMRSlkSEhJz8wNPKK/tiTO
	PKEwthBh1oKFd4X/NN70u35iLx4xbqbeJSAJRwCQ/HbxE9oZkrKjZB9eeC+Au3kWoxVkVVLTrn7
	YuKVXQZvdl5TB3NEcNATznS6bHT9ks4hauD08lPrIWLFBbJNWPJDgwJrlXXvAD/5hprrH48r4Zh
	gXCgswiamgJdiJib7K2T7tl0QpmqIsKPEzQPsqFO2jpRGjflSYe4THCXfsA9iec9fMXggfkPfe3
	v+XO0Y6KraBoIza/ZoVfJuv5p9Z1GVS/z1FYlqNF1BhGMlxEbU5VCSq61MzcEj4UT+XxAXqE5Kw
	cGxTt2p3H1LcbfSERlAA9NQv4ZnTgFQfglgC+VCa/QASL9dHX/9zwZd/3CfpHZRCo2kRMpBZWWR
	pkGcNsdPtzlJzb7hWww8eTZsgzLRrvp5WLv1ZwMJsaScqz53ufoWaZUEDU0tqKJNh8UiGzE20yF
	jd8uwZSrtLi37+MTzktkaEwTXyodUC/J01nmqxYxai/kgjN2B7v/vqUxGCDQ3kLni/taKRukLfj
	lYCkPJ7gMOOF+aeluvpXLStXD4/ip2d0M5GjRc93gQgbF1E0gnhXtFsGqRZuKe5l2onwuj6pfgT
	YGY/uOICJDzY1AeFIt/1JfHcBxVsWWmIbFg==
X-Received: by 2002:a05:6820:f028:b0:71b:85a5:c19e with SMTP id 006d021491bc7-71b85a5cb82mr850106eaf.38.1795632289229;
        Wed, 25 Nov 2026 10:44:49 -0800 (PST)
Received: from m5pro ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b37c52ae6sm12332828eaf.0.2026.11.25.10.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:44:48 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: Chris Mason <mason@kernel.org>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 05/10] io_uring/filetable: don't install O_PATH files
Date: Wed, 25 Nov 2026 11:43:14 -0700
Message-ID: <20261125184439.58077-6-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261125184439.58077-1-axboe@kernel.dk>
References: <20261125184439.58077-1-axboe@kernel.dk>
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

From: Chris Mason <mason@kernel.org>

IORING_OP_FADVISE with POSIX_FADV_WILLNEED on a fixed file that was
opened with O_PATH can dereference a NULL pointer in the readahead code
of the filesystem.

The opcode handlers are written like the system calls that they mirror,
which get their file from fdget() and so never see an O_PATH file.
io_uring has to keep that true for req->file. io_file_get_normal() does,
with fget(). io_file_get_fixed() checks nothing, so a fixed file table
must never hold an O_PATH file. The register and update paths take their
files from fget(). But a direct open, IORING_OP_OPENAT or
IORING_OP_OPENAT2 with sqe->file_index set, installs the file that
do_file_open() returns, and io_install_fixed_file() refuses nothing but
io_uring files.

With O_PATH, do_dentry_open() returns before it calls ->open(), so
file->private_data stays NULL. generic_fadvise() has no check of its own
and starts readahead with that file, and fuse_send_readpages(), for one,
dereferences file->private_data.

The fix used here is to refuse O_PATH files in io_install_fixed_file()
as well, so that a direct open gives what an open followed by a register
gives.

A direct open with O_PATH now fails with -EBADF. Until now the slot
could be turned into a descriptor with IORING_OP_FIXED_FD_INSTALL,
passed to another ring with IORING_MSG_SEND_FD, and used with
IORING_OP_FGETXATTR and IORING_OP_FSETXATTR. No program that does so is
known, and a fixed file can't serve as the directory of a lookup.

Fixes: b9445598d8c6 ("io_uring: openat directly into fixed fd table")
Signed-off-by: Chris Mason <mason@kernel.org>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/filetable.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/io_uring/filetable.c b/io_uring/filetable.c
index cb1838c9fc37..f547ab1193b1 100644
--- a/io_uring/filetable.c
+++ b/io_uring/filetable.c
@@ -67,6 +67,9 @@ static int io_install_fixed_file(struct io_ring_ctx *ctx, struct file *file,
 
 	if (io_is_uring_fops(file))
 		return -EBADF;
+	/* Registered files come from fget(), which refuses these too */
+	if (file->f_mode & FMODE_PATH)
+		return -EBADF;
 	if (!ctx->file_table.data.nr)
 		return -ENXIO;
 	if (slot_index >= ctx->file_table.data.nr)
-- 
2.55.0

