Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793301613;
	b=nujC3/aZhbPZ2vbc+2uatRWBRjERZSHI58V6qTwJ8pBpT3R3ARY+sfL/r1dL0ExgkfLn
	 eYKpkUaXS8OYGU+gx7n/PBm3Y2tMz/ssTZFFoykE+J+MWfrDs/A+V+62hmTz531jvR7gJ
	 PxIY8wwYYu/mg84C8sp/tpB/7vQVA2wBKWmHDlGTfJimXmfCL62uTAFOjWm9hixwlMnrM
	 ESELJ0O5LzepH83Y9oyptoLwtd/wtC89Uj+7aIDojm9qWIOyxxj3stcidV4ROHJe+Bwti
	 FyqatXoLXEd002Pdx9amB+t8yxWaSd+Q8GpxopLEB97FO9QwGJsvnsCLhYM7SETFi+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793301613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UNQxWLKuUNs7QSlQ4nad5KG4o+n18sAkmZG5S4l04IE=;
	b=XRFgO+gkfCq0b8FXkD/+Zm6AsvZGO6V3QqmQIAZY/BAk8xrwtfsnZz8ATDcE1q9w8sG9
	 qYUrSzJKUNnWb5MY6ETE/L/Tff3tpKSAflU8hZMYyQgnBcPzht2N8mGubFUAAd1zQD1K9
	 Ptr4dbE6ZxZEvktzFw0Y6eM+YC9mog4bg7d5FOJ03qTnFtGm7MqznolNc/KjxKwdl3wC4
	 rG/gV7o72Z+rDRlHZp6RPScNtm5UvV2g+cOC3VFSHyQkP7wwgSH71ys/ldLokv+cgcd5L
	 ywz53JK+ZxR0Q1/sbohM8tnrVIsSAVjcO2e2OfjMHcD9/MJ7bOOwfJonZU1bH9U5cYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openresty.com;
	spf=pass smtp.mailfrom=openresty.com;
	dkim=pass header.d=openresty.com header.i=@openresty.com header.a=rsa-sha256 header.s=google header.b=gSwYpZjC;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C3C606A31A
	for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 19:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46C3C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=openresty.com header.i=@openresty.com header.a=rsa-sha256 header.s=google header.b=gSwYpZjC
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e95bd1c14cso21104245ad.2
        for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 12:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1793301611; x=1793906411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UNQxWLKuUNs7QSlQ4nad5KG4o+n18sAkmZG5S4l04IE=;
        b=gSwYpZjC5lD47DmdGi2YNsMR4SK2kAXdKXprYD7PTjTLVKNeph2hDVCdSd5+f4Mr9e
         NIo2LdRoxMcZx+0sSjAgdcgceB0ggf5ZOZHuHFlgvb7+poTfuG3fRbQkTSuhiKir8Xep
         Kr+R6VxTx5GOvut3liU8POb9pWl5b+95By+ENyWEH0yHYlEdv6T64rA+dRZOnW+oL258
         x0qUn8XR3S/kYGZdXPybyLI1lA6VzJtvQWhF881Y/dLPSkIRUxVVJmUx9C52tQJQ82Ic
         a2Vxb5yro2ztOwykrVzCIDziU/zDegFX2hGWBhcdtk2cu+H/aRTvaVVxOdzhkgmOTMhY
         eeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793301611; x=1793906411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UNQxWLKuUNs7QSlQ4nad5KG4o+n18sAkmZG5S4l04IE=;
        b=ZwgNXTzxrOibizm1ld9vUdcqASJFesPpI03agWuy8HWWv2Cbby7o96pRidTc+E9Idk
         9AYfkqvi2B86+PkCs3YwN1IgF1/dwERvZoCeAEMjY1zR0SyORmuvQqOBsyoJ9Mhz7gll
         nugBPPH7fD/yeNNOIDYsQhRMjcwjiODnaH2PF8gU4/NMqByCR+zHWlkHjeSzhh7taEu9
         0lS7BKzATmHdjlOASVRIFrzSPJab71b33T5XxrDF+t9qpTxqVYYGnl6VyhaJwIt6QbB2
         mn6I20yEhMwSmAycFmlUpfW0F8lKwyeaBAPwhQkMDLwy93G6wlcMR40ueNHqVn69U3cC
         gdpw==
X-Forwarded-Encrypted: i=1; AKwUvBwKpSgBst07XOLx8iFFdxp1EVPtY1dfICR6lSc7kkESuFAru3C8MCClsY+hwnwK/Vx6a1+acJxuQQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJbZyyiDHap1OwVUQaKwMoOWvbSuWZqrJ/bRCJHw2EtRz3sE2Yz
	QgqVHM33k5qPsYg7Gi/9ZNcv6fr/1oQzM1kA5NNfuGaNvJVEDWuOakqZIVMbwYyOupI=
