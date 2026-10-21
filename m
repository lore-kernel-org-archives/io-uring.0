Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792622065;
	b=XJKnmpB0LVOKdTA3wSu2Cu3CRn1skhaefDRpIzvCbDwSjDGV/jp9fCRVMYd8ir6FODHa
	 p/OurrPQ6iYHGLxaWKGitqgYFdrqtpyDgDShDycCWm8E+M+w4B4BZEubvDYRkltHSBbWV
	 GDybrcH8AIeeYetaP2/mlN3zXorPB3YWuU/H3YwzsMujZN0aG2Xnvs/3lBVOnw5B+D2ml
	 foeiqIEmVDGT9NB0c5awwrCHhuIT6idb4D07bqW1oEgoaavVJcJAB56Bpxi4sXY6W6//C
	 iJQWMb5v7CRcvp5OjBdH49vv61MBtevHBfEtAyQ9OQoRb5ph+OUPRN8x3uTlkLh20mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792622065;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:X-Mailer;
	bh=/+dOUKuJjRWZZChLHmGk1S3KYSfgcPjRzqFPXNOTHNo=;
	b=iW1bKnBkmvM1nmJhtbpA9LvFNggVyBddAJZvJjcmy/tBUYYQYmSc1G7AEPD8JizdKyAg
	 35XPxXVISO72Bqg7lB54jr0LRblWi2t8xQiybqTsabV8tYvKT+8Wllr5q1r8UtXG8zWs+
	 WBZX/+wpford4XYj5ZejD/2IkVK1UN46hjhh4rVfOhWecY9vkwYYastGvI8JEcOXsw4It
	 uFlQ0wHliGxfWHPyOo73FeZVEr3wP5PRPf53dX+sbYhm/2QkXOoK53kzazciBE7vgpL2s
	 7otq8SIJszk5p49KobJrKDg2edrOWL3IA+7c6WZvklW20DYSjvKVcp6+x90xo9VVFTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fastmail.com;
	spf=pass smtp.mailfrom=fastmail.com;
	dkim=pass header.d=fastmail.com header.i=@fastmail.com header.a=rsa-sha256 header.s=fm2 header.b=aStgbZxC;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=yUHwTPCl;
	arc=none smtp.remote-ip=103.168.172.148
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E9F606A319
	for <io-uring@vger.kernel.org>; Wed, 21 Oct 2026 22:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17E9F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fastmail.com header.i=@fastmail.com header.a=rsa-sha256 header.s=fm2 header.b=aStgbZxC;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=yUHwTPCl
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 59294EC0367
	for <io-uring@vger.kernel.org>; Wed, 21 Oct 2026 18:34:24 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 21 Oct 2026 18:34:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1792622064; x=1792708464; bh=/+dOUKuJjR
	WZZChLHmGk1S3KYSfgcPjRzqFPXNOTHNo=; b=aStgbZxCm00oGn0NbUrgEu8J3c
	FYinbz3/QAowsknkcJ1qeE9AV0Zoav99GF0WBQERyOY0KdDoeJf6gNWX5PfH9A/m
	jBmT7QbDVNMWazzQMFdizi/j2zx+HU6fPffdjf7ODoQxrzcVOj/x2E8mcE7rLl2N
	+T+J646DsaD6An1Kndv5Y8z+S8MfWHV68NPNDWol89DeSp0FQlNC5MYw0brHLMO6
	iVCeiq+Gizjh/h6H1W4H2wfakYwNWdhz9Lh7BWMI+gwgeuoFChciEnZ8Vi0mhRM9
	1xNEj0rQTPnJz78YeXnKUm0sCeIUTg+Gdvpu37VRMo9WlIHzBhAr8lTYnNTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792622064; x=1792708464; bh=/+dOUKuJjRWZZChLHmGk1S3KYSfgcPjRzqF
	PXNOTHNo=; b=yUHwTPClUtbxVjIe/Hrbmr32hbTZyjGn7uFaQ/pOw2zSHp86Zoc
	IB8mDvJJcxjBVJOfKxb7xZR/yIiALfYK3mkeObPMzwMN/4A7XAqwTn+/phTjhxwq
	m8oJ5zdRmq8lcSZW5uB+bvofvqC1M0v2ocnsLjJPrVpvDTH4cLB8klM7oGUT6H6c
	Sw+fT4CvdnT8XBYD4u4TC8I4z5NRhu7kJhUnZcmZ80BXhPQfTPAmDgdAuLRRuBw4
	pPDER+ahLTIjNoZW+IahAWDjLic8xb2+P3T/ywZql2aZye12nmMudoN9AVZe91UX
	bcyF2IZVjjQ2/0TA+D+7lK5hUgnPCNPpVIg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=fastmail.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792622064; d=fastmail.com;
	mf=PGp1YW5sdUBmYXN0bWFpbC5jb20+;
	rt=PGlvLXVyaW5nQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:ZIDrjP4H/fNE9zWZsNpkq6/2NzDp9779GbWj5Qy+6k+Kb//
	5jNizfrc3CzeqDFd8wUrgcXGGoqZhA1sbMSHOL4u/1o5w7As3SpCurihluBQEAco
	4L5yrMgk6+GdHvtVSrsr6Iv7AqpvnuUYv9mVvqaxPGrOXchZV9S1fUnQaeQkiyin
	fu5NKQ340ulOPbBryfynPujUqdZIl1DplmdYNkv7MUBwZw1Eeni2Powdfu1Tz8EI
	xTQFh0R4uyXICtG0ytbUoYVEFp3R0YmofBMuQbY0f5VciJpIhE6QZkNcq8Uwfqa0
	L45athmTXL12Lojsox1+P12ma10AL3dejrTgrNQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:JwysM8MqjrwAUT1kSH5cMYsPI4/RFCzmuxKUd/dGfKo=:PHMqsF2UZNKNdg+07SsT4FIO3sm+7hzIaFwdhEUVMjU=;
