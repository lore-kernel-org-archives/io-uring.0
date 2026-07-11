Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0972839B959
	for <io-uring@vger.kernel.org>; Sat, 11 Jul 2026 10:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783766952; cv=none; b=jMW0FbuQJXxYNj/GIiI0ovet6VDA0t8jf+dWzpTRI8Kr8sUiBT5XH6bl80wWURaDPDRUepINKww3ypSdXZnwVHW1RpmZugVqiMbh81IedKP/bNHuABDOalpplWHbR+yMaB9BhsVBUGWausQS7W0xnZ1zx3xvSKmb3Tq7tOw9tVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783766952; c=relaxed/simple;
	bh=jMzpt1cR6AoTNSIsp+VeRZ4QHMFIIBm31IrM51LY1WA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TCqng5hNTs/D7GZlG9RFGMB3mf6HRTim2n1JyrPRIbpxKzRCpCXFEqnsLxbRg1JHMhzTnvm/plzYhnTTq6USFLY3TBaUfR9lI3Pa4gb0ED1HQa4fiolQiAWDr7r+DhFYoqN7m4g2K16VrUJYKjHMYqrltU4Xwbrci1QSo4UL0lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ohDOZevT; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ohDOZevT"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c15f47e6297so213369866b.0
        for <io-uring@vger.kernel.org>; Sat, 11 Jul 2026 03:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783766947; x=1784371747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwBSzhndPeMI54zLXi5IxtipPiwbYr7jJkmQfwxDNXo=;
        b=ohDOZevTKarogW4pl4gGV4aohlsEJynlwEt+v64f6kbJrH7d9OV3a+ZM+Uw8m1bfnJ
         KQpaPE6j81IaSdlx9OwxtTPFaXcDsp1yYQ/Nou6hktB53g2tsb8l9NzNLPX3YiGJD/Pn
         zzJOMi0LcTmWLxJ7UGl5wdvD6Ut//zEnk/jxHLnNFQG2mHlWTUJdSKV+JnFITDHUyHAL
         aG6jV0cnQNipAgXHfwDJD37qyeZMV/p+alPE0/JthvbNfm0yRHWxjVMic7cHTl+EOBOh
         IK6ehiuDpUYSidUFRaPPUK0YsRxvKC8LNeus3alYItdtShI0wGhFOb4QF1/CgNmz7WBi
         2mgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783766947; x=1784371747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwBSzhndPeMI54zLXi5IxtipPiwbYr7jJkmQfwxDNXo=;
        b=Xj8Ofir/kbXS31bAlIvfQ+x+CD20elUZb2kjJCEB9WoqgjevPXUyNsdTjsXG22P6ON
         ODHH32TBUTObT0qFu9YlhG61KIs5Q8BcAtTYyG9RFVJkZTin705plfzcP+jXGr4vqtc4
         L4bPFK6PqerLYt7SmgM2uyX1e1Q4keF3trElgQCTcXKsNH7zW9Nlp9mbOWWywD6m3r/C
         pMfwQf/eKaZZAYDo4T2JJkBC3IFTeu5u7pulWe+4JYlgXfrW7uLNd4Xc3wYXl7SxCB0K
         RO5bjeT5a3rY3wFKIQPIrXADGjRgR7cnHWGS9HwVr4v3b2qi7cMLbkeFhvKdB9Tuh7wJ
         LvzQ==
X-Forwarded-Encrypted: i=1; AHgh+RoTmrjrNhyiyVDw5mDAXUEcV42ubn9phCLo0FhcplLIf5/VsyoNyi3B9AkVvC5wkbD8wyY9jOHiaw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk1L96/ZNTdJPE54Cvzfl63MB9LY26n/a+KJJAIH+nerM3XNun
	3b4xNIMv6Bi2vVqq1EFW/kegtQzLOuMO0qqsZ57Li5JXz0eLmj7ZtlwS
X-Gm-Gg: AfdE7clqL63KfIOHkvYqC4xsvImRe6nWnaQrNxz0ch3cvVytn5uuqdfVpTN0msGQIyb
	N2LvVNfjXtt/X7Lm/8JFgH+T0OMV1aJsTBOc+3eOlZobor4iWq2dbA/SGmjC9rFSE2aIAULAfhX
	dm8HXqOIfH7+vi4tloHF9bOVSERtLeEBeO5xySTCPFGu/NL9P2YO9zgUaUANvk3gE4q5DlmCY0t
	YdPp+22Y0fwBS3dlOdTW425FWvb38aN/aetGKvvrDbrwvnuAl5URi4Dr1nFzbIGBX7+Mt4Gu8OC
	nbKYzW0BWwGruruqeB+wRnEWzTjPCUrKKQbWRjhmc6fID4r9T59164nyt7JujDgy4gViBxDRxDW
	G5Opo38KISR3wfo952o0eyD2NGCfBn550xfAglu1BNCTyZo2AtcERrNPCxYESzbvXOzo4tJxGXD
	cdz4/tLwKS66grNHzNoC+E+LrazXM5hbVct0V0+T4ie/QGA5WfXgjdIQpOlgVD94mCUeOxRuLLJ
	OVFQF8KCfenJzzh7GbPO4MEMD0c8QRtqwnk14il2Ykwsdf2hg==
