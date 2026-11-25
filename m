Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632285;
	b=JXH4u+0MFTMUCr4Q2Tfl0kUahyuTlic12U9xZe6GYSeh4XJiTMkK8qhnlWQuT/SoXeFn
	 DdLU/6a+isZ/g0dlPNz1dbz6ZBpe8jdMZhkhmlZIHQiTnhDtAGTjR6dEDF1csGluTPHts
	 AjyjACqe2SI1ktQLIoS6RClzTQY5vsUQ9D3OtWA3DNzYVYcTwaiap17dgSmTTgx/WkTma
	 kZXTam96+avtGx2qIiG4a64ZNVUrPtdj/usbf0F3xIpf8mt+mMW7FJSciyKlrcUMqsMwP
	 Y3yhH+XLNZpIWT1gmZ3O9nke8RTVTIOP0H+RvjEzL7+qRGvLV9+pVeBvI2SbxewAMHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MmE4HuQlC3qSlD1pcd+MNXdyb5hSznFFM86jEb444vA=;
	b=whppRIBZt+q4RSjViz3Cf4We/rfhzMAdjas+eJ1TDJDYP4JnnhaB3JeQ4BeEVkKXkZKp
	 DePvYcOhjjPTa3tDAqxOPTbCKmxqHUpivrdZ/NcutgCrko4+u9TQBL2x1bOtNHXNGE3Uh
	 CIj3YHET//T/3+nVAZTZ+AdtpzRKxV1RYJUkUaUSRIewUhwlGboEBEoRpXGAMMr6uXd0F
	 H2WrX7I/RNCTzhTMH7MuWexpZYX/9eALJ9tuzcAHr4zlks0SKZIX4eCz8b5rILhRuendl
	 7Zukj3f3LNJVn7P4UXV8TUrARPN+My55/CNROYKegIGHuwCB5O5MarjTLis1bhukXvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=QR7iLCNK;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAB1606A31E
	for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 18:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EAB1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=QR7iLCNK
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-717080a2d50so5678207eaf.0
        for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 10:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795632283; x=1796237083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MmE4HuQlC3qSlD1pcd+MNXdyb5hSznFFM86jEb444vA=;
        b=QR7iLCNK5bxyDOn9wUN8PGgUYNRI2fD/u1u6AxLoKRjuAJAQGCeF9KkgwtTmdECrZt
         fOZusM9BFr/ZWqtKUIotf/P2PpMgGtloycmHBfKufvsJs8L/6KJLgtegLG9U8WBbJzN/
         Upo3+muVM6cpmvkp/ATsLSd1EWZhSD/5eEIRvEtmCrqT89rawaQkknCeh8x/eCziEkjJ
         wfL1HhhQ6DNm7Mad0BzF3+zTY7CRcVMwkTxugiAJwvVxGVQ0DxPvFUddax7IOFSwL+ju
         sGPBpeuSyeTWRffMmw1a2F8cAajllY+qeYsg71VDwhl4OP7M1ONo5ORHqgRFsaW4doXZ
         6eAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632283; x=1796237083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MmE4HuQlC3qSlD1pcd+MNXdyb5hSznFFM86jEb444vA=;
        b=VArBBi9Y/dS9Pi4McE7O7AVbEga4PgslBKW8u6dnodQdE0inZMGV58TXh4dPyVb1d4
         JjFwXrdiXLxtNXYn+oz5nZFShPU6ZOJbNgSnxaU+Fd8WhDDz7swnNqXWea0im20Dg3os
         jM2Z1iKZ32V/2Py7QPky5NaOeeoIx6VlP8EJZDq+lLr2LKQcUcVznTYOJF0e47Yxt2Db
         p3Ao2aUQQyeLnnYt/6IrEOrUYCCg9aT9LQQa+WeR6u4gCiC0NjHEkIoYghJUBvvvRsxR
         WxruYuCX8hXgqXqQ2GcywAYhm6gTVbyb3QFFPURo+qVTLEOeN1BBcJjZarIfPXb+rt3b
         D9Hw==
X-Gm-Message-State: APuU4Z9WRpsd08u3MTq41BWaJpcOLRV6uuR8eMuF6xoylLd2lGnT6xbh
	Ch2VhvlWdJg0yDD3Po5jbFHBW4dH2V8oqiGMuQojb/3wHmkCnh7i2YZVfA4maUAeI+79PgYf/XO
	cgwlZsT4=
