Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F202F7F01
	for <io-uring@vger.kernel.org>; Fri, 18 Sep 2026 09:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722058; cv=none; b=XhkeRAke7xMtlIBG3Z19ej/USYO2J69VgXY7Qm7krP2urAiPV5/sF64tF9tOn8roXm1jhIn5K2pRLjc/4g4eOfJ7r4jmHbMpjS3jJO/1DoNburfgQv/6GuBth+zr5wgGNlzu2fctb90l8PxT4r7FFOp9OxUxaN4fV2bIj6bsn7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722058; c=relaxed/simple;
	bh=m4ZbhDJfV7md//ofsICU2QzhHI6k8KTOEZrwq/uln6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hsIW5TwkGisQgm23BygfRrl/lhsAUehf9q51adO/WukGqqh8o82vP6UCZaE8+nbYWqll9oHgq3EtniWo7PFWMsurfo6VGPBQgK3cElfmc6J2cK0d5+M0g9eOjM1uedRXsJXyUd84dCaFFU8dNpWEjF9LLdksfrMft+FqZ/vyRX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGOUtPAy; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGOUtPAy"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-86b90133ae8so358609b3a.1
        for <io-uring@vger.kernel.org>; Fri, 18 Sep 2026 02:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789722056; x=1790326856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2mNPvRwIoYtv1U+zE4RruJ91hXpp045j5mrIpQ+qMH4=;
        b=bGOUtPAy5/q+HGtPN53C53D1sNJqfHaM38CaEKc7/l8rYTuGtv0uNTHb0x4KWG2DKE
         kTiZKEpmZFpx47jAPGkW3Mg9LU/Pgu7lFZQ9/jLhHQKhbgRTtaQreoUPtN2hzjmcurXd
         D98BeJkq5xwmt0LINEeMclsjZDir9eB6cB1hPp/eYcu0A+OS/ElsM9w+x5CWJ6FMM44m
         5P02ueRlltMNf++5gJrPNCwGa98SEldZ1M+hwtk3siYWEh7pvKMbXAVe2McSrfhlAQ2Y
         7W5Ld+NrKd2MY2nln50spZcyDs/IWWvN853dAj/N7kQBp9A7IJFiv4Ipp9e4IlocrdrY
         J1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789722056; x=1790326856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2mNPvRwIoYtv1U+zE4RruJ91hXpp045j5mrIpQ+qMH4=;
        b=A8wXXrIxR/x9R+EI6Qc6lHE1iYS3VLqs0vGOjatRv/sBqRC7aE81ggxkChr5XI3Xvv
         gNOfDz+H2ZE/+wFUD9kNgr1hSizhXZC61+RxFtDV/1kki89OuWvyfCPc/BJ4gzpWcXv2
         jqsbnnEzYqNjvjRd7FVg4JORt6Ms3LaNsiNa+hxqjBpLUwTjS6XkiQA523qmWZeT+7ha
         0ZhCuneS7C8VdjiYhhQqNUGmjbiJdPBt/8xN2v2ukTQFz8WydEXXoTRcZ5zfni7PdYAq
         3GHZ2OX2kNDqfo8mBkyABEN3QMXlU8v/PfP1wpUHAkzwN+O5YJqhq+IoxquXq4m/o9ho
         UzUQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/i8ArMbLMfToP9dM17xtlLgXUshcijTZ4enSxG6jT16UYKmXp0gIz4NL/XWfoE0nLzNoBtgN1Ng==@vger.kernel.org
X-Gm-Message-State: AFuF++k48VzFmOtqOjLl9PuSc5ZVYgJPWzHfFuhtAjgbrvR1qJOkcv24
	O3oHiJ8ESN+UIkV6UzQx7KuA9GkSncFydiW4kEn5Eh7yvJ3NpQatZeV+
