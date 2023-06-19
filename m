Return-Path: <io-uring-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912AAEB64DA
	for <io-uring@archiver.kernel.org>; Mon, 19 Jun 2023 13:07:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231906AbjFSNHN (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Mon, 19 Jun 2023 09:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231276AbjFSNG5 (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Mon, 19 Jun 2023 09:06:57 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 966411FE6
        for <io-uring@vger.kernel.org>; Mon, 19 Jun 2023 06:05:31 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1b3c5631476so4578695ad.1
        for <io-uring@vger.kernel.org>; Mon, 19 Jun 2023 06:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1687179931; x=1689771931;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7S7/lyYC9wnPoB33TSq2jB+Gh+dXyyiQgK8PP31iH80=;
        b=ttf5OXcdkjHfrlJ1a7TKM4/73BqwwlynZLQyAfOkXBrVzsNhOM0kHEpPqAuMHAlg/I
         DDANOdfVN8R+uybsM2K+BelZiH8tZKnUuprqFRQwo1JN/iarqfqRiRBSNntgoRN4SRfM
         pwcN0BP7N8+vN0FD55pSd/vNBnWAWq2v0LRzrsWy7VvHmzZ7hl224MUEztdxDs2zIGuA
         i7GrbYgVRMbMlPmKiwfJqUckwbGutceuZyGZnaDOxvWivd2UO6tWUcnkcuXELymXYWjS
         SCdt7g1qzvDkwgsamGpbZ48zGcNYO0VsU1YrZ7YGs5xNS+srHHHdvgf+11EWDLfVD4r3
         1Tog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687179931; x=1689771931;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7S7/lyYC9wnPoB33TSq2jB+Gh+dXyyiQgK8PP31iH80=;
        b=KbqI8V09mY/gqdcgQaInCfVwN3ci09aHPL82Dq8Zs5M0a6vpu93Ns8ztJBtNM7E4uQ
         mIBnC/uh8fOzCcp2CXfLXtVGij1dhYZcN0eXcCf/mfdStNdxRrA168J8tlWb3V1QI/NJ
         UygIjySi9jabx+kalZnvcstTo9Xieqm6q+p8gGMXOgUUkbZMR/kwM8PH8bBs99ODjFnO
         K9BEinJcA9Vanu6uf7X51Opp5Eytlv+DA9wek3GYR51GDG9JOfAhUEq6L3edmSPOr3aN
         /bNGmGbo9YH14LMBCAM+e4qUZsdteq3CKsIhiwp3xmzVGMdV/JqZJhn5j1fiDysPhgGz
         NRHg==
X-Gm-Message-State: AC+VfDxmnFyHN3UCC9ed6s6O8HgvTEWC/wihTlDpR8h7D8hGLo6ukIzr
        h7unfRFg8AFWW3ly9ZC6HrC/8g==
X-Google-Smtp-Source: ACHHUZ6SQRlDCvayxTxESl5d8TLxeZr+8E22MWmhLyZJyddlbdOqpAcdaYZZoP3wzn4fcoBVk3WY2A==
X-Received: by 2002:a17:902:ea01:b0:1a9:6467:aa8d with SMTP id s1-20020a170902ea0100b001a96467aa8dmr11966299plg.1.1687179930758;
        Mon, 19 Jun 2023 06:05:30 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902db0900b001b3cac25f82sm14566021plx.139.2023.06.19.06.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 06:05:30 -0700 (PDT)
Message-ID: <0c248b20-7fd5-a251-e8ac-8d955623d910@kernel.dk>
Date:   Mon, 19 Jun 2023 07:05:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [GIT PULL] io_uring fixes for 6.4-rc7
Content-Language: en-US
To:     Stefan Metzmacher <metze@samba.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     io-uring <io-uring@vger.kernel.org>
References: <d2d1c92b-e682-9fbb-120b-23a8726c142d@kernel.dk>
 <370541a6-1c63-6cba-83b0-246b0236eff3@samba.org>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <370541a6-1c63-6cba-83b0-246b0236eff3@samba.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

On 6/19/23 6:04 AM, Stefan Metzmacher wrote:
> Hi Jens,
> 
>> A fix for sendmsg with CMSG, and the followup fix discussed for avoiding
>> touching task->worker_private after the worker has started exiting.
>>
>> Please pull!
>>
>>
>> The following changes since commit b6dad5178ceaf23f369c3711062ce1f2afc33644:
>>
>>    Merge tag 'nios2_fix_v6.4' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux (2023-06-13 17:00:33 -0700)
>>
>> are available in the Git repository at:
>>
>>    git://git.kernel.dk/linux.git tags/io_uring-6.4-2023-06-15
>>
>> for you to fetch changes up to adeaa3f290ecf7f6a6a5c53219a4686cbdff5fbd:
>>
>>    io_uring/io-wq: clear current->worker_private on exit (2023-06-14 12:54:55 -0600)
>>
>> ----------------------------------------------------------------
>> io_uring-6.4-2023-06-15
>>
>> ----------------------------------------------------------------
>> Jens Axboe (2):
>>        io_uring/net: save msghdr->msg_control for retries
> 
> Can you please have a look at
> https://lore.kernel.org/io-uring/b104c37a-a605-e3c8-67ab-45f27e158e21@samba.org/
> Before this goes into stable releases...

Done, I'll prep a patch fixing the WAITALL case.

-- 
Jens Axboe


