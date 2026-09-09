Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E572525DB0D
	for <io-uring@vger.kernel.org>; Wed,  9 Sep 2026 01:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788916602; cv=none; b=FtXdZ3JKyXyNgFd1dLKp6ZA2odY/iii6+Nq9OMKJfmuSVxi0FsxqoKf+zftk/R84wMG1YdGCz30GB1lAJrHCs3lG8m4Gu73im0AsEvppG+QT+fBR0FU1xam7xCoHuZA+TPh54oh76VqthPc37KfZPh8itmfbEzISMOBmviJslyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788916602; c=relaxed/simple;
	bh=5/Un1IxFAdJByas32cSABPNnaMvt9aSfdfZ2C0N9xLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZFCyZl9D4gVpARxxa7lfw05JR1IkGkYY6ABGPZw1sTBfCBY1Wiw967SfplBl0Rugr3jcGu8Bzz8zs8+gk4q9Aveu5MWjjj49vHITg1o7RLenls2/lE5+jN3eMh7+sP5lw8L1PxqXyWsrdH0pPL8MGAghfRDfgI/3XhAqKHtKFHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=QBOW2RXc; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="QBOW2RXc"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4b37a30eae7so465128b6e.3
        for <io-uring@vger.kernel.org>; Tue, 08 Sep 2026 18:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1788916600; x=1789521400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hmw9mHUujeHSHQsiGBgyx28Z2MxCV5kUwvQrLiZ0yQ8=;
        b=QBOW2RXcNAJqQkato3nghKBmpkRO3iKfIMrjSTWjPJQIpwsW9ArBfj1OrxbNmMAkBb
         Ee/BXADmE7xOoJ8DZGA3kJRP9BF4kQ1Yhhu6E+FpJoigk5RW3Fzf575oeBebpIT/abmD
         PvqUAfsjVFhccfxucaDKBK+G9YaRU8SMoJSEB/1iviMYY8pCz7Mu6//V7r0rGYlVmrjh
         VEIVzHXD0mCq6EsnfV+OWCY7mMcVECl85OZpsmP6dsGtekTftrAhoh4nC/J59sC+Lqwm
         c1yU8zyj9HJuibMPCUSQUperhg+2r+2sOaRXh0gUPcFjExx/K8+0Sl1DnB8HVY4TZ1QK
         a1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788916600; x=1789521400;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hmw9mHUujeHSHQsiGBgyx28Z2MxCV5kUwvQrLiZ0yQ8=;
        b=sJNb1XU5+/qsABFNcIwfjf2VkmLI6/+w1VXB1TXjJjqVSiMR89wxEIMIt9bkHPY5/v
         c4YTxzeNFnpMdObRtddFYR9myHG+ZoVihOdpDQ0/oa9fKz75uuBz2ZxL0woyRHluteUW
         zBTh0r4cl2weqbTFss9T62vs4cdCiEezSnfqn/Zzf36EDEZ9dlUtJjg8vMHEN7vF9SJz
         HTGhSnp/KClAOzWl0Ncc48JC9YtdVq6vDqnE8aL4RJEMWTK/ovxpvbsNGDkLp+53IcXp
         Muilnn26j2MMOeIEnE1sKMUMatWJUvhqkV/mAdDKZ2EuZQoLGqQqyxj9TSvjU8x+aNL2
         kgEw==
X-Forwarded-Encrypted: i=1; AKwUvBzBPsJgW3FMdh/SOpD1tFycOIgSZvcSHQcYaugbMyAasTsyPjRH+tL/ASbHBEhzKE1rrKikGttTJQ==@vger.kernel.org
X-Gm-Message-State: AFuF++meD8GF8FbzQgDY69g1ZAYfy9xsOt01NfFvSZ1P1k2BVy71LF8y
	33dC+mnU9Ivv4JtrR/pma5yGkgmCGsXFpSPKs0llQI9Ll2wsa3I6FjznLYJp4PWufnc=
X-Gm-Gg: AYBFou1liuKK7/AsyEo5JFDt2SvOFs099m5FTeCEVMrPdFbIxDG+cCKq75GBIDoAByb
	lXpMNSxL3Rt7d1EQA+sjO6LQVqvguKroKMldU1Htl8Q00oF3vaFrH9mXyAKbYlNAagl1ZtFRaCB
	5Jd6/hHubXmXry3FA/Pv70PEs3nOrvdVgQSfDMJQz81MRWtDPkiw+VW0LcXzrBMPxEg1eRWBvEP
	LduYs42xB50loTv9B9N45rSSmqPUXGJ0YzoElWn4uFpMEm7QcwmSEJPdlVAKITpzC4gEbxpeipE
	UFqsgduEgV2xllhD7DFg0uYWTGUhebg/q+OBpI6bNQpEeR2A6Xpak5n8+VAbvRUZgJLpx/btZLE
	LOCIFntKkfoAdGojG39raFvE87j53Yp1Uscd629xCZtiya0sK3GuAuitjrH44AHOGJjg5uq7OkR
	WneePMJ9TDhjcA+OhG56l3Im7cFpXPY+4c2iZqub91R+vZad2hVogbp4UefzGoff2fvKJzmqbY7
	CA/1J/YxbC+TBO62U1Shdt6IvUPzOqjCm0tmktYjbz4H9Sk+vIOx0xNPQ==
