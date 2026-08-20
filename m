Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6810C39A07E
	for <io-uring@vger.kernel.org>; Thu, 20 Aug 2026 18:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787252203; cv=none; b=mm2Bw9tueiMtUxVWjujmnd6ihL7NB5gM0Q7RYzArePteU1R0ziCz+MrPBcfCuiZvQENeHy3kybJKmqDSUuTcfEvKXCCQo1fj9j5v0brGxlmWOvQpqOkvNbnEePD5KRVDewMpVR5xo+QEHO6Jp/gwPV3r1AzWoFm/uHCagXaHPp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787252203; c=relaxed/simple;
	bh=mesWg9i7Pr/sSuIGx5GPGHew6O9XxQdEW6+uh1a/PH4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=dTlrg/x7twHRbiNzlm5cmDTRx2jlVBsLhbJd82/AtUjYQoqrZS3++fftTBIHCRvnMUCJSGmoVICsaqMjD66CDCecPNeevfhuabmdHbOpFmHjJpSDvHDIZwOgps0WSKPNGKhwpRaqxoPDSFhZGezvFgZqXWjoIwJ6GKvo+p8nFE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b14a73cc32so223051eaf.1
        for <io-uring@vger.kernel.org>; Thu, 20 Aug 2026 11:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787252198; x=1787856998;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pBFqiBHmofgG+eXPLrOcoNQHRSu6BoQpnBJ5ylIeG0s=;
        b=YFZMbKYDEyrXblqf2wAKFjpVXbrCAwtHepxmDhkIYp+iW8czQAmjhruQwuQuA6QMJE
         q7lhDXVINfBAJ0xvY92UxQ9lFOxr2XC7iC8GApD8R8g57iaExK9epC9o396oEY13ef8E
         yccdlBoOMTJp1NTu8EhAzaSQHu62QK8HsQAWzXiS+xivzJp/hoxq8OHzRpDoOf4aSB2y
         qjUcTYWOBiLN+InDgcY8IGjWUjt/+yRzxhwXrSO+bPIU9RC4EMvs38Xe0AitK4+YSeS8
         JKyzkHELlUbT/sU2pCIaXTA49DRDHD3g94EMUZSxveWNPuklFVj9GlWeZwqtLlYih9GL
         6OWg==
X-Forwarded-Encrypted: i=1; AHgh+RrzY/zGQM6bv1/ZQbtPKVHrzK/0KGOKaw/ZQMNqw3jejlTpul9fx3S0QXIwbAmn58qVp4KSqLK0Gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YySTerL6eFaVK0RQkIYsWCucwAxb1FrOHSq/Llc+OxpdTtjEst1
	zraIze+CkOpe/gw+Rlp2CoB4YDEpvr1RKqDQHW2ho3y8ZfTF1R7lBF7Mxi+lTZr5xsXb3kWppEg
	euRUQvR0DN4IgjhSPdL0uhsLI/lnw6P8RsVe9JqSYpjMTCu5MBpZoXY2hblU=
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:3407:20b0:6b1:3417:548b with SMTP id
 006d021491bc7-6b1593f0db1mr694031eaf.24.1787252197854; Thu, 20 Aug 2026
 11:56:37 -0700 (PDT)
Date: Thu, 20 Aug 2026 11:56:37 -0700
In-Reply-To: <165bc4ff-ec69-4058-b6a2-3db02410ce58@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a874de5.ae6ddae5.3da009.001e.GAE@google.com>
Subject: Re: [RFC PATCH] io_uring/cmd: don't skip completion for a non-armed
 multishot uring_cmd
From: syzbot <syzbot+a4ccdd7ebf452e4d4701@syzkaller.appspotmail.com>
To: vasilisalmpanis@gmail.com
Cc: axboe@kernel.dk, io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ming.lei@redhat.com, vasilisalmpanis@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> Hi everyone,
>
> Just a gentle ping on this patch.
>
> The issue is syzbot-reproduced and the proposed fix has been run with 
> #syz test.

unknown command "test."

