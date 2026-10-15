Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DA7459AE9
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092674; cv=none; b=VFhs+bDJAq/rYgCqDJkzCSj4v/JlvqmBAxBqUp6CmOblBGl1ceFI6FhkiLt2pBhP6g0FvSpJyw578K84WdoyDt5BmDuUweShM1FpzI19M0D/yTKhtskpFMj1zY16B7CoD8t8PQzD3euYeaUqMlSYOHc5KXHg5d/C/mGC9DsATzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092674; c=relaxed/simple;
	bh=6CRH4aClKN+NoLt6DyQTa39cTRZtmy32QHjOnbEgjj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bn3mAWj6BYv02DieAseseHohQja40G23P9TYx/29D/I3LSIAXqKnSge+uCzI2ts8dbzbA+dlttj60d1kRuR+ycwHRcAdlg+FyTOYb44x7UMeO4NmuSkXH+1NndL0ieWVSCOpYOnEP4KAdqzWiRiTrDLGNi3JU8SJTXrOLsLDfYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=Lo5AzwJ/; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="Lo5AzwJ/"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91b83459526so52220086d6.2
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092672; x=1792697472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n7qVzziFpkWx4gynv9ktFVtvSzrjkfJ2AfkaDrWyR+M=;
        b=Lo5AzwJ/HyJ8J3Dmm9RztBZfJsYbPZs1j+5xG/4i1wKRLK6pb+57fTHZqUvogJuhQB
         79KqVkzpI3RbxYMvwdsFbbDRst3eomuNqf8jkHu/dIh51lpvX8NLwWjFx2XzH8NVYsMc
         NIXkEkoBHmrrTgTdTxq1a7/nqjx004t3pF6PN+DoEoYHnsqNqMLe3esyXB0bZqvPpVQi
         3Hp9WDxFnk3rfx0q68ei05ahMBi6JG0npdIGl41cqOBkA/RmNwJPxprg2XD0wfAkFHkl
         cCmpC3O0FDzXTrg4RUcKJtV/YwtBxF+xuKBoXydL6VY+EKHwYBafijGGFnjl8icr4Wt+
         X72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092672; x=1792697472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n7qVzziFpkWx4gynv9ktFVtvSzrjkfJ2AfkaDrWyR+M=;
        b=2iKpZ7owAh82pUFxW9Ld8DskAMxsgiixRP0oHy3Kzc0Jh/OcHIdnzoJH8eUZqfsWS6
         4X3Mef3iSBsy91rGPiUs/himXClkTmhYAPz0AEl3Fq4dMVNR67zpLGEGMVZXN8dsgZyr
         4FQRz5agQxCZKMIBR1LyP7y2I+gJRPKAWErE1oGJE9waL/C99aZtB3mZ3ucqB1e/MKxc
         35fSQvhQ38SUeptLUTtErys7nUnvHQPYzJzfqkvARP5yR2+kzNS+2lZVKfFiN2Cmg4HD
         n6UnGAND/nFyvmUL8sxz3qBc2DiN2YAGUu45j4LLGBiyLE3bWTYs/W5a/z01zGTbMnlf
         MIKA==
X-Gm-Message-State: AFq9FYKHRwcn4zDStFnIq8g6czmYlebE2LRZ5LCp3O7kQTRQMqT80k1G
	3jNAUIjx30SO28T1h6LN8XqqE7sTvJOvnAdqBBxyXP+omdkkIXiOnZV9nRvFQFMueOEd5jZWYHN
	vFCfg
X-Gm-Gg: AYBFou2LylZeIiuQ3fRvXzLSeS3kl0uFlEWpg5hnQ18TJIjk43xBFCIB9EGV6uWFtQC
	pOROaE2dSAKTj/vuZYlnvseSAn1bVU+aubsbJBTJ6F3O2RK4GDa1MgT35C16HJnocB0WOYBUN10
	YLKhVC7SolCDQDO6yGWIZpY0DVP8uQD+kYaShwJTIAvVZOQQ/Z/MOYAQw4OJFiKexhWZyLRgBOY
	DWN10eQ1BDmTnSfJwGOnZCtpQWhn1KsRt9mro/ut3nU5Cp0jlLRnJYo+Mtrjd9oZ9Rp1FRFMujL
	voFnvwQAFHQnpYHpxQWxcjJzsi5T6MoYF5kKbSQ9D96p3fyJz8hCjdbGf4KPrl7ONVK9NEE8n95
	a2eQZf+1H5U29qKszl1tHXABxXb+9J8tqo9i345NRN0WM+bHariouQMZ+vfXrzo6AdOVxXOF+aE
	mzQ+1oGQAXO7w+ezv++dV39iEdPAXhdW6T7TycfEYM/pPuiG0efMyHgJb6Y+DYCn4OjeH6fP8H0
	h2GR452tjbb4+c=
