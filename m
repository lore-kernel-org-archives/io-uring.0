Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92A331AF33
	for <io-uring@vger.kernel.org>; Fri, 15 May 2026 16:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778863070; cv=none; b=jJ/rA+3FEcJDGXt2sHYmcs17KHiq9Lcvh0HR7M+HzM9qKo2QirQ+a+81NWdeR79lJMA/nlKqbPY5JFop9mKU3+cyCSj4cHncQvtzFbH2Fr6gTtpSxA+MKZ1pKT299AjnhuwZKBvSwvANs1aVfx8U+pitbUaoyuWYme/WU7OuVZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778863070; c=relaxed/simple;
	bh=8wR1/cSX5es8u/ivo1OKdgycaXPIRUiWZ22rGaGGS+8=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=sHoWObb/s0E/ka6QB31KKVBmYv5PtlnlbsaHyYmXnS2S8T9S6OrT7gSvucVQf1ke9lDGaDLIl1L0ippdkGFIsrIrKl1jj6JSZ81tfc6g04GD6cYBIbDtPB/Lspc2Xc9dsWIM8EzUFhuROAd5X/awUHBRzDZL/SLxVl3JW1kSbMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=xt+FIK9/; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="xt+FIK9/"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-479d85152c9so3136b6e.2
        for <io-uring@vger.kernel.org>; Fri, 15 May 2026 09:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1778863066; x=1779467866; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Q1nQbnTmgjbcfbm7pUjMqxIvMRDQ76xnuPpahHWcPo=;
        b=xt+FIK9/3tcxqy0MNNT11DyLCPx/FaUF6A97L2l44KKwGg0jYJwjQfRdT/YUwZn56q
         g6Im712e2JaQx3sRftaN7faZNsGpVEyVVOirLsS3gL+vrmd95+28umQCWmv7ZSqyD8Uw
         43GlPMmasN6f4NvpeOxIX4KjT4o7Udny6gCsG9/0tJvtBbxsk319Vp9WCphq8z475Mgg
         sUvPK/oQtDDb5/BRA3APXnln0866JCqVWSE+H7NqU1opUelZ19y7ACgZ4VeT6dI+zvfk
         dejIsQQhVmx3qVqQf4SmzjTaHjG6SG/KlYmzVYZvJ5HubglpnQlbz2t8S2GzoWsNHgdb
         E7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778863066; x=1779467866;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Q1nQbnTmgjbcfbm7pUjMqxIvMRDQ76xnuPpahHWcPo=;
        b=WZn2UMI3dEzdQ2Ys3tKFAP7UT7dNwiHrOdLxOW6hTMDosfDuzMC5MSmej3p58Hjkp7
         hQF1hRD4q0nowodxGiec/lOLkfnpKitEcCA3ih4cgjjhQNXLn6njTGBpsAxWwD4w5Yoy
         U7F8fwmsLgg9KUTXMiJFYS2UT35g6QYs+sD6MrklHsf9dIuz1YO9zfhXgVxb0pktIFWY
         V4sGQD2QTdUNmmT1L6bScoomgVguZZomZsPQFdf97olKdZ5X0bRD01O35BsNVxc83Txj
         w6NQw2P7do1lym86CiKcWtFJYdiP3cURWfrOGzr80MhuhP3wLTHG0shTb0BERg51XRa7
         aKkQ==
X-Gm-Message-State: AOJu0Yy2cXZNfLZZKiGC2r0UxaVpuHyRId5DYqMTcc1np5ZVrDRY2UYs
	XxSc/vcYH9f3PwSZXm0PgqJ/wHjPM6BnMG0HuPVgM5JnPQwxJg88M2Awmnx+6bjc1+w9oCkhk28
	Ljs2Q
