Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A19D48F001
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092702; cv=none; b=Ecyz4X/9IysnouSxmazG+y50CyjaDNPML7PmPBTVXcMrT9VgOcVLOtes+a0mMAzW/OlFV5kwWea1REIigQEsInpIBhOiZES4JOmikmKoWZjpbpLziKBmjRkTH+NUreUpFUaU+8+/uk/m4IdSwrcQLNKCKuNEGViMlVMq/MbPyNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092702; c=relaxed/simple;
	bh=G0FttVnjy2nSY/e+tG/IPCee2xbfRLfvL8EfTSi+kCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZaZrqrYMd7sO5VFGEkMNae/ZgAbsvgpmftL7uJRXwJjJNqEqCDb6CiFRk+kEZDK62/OzdlEVVaxsW8T27wEXkK83QjuE4LVqhP1fjsqOCS6YR4kECA1OrEoXa96ze+3Ss5PVD5YAouzUUzLFE1GDmumvMX8aM0F1szoCkNpRLfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=D55iyf9o; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="D55iyf9o"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-917997ab0d9so66414576d6.3
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092700; x=1792697500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eose+N114zn/g+bj7VaPJ27IyLQh+I9OAYEi+aNKTnw=;
        b=D55iyf9ooxm5/t5YBS2W0ecHrGnAuFPAcakjryxt3+UH7rRLEJFNuUc/8UmLpko+2s
         D/bm1qbOJVogs20GqAWIHr5IcuUD/YJqdTkjguY+DeFZ9reLcf+Mizo0snY5nDjPjDq+
         Z5HQMD1ivkIT3q79S8pvONF/AELDt8iJWJkUsgYD0zr2RaaCZPP8AJbFy47x6DK799Ew
         T0FnqTErbHJj1CapmjlV0zetXP9f6knru7vfPfBARWDoQB2VciiIZVVqgz5G61V2r7ZQ
         VaxoaJaxqRIcPPC69CZx6BrG1ihSK6D8QEhRWd9TnDnIhn6QlllstzRFYiBIuKXJXiXV
         f6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092700; x=1792697500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eose+N114zn/g+bj7VaPJ27IyLQh+I9OAYEi+aNKTnw=;
        b=ASLsdti5eOiNW6GLbGWHOYryPqwQzDrJPsxq6NvDWWPoNETpKqYthm3H9v0FMTQYJH
         ayFibUhOKzQS8/ENA4mRQ2KOn2wBuETm0ez9bt9ihWxJqhnco4f2SdcPTYA5s4PU4dFc
         nnHcOafdfdl3oAfvd8ax7NkkPDSdR4xow6AY4Panh2epVPAKjieUGtAZ9k4Xvx0acDMA
         zDkdLUCjx9pj/aVErO3ep207uxrsv3/3mHwcwxSWfXtzDljaKkFnFmoPRSk+PG6xZPLV
         NpEEdQKfkqXb66v7gS2ricw+cvxubhS7HVB/8rndzpwfMCyWhUBSHnDdGosFH6omM5sT
         dRpQ==
X-Gm-Message-State: AFq9FYK7Wo5W/dzzNmqFBKtz2zkx8iy/FSi4Sza5d3G/XpYeHfTYeBAG
	873spoIh9QXkuGLHV48RFWXBkA5maSnif5oA8Y4c4Uqtg5/4sxtC0ieYw+ki0aKHk/c=
X-Gm-Gg: AYBFou3bML4ud+IrZbNpIKTsPYlS/DTukZTUdsrP8UhZ1eEuPghr7BcG3Duvao/Do5b
	Co5HyRzqHOonMqlFyk8QELWvOS/YRDNITcyjkeCtdfDhb3IeHvRne30OdN7jy7fhLKJ+oRdAv0f
	iz7aq1U+fTEhlnvQ7sR/o8v4iezNouCPqlB+svB2Kr9xn6iIvozDnWijpqzlF4yfufBJaNjfIC4
	Vjf7Eo3RXoOyHhoPnJwyccPsiafuUlOUP/0pDlVmVUbGBXLc9H0fT1TlLSBp39eLeSzjvKre6Fb
	bWJX0buJvd9Ff/c8fd0H0l/73invm0X2cN1Y2QTNIn6uU8eLKq77kHXb3/7QoEuSFCObal7rrNS
	9U89/Nyp8gDZK92CSRP7w//O9PiKmCGH9jbEu4saQCVNmcgZHzO2FyXZaiAjmEU0S2IMsTroO9/
	QFARvOp6t6H1d1RgxipByb00efosYKu0AuQxCRzvlRvAtCaRGm24Sg1dgIAbPTECawPMVA1NKT6
	HLy/QjUtxGX0mE=
