Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9923B634E
	for <io-uring@vger.kernel.org>; Sun, 27 Sep 2026 02:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790477247; cv=none; b=upp7l5rkd9duz94Vjyu3vx17CpomQchEjIyPM5ykN8PXG2hqxtoTuxg6g/kz7rS5uXnJ9VgYGYSSK6BTL2fRWIqT4xupHAI80xru7rjCGhsUxf+yubCcPUBEbbqU1XfBO0XKTRAmguicD/LohEuU4f18RxV2iPY0vxvob6Jzzg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790477247; c=relaxed/simple;
	bh=sw1FsZk3EXWJSZs1rgYit1v3sgrB+52CTgcM/JeRkS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=niA+BM+rs/6dZU3HwI5zmj4cpnfXBqmDYKyzhsxvklwDDI22nh9aYgtVZvLKNTynmg1fURt80EAUOdFnv7FuE1AQ5khSPeLUSMd1yQXM3TsAhlEIKYjL0KZSQNfpwaGIOrvqSuMLnaQITKHF1hL53kKvNi7zOgNePONegWe2XZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NXmw60ZT; arc=none smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXmw60ZT"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-7f4f0d37f9dso909044a34.1
        for <io-uring@vger.kernel.org>; Sat, 26 Sep 2026 19:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790477244; x=1791082044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GBbvPJsBSWZjdVvkKhQVMvVffAad735JPJh2cGJmwo0=;
        b=NXmw60ZTkPfjTHSYZrdrUztbze+i2DL8ptGE4+KxgnOiIbPFij0M8+LYt+V0S1femP
         /tPrBLsbArNSZrqykexvoWsY26DIFWYaL75LpIlnYze4pFfH7ebgXX1St69zLkDR/Pk8
         zw77sIrTOX6klrfopFPEQXpewLIP1Z6z+8au+ChTS2ODwAZzBJdPD62v2h0ZFJsBVctb
         +lwmksB2ucwrB0oSNvqrD2oMloXSsKdo6d4UrEsCn5VSTq0H1fB+qUznMql3ixyppsMm
         tGAYBMX+KOXVEnOBNtPVqFAzXElMeFmyiKdgRTbzvzd+vDdoWasCXJcGVKxpdJtK6jh3
         cHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477244; x=1791082044;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GBbvPJsBSWZjdVvkKhQVMvVffAad735JPJh2cGJmwo0=;
        b=afIyk5ia5wCHj/1TFP3lPuMB/b+6GwpmPDMgPQY95bc9dGW5rMclvDaCx7Y/hqm4S8
         7wg0+11qfoAK8C6xU3qUdp8E4IKbV1hdl8PBo/28ruDRXsWtmlnXmKvQUu+ZFE5ZzbfU
         e9Lfq17sdH0xIfcDi/8IeWoEz+tc3byTQtlFSLkstw2hDIz1wdPJmRiR12bgawypp9Ca
         PYNY2PaBcB0r7bPACRL/y7z29q0khKwgHDrE5EA1Ytjwiu7SLYVi90LlXV8gGCkq8QZh
         GEpYShzhfyLGXUOlhkB/HWakezG0pFsyVXTVPzY1boEkaIq2ya3f8bLmmgMxhEopJgPA
         tqNQ==
X-Gm-Message-State: AFuF++nKVurR9KaM84drwzpjkAZbaBavfKNLmupjWVmKDsgxgvmpT3q0
	+3DxzY8IDwKiIyKb6UVBkusbPB5Wy5AFbK310rfKnUoGdfIvTh1ZSbjSvZDlXg==