X-Received: by 2002:a17:906:f587:b0:c15:db5c:7127 with SMTP id a640c23a62f3a-c161e88f7cemr88143166b.20.1783766946815;
        Sat, 11 Jul 2026 03:49:06 -0700 (PDT)
Received: from 127.0.0.1localhost (82-132-222-132.dab.02.net. [82.132.222.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15beb53b86sm609123166b.25.2026.07.11.03.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 03:49:05 -0700 (PDT)
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
Subject: [RFC 01/10] net: pass ubuf to custom sg_from_iter callbacks
Date: Sat, 11 Jul 2026 11:48:30 +0100
Message-ID: <58db782214b7169988fe4981771d3f0a12de4529.1783614400.git.asml.silence@gmail.com>
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

ubuf_info and callbacks for chunking zerocopy iterators into skbs comes
in pairs in msghdr, and in the future the callback will need to know
which ubuf_info it was called with. We can't derive it from the skb as
some paths set it after the call, so pass it in.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 include/linux/socket.h | 2 +-
 io_uring/net.c         | 8 ++++----
 net/core/datagram.c    | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/socket.h b/include/linux/socket.h
index 2a8d7b14f1d1..5ae24847f5c4 100644
--- a/include/linux/socket.h
+++ b/include/linux/socket.h
@@ -90,7 +90,7 @@ struct msghdr {
 	unsigned int	msg_flags;	/* flags on received message */
 	__kernel_size_t	msg_controllen;	/* ancillary data buffer length */
 	struct ubuf_info *msg_ubuf;
-	int (*sg_from_iter)(struct sk_buff *skb,
+	int (*sg_from_iter)(struct sk_buff *skb, struct ubuf_info *ubuf,
 			    struct iov_iter *from, size_t length);
 };
 
diff --git a/io_uring/net.c b/io_uring/net.c
index 00a7df803b99..cf273d6f02b1 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -116,9 +116,9 @@ struct io_recvzc {
 	struct io_zcrx_ifq		*ifq;
 };
 
-static int io_sg_from_iter_iovec(struct sk_buff *skb,
+static int io_sg_from_iter_iovec(struct sk_buff *skb, struct ubuf_info *ubuf,
 				 struct iov_iter *from, size_t length);
-static int io_sg_from_iter(struct sk_buff *skb,
+static int io_sg_from_iter(struct sk_buff *skb, struct ubuf_info *ubuf,
 			   struct iov_iter *from, size_t length);
 
 int io_shutdown_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
@@ -1447,14 +1447,14 @@ int io_send_zc_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	return 0;
 }
 
-static int io_sg_from_iter_iovec(struct sk_buff *skb,
+static int io_sg_from_iter_iovec(struct sk_buff *skb, struct ubuf_info *ubuf,
 				 struct iov_iter *from, size_t length)
 {
 	skb_zcopy_downgrade_managed(skb);
 	return zerocopy_fill_skb_from_iter(skb, from, length);
 }
 
-static int io_sg_from_iter(struct sk_buff *skb,
+static int io_sg_from_iter(struct sk_buff *skb, struct ubuf_info *ubuf,
 			   struct iov_iter *from, size_t length)
 {
 	struct skb_shared_info *shinfo = skb_shinfo(skb);
diff --git a/net/core/datagram.c b/net/core/datagram.c
index c285c6465923..f15886f40efc 100644
--- a/net/core/datagram.c
+++ b/net/core/datagram.c
@@ -753,7 +753,7 @@ int __zerocopy_sg_from_iter(struct msghdr *msg, struct sock *sk,
 	int ret;
 
 	if (msg && msg->msg_ubuf && msg->sg_from_iter)
-		ret = msg->sg_from_iter(skb, from, length);
+		ret = msg->sg_from_iter(skb, msg->msg_ubuf, from, length);
 	else if (binding)
 		ret = zerocopy_fill_skb_from_devmem(skb, from, length, binding);
 	else
-- 
2.54.0

