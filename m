Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A89239E9B
	for <io-uring@vger.kernel.org>; Thu,  8 Oct 2026 23:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791500966; cv=none; b=JYT4Jm2VLPoJ/NEIfsi0e1VBZgWJTMR4Llq+x7JFN8wkyGRCkInqw43+9jeC1oHkFsSbrfGBiMfHRSi6ajIzI+k2pp+uIq4b9w83nvp8VLXvwl8ZH7jk26cI312YjMInjJhm8WqP7Tz+Se+aUEfuZNGqL0T8Qn1avM9Wa8xfmaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791500966; c=relaxed/simple;
	bh=ldKSFF0eexhYgtVaWOy5x51QXFkdFFZfJVqIboomcx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=R0NXrbH5+ub6TDcfK+WFxtVVdWlNNRgKZykAa87bMjurj+jgaJR4LCU8w8bapyY3ACSi0AzSSoLMbZUN/9Tsgos39S10mTuB6DrYeLb8cwPgs3n0uY8Iey7JzUUzlITgmLJF/RuDiDbdsUEm33HsulLIqS7HbSmRwFQr44iAN1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UtTI6D2b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UtTI6D2b"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16306C2BCC7;
	Thu,  8 Oct 2026 23:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791500966;
	bh=ldKSFF0eexhYgtVaWOy5x51QXFkdFFZfJVqIboomcx0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=UtTI6D2bRVQyvUTfvBae5vkYIT61Oh6gvuuSMovI364MUmvcEAo6Gg16LChnEy9b0
	 88JPNvPq7A5DsbTSpyE8QtALbFsaitdw/LZ7suIXkmOEuXaDktSbWJC7w6CqMHyZlS
	 xJ9XCQMYLjTguTPdqROS935IKQjqkV6EgcXcHomVnWwUSkQ06kKTd+nn18nj9+DPF8
	 /ceaK5XTfh8JZTUUUb4Pwl/MV4v+AxJt67PO2OKKJ9tip7FHwIu19qgQavt/DkmBXk
	 fYnM9eZp3cNvayuUhHy9tMsc1S9JNhxMjNVoreCgUYy0gvsNjl6bgmpBRH6hBRmM4E
	 H73vETIX27+Rg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37EACA6017;
	Thu,  8 Oct 2026 23:09:25 +0000 (UTC)
From: Eugene Gvozdetsky via B4 Relay <devnull+gvozdet.gmail.com@kernel.org>
Date: Fri, 09 Oct 2026 01:08:49 +0200
Subject: [PATCH] io_uring/register: don't exempt disabled rings from task
 restrictions
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-iouring-task-restrict-fix-v1-1-a49daf55a12c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQ6CMBCE4auQfXaTtoqiVyE+YB1wNSlmtxASw
 t2t+vhNMv9KBhUYXaqVFLOYjKnA7yqKjy4NYLkXU3Dh6J07s4yTSho4d/ZihWWVmLmXhVH3h+b
 U7IOvQeX/VpT5126vf9t0eyLmb5C27QMRcAbhfQAAAA==
X-Change-ID: 20261009-iouring-task-restrict-fix-e5f48783215e
To: io-uring@vger.kernel.org
Cc: axboe@kernel.dk
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791500966; l=3821;
 i=gvozdet@gmail.com; s=20261008; h=from:subject:message-id;
 bh=cdFQ4UtQGKX6YaASaL+SIz6nnuzTFRGO0iWleVHzN10=;
 b=Lkm1NEveYfQCHaq4n8lZj9IHrtIsrazlCwZd3ItDz4VVg8rh7WmjPV9po/fc3IBtpkfnVBssI
 sDffB9qYal1DLqBnu/K3cyRHAutS9qMVnjD0waQbBwB0FrHsRnQUF8V
X-Developer-Key: i=gvozdet@gmail.com; a=ed25519;
 pk=uTBwpnHhIeOy5EodeIOQfzaWk1OTDqMQTa4YeyIO4ms=
X-Endpoint-Received: by B4 Relay for gvozdet@gmail.com/20261008 with
 auth_id=1138
X-Original-From: Eugene Gvozdetsky <gvozdet@gmail.com>
Reply-To: gvozdet@gmail.com

