Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790383;
	b=HlUSOLE21fGEgYEdgjdXH64PIm7KteFd3xFeadxPJamqOxvFG7Dts7cr7NAwGSYVEXQY
	 1ozDkaMDiJ0lU3Z/INLLlzTOXMDjrUPofoXdmB1DCGnTWQ1znRt3jbVx8e/mI2p1sSpuq
	 KCPMDUhEE27jtMcjzMdM4PMm8s7ps0TrLl7Wg/mYtS11b+90DPSJxCwOvpgwvOQq9SD1X
	 c3Xmgl8x2PqZ+gDlQlZdGHOk6NoZdtbCaUCwW0CuGH6ARVIp7NKC/YxpCGMGGzVIoMHhw
	 2oREOUPWEIjlzu/LuUzZXYGyG8IGEGowNWtufnvBEGA8mcxFl+Njm9W8g/Yl71WbVKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=5pLpVK+i/8Imxqr3Xov4ssSifbUYKBHJ4bTvS4h1ZT4=;
	b=AYVGnt1VR4SQKEAPX4j/uLcl1oIgN486A7J08SyW5HQvHHQQ0Be52aMTcRmsoTe8e67H
	 16474BKz+sZCIK0B+1oVs2ajIKfSO7BHYqjdsAcFAz45ZzjHTFyPTMc1/82JTt33xCBek
	 P17NqzxwzYBUTx6QHLwIITSUKLJL5873g0ukKQ8ESBtAhL9TYBs/4s+M9Krghe0C3ODBH
	 /NaNAC+vBfnr8rD6D5CxgFPyYCcqBue1aJUAoCCu7x8v2eThw7E+gWM26vjPkyvDdY6pF
	 qopuecy5Gex3/FUj2D9oV9lOI7fIvFc4wppiod2d2RADbgFH8I2ANF9q71HgGHZ4L+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xbWDpvvk;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691AB606A33B
	for <io-uring@vger.kernel.org>; Wed,  4 Nov 2026 11:06:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 691AB606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xbWDpvvk
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b042c0759so308668f8f.2
        for <io-uring@vger.kernel.org>; Wed, 04 Nov 2026 03:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793790382; x=1794395182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5pLpVK+i/8Imxqr3Xov4ssSifbUYKBHJ4bTvS4h1ZT4=;
        b=xbWDpvvkAjRBrQLpoCWyOC6RQdm5E1CjKhkzCmj+pIUwdo/ky2nuOmNjV9QXcvJAr6
         yVBzax/EGMUyru/A43+ICtnHQDoJ0QfDcwN4VOZ/yC2cChyHXBE4NNpIWk5PTrSzF8lj
         BRgCtqdw/1KE3693zhoI5CX7gwmulqiIBjhofNCgTlveYeSKAGrJ1AFIFMvIJIVwPgyh
         lgmRdRQawbfBb0sD5vJqsKfZS9tWmHbv13LSmKUiCNhie4XfXEcPsASTtw5z9pPB/NUf
         NRhkoV6OXFR4CuJX8jR/8utCd0iouN4gmoMiDVwJ+ht5kTtJYX9aDQw2AjpA3QOpg7XZ
         gGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793790382; x=1794395182;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5pLpVK+i/8Imxqr3Xov4ssSifbUYKBHJ4bTvS4h1ZT4=;
        b=Low6kT9eD5NiGIe2RFFAcMyXZklG3coSBsPWzkf7lSn6Fdv8CsKcQQl4qO9/hltfOV
         gksT+SVa1a94gQlf7ZMMg8HZpojETApTWaDlp6tE7GHps0z9i42XW3/JXYTXn5j84uhB
         LuvvcxUCXantbfyTNGrMRL3NJNovYDdaEII1OcURs2odqbYuLblNv0Pshp3mS1yjkF0L
         xLCyeQonJGbT/CyyYbTiSOrAD2DRR1XYXIR56hE4+9a8i1aSqD6/DmTk8n1bM3Ur5z6H
         x5Qplcc/Wu7l9cJHfaj4n3NY+X/J/tlQ4jgE3gI+X69ZCzRLAEslO6gd4lH/R4t8rqxE
         p5hg==