X-Received: by 2002:a05:6808:199b:b0:4b3:7a14:6b25 with SMTP id 5614622812f47-4c0250d649emr3573933b6e.14.1788916599799;
        Tue, 08 Sep 2026 18:16:39 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971675a96sm15488974b6e.11.2026.09.08.18.16.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 18:16:38 -0700 (PDT)
Message-ID: <c21acbbb-6558-48d4-9379-c1a952acf1e4@kernel.dk>
Date: Tue, 8 Sep 2026 19:16:37 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] io_uring/cmd: split io_uring_cmd_set_res() from
 io_uring_cmd_done()
To: Caleb Sander Mateos <csander@purestorage.com>,
 Ming Lei <tom.leiming@gmail.com>
Cc: Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Joanne Koong <joannelkoong@gmail.com>,
 linux-nvme@lists.infradead.org, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260902225708.2379840-1-csander@purestorage.com>
 <20260902225708.2379840-2-csander@purestorage.com>
 <CACVXFVOKGOEmefHmZpsBX-7uxGjzbaJiueYMvka8TDjccOuFjg@mail.gmail.com>
 <CADUfDZqFLMS08wq0bJWQwKpJL5k9ty1bruVFQFcV6juFVB-9AQ@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CADUfDZqFLMS08wq0bJWQwKpJL5k9ty1bruVFQFcV6juFVB-9AQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/3/26 11:34 AM, Caleb Sander Mateos wrote:
