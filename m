Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792711283;
	b=JkPq55r/Q6D8bcF4/vLZaLsGKCaFPsUNc7kUe7zOEtLfz0jQWIeBKLfk/IcxEDJC4qHm
	 JmpoA2YrLkgAnZbeV+sfubJP87VGAXwLMciiJNxj0duhHiF7PTwNOivTUvsFr6L7sP23D
	 Zb0XrIrM3biaLD/L7IyaP0SJQPd9eCAlkttghaItBEuC1Y2vTLnxj0qLafCgEOPympyoH
	 uUHst6mvzRC+sknWwjNA2j2vYRQlfKHhCg0rf/OLSegusMVYr7HFMcMk7trmuol69JvFn
	 2pP5gnpnaLzgXbRPTTUECWKhMBCS4xcEhR12/AI9PdH7HuO8uXgoF9MnziVUD4qskJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792711283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=H66wtRneHdvmEI7Lgz4ecssmEQCX18Fy4sSSzRx3jnk=;
	b=hJGfzFpBVxmXN5CM9YwBio3P6iIuPbOP9hX5/r/rvmgu1zWYEdytEyJ5mg6+u8SprWTf
	 PVD62PeVDoWRvDD5LC8xD2wPgrRmas33AaI15k8/YLCiE4qzjkSncDLlxDyqI3SJm/s37
	 pW5R9WVVU8mzIUkhamWAGYIY0+TniNgCawd8fc6ZzQD/fhi/A6v6CWcJwPxwbQKZPQP4q
	 lihxr3Hg+bGN9O5PhzR3t4RkOfvN2cs9QzmO+iQp5/qqjZygrZS2FeyuOpU9MzkjHV+ES
	 ljlwiHf2OE+XzptBKvBh6pkhVq66WPuOfD85MW4wxW1ncqTo09TYsHlViv32nRZlLfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ef2exmCS;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0789E606A325
	for <io-uring@vger.kernel.org>; Thu, 22 Oct 2026 23:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0789E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ef2exmCS
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a2065a2ef9so2471645e9.3
        for <io-uring@vger.kernel.org>; Thu, 22 Oct 2026 16:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792711281; x=1793316081; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H66wtRneHdvmEI7Lgz4ecssmEQCX18Fy4sSSzRx3jnk=;
        b=ef2exmCSMGu9BL1RoF7gwp/3JSejse9dIZ8juY9zqk/y4hjxTiYK1V9bakV0AIMNli
         g5WzOHYD0MnoJzVhzrMYCf0nXOCUedHdoqCr92/KPf8hg7VDyzveaVD5V4iWmJyrC12E
         dbQ7/gJATs+cWJ0NWd55yutpVpn8pgqac5NGRg2wH1i9tMQxEpFvii6IVYCAT9bz3vPw
         iX7ZE9LEFgSwa7sRrU/Uht2uLfYJ53B+dXj0Va8H5ZlLF04AtY05bSAty0XeKaERB5vh
         wR2gEP5wBi4ly1X2dy+kHdam5QJtcKKzFensQddfyRv73VSQVE8eRtGK1ekQO0GnxzfH
         xCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792711281; x=1793316081;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H66wtRneHdvmEI7Lgz4ecssmEQCX18Fy4sSSzRx3jnk=;
        b=Nu2EkSGbymNo1mr6EJqd/c7eDtiLn6UkfLn4DFgKhzmiRXzQ8S1AGPj51tYh5A+ibc
         7JMlYXZg7HVoVMmAfyg2y5/wAAa3k9QXLaBsX3hL8LJWmeUuYkU86l49TOc459sY6eOd
         feh73g5mn7yAiLahQvsEbi8fby4u9k0pR36bgNGQYU0mrKuQXA+YTA8kbbNUW39IgjgR
         LmKCvR3E7jsV9joxFBK2dwzyICGQ4eR+0Swicsp/WmZdZfmpzaOQAiI9N5u+BFD/uyQX
         cbVbevHhD+wHrBxcDCTukGUafT32nL6404WY+kcxLC1vI3JgRtYKpTLXqZ74kkJ2oQgz
         17yQ==
X-Gm-Message-State: AFq9FYIAk+Pd42r4E+ZUwsiNtBH72LHojVsRJx7qNsLsFbYJckouNEnb
	cR0q7dvnr6cDDTGgPOZR+VMTtF9bBg6zsOZcDj89WrDlaPU+1eUb7SqV00Yc06a/rTOx3ofVfg=
	=
X-Received: from wmbh5.prod.google.com ([2002:a05:600c:a105:b0:4a1:f1e1:c6d6])
 (user=dmnk job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f81:b0:4a1:f377:5c68
 with SMTP id 5b1f17b1804b1-4a211ee5d0fmr6609975e9.34.1792711281356; Thu, 22
 Oct 2026 16:21:21 -0700 (PDT)
Date: Fri, 23 Oct 2026 01:21:20 +0200
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022232120.2537530-1-dmnk@google.com>
Subject: [PATCH] io_uring/net: mask socket type with SOCK_TYPE_MASK in io_socket_bpf_populate()
From: Dominik Maier <dmnk@google.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, dmnk+artist@google.com, 
	Dominik Maier <dmnk@google.com>
Content-Type: text/plain; charset="UTF-8"

When an IORING_OP_SOCKET request is prepared in io_socket_prep(),
sock->type retains creation flags such as SOCK_CLOEXEC and SOCK_NONBLOCK
until __sys_socket_file() masks them off with SOCK_TYPE_MASK during
execution.

However, io_socket_bpf_populate() copies sock->type into
bctx->socket.type without masking off ~SOCK_TYPE_MASK. As a result, a
cBPF filter inspecting bctx->socket.type against socket types such as
SOCK_DGRAM or SOCK_STREAM can be bypassed by ORing SOCK_CLOEXEC or
SOCK_NONBLOCK into the socket type.

Mask sock->type with SOCK_TYPE_MASK when populating bctx->socket.type.

Fixes: cff1c26b4223 ("io_uring/net: allow filtering on IORING_OP_SOCKET data")
Assisted-by: ARTIST LLM
Signed-off-by: Dominik Maier <dmnk@google.com>
---
 io_uring/net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/net.c b/io_uring/net.c
index f5f4f3ce6ef3..5ead8a83a89f 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -1711,7 +1711,7 @@ void io_socket_bpf_populate(struct io_uring_bpf_ctx *bctx, struct io_kiocb *req)
 	struct io_socket *sock = io_kiocb_to_cmd(req, struct io_socket);
 
 	bctx->socket.family = sock->domain;
-	bctx->socket.type = sock->type;
+	bctx->socket.type = sock->type & SOCK_TYPE_MASK;
 	bctx->socket.protocol = sock->protocol;
 }
 
-- 
2.56.0.257.gf7497c7d27-goog

