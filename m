Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A206A4F7986
	for <io-uring@vger.kernel.org>; Mon, 19 Oct 2026 13:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417249; cv=none; b=b1aRLQ8TNIgy7zNJa1jSgkO1SqZCNnEbdVNaSPhsA6JwiFou723ej65sn+szDLe/KGmqIW2J7nrukUb82RHDeBdrSo0DOKbUrBwy8L7n5WSlKs6ArrBTEPcfX0x0iufpywEwrhlPMGIOoxkrIJEzezsZhaHx9rnVrislYd3nKFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417249; c=relaxed/simple;
	bh=hUhBVpSTJR79fZOx3XriD8gVhMiXrasOdf5lG9lo7Vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5nUcXhdy9Z7d57JsnsOYLd0PiXEf4wrOgiKezyCr6bAFtzDFyH6FDZGSkSziQ9xoZpg9rF16M034pJag7skpIsEI6Uv4Ob/Vv0IDjwu8K3cmjRvDdXZ6pVXY7OqgA51ljxzdQo0xudtjuBTy78aq3iJz943t+nywuKSymUlUJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4ZMtBvY; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4ZMtBvY"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-157fe9d771bso706209c88.0
        for <io-uring@vger.kernel.org>; Mon, 19 Oct 2026 06:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792417247; x=1793022047; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cCjmpspcPpS38WYBBQYovAwzUdEJHovl54RGs3q/tTo=;
        b=E4ZMtBvYVsg3rqDO+GlC0suXYVEkRTuT2UOqcs0w8zJy9D3W3WxzQzrIIX5Fx6anJk
         5aSgLqZ3M7PUnkiKvdhW4LttWGyS6Fmfz1WWdhjdS9RvysAlZorGIuD+cQU7FPUqpRgr
         rSJewsqbOe92NDN5yI6qg534d4hvUyjXWO9QJvwCeD5PecbkOF00UXNXmxmyhlSKeqe6
         Vi5b6KZWh4UwLqKzxeZRVsp28/0D1p3yEuOizepFM9es94hU3YxfH4nV/f/yl1TcKnNt
         8TeTjds58zE7PtgGxnpMrPNLDxbEjAV80VpWpKMKooyHg+4m4NtvkBiWumq0ONHJQVrZ
         KMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417247; x=1793022047;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cCjmpspcPpS38WYBBQYovAwzUdEJHovl54RGs3q/tTo=;
        b=bJMJ/yBf1UeJF8baNUBgDvCmm61OIlIklQihu3uYEL7SLpF+/JmA8ol3BIZB9SOjtn
         AyfljmBtRHM1JD+EsMP+9laT8x0sE3irgZBpIHqDic+gtM61H07EWKsoThPRdDlV7U9k
         +qkT39pBBsJ235m7p1ao7w4yM0+41TkDZqU6WSzC1aFTGpJmzPN4Uqjk/yGSoKM7y87E
         d0LbCeuYBHB4vxryqcqg217n97BM192TQsj7XCGaFmz2+n2u9RnVdT4ZzAB2qNkfTmKv
         L33jh5NBpOeuppHKveKNGOJgtITKdPS6OCYMBNrxaALzRQV1bgIKKeDPTSP5kR/epnkO
         l8IQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrKcWAV1IJ9i0vXbNxHT5fNno4QFZTq1s8wu4hzzA5IOeuI6laMKjFrCeXkznvndCnYNXhvra/uQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLH9mzGfHqymNjyIaSAnxG2kJuAT4X5Pm9IThA95fVFmxvbeGYQ
	OIn8pKyxpZ2D34YXW2VVpjrV96vCOZzuBZaaT4ePgsZ3c+WtlB+tX1I=
X-Gm-Gg: AYBFou39d8j+/kgsSoeyMgZfDEYNJpP4GMb0MpdX7V2e14elDay89AWQpKy/T2NUZvJ
	qR+jsNQvbfD5FcyBp59TRAuXkvGFxo2MTOYdNN/umMT0i5MJRuWDX/MwCEauJryMsHYyPqGzyfv
	v5iZoxu14ptQUvlSkc6jD736tu2E4Hj2Zzb9zA08eO1pW6xFbyUIBLkRwZ6r0DdoPXEk7SeQ8WO
	O7bydI5Vgihigrdqp7iBbwuLPRNywptv9hpxwQT93E1T0zGmp/WGPvKc5OM1XnzpEbLVJWVQeJU
	8r11f3VhoCKTx5hH2mutj49X5pIv8CP6C7iGuS3M3rDp63CvbDnUZiqsj4VGYOsAalSR1gUeJn+
	iwupAQnJBPPJidkwWzTEsXRqafGjhntqj8Encs/JqoqqdmTdABwH3l1PaJ0J0euPWHIBsKX8EE5
	Q0KkCRl3vHXWz4rL0AxY93V3Y03TYPZAF1+al6kOEm+24zl7ffUkOrovJ+M3CJQ6YQVbDv1uPFA
	SDhPYa1dFiuJbCL+KcL0Jod8+tHLjXsRcL0/MZI3aMwp4dJ
X-Received: by 2002:a05:7022:170d:b0:143:3617:c595 with SMTP id a92af1059eb24-1850c223bb9mr10480854c88.1.1792417231454;
        Mon, 19 Oct 2026 06:40:31 -0700 (PDT)
