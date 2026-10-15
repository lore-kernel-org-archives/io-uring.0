Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDA04A3D3E
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092734; cv=none; b=lSQ0QfNJg5/Zsh174r+IwCHvmIzQnvVBoljQIn6RFt/FFbkCVJD9fsMVhjKJhrUnCMxZtlThCB/s58Riclxq/OUqd77MpMNtMLc7KImgvOqNqwXA14IXyW/mrIU6ZG0vk/TDl1Syl3UcfU4658or/5f2vWMXorKgK4cGPmQ7vAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092734; c=relaxed/simple;
	bh=yJ3LFcuIicHJSlhD1OidMmduuABQTPrddgdkxXWqoq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QrJJkihKYCGYPj7x0I3qlp8/ICpHR2q0l2MPhiFjDA6cZDIrOP6gG2gmkR4lj5s8J8D97ImKWiCpBHXTGB46tFzqtujNBUt3znOnGL6jveKvqaH0FcPwOGXlctbnj01UHNYJcEnwaIW1BJjt44iNEDvXnP/QiK3/K9+RzfPkGWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=YY3Y0akf; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="YY3Y0akf"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5361e313e63so9678301cf.3
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092732; x=1792697532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OAQflaams192BBXwRZ+JBxVjOdQ73UhLcZig50Pr3Bo=;
        b=YY3Y0akfTqdLWgIAIaHDN6Sv0mQ9HmbzMbR8BOYmTKJG2PKDkVk7U7szFxSJqE8jCh
         ARuhSnPzWm/rOfQWPXm33CGHlLFcJJVJ2VmOjwOvcOcp0yRIpP6O/2JfenMYFABfhFGI
         I4yZXV7laL0Mkr6t+Z3QsXssAGrpHDAywdIn908jDiHgZMH6Xu+ROTbStqhjfsElOibq
         tYxfca0ihoTQcBU+dZcmir7DzRW3pjKUNOYkXp2Fh22/9M4lLVpCyDP3W9clpvZtkcEE
         EIy9mKFOy6pTl6UXNDCPAhHuuEoogKR2WM4e1pKlUbDb5DArtiXN1RG1onVsgIMTvxbN
         LAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092732; x=1792697532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OAQflaams192BBXwRZ+JBxVjOdQ73UhLcZig50Pr3Bo=;
        b=aABT+1kpmVe+P68AEmMcdme8QMVaWdvWfize38jM8RTXWDWVPJ072/BsR9fD7qavd4
         rZAHHHbGw8k3kMXBQsEq9HyGDhvuzFxZ8zQIuHNM1A+M2HPky5nW+JqXKS2zDreBKBXb
         Xnkyf3wjpUOPkPhzIpuyvpQVjcF/hjpPukadrClFTy2Cs7aYJG26VtSMxWi1eIaQgtF+
         a8IsZZzmD+JBQe/myxVcQ71zohWHNNEDEOFoFZgpM7oLyXedPRvsAhhpBBT3Hr6bWS75
         vHxbsc/PMSYJqzendrxFex+uCws+M9FbGvghopQO09hXKPTUn63G78PWBCrb+v0O/PH3
         zE6A==
X-Gm-Message-State: AFq9FYLo1WFxZ8WcGsW39yNLzMCpAuEOH2LPhjOlqcQigEWWqvho08Kg
	pDjsdytI+HKTsa913fdugvn+4xzxk9g3xrqxnIVgv1He7e8+Nsyqvps78aYE9FQJJJ8=
X-Gm-Gg: AYBFou2Q61nknE3jqohBhH0uy4YsiNBWn3bTJSE+PUgC+RAZmsDSCdtCG04GWW/qMxk
	Z+SbXEnkwX+5YkIJop1DvgCJ9KQ8lKv2e++ZJWDsyd3+oSay7dVzvR8ppGjZXIIENAvSBMLg7uP
	Jb7HZOEG7weei/4ReHxckp8pQhTVmPyOHYUfncyzZGpB91g//QdWQxg4AgBEPx8mgA7IxEWRcdz
	US6cW1jSwUH6paJUAxcHOlt250dVA5U6m1c2jy8E9k39Ma46wV9vkIyqkPD/WFuAmexsY74HoA8
	vsD5zbwPcRE6cQrJlxJ2J9yviE05RCCnQMSgnkwfvqEsS7ktmixj1xcGFf1hTlhVkquu6Xr2zDV
	EN9kYl7rtsoSNH/8UsF75QE781fWpznk17914sq4pEvBMRYGdIeE5mUmcHrTLDDyW74s/AsokC+
	ks3aY9N7sGL1YoBD9xVrPMq+XQfEFx3IQon9ii3OehlUiWMZ30NYqNl+Duvdva47HGbPJIdc6XW
	YNA8EqnhUfGHUA=