From: Eugene Gvozdetsky <gvozdet@gmail.com>

A ring created with IORING_SETUP_R_DISABLED is exempt from its register
restrictions until it is enabled. This lets the creator register the
restrictions and then enable the ring with IORING_REGISTER_ENABLE_RINGS,
whether or not that opcode is in the allowed set.

Since commit ed82f35b926b ("io_uring: allow registration of per-task
restrictions"), a ring also inherits restrictions from the task that
creates it, and the same exemption applies to those. A task whose
register opcodes are restricted can therefore create a disabled ring,
issue any register opcode on it, and then enable it.

Mark rings whose restrictions were inherited from the task, and keep
checking register opcodes for them while the ring is disabled. Enabling
such a ring now requires IORING_REGISTER_ENABLE_RINGS to be in the
task's allowed set. Per-ring restrictions registered on a disabled ring
work as before.

Fixes: ed82f35b926b ("io_uring: allow registration of per-task restrictions")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Eugene Gvozdetsky <gvozdet@gmail.com>
---
Tested on v7.3-rc6 in a VM with a test that sets task restrictions
and checks register ops on normal and IORING_SETUP_R_DISABLED rings.
Without the patch, a disabled ring allows any register op. With it,
the task's register restrictions also apply while the ring is
disabled. Per-ring restrictions set on a disabled ring still work
(IORING_REGISTER_RESTRICTIONS followed by IORING_REGISTER_ENABLE_RINGS).
Applies cleanly to for-next.
---
 include/linux/io_uring_types.h | 2 ++
 io_uring/io_uring.c            | 1 +
 io_uring/register.c            | 9 ++++++++-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
index 39629ee77..8126af652 100644
--- a/include/linux/io_uring_types.h
+++ b/include/linux/io_uring_types.h
@@ -322,6 +322,8 @@ enum {
 	IO_RING_F_DRAIN_DISABLED	= BIT(10),
 	IO_RING_F_COMPAT		= BIT(11),
 	IO_RING_F_IOWQ_LIMITS_SET	= BIT(12),
+	/* restrictions were inherited from the task that created the ring */
+	IO_RING_F_RESTRICT_INHERITED	= BIT(13),
 };
 
 struct iou_ctx {};
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index cbea989c5..662475a05 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -2955,6 +2955,7 @@ static void io_ctx_restriction_clone(struct io_ring_ctx *ctx,
 	struct io_restriction *dst = &ctx->restrictions;
 
 	io_restriction_clone(dst, src);
+	ctx->int_flags |= IO_RING_F_RESTRICT_INHERITED;
 	if (dst->bpf_filters)
 		WRITE_ONCE(ctx->bpf_filters, dst->bpf_filters->filters);
 	if (dst->op_registered)
diff --git a/io_uring/register.c b/io_uring/register.c
index 02bc103bc..d0da8f043 100644
--- a/io_uring/register.c
+++ b/io_uring/register.c
@@ -764,7 +764,14 @@ static int __io_uring_register(struct io_ring_ctx *ctx, unsigned opcode,
 	if (ctx->submitter_task && ctx->submitter_task != current)
 		return -EEXIST;
 
-	if ((ctx->int_flags & IO_RING_F_REG_RESTRICTED) && !(ctx->flags & IORING_SETUP_R_DISABLED)) {
+	/*
+	 * A disabled ring is exempt from its own register restrictions, so
+	 * that the creator can set them up and then enable the ring. That
+	 * does not apply to restrictions inherited from the task.
+	 */
+	if ((ctx->int_flags & IO_RING_F_REG_RESTRICTED) &&
+	    (!(ctx->flags & IORING_SETUP_R_DISABLED) ||
+	     (ctx->int_flags & IO_RING_F_RESTRICT_INHERITED))) {
 		opcode = array_index_nospec(opcode, IORING_REGISTER_LAST);
 		if (!test_bit(opcode, ctx->restrictions.register_op))
 			return -EACCES;

---
base-commit: 6c377d19d4a5116d9bec5203aa3c6c11523e7898
change-id: 20261009-iouring-task-restrict-fix-e5f48783215e

Best regards,
--  
Eugene Gvozdetsky <gvozdet@gmail.com>