Received: from anuj-MacBookPro ([2406:7400:63:e55a:9f78:eb3b:17e1:f1b6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831ba424a6sm29078300c88.17.2026.10.19.06.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:40:30 -0700 (PDT)
Date: Mon, 19 Oct 2026 19:10:22 +0530
From: Anuj Gupta <anuj1072538@gmail.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: kbusch@kernel.org, hch@lst.de, sagi@grimberg.me, axboe@kernel.dk, 
	joshi.k@samsung.com, linux-nvme@lists.infradead.org, linux-block@vger.kernel.org, 
	io-uring@vger.kernel.org, Anuj Gupta <anuj20.g@samsung.com>
Subject: Re: [PATCH] nvme/io_uring: enable dma-buf backed passthrough I/O
Message-ID: <vx4ugjq6wol6elipmwkuhtpk3qnanpwou6g73dxrjona3nepd4@pvetkgijfsx5>
References: <20261016103453.1129150-1-anuj1072538@gmail.com>
 <79627452-98d3-4e8d-9c37-ceda0796d59c@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79627452-98d3-4e8d-9c37-ceda0796d59c@gmail.com>

On Sun, Oct 18, 2026 at 11:06:16PM +0100, Pavel Begunkov wrote:
> On 10/16/26 11:34, Anuj Gupta wrote:
> > From: Anuj Gupta <anuj20.g@samsung.com>
> > diff --git a/drivers/nvme/host/ioctl.c b/drivers/nvme/host/ioctl.c
> > index 3aa5d2f2dfbb..6343da1f6c05 100644
> > --- a/drivers/nvme/host/ioctl.c
> > +++ b/drivers/nvme/host/ioctl.c
> > @@ -458,6 +458,7 @@ static enum rq_end_io_ret nvme_uring_cmd_end_io(struct request *req,
> >   			status = blk_status_to_errno(err);
> >   	}
> >   	io_uring_cmd_set_res32(ioucmd, status, result);
> > +	io_uring_cmd_detach_dmabuf(ioucmd);
> 
> It's not great spilling the responsibility for [de,a]ttaching
> between nvme and uring_cmd code. Is there a way to stash it
> all under io_uring?

The natural place would be __io_uring_cmd_done(), but that runs from
task_work, while the ref has to be dropped at hardware completion, like
io_complete_rw() does.

Hooking io_uring_cmd_do_in_task_lazy() would avoid changing the NVMe
call site, but would add a non-obvious side effect to a generic
task_work helper. How about a separate helper that drivers call from
end_io instead? This keeps the dma-buf handling in io_uring while NVMe
only reports that it has finished accessing the data.

Something like this on top of this patch:

diff --git a/drivers/nvme/host/ioctl.c b/drivers/nvme/host/ioctl.c
index 6343da1f6c05..6a7d1cc7b716 100644
--- a/drivers/nvme/host/ioctl.c
+++ b/drivers/nvme/host/ioctl.c
@@ -458,7 +458,6 @@ static enum rq_end_io_ret nvme_uring_cmd_end_io(struct request *req,
 			status = blk_status_to_errno(err);
 	}
 	io_uring_cmd_set_res32(ioucmd, status, result);
-	io_uring_cmd_detach_dmabuf(ioucmd);
 
 	/*
 	 * For IOPOLL, check if this completion is happening in the context
@@ -473,7 +472,7 @@ static enum rq_end_io_ret nvme_uring_cmd_end_io(struct request *req,
 			blk_rq_unmap_user(pdu->bio);
 		__io_uring_cmd_done(ioucmd, 0);
 	} else {
-		io_uring_cmd_do_in_task_lazy(ioucmd, nvme_uring_task_cb);
+		io_uring_cmd_hw_done(ioucmd, nvme_uring_task_cb);
 	}
 	return RQ_END_IO_FREE;
 }
diff --git a/include/linux/io_uring/cmd.h b/include/linux/io_uring/cmd.h
index 33e0ebeea5a0..0a89f5faf88c 100644
--- a/include/linux/io_uring/cmd.h
+++ b/include/linux/io_uring/cmd.h
@@ -70,7 +70,8 @@ int io_uring_cmd_import_fixed_vec(struct io_uring_cmd *ioucmd,
 				  size_t uvec_segs,
 				  int ddir, struct iov_iter *iter,
 				  unsigned issue_flags);
-void io_uring_cmd_detach_dmabuf(struct io_uring_cmd *ioucmd);
+void io_uring_cmd_hw_done(struct io_uring_cmd *ioucmd,
+			  io_req_tw_func_t task_work_cb);
 
 /*
  * Completes the request, i.e. posts an io_uring CQE and deallocates @ioucmd
@@ -138,7 +139,8 @@ static inline int io_uring_cmd_import_fixed_vec(struct io_uring_cmd *ioucmd,
 	return -EOPNOTSUPP;
 }
 
-static inline void io_uring_cmd_detach_dmabuf(struct io_uring_cmd *ioucmd)
+static inline void io_uring_cmd_hw_done(struct io_uring_cmd *ioucmd,
+					io_req_tw_func_t task_work_cb)
 {
 }
 
diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
index 0e0509edec6f..11a8ed1ba03a 100644
--- a/io_uring/uring_cmd.c
+++ b/io_uring/uring_cmd.c
@@ -50,12 +50,6 @@ void io_uring_cmd_cleanup(struct io_kiocb *req)
 	io_req_uring_cleanup(req, 0);
 }
 
-void io_uring_cmd_detach_dmabuf(struct io_uring_cmd *ioucmd)
-{
-	io_detach_dmabuf_map(cmd_to_io_kiocb(ioucmd));
-}
-EXPORT_SYMBOL_GPL(io_uring_cmd_detach_dmabuf);
-
 bool io_uring_try_cancel_uring_cmd(struct io_ring_ctx *ctx,
 				   struct io_uring_task *tctx)
 {
@@ -146,6 +140,18 @@ void __io_uring_cmd_do_in_task(struct io_uring_cmd *ioucmd,
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
