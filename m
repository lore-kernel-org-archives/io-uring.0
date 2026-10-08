Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B19358387
	for <io-uring@vger.kernel.org>; Thu,  8 Oct 2026 05:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791436075; cv=none; b=BaNURKCgFMUdmFrcdQ0onZKX7QN+AfrXHORD6Wn+aOv04fLF3PjrvIARdcU/CBkiWtPXXmcpFKrPkUGymZ9gfY9eAzvw2fArchxXsNMAVXmaDnsr8zx9N9BjOsvUwhDVj8IQSN3RheJBEd6UsZ/a5HLwqdkTuFhDpaAxaaAYi74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791436075; c=relaxed/simple;
	bh=9/N2e9/MNH9Xfdq0a33d7UYMPJIEu7OufUPNTx5SHoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ag+ba3DbbfJxM8w1afcRlHH5pWoe0y8BxhZO/XiSqpFzRWQfm3ct6wEuu8KFXt0H3hk5vVlTmKvcVsu22uQ6+zJbRxDLLVUPdhwdrN/k4iR2XqS93arWCqpE2EDgDHPhZRp94CAqUZn34vSpScsoCtfWk6sVfnoIIG5rtSY2mtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMolIhr4; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMolIhr4"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e812e2b31bso1458215ad.3
        for <io-uring@vger.kernel.org>; Wed, 07 Oct 2026 22:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791436072; x=1792040872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MUva+MYne+FCUQfWg4Yu/6cO+ExcFD5nfGYNE4CV13A=;
        b=OMolIhr4vY0l/KcsAcM6t+9/mQk2MZFzq/UOigOTQXNHPqQxnJhGZ+mCMqmfGGxo2Z
         Dwf48O+g4U5rJQh6fGUpWUhJ0jKAExwpMkzrZoRhZnseKF+IRtYpwmR2AdjbOER6f+fD
         9hNY9jTjtqInUgAt6egr8FJFH9A5PK74xegqC7R4N5JKl1jbacAIqm4r/LXbLObySD8v
         IogomoryK+ZoxMXQo9pVHKa2yX3fzxepuQzbciGfU5giefls8Cl04XqtsW2h54N8RrzB
         Um2RYAV/ZwfMxqoGxyybJmMHWKXu1xscZHYPUi60J9CXWgJ4r1DQ75dOUSkRP+qPw9r4
         D/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791436072; x=1792040872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MUva+MYne+FCUQfWg4Yu/6cO+ExcFD5nfGYNE4CV13A=;
        b=qE8ofUBpUhRVekQtCL9HVSkBvvoxLOhu3SCTYxyncyp0Bn7lNpXNelxny4EBAmiAha
         iiyjLuVYyyD3mP2UtXe8njq1e1S1f3DB9X+uyuqH83bdKJ86daO6LvOG7qEnW6FmWwQE
         yywPWdltvl3EDSa2HSdzTuhyAqkoFdUU22BJnJ3XfbZrh6/1+gz8wnYKU1RY71WjX+PZ
         X2UkHHQGNsxO/DZwRKez9MISQ+jdBmGYVcYKD2C0F1BlqSVlu5RALWVuyclf6ekJJQfI
         V80+VqgT3M8XJUQKuUzpO4iC9Qf4cp3FrbGy7FEuDsvOyxb0UeKgjYY3uTezC7TiLh2c
         IGyA==
X-Forwarded-Encrypted: i=1; AKwUvBwvEz0Cs/o2leGv6/zbayWqT6+vNCO3MlMk5+2EK3Ae4rY/yPo7PfQU5l7G+eYoVN36vu/ZzgVZzA==@vger.kernel.org
X-Gm-Message-State: AFq9FYK3vbKANRZcA6fk14C2ORC88sIAv2RvGqo0UWrxQJf2W7A4NjkE
	AvTRWLnr0qTlg8BDzOhd2snsEqqEM6JfjqdrSY7AI0PrllGFo0yc/ulb
