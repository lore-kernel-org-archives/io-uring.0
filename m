Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99E344998F
	for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 18:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785435092; cv=pass; b=XUUnQdYTxO4pHLct8U7hDwFSry0ZM/AW3Aif3+PlOeLvrbmHIDqFPrjlcHVKD8xUIf1gCzABAoRJl03ugdwkd7xWfYfi28tKtQXKXXDQgqG0o+ht6U8fmosyVC/P/mjMvqL4coKeSWxNPnk3kz3lPyAb3yphKu+l7uUBqpsw5cI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785435092; c=relaxed/simple;
	bh=/MFrgeHB/JGTPQ0kUvaSQtft+oANmM/MJDLq4ZVrwWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y/K1WmsKJ0WGdSegbYJSgI3OvsaBP+wkEKx3myKUb2qJ0O6dY85lB9uiW0J96HfpsIZO2oUBATE678l+X+xMI4uuPo/ANA98R8/e2o9BdwoT64BAvMEq12a9alj72FRnRcHJOxTjMpCIOBTllYI8zv7ucvC+i9lrihSGS2jbs8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Rir8Q8qB; arc=pass smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Rir8Q8qB"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-495e5f0f428so23318b6e.0
        for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 11:11:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785435081; cv=none;
        d=google.com; s=arc-20260327;
        b=PlvMxMrmlMbTfojwbRoIAsiEjWHi5O6YUtILAeRCoW9cE604OVgLv9wTgszymkkfiD
         VY8E9ta3TysP6igk36fA0M8ZbVItr7AZSqGLEFu0GZFClko2JHcC8Oynd604lDossGIk
         j8mYPM4iCoJz5EPguh9pBSlIinuDrAKZUtIvCXzOwxOOwla1mqBUJmdkYi12XuAamLiE
         ijjqmwZl26tgWcLZWwzswmuscNK1ph8lQI5SQBj5EfZ/wcH3cNz5D0CiFjtmJsWQba7L
         s16ujw29u68A+CDOn9EcboTAwkABwKuHN3380EVO6v+nF11HiG7f1HY/KCW4XWXecY3t
         2b0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KWn++GUbT2QZFiOR9tuiiQlgXCwVVJXMJ+BzRJg5kaw=;
        fh=UjUPYjCyuUY2Mb2LfpQI9V6TSxwVKRTjKeLIVK2k6xw=;
        b=S32RUo7e0D8knq09NHyyJS/5sBWtMjNKmjRfY+54t5AmfPKEUgCfVCiw/KSejDDRLB
         l5ar4Qd1w3H6Lg4rhZje3cWBkf+mYlqu5J2Vvb7ZffYWakXFXgrbG8vFNZHKzMDUaiRz
         JE5Ttv0IHUsTYR+ozHpwqkoHvg/xUp2yzJPx9jK7rkYKM9dKZzByknf8Dp6Waqh4l40w
         UzbKh5htF/+TR7rNSpjzvIdMhcKeDFpNpgLAeIxEs0Tb4DHHXUezI46gmFyutT1TZ+JZ
         F9aA29rluVUobNvNc9qbTOnt2SjTm+f3xtg2W6eeACUmQdr8CKoWQYhQzGMKWY8rPjOX
         ur7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1785435081; x=1786039881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KWn++GUbT2QZFiOR9tuiiQlgXCwVVJXMJ+BzRJg5kaw=;
        b=Rir8Q8qBtTYOzqIsgtydzC5x3l7DGxzXX/ffdEGHxtkm8cOEd1wwgy5SOCS85Dyuxt
         WfBDW5jCXsJSbW5HsokzWc3aO86Mjj2dNW443T/8UmH00Fn/Twukof6Yabjp/EyLDgAt
         czR2gY59JRam4FsIYfIHNtG7Qa4YzNFqrrkayzqu3JXkELbZU0XIdafOhuzedZpTcwcE
         2r/m1HpMS0sL2QxfqLTOPyk9zLCMRD96H9TJazKJbYQSA0GPKZbiihm0FvdCsgvwK19J
         bVLnpaYi+ZT9evGWNfSFlV2b0zxPmMFi44g29ILsbPUm5xVsWBrE2vBxlE7wIHhExrff
         Xtqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785435081; x=1786039881;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KWn++GUbT2QZFiOR9tuiiQlgXCwVVJXMJ+BzRJg5kaw=;
        b=sNHHixWOOfxJ5k3hqmuKVf8FR+aIrfucVHef5UfNEoPRlN9Wy88ZeB4XgRESO61X5p
         P2rcipyFihY6WYOuyz2p4xALXt4fEROpI1FaTcTjJFodBmTZUsDRT9/xWK/NmTLFxJn5
         LTX6kU8EhQl6Fn519DWmIOGuNXgt4fXZ/TEk65mYjh53zmp8lhR5VnJDwjwz5WPLe7S9
         MfDa9G6f2pepdisaGfALlC1vpURpcriQC8GC8S3Ahryhm7963SYFLzP7p/bPu4Ijuas9
         70FBZHZltKxaa3glLqA8qi/mafWsN+JDQzJ6QD1xBStN8qKT3Z+hscoO5Ak8rE7HjUNc
         rZew==
