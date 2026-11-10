Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316820;
	b=ghwRFC6SfC6GkIBBeHl+og4vfRzc8rdJ1Je5WhRdxFRmWzzU/nDF3geWIIfICBDUEpHF
	 4rEq9JiV21N5OCm20NQOlCLDiALDhNQYtp5nJWqT/4m/rPAzhm55ZHvz+zGM11lQImIwL
	 mWzE7jnbgt2D3UDhqmWNVEuBJvtbFVXe4hB6rj20EhwkAzWLDJ2UA4a3++EA/BJ9/+D+a
	 RyUukGb42zZjw/4f1Gek8GCmNX2kJKZG/eJZ4sFryFMK1PtNsyQTsocyZnmXYbDVCjtqG
	 oUtRKzoxVmJhOdCPtcMYk/KdNVE8udQJG9zQ3N6bESa9ro1teBV2sx4X24uZ/jiHZxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316820;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=o3j8ZSLUlMW9spzjCj6Lf6ZyTqWduSvktrPcGEoHNnM=;
	b=ISJwOTg+cr9HU8asAJLONiGAUB3hat58gtmUzP1qZdQYDkUkwSo/f6U2kq7k0oKiMdMG
	 qR1HTBKnLhcLPdjh2xYqsdi+SCPP8SaHvtV/PtydzXuLclpuANxqztDRYCsHKtkmliBgh
	 escL8oMhwl2TtBlUNUfclVRngzxEO9hbo9/7fzp5h2/zLhYrz2NORgBSa1rgLh6v86l6A
	 b6SmsqzPM6+LCtBcNGNorkU4UrZ9x1NZy2LGgZZaEII4QSxcScxEKxC1iNzTE5RCaOtLw
	 YziCdn7QGL2XeJvfR2Z7AMFWYKUtzEQav/8SS6zjKNNF/mfpyyvumrVXcJXDdbEGsuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PGyQ6bE0;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=i+5XCEtm;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0D760A263C
	for <io-uring@vger.kernel.org>; Tue, 10 Nov 2026 13:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD0D760A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PGyQ6bE0;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=i+5XCEtm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794316819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o3j8ZSLUlMW9spzjCj6Lf6ZyTqWduSvktrPcGEoHNnM=;
	b=PGyQ6bE0dpjNwNxjzO3E/32hiLaRxTjXtWXk3wHoxqEkKREQ1qM0k2bhisZRFAHrFxjx0C
	EJxrcOgrWM6c8TNEnClibWaD4QLoQMNuEnUmky32GSQZsUXj3QpL7zoFPgWaZ2tmYutTgU
	J23pf5t3Qaa+pl+vstS2z2OcEVyIcO8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-vbTZ9Y9xPd6Zcqwc56vzAQ-1; Tue, 10 Nov 2026 08:20:15 -0500
X-MC-Unique: vbTZ9Y9xPd6Zcqwc56vzAQ-1
X-Mimecast-MFC-AGG-ID: vbTZ9Y9xPd6Zcqwc56vzAQ_1794316814
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c25edb54d22so259265666b.1
        for <io-uring@vger.kernel.org>; Tue, 10 Nov 2026 05:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794316814; x=1794921614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o3j8ZSLUlMW9spzjCj6Lf6ZyTqWduSvktrPcGEoHNnM=;
        b=i+5XCEtmpFWipFgZNLE/fMc723DK5Ny/xxXGHMwawP8OlJErf09CL2Kd6S1HWtelVY
         0zuny+/muaJNJ88KY68zQHVVG9rHZ+MM5Ol1hIrYV3EbejqvN/SlDmdkKKCkM5sGJZbw
         3Pt4Jh+b8OXbZ6IEOtO62/Q9QIGkkxlrHZEBib1vjauncP8CRsER39qLbpU+PIN27fuH
         cbTyBBpeEz+/4O4bSV3vEmKdMKM4qQNCqAQWTfJFpl1xJUc40dWzRhueU/nCSn4DA/u6
         hju+8l8mYQJsSUTfCExcYwzApOkH09e06ykd90tqOEJ5B3cCyFzjuXIgreztbKVEIIt7
         WZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316814; x=1794921614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o3j8ZSLUlMW9spzjCj6Lf6ZyTqWduSvktrPcGEoHNnM=;
        b=UHIVS/ngOsLWq2ipxGa7H7yRb668ctTwhJ8Iilz0m1xepkO69476zLyF4jEmavDn80
         Gy65QpWST0geofuev6j5XSAJosPaittLQ80rzWn8lgBqwJrosvpAaZFsIjNTr8xKwbY0
         O7rdsyz8eLACD7LzcVQ3jG9U7UbMlnNlfF6i84813D+owVciLcMKQS5kpJiHOEiqKA3z
         yOFc8uZVpAHfP6Rb272uIIbUFlbW5mjRv9XIIZjayYmY3BTtODPgMURCMdXUZQ6kNSl/
         SpwsE2OweEK9OSxq1teQIcZLy1G5BHiY4JWHiGGoPwg3WNiOWd10WZH2o4qbTTd75DuV
         EMAg==
