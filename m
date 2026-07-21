Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CBC48C40F
	for <io-uring@vger.kernel.org>; Tue, 21 Jul 2026 10:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630137; cv=none; b=FQckClEN4HMF7lcfwy05f6/WStONK9zutDndBx60uZ3Y3cmQfuUw78iAq4sucj6PKt/h5a4lN8VmQSIEgufIPkZCL+fo5kUegrhK2oYcx8Agml5L321TP9ed0Ih2HGmO2Svr0tgczll1s6FMSGbzwfpHA1PaEJXtpN1fGsptOzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630137; c=relaxed/simple;
	bh=dmNg9lAj5Y8tykAu2B+ztBcDmp1PpPWAHKFeqRnrelg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gM/PxYjHTjpFgXkzhvQEt5ab0dKDsrBv6rGaxjkiCc56txYJ4dDhLHDCQQAuhGP+Su8ZJfsKihKewUvvACZkFFdg9MDpAfUTlRrBXrCy+SQywOxuUgjFgYhPgDLbwZrhHGVBX/mnhbmeQ2zdlhXMxFMTxAbcoLxyJwyS+aGsXi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtahaOW7; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtahaOW7"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso7552320a12.2
        for <io-uring@vger.kernel.org>; Tue, 21 Jul 2026 03:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784630134; x=1785234934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5u2ao+Sq2Fj0mcPWhJLeoRnDPXPF0xpJUdkE+3TKpDM=;
        b=BtahaOW7bJciYy5+8cDHBWmF1mQA8Q/yXf82P5YkpIaWofRkF3VgUrhWn5DaXE6TDO
         49vaZk2g9ykxacBn+a2uicIbnAbWBnmnjjKvOgNtz6EPn+k1IOvT2eMjsjyFYdtXG2p9
         1MfUJSwXytapWFS4O4M83ajnTaBY7o1ZWwv1wrJxvCuFAkru2rnhwKFV9R43GDHyim9F
         9T49Nsal5EC5JpIU9B6k+hdX3JNDftiBVqE2agHuEMlkVu0EiRAJnsrMW+TCQ95LSX+V
         TbZA9MFagXsjTPtTeUw05GKGx0rlE0jaT4TqqVpyyt9fU2Qj4X4YsqZbeUklQs6rxhWS
         4MIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784630134; x=1785234934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5u2ao+Sq2Fj0mcPWhJLeoRnDPXPF0xpJUdkE+3TKpDM=;
        b=hEar71UV3hLFKwrwiZRvOGhpgpJq/SkH7gtk5+H0R5LNsziiE6gqsVVchIItEfPLqh
         hNmQmZ0CpR0rYl9IA6Y/m4AkdRXyILfcutaYPhX4GVjGqca41FyjeyQmvmOMMenqTEB0
         kyYOjRhk8+5PAj8Z/2xStfXCFAaKhC4Eh1BSm5BBd4ODs5SBwpwtaI+zNwFv49yWw8yI
         +Ly9Pb/NQgu9IIMFdGjhVylkZAkAW0XUPxeJxBZJ6isX+4lgaO7hss8HxcMZIxrvzqsG
         c4xY6rRH7T7wpIIJZDx1WyriASiwe7HAeTO77IWVWLvM8M1x1O6fqBATiyNWwKeVTXn1
         JcJQ==
X-Forwarded-Encrypted: i=1; AHgh+RrKWno9TGSuLk6JeJmFgIDV9E8wrQIj9ec+tYCWp2JxAVLmbRZJRDd1Kw1QNsYIE8wWvwwAAb8GYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyE29VHVGUl7Idf5+Wu5HhSA/qK1N7KXinGMuwrpFYgRoeN6Pbn
	jBlmdgHCzj/ZykRIP7VyYjYFxCMMarCnkPYu9mpK002OXaCSGoXFleq1
X-Gm-Gg: AfdE7cl3BbmPGGSJahxpzJ0+rkxAy6vYqhPQdUOQj+oxH2OcZg5eyhlxTML06odUdjK
	krt0dmgasN1Iv55edCSt92sDUqqDDbxBqq+HMWB2vZxFITUpjT8RY8VFvNGEQf+pPKazasNC528
	L7QwDaFhFtvYbBkrXZ4TJnNxSOMYvJ9B0PvMz3AW3vqNAViQ2X4wN1Mow47FWMRAe0N1BUV1QWx
	x10TCYxFkdY+ULlSYaYEzsmXK0ztuflTHIC5VZL250+uzUrhNMqttwJP6MdpZnQ7Yih5g1VyGSI
	RCbzP4d6L13xOL1YLbX5DTUzlnzgLFVxdYPeTIi+PDxxNRKn0RLN8V5xzH4E533G0YeHdvxSVPh
	4p5Fb/jfWOeUEgcREODVyG8ZVl4Xml8H6NA1KVGiLCvlDtcpef7dXxjg5q9ZUW+toNVKAHriQrc
	2c2/ormQmkBGpdJ2XtfKuvbCdLhAHeBtqLR+TPwkzfYlpUQM9Kx3oT1CiOdQgNI1WqVwDrZeEJJ
	+LOCYWZYKG9a+lClKlJOzIqHMxViVYILyCgAaghblqNKSIz+p59P6Gsfgwax8dPQpVsRYDg/Y8Z
	yEKi6JhYWScuaLk=
X-Received: by 2002:a05:6a21:114c:b0:3c3:9ed1:2549 with SMTP id adf61e73a8af0-3c3ad95f80fmr18828549637.41.1784630134237;
        Tue, 21 Jul 2026 03:35:34 -0700 (PDT)
Received: from cs-1047136853211-default.asia-southeast1-a.c.z168d0f9edf9bc766-tp.internal (114.107.87.34.bc.googleusercontent.com. [34.87.107.114])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20c158sm49922929eec.29.2026.07.21.03.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:35:33 -0700 (PDT)
From: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Jan Kara <jack@suse.cz>,
	io-uring@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
Subject: [PATCH v3 0/2] io_uring: add fremovexattr and flistxattr support
Date: Tue, 21 Jul 2026 10:35:12 +0000
Message-ID: <20260721103514.2716-1-aditya.ansh182@gmail.com>
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

New test cases have been added to the liburing test suite (test/xattr.c)
and verified to pass. A separate userspace patch implementing the matching
prep helpers, sanitizers, and test cases is submitted in parallel.

- Patch 1 makes the necessary VFS-layer list/remove helpers non-static
  and declares them in fs/internal.h.
- Patch 2 implements the io_uring operational support (opcodes, opdefs,
  preparation, and issue handlers) and invokes these exposed helpers.

Changes since v2:
- Revert unnecessary formatting changes to filename_listxattr in Patch 1.

Changes since v1:
- Omit path-based opcodes to prioritize optimal FD-based variants.
- Limit exported VFS helpers to only file_listxattr and file_removexattr.
- Rewrite standalone test program into a standard liburing testcase.

Aditya Prakash Srivastava (2):
  fs: make file_listxattr and file_removexattr helpers non-static
  io_uring: add fremovexattr and flistxattr support

 fs/internal.h                       |  2 +
 fs/xattr.c                          |  3 +-
 include/uapi/linux/io_uring.h       |  2 +
 io_uring/opdef.c                    | 18 +++++++
 io_uring/xattr.c                    | 74 +++++++++++++++++++++++++++++
 io_uring/xattr.h                    |  6 +++
 tools/include/uapi/linux/io_uring.h | 13 +++++
 7 files changed, 116 insertions(+), 2 deletions(-)

-- 
2.47.3
