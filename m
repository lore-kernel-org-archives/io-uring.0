Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680363;
	b=ML1b4rMexVTn+9IP7IZMP25a3NdUi/3Iy3TDA3p4eDQQgfZHO27fPrzwu2CytmZak1O8
	 3HOeuLBiCNqbyk74WzH/0wVepYzPRZOTCiLIRQp+8PzXi58aDX4/4YBrzkzBa8hWUuRzB
	 vNiRSLHeRN1jpUEM4O7JQrXfvDUL5ey1wDCSegQLvLRhcIc8Pl+Qyi0vXlzzr8rITBdo0
	 Whl+byF0ywpvlNLRT8EytXo1hURUFO0KROCJNDpj6uMZlsYMTUhD3AcdpncJaeou7EKg5
	 ig+ZnsJT/8iz8vdZG4zdHHymta/UN540a1u9xS/CeUM3jMSYmwyLiUyCCfw10lOQdfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FUBUxv2+cLHIibfRDgDVbzcbIlm0UwZa4nEXrVqB/pM=;
	b=hQYMO8Q9OvsoSI8lN+I/Bb4WZebVQIgSy0w4VbuyJJdd6/BCHN/mSJDoIakn+WpcrJX9
	 baELQknlLJn0lKI7Y485jVsSnervXmwE8syip6/i90l93lmM3/EyECREO6HHblszVTmSv
	 UnGhSptmIPn8gjD+5qwPRHuK5N9meq9jyIsEpziLbGRyrCaEEp5irz36p8sK6LjYPrMqd
	 XrbJVvtLmAZBhC/Y6eP3W3thRaBA5ZQRh/A2D/h6qBr0tdv5i2fvjo+pusLtUIAw9kHpz
	 rubymx5MEUgBsG+9P/xWfMG1ClNClhPWhjmXZQ8i00WWUtLAtdLCZ2r7u3Fog3eGrDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r7Zm9bFr;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F931606A324
	for <io-uring@vger.kernel.org>; Thu, 22 Oct 2026 14:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F931606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r7Zm9bFr
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1931ff67a29so2356433c88.1
        for <io-uring@vger.kernel.org>; Thu, 22 Oct 2026 07:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680362; x=1793285162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FUBUxv2+cLHIibfRDgDVbzcbIlm0UwZa4nEXrVqB/pM=;
        b=r7Zm9bFr7fDJXhbVLt/BmgtASe6qrGbBntsJKeeOayCY9pq6JdEQbYhjL3Lq4yqOgg
         n0neGJLPClAH3FC58o+5dc0kzGgawNFzRH7K7xCtShmv+kQrq3O82yjz4BMO1F6eHyKf
         lIroeAm6sfSYjIDib4zwy6C/4EF0GdcxiejaHg8p1KUdWJsjRhCAe//R+n1Hm+WEApVh
         Z0POIXSTUjFQyRG4mL9Bj8opTgJKz4OGdYOW8qrX+zIuKNlUn1DI0C1kqTa4gUxivk7x
         6Y7kmRn9N0txuiTqtw4GLpI45nJs6OCmVa302+efN6LxAdNQpGsTm6cGLGTVqrPGsa+w
         9UiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680362; x=1793285162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FUBUxv2+cLHIibfRDgDVbzcbIlm0UwZa4nEXrVqB/pM=;
        b=rXIK7Q3gG8lncnm6I/cURQXuLq6702t26sraeAx4Vst4RS3kbD4Azo5/eud0klFpqv
         KWib8NshkioJb9XT1z1rvV9dXjSvJYb3m8lk9StBP9HsnzYczCkT+yge0zkhW0eB2lND
         wCq1+asLUyYR6xpw2V6gp+pVOvuQlb/dkcUNrbFEqn0thIWIlfKjSl9+Br3B3TdJF6f6
         Rqwiyv8bRLsY8YWqjcgxDzTnWNlKgIMc34jUvDXQm11fwx5In9qkT6GNgscrF1L98X7N
         vaI7TsarN7LuKrhPL48C2wQyI4t1jK9TjHfujPhJb0h+/jj0P7Yk5l8PWQ1/VBTzg88h
         tMgQ==
X-Gm-Message-State: AFq9FYLcuGujxfkDgw9/bPd6lxIkydVVfY3fkWhR2MZHo7a/e3wKvPZP
	jw38IqmseYhA2RaCNDoQxs2YCOcAqqdXX2KpRyKLgjwGM8Wpzm5fYew=