X-Gm-Message-State: APuU4Z+I+95WJmWWuGPa2jDf/onMKfotRSlIHSRVkjZemywEcGNW2B3q
	vNC7ryjFlqtJpaFoXQJJPu2DTKeE4IAQcPNuptS/bhAoaFydbVjVlhDX
X-Gm-Gg: AYBFou0oaanyXLWenSJO1OGgg+5lB+gvEULv2ygwzvPSDyKwk/lmaTEBMnugvA3bIzc
	1e0XaEHxhNZwIGTl1jDnFnSnJWkzwkcL4QxagOMPmbWRHUd1/8RHnc4BjizQRZAfREV77lckdoC
	+omrIVk2yxqqEQK+kq4FDwx91D9npRxGEDDEn7sbhU19qf9BOs+c4BwB0VnWT4JA2JFnNMTHIj2
	iSZlWzdZ9zNNZMZTRqQYA9M2TFZt9fUnD8nW00BmI+1JsBVNsYny9UK9mwPSPXNF7oWjqLmIXZI
	NBEVGF7fzzylZOUeBPBPsi06TySkbe+z++r96ki/ol2v6MYjT5dyNjn2eqV/U0wyAxPIKWvbpGV
	8SPlWoCfPIgqfNQhlgKIMXWrg+ZeOHRC452grzxAHoxdPxfn+dLEo2GKodArw0mf8sJ9ahXj+oy
	gIF2M1umf6Wv0zht5+dW52sbAiaS3S0a2Yf/sdu+OMsTBdHzOBRJZ+JUBJX11iTabXfnxCOpeF/
	Or3uH5ICjAirus2yEpXJYAokRoQpwXLh/kFxpDCIqCqMhBnl5A5WsRoQVtJl1VY3k9i60RZD5Qz
	e3RrUqt08rvUO1iRvYKMhTWY+mjYaerIvSPzxI+KdrxQ9lOkod/Mvvh1jchSBrLVmb6nky9/bBE
	s5nQpAelBLImHckoNpGoTIAun
X-Received: by 2002:a05:6000:24c5:b0:48e:d7c:4bc8 with SMTP id ffacd0b85a97d-48e6e2bdddbmr38014500f8f.7.1793790381656;
        Wed, 04 Nov 2026 03:06:21 -0800 (PST)
Received: from meven-thinkpad.home (2a01cb088745e00090de407b41070a01.ipv6.abo.wanadoo.fr. [2a01:cb08:8745:e000:90de:407b:4107:a01])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm3704835f8f.45.2026.11.04.03.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:06:21 -0800 (PST)
From: =?UTF-8?q?M=C3=A9ven=20Car?= <meven29@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?M=C3=A9ven=20Car?= <meven@kde.org>
Subject: [RFC PATCH v2 2/3] io_uring: add support for utimensat
Date: Wed,  4 Nov 2026 12:06:03 +0100
Message-ID: <20261104110604.126717-3-meven29@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104110604.126717-1-meven29@gmail.com>
References: <20261104110604.126717-1-meven29@gmail.com>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Méven Car <meven@kde.org>

A program that copies many files sets the times of every copy after
its last write. On NFS and SMB each of those calls is a round trip to
the server, and with io_uring it is one of the steps of the copy that
still have to leave the ring and run one file at a time.

IORING_OP_UTIMENSAT behaves like utimensat(2). sqe->fd is the directory
fd, sqe->addr the path, sqe->addr2 a pointer to two struct
__kernel_timespec, and sqe->utimes_flags takes AT_SYMLINK_NOFOLLOW and
AT_EMPTY_PATH. An addr2 of zero sets both times to the current time, as
a NULL times argument does. The times and the path are copied at
submission.