X-Gm-Gg: AZFdTZfgTLgifwfRvSJCJu5bsAuT/1x5lmOA/KeLK3GXaYSCBcIrQWNiK9nk3xu0iBP
	sk+3n3kZpuaUSlh72ZsZHkOXAdKr3UScJVK1Q/d0/nXD+01pWu2tQ4VO/kn1liLZLkB4bnlNrT7
	+qfLFU90hlwgiMqJdkeU3cm4exDS+NckDUjCZuPkjQ0wU/U3LniwhdjgvsU3fhwSWLZKjO9j8Ad
	ZuB4wl3pJmZE3t/i720rsI15khqR/m8V5BKw0l9+Wvlqdbal+OXieRuH/YIYihyoo1RaNc90ii/
	4z8GUfyju/QQekT8ViFxpBmpzLAXnUEiSGJ6yj/J2gVJwsMTLMM0Dmgru56K1D3CPJJrA4zUjHG
	8DlW/jUKFJlCMtDhfV3nPZIO6rbg21nw1gHYtULOxJaJxwV29kg1ypG7ixDiYQimlGZxyVeYGMT
	e+emIHdvLgiZBTRIF0yH/JCh6e/6QS6tpNeuidk4B0T9dl0efK2ob9Ci6rtVylTliXAumAgU+Gh
	E4/fYSsfp5/JAn5Be86lsIidzgk9wjrQ3ZVgdYA54P2yw7357eDCatsvizcr26gZwBpYNPAsLun
	kOGqcdEkgvGWggwsBpyT/t9sppR3oxh4FqGRZfELs44pinddQgRDUCOkGjZELM3mChDbV7iBoSQ
	NR38OlM+Sg9BverJX2kSaJyyaVSFcIoMKqK87Fq/mDk3o9NABoT8hRgs=
X-Received: by 2002:a05:6820:2228:b0:6f6:3762:5f9c with SMTP id 006d021491bc7-71b3929078dmr16500169eaf.11.1795632283356;
        Wed, 25 Nov 2026 10:44:43 -0800 (PST)
Received: from m5pro ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b37c52ae6sm12332828eaf.0.2026.11.25.10.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:44:42 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: Chris Mason <mason@kernel.org>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 01/10] io_uring/net: don't copy msg_name on a recvmsg retry
Date: Wed, 25 Nov 2026 11:43:10 -0700
Message-ID: <20261125184439.58077-2-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261125184439.58077-1-axboe@kernel.dk>
References: <20261125184439.58077-1-axboe@kernel.dk>
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

From: Chris Mason <mason@kernel.org>

IORING_OP_RECVMSG with MSG_WAITALL can write past the end of the user's
msg_name buffer, if a partial receive is retried and the source address
is longer than the buffer.

msg_namelen is an in/out field: move_addr_to_user() reads the size of
the buffer from it, and then stores the untruncated length of the
address there. So the size is valid for one call to ____sys_recvmsg()
only. But io_recvmsg() passes the same umsg and uaddr again when it
retries a partial receive, and nothing restores msg_namelen in between:

    msg_namelen = 16, AF_UNIX source address of 110 bytes

                 size read    bytes copied    msg_namelen stored
    receive 1    16           16              110
    receive 2    110          110             110

If the copy in the retry faults, the result of the request lacks the
data that the retry took off the socket. A retry that hits EOF has no
address, so it stores a msg_namelen of 0 while the buffer holds the
address. And an address that is longer than the one before it is
truncated to the length of the one before.

The fix used here is to copy the address out with the first part of the
data only, and to leave msg_name and msg_namelen alone in the retries.

The address is now that of the first part of the data and no longer that
of the last part. The two differ only if the source address changes
within one request: on an unconnected SOCK_SEQPACKET socket that
receives from several peers, or if an AF_UNIX peer binds between two
parts. A program that passes a msg_namelen smaller than its buffer got
the whole address from the second receive on, and now gets the truncated
address, as from recvmsg(2).

The retries also no longer reach audit_sockaddr(), so with an audit rule
for IORING_OP_RECVMSG the event of the retry that completes the request
can lack its SOCKADDR record. The event that keeps the record is that of
the first partial receive, which audit logs as failed with -EAGAIN.

Fixes: 7ba89d2af17a ("io_uring: ensure recv and recvmsg handle MSG_WAITALL correctly")
Signed-off-by: Chris Mason <mason@kernel.org>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/net.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/io_uring/net.c b/io_uring/net.c
index 8afad1b2ddc0..f8d547c5e7d6 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -1116,6 +1116,8 @@ int io_recvmsg(struct io_kiocb *req, unsigned int issue_flags)
 		if (ret > 0 && io_net_retry(sock, flags) &&
 		    io_net_kbuf_can_retry(req, sel.buf_list, kmsg)) {
 			sr->done_io += ret;
+			/* msg_name and msg_namelen are filled in, leave them */
+			kmsg->uaddr = NULL;
 			return io_net_kbuf_recyle(req, sel.buf_list, kmsg, ret);
 		}
 		if (ret == -ERESTARTSYS)
-- 
2.55.0

