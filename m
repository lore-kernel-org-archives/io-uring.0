Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB5A49EC5F
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092698; cv=none; b=GvfOrca6WOe+naSDd0cbkF90zlNTyL1/ca5rKAo8S3UJrNOuyikO7eFd/eHuulY82egrpLiLkkVIN7qeL78BzY69+Rcz/oHEdzYiNbO1q8NbMH0pnrxePjiC621NIuoApDo+1TR2QQK8hiHJ1OHcfqAudjz14LAoXtklHV43Dfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092698; c=relaxed/simple;
	bh=YgsPdJxz6AbftVrQYJwafgyFDrrFMBbZNrYiO4LLmZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cTm1GkJTGNMT1DekcQgoM7cFXWRgZadI6pkrHwTRN6Coqw/lghMLtoZLcu+qSgGafWK8iRMImrhnXOKVdWjTio+/oSNlIgS+tIz37GKumCDvWoe0LHOBjUxIwDgLdQdvePYgknOU18A9uTT4DjKwYx4F5fJWOjlSyIpFfls5RTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=GvKunSNp; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="GvKunSNp"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-917866225aaso77279106d6.1
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092696; x=1792697496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aU5/h7fhaucXw4me09fMy1Rhzia45FBX3SoiAKUTaVk=;
        b=GvKunSNp5ammy5TiHK4FaVfzQKWVrxKzfAWJBBkYE/HP8JlPoiD+66xsseCNeg2f32
         ErFt6tEckEve0NfNts6KgIu8sywp58D/nNW9V9b9X4Ae4LQLcDFUEk6MGNLGVhuZwQoG
         tS8K4tKrFI7nwphINIAS3PvUdpOcij0t+vNlbbVKzgVMCEP8nlwy2HZSAakcD7hEZZW0
         UcLh/vLBZtC2KOFYmz5GbqYbvj73HPu8XX+wwh20Dy8lZBRlv6m+KM08tdmY9R5Vv0uF
         hMzrgrnHr6Il5dG71DmoJAd/1MTojpWn6EG5jWrxy93mOc7mu50eBwaqtAF1c+EK2RYB
         urbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092696; x=1792697496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aU5/h7fhaucXw4me09fMy1Rhzia45FBX3SoiAKUTaVk=;
        b=FmF7C5YYi6ONbwIc73fFucNur+TpbTN8oKyUUZtE3m9fjF7k9y9FNxJFiVhKRzzjal
         cBnWZaNSh+XV7zuXTJYDmCPARMNd2LgG22EmIDdMnQFQxFY83/wc1OqezRuKWXQj5tFr
         lLctSUYN0GfxB1HrlCm7Rod1nNKaNQiglQzxs/e3hk7Fmhs1QoBrfnj9BdJUqaOYDToX
         d3/MinEb8tXFBaAVhep/pe7L64sE7afHvccxxPlT3FFNuIndEpdsN9p5NfudrTpZfa/p
         0LnboAsDmzj/MwhZd9haI//dfO/PDUZRHo+eSIOZ6xxM3sZcryaekmuKs6X7qu+dIDMq
         qgcw==
X-Gm-Message-State: AFq9FYLPdJ4JX5SDKDK+CKOjHkibordAC74gREFh5+iQCTzKDnpnygn1
	D0YTXqlsU7RHfeu9OVMqPEYJ0hM0zkfUtsNu6IKphforTMTjbBu8tWSDQHV077EosKI=
X-Gm-Gg: AYBFou0ZPcYQ0XUxdU2ZqvHprP8FFJNQyRFMkUIVZLPhiKrkBMSdAmRNNgoFvPPKMU9
	0LWvS6qFOerUxZk09AjfHStQPnCGHwPy91W3XpnVBp63FHaOZND0hgioK/5WPJlDmS66BY8hgw8
	xoX+wC/pn4g/Fl8ib+tbYalZZc771nY0qD85KJIKXnqOSZI0FWn2eji4pD/ZKwjwtHqigvEbh71
	9lPQPZ0ZonDgCeM5+28Y83/iJM/IlRl2BWyr1MEZISNAR8Tl5ccPfGyHFpq1DxNKkg8lNr4lG0R
	eroPBSbjnXK0jQa8ls7JP8Pic0PtYISROqq/kApXztV3Oezepo2fONqjnoeUV6lN/BPsp7+RnzV
	mYAGNSklggv8YlfTfBcm/yxNJJOjBaOJJXup3Nf8bq+xfAc2JgEx6RXQU+4QuCkpEacB5gXqmCx
	TKFPF9kipS1APK0h4JBuBGBRgBJapv/JHgemCyvl4Qzs6n3NRVF76zJciV7KQgGPrZXEVtSzvAu
	J9x+9I0j9clnhK//CnbocB+Ow==
