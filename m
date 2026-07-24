Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C437F3C2796
	for <io-uring@vger.kernel.org>; Fri, 24 Jul 2026 22:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784933965; cv=none; b=MIbm1wVq5xbrJ5Gnn06IGkD8RaNfNF5VANV3K5LnnO3xyqL0/OqNH6GyJJiXycKFS/mOkR+LGqIkBLmsIOKICPJVlViwkqKSmbyy4lWeaeN2s5jHzKAvF2BaQwTntrRnuyE1YZVH4UfKJ7Z9egGirdIVwNKRgkDPssYBq8QgR3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784933965; c=relaxed/simple;
	bh=i/yH6j5Owz1j4ikxOpyFyE2VBwk9TMXU7hl4BAO+rpI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S99QHN94z7yS6y/LeOI8wk5XxllKmQb6oTmP3ol2v0caiB0rplTNaYfbY76lXP7JOzKN4oUAL5dAJc0f+ksQdifC8GjlUwSacgiB9Kl6lFrlqCcySxyeplo2w3prsvGwQAUU1prq0AVfWrrPdGUUjNPlkdzSvGPoOx/xreltQ+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com; spf=pass smtp.mailfrom=openresty.com; dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b=hQHNSk/v; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b="hQHNSk/v"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-845c92bc464so812010b3a.2
        for <io-uring@vger.kernel.org>; Fri, 24 Jul 2026 15:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1784933960; x=1785538760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rE4mDjuASUm+Bb7l2WR9fqCsfBMB9z+GkZQqkop0Gc4=;
        b=hQHNSk/vWKJ0C0kB2zwTySlO/VVOD93wiNvDI8FKxNgVBEM7rbe7F1DdGc+SS5nldg
         /XXfOyHs6daDej/1hd0cdFswIfNGN8Bmg0ik7TiMQJadYnp9RanwP7XH+xqsZSZBI09L
         VYTqnKMOx0dSAGKG0Op7blFp8LjRohDKYR3RPSfPcGn0T3ZgupetVp4LLYurpfLG7WmQ
         0cOt5NwsZHywB9HwGGxjI5jmvuePrea2Q+BDVG8Y+9b4uQOovDqId5wqEIQ2IE9zXcEy
         MD4ZKszWkHb4rUJ6ThRcA36/ardmNpohR/2AkfN/FIlQe1v1zemEyAUpOEtR5HVh2IoC
         a/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784933960; x=1785538760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rE4mDjuASUm+Bb7l2WR9fqCsfBMB9z+GkZQqkop0Gc4=;
        b=tOmXXeX5KdDS4tAhukCASy3d+J+3XmuXzcP3tyVjh5ewD0Ru0kjfFxEIBa3g/agmuM
         sltTKhShfZODI1uhytvbz/AX5a/gvVEehQJO0rwJE3AqAssRoazAtKFuLIdThOR3EwOx
         b687TlIvPPr5cbeeYFHdSbU0vIBPY6vvsmsrLL04ePh3bduXXulCntJRYUnodAiby9Du
         G2BVyrBlZXOusREVHIuGWRrWo6Mjyo1NTr2DRUNszz3AoP9zSsUz5go3OvKaVl7CVgcc
         a1RM18qRloddpbM3DbjFcxohq743BYumhSnEMg92eRfBpD17ecFWItdLwO6lwC20KxoT
         X3GA==
X-Forwarded-Encrypted: i=1; AHgh+Rq6ygYMtj/zsBKZqOkhdkeYf9lfZ4yIodR5xVnzcNFIIH2MvD8PZiLW8mCwVjbP+YSpYWSYA7puKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZUSkGhSUqXmz0UZf4Z6u9kgCMVdBC3jcct7mLSbodrS7lQo0i
	8jpn083w1RJTvShPLtppUjSl8Nk4oh6e/KAht5zKxPkjSwqx+Dcn/YQnpWLMHeYuRjquT0w8ha7
	hh0LtbYRWog==
X-Gm-Gg: AR+sD13xBR/4eqUY3I6GF/fa78anqAtZUZzuxT/wqb++AiKAaJWLJzaJp0F7JdRTCLl
	cMcMwxK6D/MtvvMA1nXaIyHsmeDdgue9EzZvnD7H1Vy7gn3uBOiQyAiMrjoHV4RAxYiaC7fbyW6
	xH4Z4mhVVv5erua31cV2upRN0DQcOCVqy3SsoUr/ujtVXkiPXn3pQQ3eXzLszexg/XDCiTu+S/N
	Yy+HwlzRTYVdb7RZMBdNZTAMssp/B4/L0jPF5368h3NTYY7ciLF3diDZJ9o+HKlS1Y7V3D5STtU
	8KhqQs2mqcR3lsM7P0xZ6ZwddZQvbQqHrMqhHHcYNyKOMFWZXySJIKOBADARscSXGeZpHZ+1E0a
	tC24jGxABSp/2lo02QRSN/FRmhbRS8NxeK67J9PJi/JolcfEr8WiZkBo/GmNanxtJJETHSye2TY
	jUbJ5zrNqNIxlzAFdlImO9hRuB
X-Received: by 2002:a05:6a21:7483:b0:3c4:2fe1:fa36 with SMTP id adf61e73a8af0-3c67df10276mr251827637.36.1784933960480;
        Fri, 24 Jul 2026 15:59:20 -0700 (PDT)
Received: from integral2.. ([2402:8780:1329:2779:beb7:3f70:1f02:3159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc584433sm2910930eec.23.2026.07.24.15.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 15:59:20 -0700 (PDT)
From: Ammar Faizi <ammarfaizi2@openresty.com>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring Mailing List <io-uring@vger.kernel.org>
Cc: Ammar Faizi <ammarfaizi2@openresty.com>,
	Yichun Zhang <yichun@openresty.com>,
	Christian Mazakas <christian.mazakas@gmail.com>
Subject: [PATCH liburing 3/4] ci: Upgrade clang version to 23
Date: Sat, 25 Jul 2026 05:59:04 +0700
Message-Id: <20260724225905.747718-4-ammarfaizi2@openresty.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724225905.747718-1-ammarfaizi2@openresty.com>
References: <20260724225905.747718-1-ammarfaizi2@openresty.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang 23 is now available. Upgrade the clang version used in the CI.

Cc: Christian Mazakas <christian.mazakas@gmail.com>
Signed-off-by: Ammar Faizi <ammarfaizi2@openresty.com>
---
 .github/workflows/ci.yml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 842cdead6fef..1149fabf58f2 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -206,9 +206,9 @@ jobs:
         run: |
           if [[ "${{matrix.build_args.cc_pkg}}" == "clang" ]]; then \
             wget https://apt.llvm.org/llvm.sh -O /tmp/llvm.sh; \
-            sudo bash /tmp/llvm.sh 22; \
-            sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-22 400; \
-            sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-22 400; \
+            sudo bash /tmp/llvm.sh 23; \
+            sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-23 400; \
+            sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-23 400; \
           else \
             sudo apt-get update -y; \
             sudo apt-get install -y ${{matrix.build_args.cc_pkg}} ${{matrix.build_args.cxx_pkg}}; \
-- 
Ammar Faizi

