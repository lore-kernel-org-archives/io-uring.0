Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793363995;
	b=2R2cVtTsoXv1wR9Zko5bQtU0MEcXvOQcWuofaHbnOkwy8jgZyccCVuw1QowGdjSM3xXG
	 cES6ik8QJwvToYuMVvLr1qEk8seDHtFZoe3aBO72gxcHW+PhqaZGS3pD8eNfmm0zY9h1E
	 q2REjmjW0dw5ePj6JfXd7xuV++scjMYxVbMM2RQ/1OhuIpNdziQiQcZXhQoYbBAsIG0O8
	 7S3tLwoLXSa08dciWIoH4aNIBWzH3pgp22tMEhOSkC27es6zlqYT9hNcM/4UyYhWW0U0s
	 XNoeeYlRxXx/IvOAf+H/6+RVfag7SoTpLf1SJjjzc47fm2HvwkDYlKcpAZoF81LZOFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RUJ2gwwAbHEm4tvJt9u+cB77ZI1OokWfWjFrziXQD/Q=;
	b=CoU5y8d4TlD+eFM7iBlbb2l9EVskfYWx85XdUTTSCSK8OIq1yXeFELggRfWUCa8spazI
	 v7D3nC/IX7es0Z4zDqpq+ShQAhet+Hb9GYd7q/L1JJW1j0MJzEp4Ouw8gbLJt94tEi9Me
	 KCxPyeGgYQDTEahGx5JoTvAXKdwRCotlKy2jh2ldnDeodZZ7Y++d55sglM+1m7TNKVFzM
	 KvnAM3rwcCe6c034G13y/xt1pB/AZm5g7Xh/iUC7nffp5rLcv4udUYzGyLdhOge8RgJt9
	 Bj1H11PlZE5zy3wB7nLoL2N6JodKPTnNyJ0ataObdcOqu+PBrrH3UDeuPk9bsApveMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VBmUMlw3;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE68606A320
	for <io-uring@vger.kernel.org>; Fri, 30 Oct 2026 12:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EE68606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VBmUMlw3
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48df4f540ebso318911f8f.3
        for <io-uring@vger.kernel.org>; Fri, 30 Oct 2026 05:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793363994; x=1793968794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUJ2gwwAbHEm4tvJt9u+cB77ZI1OokWfWjFrziXQD/Q=;
        b=VBmUMlw3mU8MUEBbTwbpv6+rln7SBqQWw9iKzzo52IxbFQrWy26L+p43Rgjv3dhub5
         kdSLHsfKgqh5fSOsJ0D9wVKcWlKC6VLgoBsBGzS/1hX1J97+sL9Muj6w5xH8aVY1rRpV
         I+cwq7G9YMs34Rd8B2iXC1dPPNmNe6R/eUwM10gQYfQyNmeeJco9jZxreJb8RvdGhGYx
         opBrYf4zguM5zf7ybrpi32vAGijEMVBHRtYNKupIWA7YVWrffvmo5k2ORHlcyaq8B4Io
         ex9hJPVPvNRiIG338pJu8QZjLl7pYV+Ln/aiiBWrUhcljhBKIbqu5415DSajDUeZj9l9
         C2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793363994; x=1793968794;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RUJ2gwwAbHEm4tvJt9u+cB77ZI1OokWfWjFrziXQD/Q=;
        b=PTeO+IUjWa1PmmN4kLzZAnY2gv8R1iyeNE8YnVVoGS0WQ+nNoxwzZfvogdDGatoXDX
         Ubtsm0AvUIHGUzSGwf7aW0ujHTx8ZVNu21kvVeP6pFzL7NLS4Eam424JjGIDsVdaNxrx
         /ZzX7svTd2igja912eFA55Vv+OqmmvQCVVBR1Re+ZHwpMcVsmavl3bpWkJqmR4uvDs/0
         jaJUundzXkVs85Q13RgE3tJineKI4vb485imYixpYo8CZYTHMzYG7IzLryo1DQ814U0k
         DWv9HGIMcRjucHKbUqd8x7kuZ4SlHd25LfoPnrEeSmnivBf/uFN6LdHqwTyTjubNx4Zx
         jhEQ==