X-Received: by 2002:a05:620a:4709:b0:93b:d7a0:d9e3 with SMTP id af79cd13be357-93ebd259161mr3418844985a.61.1792092696320;
        Thu, 15 Oct 2026 12:31:36 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.245])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a1916b7sm12532585a.26.2026.10.15.12.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:31:35 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:38 +0000
Subject: [PATCH 14/43] io_uring/poll: don't lose a cancel as io-wq arms
 poll
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-14-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092658; l=4279;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=YgsPdJxz6AbftVrQYJwafgyFDrrFMBbZNrYiO4LLmZs=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAE2fruRXRmy5pFtXr+eFPzaNkQMqPmfPiLYEtLZXjPvVIykNzGhv5b9pj8dXmzAPlDm/+p/1/d
 lRo29NkfiNwY=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A request on a pollable file that was forced to io-wq is issued without
blocking there. If that ends in -EAGAIN, io_wq_submit_work() arms poll
for it and returns. It looks at IO_WQ_WORK_CANCEL once, before it issues
the request.

Somebody who wants to cancel the request in between finds it running:

  io-wq worker                          io_try_cancel()
  io_wq_submit_work()
    IO_WQ_WORK_CANCEL isn't set
    io_issue_sqe() = -EAGAIN
                                        io_async_cancel_one()
                                          sets IO_WQ_WORK_CANCEL
                                          signals the worker
                                          = -EALREADY
                                        io_poll_cancel() = -ENOENT
                                        ...
                                        = -ENOENT
    io_arm_poll_handler() = IO_APOLL_OK
    return

Nobody looks at the flag again, and the signal doesn't matter to a
worker that doesn't sleep. The request is armed as if nothing had
happened:

 - a linked timeout completes with -ENOENT, and the request it was
   meant to limit waits for as long as it takes.
 - IORING_OP_ASYNC_CANCEL returns -EALREADY, and the request stays.
 - IORING_REGISTER_SYNC_CANCEL waits for the request to complete if it
   gets -EALREADY. Since commit 5623eb1ed035 ("io_uring/tctx: add
   separate lock for list of tctx's in ctx") it doesn't sleep but spins,
   so its next attempt finds the armed poll.

The same goes for a multishot poll, recv or accept that is armed from
io-wq.

With a read of an empty pipe, IOSQE_ASYNC, and a linked timeout of 5ms
or a cancel in the same submission, in a guest that is slow enough (TCG,
KASAN), the request is lost in 21 of 24 rounds of 40 or 100 attempts.

While it arms poll from io-wq, __io_arm_poll_handler() owns the request.
Look at the flag once the request is in the hash table. The table is
searched and the request is added with ->uring_lock held, and the flag is
set before the search. So either the search finds the request, or it
came first and the flag is seen. With the request marked as cancelled, the
task work that is queued, right away or because ownership can't be
released, fails it with -ECANCELED.

What the canceller is told doesn't change. In this window a linked timeout
still completes with -ENOENT rather than -ETIME, a cancel request with
-EALREADY, and one with IORING_ASYNC_CANCEL_ALL or _ANY with a count that
doesn't include the request. But the request is cancelled, so what is new
is a request that completes with -ECANCELED after such a result.

This doesn't help in two cases:

 - IORING_ASYNC_CANCEL_ALL and _ANY, if the work is flagged after the
   test added here, while io-wq still has it as the current work of the
   worker. io_cancel_cb() stamps it with the sequence of the cancel, so the
   search of the hash table on behalf of the same cancel takes it for
   done and skips it.
 - requests that are parked elsewhere by io-wq, like IORING_OP_FUTEX_WAIT
   and IORING_OP_WAITID. They have the same problem.

Fixes: 90fa02883f06 ("io_uring: implement async hybrid mode for pollable requests")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/poll.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/io_uring/poll.c b/io_uring/poll.c
index 5447a7c24dce..577ae978bfc9 100644
--- a/io_uring/poll.c
+++ b/io_uring/poll.c
@@ -617,6 +617,18 @@ static int __io_arm_poll_handler(struct io_kiocb *req,
 
 	io_poll_add_hash(req, issue_flags);
 
+	/*
+	 * Whoever tried to cancel the request while io-wq was running it has
+	 * flagged the work item. If it searched the hash table before the
+	 * request got there it found nothing, and it won't come back. Both
+	 * the search and the insertion are done with ->uring_lock held, and
+	 * the flag is set before the search. If the search came first,
+	 * the flag is visible by now.
+	 */
+	if (ipt->owning &&
+	    (atomic_read(&req->work.flags) & IO_WQ_WORK_CANCEL))
+		io_poll_mark_cancelled(req);
+
 	if (mask && (poll->events & EPOLLET) &&
 	    io_poll_can_finish_inline(req, ipt)) {
 		__io_poll_execute(req, mask, 0);

-- 
2.55.0

