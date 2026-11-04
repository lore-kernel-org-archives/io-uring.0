Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790382;
	b=aua0n8dtS2bUfagUfP2e9VgMab6mFt83+nk6YA04kz5uH4K7PNzuCh9n4GYWyrkSKdww
	 +9E8gadVJ/zuqwKtR0ZNr3EW6FZTVQliESpyzKEo6qTQ0gzmiiAQTfXF5dry21iY88ocU
	 YTbOTIBY9y3Jd4KcEPLAZHHckgtO/UHAkvJR660vUqQyEKo86Dkf/KqHs/QM58lVQXoi7
	 jQAOpbTL1SB+8xENxvVx5EYBs7KoWbsuey0cCgmcYaBU9tF+uTI/ctuENGL9jf1+53ehC
	 Xujg1d+AifX/ytkDtbpYsTu6ek4H3FTRZrqOU/lx3sYRguJ11XL+FVuDqX64sWqVl3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=8O/Rp6nZ3ve9lS3n1SP2Ck1e4kzh3avxuWTAnkwjO20=;
	b=fJGGqvasawQGFbOk+U22UjBFHB11/psgniuPxTZjQFuXXKJplWb3iEasMHOVtQ8Iw/mE
	 YNmOuTsH80i0FbRqvLotUJEearEOj9/Wif/iv+kWyIUU/VY2ioKax+awwCz18jSc2ryYi
	 0k1sIV6NnFkDpogpnfELWmdemIOITQ2IIgmiAYq3bCBu7pwiNYukCa7tQgs6k7Pejh0zC
	 qvIkHQfF2FxG/bCb7q0W/bWW+yzM+ZYA4oOlBRNSJ0axCzW20DjNxUOKWZ8zloXxMdWHA
	 WH7wVwiRWQ1ZzeDdfItPGGSvET53IyzcrVJ51jYDiHzb8o3as3c+IvNj8dAJDRLLQig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HbI5RPYr;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEFB606A326
	for <io-uring@vger.kernel.org>; Wed,  4 Nov 2026 11:06:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFEFB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HbI5RPYr
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so5221795e9.1
        for <io-uring@vger.kernel.org>; Wed, 04 Nov 2026 03:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793790380; x=1794395180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8O/Rp6nZ3ve9lS3n1SP2Ck1e4kzh3avxuWTAnkwjO20=;
        b=HbI5RPYr3Kbf90K5fXNLch2gUb1ZACwF0DopzeNBvr22vJ87RY3KJeL3+v29YDTif/
         8/SeIX0e6qx22sByKeBWaB1CWteitCzg6enalhKr8gRd8q5Pqeu1ipKGCImvaEuqHPVz
         gkGJaJFEt23ldDtnBnkIp4RDBmICL52SVgBUo16NSrICBSLKmnbgrIVU8ne823/SefQL
         4a6cMCbpN/COj1EkiWEdIpVpqmUrH9VJ07WZZAXXMLMFa8aNVoyKPGnKAVaokFhXB4Xd
         q73U+pDHznGSDg/619CVFSM+MDphgpTxlc7Ccwdt53FJUbNDH6hd/lEwLoTtwKXA80bu
         33eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793790380; x=1794395180;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8O/Rp6nZ3ve9lS3n1SP2Ck1e4kzh3avxuWTAnkwjO20=;
        b=ebEzpQJECU2FRyAtpBdPRW6oinC3o3cyw5QFRspuAjVTivTX+oa4hZ5k+7XLZvAOc8
         R6/nitFNhJ2xnH5ddUurx+QGUUcPbL6YN6NYGZK+YbTtaXce3qQqGBGFxHTBoGA76n+m
         SXwdvrGVQYVRdUEaaHF9fp0oItYHKccwc+FjjGbG6w5Fh6JtCiHqXWKkJnQ8QMBxFYc5
         mSyi2ePTJUrsdl524qE7LXk+6qziUN6uAw/Lk3kUKB9R3VEhp+x1s0MkgKxqbBgFqqhP
         OCaIE47h+yzIl8IdEEozEnfFrki2I/txpMkrSfUr8ckNySE1c8ScgMZJ+QMh76jcdOVp
         bV3g==