> On Wed, Sep 2, 2026 at 6:02?PM Ming Lei <tom.leiming@gmail.com> wrote:
>>
>> On Wed, Sep 2, 2026 at 6:05?PM Caleb Sander Mateos
>> <csander@purestorage.com> wrote:
>>>
>>> In preparation for setting the io_uring NVMe passthru CQE results from
>>> the blk-mq request completion rather than the task work callback, split
>>> out functions io_uring_cmd_set_res{,32}() from __io_uring_cmd_done().
>>> io_uring_cmd_done{,32}() now call io_uring_cmd_set_res{,32}() and then
>>> __io_uring_cmd_done(). This allows __io_uring_cmd_done() to be made
>>> CQE-size-agnostic, with 3 fewer arguments.
>>>
>>> Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
>>> ---
>>>  include/linux/io_uring/cmd.h | 23 +++++++++++++++++------
>>>  io_uring/uring_cmd.c         | 33 ++++++++++++++++++---------------
>>>  2 files changed, 35 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/include/linux/io_uring/cmd.h b/include/linux/io_uring/cmd.h
>>> index 331dcbefe72f..67f2ef700c43 100644
>>> --- a/include/linux/io_uring/cmd.h
>>> +++ b/include/linux/io_uring/cmd.h
>>> @@ -50,19 +50,21 @@ int io_uring_cmd_import_fixed_vec(struct io_uring_cmd *ioucmd,
>>>                                   const struct iovec __user *uvec,
>>>                                   size_t uvec_segs,
>>>                                   int ddir, struct iov_iter *iter,
>>>                                   unsigned issue_flags);
>>>
>>> +void io_uring_cmd_set_res(struct io_uring_cmd *, s32 ret);
>>> +void io_uring_cmd_set_res32(struct io_uring_cmd *, s32 ret, u64 res2);
>>> +
>>>  /*
>>>   * Completes the request, i.e. posts an io_uring CQE and deallocates @ioucmd
>>>   * and the corresponding io_uring request.
>>>   *
>>>   * Note: the caller should never hard code @issue_flags and is only allowed
>>>   * to pass the mask provided by the core io_uring code.
>>>   */
>>> -void __io_uring_cmd_done(struct io_uring_cmd *cmd, s32 ret, u64 res2,
>>> -                        unsigned issue_flags, bool is_cqe32);
>>> +void __io_uring_cmd_done(struct io_uring_cmd *, unsigned issue_flags);
>>>
>>>  void __io_uring_cmd_do_in_task(struct io_uring_cmd *ioucmd,
>>>                             io_req_tw_func_t task_work_cb,
>>>                             unsigned flags);
>>>
>>> @@ -105,12 +107,19 @@ static inline int io_uring_cmd_import_fixed_vec(struct io_uring_cmd *ioucmd,
>>>                                                 int ddir, struct iov_iter *iter,
>>>                                                 unsigned issue_flags)
>>>  {
>>>         return -EOPNOTSUPP;
>>>  }
>>> -static inline void __io_uring_cmd_done(struct io_uring_cmd *cmd, s32 ret,
>>> -               u64 ret2, unsigned issue_flags, bool is_cqe32)
>>> +static inline void io_uring_cmd_set_res(struct io_uring_cmd *cmd, s32 ret)
>>> +{
>>> +}
>>> +static inline void io_uring_cmd_set_res32(struct io_uring_cmd *cmd, s32 ret,
>>> +                                         u64 res2)
>>> +{
>>> +}
>>> +static inline void __io_uring_cmd_done(struct io_uring_cmd *cmd,
>>> +                                      unsigned issue_flags)
>>>  {
>>>  }
>>>  static inline void __io_uring_cmd_do_in_task(struct io_uring_cmd *ioucmd,
>>>                             io_req_tw_func_t task_work_cb, unsigned flags)
>>>  {
>>> @@ -171,17 +180,19 @@ static inline void *io_uring_cmd_ctx_handle(struct io_uring_cmd *cmd)
>>>  }
>>>
>>>  static inline void io_uring_cmd_done(struct io_uring_cmd *ioucmd, s32 ret,
>>>                                      unsigned issue_flags)
>>>  {
>>> -       return __io_uring_cmd_done(ioucmd, ret, 0, issue_flags, false);
>>> +       io_uring_cmd_set_res(ioucmd, ret);
>>> +       __io_uring_cmd_done(ioucmd, issue_flags);
>>>  }
>>>
>>>  static inline void io_uring_cmd_done32(struct io_uring_cmd *ioucmd, s32 ret,
>>>                                        u64 res2, unsigned issue_flags)
>>>  {
>>> -       return __io_uring_cmd_done(ioucmd, ret, res2, issue_flags, true);
>>> +       io_uring_cmd_set_res32(ioucmd, ret, res2);
>>> +       __io_uring_cmd_done(ioucmd, issue_flags);
>>>  }
>>>
>>>  int io_buffer_register_bvec(struct io_uring_cmd *cmd, struct request *rq,
>>>                             void (*release)(void *), unsigned int index,
>>>                             unsigned int issue_flags);
>>> diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
>>> index 726a659f38c3..917b32a921e6 100644
>>> --- a/io_uring/uring_cmd.c
>>> +++ b/io_uring/uring_cmd.c
>>> @@ -136,40 +136,43 @@ void __io_uring_cmd_do_in_task(struct io_uring_cmd *ioucmd,
>>>         req->io_task_work.func = task_work_cb;
>>>         __io_req_task_work_add(req, flags);
>>>  }
>>>  EXPORT_SYMBOL_GPL(__io_uring_cmd_do_in_task);
>>>
>>> -static inline void io_req_set_cqe32_extra(struct io_kiocb *req,
>>> -                                         u64 extra1, u64 extra2)
>>> +void io_uring_cmd_set_res(struct io_uring_cmd *cmd, s32 ret)
>>>  {
>>> -       req->big_cqe.extra1 = extra1;
>>> -       req->big_cqe.extra2 = extra2;
>>> +       struct io_kiocb *req = cmd_to_io_kiocb(cmd);
>>> +
>>> +       if (ret < 0)
>>> +               req_set_fail(req);
>>> +       io_req_set_res(req, ret, 0);
>>>  }
>>> +EXPORT_SYMBOL_GPL(io_uring_cmd_set_res);
>>> +
>>> +void io_uring_cmd_set_res32(struct io_uring_cmd *cmd, s32 ret, u64 res2)
>>> +{
>>> +       struct io_kiocb *req = cmd_to_io_kiocb(cmd);
>>> +
>>> +       if (ret < 0)
>>> +               req_set_fail(req);
>>> +       io_req_set_res32(req, ret, 0, res2, 0);
>>> +}
>>> +EXPORT_SYMBOL_GPL(io_uring_cmd_set_res32);
>>
>> Both the two helpers can be inline, can't they?
> 
> I also wanted to do that, but req_set_*() are defined in
> io_uring/io_uring.h, an io_uring-private header, whereas
> include/linux/io_uring/cmd.h is a public header. Perhaps the inline
> functions could be moved to include/linux/io_uring_types.h or
> include/linux/io_uring.h. If not, I think we'll have to rely on LTO to
> inline these calls. I'd be curious to hear Jens's thoughts.

Let's just move them to io_uring.h instead.

-- 
Jens Axboe
