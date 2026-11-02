Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661519;
	b=Wo+ohgFdH/xNWiP2woQUDHf6/qMjWGkAk7iaz//kuWFH1O54n8sxSR8U661Ld8H8mrnp
	 qHoJt5nlKmsyOThXihN3I3GYnK6HJPi9/vxAweNirAPZYh3SkzKVpZ87QxP5Wd5SHkWLl
	 dmCCBUtIPI5/ReYujE91pDD+BNubzuQqWTizWFoSw78lJaAC3UIE/OjII2ChSD4u/WzXP
	 kiEraqrBCJRoU1PoLX4oy6BNY0sElI48XCEvSGV/vxMZd0zI35kJeIYVnUp2wXA1GcXKu
	 /J6kFkRvTJGVb4Q0fuk0AYm1oAoLn7YkERIS9sT4Q1H79/Z1WgBsDt2emy0R6Zunz+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=HIwILub2EGFjALoUp1GBRriKxCJEOshWtUomayRw3+I=;
	b=OjLEOfuyscNLoKxbJFWBSCzcEkEryC6Qw4KbruQ/gSuv56l3ZMsX92ZeimM64nJA8JqM
	 rOXASi/kdU94p3N9OXJVQxvI/uP9UVHPCm3y30DC1aA9gxAtaVEgICm0XCLQ6608q6EKG
	 e2MwnVYA3lrucVUkdA84LxTpofyB9UO4Ehz/MvfZyYRzgRQEMaQsr74RRqP0ZCGSEdNLc
	 ctDz3mD4PePVUT/FHPTgKWKLXwrXMQtFCuBFAOvjxK/ftAlV9eTH7o0fKzzvuYVYxQhQ1
	 rDCZVgQzCbLGO8ykYtqBN0S+LWbVAkVoVdUtU7QZXKlokoKEfgMpj9JkkygmGREJAzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=liKXHOMz;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32BC606EE8F
	for <io-uring@vger.kernel.org>; Mon,  2 Nov 2026 23:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D32BC606EE8F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=liKXHOMz
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so8114774eec.1
        for <io-uring@vger.kernel.org>; Mon, 02 Nov 2026 15:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793661513; x=1794266313; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HIwILub2EGFjALoUp1GBRriKxCJEOshWtUomayRw3+I=;
        b=liKXHOMz2Lh6gz7+TEgc3ttSwzDDQ+viyU1jbOx7qHs9mjKf3z3Mg6u4T5DGUQVLCG
         37w31EiTKjFwFeXVXHCrplr9Ql0ryIEo5gyLvHz7oAqPWYGOIOXheyaK1kebsZ40NGDS
         QpaLubzcX7BKVarkeF3E0VCmC4DCKtGwq5r0cnqMPLoFPMrI8AisZ1xMBOIpCJ+F9vN0
         gytqQctkENTXwoFAWXYRszJ1R62RYzi5ra76ix7/lOzxObK+vua45DYRAHXzamAHU0f9
         eKd9YIDBCxPAudo8dXC9UBvp8ZfTYFtpcyHomB849krHVtBZUqKDvH28LnT7BLn/rCnu
         ZlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661513; x=1794266313;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HIwILub2EGFjALoUp1GBRriKxCJEOshWtUomayRw3+I=;
        b=W94MWO/q1qHrwkv+D2r2bLP0eWgQpvKXbtbEL8doZ9HvxzuaUQrmkIWAgkP3gP3JZ8
         wcv09ntgBgKIj9/esq40EhxeFqEeQrUsnfdtr9VnC04KGIaO7StkNy53N3Ur4pu/NyC1
         daGOFJq2EQfx64L0YTPpeDsO/ijI94xlFSDcG7mr+iLL7yMK/Sxss5gDbjNifQZdo0yE
         oryb2dAtGPid6LLDIO5JZEZlKbhdqQJYKVYdMFjS6q61qSVcedSKbX6/Z7ddA31qOkj9
         8qRDPcztfqYD/mHl6PrxUbLQNf293A7NoGuG4jlCsFcuy5QauKwhwzPkxfBEWPLyRNnV
         bPRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaQMrUK20teNiwwcj26SKCv6uv8Fv51vLuB+DcIut+f4m2xwacnSj93NbEn153Bym8iI17dcFuXw==@vger.kernel.org
