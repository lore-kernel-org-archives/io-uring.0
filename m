Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB174CC293
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092752; cv=none; b=s1oawF9Mj908KlXiRQ3IXUG1mOjhdwRjqAyzV+IjlU92XZ3yHw15FXZtC9X+E/XIeQ2/tmdWbXtdKArB6m98sXwLMGtAC/D38RYW0HBtdO/pZ2sRlgSsXD+0uJLx0djYN43TuCOCwaEEUX/EP+j+XLeEmdIeclyEdIvZrLfGS7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092752; c=relaxed/simple;
	bh=DEy3E/I/uEDL1w1GuCv3Nik8VyO2cmcZqDGagw00vnE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FBmB5SEO1c185P1lV3PB87+Ino+J0os/Ewr0EvdXnAliwoYyCDDWFwA7jPBlpNprUR04I4Pqbclb2Ez9kT9DlZUQIzTWeUPDEkiW59BFOZ7Oc04jMTXfm3dvxVssMrKVXoUXRHRf+GSk08dCfZvFn/uLIPo8hc0z9opqNDlDJos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=XVpJMYoR; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="XVpJMYoR"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93ead211f14so37818685a.1
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092750; x=1792697550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f2VvOrY7EF0+TRmTsIsGhhdrzhO4SL1u38gIhbmgw5I=;
        b=XVpJMYoRl6ARX5ySi7bHwy+JdHqdbgAVJLv/4cGMp4rCGHbXk4OmfHTgrPHEnjtRKs
         4bQP8fEo/Opwv8/QZ5QbqsSy/EusApgKPs8tKHFoaDdxHW2UU58wPso5Y6QG30nsZjXW
         LG7pZ7y3ES0VhWnps34xUSRe2oem2t/UPTyJDNNXjxyqUJrTS0XJZkbYFd/+HM1Bxe+U
         un6/bOGSXsZ6JkB/s7rAAt3mFPA68AzbDbAciHxKLyqe2HTu4SxnhIOn3ao+33hq2MXz
         0EeKu7JSX183SeqQnnxFOCcB2+ZFLzySHg6gNzcRl8GLIydR7g7Kr1puZmf1vNIu99Qo
         wBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092750; x=1792697550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f2VvOrY7EF0+TRmTsIsGhhdrzhO4SL1u38gIhbmgw5I=;
        b=mZ9apZ2QTWx83Xqbr+Irv8JxAIaeMvxuohaPl9hWNaN6UjXwrTtOZd2O1hzu7G6dVa
         NK1i/9Be/2jyV4G2MnI0S8E4Hmm2qZgMdXODVkeV8emMeEMknnpT0tWnE5rnIE2dY3EO
         4OickhgYfqz3jwIMtTCV5rWa1WSByRkzm2t6G5hAFIApNrC0sjdeYPCJNzuJ0v05cwHl
         MYhE/ofRTx6Xi3Uj/yvwIlLNaAzAHRFFfCXs+wEEtjf2nvm8fqca+/vzz8OHeYz/w+Cv
         n3dKMapuq7laT20YU991lfws1XP89tY1fcSItE+fpaDk8HiufMidn1VlZnT+rBmPoucB
         34YQ==
X-Gm-Message-State: AFq9FYJ1gn9AQmkAFZMM6BHEIUG7JAuDVt5z0L5PscPK7iPB/S0Jo3aK
	lE7tJe33FpjhhyKJaAOTZefW1KQ665qcZ2IBq6atv/MB4QOolEOuv5zMHjd+Klm1a6dg11jGZlI
	rPzeD
X-Gm-Gg: AYBFou2WVw2gE6VaOLSeCFgIOdAqW42zk8a6nba0hdm6n5Gp+0XFz4H2O31Zkg/Su8w
	FQalx5aKIlc+Q5HSHOlyRNMhDkvK1MAGOuS3TsJTn2C6l5y2/VvXbJH/n8fty0DQ4eTF1nCkFUC
	N7FtaaEORDCz795Rru4VZdth0Lz+Ordh4+CJ3qCuK91yT2i7+KguHxeIIjQEVVe8RpqaKLMmATK
	DFfD+BTX33QB8i0/VZjWzfvlKqtXbXb5CsmWr0V+qEer2pRZaEM3gXQYTNBqqTAdg2GTMxtn0QM
	aX4pSf0FMmd1FBM75LS5XR5OTXr6B4EUZDKhbnrjw0JgUMH3h64GsxjRMkAsV2ITa66pm9NGjFm
	V/Jgk6xIf84YDzeVVRrPvfU8Lhr5xms4tkuJoxkUZbnLS9DlwhEYAGULHBxNy/khf24xdpZkxv/
	huj4KwIztzdDm91FGDY87vZxg1ZIXwB2E91t65fXWGxbLzntPx5orVbxplnA8yMaSC4BzCn8S6F
	Gyh8Oth6EE1cdw=
