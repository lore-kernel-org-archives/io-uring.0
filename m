Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B03F443C34
	for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 22:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790290797; cv=none; b=JD/nnuMIPRjXpy0EoCZuOUkyIsmtZAGTfrD1kuai7i7Z71jZm6E4KEG1pivo2rxS0nZ7DKlc17GXhQCKpdzJ2XeIgRh1XOmNKNwDDYVOUd1X17PIZHZqmOmF382lgraIs5/8ibxqH6JEoOGqSnAD02xR78XMTySUehPVisdaf+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790290797; c=relaxed/simple;
	bh=pJS20lYE7XpUn2yFrnpiOdX+vGhq2WQcLhWqRTWScEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LNOzlgn3sij84jyAIIz2S6nhZX1pAIMSGEc+/6AChcwbEEwQmpad0NpylNKaER/X5l8/lU+oP70wtvUzjmCnLTWFsdysCZSqAcsFiJD/BgPKKnTlyZlmpGwCAOIJu0944Gc4Xgy1a1D+2b0m5kligMxLkuNFsIh52rm0tgMj0Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=oilmx+V6; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="oilmx+V6"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a156f4so134832eec.0
        for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 15:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790290793; x=1790895593; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uZKY5d3/Dytyzq83xaE0ybg0ezdV/AE3RMLYgKKHzPQ=;
        b=oilmx+V6M2Cpr0FGNXxL5euQpJ23gaVOdE7tku7DCR5I4TrmRr4F+GT1Sv7XfBB4W8
         Are6So0xlhA9mJIbzS0WaTWaODWagfInWGW5/cvzeEFjqoD6f+4Tk97qrovIYfGsXqVt
         nwguhSbcYjHskwxpntVhwIKS0nB65jEuKbegtFDDKJee3UbM6/UccS5muTG5q8T6wbTt
         I40jCbRt5f2LwZeAPeJpQznbCOrnKMEIJg3artRZxnMaoVaMMjxlurH8+QLMJEbQbXsh
         ywvNRSmfRZ4AdZPC3MEtMIJy/BmHttum4rxNTsFgc+nPLjDo0+fb4LHrneF8ujxfNTQF
         bdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290793; x=1790895593;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uZKY5d3/Dytyzq83xaE0ybg0ezdV/AE3RMLYgKKHzPQ=;
        b=ZcUFZxopsxX1iSyMvOjiromhuHMRwSz5EjEBvH7RaXMHOu/GVe5meoAXf3e9kkWJIg
         IbpEJQT0saYMVRyRieUQ+Kwpa2y7zCZXqvjVPLYcGmHqOcxsAnK8TTuCAI7OYBx+HDyw
         FdMFsXbXTSbJYstsjStPoYjjxYMQCX//PZY290hVqikHcHTNWIQKoWokTpdisuinX3CG
         6d+HuYi6rkj246Rjy7kuKlSobY58K3SBXbDOpj9ain3vbbkhgPprftAzEfOBnSqCIEp/
         H3Rnt5qJvxhodVRjx94B97Z0zJP22xYfRGDSRD9zjENFSwAkuX6ddPPaJaE0nKj+LJIU
         +PXQ==
X-Gm-Message-State: AFuF++kAVIzieBvaFmSZLq9Izpd0NG7O9pxtoFG1I6k5aJMTJgMAZI4n
	3SQxEJnndOzW9EjWca3h4jwGg7lE/hqWYuWggXYYoyfCzt/ggeCdzcCIGCvjCf9chI0=