X-Received: by 2002:a05:6214:623:b0:912:61e2:8817 with SMTP id 6a1803df08f44-91b55565052mr327469206d6.28.1792092671871;
        Thu, 15 Oct 2026 12:31:11 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.244])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcc47bccasm2235606d6.20.2026.10.15.12.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:31:10 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:25 +0000
Subject: [PATCH 01/43] io_uring/waitid: own the request before clearing
 ->head
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-1-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092657; l=2937;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=6CRH4aClKN+NoLt6DyQTa39cTRZtmy32QHjOnbEgjj8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMLT/SZt/NPycRw3pfD8HwsVxvVuJ9+SrOrlud7PyDNrD9+0Oqs4OaRfxu7cEFR39+YD41dykQF
 aljlo/r6kMQw=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

io_waitid_remove_wq() only takes the wait queue lock if ->head is set.
io_waitid_wait() clears ->head first thing, before it tries to become the
owner of the request by bumping ->refs. If somebody else owns the request
at that point, nothing keeps it from completing the request while the
wake up handler is still going to touch it:

CPU0 (io_waitid_wait)                 CPU1 (io_waitid, holds a ref)
list_del_init(&wait->entry)
smp_store_release(&iw->head, NULL)
                                      __do_wait() finds another child
                                      io_waitid_remove_wq()
                                        // ->head == NULL, no locking
                                      io_waitid_finish(), IOU_COMPLETE
                                      // request freed and reused
atomic_fetch_inc(&iw->refs)

The same goes for __io_waitid_cancel() if it claims the request in that
window. ->refs is part of the per opcode data of the request, so this
increments whatever the next user of the request keeps there. If that
happens to be zero, the handler concludes that it owns the request, and
queues io_waitid_cb() for it. With the window held open by a delay, and
the request reused for a receive that is waiting for data:

  BUG: KASAN: slab-use-after-free in __wake_up_common+0x1ca/0x1f0
   __wake_up_sync_key+0x36/0x50
   sock_def_readable+0xf1/0x420
   unix_stream_sendmsg+0x60b/0x1110
  Allocated by task 87:
   io_arm_apoll+0x1ed/0x940
  Freed by task 87:
   __io_submit_flush_completions+0x118d/0x1a10
   tctx_task_work_run+0x327/0x950

Only clear ->head once the handler owns the request. If it doesn't, the
owner finds ->head set and has to wait for the lock, which is held by the
caller of the handler. Deleting the already deleted entry again is
harmless.

Fixes: ab673c1bcaf2 ("io_uring/waitid: use io_waitid_remove_wq() consistently")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/waitid.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/io_uring/waitid.c b/io_uring/waitid.c
index 2b756017423f..a91491650440 100644
--- a/io_uring/waitid.c
+++ b/io_uring/waitid.c
@@ -265,12 +265,18 @@ static int io_waitid_wait(struct wait_queue_entry *wait, unsigned mode,
 		return 0;
 
 	list_del_init(&wait->entry);
-	smp_store_release(&iw->head, NULL);
 
-	/* cancel is in progress */
+	/*
+	 * Cancel or issue is in progress. Leave ->head alone, so that whoever
+	 * owns the request has to take the wait queue lock, which we hold,
+	 * before it can complete and free it.
+	 */
 	if (atomic_fetch_inc(&iw->refs) & IO_WAITID_REF_MASK)
 		return 1;
 
+	/* pairs with the smp_load_acquire() in io_waitid_remove_wq() */
+	smp_store_release(&iw->head, NULL);
+
 	req->io_task_work.func = io_waitid_cb;
 	__io_req_task_work_add(req, IOU_F_TWQ_IN_WAKE);
 	return 1;

-- 
2.55.0

