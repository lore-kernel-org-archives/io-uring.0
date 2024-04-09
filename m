Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF2A15359E
	for <io-uring@vger.kernel.org>; Tue,  9 Apr 2024 17:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712684033; cv=none; b=HDj7syossNbmF271pIfyCWEi+PB7Lv3JDaK8HVkety4CEVvzCKe5pBvocUkiu4SrvYSRML8O345y8X94gbJ+V+mou1Y3IsHhanpSS0p/j4H3NGBpXDtsR8ZwDpEtsBdiVMgU81yboPuFwOwYRPtvXaJYDW7yI8btOq93xuNH77Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712684033; c=relaxed/simple;
	bh=pcgPeauBhLGjwfJLxUR52iAtisD/biC3MAJKIqBm6Z4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cogujs3lWOo9EhggRmO/IHAyQIQP+AFqO4+QNH6yWe7wL1/G+F9mtc8cF5KPUFdbqSEChsgpa47lgoNytUmQWlL6IqdYd5kpmx5T9ibUsn/V4gvj4lt2pEnW4FqGoczNjHIPv1xUqDwM4/Upwv7AGcOjO3Dw8os7Viefwz+VQwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=E0hRYo3M; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="E0hRYo3M"
X-Virus-Scanned: SPAM Filter at disroot.org
From: Arthur Williams <taaparthur@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1712683660; bh=pcgPeauBhLGjwfJLxUR52iAtisD/biC3MAJKIqBm6Z4=;
	h=From:To:Cc:Subject:Date;
	b=E0hRYo3M1Y+qUU1P1LymEnB17GukZxc/D+ji8YSOxEu7CVUL4N8mMvacZsftpeKKL
	 Nhj7e/Opd7pU7yvYg1hzS/++TO9dFa6CbzIUggyE8tbxDBUpLCgzU5Bu1wKtOL82lp
	 4tTQrtwABB/58BsSTDVIoEnbpTxSH8OaPpMF3y0BD68RN6BcJ8abJVZe+ecTojEors
	 ZjlTt2cj7cbcBZADIbtgyrQWPY7UxYlpq/+enjRhDsMZ37P6p1XWhBqzdCXXCPLnZw
	 rp+4Utpkjn+sNaDcYwwozjp9qZqc3zMLmW54TzP2g45n5gw0tkRyAm91wuc/RVtoX2
	 ktqqVBfvcqD9Q==
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Arthur Williams <taaparthur@disroot.org>
Subject: [PATCH] Fix portability issues in configure script
Date: Tue,  9 Apr 2024 10:27:35 -0700
Message-ID: <20240409172735.1082-1-taaparthur@disroot.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The configure script failed on my setup because of the invalid printf
directive "%" and for use of the unportable "echo -e". These have been
replaced with more portable options.
---
 configure | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 052920d..f6b590b 100755
--- a/configure
+++ b/configure
@@ -519,9 +519,9 @@ print_config "CXX" "$cxx"
 # generate io_uring_version.h
 # Reset MAKEFLAGS
 MAKEFLAGS=
-MAKE_PRINT_VARS="include Makefile.common\nprint-%: ; @echo \$(\$*)\n"
-VERSION_MAJOR=$(env echo -e "$MAKE_PRINT_VARS" | make -s --no-print-directory -f - print-VERSION_MAJOR)
-VERSION_MINOR=$(env echo -e "$MAKE_PRINT_VARS" | make -s --no-print-directory -f - print-VERSION_MINOR)
+MAKE_PRINT_VARS="include Makefile.common\nprint-%%: ; @echo \$(\$*)\n"
+VERSION_MAJOR=$(printf "$MAKE_PRINT_VARS" | make -s --no-print-directory -f - print-VERSION_MAJOR)
+VERSION_MINOR=$(printf "$MAKE_PRINT_VARS" | make -s --no-print-directory -f - print-VERSION_MINOR)
 io_uring_version_h="src/include/liburing/io_uring_version.h"
 cat > $io_uring_version_h << EOF
 /* SPDX-License-Identifier: MIT */
-- 
2.44.0

