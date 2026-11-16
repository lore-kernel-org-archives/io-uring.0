Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794788345;
	b=ksINmc5cH4tHO04W028uEZnegLe9jVROJOaHpSrIwflkGZJikzCfPwbbAi2+37qH1S8o
	 3IWHCaaGO9aIto2y6OYOI9WRJjkKoNCxlxelcAAyFjnh8DHd5GZiJ9pKCY69ic0o7BntF
	 FS/rzlOerFP0GK4S6r3JSziVMMOyoVPx63vJVvW1kgtGU6uE8dH6UCyJqerffbYBcXLeA
	 PncXvFhwprhv/sGnOqXKlszEDEWapfFU3Pzu46AuYsO52WZB40KT++C27JakmqqBYjRpG
	 O+Tq+p/jl1mAefBF5J2e/xovu9g/XPW31C+0A+5eX5zMDxF1QQLvQc/X2PPacUv3Gmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794788345;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=pV2JpCvmHqQ3maI759rh5L2YGQ7TgmEnOAxEaKW0OeY=;
	b=qaqasPYtp2pEQy+5Xm95B+1RIW+CZymV5W5+Rwyl9OsHpeOEJ6ZEfKtbyAeKk2oY75D8
	 Z9v8EnQXKGAynlWCJUhY8OB8QI67rrF6dqaRDCZuXBAR/VsaBsUznK70jt8YJZbzLc0Jw
	 Ezxno9ZynMPUYhqFOoIZSmincXnC3jzxKF9ce/SPveOYipCO/NaZbHySqZviHlrFG+GNa
	 wi9P0H3RLXnrsCxSdy3s/JGghT6Hcc3Ml9aVLrmqYvRPBV6InZC2gLrnJJZkPyrWN8/L9
	 3Jw14UD3htX0U7kJuR8hGxnzwZK2+dvaLfu1x9ylQ0MYEz0bZaQPuB13GQn9NUJ1sZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="S/hRt4WM";
	arc=none smtp.remote-ip=95.215.58.168
Received: from mta1.migadu.com (out-168.mta1.migadu.com [95.215.58.168])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C3F606A323
	for <io-uring@vger.kernel.org>; Mon, 16 Nov 2026 00:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43C3F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=S/hRt4WM
X-Envelope-To: io-uring@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=clKrbKJ3Kb7Z0K11PR5FBPmTCFS0Z3dh8qXSaIa9g4U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794788343; v=1; x=1795393143;
 b=S/hRt4WMDJHQrKP5iDzaYf1Vzn/fQIAwzLAEfmmN5KsS37GUuTekRkr7gPAMmyGgT0OlXi8d
 FbBygWjqFHVdr6wH4j3mJiNEavvO13o6IzCrwE9azoVzOuEXJaULxFEWPS33NUtdNiASsa8a3ua
 xM8AQN2puLLC8UWb35MV/Jd0=
X-Envelope-To: io-uring@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7732bd19f67e1654;
	Mon, 16 Nov 2026 00:19:03 +0000
X-Mizu-Trace-ID: 7732bd19f67e1654
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Sun, 15 Nov 2026 19:18:00 -0500
Subject: [PATCH RFC 07/18] scsi: target: uring: Complete commands with
 TCMUR_IO_COMMIT_AND_FETCH
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
Message-Id: <20261115-feat-target-core-uring-v1-7-28cdc137eac6@linux.dev>
References: <20261115-feat-target-core-uring-v1-0-28cdc137eac6@linux.dev>
In-Reply-To: <20261115-feat-target-core-uring-v1-0-28cdc137eac6@linux.dev>
To: "Martin K. Petersen" <mkp@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, 
 target-devel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, 
 io-uring@vger.kernel.org, Mike Christie <michael.christie@oracle.com>, 
 Bodo Stroesser <bostroesser@gmail.com>, Ming Lei <tom.leiming@gmail.com>, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

The server of a target_core_uring device can fetch a command for each
tag.

It cannot report the result, so the command never completes and the tag
is never used again.

Add the TCMUR_IO_COMMIT_AND_FETCH io_uring command, which completes the
command of a tag with GOOD or CHECK CONDITION status and fetches the
next one in the same call. Count references on struct tcmur_cmd and
complete the target command when the last one goes, as later patches
add users that can outlive the commit.

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 drivers/target/target_core_uring.c     | 47 ++++++++++++++++++++++++++++++++++
 include/uapi/linux/target_core_uring.h |  9 +++++--
 2 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/target/target_core_uring.c b/drivers/target/target_core_uring.c
index 85c9a1ae84433..770bb665fbe00 100644
--- a/drivers/target/target_core_uring.c
+++ b/drivers/target/target_core_uring.c
@@ -20,6 +20,7 @@
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
+#include <scsi/scsi_proto.h>
 #include <target/target_core_base.h>
 #include <target/target_core_backend.h>
 #include <uapi/linux/target_core_uring.h>
@@ -42,6 +43,8 @@ struct tcmur_dev;
  * @sgl:	Data pages of the command
  * @sgl_nents:	Number of entries in @sgl
  * @desc:	What the server is asked to do