> The patch addresses the leak in the core |io_uring_cmd()|path rather than
> relying on individual providers to handle |IORING_URING_CMD_MULTISHOT|.
>
> Could someone take a look when you get a chance?
>
> Thanks,
> Vasileios
>
>
> On 8/11/26 10:42 PM, Vasileios Almpanis wrote:
>> io_uring_cmd() treats any uring_cmd carrying IORING_URING_CMD_MULTISHOT
>> that returns >= 0 as "multishot armed, completion deferred" and returns
>> IOU_ISSUE_SKIP_COMPLETE, expecting the provider to complete the request
>> later. But the flag is user-controlled and validated only against buffer
>> select, not against provider capability. A ->uring_cmd() handler that
>> does not implement multishot and returns a normal >= 0 result then has
>> its request skipped and never completed, leaking the io_kiocb and its
>> io_async_cmd:
>>
>>    BUG: memory leak
>>    unreferenced object (size 248):
>>      kmem_cache_alloc_bulk_noprof+0x272/0x3f0
>>      __io_alloc_req_refill+0x4a/0x150
>>      io_submit_sqes.cold+0x16e/0x20b
>>      __do_sys_io_uring_enter+0x56d/0xd60
>>
>> syzbot hit this via ublk UBLK_U_CMD_ADD_DEV, but it is kernel-wide: the
>> same leak reproduces with SOCKET_URING_OP_SIOCINQ on any socket fd, which
>> returns the queued byte count and never inspects cmd->flags. No in-tree
>> provider of multishot actually returns >= 0. Both io_cmd_poll_multishot()
>> and ublk_handle_batch_fetch_cmd return -EIOCBQUEUED,
>>
>> Only skip completion when the command is really multishot, i.e.
>> REQ_F_APOLL_MULTISHOT is set. Otherwise fall through and complete the
>> request normally with its result.
>>
>> Fixes: 620a50c92700 ("io_uring: uring_cmd: add multishot support")
>> Reported-by: syzbot+a4ccdd7ebf452e4d4701@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=a4ccdd7ebf452e4d4701
>> Tested-by: syzbot+a4ccdd7ebf452e4d4701@syzkaller.appspotmail.com
>> Signed-off-by: Vasileios Almpanis <vasilisalmpanis@gmail.com>
>> ---
>> Questions / Notes:
>> - I put this in the core io_uring_cmd() rather than in provider specific
>>    code because the leak is independent of the provider. From my research
>>    so far no ->uring_cmd() rejects IORING_URING_CMD_MULTISHOT, they just
>>    ignore it. The flag is only validated against buffer-select in
>>    io_uring_cmd_prep(). So any handler that returns a plain >= 0 result
>>    with the user-set flag leaks.
>> - Instead of checking if it has been really armed should we just drop
>>    the >= 0 check? The in-tree code that supports multishot returns
>>    -EIOCBQUEUED from what I have seen so far.
>> ---
>>   io_uring/uring_cmd.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
>> index c14c22cff49e..a2899a852879 100644
>> --- a/io_uring/uring_cmd.c
>> +++ b/io_uring/uring_cmd.c
>> @@ -269,7 +269,8 @@ int io_uring_cmd(struct io_kiocb *req, unsigned int issue_flags)
>>   	}
>>   
>>   	ret = file->f_op->uring_cmd(ioucmd, issue_flags);
>> -	if (ioucmd->flags & IORING_URING_CMD_MULTISHOT) {
>> +	if ((ioucmd->flags & IORING_URING_CMD_MULTISHOT) &&
>> +	    (req->flags & REQ_F_APOLL_MULTISHOT)) {
>>   		if (ret >= 0)
>>   			return IOU_ISSUE_SKIP_COMPLETE;
>>   	}
>>
>> ---
>> base-commit: d58772d8520c7ef247c4b95c9bd76d3a25da9ff5
>> change-id: 20260811-io_uring-169337c74617
>>
>> Best regards,
>> --
>> Vasileios Almpanis <vasilisalmpanis@gmail.com>
>>