X-Received: by 2002:a05:620a:1726:b0:93e:7ec5:1832 with SMTP id af79cd13be357-93ebd1dff54mr3355051085a.23.1792092700013;
        Thu, 15 Oct 2026 12:31:40 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.253])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcb8b6323sm3727606d6.6.2026.10.15.12.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:31:39 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:40 +0000
Subject: [PATCH 16/43] io_uring/cancel: don't forget that the work was
 running
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-16-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092658; l=3559;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=G0FttVnjy2nSY/e+tG/IPCee2xbfRLfvL8EfTSi+kCY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QH9YC5B+dIbdtC3MK4LgLIHmPIXE+oBMQ0XvKcPn8tw8pFsViPdGf7esxu29q/HI/n/JenlgyON
 rnbPu6kI83w4=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

If the request to be cancelled is being run by io-wq,
io_async_cancel_one() flags the work, signals the worker and returns
-EALREADY. Since commit ccbf726171b7 ("io_uring: perform poll removal even
if async work removal is successful") io_try_cancel() goes on regardless,
as poll may be armed for the request. If it isn't, and nothing else turns
up, the result is the -ENOENT of the last search.

__io_async_cancel() makes up for that. On -ENOENT it tries the io-wq of
every task that uses the ring, and that of the caller is one of them. So
the work is found a second time, and the result is -EALREADY after all.

Unless the worker is done with it by then. If the work is flagged before
io_wq_submit_work() looks at IO_WQ_WORK_CANCEL, all the worker does is to
queue the request to be failed by task work. Then it isn't anywhere to be
found until the task work has run, and

 - IORING_REGISTER_SYNC_CANCEL returns -ENOENT,
 - IORING_OP_ASYNC_CANCEL completes with -ENOENT,

for a request that they have just cancelled, and that completes with
-ECANCELED.

With a read of an empty pipe, IOSQE_ASYNC, and a sync cancel right behind
it, 1 to 3 of 1,000,000 calls return -ENOENT, and 50 to 110 with
IORING_SETUP_DEFER_TASKRUN (4 CPUs, KVM). Nothing is written to the pipe,
and all of these reads end with -ECANCELED.

Remember that the work was found. IORING_OP_ASYNC_CANCEL completes with
-EALREADY, as it does if the worker is a bit slower. For
IORING_REGISTER_SYNC_CANCEL it means to try again, which ends with 0.

The result of a linked timeout, which calls io_try_cancel() by itself,
and the number that is returned for IORING_ASYNC_CANCEL_ALL and _ANY don't
change.

Fixes: ccbf726171b7 ("io_uring: perform poll removal even if async work removal is successful")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/cancel.c | 13 ++++++++++++-
 io_uring/cancel.h |  2 ++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/io_uring/cancel.c b/io_uring/cancel.c
index 64eb4a993c00..290ce804c868 100644
--- a/io_uring/cancel.c
+++ b/io_uring/cancel.c
@@ -117,6 +117,8 @@ int io_try_cancel(struct io_uring_task *tctx, struct io_cancel_data *cd,
 	 */
 	if (!ret)
 		return 0;
+	if (ret == -EALREADY)
+		cd->running = true;
 
 	ret = io_poll_cancel(ctx, cd, issue_flags);
 	if (ret != -ENOENT)
@@ -180,6 +182,7 @@ static int __io_async_cancel(struct io_cancel_data *cd,
 	struct io_tctx_node *node;
 	int ret, nr = 0;
 
+	cd->running = false;
 	do {
 		ret = io_try_cancel(tctx, cd, issue_flags);
 		if (ret == -ENOENT)
@@ -204,7 +207,15 @@ static int __io_async_cancel(struct io_cancel_data *cd,
 	}
 	mutex_unlock(&ctx->tctx_lock);
 	io_ring_submit_unlock(ctx, issue_flags);
-	return all ? nr : ret;
+	if (all)
+		return nr;
+	/*
+	 * The worker may be done with the work that was found running, and
+	 * flagged, above. That isn't the same as not having found it.
+	 */
+	if (ret == -ENOENT && cd->running)
+		ret = -EALREADY;
+	return ret;
 }
 
 int io_async_cancel(struct io_kiocb *req, unsigned int issue_flags)
diff --git a/io_uring/cancel.h b/io_uring/cancel.h
index e49713a1bc66..484fa5e7ffaa 100644
--- a/io_uring/cancel.h
+++ b/io_uring/cancel.h
@@ -11,6 +11,8 @@ struct io_cancel_data {
 	u8 opcode;
 	u32 flags;
 	int seq;
+	/* io_try_cancel() has found it being run by io-wq, and flagged it */
+	bool running;
 };
 
 int io_async_cancel_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe);

-- 
2.55.0

