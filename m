Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B79A353A7A
	for <io-uring@vger.kernel.org>; Fri, 24 Jul 2026 22:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784933958; cv=none; b=pSfUpyWjVscUdCvtSJjji4m0Vy1MWsbixp3yCL+h56l4jsEzqi/UtgFo7VpMk+qEF9/swdoK0cla0lSw3qDhNhB0xXGpdZjuA/b3BgNLzoyX/2IsqVJBfYICN1ZZ1hyfyN9ennw/KpmKZF/oWMYdUB5iWgJqLalUyoj1wreEHJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784933958; c=relaxed/simple;
	bh=oUO1nxGOIwgL9LSkwU6YTowIw3sXprTQ4ZI9SmuYMTw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KGiwjohrcc2mlDgFiUmYtUNxO5Cxv2wzSt8KACL/woB7Ya9wtmAW+USwXTcz2pMkENpySxUC2ipnTsRPWLl0OihABe96PHlyFQMVnm6Kf+lgeVF1uMK3nygQ7WZkNxUHOzWBu+xsmxNK77d4ZeLOGfVattAJQl2csiq9aZyacss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com; spf=pass smtp.mailfrom=openresty.com; dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b=OmFJMFBm; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b="OmFJMFBm"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84830c774a0so1027120b3a.1
        for <io-uring@vger.kernel.org>; Fri, 24 Jul 2026 15:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1784933954; x=1785538754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=buSVZDvXEkG28StzcaK7FcGkvMAIj2kZDDitYNJqhlk=;
        b=OmFJMFBm8HL3kY7o7PHWYhZD5EgyUhn5L8IUdmVdFWutR1f3EDZepX2JakLBJI2708
         H7w6qc+COWmRd0u8oh4vheX0C2GwwaIJDmyTw+RNqhCmt3jqPNVRRLVr4ue6URgzYtpm
         CyAN6Q1D4FK0bme2Qq8iafEMCummKyovMFIOSPhJ+3zHep8kQertX4o0o6t9Hl7tmCP0
         Z3Gmu2KtxwH9GlgqHspTeNDvnBeOrmtKLOebRm4GBnQd2XtK69+SGlT3xmbGUgRsg7+R
         Z1i/PFlqjgBpuP1tQJkxHBf3dNy0IlP/ozx1MUD+Lywjzo/WPezDtDa3jxngjDAGvX/C
         5Yjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784933954; x=1785538754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=buSVZDvXEkG28StzcaK7FcGkvMAIj2kZDDitYNJqhlk=;
        b=ORoNDi5CMxc+6RP+74TOzumPc19osmq/DQ76qfRU0+YG/kTixlYK6+R0bJ5rsU+z6d
         dkONs24umqWO8j4q+XAxapEpE81NpsHwgtKrRVpXQMCbWVgsDJWp7Bg9v95hkmKiLFCa
         AapMFFAxqj8a67Ccgl/HmQp+CwNRiTskZJWZDAcl0HJQO/sjcD9i5dPqfogtrUBcDIGn
         9X3aEIvGlswFqDf8wZen0nhl6z7oiQbPSrLMsU5KwDz7Eb3agsBV81OPhNESnPMP4BzO
         Zkz89cYTQffj89WH24q21etNq3D+Gq+vNzF9x5jfR9FjBhozZH+rW01tY0vwbq1uWHRv
         ze/w==
X-Forwarded-Encrypted: i=1; AHgh+RpSPFHeoQqFLaRN4BG0T6cI+Qy9DkX37JaEgHf4qD//XqrUU7b6b1qGXNA9L/B469uNjX3AXLuPRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVScgyOH/byxSn9AgEJMp7Tm/y01F9XygjQo2uzUlQCzAb6TQn
	OmBrYk0HEWdENz77J2o3BpswTj44bVBJwBXWBSNQhvC7xcyh5Pqv3CW4mAi5bJ7+aj+1C50lrOS
	pJ2tZ4bascQ==