X-Gm-Gg: AYBFou37dbrbiqmFcvu+9Io1RqdA1Kf3aEewydq9RaUrnHuA4UfiB0/Uch1Th09mnmh
	wiyQX+Jj7Cy84/AvIRYGV9BTA0fTDBnrPuaSCpI+QgtGpFUbmGVo6RFAatvB3LECfT7IQIHNf9J
	O5jbKIy0P2kRQfqcs+Q9BDWL6LOZYG3PkeDs0wL+uUXnnjS2o+JP6zvntwbFVV5A9ljV+wkgu4P
	AUwnuyWgPfimnLDOiyrWa7hkebuc287NQj43WHqkibRmC855jrtbD6uULVF2mAbZ3o8YtXGheAP
	+jtcyQo0iy3+lUp4DtGInrrikp90FB5+6t0R33qasaECUO2H/IIOJ+1Fd1iC7rXNLqsubr6dOqa
	/Az6lj+3YOPoBIebpqMwTP6Pv1GAFN3JcSzaLfBiycSHSJa8Cj/qsHNwngrr1OXRv4Hf5HNgumN
	2TdIV6vXevos5B+cAPIDnLRG84l9DH6tJzp5sQpb0at0mMUCKUZHKX1E05j3rYOD2QLYcFl/6wA
	aEDYjf0TLnRsVTRr4eQnvKiYaDP/+xsV1cS9Cdjl4vfeiu2bqrEOQI=
X-Received: by 2002:a05:693c:66cd:20b0:33b:d8b2:8fba with SMTP id 5a478bee46e88-34002be4d40mr2933698eec.7.1790290792990;
        Thu, 24 Sep 2026 15:59:52 -0700 (PDT)
Received: from [172.16.11.208] ([4.39.28.114])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3414407d18fsm1457174eec.10.2026.09.24.15.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 15:59:52 -0700 (PDT)
Message-ID: <096d996d-3028-41ea-bf0c-f7eef1281fcb@kernel.dk>
Date: Thu, 24 Sep 2026 16:59:50 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/sqpoll: pin task across task-work publication
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260924205056.3759980-2-Jeremy.Jean@oss.cyber.gouv.fr>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260924205056.3759980-2-Jeremy.Jean@oss.cyber.gouv.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/26 2:50 PM, J?r?my Jean wrote:
> SQPOLL can consume a request immediately after mpscq_push(). If this
> drops the final ring reference, ctx and tctx may be freed before
> io_req_normal_work_add() finishes using them. KASAN reports:
> 
>   BUG: KASAN: slab-use-after-free in io_req_normal_work_add+0x439/0x510
>   Read of size 4 at addr ff11000000ca0000 by task repro/55
>   (...)
>   BUG: KASAN: slab-use-after-free in queue_work_on+0x25/0x70
>   Write of size 8 at addr ff11000000c3bd00 by task repro/55
> 
> Handle SQPOLL before publication. Pin tctx->task, publish the request,
> then use only the pinned task so the publication tail cannot dereference
> freed contexts.
> 
> Fixes: af5d68f8892f ("io_uring/sqpoll: manage task_work privately")

Was going to say this isn't correct, as the mpscq is newer than that.
But I suppose this already existed before that, with the previous switch
to private task work for SQPOLL? I'll dig into that a bit...

> diff --git a/io_uring/tw.c b/io_uring/tw.c
> index f573bcc3af6a..2e37a3fd7a33 100644
> --- a/io_uring/tw.c
> +++ b/io_uring/tw.c
> @@ -210,6 +210,19 @@ void io_req_normal_work_add(struct io_kiocb *req)
>  	struct io_uring_task *tctx = req->tctx;
>  	struct io_ring_ctx *ctx = req->ctx;
>  
> +	/* SQPOLL may consume and retire the request immediately after push. */
> +	if (ctx->flags & IORING_SETUP_SQPOLL) {
> +		struct task_struct *task = tctx->task;
> +		bool first;
> +
> +		get_task_struct(task);
> +		first = mpscq_push(&tctx->task_list, &req->io_task_work.node);
> +		if (first)
> +			__set_notify_signal(task);
> +		put_task_struct(task);
> +		return;
> +	}

There's no point in having a 'first' variable. LLM's love bools...

		if (mpscq_push(&tctx->task_list, &req->io_task_work.node))
			__set_notify_signal(task);

would be better.

-- 
Jens Axboe
