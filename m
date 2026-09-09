Received: from mail-oa1-f99.google.com (mail-oa1-f99.google.com [209.85.160.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391DE4825D5
	for <io-uring@vger.kernel.org>; Wed,  9 Sep 2026 22:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788992958; cv=none; b=CU3R72utkwgn6sjjzKjgQTjTdQfPBzaOcspgSN0GB42aD7ETkYXZLIijd0PWTi6Ni3zDQ59HLIsGwsgRtN3LqwJ3RzjMqlOE+5iwwPuw28RkGyiucJFI2jxIODjDijxKVbnTXIRr7egf/9s+W6lYKOJk+p92GxgSCyRL5PhjIOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788992958; c=relaxed/simple;
	bh=ZsRCPU0J121h1w/y85vunBI0gv6iQjmpHXlh3qUdYlg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QdmF8kf3VmTEKxr0xcAubu95K/p/KXfypoe+D5nlNT18s52fLKp0KvokwFFmXNRVfdryMeDl38f6LZJQnakzpLZZvQs/QbpUvE6+eczoX2F2vP/13drcR+fTgGjuJN0XakUciXTsEr9L5q3C8c10J+vxNnFRnVj/kURCIeKAQ9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=LMnDcxSW; arc=none smtp.client-ip=209.85.160.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="LMnDcxSW"
Received: by mail-oa1-f99.google.com with SMTP id 586e51a60fabf-46b08568bc4so157621fac.3
        for <io-uring@vger.kernel.org>; Wed, 09 Sep 2026 15:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788992944; x=1789597744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ImWYQroYLYn1yUntaG3yDyG9poZ7C84uz/cQieFkqu0=;
        b=LMnDcxSWOPQs3Iluim5mr8nhBkssXls8io+aEc8xhd83PNawOi0+HS6tnL3fvPYHaF
         Z0iCc+OYZyTwjDW/F7qqK6yJag2bT21rnE2ASpUB/iZ8TmQjXU/O46v3sSrqcT04NA1E
         dtwypgDV+a3DHU9lUzP0dckuysAdmbq7A/WKjXl5/lKNWkcZBNVY4gyAjX6sEGR6jkpk
         jCrxkSHb80WRk0Bti8ABy1rfmvmoOn3W9Uw0g44odA4sEEH6c8PkWTw6ii23hZSiGNJc
         7pi6YE71ax6Tib3PdUBqj7Cmr7GDnTAkUbGvx7YnJjbSUa9v40Tb0IwmJD7QzcVmYCUY
         gwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788992944; x=1789597744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ImWYQroYLYn1yUntaG3yDyG9poZ7C84uz/cQieFkqu0=;
        b=cDxkkDa8Lnu4qybOc8BsaCRANpPmrF7v5KtQynTjK03DFJe7MLLwN9tw8hAdpVUMIu
         sl/fT+4NDBVBg4sDl52IYPNJHL9nu+qJ3malcgXUZHEA/Az2noxA67dFmnXKkaaD/Ter
         Zu7y3Iew72Yxr8UAiLQU0FxV0dzZ+vVd9Le7FAZsBK1x2WWhRzfKpJ6ozGnk/qX+9RGf
         oX6pMaVnf9WFGsyrFZKznc1W6oZ0DvbGTEwr4kd/FR0RDwZ2hsvaxqpiW9je/jQa4auS
         +iOXqecdPaDx3lnMuAQwDtSethxr1cgRj+advSR9+SmNqzmOiknATK5DZbC3mGFTKlb3
         s5kg==
X-Gm-Message-State: AFuF++ltEnnDUN4B/mGgTb4dThhiQaSneiBiUWGOkLm7x1S4oURkKmM6
	/mNhTctqIGJgbLFF/G8QyA038Sb/FiyVD+LC8oVxWdDKVOOmjHtRFXQ2K93aP4ndd7Jy/prueoV
	dlW6ntVdoifvY1NgAcnG53lhAVwJmMw1r5KCH
X-Gm-Gg: AYBFou1tKymW5WpoVEfdOHsWDUZIhMkAXSdFm98WpUdT7Vo0JltpW9nm21LMRZLJnDE
	A1ThevFu0E4HqM5TaZ+BVlCCLjSIGZkS2oWb3VPonoC9newxfOUYHtreTGJMkA3X3LPUvdj1gbq
	WCWo8Ke+c4yx8cr3A8jlAP7OTAj0VM/56Khb61zf03q5CC0QCn4vLT13gsKxvy9FCWbcUZH4xRR
	Hv0VlvWnL03ika3RsGtQDgiWbg/IT6fAk2enWYkUT1/2mrilXTsG/UfggXQb+wf9Kjn4DwIP+jY
	Tfab2UIh+TZOlGwZmeOnoup3vL0XvCQXP6zg/md0NN2EWTRZCCG0Gb3MdzG74qY5kej7g/lxvGm
	3I9NQWECnuIFk8DwbH5IXg9gzk4r/u8JW
X-Received: by 2002:a05:6830:f89:b0:7ee:363d:ce16 with SMTP id 46e09a7af769-7fb76e3cd73mr16877278a34.0.1788992944121;
        Wed, 09 Sep 2026 15:29:04 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-7f9f6aa689fsm2773280a34.5.2026.09.09.15.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 15:29:04 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.112.12.104])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id AFA1C402BE;
	Wed,  9 Sep 2026 16:29:03 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id AD682E40322; Wed,  9 Sep 2026 16:29:03 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>,
	Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: io-uring@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 6/6] nvme/ioctl: support fixed buffer for metadata