X-ME-Sender: <xms:8D3ZaqO2npHGFskMBH2qzIIfIYewUbu3hRGYWWjn3jAQi2pwgQpAlg>
    <xme:8D3Zav5JjvcXElFPhweZwkNVQZC_p8TPGZCy1bo-qGxnYICvxkpghfwrm4os3I0FQ
    NcLO6KD12Fdz2gHcvIKLfiHJhP0WaGUTJfJF8kiA1rSxrr6waV8qog>
X-ME-Received: <xmr:8D3Zam4gWjSaYdSfWGdICigpD9qmdGrKg7SegufBw10FC0aVfYstUbRD3Hb34l8r8CnPilx6t-I61xO5hbg>
X-ME-Proxy-Cause: dmFkZTEh9muSI4ttitXCoJ+CJSPjHMrLYY9gakxYL+IpGULxQR7TFv/ue93jLN/R0RT6dk
    NDn+qtaor9E5jxWGxsUS1qYMzDkEN77DBG+AyvTtsXDsd75dhI32yw6Epo+twz3pKyEmUp
    /f55QfXaZAiujP7rGI8OaSpVp83bH2ABfD/z3+8EcDmvLUTSJIrEwp7vxc/zpJoGwTLKFh
    gR5Lrr1hOAC45oPlLfe2xDwpNk5FhhzBXZmInim80VB12cltQRJXWOvIkzgklK6cL7po1y
    ta+vQm7vHPIdsCVHpTPF9vpk3dtfY8rRYJ/e5fpkFBkiOENeHfHzCc+bFInX5oTejYpzac
    kYXIi7GcO52wUm6GlyBocJwbFdNw+7j7tmCpW/lgZG4Qc+oqQudWcwXs7z4cmsb2C5baa8
    uCWeGHiK3IlV1ATRGulUrURtkxP4i8SSXnHsXl5dAwoIlij4TVqTCi3DabEkQTJkWXHzLz
    4HkYMTHM8wd+uQ2POXL80whRYI8B+pARpSUI/dKhIGYoNGNuEzoPkF3LZ7ikj3kKe+XGd7
    kA2mulBJshcX8IbcV5wPOsl0pylZF98Rp115vwS1NR5g5GeWADJ+DWed7IUbmwgaq15qyK
    DWyVq5nNQXrD9buenL8ypmU5V7ksHoPeYA9MvDWtNDeor6JmEIiaVLyBgn9A