X-Gm-Gg: AYBFou19yY6VgmbYPkbR3XabGbvWnUSY4lmRhFS8VeV6TCWERrKq4fQyrykiEbXfbrQ
	mf3CqZQacf8TD+ltTFPSV1VKuJod27OWa0gTMFRrigcpw8/APsgT65mSvo7BF/aFBkmpBJsngis
	VpVvZErx4VXb4vpNoZW+bqnTq+D3Y1wvSvMRtglcWeaZXod+I6YU/toiKx+kx/x/+1mLbuvdYF6
	0czsar5Va4q4vwyYTqrDT5DCLWxDHj3FmR9KhJ0nWlsP6mXbRsYLU+ulgV/LbsISXZSaNwdfEWd
	hH+g8mS8GWRRsqK5jFB4wJnegukK24hFkE15FO56zQpjtVuN1TRUyfKo3xm7oFBx8EbxIZrFpta
	kY3rlHq35Qfb2Zv2xd403kt8jE4zEzIPollgklGnwdynvE9z3Th3XNbpXDQfETjqptrWtSI+fQb
	US6rkKNaBv67xJyEuMDlA1CNCOuqjhBLhyk2lioHYsoUV1nodIo0Fx3qdihY55Ny+5apcIZxgUg
	6XgcYQ8M5sRrchUJR6CX2Ky3o/RoPQMhBTainfw2RPXy02fYBnyE60KMi4bNsJzwpPBUQSqV5Ch
	15h9t7FFPIFgF0k=
X-Received: by 2002:a05:6830:6686:b0:7f4:edd8:b7eb with SMTP id 46e09a7af769-81780d976d8mr11093358a34.6.1790477243868;
        Sat, 26 Sep 2026 19:47:23 -0700 (PDT)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-818e33f6714sm6626099a34.0.2026.09.26.19.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:47:23 -0700 (PDT)
Date: Sat, 26 Sep 2026 21:47:17 -0500
From: Ming Lei <tom.leiming@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, tglx@kernel.org, mingo@redhat.com,
	peterz@infradead.org
Subject: Re: [RFC PATCH 00/15] io_uring: thread identity handoff for blocking
 inline issue
Message-ID: <ariDteQPQ7BGtZZW@fedora-laptop>
References: <20260911154148.644489-1-axboe@kernel.dk>
 <arfs_kX_gkH1o_S-@fedora-laptop>
 <0367c089-a2da-42ad-ae9f-fc61dd220d1a@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0367c089-a2da-42ad-ae9f-fc61dd220d1a@kernel.dk>

On Sat, Sep 26, 2026 at 04:06:02PM -0600, Jens Axboe wrote:
> On 9/26/26 10:04 AM, Ming Lei wrote:
> > On Fri, Sep 11, 2026 at 09:40:50AM -0600, Jens Axboe wrote:
> >> Hi,
> >>
> > 
> > ...
> > 
> >>
> >> This is obviously an RFC, in terms of what I'd love people to take a
> >> closer look at:
> >>
> >> - The scheduler hook and the identity move itself, kernel/thread_handoff.c.
> >>   Is the set of refused states complete enough, and is moving
> >>   thread group leadership this way (the leader must stay first on
> >>   ->thread_head, like de_thread() keeps it) acceptable / kosher.
> >> - The x86 and arm64 register state handling. x86 refuses AMX users,
> >>   and arm64 refuses SME.
> >> - Whether anyone relies on a task's user identity staying on one
> >>   task_struct in ways not covered above in the series.
> > 
> > This way may break ublk server given 'task_struct *' can be changed
> > because the server issues blocking OP(fallocate, ...), then the
> > `current` check in ublk_dispatch_req() can be hit.
> 
> Yep, which is why is isn't enabled there.

If you mean .blockable isn't set for IORING_OP_URING_CMD, it can't avoid
this issue, because io->task crosses IORING_OP_URING_CMD, and one
io-uring(fallocate) changes ublk server's `task_struct *`. It can be
solved in ublk driver by storing and checking tid.

The usage is similar with prctl(PR_IO_FLUSHER).

> Known gaps are LSM state kept in the task rather than the cred, and
> PR_SET_IO_FLUSHER. Neither moves, and not moving them can only ever
> restrict.

A spare forked before PR_SET_IO_FLUSHER lacks the flags, so the user
thread loses them after the handoff, for good, since later spares are
forked from the new task.

> 
> > Also there is risk in 'task_struct *' keyed bpf task storage.
> > 
> > task_work queuing could become tricky too.
> 
> Like the above, the series does attempt to handle that.

I meant kernel tw uses instead of io-uring's, one example:

With CLOSE + FSYNC in one io_uring_enter(), the CLOSE isn't blocked and its
CQE is posted before the syscall returns, but ____fput stays queued on the old
submitter until the FSYNC completes because of handoff, so the app still sees
the file open.


Thanks,
Ming