X-Gm-Gg: AR+sD123qAxlyNZU0iVFeFGkIoenyacLFwJyO/SO7S1ktdCsTRVbfEhFHsulfywcRDO
	1Oho0/0nKstYjoGTYuY4lJ3tjl5fcG8HoyIRbM8WfKOVnh9brGJCk/Iyceznt+J/R0Jn9V+03m5
	J0klSnF48deiibvP6b/aEdqbAixqZNKpyKg+uSFnydDWcj73tzfyJp1/Cp54WrCFtUNEen0zVzZ
	PS+ilySyTb4Pw/e5kRRolUiwPrLz1Ewgvfb9xIoOcLnYc3fEe6xmQcqzjuVBLeGtYSwnGPK2h+A
	JCYWF+jiOz6isbi57UllK68iNRIElidQdmNxn2xrIogTnJYApmSMNyBY0QBhKLrzU77+cFAiAjb
	l6BqakC8gyGjJLPVwbWds/xFF1W9pwA+EcIgPPYICLfU+1RJ8cFrwc6RZlCiRBt2CBn37OByTWU
	xj4LKQceWOYQW3Cg==
X-Received: by 2002:a05:6a20:7491:b0:3c3:a20f:f720 with SMTP id adf61e73a8af0-3c67df2ab08mr243715637.36.1784933954007;
        Fri, 24 Jul 2026 15:59:14 -0700 (PDT)
Received: from integral2.. ([2402:8780:1329:2779:beb7:3f70:1f02:3159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc584433sm2910930eec.23.2026.07.24.15.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 15:59:13 -0700 (PDT)
From: Ammar Faizi <ammarfaizi2@openresty.com>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring Mailing List <io-uring@vger.kernel.org>
Cc: Ammar Faizi <ammarfaizi2@openresty.com>,
	Yichun Zhang <yichun@openresty.com>,
	Changcheng Liu <changcheng.liu@aliyun.com>,
	Christian Mazakas <christian.mazakas@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Guillem Jover <guillem@hadrons.org>
Subject: [PATCH liburing 0/4] Upgrade to Clang 23 and git tree link update
Date: Sat, 25 Jul 2026 05:59:01 +0700
Message-Id: <20260724225905.747718-1-ammarfaizi2@openresty.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jens,

This series upgrades the Clang version used in the CI to 23, and also
fixes some new warnings that are now found in Clang 23:

  iopoll.c:26:12: error: variable 'no_hybrid' set but not used [-Werror,-Wunused-but-set-global]
  recvmsg-inc-tail.c:66:25: error: variable 'no_recv_mshot' set but not used [-Werror,-Wunused-but-set-global]
  reg-wait.c:26:13: error: variable 'has_kernel_regions' set but not used [-Werror,-Wunused-but-set-global]

`no_hybrid` has been unused since commit c5eead2659ef ("test/iopoll:
fix over-eager no_hybrid check"); `no_recv_mshot` was never used since
it was introduced. `has_kernel_regions` has been unused since commit
30ce99006af9 ("test/reg-wait: basic test + probing of kernel regions").

Lastly, this series also updates the git tree links in the .pc.in and
.spec files to point to the new git tree location.

The old git tree link:

  https://git.kernel.dk/cgit/liburing/

is dead. Replace it with the new kernel.org git tree:

  https://git.kernel.org/pub/scm/linux/kernel/git/axboe/liburing.git/

---

Ammar Faizi (4):
  test: Remove unused global variables found by clang-23
  ci: Fix the wrong `cc_pkg` comparison
  ci: Upgrade clang version to 23
  liburing{{,-ffi}.pc.in,.spec}: Replace old git tree links with the new one

 .github/workflows/ci.yml | 8 ++++----
 debian/control           | 6 +++---
 debian/copyright         | 2 +-
 liburing-ffi.pc.in       | 2 +-
 liburing.pc.in           | 2 +-
 liburing.spec            | 2 +-
 test/iopoll.c            | 5 +----
 test/recvmsg-inc-tail.c  | 3 +--
 test/reg-wait.c          | 8 ++------
 9 files changed, 15 insertions(+), 23 deletions(-)


base-commit: 639d05b5e7f202ca8a400fc3158d91fa30914883
-- 
Ammar Faizi