X-Gm-Gg: AYBFou0yN0PkwicJeiTk0kiCe7hbV+8F3WHdEekSjZ2wuaW9VpR+rOJWpv3Y8/OiZW/
	uFFagQgA2DS6/09WOR96JCuJ5YqV0m7w38zzsHKX4sx8P0J4XksWgH5dNyWMH7EZaeYeMq2Uoc+
	o2SUPX+1CQJxDPQuCgn1IHUcesOma7PRAa5W1Hnom22kXFeArGGG9zhyqEU0G7yR6He7s30T803
	npOa7Ar55GaOpFDf4W/bH64V4qYu0gxttT5/QM9HHUr950AfMgYMPq/vpXcxgd34tq9wLqZ5TdK
	eV0y8P/noPAqeT/TfbY6Kxf0BkzOuVoJNPkhyPeI/vSWUPvVuhcdy5tSiPJRiMoHZKqglvlik7W
	Uh/bXuMjT+Bodp3xuR+1MONUdpzEEB5auZJ8EM1dt8YmJv2hz01wGexgHgvHklKoEM0Uu2JQg8R
	ZzexVin74i17N1rygy7Bz1ZKkI2cD6FgyE2zwBBCnMdfkIHXmVNXlyVFvEJ4wXdinQFXt9JRNNR
	VCyWxr28bgLGZdLJIYvL8lZpmcy2uOQwYh5ex4KFRSD3VyA4OQwvtHYqC7GpMVhiZI2Ubo9HMaj
	n3uJpB9qusHahg9kffxyH6X1Y1RUDATpshQko44J
X-Received: by 2002:a17:903:41d2:b0:2e9:5008:3ecf with SMTP id d9443c01a7336-2eb36401ddamr3712805ad.3.1793301611367;
        Thu, 29 Oct 2026 12:20:11 -0700 (PDT)
Received: from integral2.. ([2402:8780:1329:2779:10e9:1696:2e96:8c2c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3690ae24sm310315ad.25.2026.10.29.12.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 12:20:10 -0700 (PDT)
From: Ammar Faizi <ammarfaizi2@openresty.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Ammar Faizi <ammarfaizi2@openresty.com>,
	io-uring Mailing List <io-uring@vger.kernel.org>,
	gwml@gnuweeb.org
Subject: [PATCH liburing] ci: Temporarily remove alpine-musl-build
Date: Fri, 30 Oct 2026 02:20:03 +0700
Message-Id: <20261029192003.940655-1-ammarfaizi2@openresty.com>
X-Mailer: git-send-email 2.34.1
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

gitlab.alpinelinux.org has been unreachable for several days, which
makes the alpine-musl-build job fail on GitHub CI while downloading
the static apk-tools binary:

  Download static apk-tools
  Downloading https://gitlab.alpinelinux.org/api/v4/projects/5/packages/generic/v2.14.10/x86_64/apk.static
  curl: (28) Failed to connect to gitlab.alpinelinux.org port 443 after 10002 ms: Timeout was reached

These failures are unrelated to liburing itself and only add noise to
the CI results. Remove the alpine-musl-build job for now. Once
gitlab.alpinelinux.org is back up, this commit can simply be reverted.

Signed-off-by: Ammar Faizi <ammarfaizi2@openresty.com>
---
 .github/workflows/ci.yml | 53 ----------------------------------------
 1 file changed, 53 deletions(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 1149fabf58f2..127bdc459cf2 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -299,59 +299,6 @@ jobs:
             exit 1;
           fi
 
-
-  alpine-musl-build:
-    needs: get_commit_list
-    runs-on: ubuntu-24.04
-    strategy:
-      matrix:
-        commit: ${{ fromJson(needs.get_commit_list.outputs.commit_list) }}
-
-    steps:
-      - name: Checkout source
-        uses: actions/checkout@v4
-        with:
-          fetch-depth: 0
-
-      - name: Checkout commit
-        env:
-          COMMIT: ${{ matrix.commit }}
-        run: |
-          git checkout --detach "$COMMIT";
-
-      - name: Setup Alpine Environment
-        uses: jirutka/setup-alpine@v1
-        with:
-          branch: v3.15
-
-      - name: Display Alpine version
-        shell: alpine.sh {0}
-        run: cat /etc/alpine-release;
-
-      - name: Install build dependencies
-        shell: alpine.sh --root {0}
-        run: |
-          apk add --no-cache build-base musl-dev linux-headers;
-
-      - name: Build
-        shell: alpine.sh {0}
-        run: |
-          ./configure --cc=gcc --cxx=g++;
-          make -j$(nproc) V=1 CPPFLAGS="-Werror" CFLAGS="$FLAGS" CXXFLAGS="$FLAGS";
-
-      - name: Test install command
-        shell: alpine.sh --root {0}
-        run: |
-          make install;
-
-      - name: Test build against the installed liburing
-        shell: alpine.sh {0}
-        run: |
-          export TEST_FILE=".github/workflows/test_build.c";
-          gcc -x c -o a.out $TEST_FILE -luring;
-          g++ -x c++ -o a.out $TEST_FILE -luring;
-
-
   codespell:
     needs: get_commit_list
     runs-on: ubuntu-24.04
-- 
Ammar Faizi

