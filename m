Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740240;
	b=5pp1odorjOlzhPK+URhLxIOhKrbm6a/YKUFkZi7WKuq8qL8JHE4ByhYdUHaYboxmHp8a
	 0lGF91ECnKQyNk6FLLMlyycbdNZHdxeJE3QwT2xWJIgn6vA7Eh1uKB+cG5sF/FC8Pz1uL
	 wsH/N1nRVkQ+mL7cqgm3iAx4d9SR0D8dnUffbOgKboVf+BhQdVQkHWjtJSS3O7Kf/mCs8
	 5+TkHtRFYtlXmlSYqJ+gysE7vrHh0AiTbOIDqq5GExniEBNFsAfSSvl2ho+DWe39TH3F5
	 0U3+rknrTqlXnWGpn4i1a8MRvOpPV5rRqFlJZ18tO2yXeO0nfGIOjHyJXwINau6T38w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=oibzb0WyOnXCVqHk/JQbkuYKg2Gn7hJGWFHttlYByP8=;
	b=cpvI5AVNyRXXnuqyv9U4IjFleODOF9bVnY5Y7jQLCUsfGp20k7EuPKcnzXlQzZgIiSXO
	 coo0TgR82n2EVJQyuZnJiS1s5gMd6ecLVA+3/Jsr4t/j4vYKiCLJ6haL8OI3jsBySxhLt
	 SUtQ9+MSd7S/BHUT+0WJsmY6R6fTNnAztm/0CV9zUGECmwxYorHc7zQgyirwRQlyFJyjr
	 U03l5h4uX2OD+Z3fnVLu+156zZlZGOjwVoXmORfIylm86S1e/fjegzJH1NUWbDUgAEu7W
	 A7VANhhEPQ7O0RQ9FqjV4CsJ7RB8QunJxCEVFRlv3l2lVZUB+3mIAzO7jU3UsfRehYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=OLEqYr5p;
	arc=none smtp.remote-ip=209.85.128.99