X-Gm-Message-State: AOJu0YzR+DLgAeH1CQ2Sn5QKIIiv4FWEr274ea+cE3swldsexhM6ehcJ
	0A2A3l+2BuRPb6A9lS/RR6SbSM+tu1Pu7+qPbNlQn/QddgoA98NRtpfpEOo0TiwSfkK4XSRitg3
	5+qDuCDLCsLf5UEIRL8cvCAJ08eBH24/6osSLBsuonEoyw+uCurw5lb74fQ==
X-Gm-Gg: AR+sD11Jrqz7Zg3IXkHOUhFyLsIgkDHVDNxldcTr/M5tOf1e02WEe7M6eGdkWPRiVom
	YUzUL8qhOPkdf2HDr3I55XDP3FUks4c/uPzh7rYfHHSfjH+eimZMWZJN2GqLxleOL1rWAr+fBXR
	1P182xbGX4kDpbpUKJJQrfyWTkF8GdtoPZ/7s/WNXoVXMJNrnVZ/YHmir2WqUc1nQe7QP/P41iG
	G1N+iQA0zUMNF/o62F4Kyo2Jpp4nZqQNSEV/xp649uGEwMAT2rbJQHPU3HB3cnqqkrLtGahWvkU
	wZ1yW+KLSPwGmWP+bX0WZSC9Py/kbc+EQMmJCiui5Gal
X-Received: by 2002:a05:6808:30a1:b0:496:9bf:c837 with SMTP id
 5614622812f47-4ad94ece199mr1772375b6e.0.1785435081246; Thu, 30 Jul 2026
 11:11:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702184847.1709378-1-csander@purestorage.com>
In-Reply-To: <20260702184847.1709378-1-csander@purestorage.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Thu, 30 Jul 2026 11:11:10 -0700
X-Gm-Features: AUfX_mxs7i_f4ku8VTrDtyHvOTHTET6ekt0OZXAyzxMER06GjrTNOQhiyN2qqro
Message-ID: <CADUfDZrHpa07VGnJLwwd79JwmyzuFU8cZYwBHC3YOX1ZENp2uQ@mail.gmail.com>
Subject: Re: [PATCH] io_uring/uring_cmd: skip io_uring_cmd_issue_blocking()
 task work
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jens,
I think you had mentioned planning to queue this patch up for 7.3:
https://lore.kernel.org/io-uring/ce98e216-98bf-42cf-b1a0-89a2ea62f897@kerne=
l.dk/
I didn't see it in for-7.3/io_uring, so just checking if that's still your =
plan.

Thanks,
Caleb