X-Received: by 2002:a05:620a:3184:b0:939:4baf:5b99 with SMTP id af79cd13be357-93f17df696dmr197890085a.18.1792092749968;
        Thu, 15 Oct 2026 12:32:29 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.247])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a1d1401sm11654085a.46.2026.10.15.12.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:32:29 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:31:04 +0000
Subject: [PATCH 40/43] io_uring/net: don't retry recv on uncommitted
 buffers
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-40-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092660; l=3854;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=DEy3E/I/uEDL1w1GuCv3Nik8VyO2cmcZqDGagw00vnE=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QF32LJyJquD4MsVX6FeZFLdczIpwrdcgKebp7/9hvht4Yq9aoeF5nfhYjEOtyHkTVbZBnsQIbAu
 jAU/jF1cV0gk=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Commit 41b70df5b38b ("io_uring/net: commit partial buffers on retry")
commits ring provided buffers when a receive is going to be retried after
a partial transfer, so that another request using the same buffer group
can't be handed the memory the first one keeps receiving into. It commits
the number of bytes received so far. That does the job for a single
buffer which is consumed as a whole, but the request hangs on to all it
has mapped:

- For a buffer ring with IOU_PBUF_RING_INC only these bytes are consumed.
  The rest of the buffer stays at the head of the ring.
- For a bundle only the buffers which hold these bytes are consumed, the
  others that were peeked stay in the ring.

In both cases the next receive with that buffer group gets memory that
the retried request is still going to write to, and whoever comes last
overwrites the data of the other. What the retry fills isn't committed at
all, as the buffer list isn't known any more at that point. So the kernel
hands it out again later on, while the CQE tells the application that it
was used, and for an incremental buffer that it is done with.

The remainder can't be committed in advance: if the request ends up
receiving less, there is no way to tell the application that more was
consumed than the CQE accounts for. Complete the request with what it has
got instead of retrying it. MSG_WAITALL is no longer honoured for
receives into incremental buffers or multi buffer bundles, they can
return a short count, with the request marked as failed like for other
short MSG_WAITALL transfers.

Fixes: 41b70df5b38b ("io_uring/net: commit partial buffers on retry")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/net.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/io_uring/net.c b/io_uring/net.c
index f5f4f3ce6ef3..b1bf7dbec5d2 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -480,6 +480,24 @@ static int io_bundle_nbufs(struct io_async_msghdr *kmsg, int ret)
 	return nbufs;
 }
 
+/*
+ * A receive that is retried after a partial transfer keeps writing to what it
+ * has mapped. io_net_kbuf_recyle() only commits what was filled so far, which
+ * takes a buffer out of circulation if it's a single one that is consumed as a
+ * whole. The tail of an incrementally consumed buffer, or the yet unused
+ * buffers of a bundle, would be up for grabs. They can't be committed in
+ * advance either, the CQE has no way to tell if they end up not being used.
+ */
+static bool io_net_kbuf_can_retry(struct io_kiocb *req,
+				  struct io_buffer_list *bl,
+				  struct io_async_msghdr *kmsg)
+{
+	/* not ring provided, or committed at selection time */
+	if (!(req->flags & REQ_F_BUFFERS_COMMIT))
+		return true;
+	return !(bl->flags & IOBL_INC) && iter_is_ubuf(&kmsg->msg.msg_iter);
+}
+
 static int io_net_kbuf_recyle(struct io_kiocb *req, struct io_buffer_list *bl,
 			      struct io_async_msghdr *kmsg, int len)
 {
@@ -1091,7 +1109,8 @@ int io_recvmsg(struct io_kiocb *req, unsigned int issue_flags)
 			io_kbuf_recycle(req, sel.buf_list, issue_flags);
 			return IOU_RETRY;
 		}
-		if (ret > 0 && io_net_retry(sock, flags)) {
+		if (ret > 0 && io_net_retry(sock, flags) &&
+		    io_net_kbuf_can_retry(req, sel.buf_list, kmsg)) {
 			sr->done_io += ret;
 			return io_net_kbuf_recyle(req, sel.buf_list, kmsg, ret);
 		}
@@ -1252,7 +1271,8 @@ int io_recv(struct io_kiocb *req, unsigned int issue_flags)
 			io_kbuf_recycle(req, sel.buf_list, issue_flags);
 			return IOU_RETRY;
 		}
-		if (ret > 0 && io_net_retry(sock, flags)) {
+		if (ret > 0 && io_net_retry(sock, flags) &&
+		    io_net_kbuf_can_retry(req, sel.buf_list, kmsg)) {
 			sr->len -= ret;
 			sr->buf += ret;
 			sr->done_io += ret;

-- 
2.55.0