X-ME-Proxy: <xmx:8D3Zav0jYPW2VzBefzlDbP9bZjbskbCOcrDHOFToqu_x2Gh4CmsDcA>
    <xmx:8D3ZaiWWpQ5ZuoCNQqKq03ruEfnv1C_o1Ij4iAIajKxrYcGlyBEy_w>
    <xmx:8D3Zaq4YLUO5WWozYsqAjzbiRP_XRGaa_FQAHOXg7LelbQ7FcJJuzA>
    <xmx:8D3ZapLfxtGdIWo8wNKQQdSaO2GBwD7IRNA8KHSFS21QzJhjODtF5w>
    <xmx:8D3Zaq9sSZ5-lOP100gn9_rJCwo0Y_QQRbXdqOkBQuPtQ0S_1AfBNYGs>
Feedback-ID: i80b64ba7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <io-uring@vger.kernel.org>; Wed, 21 Oct 2026 18:34:24 -0400 (EDT)
From: Juanlu Herrero <juanlu@fastmail.com>
Date: Wed, 21 Oct 2026 15:34:18 -0700
Subject: [PATCH RESEND] io_uring/mock: introduce poll wakeup cmd
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-mock-poll-kernel-v1-1-83b635e8b125@fastmail.com>
To: io-uring@vger.kernel.org
X-Mailer: b4 0.13.0

Add IORING_MOCK_CMD_POLL_WAKE to issue a controlled number of immediate
wakeups and to prep another batch for the next poll() call. The next
batch is issued after poll_wait() installs the waiter, allowing a test to
inject a wakeup from inside a vfs_poll() recheck.

