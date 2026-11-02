Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661513;
	b=W1G3y0HW8CApJbx8lWbfwgzSOaTRCWiJnIhrKuBL29BDh3NHox5ApLpxu5FnCxJ77t2d
	 tFPkxamF/ncTPUTfFr8J7c8aznMlPXJxVydHEMsNwN3dsYVr8xf6LiWdX3xo8Ek0rJssG
	 6x4/huLN5RCKSNty6wRmq3IK5dqUuspUNjTVEQkaWJN+MTVg1UJokYkctX/NbrcMc8DIg
	 jvfPSN0EhVrkBNxEZVBL+OCseK+VCZJfBt5Cf5QRUSpAdE4xivUm8XZUC8dpNwHcjcUIH
	 Wgo/gs108bO2IX3wiWIV3eS1A/PEO6dqKQgZP4TA6NBz6Mz4g2WCjKMuzEPcT9Np7kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=5TT2AIuupqWW5FOG53PCXTePoASiJPweV86w5yPpgrs=;
	b=tTUe2uTzMkhQuR4xNdtpN76j2KNO0p9hijyQhbnuw/czi60k5PDUgO26Nw9Z+2VLvJUg
	 AGW159bpIDKyfDtaGIyf5PjLHy/BxtecOMxlwQG+1zfkriosBpGLPbLXovOHnjjphWA5D
	 AGDW/3fp6cmjxV2GdfBnS3km0+Y/chZKOLWxvJ/8aE5+5zGM3k34jSpkwQB70cf8u4+yh
	 aGrgX7ODT/gKhIO8MC3jgX9nJqysWqvS8TY6ZRqSAefx3DmHONcE7avTFo8xO5Euqq+TC
	 qJ038asut4LRiwboxhvbfGz9r14UDS1LWGngrh1Ok3NWzC7wcjAo3B+rmfnvWtlJGsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oATVqC1Q;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2F7606D82E
	for <io-uring@vger.kernel.org>; Mon,  2 Nov 2026 23:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA2F7606D82E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oATVqC1Q
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a190c53a3so241859eec.0
        for <io-uring@vger.kernel.org>; Mon, 02 Nov 2026 15:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793661512; x=1794266312; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5TT2AIuupqWW5FOG53PCXTePoASiJPweV86w5yPpgrs=;
        b=oATVqC1QMEhoI1Ulhlhe3jyucxLPgzRzsyYEmjqj0Amsi21VsqaIjvDWIauH+hARoz
         haFOyPWMMrYnf0DRj19xNJ3iTIkUQnxcvKb7/boh58eEGckWLl0VU2h+WOzajFHa6mPC
         QeKdx/Y+7tY2xrxHCAUBS++U0Qqa5Y2/MpXYSnbyDdVai6CHPN5TgGC/B8cEUDVTBA/n
         B8dQatK7uCK1iUghwh3o9+LhzSJms81Z1OL8/RgNyDmIRhcU/TfWGtMPjLK+YU5FhKka
         HTmgXzadUIoTz0QdESEM9rIt0RncoHSpG/nLuXemsij9dPoIIc1UW7A0Cg6+8lktVtm5
         W4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661512; x=1794266312;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5TT2AIuupqWW5FOG53PCXTePoASiJPweV86w5yPpgrs=;
        b=t7Cm86975pUrbVdmokJxNhnmFfgdnr1+4fddWlZqw7ys8WBNjbJ2/nCzVCV/wDR1lM
         +I9LeuRqwArTVpdVIPfS77aGINwguVY0BSFNWiRFDPYguH/2OXGBW6QAb6F1K2HIcodY
         Galq/QcHmWy0TOmHNOEQmTkAeLaf8igQrH2z7bZwLjBfJVMilkTiYHgmwbMlERS+uwwB
         qmMEm2pCnsRdc4z7nzqZ4C0KkT2+pCA6EXym3sG5WvG/EysJjcgbFmSl59XlaAas3I85
         HxUXTD7OCYWAaG8KjsafmPsEmKA8ew5I2VY+3GCfl+qmGy1/UspMRgkA2KsaWrMr+BzM
         LgiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeu2XAGN+oZGtnGaEurZ7NKaarxM4OzKxYKRGF4keXoHsg3tpQmHOv4P98gtHElF9K7AR0bS6Ayg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0NNpq7ELYESIZq07GEnph/azXSeGpRRTBlLc0bdoZJfIj/ufu
	Ms5aCx0sqYv5JPeZXgQsiXRevlBvlEdHyGIS3kgOk02dDXR4/X7Dn/BQ+D0A8uqXBnAA6S1m74f
	MRER9zZPRAdYOxnJR8Gy97d6Bng==