X-Gm-Message-State: APuU4Z97KetJ5rclnbZ7ANBpnoWiRo6RA/XuZH7jNxRGyPbT9gNcqzIP
	lyk1z32E2O3NqJEyWEx0tvQak6nxKz4PBOuUGEO2FRWzsfJDoTvSscvAUnpo2y1qABpQw6+ncwV
	M8YPjguwk3ZNT2RpeZUnPZr94sQ==
X-Received: from dycng16.prod.google.com ([2002:a05:7300:ce10:b0:355:e5a8:715f])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:d511:b0:36a:373f:6e29 with SMTP id 5a478bee46e88-36a423312f0mr21552104eec.13.1793661512598;
 Mon, 02 Nov 2026 15:18:32 -0800 (PST)
Date: Mon,  2 Nov 2026 23:18:27 +0000
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
Message-ID: <20261102231827.4088254-5-almasrymina@google.com>
Subject: [PATCH net-next v2 4/4] net: prevent mixing frags from different
 memory providers or bindings
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

Enforce that all fragments in a nonlinear skb come from compatible
memory providers (and for devmem, the exact same binding):

- Add net_devmem_skb_binding() and use it in
  validate_xmit_unreadable_skb(), zerocopy_fill_skb_from_devmem(), and
  tcp_sendmsg_locked() so frags from different devmem bindings or memory
  providers cannot be mixed on TX.
- Use skb_frags_can_coalesce() across skb_try_coalesce(), skb_shift(),
  skb_gro_receive(), and skb_gro_receive_list().
- Use skb_mem_provider_compat() in tcp_skb_can_collapse(),
  tcp_skb_can_collapse_rx(), and inet_frag_queue_insert().
- Reject coalescing linear head payloads into unreadable skbs in
  skb_try_coalesce(), skb_gro_receive(), and
  tcp_can_coalesce_send_queue_head().

This issue is theoretical and was found by manual code inspection and
LLM review; it was not triggered in production. Verified with the
net_core KUnit test suite; not tested on real hardware.

Fixes: 65249feb6b3d ("net: add support for skbs with unreadable frags")
Fixes: bd61848900bf ("net: devmem: Implement TX path")
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 include/net/tcp.h        |  5 +++--
 net/core/datagram.c      |  4 ++--
 net/core/dev.c           | 14 ++++----------
 net/core/devmem.h        | 22 ++++++++++++++++++++++
 net/core/gro.c           | 16 ++++++----------
 net/core/net_test.c      | 24 +++++++++++++++++++++---
 net/core/skbuff.c        | 25 ++++++++++---------------
 net/ipv4/inet_fragment.c |  3 +++
 net/ipv4/tcp.c           |  2 +-
 net/ipv4/tcp_output.c    |  3 +++
 10 files changed, 75 insertions(+), 43 deletions(-)

diff --git a/include/net/tcp.h b/include/net/tcp.h
index 3560adddf8215..07a222c0fe2d7 100644
--- a/include/net/tcp.h
+++ b/include/net/tcp.h
@@ -1268,14 +1268,15 @@ static inline bool tcp_skb_can_collapse(const struct sk_buff *to,
 		      mptcp_skb_can_collapse(to, from) &&
 		      !skb_cmp_decrypted(to, from) &&
 		      skb_pure_zcopy_same(to, from) &&
-		      skb_frags_readable(to) == skb_frags_readable(from));
+		      skb_mem_provider_compat(to, from));
 }
 
 static inline bool tcp_skb_can_collapse_rx(const struct sk_buff *to,
 					   const struct sk_buff *from)
 {
 	return likely(mptcp_skb_can_collapse(to, from) &&
-		      !skb_cmp_decrypted(to, from));
+		      !skb_cmp_decrypted(to, from) &&
+		      skb_mem_provider_compat(to, from));
 }
 
 /* Events passed to congestion control interface */