X-Forwarded-Encrypted: i=1; AL+hErHA2fo2VE36KeK/HpRdiXNeVp/QJkm4sdE2It/IFrNXzTrZDjyAgh6XyNwlugbOfud9qh+llRTMIA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/wcHyS4grZ72qrG28LDiX4Y8042/Gk03vHYEern0x8h/k5EzRS
	F+gAOvcuMVVFz2Qptv1Yi3bQCXiWeJbGVr4z89bdNYPcD2uaZFrKUx9ZrYZmGN4u7DNdOn9MuVK
	ynyFUyheJT0bzPGlZPa1OY3pUdicEfj7tpLdcXinnpqNVn1IF/0ebtDyxagfS
X-Gm-Gg: AYBFou0n5FAd+nQjiJkIg4bm4XBEw/N2mUc3CRE7uFPN5tocAGpcQ+Q+2oJgok8Rvli
	FkfjfaFFDXsU8EDqweoFMWSF9B4562rCMuRD35F+ZMpEE81IdDAgSDav5mTi4sLRevrtOCxxSwe
	pfnn1GLk1gd1KoV7KjbFGf7DjGD7+eAxm0p04d73Z3UUQWKgN5HuoAujdAVRVR+8NV73Fn1IUy7
	egrgMA3x0/xBJRIRBKf7rqR2Jij7kuz1NIiSGLzabxfPnmoS3ZcXRaC08AxAllFFdPIO7qq7T+v
	OofMfjcfP9TqC67dx+X0HAs2qo1R9QrkShCwiyMTlhnz6zsj2zo9fm8u3LD84YIf+6wDJoHYFsX
	xuMFVLFSUGKHQfyWiIG5V+LDApEIN9+ReNopEle6rw9ZIKQfK62vp4beTlLkqMtRX7eUzqVo05N
	hDwyGX+NPeGqRKYtEiDbRUywdSQxHiui0MBd0ZJ6m9K1M2Fm2NJfTQG2koF7NP8N1NmaDbouB8S
	u5mnlJcNaobBX63gSdqjnBlrxrcESN1cODED/moeWP7x3jYdWK7
X-Received: by 2002:a17:907:d7c9:b0:c2e:2252:6ddb with SMTP id a640c23a62f3a-c50495dfb72mr227137866b.10.1794316814435;
        Tue, 10 Nov 2026 05:20:14 -0800 (PST)
X-Received: by 2002:a17:907:d7c9:b0:c2e:2252:6ddb with SMTP id a640c23a62f3a-c50495dfb72mr227134966b.10.1794316813994;
        Tue, 10 Nov 2026 05:20:13 -0800 (PST)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a5d54bbsm107791166b.48.2026.11.10.05.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:20:13 -0800 (PST)
From: Alex Markuze <amarkuze@redhat.com>
To: Jens Axboe <axboe@kernel.dk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	io-uring@vger.kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 04/12] io_uring/opaque: add owned-page helpers for dense copies
Date: Tue, 10 Nov 2026 13:19:58 +0000
Message-Id: <20261110132006.3280986-5-amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110132006.3280986-1-amarkuze@redhat.com>
References: <20261110132006.3280986-1-amarkuze@redhat.com>
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

Add the accounted destination-page allocator used by CREATE and compaction.
Prefer compound allocations up to 64 KiB, or one base page when larger,
and fall back to smaller orders.

Signed-off-by: Alex Markuze <amarkuze@redhat.com>
---
 io_uring/Makefile         |  2 +-
 io_uring/opaque_compact.c | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 io_uring/opaque_compact.c

diff --git a/io_uring/Makefile b/io_uring/Makefile
index 81710127046c..191316972e04 100644
--- a/io_uring/Makefile
+++ b/io_uring/Makefile
@@ -17,7 +17,7 @@ obj-$(CONFIG_IO_URING)		+= io_uring.o opdef.o kbuf.o rsrc.o notif.o \
 					query.o loop.o
 
 obj-$(CONFIG_IO_URING_ZCRX)	+= zcrx.o
-obj-$(CONFIG_IO_URING_OPAQUE_OBJ)	+= opaque.o
+obj-$(CONFIG_IO_URING_OPAQUE_OBJ)	+= opaque.o opaque_compact.o
 obj-$(CONFIG_IO_WQ)		+= io-wq.o
 obj-$(CONFIG_FUTEX)		+= futex.o
 obj-$(CONFIG_EPOLL)		+= epoll.o
diff --git a/io_uring/opaque_compact.c b/io_uring/opaque_compact.c
new file mode 100644
index 000000000000..b59c7cb95d42
--- /dev/null
+++ b/io_uring/opaque_compact.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Workers copy immutable backing without holding object table locks. */
+#include <linux/highmem.h>
+#include <linux/memcontrol.h>
+#include <linux/mm.h>
+#include <linux/overflow.h>
+#include <linux/sched.h>
+#include <linux/sizes.h>
+#include <linux/slab.h>
+
+#include "io_uring.h"
+#include "opaque_internal.h"
+
+struct page *io_opaque_owned_page(unsigned int *order)
+{
+	struct page *page;
+
+	for (;;) {
+		page = alloc_pages(GFP_KERNEL_ACCOUNT | __GFP_COMP | __GFP_NORETRY |
+				   __GFP_NOWARN, *order);
+		if (page || !*order)
+			return page;
+		(*order)--;
+	}
+}
+
+/* Destination allocation for dense copies and CREATE. */
+struct page *io_opaque_dest_page(struct io_opaque_store *store, u64 pages_left,
+				 unsigned int *order)
+{
+	*order = min_t(unsigned int, IO_OPAQUE_MAX_ORDER, ilog2(pages_left));
+	return io_opaque_owned_page(order);
+}
-- 
2.34.1

