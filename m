Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.160
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794788332;
	b=vy9mk3NPDJLaWQ6Hw9KyDQ7pTsNGxKoc7MDMcMHxoMmXN1jiVCMBNwqN6y9vxUzNP5X9
	 tBXNwUrv4gwvGyyEa6Oo4gSpW9fNJP9MmQ4TmIxMzGJBJTeqKaGy9iDhE63aLqNGQsNcM
	 QYxs79kJo813aSHuPJKqrIuOfPyNQ9zONR3QE8wmWBsmgTT3DqkQokgKUe9LwqIfep6/n
	 /TiEvqvRDCw2OMfhCV9F01MiQbU+Az5c017LoVoEXina+1PyROVyF2EQmheSqGnzyXAd/
	 ot0nNW2NU88ib++4Tt1LNsKN7jul7ZO4E5NoF1wYUwV5RtlpKRnNTFwFNmxEmdqt07g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794788332;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=6tRP8JuMtpK7lfE5+UonF188s1eEu5KTmtD/xjwrYoM=;
	b=WQUuBJxfijCkztKk686xKi86Nl+akJNKkP3s6pVC50pmysJw1hgaukthraJVCEIA8QLf
	 2uqAlXpU5jcz+CbwqAMJ7bhF74dbTOwf2+IvTgW5HeJGRbzOJa1qL+CbQX2dJJishy8IB
	 xVzbfS93NNKd65+9unYGs5LCtTt4s6OXMm1NtGzDMdXqVkXhDWakq9BiYwTW94Y4ciwDl
	 tBI7AwHwt2WjC4eflBp/O1NIkzQtXOVpyX8Vj57Na68uzE/l0DYhEaNxs0AeI6bIIfIGc
	 uNlLBenfeQLEP/hfh2Qiz1ab9LhqxIjR1wp/eVNa13GZezeCScBtHSQsFiFaMaxFfLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="A/MY0CNa";
	arc=none smtp.remote-ip=95.215.58.160
Received: from mta1.migadu.com (out-160.mta1.migadu.com [95.215.58.160])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4174E606A338
	for <io-uring@vger.kernel.org>; Mon, 16 Nov 2026 00:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4174E606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=A/MY0CNa
X-Envelope-To: io-uring@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=b0SyuPdXxrDz5tZvEQnEIetX/WXTQ+wzBr1xuVMnkGY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794788330; v=1; x=1795393130;
 b=A/MY0CNa0TuyA8ucT0ifYoCwGzbh8ZMvow1MEP1KumEPkQWm6wCQp7thH5hav4TZlk+rRuN+
 33GYF1nb0H3LYMO6qDWDlSCNqsrv3aBClVA1RgVMc4HXOOGxwQDfF+EzUajJA+UNAIFxSluB9y5
 mBAGuoJcky8xZy946GtWaa28=
X-Envelope-To: io-uring@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cb34adbd6fc409e2;
	Mon, 16 Nov 2026 00:18:50 +0000
X-Mizu-Trace-ID: cb34adbd6fc409e2
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Sun, 15 Nov 2026 19:17:58 -0500
Subject: [PATCH RFC 05/18] scsi: target: uring: Queue commands until a
 server fetches them
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
Message-Id: <20261115-feat-target-core-uring-v1-5-28cdc137eac6@linux.dev>
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

target_core_uring fails every read and write, as nothing can serve them.

A command can arrive before the server is ready for it: at startup,
while all tags of a queue are busy, or while the server restarts.

Allocate a struct tcmur_cmd for each read and write, fill its descriptor
and put it on the pending list of the queue of the submitting CPU. The
commands wait there until a later patch lets a server fetch them.

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 drivers/target/target_core_uring.c | 81 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 78 insertions(+), 3 deletions(-)

diff --git a/drivers/target/target_core_uring.c b/drivers/target/target_core_uring.c
index 904ce2a613618..90e443ecb944c 100644
--- a/drivers/target/target_core_uring.c
+++ b/drivers/target/target_core_uring.c
@@ -12,6 +12,7 @@
 #include <linux/idr.h>
 #include <linux/mm.h>
 #include <linux/parser.h>
+#include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 #include <target/target_core_base.h>
@@ -29,12 +30,32 @@
 
 struct tcmur_dev;
 
+/**
+ * struct tcmur_cmd - One command for the server
+ * @node:	Entry in tcmur_queue.pending or in a local list
+ * @se_cmd:	Target command this belongs to
+ * @sgl:	Data pages of the command
+ * @sgl_nents:	Number of entries in @sgl
+ * @desc:	What the server is asked to do
+ */
+struct tcmur_cmd {
+	struct list_head	node;
+	struct se_cmd		*se_cmd;
+	struct scatterlist	*sgl;
+	u32			sgl_nents;
+	struct tcmur_io_desc	desc;
+};
+
 /**
  * struct tcmur_queue - One command queue
+ * @lock:	Protect the list
+ * @pending:	Commands waiting for a tag
  * @descs:	Command descriptors, indexed by tag and mapped by the server
  * @udev:	Device the queue belongs to
  */
 struct tcmur_queue {
+	spinlock_t		lock;
+	struct list_head	pending;
 	struct tcmur_io_desc	*descs;
 	struct tcmur_dev	*udev;
 } ____cacheline_aligned_in_smp;