X-Received: by 2002:a05:622a:13ca:b0:535:25db:17ae with SMTP id d75a77b69052e-5359f48cabdmr333342461cf.11.1792092732574;
        Thu, 15 Oct 2026 12:32:12 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.245])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362aaaec01sm1367371cf.31.2026.10.15.12.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:32:11 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:55 +0000
Subject: [PATCH 31/43] io_uring/timeout: use the right clock for ABS
 updates
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-31-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092659; l=2690;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=yJ3LFcuIicHJSlhD1OidMmduuABQTPrddgdkxXWqoq4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCNm/tHB1rxe8TTPr03ETp4uG/MZG5US2ByYfzcQnwa3yULEd0HkujWI1DmKJF/DCbSvmEMHoE0
 34ppvoa25EAY=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

io_parse_user_time() converts an absolute time from the time namespace of
the caller to the host's view, for the clock given by the flags. The
flags of IORING_TIMEOUT_UPDATE and IORING_LINK_TIMEOUT_UPDATE can't name
a clock, the updated timer keeps running on the clock the timeout was
set up with. So the time is always converted as if it was
CLOCK_MONOTONIC.

In a time namespace with a monotonic offset, that moves the new expiry of
a CLOCK_REALTIME timeout by that offset, although the clock isn't
affected by time namespaces at all, and the one of a CLOCK_BOOTTIME
timeout by the difference between the two offsets.

Do the conversion when the timeout has been looked up and its clock is
known. The update is run by the submitter, its SQPOLL thread or one of
its io-wq workers, all of which share the time namespace.

Fixes: 9cc6bac1bebf ("io_uring/timeout: honour caller's time namespace for IORING_TIMEOUT_ABS")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/timeout.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/io_uring/timeout.c b/io_uring/timeout.c
index dbcd0242d8f6..90d440a75f28 100644
--- a/io_uring/timeout.c
+++ b/io_uring/timeout.c
@@ -458,6 +458,8 @@ static int io_linked_timeout_update(struct io_ring_ctx *ctx, __u64 user_data,
 	io = req->async_data;
 	if (hrtimer_try_to_cancel(&io->timer) == -1)
 		return -EALREADY;
+	if (mode == HRTIMER_MODE_ABS)
+		ts = timens_ktime_to_host(io_timeout_get_clock(io), ts);
 	hrtimer_setup(&io->timer, io_link_timeout_fn, io_timeout_get_clock(io), mode);
 	hrtimer_start(&io->timer, ts, mode);
 	return 0;
@@ -479,6 +481,8 @@ static int io_timeout_update(struct io_ring_ctx *ctx, __u64 user_data,
 	/* for a multishot request this isn't a sequence, keep the repeats */
 	if (!(data->flags & IORING_TIMEOUT_MULTISHOT))
 		timeout->off = 0; /* noseq */
+	if (mode == HRTIMER_MODE_ABS)
+		time = timens_ktime_to_host(io_timeout_get_clock(data), time);
 	data->time = time;
 
 	list_add_tail(&timeout->list, &ctx->timeout_list);
@@ -511,7 +515,12 @@ int io_timeout_remove_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 				  IORING_TIMEOUT_ABS |
 				  IORING_TIMEOUT_IMMEDIATE_ARG))
 			return -EINVAL;
-		ret = io_parse_user_time(&tr->time, READ_ONCE(sqe->addr2), tr->flags);
+		/*
+		 * The clock is that of the timeout to update, an absolute time
+		 * is converted to the host's view once that has been found.
+		 */
+		ret = io_parse_user_time(&tr->time, READ_ONCE(sqe->addr2),
+					 tr->flags & ~IORING_TIMEOUT_ABS);
 		if (ret)
 			return ret;
 	} else if (tr->flags) {

-- 
2.55.0