X-Gm-Gg: AYBFou18TgfeWmkKtKXmgxsotjB3UDnNN1TzFHW2rtZjtohXE6gqPF9IMVBPT+ZpT1l
	66tA8uD2oNVURCRdChk61+okJhg6jAX5h7cpcDZq6A2Djx8we1Mgw52hlPD11se6GD83MMhV1KG
	+qKbRPU5kg/3SuFwr5Om3Vf3yR8SqI+3zQCpweH7iAcykEqllHURz94N0wR7FzvusFQk9XaF9kh
	SfuyLjxL2uREpKzSu+BT5lOqu2ZoRWUEkmFa+ACNq0ob+82rncimm8H6bJ5ptloZB+sejMO4Pps
	171uOCIO2IQsaGp2G3rqzignCLlNwP0S1WyHH03UdnblJ0X3fQotvFu7h+4/c0ypsn3ASb+5kqo
	j0RZLcqJEIdpAjCrsxRNqdnP5CBLjAihQSUra6LYEj6OsU+xUF/565oB/Rv4MYNIcVC9t7IBpb6
	d+uuhLrEit+ELdGMqle1OTkTpNX0Rx9jwpkfXs4YFpe5LSp/ZnTG0J7KiapesptcRELLlw0Cb+e
	UjJYw==
X-Received: by 2002:a17:902:ecc6:b0:2e2:ffcb:87a8 with SMTP id d9443c01a7336-2e6003941c5mr40854035ad.10.1791436071908;
        Wed, 07 Oct 2026 22:07:51 -0700 (PDT)
Received: from dungbv.. ([116.98.134.138])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604a5804fsm19541565ad.77.2026.10.07.22.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 22:07:51 -0700 (PDT)
From: Bui Viet Dung <dungvn2345@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>
Cc: Willem de Bruijn <willemb@google.com>,
	lollipopkit <a@lolli.tech>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Bui Viet Dung <dungvn2345@gmail.com>
Subject: [PATCH] io_uring/cmd_net: prevent infinite retry loop on unextractable timestamp skb
Date: Thu,  8 Oct 2026 12:07:45 +0700
Message-ID: <20261008050745.498415-1-dungvn2345@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In io_uring_cmd_timestamp(), the skb processing loop terminates whenever
io_process_timestamp_skb() returns a non-zero value. If the failure is
due to a full CQ ring (-ENOBUFS), the loop stops and returns -ENOBUFS,
ending the multishot command so userspace can drain the CQ.

However, if io_process_timestamp_skb() fails because
skb_get_tx_timestamp() returns a negative error (such as -ENOENT when a
timestamp cannot be extracted due to changed socket options or absent
hardware timestamp data), ret is not -ENOBUFS. The unhandled skb is
then spliced back onto the head of sk->sk_error_queue and the function
returns -EAGAIN.

Because -EAGAIN leaves the multishot apoll armed on EPOLLERR, and the
unextractable skb remains in sk_error_queue asserting EPOLLERR,
io_uring_cmd_timestamp() is immediately re-invoked on the same skb.
This results in an infinite busy-loop consuming 100% CPU and completely
blocking progress on any subsequent valid timestamp packets queued behind
it.

Only break out of the processing loop when CQ space is exhausted
(ret == -ENOBUFS). For skbs where timestamp extraction fails, dequeue and
consume the invalid skb matching the behavior of sock_recv_errqueue(),
allowing the queue to make forward progress.

The issue was discovered via manual code audit of io_uring/cmd_net.c
and review of the error handling paths in TX_TIMESTAMP command.

Fixes: 9e4ed359b8ef ("io_uring/netcmd: add tx timestamping cmd support")
Cc: stable@vger.kernel.org
Signed-off-by: Bui Viet Dung <dungvn2345@gmail.com>
---
 io_uring/cmd_net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/cmd_net.c b/io_uring/cmd_net.c
index 90d4ec7cc761..a5a1b8b66b1f 100644
--- a/io_uring/cmd_net.c
+++ b/io_uring/cmd_net.c
@@ -138,7 +138,7 @@ static int io_uring_cmd_timestamp(struct socket *sock,
 		if (!skb)
 			break;
 		ret = io_process_timestamp_skb(cmd, sk, skb, issue_flags);
-		if (ret)
+		if (ret == -ENOBUFS)
 			break;
 		__skb_dequeue(&list);
 		consume_skb(skb);
-- 
2.43.0