X-Gm-Message-State: APuU4Z+13SsSya3oukXixwLi9t1EGtwC2LCqoy+YDUf++ftygeuRfWGZ
	SJDe79KmXdNleO5thBuOuwKxsozX7FURTuH+/ZtUJSJkUWUzCX4W3Opj
X-Gm-Gg: AYBFou10L9IIeLP9cJ/8JAVUfiZ5cRHKkyn3k/KdFGtcRHKXmuQn0+01SBABnKDdtpa
	o3OqJZ3YbO0EkJPm6PaB8RY1UoTldBv5TE4T58r44r9GkDLk/5ijEZLMS2gowUVQvdj0ibQy5uy
	wGX5ZoGXkBGqbyuiRb45eCdQyZkfifCms4cs1w4Bqz7pFoY9DYlW/NibWPqfjMUDkKxPGAbjGnT
	TdPVBJl+AAmdMysEXSeHegfLojoZIIrtfnEk/bnzNpVb6iS89pFfWaEyoIThe39OlFt6gVuLLV1
	mgYIZBajF/uvNhZeIYG7NrEnmrYaMNQ7N/vdcmhVhIo2CqZU9a71kviIgfK1pjpC7VYceUoyena
	Alv2Pe0gaAkbACQTQFtKDkOrR+/M/9P4BZTMAFTDoHGcsuDNE5Vlp0XuD3035vHF+7a/0oZX/Y8
	MMCCsIjBT6oZXyqRfUV1fEMKk/u8xtsNepd5wIO8/b711WXspadrJ6nD5/+yBOLUQSdXdNcO2SY
	ZKTL9k83NU7CTwzIONYSQToezj44Jsjqhe5eI1JadU5/QOJsU+A7KvYnGX/ZMnBS2hRzmg35KG1
	HLHHhAULm40jaNRekFjhT5ffc/1qpV2XxM81DL6/pG/tvHn3herR7X0ddWkWXllhpyrT9ZCUBQq
	JDaz1MJvJJG8SmwKzXNIEN/Rg
X-Received: by 2002:a05:600c:6387:b0:4a2:150f:1605 with SMTP id 5b1f17b1804b1-4ac1904a81amr368417625e9.24.1793790380090;
        Wed, 04 Nov 2026 03:06:20 -0800 (PST)
Received: from meven-thinkpad.home (2a01cb088745e00090de407b41070a01.ipv6.abo.wanadoo.fr. [2a01:cb08:8745:e000:90de:407b:4107:a01])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm3704835f8f.45.2026.11.04.03.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:06:19 -0800 (PST)
From: =?UTF-8?q?M=C3=A9ven=20Car?= <meven29@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?M=C3=A9ven=20Car?= <meven@kde.org>
Subject: [RFC PATCH v2 0/3] io_uring: add IORING_OP_UTIMENSAT
Date: Wed,  4 Nov 2026 12:06:01 +0100
Message-ID: <20261104110604.126717-1-meven29@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Méven Car <meven@kde.org>

A file manager or cp -p that copies many files sets the times of every
copy after its last write. KDE's KIO does not use io_uring yet, but
could in the future. In a KIO prototype that copies batches of small
files through io_uring, open, create, read and write run in the ring,
but the metadata of each copy is set outside the ring, with futimens()
and, when needed, fchmod() and fchown(). On NFS and SMB each of these
calls is a round trip to the server.

In that prototype, setting the metadata from a pool of 16 threads
instead of one file at a time cut the copy of 200 files of 4 KiB by 22%
on NFS and 45% on SMB. The test copied from ext4 to an NFS 4.2 and an
SMB mount of the same machine, over loopback with a netem delay of 2 ms
each way. An opcode would give the same parallelism from the ring, and
would let a copy be one linked chain per file: WRITE, UTIMENSAT, CLOSE.