X-Gm-Gg: Acq92OEwdXs0Ec2+CMMM1bqZ97SnDm9SwyOMP3cLitqi45ytXR6bXtBoeJdPPQJFUTU
	JRfY13g1Ids0RGsnO/2xTxUiHpHpjBPK1T0NWmi1CmwNKyXY42AfSAD1vwEKd3nt4tCAfgYk+Yc
	ywmRwn8nHV4VLJwjwh4HEZEb4MGgC6yRIie3bX8vxVsTZBgd6wPZitMy9BeEQzbQQAWUkyrWIY0
	4LYDbwQHiEbZ63WhitePDXKWz6lAAPr1tA0K7H8uN/Ts09bHa3YPc5+6W5GQFTmS11wrfUS8J/o
	ve+5+wgAeFxjTmfjIoNh4ZLChohEe1KmqIctm2pW99vQ42rMNYDsQdJY4UQGX6yPHhZsz+rg1dn
	fX8EuaahKxJOyqQIVev2F9IPqNcAQAnkgn66W89b50t+g7cwLkjsrD8OGgVG3JdRXL8XH8zya1I
	V3lgQHQ7+exckqcpP2VhlCIltLUnm8WIpLKM8m9c1aHL+s0fGXdm66DtwrVmj+02t8LFj3OOYh2
	yfIehbY
X-Received: by 2002:a05:6808:14cb:b0:482:ce40:abe6 with SMTP id 5614622812f47-482e591071dmr3025900b6e.35.1778863066161;
        Fri, 15 May 2026 09:37:46 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-439fc5c0af6sm4688548fac.17.2026.05.15.09.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 09:37:45 -0700 (PDT)
Message-ID: <37dbe977-6d1f-401e-b1dc-5d448ea27a8c@kernel.dk>
Date: Fri, 15 May 2026 10:37:44 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: io-uring <io-uring@vger.kernel.org>
Cc: Gabriel Krisman Bertazi <krisman@suse.de>
From: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] io_uring/net: punt IORING_OP_BIND async if it needs file
 create
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

For two reasons:

1) An opcode cannot block inside io_uring_enter() doing submissions, as
   it'll stall the submission side pipeline.

2) Ending up in sb_start_write() -> __sb_start_write() ->
   percpu_down_read_freezable() introduces a new lockdep edge, which it
   correctly complains about.

Check if the socket type is AF_UNIX and has a non-empty pathname. If it
does, mark it REQ_F_FORCE_ASYNC to punt the submission to io-wq rather
than attempt to do it inline.

Fixes: 7481fd93fa0a ("io_uring: Introduce IORING_OP_BIND")
Signed-off-by: Jens Axboe <axboe@kernel.dk>

---

diff --git a/io_uring/net.c b/io_uring/net.c
index 30cd22c0b934..1f5fd8c37a5a 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -4,6 +4,7 @@
 #include <linux/file.h>
 #include <linux/slab.h>
 #include <linux/net.h>
+#include <linux/un.h>
 #include <linux/compat.h>
 #include <net/compat.h>
 #include <linux/io_uring.h>
@@ -1799,11 +1800,29 @@ int io_connect(struct io_kiocb *req, unsigned int issue_flags)
 	return IOU_COMPLETE;
 }
 
+/*
+ * Check if bind request would potentiall end up with filename_create(),
+ * which in turn end up in mnt_want_write() which will grab the fs
+ * percpu start write sem. This can trigger a lockdep warning.
+ */
+static int io_bind_file_create(const struct io_async_msghdr *io, int addr_len)
+{
+	const struct sockaddr_un *sun;
+
+	if (io->addr.ss_family != AF_UNIX)
+		return 0;
+	if (addr_len <= offsetof(struct sockaddr_un, sun_path))
+		return 0;
+	sun = (const struct sockaddr_un *) &io->addr;
+	return sun->sun_path[0] != '\0';
+}
+
 int io_bind_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 {
 	struct io_bind *bind = io_kiocb_to_cmd(req, struct io_bind);
 	struct sockaddr __user *uaddr;
 	struct io_async_msghdr *io;
+	int ret;
 
 	if (sqe->len || sqe->buf_index || sqe->rw_flags || sqe->splice_fd_in)
 		return -EINVAL;
@@ -1814,7 +1833,12 @@ int io_bind_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	io = io_msg_alloc_async(req);
 	if (unlikely(!io))
 		return -ENOMEM;
-	return move_addr_to_kernel(uaddr, bind->addr_len, &io->addr);
+	ret = move_addr_to_kernel(uaddr, bind->addr_len, &io->addr);
+	if (unlikely(ret))
+		return ret;
+	if (io_bind_file_create(io, bind->addr_len))
+		req->flags |= REQ_F_FORCE_ASYNC;
+	return 0;
 }
 
 int io_bind(struct io_kiocb *req, unsigned int issue_flags)

-- 
Jens Axboe