Received: from mail-wm1-f99.google.com (mail-wm1-f99.google.com [209.85.128.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1096B606A324
	for <io-uring@vger.kernel.org>; Tue,  3 Nov 2026 21:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1096B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=OLEqYr5p
Received: by mail-wm1-f99.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso18808245e9.1
        for <io-uring@vger.kernel.org>; Tue, 03 Nov 2026 13:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793740238; x=1794345038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oibzb0WyOnXCVqHk/JQbkuYKg2Gn7hJGWFHttlYByP8=;
        b=OLEqYr5pikrldqmuRgbA7Tw+OjqWnFMUBnyP6Q6zxezEjz4ElLaXgBitayQTfX0mpW
         ZDuchmLJjtrzC/EnOU7o6WGvr7u2BFC9VK72vqItAFiqoxLheVWSyOZBcsJ4+IYCpayL
         kc6BgkvrKWU4RZeLM0jrem84B6EKNHkEMdNiG4g+GuA13bOYm0M45/SWQeMHhG55TKS8
         2HZIGBn1nrUfvdgFwl8QMb4NtkDSXmlbaRwAPJzpwOiVs48vedSM4zRKm7oYeUpwrQmA
         Anv1towlYXo1ypwCsBxpSsRQ0ncrPh8PdfUxr62O5uau19HzmwYtugS0PTj1RaneMnDc
         xELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793740238; x=1794345038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oibzb0WyOnXCVqHk/JQbkuYKg2Gn7hJGWFHttlYByP8=;
        b=x3or8J1gvwWZ+ySBaq8fLLg2f/R40dxrDnhnvVIHIcw7kHcvkE7RCZjxvl8dqPJ4Sl
         ojm995bufdr7vv9K0xynxWwnI1OOeyUWXRzTmm+IIN68un0zyujNgCu0VxMyNAT33CoV
         c7GcBgxqW3hA2T39degM8d3jjVXvGyI1XRaN1BdlUTfIkC1+ARJfxOIxH2iWtGY3WfzN
         K2KGWugqgYFOUWMsQskiVgteORusLPtTHiEHSfl7YHRarjLkseFwj53d/pChrsftD7w3
         4Lrzw9aW8eMUhrp8hIoQrcaNb7zJrWh9m9VtjzmQ6ZaeZ3srfUUE4AEOX5aE2WJiEnD4
         O/4Q==
X-Gm-Message-State: APuU4Z9gge02DMxdGs4NWf3s89h/Z2mpXtM/QWL7O6f8qr/5tuylcBvK
	AwfqueZ3ciyi5Bgtp/w6LY9VYTu71Rl2iXa6p+iutDvdeAik5pgOAJvRKfR6MRkjeZwsxsjYMrO
	gfv0R+4mMCUk2IfDA68GYbdov4dCk+J8z5t1Db6ip4/f6fJI1squF
X-Gm-Gg: AYBFou2CwcJav/mYRTBBwtEJ8lpHuZ3/iG7enKXAYhQpGoIqh68gCROGVw0ZrXFEeHR
	Lru0Fg0PhW3UDp+30hnkEvK5wuH1h48LbBNDZ2ZoyzFQKVJSbmFxg5PjJoMrgo8EGqQH3VNLRhr
	Pp6ICoICckkhcLceSVEfstsYk6yvSnIW5ATElLfthjyhMyH1Php+BeUh2LFK49s+8n0FBCynuuK
	yBY4wEmNzVlwvBa3yRsoRfinbGHnJ7MGPGxAwu1ZE1RIh+VI+vxqJh38k/6Nlho7tVFu/TxrTYR
	oOO2DvK2dO7zReh8aKH9M9WGlu9FuuQnyChJeroibzq+Z0DkZH3LEi9QJDWKll0PAmxE6b1pNUL
	o+2ut07dt7HeVIoCQWA==
X-Received: by 2002:a7b:ce0d:0:b0:4a1:715d:1913 with SMTP id 5b1f17b1804b1-4ac177538c5mr250973225e9.1.1793740238406;
        Tue, 03 Nov 2026 13:10:38 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-4b412a71624sm221415e9.2.2026.11.03.13.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:10:38 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [IPv6:2620:125:9025:23::204])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id E300F43622;
	Tue,  3 Nov 2026 14:10:36 -0700 (MST)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id E08F8E40437; Tue,  3 Nov 2026 14:10:36 -0700 (MST)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 2/4] io_uring/alloc_cache: mark cache success paths as likely
Date: Tue,  3 Nov 2026 14:10:29 -0700
Message-ID: <20261103211031.592745-3-csander@purestorage.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103211031.592745-1-csander@purestorage.com>
References: <20261103211031.592745-1-csander@purestorage.com>
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

The point of a struct io_alloc_cache is to serve allocations from the
cache to avoid a call to kmalloc(). Only very high queue depth workloads
require more concurrent allocations than the fixed-size io_alloc_caches
can provide. So mark the success paths in io_alloc_cache_get() and
io_alloc_cache_put() as likely.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 io_uring/alloc_cache.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/io_uring/alloc_cache.h b/io_uring/alloc_cache.h
index 962b6e2d04cc..aa007b380f1b 100644
--- a/io_uring/alloc_cache.h
+++ b/io_uring/alloc_cache.h
@@ -19,22 +19,22 @@ bool io_alloc_cache_init(struct io_alloc_cache *cache,
 void *io_cache_alloc_new(struct io_alloc_cache *cache, gfp_t gfp);
 
 static inline bool io_alloc_cache_put(struct io_alloc_cache *cache,
 				      void *entry)
 {
-	if (cache->nr_cached < cache->max_cached) {
+	if (likely(cache->nr_cached < cache->max_cached)) {
 		if (!kasan_mempool_poison_object(entry))
 			return false;
 		cache->entries[cache->nr_cached++] = entry;
 		return true;
 	}
 	return false;
 }
 
 static inline void *io_alloc_cache_get(struct io_alloc_cache *cache)
 {
-	if (cache->nr_cached) {
+	if (likely(cache->nr_cached)) {
 		void *entry = cache->entries[--cache->nr_cached];
 
 		/*
 		 * If KASAN is enabled, always clear the initial bytes that
 		 * must be zeroed post alloc, in case any of them overlap
-- 
2.56.0

