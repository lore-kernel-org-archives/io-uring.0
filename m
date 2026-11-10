Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316814;
	b=Wq+2EX8j/oSuqncLaSZ8EJOAYNJseKClePB0SVMFKaGfPFsu8++qWRx7QdP0WqyO6KBV
	 hVDH+yOCm/4m5eCgHAPYSbpMBE5SpK9TUZMMQx6ZxiXAF0bIm3RmtRXVBEaQmxCOF3BNO
	 n51f/kJ+z6Ap5F9q03aqYgbskrnFio6nBTJgdfRocd/vIEbsnv5SxB4ZNeHQTZyEU2fUw
	 mhcSg6b0IHAh3Yk/C59z3ht9N2BEnSDQoQ2BFOpNBA1np+jdkiT+PXsFjfroWTC8cYibz
	 COkrdOUtbaFUTNLj5vXbU8wEIRWyu9aMhBdc/JEMN3/1fbunSFwjMvIHLu7pGvaN3Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316814;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=V3SupQCUvShL5hemamw4OCFifD8mbsdvbkYgJ4KaD9g=;
	b=wiyX7huDcGkqdRk8YRq4C9nkY7k0+sXaZuwL0qkw8jtTqzTcHPtkk/4+GUINEVPXJZr6
	 it+TWFUZyVTa2KbJIB2QM/rRoIqX62ZJug94WHP5htfr8V2U7Jlodwibh9HiYfEaUYMhv
	 w3ZDGfWbQ0znegBsivx3ihqSgL/RuNNKAmLa3rwcZpsCrypOnl474Bw3G92ZeLdo/dYZT
	 R/rd/X8q84EWKrubMtfrF/gAFQzchnTnyuYfeJoQ1w7zqSOaGfGMbrwqJeTbBUDsKtxFT
	 UuckU8NmGCvJTb6DncYGitSTlxR2+kaftK5bCLl4vM/8QBTDVkGifaqgoLSizfBHpCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GFm5GsrD;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XGdwYZQo;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E4E606A7DA
	for <io-uring@vger.kernel.org>; Tue, 10 Nov 2026 13:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22E4E606A7DA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GFm5GsrD;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XGdwYZQo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794316813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V3SupQCUvShL5hemamw4OCFifD8mbsdvbkYgJ4KaD9g=;
	b=GFm5GsrD0V3kXHhJ0OXQsxrygYTq4qc0M+jDg7A5bKirZl5cRdJ8YLriU+rcSHIWAEVmPJ
	Wub84PdsnaQ5gC4Jxza4w28YJPPdOf49AndsFpLHnDyLp4RPW954VAE7G7LJCex1cqXyeg
	ks/rwgWO+gMl2g7uw6JM8zXafNydQs0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-cM2vqQ2aPfiGJiSgEkabWw-1; Tue, 10 Nov 2026 08:20:11 -0500
X-MC-Unique: cM2vqQ2aPfiGJiSgEkabWw-1
X-Mimecast-MFC-AGG-ID: cM2vqQ2aPfiGJiSgEkabWw_1794316810
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c3613c35145so227303266b.3
        for <io-uring@vger.kernel.org>; Tue, 10 Nov 2026 05:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794316810; x=1794921610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V3SupQCUvShL5hemamw4OCFifD8mbsdvbkYgJ4KaD9g=;
        b=XGdwYZQoAXgJGr1dovvHtrSPdPG4lxeKUgqjap58HUwSQrVpQjE/cpavmV8xcLhZY3
         vo74pdLgNB0GlB61R+HwDi1wSH3KO9pnJOOkWb2QFEIvr6Wx3dhLIWae7jL09Wz/vrZv
         GARdMwEAEF2TkzBI35F+vSMd12MOaed68bKRtw9w58+TPSuqDBLSlQbucvOVUSiKJy+j
         bUUU+a34JxJC/K7KTj2GYgeLEUFfFtWFZmny809Imfc8X66J89bcAqnVv09fMNhaZp+G
         RdsNU0hpSWW62rlSZK5v9yxylI52twwE2/2+ueO9foY+OP1Bfc+BUVZHVYPFBSZ+KR+w
         FAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316810; x=1794921610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V3SupQCUvShL5hemamw4OCFifD8mbsdvbkYgJ4KaD9g=;
        b=d1j992Zo1T6lSPwGAisjFBvoV+5js74necSQDOrLGyu1Xk2zmyGOte79zdnwwkF1d0
         Ph/DbF4MGpB1e1vsY2pwKdN0LSKRkEphrnNKIpV/Aic3cEv12VWhNAVcNUzC+TREGZk/
         FX8j11OBFD2/Uvcvb1OI5dP4h7H2qqqtbeFu77GXklyyoNBqhrqAxejBXxVZ/jJ9przq
         tiYt5NeKvloAeq3cvf+1GauZaru8oyWe0XL3fQYYg9m2In2+4FANW5GV+Q91BFvYNhgL
         ywxyGwuZfwZpJ/czTgGS6IyspxfnV69Hmg9/D3VFz7YgJL+7iEWElmF218VccnEyIDIX
         5e2w==