@@ -54,6 +75,7 @@ struct tcmur_dev {
 	struct tcmur_queue	*queues;
 };
 
+static struct kmem_cache *tcmur_cmd_cache;
 static DEFINE_IDA(tcmur_ida);
 static dev_t tcmur_devt;
 
@@ -66,12 +88,56 @@ static struct tcmur_dev *TCMUR_DEV(struct se_device *dev)
 	return container_of(dev, struct tcmur_dev, se_dev);
 }
 
+static struct tcmur_queue *tcmur_cmd_queue(struct tcmur_dev *udev,
+					   struct se_cmd *se_cmd)
+{
+	return &udev->queues[(unsigned int)se_cmd->cpuid % udev->nr_queues];
+}
+
+static void tcmur_queue_cmd(struct tcmur_dev *udev, struct tcmur_cmd *tcmd)
+{
+	struct tcmur_queue *q = tcmur_cmd_queue(udev, tcmd->se_cmd);
+
+	spin_lock(&q->lock);
+	list_add_tail(&tcmd->node, &q->pending);
+	spin_unlock(&q->lock);
+}
+
+static sense_reason_t tcmur_submit(struct se_cmd *se_cmd, u32 op, u64 offset,
+				   u64 len, struct scatterlist *sgl,
+				   u32 sgl_nents)
+{
+	struct tcmur_dev *udev = TCMUR_DEV(se_cmd->se_dev);
+	struct tcmur_cmd *tcmd;
+
+	tcmd = kmem_cache_zalloc(tcmur_cmd_cache, GFP_NOIO);
+	if (!tcmd)
+		return TCM_LOGICAL_UNIT_COMMUNICATION_FAILURE;
+
+	tcmd->se_cmd = se_cmd;
+	tcmd->sgl = sgl;
+	tcmd->sgl_nents = sgl_nents;
+	tcmd->desc.op = op;
+	tcmd->desc.offset = offset;
+	tcmd->desc.len = len;
+	tcmd->desc.data_len = se_cmd->data_length;
+	if (op == TCMUR_OP_WRITE && (se_cmd->se_cmd_flags & SCF_FUA))
+		tcmd->desc.flags |= TCMUR_IO_F_FUA;
+
+	tcmur_queue_cmd(udev, tcmd);
+	return 0;
+}
+
 static sense_reason_t tcmur_execute_rw(struct se_cmd *se_cmd,
 				       struct scatterlist *sgl, u32 sgl_nents,
 				       enum dma_data_direction dir)
 {
-	/* Fail the commands until a server can pick them up */
-	return TCM_LOGICAL_UNIT_COMMUNICATION_FAILURE;
+	u32 block_size = se_cmd->se_dev->dev_attrib.block_size;
+
+	return tcmur_submit(se_cmd, dir == DMA_FROM_DEVICE ? TCMUR_OP_READ :
+							     TCMUR_OP_WRITE,
+			    se_cmd->t_task_lba * block_size,
+			    se_cmd->data_length, sgl, sgl_nents);
 }
 
 static size_t tcmur_desc_area_size(struct tcmur_dev *udev)
@@ -175,6 +241,8 @@ static int tcmur_alloc_queues(struct tcmur_dev *udev)
 	for (i = 0; i < udev->nr_queues; i++) {
 		q = &udev->queues[i];
 
+		spin_lock_init(&q->lock);
+		INIT_LIST_HEAD(&q->pending);
 		q->udev = udev;
 		q->descs = vmalloc_user(tcmur_desc_area_size(udev));
 		if (!q->descs) {
@@ -414,9 +482,13 @@ static int __init tcmur_module_init(void)
 {
 	int ret;
 
+	tcmur_cmd_cache = KMEM_CACHE(tcmur_cmd, 0);
+	if (!tcmur_cmd_cache)
+		return -ENOMEM;
+
 	ret = alloc_chrdev_region(&tcmur_devt, 0, TCMUR_MINORS, "tcm-uring");
 	if (ret)
-		return ret;
+		goto destroy_cache;
 
 	ret = class_register(&tcmur_class);
 	if (ret)
@@ -432,6 +504,8 @@ static int __init tcmur_module_init(void)
 	class_unregister(&tcmur_class);
 unregister_chrdev:
 	unregister_chrdev_region(tcmur_devt, TCMUR_MINORS);
+destroy_cache:
+	kmem_cache_destroy(tcmur_cmd_cache);
 	return ret;
 }
 
@@ -442,6 +516,7 @@ static void __exit tcmur_module_exit(void)
 	unregister_chrdev_region(tcmur_devt, TCMUR_MINORS);
 	/* Wait for the devices that tcmur_cdev_release() frees with RCU */
 	rcu_barrier();
+	kmem_cache_destroy(tcmur_cmd_cache);
 }
 
 module_init(tcmur_module_init);

-- 
2.43.0