Patch 1 splits filename_utimensat() out of do_utimes_path(), so that
io_uring can pass a name imported at submission time, as it does for
mkdirat and the other path ops.

Patch 2 adds IORING_OP_UTIMENSAT with the semantics of utimensat(2).
Like the other path ops it runs from io-wq.

Patch 3 is the RFC part. On a local filesystem the handoff to io-wq
costs more than the setattr: in a qemu guest on v7.2.3, setting the
times of 2000 files on tmpfs took 6-8 ms with utimensat(2) and 19-29 ms
through the ring with patch 2 alone, 32 requests per submit. The patch
tries the request inline with LOOKUP_CACHED and trylocks, on filesystems
that declare FS_SETATTR_TIMES_NOWAIT, which only tmpfs sets. The ring
then matches the syscall (6.4-6.8 ms). ext4, xfs and btrfs cannot set
the flag, because their ->setattr() starts a journal transaction. Is a
per-filesystem flag acceptable here, or would you rather keep patch 2
alone?

IORING_OP_FCHMOD was proposed in 2024 [1] and not merged. The same
questions apply to fchmod and fchown, which a copy also needs, and a
single setattr opcode could set the mode, owner and times in one
->setattr() call. I started with the times because a copy always sets
them.

Testing: a userspace test of 30 cases (paths, AT_EMPTY_PATH on O_PATH
fds, NULL path, UTIME_OMIT, permission and read-only errors, links, copy
at submission, inline on tmpfs and punt on ramfs) passes in a qemu
guest on for-7.4/io_uring. v1 also passed on v7.2.3. A liburing helper,
test and man page will follow if the interface is acceptable.

[1] https://lore.kernel.org/io-uring/e291085644e14b3eb4d1c3995098bf4e@huawei.com/

Changes in v2:
- A NULL path now sets the times through the fd itself, like
  do_utimes_fd(), instead of a lookup of an empty name. As with
  utimensat(2), it takes no flags (-EINVAL), an O_PATH fd gives -EBADF,
  and an open file that was unlinked needs no revalidation. (Sashiko)
- Patch 3: the nowait attempt passes no delegated_inode to
  notify_change(), so a delegation gives -EWOULDBLOCK. v1 read di_inode,
  which does not build with CONFIG_FILE_LOCKING=n. (Sashiko)
- Patch 2 message: drop the wrong claim that AT_EMPTY_PATH on an O_PATH
  fd differs from the syscall.
- Not changed: the inline lookup can still call ->d_weak_revalidate()
  and audit_inode() before __vfs_utimes() returns -EAGAIN for a
  filesystem without FS_SETATTR_TIMES_NOWAIT. IORING_OP_OPENAT does the
  same lookup inline, but rarely fails after it, while here every
  request on ext4, xfs or btrfs looks the path up twice. (Sashiko)

v1: https://lore.kernel.org/io-uring/20261030123945.1704118-1-meven@kde.org/

Méven Car (3):
  fs: add filename_utimensat()
  io_uring: add support for utimensat
  io_uring: set times inline when the filesystem cannot sleep

 fs/internal.h                 |   5 ++
 fs/namespace.c                |  20 +++++++
 fs/utimes.c                   |  53 +++++++++++++----
 include/linux/fs.h            |   1 +
 include/uapi/linux/io_uring.h |   2 +
 io_uring/fs.c                 | 103 ++++++++++++++++++++++++++++++++++
 io_uring/fs.h                 |   4 ++
 io_uring/opdef.c              |   8 +++
 mm/shmem.c                    |   3 +-
 9 files changed, 187 insertions(+), 12 deletions(-)


base-commit: ecb6817b769fd7d71af2c9f446188649020b2e53
-- 
2.56.0

