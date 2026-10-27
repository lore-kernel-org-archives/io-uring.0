Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793113787;
	b=yJKMfglfEGyAexb9MGDeJc48elaK89LvlOxhn7xgKpWcII6bor3GqylhhZYi7DJpGURZ
	 Rbn1s2uwzW1JtqBgOJc3A5v7deBPUYrWVqNv3sXS4qz+bJ/zxq8UZ2pZuSFLguunsOBF0
	 XuH8zmC/oZimYmBBwEeo2jFB+d1gmDFNxRTpuwD3jQeRyrsa38S6RAmFwpr66+32vy5/b
	 AoltC+doA+q21+XyI8lU8vgvUKihfAd5BZbecyhdy9tULGyNGTADJtm0SGy0F6MDNBKpX
	 1ckYwMkQADvjuonE8TQVLIRhIGj+vf0zLOFhuvEGz+8kA3tSt8dTF+Dx4frh2JkeY+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113787;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KCFOuatFkHXSTcWcx4e9aYDFBnCJgOvcKyoL7O3GROc=;
	b=GCMaZ1XdK/qMSz0loryf3QFwyVhCMWD0SmiGYPz3rk/u5mScfiHDBbclW6+9yphPZ+/x
	 OEF2SM8Wq+K+CXgO7oApK8QL8MvlzvQyefvTPs9m6lhemmSgINQAwFebwuXUHR6VybI0U
	 Sp/o2yKkAdw5PawhEmTnlp+J/nkYobl04LFAMqBdONAxCSvjXlvWKj2xwghzZjva8Ozmz
	 SExUR+U17JjzO871x4ntvn280X4I3oVWFT6OSxqLWYcdI3XGa9VXk0Ni6BcyFzfKMtwRz
	 dwcjBrljmkwtf994MawmINmzyYMs2yShBfho9zYRArz6C70aQN0fGugYn8xx6D0Z2zw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YLc26iMa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21440606A326;
	Tue, 27 Oct 2026 15:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YLc26iMa
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793113786;
	b=m60ydiRbTa1vQcq1p3PZ7ZzvZBvbjy7QiGnuA3dxHswo2L8e/llFRwSaQo981lZgYin+
	 n8aEZcaYGIO4TStenEnLoqxfxw01p3i9a8xVxM6eORBd0TRXBfxwOmiYye6/fGM5cWSRl
	 yr/XUsTHRKlydIl7PS2Lsja7oRQROrqemghmRheNDI7U0DXmXwpU1gBGR7QDb76mUPNbt
	 NHAY8KncbsD23emF1WIj0u40F6gowDbiGwBDUxPOkhkxbYRQvbsSDnio8VuTyMUHWtFjB
	 tMSOdVoxuFZCwcnt8M2iVF8LozDyteAaq4aClXkB5UTMgVvVqUzH4RfWL3C8qUTzydw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793113786;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KCFOuatFkHXSTcWcx4e9aYDFBnCJgOvcKyoL7O3GROc=;
	b=VJ9ZtNtrHokJ1rPEWJYb4/MCD3GyzDHadREYs/f0lKeB3+yZLj/SbKpeaXpKxn7TzXWA
	 e8iT3lie3lrEf0iKMH8a3xMtDPKfdPY2LVm12f79jRSCfQ9KYqBvfIDDHDWDdmaG8L+PV
	 V4YNtpzot+HwNIWPdwI0rh0JT4OaKbLqPvGUdyaki/ssZ78dE86l10i1pSUmBBPut/Jyg
	 Q+Ay92H/8Dixs0HikZx2Z+jlxlpMbYV8PIEJ9T3SxwTxs64YbRlaB0Z8iBXRbLJ6eJuHG
	 fYVGoZSVdGVkBz+nbTa9oT2SS7+CXD0FcrwzkoZVOGE6v8Apc05L6JR8B4OHUvnGvHw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0743A1F01825;
	Tue, 27 Oct 2026 15:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793113786;
	bh=KCFOuatFkHXSTcWcx4e9aYDFBnCJgOvcKyoL7O3GROc=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=YLc26iMa8srf8MqBKpmz9FxT4KrksZ8ufgepMtUVZCumXAAeqOC47/Md5LEuXGLoa
	 8DdJfjIBg9sG58PD36RAPwquAZ0qcUr9ztVDm/HM+STBOnq+H6pktoKfCUSs29O4Oi
	 LtAxGd98wQr83jxip22HwUZZFR8ePMoMfMkZX2u6yr/3HLWbG8f1VguCXrPGSd3YCt
	 49Vx39yzArMROwWD6di3g6MjukkgVcTOE/U06BAoxHfVAFNu0hThdGmaA1xhmBBv6n
	 bObF3UxaEEDdjiWJYbsXaj3H4g/uyRYB6uKuCIh3gRxMCNQrv5dfJ0mMeQ8jXvziMe
	 E/QtiffQk69UA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5CD4E4511B;
	Tue, 27 Oct 2026 15:09:45 +0000 (UTC)
From: Daan De Meyer via B4 Relay <devnull+daan.amutable.com@kernel.org>
Date: Tue, 27 Oct 2026 16:09:37 +0100
Subject: [PATCH] io_uring/net: don't retry a non-blocking connect() that
 fails with -EAGAIN
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261027-b4-io-uring-connect-eagain-v1-1-f4e3aaaa49ee@amutable.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QrCMAxFf2Xk2cBW5gR/RXxIurSLYCrtJsLYv
 9vq47ncc3YoklUKXLsdsry1aLIKw6kDv5BFQZ0rg+vdNPTugjyiJtyyWkSfzMSvKBRJDQP7QOf
 RzRMz1MArS9DPL367/7ls/KhGK7YHUxHkTOaXNj2prJLhOL5nW049lwAAAA==