As with utimensat(2), a NULL path sets the times of the file that
sqe->fd refers to, without a lookup, and takes no flags. Two UTIME_OMIT
times complete with 0 without a lookup.

Like the other path ops, the request is issued from io-wq, apart from
the no-op, because the lookup and notify_change() can sleep. A fixed
file is not accepted as the directory fd. A failed request fails the
rest of its link.

Signed-off-by: Méven Car <meven@kde.org>
---
 include/uapi/linux/io_uring.h |  2 +
 io_uring/fs.c                 | 97 +++++++++++++++++++++++++++++++++++
 io_uring/fs.h                 |  4 ++
 io_uring/opdef.c              |  8 +++
 4 files changed, 111 insertions(+)

diff --git a/include/uapi/linux/io_uring.h b/include/uapi/linux/io_uring.h
index b42b66b424a7..6a98c9282e0b 100644
--- a/include/uapi/linux/io_uring.h
+++ b/include/uapi/linux/io_uring.h
@@ -76,6 +76,7 @@ struct io_uring_sqe {
 		__u32		install_fd_flags;
 		__u32		nop_flags;
 		__u32		pipe_flags;
+		__u32		utimes_flags;
 	};
 	__u64	user_data;	/* data to be passed back at completion time */
 	/* pack this to avoid bogus arm OABI complaints */
@@ -319,6 +320,7 @@ enum io_uring_op {
 	IORING_OP_PIPE,
 	IORING_OP_NOP128,
 	IORING_OP_URING_CMD128,
+	IORING_OP_UTIMENSAT,
 
 	/* this goes last, obviously */
 	IORING_OP_LAST,
diff --git a/io_uring/fs.c b/io_uring/fs.c
index 26ea841a22e7..71164bddd958 100644
--- a/io_uring/fs.c
+++ b/io_uring/fs.c
@@ -304,3 +304,100 @@ void io_link_cleanup(struct io_kiocb *req)
 	dismiss_delayed_filename(&sl->oldpath);
 	dismiss_delayed_filename(&sl->newpath);
 }