X-Gm-Gg: AYBFou0WljizqBsRZAIqeFk85HiETKQiVSVM0wMGS88NLJih1rV7S4BKBaR5YUL4ea+
	6oLSUTP41xwufVV17PtkZLEwEMuhq+VeZnH62mzZKhJXzk3E3YHAFRA4sCZTHW0mAEnH6wRoSul
	hU0Pvns3jicaYND4z6uFSdDnHQakJoc5FaU5yK2E6y1+SsIdInzC21eFcIhejQku5/dhZFiGrsm
	TYIvMyY15t/IlrncS6xOxPUo0c0sHX8G5DxCaZXk95E4phdEe3cyGxp06NaGCFcQTAD+pqyqRz3
	QGLc15LdQqKH+TINThVJHmxZmwQIDNjI6FwqC8kuXAjPYAGFeDr6BaciZ1qijzHoXLBSBKeBfW7
	mI2qa23pTY8VdUh5YpQ6AaBtV3T1/MmqbZb1YCuo9hOtbYjtEK+P7T59Vy0lMXeKsqhV+a7kTHD
	yvwyC62fDA/i+x+ecAGywRz0EuuflQYQAwzP7X33NSHvElBsUJzsNB+/XHmJF+DzEAqxEwKVE/d
	qYpL9fIeGgnD7x9siUVtJjLIVTvkzyAG67CznmUcer9AC1iZyMyyeLTiy9qsuo9rjCVDbznd5BX
	Whlb2fvSGWnjO0KxtcUnXkEvjDIipa9GobmsrIjspB8=
X-Received: by 2002:a05:701b:4584:b0:166:862b:9bcc with SMTP id a92af1059eb24-190a51e584cmr6626141c88.18.1792680361951;
        Thu, 22 Oct 2026 07:46:01 -0700 (PDT)
Received: from anuj-MacBookPro.. ([2406:7400:63:e55a:5016:92c7:7a35:f3ff])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a275026sm23625880c88.5.2026.10.22.07.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:46:01 -0700 (PDT)
From: Anuj Gupta <anuj1072538@gmail.com>
To: axboe@kernel.dk,
	asml.silence@gmail.com,
	kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	bernd@bsbernd.com,
	joannelkoong@gmail.com,
	miklos@szeredi.hu
Cc: io-uring@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	joshi.k@samsung.com,
	anuj20.g@samsung.com
Subject: [PATCH v2 3/5] io_uring/uring_cmd: support dma-buf registered buffers
Date: Thu, 22 Oct 2026 20:14:54 +0530
Message-ID: <20261022144501.2478417-4-anuj1072538@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022144501.2478417-1-anuj1072538@gmail.com>
References: <20261022144501.2478417-1-anuj1072538@gmail.com>
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

From: Anuj Gupta <anuj20.g@samsung.com>

Let callers of io_uring_cmd_import_fixed() opt in to dma-buf registered
buffers with IO_URING_CMD_IMPORT_DMABUF, and attach the current map on
import.

The map has to be dropped at hardware completion rather than from
task_work. Add io_uring_cmd_hw_done() for drivers to call from end_io,
which drops the map and queues task_work, and warn if task_work is
queued with a map still attached.

Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 include/linux/io_uring/cmd.h |  9 +++++++++
 io_uring/uring_cmd.c         | 28 ++++++++++++++++++++++++++--
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/include/linux/io_uring/cmd.h b/include/linux/io_uring/cmd.h
index 23fb66a1e2c1..d4e17c2f59fd 100644
--- a/include/linux/io_uring/cmd.h
+++ b/include/linux/io_uring/cmd.h
@@ -12,6 +12,9 @@
 /* io_uring_cmd is being issued again */
 #define IORING_URING_CMD_REISSUE	(1U << 31)
 