X-Change-ID: 20261027-b4-io-uring-connect-eagain-fbcfa542d6bb
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daan De Meyer <daan@amutable.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793113782; l=3987;
 i=daan@amutable.com; s=20260712; h=from:subject:message-id;
 bh=+tauznRyjDSoB6VE5cwuu1Dh5SUyiGcquSpMY3vzX90=;
 b=O2A7vNtxGH0EWkqALMv8O4Sv9NliAsDagjJyoowFY10nYi/HctgeLO+1ApQxMlHxsynvoA0yQ
 kalUT4sTNNaCEptdetIsUxCt5zz8YXfd1LbRBD13NdoR1//wTf4s6Hf
X-Developer-Key: i=daan@amutable.com; a=ed25519;
 pk=I1l+WwrtmzRgofA5SQ1wTuJi18fjh91w+f5uRkFeZEA=
X-Endpoint-Received: by B4 Relay for daan@amutable.com/20260712 with
 auth_id=868
X-Original-From: Daan De Meyer <daan@amutable.com>
Reply-To: daan@amutable.com
Content-Transfer-Encoding: 7bit

From: Daan De Meyer <daan@amutable.com>

IORING_OP_CONNECT on an O_NONBLOCK AF_UNIX stream socket retries a
connect that fails with -EAGAIN because the listener's backlog is full.
Polling the client socket doesn't help: an unconnected stream socket
reports EPOLLOUT and EPOLLHUP right away, before the backlog drains. So
io_uring retries the connect until the apoll retry limit is hit, then
punts the request to io-wq. With a full backlog, io_connect() runs 128
times in the submitting task and once more in a new io-wq worker. That
worker stays in the task's thread group, so a later
unshare(CLONE_NEWUSER) fails with -EINVAL.

None of this changes the result. __sys_connect_file() adds the socket's
own O_NONBLOCK to every attempt, so the attempt from io-wq fails with
-EAGAIN as well. That -EAGAIN becomes the CQE result, and connect(2)
returns the same -EAGAIN.

Let's complete the request with -EAGAIN right away when the socket has
O_NONBLOCK set, like connect(2) does. io_accept() already completes
-EAGAIN this way for IORING_ACCEPT_DONTWAIT. -EINPROGRESS still waits
for the connection to complete. A blocking socket still ends up in
io-wq, where the connect sleeps until the listener accepts.

Fixes: f8e85cf255ad ("io_uring: add support for IORING_OP_CONNECT")
Signed-off-by: Daan De Meyer <daan@amutable.com>
---
io_connect() calls per task with a full AF_UNIX backlog, counted with a
kprobe on io_connect():

                                  before          after
  SOCK_NONBLOCK, full backlog     128 + 1 io-wq   1, no io-wq worker
  blocking, full backlog          128 + 1 io-wq   128 + 1 io-wq
  SOCK_NONBLOCK TCP, SYN dropped  2               2

The CQE results don't change: -EAGAIN for the non-blocking AF_UNIX
socket, and 0 for the other two cases once accept() makes room.

I left the blocking case alone. The poll doesn't help there either, but
io_queue_async() always tries io_arm_poll_handler() for a pollable file,
so an issue handler can't ask for io-wq directly. Setting
REQ_F_FORCE_ASYNC in io_connect() on -EAGAIN for a blocking socket works:
the poll is ready at arm time, and io_req_task_submit() then punts the
request to io-wq. In a test build that cut the blocking case to 1 + 2
calls, and the tests below passed. Every other user sets that flag at
prep time, though, so I can send it as a follow-up if that's acceptable.

Besides AF_UNIX stream and seqpacket sockets, AF_IUCV is the only family
that returns -EAGAIN for a non-blocking connect. Its poll reports
EPOLLOUT before the connection exists, so the retries don't help there
either.

A liburing regression test, test/connect-backlog.c, will be sent
separately. It covers the non-blocking and blocking AF_UNIX cases and a
non-blocking TCP connect that gets -EINPROGRESS, on normal, SQPOLL and
DEFER_TASKRUN rings. The liburing connect, connect-rep, socket* and
accept* tests pass with and without this patch.
---
 io_uring/net.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/io_uring/net.c b/io_uring/net.c
index eeab88e77fd8..1ba3cc0f171d 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -1877,6 +1877,17 @@ int io_connect(struct io_kiocb *req, unsigned int issue_flags)
 			if (connect->seen_econnaborted)
 				goto out;
 			connect->seen_econnaborted = true;
+		} else if (req->file->f_flags & O_NONBLOCK) {
+			/*
+			 * __sys_connect_file() adds O_NONBLOCK from the socket
+			 * to every attempt, so a retry from io-wq fails with
+			 * -EAGAIN as well. A poll on the socket doesn't wait
+			 * until a retry can succeed. For example, an AF_UNIX
+			 * client reports EPOLLOUT right away while the
+			 * listener's backlog is full. Complete the request
+			 * with -EAGAIN, like connect(2) does.
+			 */
+			goto out;
 		}
 		return -EAGAIN;
 	}

---
base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
change-id: 20261027-b4-io-uring-connect-eagain-fbcfa542d6bb

Best regards,
--  
Daan De Meyer <daan@amutable.com>