Assisted-by: LLM
Signed-off-by: Juanlu Herrero <juanlu@fastmail.com>
---
Commit 937d38dcacd6 ("io_uring/poll: avoid retry wakeup loss when
dropping ownership") fixed a race where a poll wakeup could be lost
between consuming IO_POLL_RETRY_FLAG and dropping request ownership,
stalling the request until another wakeup arrived.

Add a mock-file command that issues immediate wakeups and arms another
batch for the next poll() call. This lets the liburing test trigger a
wakeup from inside the vfs_poll() recheck and reproduce the race
deterministically [1].

[1] https://github.com/axboe/liburing/compare/master...jlhe97:liburing:mock-poll-test
---
 include/uapi/linux/io_uring/mock_file.h |  9 +++++
 io_uring/mock_file.c                    | 61 +++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/include/uapi/linux/io_uring/mock_file.h b/include/uapi/linux/io_uring/mock_file.h
index debeee8e4527d..14518b8ecc363 100644
--- a/include/uapi/linux/io_uring/mock_file.h
+++ b/include/uapi/linux/io_uring/mock_file.h
@@ -9,6 +9,7 @@ enum {
 	IORING_MOCK_FEAT_RW_NOWAIT,
 	IORING_MOCK_FEAT_RW_ASYNC,
 	IORING_MOCK_FEAT_POLL,
+	IORING_MOCK_FEAT_POLL_WAKE,
 
 	IORING_MOCK_FEAT_END,
 };
@@ -38,6 +39,14 @@ enum {
 
 enum {
 	IORING_MOCK_CMD_COPY_REGBUF,
+	IORING_MOCK_CMD_POLL_WAKE,
+};
+
+struct io_uring_mock_poll_wake {
+	__u32		events;
+	__u32		nr_wakeups;
+	__u32		nr_wakeups_on_poll;
+	__u32		__resv[5];
 };
 
 enum {
diff --git a/io_uring/mock_file.c b/io_uring/mock_file.c
index b318ed697998e..19f87a2567bb1 100644
--- a/io_uring/mock_file.c
+++ b/io_uring/mock_file.c
@@ -24,6 +24,9 @@ struct io_mock_file {
 	u64			rw_delay_ns;
 	bool			pollable;
 	struct wait_queue_head	poll_wq;
+	spinlock_t		poll_lock;
+	__poll_t		poll_wake_events;
+	u32			poll_wake_count;
 };
 
 #define IO_VALID_COPY_CMD_FLAGS		IORING_MOCK_COPY_FROM
@@ -90,11 +93,56 @@ static int io_cmd_copy_regbuf(struct io_uring_cmd *cmd, unsigned int issue_flags
 	return ret ? ret : -EFAULT;
 }
 
+#define IO_MOCK_MAX_WAKEUPS	1024
+
+static int io_cmd_poll_wake(struct io_uring_cmd *cmd)
+{
+	const struct io_uring_sqe *sqe = cmd->sqe;
+	struct io_mock_file *mf = cmd->file->private_data;
+	struct io_uring_mock_poll_wake arg;
+	void __user *uarg;
+	u32 nr_wakeups;
+
+	if (!mf->pollable)
+		return -EOPNOTSUPP;
+	if (sqe->ioprio || sqe->__pad1 || sqe->addr3 || sqe->file_index)
+		return -EINVAL;
+	if (READ_ONCE(sqe->len) != sizeof(arg))
+		return -EINVAL;
+
+	uarg = u64_to_user_ptr(READ_ONCE(sqe->addr));
+	if (copy_from_user(&arg, uarg, sizeof(arg)))
+		return -EFAULT;
+	if (!arg.events ||
+	    arg.nr_wakeups > IO_MOCK_MAX_WAKEUPS ||
+	    arg.nr_wakeups_on_poll > IO_MOCK_MAX_WAKEUPS ||
+	    !mem_is_zero(arg.__resv, sizeof(arg.__resv)))
+		return -EINVAL;
+
+	if (arg.nr_wakeups_on_poll) {
+		spin_lock(&mf->poll_lock);
+		if (mf->poll_wake_count) {
+			spin_unlock(&mf->poll_lock);
+			return -EBUSY;
+		}
+		mf->poll_wake_events = arg.events;
+		mf->poll_wake_count = arg.nr_wakeups_on_poll;
+		spin_unlock(&mf->poll_lock);
+	}
+
+	nr_wakeups = arg.nr_wakeups;
+	while (nr_wakeups--)
+		wake_up_poll(&mf->poll_wq, arg.events);
+	return 0;
+}
+
 static int io_mock_cmd(struct io_uring_cmd *cmd, unsigned int issue_flags)
 {
 	switch (cmd->cmd_op) {
 	case IORING_MOCK_CMD_COPY_REGBUF:
 		return io_cmd_copy_regbuf(cmd, issue_flags);
+	case IORING_MOCK_CMD_POLL_WAKE:
+		return io_cmd_poll_wake(cmd);
 	}
 	return -ENOTSUPP;
 }
@@ -168,9 +216,21 @@ static loff_t io_mock_llseek(struct file *file, loff_t offset, int whence)
 static __poll_t io_mock_poll(struct file *file, struct poll_table_struct *pt)
 {
 	struct io_mock_file *mf = file->private_data;
+	__poll_t wake_events = 0;
+	u32 nr_wakeups = 0;
 	__poll_t mask = 0;
 
 	poll_wait(file, &mf->poll_wq, pt);
+	spin_lock(&mf->poll_lock);
+	if (mf->poll_wake_count) {
+		nr_wakeups = mf->poll_wake_count;
+		wake_events = mf->poll_wake_events;
+		mf->poll_wake_count = 0;
+	}
+	spin_unlock(&mf->poll_lock);
+
+	while (nr_wakeups--)
+		wake_up_poll(&mf->poll_wq, wake_events);
 
 	mask |= EPOLLOUT | EPOLLWRNORM;
 	mask |= EPOLLIN | EPOLLRDNORM;
@@ -247,6 +307,7 @@ static int io_create_mock_file(struct io_uring_cmd *cmd, unsigned int issue_flag
 		return -ENOMEM;
 
 	init_waitqueue_head(&mf->poll_wq);
+	spin_lock_init(&mf->poll_lock);
 	mf->size = mc.file_size;
 	mf->rw_delay_ns = mc.rw_delay_ns;
 	if (mc.flags & IORING_MOCK_CREATE_F_POLL) {

---
base-commit: ecb6817b769fd7d71af2c9f446188649020b2e53
change-id: 20261020-mock-poll-kernel-3d2624fb7d28

Best regards,
-- 
Juanlu Herrero