diff --git a/net/core/datagram.c b/net/core/datagram.c
index ecc30a6f83023..1e7db61e25a56 100644
--- a/net/core/datagram.c
+++ b/net/core/datagram.c
@@ -712,8 +712,8 @@ zerocopy_fill_skb_from_devmem(struct sk_buff *skb, struct iov_iter *from,
 	size_t virt_addr, size, off;
 	struct net_iov *niov;
 
-	if (i && skb_frags_readable(skb))
-		return -EFAULT;
+	if (skb->len && net_devmem_skb_binding(skb) != binding)
+		return -EMSGSIZE;
 
 	/* Devmem filling works by taking an IOVEC from the user where the
 	 * iov_addrs are interpreted as an offset in bytes into the dma-buf to
diff --git a/net/core/dev.c b/net/core/dev.c
index 3ac700d37e596..c1ea3b26a5a11 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -4169,8 +4169,7 @@ static struct sk_buff *sk_validate_xmit_skb(struct sk_buff *skb,
 static struct sk_buff *validate_xmit_unreadable_skb(struct sk_buff *skb,
 						    struct net_device *dev)
 {
-	struct skb_shared_info *shinfo;
-	struct net_iov *niov;
+	struct net_devmem_dmabuf_binding *binding;
 
 	if (likely(skb_frags_readable(skb) ||
 		   dev->netmem_tx == NETMEM_TX_NO_DMA))
@@ -4179,14 +4178,9 @@ static struct sk_buff *validate_xmit_unreadable_skb(struct sk_buff *skb,
 	if (dev->netmem_tx == NETMEM_TX_NONE)
 		goto out_free;
 
-	shinfo = skb_shinfo(skb);
-
-	if (shinfo->nr_frags > 0) {
-		niov = netmem_to_net_iov(skb_frag_netmem(&shinfo->frags[0]));
-		if (net_is_devmem_iov(niov) &&
-		    READ_ONCE(net_devmem_iov_binding(niov)->dev) != dev)
-			goto out_free;
-	}
+	binding = net_devmem_skb_binding(skb);
+	if (binding && READ_ONCE(binding->dev) != dev)
+		goto out_free;
 
 out:
 	return skb;
diff --git a/net/core/devmem.h b/net/core/devmem.h
index 942b8caf36e99..90058d7350820 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -10,6 +10,7 @@
 #ifndef _NET_DEVMEM_H
 #define _NET_DEVMEM_H
 
+#include <linux/skbuff.h>
 #include <net/net_namespace.h>
 #include <net/netmem.h>
 #include <net/netdev_netlink.h>
@@ -105,6 +106,21 @@ net_devmem_iov_binding(const struct net_iov *niov)
 	return niov->mp_priv;
 }
 
+static inline struct net_devmem_dmabuf_binding *
+net_devmem_skb_binding(const struct sk_buff *skb)
+{
+	struct net_iov *niov;
+
+	if (!skb_has_net_iovs(skb) || !skb_shinfo(skb)->nr_frags)
+		return NULL;
+
+	niov = netmem_to_net_iov(skb_frag_netmem(&skb_shinfo(skb)->frags[0]));
+	if (!net_is_devmem_iov(niov))
+		return NULL;
+
+	return net_devmem_iov_binding(niov);
+}
+
 static inline u32 net_devmem_iov_binding_id(const struct net_iov *niov)
 {
 	return net_devmem_iov_binding(niov)->id;
@@ -222,6 +238,12 @@ net_devmem_iov_binding(const struct net_iov *niov)
 {
 	return NULL;
 }
+
+static inline struct net_devmem_dmabuf_binding *
+net_devmem_skb_binding(const struct sk_buff *skb)
+{
+	return NULL;
+}
 #endif
 
 #endif /* _NET_DEVMEM_H */
diff --git a/net/core/gro.c b/net/core/gro.c
index 1b033855a20db..62b8d532218e5 100644
--- a/net/core/gro.c
+++ b/net/core/gro.c
@@ -100,16 +100,7 @@ int skb_gro_receive(struct sk_buff *p, struct sk_buff *skb)
 	struct sk_buff *lp;
 	int segs;
 
-	/* Do not splice page pool based packets w/ non-page pool
-	 * packets. This can result in reference count issues as page
-	 * pool pages will not decrement the reference count and will
-	 * instead be immediately returned to the pool or have frag
-	 * count decremented.
-	 */
-	if (p->pp_recycle != skb->pp_recycle)
-		return -ETOOMANYREFS;
-
-	if (skb_zcopy(p) || skb_zcopy(skb))
+	if (!skb_frags_can_coalesce(p, skb))
 		return -ETOOMANYREFS;
 
 	if (unlikely(p->len + len >= netif_get_gro_max_size(p->dev, p) ||
@@ -158,6 +149,8 @@ int skb_gro_receive(struct sk_buff *p, struct sk_buff *skb)
 
 		NAPI_GRO_CB(skb)->free = NAPI_GRO_FREE;
 		goto done;
+	} else if (!skb_frags_readable(skb)) {
+		return -ETOOMANYREFS;
 	} else if (skb->head_frag) {
 		int nr_frags = pinfo->nr_frags;
 		skb_frag_t *frag = pinfo->frags + nr_frags;
@@ -233,6 +226,9 @@ int skb_gro_receive(struct sk_buff *p, struct sk_buff *skb)
 
 int skb_gro_receive_list(struct sk_buff *p, struct sk_buff *skb)
 {
+	if (!skb_frags_can_coalesce(p, skb))
+		return -ETOOMANYREFS;
+
 	/* make sure to check flush flag and to not merge */
 	if (unlikely(p->len + skb->len >= 65536 ||
 		     NAPI_GRO_CB(skb)->flush))
diff --git a/net/core/net_test.c b/net/core/net_test.c
index 63124dbf3c9a8..99b664fc9186a 100644
--- a/net/core/net_test.c
+++ b/net/core/net_test.c
@@ -1485,7 +1485,7 @@ static void netmem_ref_test_try_coalesce(struct kunit *test)
 	};
 	struct sk_buff *to, *from, *clone;
 	struct net_devmem_dmabuf_binding binding = {};
-	struct net_iov niov = {};
+	struct net_iov niov = {}, niov2 = {};
 	struct page *pp_page, *reg_page;
 	netmem_ref pp_nm, niov_nm;
 	struct page_pool *pool;
@@ -1578,9 +1578,7 @@ static void netmem_ref_test_try_coalesce(struct kunit *test)
 	from = alloc_skb(0, GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, to);
 	KUNIT_ASSERT_NOT_NULL(test, from);
-	skb_put(to, skb_tailroom(to));
 	to->pp_recycle = 1;
-	to->unreadable = 1;
 	from->pp_recycle = 1;
 	skb_add_rx_frag_netmem(from, 0, niov_nm, 0, 64, PAGE_SIZE);
 	napi_pp_get_page(niov_nm);
@@ -1589,6 +1587,7 @@ static void netmem_ref_test_try_coalesce(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, clone);
 	KUNIT_EXPECT_TRUE(test, skb_try_coalesce(to, from, &fragstolen,
 						 &delta));
+	KUNIT_EXPECT_TRUE(test, to->unreadable);
 	KUNIT_EXPECT_EQ(test, atomic_long_read(&niov.desc.pp_ref_count), 4L);
 	KUNIT_EXPECT_EQ(test, atomic_long_read(&binding.ref.data->count),
 			base_iov_ref);
@@ -1597,6 +1596,25 @@ static void netmem_ref_test_try_coalesce(struct kunit *test)
 	consume_skb(to);
 	KUNIT_EXPECT_EQ(test, atomic_long_read(&niov.desc.pp_ref_count), 2L);
 
+	/* 4. Reject coalescing net_iov skbs from different bindings. */
+	net_iov_init(&niov2, &binding.area, NET_IOV_DMABUF, &niov2);
+	to = alloc_skb(0, GFP_KERNEL);
+	from = alloc_skb(0, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, to);
+	KUNIT_ASSERT_NOT_NULL(test, from);
+	to->pp_recycle = 1;
+	from->pp_recycle = 1;
+	skb_add_rx_frag_netmem(to, 0, niov_nm, 0, 32, PAGE_SIZE);
+	napi_pp_get_page(niov_nm);
+	skb_add_rx_frag_netmem(from, 0, net_iov_to_netmem(&niov2), 0, 32,
+			       PAGE_SIZE);
+	KUNIT_EXPECT_FALSE(test, skb_try_coalesce(to, from, &fragstolen,
+						  &delta));
+	skb_shinfo(from)->nr_frags = 0;
+	consume_skb(from);
+	consume_skb(to);
+	KUNIT_EXPECT_EQ(test, atomic_long_read(&niov.desc.pp_ref_count), 2L);
+
 	page_pool_put_full_page(pool, pp_page, false);
 	page_pool_put_full_page(pool, pp_page, false);
 	__free_page(reg_page);
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index dc761ceb4d204..c588ae785f337 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -4342,10 +4342,9 @@ int skb_shift(struct sk_buff *tgt, struct sk_buff *skb, int shiftlen)
 
 	if (skb_headlen(skb))
 		return 0;
-	if (skb_zcopy(tgt) || skb_zcopy(skb))
+	if (!skb_frags_can_coalesce(tgt, skb))
 		return 0;
 
-	DEBUG_NET_WARN_ON_ONCE(tgt->pp_recycle != skb->pp_recycle);
 	DEBUG_NET_WARN_ON_ONCE(skb_cmp_decrypted(tgt, skb));
 
 	todo = shiftlen;
@@ -6301,17 +6300,8 @@ bool skb_try_coalesce(struct sk_buff *to, struct sk_buff *from,
 	 * tricky (due to potential race with the clone disappearing) and
 	 * rare, so not worth dealing with.
 	 */
-	if (to->pp_recycle != from->pp_recycle)
-		return false;
-
-	/* All frags in an skb must either all be struct page-backed or all
-	 * belong to the same memory provider instance; do not coalesce skbs
-	 * that would mix them.
-	 */
-	if (skb_frags_readable(from) != skb_frags_readable(to))
-		return false;
-
-	if (len <= skb_tailroom(to) && skb_frags_readable(from)) {
+	if (len <= skb_tailroom(to) && to->pp_recycle == from->pp_recycle &&
+	    skb_frags_readable(to) && skb_frags_readable(from)) {
 		if (len) {
 			if (unlikely(skb_copy_bits(from, 0,
 						   skb_tail_pointer(to),
@@ -6325,17 +6315,21 @@ bool skb_try_coalesce(struct sk_buff *to, struct sk_buff *from,
 		return true;
 	}
 
+	if (!skb_frags_can_coalesce(to, from))
+		return false;
+
 	to_shinfo = skb_shinfo(to);
 	from_shinfo = skb_shinfo(from);
 	if (to_shinfo->frag_list || from_shinfo->frag_list)
 		return false;
-	if (skb_zcopy(to) || skb_zcopy(from))
-		return false;
 
 	if (skb_headlen(from) != 0) {
 		struct page *page;
 		unsigned int offset;
 
+		if (!skb_frags_readable(from))
+			return false;
+
 		if (to_shinfo->nr_frags +
 		    from_shinfo->nr_frags >= MAX_SKB_FRAGS)
 			return false;
@@ -6367,6 +6361,7 @@ bool skb_try_coalesce(struct sk_buff *to, struct sk_buff *from,
 	to_shinfo->nr_frags += from_shinfo->nr_frags;
 	if (from_shinfo->nr_frags)
 		to_shinfo->flags |= from_shinfo->flags & SKBFL_SHARED_FRAG;
+	to->unreadable |= from->unreadable;
 
 	if (!skb_cloned(from))
 		from_shinfo->nr_frags = 0;
diff --git a/net/ipv4/inet_fragment.c b/net/ipv4/inet_fragment.c
index c18da91c1f031..a018ce6cf34ff 100644
--- a/net/ipv4/inet_fragment.c
+++ b/net/ipv4/inet_fragment.c
@@ -451,6 +451,9 @@ int inet_frag_queue_insert(struct inet_frag_queue *q, struct sk_buff *skb,
 	 * that reach the reassembled skb, whose head keeps the first
 	 * fragment's shinfo and whose frag_list is not GRO-shaped.
 	 */
+	if (last && !skb_mem_provider_compat(last, skb))
+		return IPFRAG_OVERLAP;
+
 	skb_gso_reset(skb);
 
 	/* RFC5722, Section 4, amended by Errata ID : 3089
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index b9de7c302ba83..67651b1936a8d 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -1251,7 +1251,7 @@ int tcp_sendmsg_locked(struct sock *sk, struct msghdr *msg, size_t size)
 		trace_tcp_sendmsg_locked(sk, msg, skb, size_goal);
 
 		if (copy <= 0 || !tcp_skb_can_collapse_to(skb) ||
-		    unlikely(skb_frags_readable(skb) != !binding)) {
+		    unlikely(net_devmem_skb_binding(skb) != binding)) {
 			bool first_skb;
 
 new_segment:
diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
index cf3ddc055d48d..110dd1c775eb5 100644
--- a/net/ipv4/tcp_output.c
+++ b/net/ipv4/tcp_output.c
@@ -2657,6 +2657,9 @@ static bool tcp_can_coalesce_send_queue_head(struct sock *sk, int len)
 
 	skb = tcp_send_head(sk);
 	tcp_for_write_queue_from_safe(skb, next, sk) {
+		if (!skb_frags_readable(skb))
+			return false;
+
 		if (len <= skb->len)
 			break;
 
-- 
2.56.0.385.gac671c819a-goog