X-Forwarded-Encrypted: i=1; AL+hErFJsiU4XlUiSRT8CH2W+1hq2WQUxoXpYZ3EYfHVPRYEXvwGh0n/jHC1xhC5S/+Oz9Bmrki5hk8VrA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+T4YGfE0JH+3sTegElT5t+AO3vjgrgFfJANJF43mCfo64kjiOl
	gMVvzbtX8CrEDsBeINuex/xRa79eqz4mmAorGt+BrN6sE+kJMG+yws+dNPwhgCBgOE92oJgwaBN
	S4ClfBJo0hu9NcI+ctlNqp085Ysk7LhEb9co3D3MZLLmq+KUveusXaQ7PwsgS
X-Gm-Gg: AYBFou3sMsPsIIUkCPvktnTuh8lXN0kyl32AK9sxyOTI+MWSIzGZ4VczJifcAftylX0
	X5Xt/pxzf1A4uF+/rlM/k2rzRj006ez241nX5RS5RGOxVP3iKE89N6bb9Spq4JN/vXFHPJpLJhL
	fs3gnr6p8pVUg/Vh6KDn/P++n0uDu/FElF7BY7vEBDxMWsQkOSvH3w+GqNMkB5GMatA3n6/yewq
	uEPfkgSPeLYO8OIDmbpBSjUKjp61JqgPHiywOTffmZYk4lRFv3YRVIbqLW6KY8ZZxIEUNCrRICa
	EJC834Bq8esu4ZS2imagdwukkEqZB+qmuv8Bd4l4x0PMDqkuGhNxJ1PnSnZac03ZBFp5XGBx/Ra
	6qi24uius+8mis7Q7QTOrKENEGveRTpUCr8aZ2fWCnO8udo8knzyGymbPk0cShuL6qAeAmtqsRQ
	5+K+XUn6hmIBbipN6aNrf+T68yTEw75YOCPulOiFrIrRidBg7pRUqvaY9+Y38WmTXyyIQxXNygN
	lVXBl5ZNipW+ii/NN8o1lb9mp++99gYIOUo4HaVZqfIc6Vk0+DM
X-Received: by 2002:a17:906:794f:b0:c49:a539:aa45 with SMTP id a640c23a62f3a-c50496b6556mr199670366b.42.1794316810129;
        Tue, 10 Nov 2026 05:20:10 -0800 (PST)
X-Received: by 2002:a17:906:794f:b0:c49:a539:aa45 with SMTP id a640c23a62f3a-c50496b6556mr199666066b.42.1794316809640;
        Tue, 10 Nov 2026 05:20:09 -0800 (PST)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a5d54bbsm107791166b.48.2026.11.10.05.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:20:09 -0800 (PST)
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
Subject: [RFC PATCH net-next 01/12] net: add an exclusive TCP receive claim
Date: Tue, 10 Nov 2026 13:19:55 +0000
Message-Id: <20261110132006.3280986-2-amarkuze@redhat.com>
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

The io_uring opaque object collector, added later in this series,
consumes the receive queue of a TCP socket through tcp_read_sock() with
its own actor. It reports stream offsets that count from the first byte
that was unread when it attached. If another reader consumes bytes while
the collector is attached, those offsets no longer match the data, and
the application selects the wrong ranges.

Add a receive owner to struct sock: a pointer to a struct sock_rx_owner
that names a tcp_read_sock() actor and its data. The owner is published
and cleared under the socket lock and sk_callback_lock. While an owner is
set:

- tcp_read_sock() and tcp_read_sock_noack() return -EBUSY unless the
  caller passes the owning actor and data. This also stops splice().
