Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2C3311C2F;
	Mon, 16 Feb 2026 16:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.104.135.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771257860; cv=none; b=D1Tk5QvWGXn6U388YHuxE94SfoPUsmXOuNP7n5buLS4IqdJ0PwtNAGnl8YL4rwDQqT1AwQrPZnOQ77rYoEml0vB6PZl0B5uVjL5yRNh0AA1QuAYBimSjQm7rnGtnO34GJ6iVMljCZ7cM/B5wKUdkFQlesWkaKdEVwGHgII1xzsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771257860; c=relaxed/simple;
	bh=NjGaBuaYA6sHzuuB8n+mMmJtjJQOEdG8kJzDBvCkxiE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=em0ND2QKsMd1wDIzBd34C1hhABiwmKBR6MrN9eCsZIvL1BFjQuN9UlEQm5Em6xW+ksl3mpa2wl/+R0N9lBdW1jZC7TpzZPvpWoNiO2JBWlExHizp8pfBQiNSPzHeDwoThKbqaH/xu99XkpoVbIhGFRASAJGw71twdVbR1T/6ULs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fiberby.net; spf=pass smtp.mailfrom=fiberby.net; dkim=pass (2048-bit key) header.d=fiberby.net header.i=@fiberby.net header.b=KMoYgYHl; arc=none smtp.client-ip=193.104.135.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fiberby.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fiberby.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fiberby.net header.i=@fiberby.net header.b="KMoYgYHl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
	s=202008; t=1771257851;
	bh=NjGaBuaYA6sHzuuB8n+mMmJtjJQOEdG8kJzDBvCkxiE=;
	h=From:To:Cc:Subject:Date:From;
	b=KMoYgYHlknXFF9DPrPAeDxHXMe0O82zF1fBCHmbRmWJ0Quq60pHaATaf0lMQ4dDXI
	 TfamN9RECqC/NEKEQ71NtSE6/J1wXuBaKvWDNHLXNtszFX4mgbWTKxjoUaNIRfuoDo
	 tJKrJtzKDWjjs6zXWmgL6dzTnbAUU4CuUNaVA9D6YdImzjGPDroFAOwP4aFsOvIZBR
	 d+JqqvxUyscfKZghFEFfghMdmexRG/vpzm+wXUpSNqa11J+RNGRs1wJI4lFo2wp0ly
	 luc8leyDfyrEe7Jetro+q/7EB6rlzmiO4e5CawrXh34fc1mmD5I39EQdk8QOOaDVnQ
	 OqwJFo1vQ9eTw==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
	by mail1.fiberby.net (Postfix) with ESMTPSA id 1E34B60104;
	Mon, 16 Feb 2026 16:04:11 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
	id D3B26201746; Mon, 16 Feb 2026 16:03:56 +0000 (UTC)
From: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>
To: Jens Axboe <axboe@kernel.dk>
Cc: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] io_uring/cmd_net: split ioctl code out of io_uring_cmd_sock()
Date: Mon, 16 Feb 2026 16:03:53 +0000
Message-ID: <20260216160354.73239-1-ast@fiberby.net>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

io_uring_cmd_sock() originally supported two ioctl-based cmd_op
operations. Over time, additional operations were added with tail calls
to their helpers.

This approach resulted in the new operations sharing an ioctl check
with the original operations.

io_uring_cmd_sock() now supports 6 operations, so let's move the
implementation of the original two into their own helper, reducing
io_uring_cmd_sock() to a simple dispatcher.

Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
---

Jens, I'm used to net -> net-next taking a week, as it only happens
through Linus' tree.

 io_uring/cmd_net.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/io_uring/cmd_net.c b/io_uring/cmd_net.c
index 57ddaf874611..56696c4baad1 100644
--- a/io_uring/cmd_net.c
+++ b/io_uring/cmd_net.c
@@ -7,6 +7,21 @@
 #include "uring_cmd.h"
 #include "io_uring.h"
 
+static int io_uring_cmd_get_sock_ioctl(struct socket *sock, int op)
+{
+	struct sock *sk = sock->sk;
+	struct proto *prot = READ_ONCE(sk->sk_prot);
+	int ret, arg = 0;
+
+	if (!prot || !prot->ioctl)
+		return -EOPNOTSUPP;
+
+	ret = prot->ioctl(sk, op, &arg);
+	if (ret)
+		return ret;
+	return arg;
+}
+
 static inline int io_uring_cmd_getsockopt(struct socket *sock,
 					  struct io_uring_cmd *cmd,
 					  unsigned int issue_flags)
@@ -156,27 +171,12 @@ static int io_uring_cmd_getsockname(struct socket *sock,
 int io_uring_cmd_sock(struct io_uring_cmd *cmd, unsigned int issue_flags)
 {
 	struct socket *sock = cmd->file->private_data;
-	struct sock *sk = sock->sk;
-	struct proto *prot = READ_ONCE(sk->sk_prot);
-	int ret, arg = 0;
 
 	switch (cmd->cmd_op) {
 	case SOCKET_URING_OP_SIOCINQ:
-		if (!prot || !prot->ioctl)
-			return -EOPNOTSUPP;
-
-		ret = prot->ioctl(sk, SIOCINQ, &arg);
-		if (ret)
-			return ret;
-		return arg;
+		return io_uring_cmd_get_sock_ioctl(sock, SIOCINQ);
 	case SOCKET_URING_OP_SIOCOUTQ:
-		if (!prot || !prot->ioctl)
-			return -EOPNOTSUPP;
-
-		ret = prot->ioctl(sk, SIOCOUTQ, &arg);
-		if (ret)
-			return ret;
-		return arg;
+		return io_uring_cmd_get_sock_ioctl(sock, SIOCOUTQ);
 	case SOCKET_URING_OP_GETSOCKOPT:
 		return io_uring_cmd_getsockopt(sock, cmd, issue_flags);
 	case SOCKET_URING_OP_SETSOCKOPT:

base-commit: d7861b7cd05a4c02dfa8015048be6821a1af7c5a
-- 
2.51.0

