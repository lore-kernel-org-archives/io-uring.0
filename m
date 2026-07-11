Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671933C09F7
	for <io-uring@vger.kernel.org>; Sat, 11 Jul 2026 10:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783766986; cv=none; b=kmZxs7st5fhr7c7cOQxS7OZS7h68Tq5PG6sDdSpKPI08IygGEBK+c0QMEI+WQ7nwD9ay7wbaepqK9sU0WwRnlqYwe/4VUIcqVOGB7n3RZta1VvNGHFaF8Gy9la2H76p+qf7fqZR2bMO1/J3JeWuA96XWgeaYreDfXYcr6DxVCgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783766986; c=relaxed/simple;
	bh=GOpsniia9YGwJC5+Tf9jZp7skqJgnlIpNpZfRP/ds68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mgZNFSVi7ZRqOzenc9vGaFzFaG0AOpGWEEboFIUW3dsZxJWMWFRswgnZFd9QWJu0DK8DR3PLh/63bzH/weVFOIbEqDnrtat057rRfPPspGfZVGwP6ivIbQhh6zzUarEgJqrTfonusvT3BCgrzUODv7IB9RgWUgoBerpWDmGTI44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2jGj7rS; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2jGj7rS"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c15ea93028dso185763966b.3
        for <io-uring@vger.kernel.org>; Sat, 11 Jul 2026 03:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783766974; x=1784371774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jomHTWh5pLJKgL2wIyki6K11K3ENYcuFeD6DEOIqSFg=;
        b=J2jGj7rSYfVeg/+f6IVxjKjjdACs6FUFKbw1AtR903opixoeHsQa6159UsbRcn+rvD
         XwOQg0W1EaPN9L99IoPRX5BQJ79uIgIoKHPfxjKW6/Po9xORL4+wvCuDTN1Cy0OA93/C
         glgbJcaNqFPF8tAx7LzObJ4EyG1tBypNcFndYXa3NtRI6ubX+HPX+rUSF3bxcQHg2rUr
         SuRhlsJvPVlVPMKj2OOY4N2sFlUFPmGb6udMFgZbiShjcZEyL02l1v9PRPKdXOxPa8ay
         ufOzHoDf2unypITLTtFUVUzGUsnlA7HU1uk9lf//hf7DNMeGvPMfeDp54HZuiUotYisD
         lhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783766974; x=1784371774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jomHTWh5pLJKgL2wIyki6K11K3ENYcuFeD6DEOIqSFg=;
        b=P+79r+uGUkA5YCmjGu1S2KinbAHPhcnMDS5PsIlRnHsIAyDHATpqL7dEduIED6j6q/
         PK93RFkUNLXa2skiDNOc3wQJc/63luQCWwZxvNPsWDUtyKzk1qItFjWBd1ATFQcTAFXI
         nxILDMRhBhasHtNZlVcLKbZ2gMJV3InskL31M/zJjAy13ZYJkYu9b1JTaev8+ijLuFnp
         EVl44qRQnXN6LNYIjlGvIWD/H6UNwpsSntWTEqyz8EXLqr1hgWhPBPayOcQMsTBvY9k1
         Ocd2krkwgBmsut1aR+QyAVc6eObhr2C5uR/3r5RV/e6tIFtvS8SCaR8slWEEE8IE7UXH
         OEWA==
X-Forwarded-Encrypted: i=1; AHgh+RptwemQFvLlGcjlzqFEiAwZMZjACT8lX4mhR8lMtA4GND7qkRteZDmNaK1Cn12qRXk1ep6vqWtiYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoiIAg+0JP0X3Goc4eONIQqOx0gRDVah3Y/KH+bKvCPyVtawW+
	g5CnGhbbrNV43UiZ73krQu2JYc/WDRegHAMgADNiTDJwGpRrdgppzRCO
X-Gm-Gg: AfdE7cnzTdYHd/ZuVfhbZOSL0hWgEQiDP/PAWCc3ZHLeCNeWqQbGD1VQOqHylsAKK9w
	oCM4bxPEdjhQ+oWr9GiIEoQ7pafcpad9+yZ6ZJaAS6I5I0Ubom07FLBJRT/gI38qL8B5tOew/yF
	L0r0s1NS57FUKwxuAeB1t7SghF3YcL3UUOBv5DWQZdrrRIf2pf/pqoTTxGYvjwTPgnICMna+zzl
	zgjllRJbNhAp5D6+wu7FyYLk0dkjTG/MdM5cJmqPvoJHiI51cUKYTJtc0Rl+b4S3aChMvFVN4di
	K9C7WdiclxLE0JVgolpy28IZdoY82Tkk7apHHmDMk9lYebi5y+pJag648EmTb8UnzQ3TZjHKRp9
	lLOAgWhGmucMg4eBknZa/tErxbZYudGJYLfISYfAjlgZbYyqSV8Tnj3A5HEY1YHoLiQJgIWePGd
	Fbqo3l/eA5KE+3G70m1SYApotBmj6mvp1QzKhl684mg4fTiJKRVi5MTsEEu+zoabJM+kBdLjFw9
	ZzMQeHeIwBgZkTdfrf8Qldswg2ak6+qK9utRTQTcsghMWFWYg==
X-Received: by 2002:a17:907:706:b0:c15:d4f8:dade with SMTP id a640c23a62f3a-c161e8e7d15mr90880266b.2.1783766973894;
        Sat, 11 Jul 2026 03:49:33 -0700 (PDT)
Received: from 127.0.0.1localhost (82-132-222-132.dab.02.net. [82.132.222.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15beb53b86sm609123166b.25.2026.07.11.03.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 03:49:32 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	io-uring@vger.kernel.org,
	asml.silence@gmail.com
Subject: [RFC 07/10] io_uring/rsrc: add uncloneable regbuf flag
Date: Sat, 11 Jul 2026 11:48:36 +0100
Message-ID: <23e6c268dd474997765caebf90ec9bb39f481917.1783614400.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783614400.git.asml.silence@gmail.com>
References: <cover.1783614400.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's hard to implement cloning if the internal structure needs to be
mutable and/or relies on other ring resources. In preparation to such
buffer types, add a flag indicating that the buffer can't be cloned. It
might be possible to add cloning in the future for them, but that would
likely need reallocating the structure and reacquiring resources in case
by case manner.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/rsrc.c | 5 +++++
 io_uring/rsrc.h | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 24fc3232a66a..d57e8a0380b5 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1381,6 +1381,11 @@ static int io_clone_buffers(struct io_ring_ctx *ctx, struct io_ring_ctx *src_ctx
 		if (!src_node) {
 			dst_node = NULL;
 		} else {
+			if (src_node->buf->flags & IO_REGBUF_F_UNCLONEABLE) {
+				io_rsrc_data_free(ctx, &data);
+				return -ENOMEM;
+			}
+
 			dst_node = io_rsrc_node_alloc(ctx, IORING_RSRC_BUFFER);
 			if (!dst_node) {
 				io_rsrc_data_free(ctx, &data);
diff --git a/io_uring/rsrc.h b/io_uring/rsrc.h
index 98ae8ef51009..83aa86e6f320 100644
--- a/io_uring/rsrc.h
+++ b/io_uring/rsrc.h
@@ -29,7 +29,8 @@ enum {
 };
 
 enum {
-	IO_REGBUF_F_KBUF		= 1,
+	IO_REGBUF_F_KBUF		= 1 << 0,
+	IO_REGBUF_F_UNCLONEABLE		= 1 << 1,
 };
 
 struct io_mapped_ubuf {
-- 
2.54.0