Date: Wed,  9 Sep 2026 16:28:36 -0600
Message-ID: <20260909222836.2475352-7-csander@purestorage.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909222836.2475352-1-csander@purestorage.com>
References: <20260909222836.2475352-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_uring NVMe passthrough supports using a "fixed" (registered) buffer
for data, but not metadata. On high-IOPS workloads, the pinning and
unpinning overhead for the metadata pages is significant and could be
avoided if fixed metadata buffers were supported.

Define a NVME_URING_CMD_FIXED_METADATA bit for the nvme_uring_cmd's
flags field (which is currently required to be 0) to indicate that the
metadata buffer belongs to a fixed buffer registered with the io_uring.
The metadata fixed buffer index is specified in a metadata_buf_index
field replacing the existing rsvd1 in nvme_uring_cmd.

If NVME_URING_CMD_FIXED_METADATA is set, the metadata iov_iter is
obtained from io_uring_cmd_import_fixed_metadata() instead of
iov_iter_ubuf().

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 drivers/nvme/host/ioctl.c       | 21 ++++++++++++++++-----
 include/uapi/linux/nvme_ioctl.h |  5 ++++-
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/nvme/host/ioctl.c b/drivers/nvme/host/ioctl.c
index 8e722184ecf1..4da8cf92c2e0 100644
--- a/drivers/nvme/host/ioctl.c
+++ b/drivers/nvme/host/ioctl.c
@@ -488,21 +488,22 @@ static int nvme_uring_cmd_io(struct nvme_ctrl *ctrl, struct nvme_ns *ns,
 	struct iov_iter iter, meta_iter;
 	struct iov_iter *map_iter = NULL, *map_meta_iter = NULL;
 	struct request *req;
 	blk_opf_t rq_flags = 0;
 	blk_mq_req_flags_t blk_flags = 0;
+	u8 flags = READ_ONCE(cmd->flags);
 	u32 metadata_len, data_len;
 	u64 metadata, addr;
 	u32 timeout_ms;
 	int ddir;
 	int ret;
 
-	c.common.opcode = READ_ONCE(cmd->opcode);
-	c.common.flags = READ_ONCE(cmd->flags);
-	if (c.common.flags)
+	if (flags & ~NVME_URING_CMD_FIXED_METADATA)
 		return -EINVAL;
 
+	c.common.opcode = READ_ONCE(cmd->opcode);
+	c.common.flags = 0;
 	c.common.command_id = 0;
 	c.common.nsid = cpu_to_le32(cmd->nsid);
 	if (!nvme_validate_passthru_nsid(ctrl, ns, le32_to_cpu(c.common.nsid)))
 		return -EINVAL;
 
@@ -539,12 +540,22 @@ static int nvme_uring_cmd_io(struct nvme_ctrl *ctrl, struct nvme_ns *ns,
 			return ret;
 
 		map_iter = &iter;
 	}
 	if (data_len && metadata && metadata_len) {
-		iov_iter_ubuf(&meta_iter, ddir, nvme_to_user_ptr(metadata),
-			      metadata_len);
+		if (flags & NVME_URING_CMD_FIXED_METADATA) {
+			u16 buf_index = READ_ONCE(cmd->metadata_buf_index);
+
+			ret = io_uring_cmd_import_fixed_metadata(
+				ioucmd, buf_index, metadata, metadata_len, ddir,
+				&meta_iter, issue_flags);
+			if (ret < 0)
+				return ret;
+		} else {
+			iov_iter_ubuf(&meta_iter, ddir, nvme_to_user_ptr(metadata),
+				      metadata_len);
+		}
 		map_meta_iter = &meta_iter;
 	}
 
 	if (issue_flags & IO_URING_F_NONBLOCK) {
 		rq_flags |= REQ_NOWAIT;
diff --git a/include/uapi/linux/nvme_ioctl.h b/include/uapi/linux/nvme_ioctl.h
index 2f76cba67166..93973f636b48 100644
--- a/include/uapi/linux/nvme_ioctl.h
+++ b/include/uapi/linux/nvme_ioctl.h
@@ -68,15 +68,18 @@ struct nvme_passthru_cmd64 {
 	__u32	timeout_ms;
 	__u32   rsvd2;
 	__u64	result;
 };
 
+/* struct nvme_uring_cmd flags field bits */
+#define NVME_URING_CMD_FIXED_METADATA (1U << 0)
+
 /* same as struct nvme_passthru_cmd64, minus the 8b result field */
 struct nvme_uring_cmd {
 	__u8	opcode;
 	__u8	flags;
-	__u16	rsvd1;
+	__u16	metadata_buf_index;
 	__u32	nsid;
 	__u32	cdw2;
 	__u32	cdw3;
 	__u64	metadata;
 	__u64	addr;
-- 
2.55.0