X-Received: from dlaj6.prod.google.com ([2002:a05:701b:2806:b0:1ac:f9af:14c])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:b889:b0:195:8fa1:b447 with SMTP id a92af1059eb24-1a9494d8f22mr20542156c88.12.1793661511373;
 Mon, 02 Nov 2026 15:18:31 -0800 (PST)
Date: Mon,  2 Nov 2026 23:18:26 +0000
In-Reply-To: <20261102231827.4088254-1-almasrymina@google.com>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261102231827.4088254-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102231827.4088254-4-almasrymina@google.com>
Subject: [PATCH net-next v2 3/4] net: add skb_frags_can_coalesce() helper
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, Willem de Bruijn <willemb@google.com>, Eric Dumazet <edumazet@kernel.org>, 
	Mina Almasry <almasrymina@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>, io-uring@vger.kernel.org, 
	Stanislav Fomichev <sdf@fomichev.me>, Paolo Abeni <pabeni@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Add skb_has_net_iovs(skb), assuming skb->unreadable and net_iov-backed
frags are equivalent for now (with a comment noting the two can be
decoupled in the future if readable net_iovs are introduced).

Also add skb_mem_provider_compat() and skb_frags_can_coalesce() so all
multi-skb coalescing, shifting, and GRO paths can share a single check
across pp_recycle, skb_zcopy(), and fragment memory providers:
- empty 0-length skbs are compatible without mixing readable payload
- page vs net_iov is rejected via skb_has_net_iovs() (0 pointer chases)
- page vs page is allowed via !skb_has_net_iovs() (0 pointer chases)
- net_iov vs net_iov compares mp_priv (walking frag_list if nr_frags is 0)

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 include/linux/skbuff.h | 58 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 6787fcf6ac3e4..1e6e919c656d5 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -1882,6 +1882,16 @@ static inline bool skb_frags_readable(const struct sk_buff *skb)
 	return !skb->unreadable;
 }
 
+/* Return true if frags in this skb are backed by net_iovs.
+ * Assumes skb->unreadable and net_iov-backed frags are equivalent for now;
+ * the two can be decoupled in the future if readable net_iovs in skbs are
+ * introduced.
+ */
+static inline bool skb_has_net_iovs(const struct sk_buff *skb)
+{
+	return skb->unreadable;
+}
+
 static inline void skb_mark_not_on_list(struct sk_buff *skb)
 {
 	skb->next = NULL;
@@ -3763,6 +3773,54 @@ static inline void *skb_frag_address(const skb_frag_t *frag)
 	return page_address(skb_frag_page(frag)) + skb_frag_off(frag);
 }
 
+static inline void *skb_mem_provider_priv(const struct sk_buff *skb)
+{
+	netmem_ref netmem;
+
+	if (!skb_has_net_iovs(skb) || !skb_shinfo(skb)->nr_frags)
+		return NULL;
+
+	netmem = skb_frag_netmem(&skb_shinfo(skb)->frags[0]);
+	return netmem_to_net_iov(netmem)->mp_priv;
+}
+
+/* Return true if the memory providers of @skb1 and @skb2 are compatible
+ * for coalescing. For any struct page-backed provider (the buddy allocator
+ * or a future provider handing out struct pages), coalescing is assumed
+ * feasible. For net_iov-backed providers, the exact mp_priv pointer must
+ * match.
+ */
+static inline bool skb_mem_provider_compat(const struct sk_buff *skb1,
+					   const struct sk_buff *skb2)
+{
+	void *priv1, *priv2;
+
+	if (!skb1->len || !skb2->len)
+		return true;
+
+	if (skb_has_net_iovs(skb1) != skb_has_net_iovs(skb2))
+		return false;
+
+	if (!skb_has_net_iovs(skb1))
+		return true;
+
+	priv1 = skb_mem_provider_priv(skb1);
+	priv2 = skb_mem_provider_priv(skb2);
+	return priv1 && priv1 == priv2;
+}
+
+static inline bool skb_frags_can_coalesce(struct sk_buff *to,
+					  struct sk_buff *from)
+{
+	if (to->pp_recycle != from->pp_recycle)
+		return false;
+
+	if (skb_zcopy(to) || skb_zcopy(from))
+		return false;
+
+	return skb_mem_provider_compat(to, from);
+}
+
 /**
  * skb_frag_address_safe - gets the address of the data contained in a paged fragment
  * @frag: the paged fragment buffer
-- 
2.56.0.385.gac671c819a-goog