On Thu, Jul 2, 2026 at 11:48=E2=80=AFAM Caleb Sander Mateos
<csander@purestorage.com> wrote:
>
> io_uring_cmd_issue_blocking() is only called from blk_cmd_complete(),
> which is already a task work callback. However, it queues another task
> work item, to call io_queue_iowq(). Just call io_queue_iowq() directly
> to skip the CPU cost and latency of the redundant task work proxying.
>
> Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
> ---
>  io_uring/io_uring.c  | 13 +------------
>  io_uring/io_uring.h  |  2 +-
>  io_uring/uring_cmd.c |  2 +-
>  3 files changed, 3 insertions(+), 14 deletions(-)
>
> diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
> index 1279e27c2c6d..4c83a94b4bdc 100644
> --- a/io_uring/io_uring.c
> +++ b/io_uring/io_uring.c
> @@ -405,11 +405,11 @@ static void io_prep_async_link(struct io_kiocb *req=
)
>                 io_for_each_link(cur, req)
>                         io_prep_async_work(cur);
>         }
>  }
>
> -static void io_queue_iowq(struct io_kiocb *req)
> +void io_queue_iowq(struct io_kiocb *req)
>  {
>         struct io_uring_task *tctx =3D req->tctx;
>
>         BUG_ON(!tctx);
>
> @@ -433,21 +433,10 @@ static void io_queue_iowq(struct io_kiocb *req)
>
>         trace_io_uring_queue_async_work(req, io_wq_is_hashed(&req->work))=
;
>         io_wq_enqueue(tctx->io_wq, &req->work);
>  }
>
> -static void io_req_queue_iowq_tw(struct io_tw_req tw_req, io_tw_token_t =
tw)
> -{
> -       io_queue_iowq(tw_req.req);
> -}
> -
> -void io_req_queue_iowq(struct io_kiocb *req)
> -{
> -       req->io_task_work.func =3D io_req_queue_iowq_tw;
> -       io_req_task_work_add(req);
> -}
> -
>  unsigned io_linked_nr(struct io_kiocb *req)
>  {
>         struct io_kiocb *tmp;
>         unsigned nr =3D 0;
>
> diff --git a/io_uring/io_uring.h b/io_uring/io_uring.h
> index cb736b815422..dfe26a9c21bf 100644
> --- a/io_uring/io_uring.h
> +++ b/io_uring/io_uring.h
> @@ -193,11 +193,11 @@ void io_req_task_queue_fail(struct io_kiocb *req, i=
nt ret);
>  void io_req_task_submit(struct io_tw_req tw_req, io_tw_token_t tw);
>  __cold void io_uring_drop_tctx_refs(struct task_struct *task);
>
>  int io_ring_add_registered_file(struct io_uring_task *tctx, struct file =
*file,
>                                      int start, int end);
> -void io_req_queue_iowq(struct io_kiocb *req);
> +void io_queue_iowq(struct io_kiocb *req);
>
>  int io_poll_issue(struct io_kiocb *req, io_tw_token_t tw);
>  int io_submit_sqes(struct io_ring_ctx *ctx, unsigned int nr);
>  int io_do_iopoll(struct io_ring_ctx *ctx, bool force_nonspin);
>  __cold void io_iopoll_try_reap_events(struct io_ring_ctx *ctx);
> diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
> index 7b25dcd9d05f..5525267d2e03 100644
> --- a/io_uring/uring_cmd.c
> +++ b/io_uring/uring_cmd.c
> @@ -324,11 +324,11 @@ EXPORT_SYMBOL_GPL(io_uring_cmd_import_fixed_vec);
>
>  void io_uring_cmd_issue_blocking(struct io_uring_cmd *ioucmd)
>  {
>         struct io_kiocb *req =3D cmd_to_io_kiocb(ioucmd);
>
> -       io_req_queue_iowq(req);
> +       io_queue_iowq(req);
>  }
>
>  int io_cmd_poll_multishot(struct io_uring_cmd *cmd,
>                           unsigned int issue_flags, __poll_t mask)
>  {
> --
> 2.54.0
>
