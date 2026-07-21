Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9563C1402
	for <io-uring@vger.kernel.org>; Tue, 21 Jul 2026 08:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784624124; cv=none; b=nvjVDVJTiNdx00N2TF6dgDV02e0pAEewDDx5WwBU53Qc+vCzB1Oy4fV7fRV7x/bvQhHW0gdRVxfkO1+Uy79ODHjFtYmwGl6EJu5dvi7vF0s9g0+GfgOmHr4/Aq/X0NeIt7T8814iLoOXIBjPw+b8jOtU7UnZpc2/+bQbAB7OiRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784624124; c=relaxed/simple;
	bh=9v45zTVeTCX7fIaTjQSky2XyjxWftJs8YLfqZCwJ++k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bvwtw9SrbO6vqcJQV8OM82Oz3Hbw0vbWv35lLYLDM4t9OV23Olo2SJ4opaXGgiWkT23/MsBDeezT/pEcoWwaP8SETYt8j+BLLkEHG6wE0iIX8lqQBtce9rSsGhAglnsOf1kaAmrd6ROSoGdqLd92mX0hJOdvrC4yeBbTTjN5vgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKqY95Ei; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKqY95Ei"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso7262026a12.1
        for <io-uring@vger.kernel.org>; Tue, 21 Jul 2026 01:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784624121; x=1785228921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DvFeyjLJ8AJSuF4p/D9KBNAj9grUIgBOggYUeLP/dVM=;
        b=gKqY95EiR6hjrSnIVln9pht6Gh9eQF1Q3vnjxSPMY64eXN1mAHIy9xrv/8VEWDs6bQ
         aMyZYoRuJW6aUjCpfF2BFNnHO1KqRZOV2yAhWLoa6SQ3pj9bUMemkGi7z6qrpftw9cPE
         mTGbfitG9kO/ecCWZ3Loeqm6M+LD6GKBiaGgyHRvG5xePYQ4yI7IoMHDJVpFmns2F1QE
         p24ICSBM1FIFCVOxVp2E+nUik9XnrBVVLwJ8SRX3cbV1muRFV/YdNCpTU9SQqSffxCfk
         jl7nq1i0x8u06B8A0HzapnV2o97C1GIurSeyGrXH/c3BO+Cj0eMq1RhtdOzj1pr3eI/S
         E+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784624121; x=1785228921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DvFeyjLJ8AJSuF4p/D9KBNAj9grUIgBOggYUeLP/dVM=;
        b=G6EkTyUDGY+baD+glOJf/LFT/pQq2z9aWPfp2LMdprmkV4Uy/hCboEWR8TZc58wPeD
         GY3iMGaZzMJT15g+MKXYmjjj71bo3//u++JsVNpNwsvOKzvyNrB04/91f677Qb0yJy42
         yYOD6nqjxb5r0M7jfLKSyYWYwzerw+aVMCkmVSNiuJ68VMkVFlmS3ElN5eh9C809kOZx
         Gopqey4YBRxl/kW9e36M5jIjuhsTWFPXy3TkVE93MAaWlEa3/6UIO/Wk1DWcCzFZjTie
         OaMNhPLKfxBhwG3Tuz0ApYqqW2Qu10G8buHIU/IWmigQqEyvQ+gRWOWyvSOSoIGAvKgW
         sIig==
X-Forwarded-Encrypted: i=1; AHgh+RqEpfZeqKlFLNlZDaBrxkcxELwbQNRKIQxwy+UIR0d1hLqfJmBOOPdtAPPBgEsvYwBblTtLJ6+9SQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMUndjQcbsVn4vbh/MWV7HD9wttabXRDCGsl121OzrphDznCen
	fUMxG4aOYx+Ex26NJg913sWUfE16rEsMp1HF1XZNEM312/G7q2pLZjnM
X-Gm-Gg: AfdE7clzZEoC7HcnFdJGEahxvgR8NTR4zfLlmznp8nunw3xrd1BqERK4gsOtQBHGNIV
	0NpKOz70HiIG8PfeJfm9seYv7Ny9hYUhFMYm/JyUGrSYs9WNQdLF3NbxQZbRtBbo0ESQt2cOyzG
	M5pXZVXsMTYaQEdgJvWxCTGlME2uQbv3+HnDiekhUQHlXry0fNHMZRfGPi8Up3nvB3u2AxU4wqt
	QpZlYvlU0LWE6d7oLWMJUXGIAvH9+kqEdJQeUK6eccDZn348tdKfHneOPhz0Pwmso/6Jky6D5my
	sfXqV0YJNvfBud3fyO9z/WvVZLxTWJxfumFzVSOQFWCokVSMCeHJ/B6slBidxj0j/Ro8ZjO8MsT
	Pth+72EP1mQ2D7WDh0HNQnT3O9pmXANlsJt3V0ElnOMfJacwOZG53F1ogtH/E2Wf6xcXhRAFxdH
	ucvW55ozZIRC3e7EERpoIhuZ3LIL+h2Zr0J0TsWqkPHfkJXwIEyhqGJNLLNmu9xS6MTp+1+zhIQ
	KmfVadM2cMFkfTiRKXSZijOJD56iRMWUBibsULmyHoNNV2HHesKN0XYVdmoSZ3NW0fvBHmVKEj7
	0SJ0H9SkJA==
X-Received: by 2002:a05:6a21:4c0e:b0:3c3:89cf:f43 with SMTP id adf61e73a8af0-3c3ad7aa401mr18624035637.30.1784624120976;
        Tue, 21 Jul 2026 01:55:20 -0700 (PDT)
Received: from cs-1047136853211-default.asia-southeast1-b.c.z168d0f9edf9bc766-tp.internal (8.99.126.34.bc.googleusercontent.com. [34.126.99.8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429cf22b3sm45463137eec.0.2026.07.21.01.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:55:20 -0700 (PDT)
From: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Jan Kara <jack@suse.cz>,
	io-uring@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
Subject: [PATCH v2 0/2] io_uring: add fremovexattr and flistxattr support
Date: Tue, 21 Jul 2026 08:54:56 +0000
Message-ID: <20260721085458.2716-1-aditya.ansh182@gmail.com>
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

This allows asynchronous xattr removal and listing. Support is restricted
to FD-based operations on registered files to avoid path lookup overhead.

Corresponding test suite modifications have been integrated into the
official liburing test suite (test/xattr.c) and verified to pass
successfully. A corresponding liburing patch implementing these prep
helpers, sanitizers, and test cases is following this kernel series.

- Patch 1 makes the necessary VFS-layer list/remove helpers non-static
  and declares them in fs/internal.h.
- Patch 2 implements the io_uring operational support (opcodes, opdefs,
  preparation, and issue handlers) and invokes these exposed helpers.

Changes since v1:
- Omit path-based opcodes to prioritize optimal FD-based variants.
- Limit exported VFS helpers to only file_listxattr and file_removexattr.
- Rewrite standalone test program into a standard liburing testcase.

Aditya Prakash Srivastava (2):
  fs: make file_listxattr and file_removexattr helpers non-static
  io_uring: add fremovexattr and flistxattr support

 fs/internal.h                       |  2 +
 fs/xattr.c                          | 10 ++--
 include/uapi/linux/io_uring.h       |  2 +
 io_uring/opdef.c                    | 18 +++++++
 io_uring/xattr.c                    | 74 +++++++++++++++++++++++++++++
 io_uring/xattr.h                    |  6 +++
 tools/include/uapi/linux/io_uring.h | 13 +++++
 7 files changed, 119 insertions(+), 6 deletions(-)

-- 
2.47.3