+/* io_uring_cmd_import_fixed() flags */
+#define IO_URING_CMD_IMPORT_DMABUF	(1U << 0)
+
 struct io_uring_cmd {
 	struct file	*file;
 	const struct io_uring_sqe *sqe;
@@ -86,6 +89,8 @@ void __io_uring_cmd_done(struct io_uring_cmd *, unsigned issue_flags);
 void __io_uring_cmd_do_in_task(struct io_uring_cmd *ioucmd,
 			    io_req_tw_func_t task_work_cb,
 			    unsigned flags);
+void io_uring_cmd_hw_done(struct io_uring_cmd *ioucmd,
+			  io_req_tw_func_t task_work_cb);
 
 /*
  * Note: the caller should never hard code @issue_flags and only use the
@@ -145,6 +150,10 @@ static inline void __io_uring_cmd_do_in_task(struct io_uring_cmd *ioucmd,
 			    io_req_tw_func_t task_work_cb, unsigned flags)
 {
 }
+static inline void io_uring_cmd_hw_done(struct io_uring_cmd *ioucmd,
+					io_req_tw_func_t task_work_cb)
+{
+}
 static inline void io_uring_cmd_mark_cancelable(struct io_uring_cmd *cmd,
 		unsigned int issue_flags)
 {
diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
index c2bc9dd242ec..c89f154190b1 100644
--- a/io_uring/uring_cmd.c
+++ b/io_uring/uring_cmd.c
@@ -10,6 +10,7 @@
 
 #include "io_uring.h"
 #include "alloc_cache.h"
+#include "dma-buf.h"
 #include "rsrc.h"
 #include "kbuf.h"
 #include "uring_cmd.h"
@@ -28,6 +29,7 @@ static void io_req_uring_cleanup(struct io_kiocb *req, unsigned int issue_flags)
 	struct io_uring_cmd *ioucmd = io_kiocb_to_cmd(req, struct io_uring_cmd);
 	struct io_async_cmd *ac = req->async_data;
 
+	io_detach_dmabuf_map(req);
 	if (issue_flags & IO_URING_F_UNLOCKED)
 		return;
 
@@ -132,12 +134,26 @@ void __io_uring_cmd_do_in_task(struct io_uring_cmd *ioucmd,
 
 	if (WARN_ON_ONCE(req->flags & REQ_F_APOLL_MULTISHOT))
 		return;
+	/* the dma-buf map must be dropped first, see io_uring_cmd_hw_done() */
+	WARN_ON_ONCE(req->dmabuf_map);
 
 	req->io_task_work.func = task_work_cb;
 	__io_req_task_work_add(req, flags);
 }
 EXPORT_SYMBOL_GPL(__io_uring_cmd_do_in_task);
 
+/*
+ * Queue completion in task context after dropping references that must be
+ * released at hardware completion rather than from task_work.
+ */
+void io_uring_cmd_hw_done(struct io_uring_cmd *ioucmd,
+			  io_req_tw_func_t task_work_cb)
+{
+	io_detach_dmabuf_map(cmd_to_io_kiocb(ioucmd));
+	__io_uring_cmd_do_in_task(ioucmd, task_work_cb, IOU_F_TWQ_LAZY_WAKE);
+}
+EXPORT_SYMBOL_GPL(io_uring_cmd_hw_done);
+
 /*
  * Called by consumers of io_uring_cmd, if they originally returned
  * -EIOCBQUEUED upon receiving the command.
@@ -257,6 +273,7 @@ int io_uring_cmd(struct io_kiocb *req, unsigned int issue_flags)
 
 	ret = file->f_op->uring_cmd(ioucmd, issue_flags);
 	if (ret == -EAGAIN) {
+		io_detach_dmabuf_map(req);
 		ioucmd->flags |= IORING_URING_CMD_REISSUE;
 		return ret;
 	}
@@ -276,13 +293,20 @@ int io_uring_cmd_import_fixed(u64 ubuf, unsigned long len, int rw,
 			      unsigned int import_flags)
 {
 	struct io_kiocb *req = cmd_to_io_kiocb(ioucmd);
+	unsigned int flags = 0;
+	int ret;
 
 	if (WARN_ON_ONCE(!(ioucmd->flags & IORING_URING_CMD_FIXED)))
 		return -EINVAL;
-	if (WARN_ON_ONCE(import_flags))
+	if (WARN_ON_ONCE(import_flags & ~IO_URING_CMD_IMPORT_DMABUF))
 		return -EINVAL;
+	if (import_flags & IO_URING_CMD_IMPORT_DMABUF)
+		flags |= IO_REGBUF_IMPORT_ALLOW_DMABUF;
 
-	return io_import_reg_buf(req, iter, ubuf, len, rw, issue_flags, 0);
+	ret = io_import_reg_buf(req, iter, ubuf, len, rw, issue_flags, flags);
+	if (ret)
+		return ret;
+	return io_attach_dmabuf_map(req, iter, issue_flags);
 }
 EXPORT_SYMBOL_GPL(io_uring_cmd_import_fixed);
 
-- 
2.43.0