X-Gm-Gg: AYBFou0HR5yvzEjB7QZLomTzFf2rqFqvjbsd1MT4YdQ+GDJLNnuMD3JTvrWUVCiRGkY
	AaMqwtwb/lReqLRc6IxkT0UgvgHd+9fCLmuFbmD343eOLUMy7YlSIkvgR6NOvnZD0CUm58hgFUq
	E3ORmoS/9qKM8cg6V5NArD+vgggK+usm+8GVtq5PZxImVVSmKqTwHCVDNoNR2cDU8sTcLIpLyNb
	d2GGgWegeoFS7mjuWua7udSpr6UiCwxucSZHHkk5TdiInyuNpNwuYt2nxiOXxrLgMNkJn0zZYmp
	NbQWVVwg/eapLCOqaBVAtM02wpdcHpm7yuKwftDJYIj3U1dRbM8wT12a+xyclHsZYrEtabaMsh6
	YkH18A79CYeufLuuiMFmxfgHy023u6s5yjoClqU8AiHrlKDbkR8yQfxaIu0w+uyrBjMhmNF0WVI
	VOyGpyK8Egi07YZ/fm94jqO4/wa/Ja/Y0v7hSv1Vn1p27+x+WPZExpTEb9JsCuSxEx4eK/U161P
	JEfQUnOXc+RusmaUTEBN6oBMpKx46OP8rznTPHZExkYkilkOUug6lgSWEHBuD8L99eZkvGad5wZ
	8vNtpJJSYsqWt0df1v7apoxkjRruamBgUgjwHKZSTOl03HFIeHxFJW4FSkCdt6w8Vsgo4m4bCdU
	s0FRdDQ==
X-Received: by 2002:a05:6a00:3a20:b0:845:e440:d0ca with SMTP id d2e1a72fcca58-874db6f70aamr3110164b3a.8.1789722055106;
        Fri, 18 Sep 2026 02:00:55 -0700 (PDT)
Received: from cs-1047136853211-default.asia-southeast1-a.c.t54fbfa9bf0658dcb-tp.internal (96.177.21.34.bc.googleusercontent.com. [34.21.177.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-875dc8fa40fsm504491b3a.15.2026.09.18.02.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:00:54 -0700 (PDT)
From: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Christian Brauner <brauner@kernel.org>,
	Gabriel Krisman Bertazi <krisman@suse.de>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	io-uring@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
Subject: [PATCH v4 0/3] io_uring: add fremovexattr and flistxattr support
Date: Fri, 18 Sep 2026 09:00:07 +0000
Message-ID: <20260918090010.1688-1-aditya.ansh182@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series completes io_uring's FD-based xattr operations by adding
support for:
- IORING_OP_FREMOVEXATTR
- IORING_OP_FLISTXATTR

This allows asynchronous xattr removal and listing.

New test cases have been added to the liburing test suite
(test/xattr.c) and verified to pass. A separate userspace patch
implementing the matching prep helpers, sanitizers, and test cases
has been updated and submitted in parallel.

- Patch 1 syncs the tools/ directory's io_uring.h UAPI header to
  align it with kernel mainline prior to introducing the new opcodes.
- Patch 2 makes the necessary VFS-layer list/remove helpers
  non-static and declares them in fs/internal.h.
- Patch 3 implements the io_uring operational support (opcodes,
  opdefs, preparation, and issue handlers) and invokes these helpers.

Changes since v3:
- Split the tools/ UAPI header sync of pre-existing mainline opcodes
  into a separate precursor patch (Patch 1) (Suggested by Gabriel).
- Robustify io_fremovexattr_prep by initializing kname and kvalue
  to NULL to avoid potential garbage-pointer crashes in the
  io_xattr_cleanup path (Reported by Gabriel).
- Add strict validation to both fremovexattr and flistxattr to
  zero-check and reject all unused SQE fields (Reported by Gabriel).
- Reset ix->ctx.kname to NULL on error inside io_fremovexattr_prep.

Changes since v2:
- Revert unnecessary formatting changes to filename_listxattr in
  Patch 1 (now Patch 2).

Changes since v1:
- Omit path-based opcodes to prioritize optimal FD-based variants.
- Limit exported VFS helpers to only file_listxattr and
  file_removexattr.
- Rewrite standalone test program into a standard liburing testcase.

Aditya Prakash Srivastava (3):
  tools: sync io_uring.h UAPI header
  fs: make file_listxattr and file_removexattr helpers non-static
  io_uring: add fremovexattr and flistxattr support

 fs/internal.h                       |   2 +
 fs/xattr.c                          |   3 +-
 include/uapi/linux/io_uring.h       |   2 +
 io_uring/opdef.c                    |  18 ++
 io_uring/xattr.c                    |  83 +++++++
 io_uring/xattr.h                    |   6 +
 tools/include/uapi/linux/io_uring.h | 342 ++++++++++++++++++++++++++--
 7 files changed, 438 insertions(+), 18 deletions(-)

-- 
2.47.3