- tcp_recvmsg_locked(), tcp_zerocopy_receive() and tcp_read_skb() return
  -EBUSY.
- sk_wait_data() also returns when an owner appears. A reader that sleeps
  in tcp_recvmsg_locked() then stops with the bytes that it copied, or
  with -EBUSY. The claimant wakes sleeping readers after it publishes the
  owner.
- tcp_disconnect(), connect(AF_UNSPEC), tcp_set_ulp(), sk_psock_init()
  and TCP_REPAIR return -EBUSY, because each of them resets or takes
  over the receive sequence. TCP_REPAIR checks the owner before its
  permission check, so a caller without the permission also gets -EBUSY.
- sk_clone() starts the child socket without an owner.

CONFIG_SOCK_RX_OWNER is a hidden option that the io_uring feature
selects. Without it, struct sock does not change and the checks compile
away. With it, struct sock grows by one pointer. Each affected receive
path reads the pointer once with READ_ONCE(), and tcp_recvmsg_locked()
reads it once per loop iteration.

An optional data_ready callback notifies the owner independently of
ordinary TCP low-water readiness. TCP invokes it under the read side
of sk_callback_lock, which pins the owner and its data; the callback
must not sleep. With receive ownership disabled, the helper is empty.

This patch adds no user of the claim or callback.

Signed-off-by: Alex Markuze <amarkuze@redhat.com>
---
 include/linux/net.h  |  8 ++++++++
 include/net/sock.h   | 46 ++++++++++++++++++++++++++++++++++++++++++++
 net/Kconfig          |  7 +++++++
 net/core/skmsg.c     |  4 ++++
 net/core/sock.c      |  6 +++++-
 net/ipv4/af_inet.c   |  2 ++
 net/ipv4/tcp.c       | 22 ++++++++++++++++++++-
 net/ipv4/tcp_input.c |  1 +
 net/ipv4/tcp_ulp.c   |  2 ++
 9 files changed, 96 insertions(+), 2 deletions(-)

diff --git a/include/linux/net.h b/include/linux/net.h
index e2a866fbcfa5..d8fe1812e02b 100644
--- a/include/linux/net.h
+++ b/include/linux/net.h
@@ -230,6 +230,14 @@ struct sk_buff;
 struct proto_accept_arg;
 typedef int (*sk_read_actor_t)(read_descriptor_t *, struct sk_buff *,
 			       unsigned int, size_t);
+
+/* Published under socket and callback locks; controls the receive sequence. */
+struct sock_rx_owner {
+	sk_read_actor_t actor;
+	void *data;
+	/* TCP receive context, under sk_callback_lock: must not sleep. */
+	void (*data_ready)(struct sock *sk, void *data);
+};
 typedef int (*skb_read_actor_t)(struct sock *, struct sk_buff *);
 
 
diff --git a/include/net/sock.h b/include/net/sock.h
index 173b37b2b8bb..4da1796b3b8c 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -326,6 +326,7 @@ struct sk_filter;
   *	@sk_zckey: counter to order MSG_ZEROCOPY notifications
   *	@sk_socket: Identd and reporting IO signals
   *	@sk_user_data: RPC layer private data. Write-protected by @sk_callback_lock.
+  *	@sk_rx_owner: Exclusive receive owner under socket and callback locks.
   *	@sk_frag: cached page frag
   *	@sk_peek_off: current peek_offset value
   *	@sk_send_head: front of stuff to transmit