X-Forwarded-Encrypted: i=1; AKwUvByL04yVTHaOxPtWzZWA2BUWMkbkq45M+2tSufIfBE5Ky0atb8rdV99+2queFjOpxzOEdRdsUy4Cgg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLKP8l0ieieP9bKzzeQpuymhg4LCqd27TQLvTZ9hsudK1Nu3mF0
	AkuBVHB3qoOqRlulN+3eohNptM/x+cmzAfJmdoN5VehjTux3XhcN0G3o
X-Gm-Gg: AYBFou3ci2Ajenmqp+EnJk7WSpwfGEQ1w+NPqNsbMybttMNPnD+Pv89GQmkdshXFR+4
	0f2FH3/C4naSXkcq+zPz0qXtPP0SLODZEn+d8bQYJthCbTu1eYDzTg5GkbrUISkRgCTqH6wDGXW
	oyYdQcLs5M2BEtp0bb9GD1So0l/lXANu+5hqSTP4RtHiuTk5B5XZkGjnRrDyvO+VHrKb7tiPGHe
	pOkT6VONEEwU2UqvLtY5tuHUybxqx3unNX6SX6iKJ7yDt9/S0uRTwP9ZG+2g7xNSPr5L8iGuTR2
	6hiuqkEwHQuxbpgq+Yc1x1GypbYkAePTHEt+KZAcR5mYScuKPcFRuFNp838NdeK939OpQ59tyge
	PN7qqR0KEQg+88Q+HRvWSpj7CTSLsnMZ8EGkd2Dkfor+9LAI6IUbHWLoxkH9wAdtB2Q4idBShZ+
	DETfHHjpvSl9HaIy6WP/6L6Tpc8vTSqJ45WYYw3NisKskIycsiN67KRz/qU/gh+JB60/OHO+Tor
	pwWVGNZ7OyiXpPj8SQmQScjmpq+Vz8VJ0XNaYRTfGmNzsC+lpFUd0jk7Y9wGoh3aWNAXsfdSe08
	jtDUJkvzQO4G1gec4EfNogRIGqj+wqlGBzS/OkBsGhBzZ0pkrE4uE6t7YOENjE8ChKmPNqscHDC
	he2MW6/uf8LVd+dAXZNEC
X-Received: by 2002:a05:6000:24c5:b0:48e:d7c:4bc8 with SMTP id ffacd0b85a97d-48e6e2bdddbmr5939049f8f.7.1793363993170;
        Fri, 30 Oct 2026 05:39:53 -0700 (PDT)
Received: from meven-thinkpad.home (2a01cb088745e00090de407b41070a01.ipv6.abo.wanadoo.fr. [2a01:cb08:8745:e000:90de:407b:4107:a01])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm3088971f8f.23.2026.10.30.05.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:39:52 -0700 (PDT)
From: "=?UTF-8?q?M=C3=A9ven=20Car?=" <meven29@gmail.com>
X-Google-Original-From: =?UTF-8?q?M=C3=A9ven=20Car?= <meven@kde.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	io-uring@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/3] io_uring: add IORING_OP_UTIMENSAT
Date: Fri, 30 Oct 2026 13:39:42 +0100
Message-ID: <20261030123945.1704118-1-meven@kde.org>
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

Testing: a userspace test of 28 cases (paths, AT_EMPTY_PATH on O_PATH
fds, NULL path, UTIME_OMIT, permission and read-only errors, links, copy
at submission, inline on tmpfs and punt on ramfs) passes in a qemu
guest, on v7.2.3 and on for-7.4/io_uring. A liburing helper, test and
man page will follow if the interface is acceptable.

[1] https://lore.kernel.org/io-uring/e291085644e14b3eb4d1c3995098bf4e@huawei.com/

Méven Car (3):
  fs: add filename_utimensat()
  io_uring: add support for utimensat
  io_uring: set times inline when the filesystem cannot sleep

 fs/internal.h                 |   3 +
 fs/namespace.c                |  20 +++++++
 fs/utimes.c                   |  56 ++++++++++++++----
 include/linux/fs.h            |   1 +
 include/uapi/linux/io_uring.h |   2 +
 io_uring/fs.c                 | 105 ++++++++++++++++++++++++++++++++++
 io_uring/fs.h                 |   4 ++
 io_uring/opdef.c              |   8 +++
 mm/shmem.c                    |   3 +-
 9 files changed, 191 insertions(+), 11 deletions(-)


base-commit: ecb6817b769fd7d71af2c9f446188649020b2e53
-- 
2.56.0