+ * @ref:	Held by the tag or the pending list
+ * @status:	SAM status to complete @se_cmd with
  */
 struct tcmur_cmd {
 	struct list_head	node;
@@ -49,6 +52,8 @@ struct tcmur_cmd {
 	struct scatterlist	*sgl;
 	u32			sgl_nents;
 	struct tcmur_io_desc	desc;
+	refcount_t		ref;
+	u8			status;
 };
 
 /**
@@ -130,6 +135,22 @@ static struct tcmur_queue *tcmur_cmd_queue(struct tcmur_dev *udev,
 	return &udev->queues[(unsigned int)se_cmd->cpuid % udev->nr_queues];
 }
 
+static void tcmur_cmd_put(struct tcmur_cmd *tcmd)
+{
+	if (!refcount_dec_and_test(&tcmd->ref))
+		return;
+
+	target_complete_cmd(tcmd->se_cmd, tcmd->status);
+	kmem_cache_free(tcmur_cmd_cache, tcmd);
+}
+
+/* Drop the reference of the tag or of the pending list and set the result */
+static void tcmur_cmd_end(struct tcmur_cmd *tcmd, u8 status)
+{
+	tcmd->status = status;
+	tcmur_cmd_put(tcmd);
+}
+
 /* Hand @tcmd to the server through the tag @io */
 static void tcmur_io_start(struct tcmur_queue *q, struct tcmur_io *io,
 			   struct tcmur_cmd *tcmd)
@@ -156,6 +177,8 @@ static void tcmur_queue_cmd(struct tcmur_dev *udev, struct tcmur_cmd *tcmd)
 	struct io_uring_cmd *ucmd = NULL;
 	struct tcmur_io *io;
 
+	refcount_set(&tcmd->ref, 1);
+
 	spin_lock(&q->lock);
 	io = list_first_entry_or_null(&q->idle, struct tcmur_io, node);
 	if (io) {
@@ -262,6 +285,24 @@ static int tcmur_fetch(struct tcmur_queue *q, struct tcmur_io *io,
 	return ret;
 }
 
+static int tcmur_commit(struct tcmur_queue *q, struct tcmur_io *io, int result)
+{
+	struct tcmur_cmd *tcmd;
+
+	spin_lock(&q->lock);
+	if (!io->owned) {
+		spin_unlock(&q->lock);
+		return -EINVAL;
+	}
+	tcmd = io->cmd;
+	io->cmd = NULL;
+	io->owned = false;
+	spin_unlock(&q->lock);
+
+	tcmur_cmd_end(tcmd, result ? SAM_STAT_CHECK_CONDITION : SAM_STAT_GOOD);
+	return 0;
+}
+
 static int tcmur_ch_uring_cmd_local(struct io_uring_cmd *ucmd,
 				    unsigned int issue_flags)
 {
@@ -272,6 +313,7 @@ static int tcmur_ch_uring_cmd_local(struct io_uring_cmd *ucmd,
 	u16 tag = READ_ONCE(ioc->tag);
 	struct tcmur_queue *q;
 	struct tcmur_io *io;
+	int ret;
 
 	if (q_id >= udev->nr_queues || tag >= udev->queue_depth)
 		return -EINVAL;
@@ -282,6 +324,11 @@ static int tcmur_ch_uring_cmd_local(struct io_uring_cmd *ucmd,
 	switch (ucmd->cmd_op) {
 	case TCMUR_IO_FETCH:
 		return tcmur_fetch(q, io, ucmd, issue_flags);
+	case TCMUR_IO_COMMIT_AND_FETCH:
+		ret = tcmur_commit(q, io, READ_ONCE(ioc->result));
+		if (ret)
+			return ret;
+		return tcmur_fetch(q, io, ucmd, issue_flags);
 	default:
 		return -EOPNOTSUPP;
 	}
diff --git a/include/uapi/linux/target_core_uring.h b/include/uapi/linux/target_core_uring.h
index 9ce871d2e2087..a662a23fca9ab 100644
--- a/include/uapi/linux/target_core_uring.h
+++ b/include/uapi/linux/target_core_uring.h
@@ -43,21 +43,26 @@ struct tcmur_dev_info {
  * struct tcmur_io_cmd - Payload of the io_uring commands, placed in sqe->cmd
  * @q_id:	Queue of the tag
  * @tag:	Tag the command is for
- * @reserved:	Zero
+ * @result:	TCMUR_IO_COMMIT_AND_FETCH: 0, or a negative errno if the
+ *		command failed
  * @reserved1:	Zero
  */
 struct tcmur_io_cmd {
 	__u16	q_id;
 	__u16	tag;
-	__s32	reserved;
+	__s32	result;
 	__u64	reserved1;
 };
 
 /*
  * TCMUR_IO_FETCH: wait for a command on (q_id, tag). The CQE result is 0
  * once the descriptor of the tag holds a command.
+ *
+ * TCMUR_IO_COMMIT_AND_FETCH: complete the command of (q_id, tag) with
+ * @result, then wait for the next one.
  */
 #define TCMUR_IO_FETCH			_IOWR(0xBB, 0x08, struct tcmur_io_cmd)
+#define TCMUR_IO_COMMIT_AND_FETCH	_IOWR(0xBB, 0x09, struct tcmur_io_cmd)
 
 enum tcmur_io_op {
 	TCMUR_OP_READ,

-- 
2.43.0