@@ -575,6 +576,9 @@ struct sock {
 	u8			sk_bpf_cb_flags;
 
 	void			*sk_user_data;
+#ifdef CONFIG_SOCK_RX_OWNER
+	struct sock_rx_owner	*sk_rx_owner;
+#endif
 #ifdef CONFIG_SECURITY
 	void			*sk_security;
 #endif
@@ -617,6 +621,48 @@ enum sk_pacing {
 	SK_PACING_FQ		= 2,
 };
 
+static inline bool sock_rx_owned(const struct sock *sk)
+{
+#ifdef CONFIG_SOCK_RX_OWNER
+	return unlikely(READ_ONCE(sk->sk_rx_owner));
+#else
+	return false;
+#endif
+}
+
+/*
+ * Notify the receive owner independently of ordinary socket low-water wakes.
+ * The callback lock pins both owner and data until the callback returns;
+ * publication and removal take its write side while owning the socket.
+ */
+static inline void sock_rx_owner_data_ready(struct sock *sk)
+{
+#ifdef CONFIG_SOCK_RX_OWNER
+	struct sock_rx_owner *owner;
+
+	if (!sock_rx_owned(sk))
+		return;
+	read_lock_bh(&sk->sk_callback_lock);
+	owner = sk->sk_rx_owner;
+	if (owner && owner->data_ready)
+		owner->data_ready(sk, owner->data);
+	read_unlock_bh(&sk->sk_callback_lock);
+#endif
+}
+
+static inline bool sock_rx_owner_conflict(const struct sock *sk,
+					  read_descriptor_t *desc,
+					  sk_read_actor_t actor)
+{
+#ifdef CONFIG_SOCK_RX_OWNER
+	const struct sock_rx_owner *owner = READ_ONCE(sk->sk_rx_owner);
+
+	return owner && (owner->actor != actor || owner->data != desc->arg.data);
+#else
+	return false;
+#endif
+}
+
 /* flag bits in sk_user_data
  *
  * - SK_USER_DATA_NOCOPY:      Pointer stored in sk_user_data might
diff --git a/net/Kconfig b/net/Kconfig
index 76ab44aa439a..6ece51ab26ba 100644
--- a/net/Kconfig
+++ b/net/Kconfig
@@ -26,6 +26,13 @@ menuconfig NET
 
 if NET
 
+config SOCK_RX_OWNER
+	bool
+	depends on INET
+	help
+	  Allow a TCP stream actor to claim exclusive receive sequence access.
+	  Receive paths reject competing readers while the claim is held.
+
 config WANT_COMPAT_NETLINK_MESSAGES
 	bool
 	help
diff --git a/net/core/skmsg.c b/net/core/skmsg.c
index df385a5a961e..5c753bcb808c 100644
--- a/net/core/skmsg.c
+++ b/net/core/skmsg.c
@@ -754,6 +754,10 @@ struct sk_psock *sk_psock_init(struct sock *sk, int node)
 
 	write_lock_bh(&sk->sk_callback_lock);
 
+	if (sock_rx_owned(sk)) {
+		psock = ERR_PTR(-EBUSY);
+		goto out;
+	}
 	if (sk_is_inet(sk) && inet_csk_has_ulp(sk)) {
 		psock = ERR_PTR(-EINVAL);
 		goto out;
diff --git a/net/core/sock.c b/net/core/sock.c
index e7405be8941f..3fcdc56e624e 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -2614,6 +2614,9 @@ struct sock *sk_clone(const struct sock *sk, const gfp_t priority,
 	 */
 	if (sk_user_data_is_nocopy(newsk))
 		newsk->sk_user_data = NULL;
+#ifdef CONFIG_SOCK_RX_OWNER
+	newsk->sk_rx_owner = NULL;
+#endif
 
 	newsk->sk_err	   = 0;
 	newsk->sk_err_soft = 0;
@@ -3389,7 +3392,8 @@ int sk_wait_data(struct sock *sk, long *timeo, const struct sk_buff *skb)
 
 	add_wait_queue(sk_sleep(sk), &wait);
 	sk_set_bit(SOCKWQ_ASYNC_WAITDATA, sk);
-	rc = sk_wait_event(sk, timeo, skb_peek_tail(&sk->sk_receive_queue) != skb, &wait);
+	rc = sk_wait_event(sk, timeo, sock_rx_owned(sk) ||
+			   skb_peek_tail(&sk->sk_receive_queue) != skb, &wait);
 	sk_clear_bit(SOCKWQ_ASYNC_WAITDATA, sk);
 	remove_wait_queue(sk_sleep(sk), &wait);
 	return rc;
diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
index 7677b0343abd..54c30a59bbce 100644
--- a/net/ipv4/af_inet.c
+++ b/net/ipv4/af_inet.c
@@ -649,6 +649,8 @@ int __inet_stream_connect(struct socket *sock, struct sockaddr_unsized *uaddr,
 			return -EINVAL;
 
 		if (uaddr->sa_family == AF_UNSPEC) {
+			if (sock_rx_owned(sk))
+				return -EBUSY;
 			sk->sk_disconnects++;
 			err = sk->sk_prot->disconnect(sk, flags);
 			sock->state = err ? SS_DISCONNECTING : SS_UNCONNECTED;
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index b9de7c302ba8..6de6ce153fda 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -1753,6 +1753,8 @@ out:
 int tcp_read_sock(struct sock *sk, read_descriptor_t *desc,
 		  sk_read_actor_t recv_actor)
 {
+	if (sock_rx_owner_conflict(sk, desc, recv_actor))
+		return -EBUSY;
 	return __tcp_read_sock(sk, desc, recv_actor, false,
 			       &tcp_sk(sk)->copied_seq);
 }
@@ -1762,6 +1764,8 @@ int tcp_read_sock_noack(struct sock *sk, read_descriptor_t *desc,
 			sk_read_actor_t recv_actor, bool noack,
 			u32 *copied_seq)
 {
+	if (sock_rx_owner_conflict(sk, desc, recv_actor))
+		return -EBUSY;
 	return __tcp_read_sock(sk, desc, recv_actor, noack, copied_seq);
 }
 
@@ -1770,6 +1774,8 @@ int tcp_read_skb(struct sock *sk, skb_read_actor_t recv_actor)
 	struct sk_buff *skb;
 	int copied = 0;
 
+	if (sock_rx_owned(sk))
+		return -EBUSY;
 	if (sk->sk_state == TCP_LISTEN)
 		return -ENOTCONN;
 
@@ -2224,6 +2230,8 @@ static int tcp_zerocopy_receive(struct sock *sk,
 
 	zc->copybuf_len = 0;
 	zc->msg_flags = 0;
+	if (sock_rx_owned(sk))
+		return -EBUSY;
 
 	if (address & (PAGE_SIZE - 1) || address != zc->address)
 		return -EINVAL;
@@ -2678,6 +2686,8 @@ static int tcp_recvmsg_locked(struct sock *sk, struct msghdr *msg, size_t len,
 	u32 peek_offset = 0;
 	u32 urg_hole = 0;
 
+	if (sock_rx_owned(sk))
+		return -EBUSY;
 	err = -ENOTCONN;
 	if (sk->sk_state == TCP_LISTEN)
 		goto out;
@@ -2717,6 +2727,11 @@ static int tcp_recvmsg_locked(struct sock *sk, struct msghdr *msg, size_t len,
 	do {
 		u32 offset;
 
+		/* Ownership may have changed while this reader slept for data. */
+		if (sock_rx_owned(sk)) {
+			copied = copied ?: -EBUSY;
+			break;
+		}
 		/* Are we at urgent data? Stop if we have read anything or have SIGURG pending. */
 		if (unlikely(tp->urg_data) && tp->urg_seq == *seq) {
 			if (copied)
@@ -3374,6 +3389,9 @@ int tcp_disconnect(struct sock *sk, int flags)
 	struct request_sock *req;
 	u32 seq;
 
+	if (sock_rx_owned(sk))
+		return -EBUSY;
+
 	if (old_state != TCP_CLOSE)
 		tcp_set_state(sk, TCP_CLOSE);
 
@@ -3988,7 +4006,9 @@ int do_tcp_setsockopt(struct sock *sk, int level, int optname,
 		break;
 
 	case TCP_REPAIR:
-		if (!tcp_can_repair_sock(sk))
+		if (sock_rx_owned(sk))
+			err = -EBUSY;
+		else if (!tcp_can_repair_sock(sk))
 			err = -EPERM;
 		else if (val == TCP_REPAIR_ON) {
 			tp->repair = 1;
diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index e1f2d9765f81..2d17fcdf73dd 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -5637,6 +5637,7 @@ err:
 
 void tcp_data_ready(struct sock *sk)
 {
+	sock_rx_owner_data_ready(sk);
 	if (tcp_epollin_ready(sk, sk->sk_rcvlowat) || sock_flag(sk, SOCK_DONE))
 		READ_ONCE(sk->sk_data_ready)(sk);
 }
diff --git a/net/ipv4/tcp_ulp.c b/net/ipv4/tcp_ulp.c
index b58045df101e..77abc21bcb63 100644
--- a/net/ipv4/tcp_ulp.c
+++ b/net/ipv4/tcp_ulp.c
@@ -164,6 +164,8 @@ int tcp_set_ulp(struct sock *sk, const char *name)
 
 	sock_owned_by_me(sk);
 
+	if (sock_rx_owned(sk))
+		return -EBUSY;
 	ulp_ops = __tcp_ulp_find_autoload(name);
 	if (!ulp_ops)
 		return -ENOENT;

base-commit: 4dd16e31135ea8437a720222df34e8745f385d6d
-- 
2.34.1