+
+/* Internal flags, above the AT_ flags of the SQE */
+#define IO_UTIMENSAT_NOOP	BIT(30)	/* both times UTIME_OMIT */
+#define IO_UTIMENSAT_NO_PATH	BIT(31)	/* NULL path: the dfd itself */
+
+struct io_utimensat {
+	struct file			*file;
+	int				dfd;
+	unsigned int			flags;
+	struct delayed_filename		filename;
+	/* NULL sets both times to the current time */
+	struct timespec64		*times;
+	struct timespec64		ts[2];
+};
+
+int io_utimensat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
+{
+	struct io_utimensat *ut = io_kiocb_to_cmd(req, struct io_utimensat);
+	struct __kernel_timespec __user *uts;
+	const char __user *fname;
+	int err;
+
+	if (sqe->len || sqe->buf_index || sqe->splice_fd_in || sqe->addr3 ||
+	    sqe->__pad2[0])
+		return -EINVAL;
+	if (unlikely(req->flags & REQ_F_FIXED_FILE))
+		return -EBADF;
+
+	ut->dfd = READ_ONCE(sqe->fd);
+	ut->flags = READ_ONCE(sqe->utimes_flags);
+	if (ut->flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH))
+		return -EINVAL;
+
+	uts = u64_to_user_ptr(READ_ONCE(sqe->addr2));
+	ut->times = NULL;
+	if (uts) {
+		if (get_timespec64(&ut->ts[0], &uts[0]) ||
+		    get_timespec64(&ut->ts[1], &uts[1]))
+			return -EFAULT;
+		ut->times = ut->ts;
+		if (ut->ts[0].tv_nsec == UTIME_OMIT &&
+		    ut->ts[1].tv_nsec == UTIME_OMIT) {
+			ut->flags |= IO_UTIMENSAT_NOOP;
+			return 0;
+		}
+	}
+
+	fname = u64_to_user_ptr(READ_ONCE(sqe->addr));
+	if (!fname) {
+		if (ut->dfd == AT_FDCWD)
+			return -EFAULT;
+		if (ut->flags)
+			return -EINVAL;
+		ut->flags |= IO_UTIMENSAT_NO_PATH;
+		goto out;
+	}
+	err = delayed_getname_uflags(&ut->filename, fname, ut->flags);
+	if (unlikely(err))
+		return err;
+	req->flags |= REQ_F_NEED_CLEANUP;
+out:
+	req->flags |= REQ_F_FORCE_ASYNC;
+	return 0;
+}
+
+int io_utimensat(struct io_kiocb *req, unsigned int issue_flags)
+{
+	struct io_utimensat *ut = io_kiocb_to_cmd(req, struct io_utimensat);
+	int ret = 0;
+
+	WARN_ON_ONCE((issue_flags & IO_URING_F_NONBLOCK) &&
+		     !(ut->flags & IO_UTIMENSAT_NOOP));
+
+	if (ut->flags & IO_UTIMENSAT_NO_PATH) {
+		CLASS(fd, f)(ut->dfd);
+
+		ret = -EBADF;
+		if (!fd_empty(f))
+			ret = vfs_utimes(&fd_file(f)->f_path, ut->times);
+	} else if (!(ut->flags & IO_UTIMENSAT_NOOP)) {
+		CLASS(filename_complete_delayed, name)(&ut->filename);
+		ret = filename_utimensat(ut->dfd, name, ut->times, ut->flags);
+	}
+
+	req->flags &= ~REQ_F_NEED_CLEANUP;
+	if (ret < 0)
+		req_set_fail(req);
+	io_req_set_res(req, ret, 0);
+	return IOU_COMPLETE;
+}
+
+void io_utimensat_cleanup(struct io_kiocb *req)
+{
+	struct io_utimensat *ut = io_kiocb_to_cmd(req, struct io_utimensat);
+
+	dismiss_delayed_filename(&ut->filename);
+}
diff --git a/io_uring/fs.h b/io_uring/fs.h
index 0bb5efe3d6bb..2812dc3b4b2f 100644
--- a/io_uring/fs.h
+++ b/io_uring/fs.h
@@ -18,3 +18,7 @@ int io_symlinkat(struct io_kiocb *req, unsigned int issue_flags);
 int io_linkat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe);
 int io_linkat(struct io_kiocb *req, unsigned int issue_flags);
 void io_link_cleanup(struct io_kiocb *req);
+
+int io_utimensat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe);
+int io_utimensat(struct io_kiocb *req, unsigned int issue_flags);
+void io_utimensat_cleanup(struct io_kiocb *req);
diff --git a/io_uring/opdef.c b/io_uring/opdef.c
index cf3aa2242cd7..383a9b9d1df4 100644
--- a/io_uring/opdef.c
+++ b/io_uring/opdef.c
@@ -591,6 +591,10 @@ const struct io_issue_def io_issue_defs[] = {
 		.prep			= io_uring_cmd_prep,
 		.issue			= io_uring_cmd,
 	},
+	[IORING_OP_UTIMENSAT] = {
+		.prep			= io_utimensat_prep,
+		.issue			= io_utimensat,
+	},
 };
 
 const struct io_cold_def io_cold_defs[] = {
@@ -849,6 +853,10 @@ const struct io_cold_def io_cold_defs[] = {
 		.sqe_copy		= io_uring_cmd_sqe_copy,
 		.cleanup		= io_uring_cmd_cleanup,
 	},
+	[IORING_OP_UTIMENSAT] = {
+		.name			= "UTIMENSAT",
+		.cleanup		= io_utimensat_cleanup,
+	},
 };
 
 const char *io_uring_get_opcode(u8 opcode)
-- 
2.56.0

