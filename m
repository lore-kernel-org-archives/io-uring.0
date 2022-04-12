Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB8CC433EF
	for <io-uring@archiver.kernel.org>; Tue, 12 Apr 2022 14:39:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245273AbiDLOmN (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Tue, 12 Apr 2022 10:42:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234174AbiDLOmM (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Tue, 12 Apr 2022 10:42:12 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B243A10FC8
        for <io-uring@vger.kernel.org>; Tue, 12 Apr 2022 07:39:54 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id t12so4595121pll.7
        for <io-uring@vger.kernel.org>; Tue, 12 Apr 2022 07:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:in-reply-to:references:subject:message-id:date:mime-version
         :content-transfer-encoding;
        bh=1WO8XVacwQEyrO6yN2KmaZIXCUAZrFx47C0hWqfdjKM=;
        b=dCaYOcUpf6j2XNUFOPK/jsgkvxiKEHbZ9U8oE7odyTzbIE8bm7BA6JV9unP8uvPWRU
         vMwUBXtTqZCtj/iOJrKsAOBBDe6m+EfBDB3Nc1I9c9cc0f3avjVNT7IEHohUoRKeH+Bi
         +Z8YmQGRSM24xFZVDBzYVqm/Kc4OXFNWASynkt8zECEFI2DM/CU6akDAw4jwcuCTO8i1
         IbljgltVvCpwqudN6Pr0HXcDxZ8RESvABcC4YHQNs4MLzvWWfIKsjqiJxboqoVskeo17
         yP/hkmyACAECHHC0RbvPx/uFqp4Vy2iCdfCqILkuBa43lk14xqPGfFAnXxGJuQXVzUKq
         Lc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=1WO8XVacwQEyrO6yN2KmaZIXCUAZrFx47C0hWqfdjKM=;
        b=os+D+Al6I+WeGLUqdOgc7l5RZnWOmQR2fM16+14yFlQq4sappkWTuaWpx0/DHxl/kn
         erVcdzu7dfKHyz6U9FABdpfexD1zq3tkL074oNh8xxwB8ZB+NspfitAgYS18+qvTEpPw
         aZhSLAnZs/H3WSNvOPrdA2/qujPUUHLo18vyxe3ns2vz29E5Z2vAEeDf3mGUctYypVCD
         +mtJA5B7i1AhxuSlPwbrHKLzcKBs383nAI8Kl3BC9HXI6+O5GeoFLUKoRM1UC5flh4vI
         3sAlolRkluqofbGHKdqp2As1hKiOyr4AkGcVZc/o6HpbSCf/1CEiPuXdeJMULh2b9cM/
         mq7w==
X-Gm-Message-State: AOAM533bpFzyaxZoy6FzcDdNtoL9zjyxIBRTCVzGY2T2EG4wx31A43lE
        jvriEcso2PV81HHc0ymON8Ob6sQeXw9xI62g
X-Google-Smtp-Source: ABdhPJzEiOcFLrjpwvwzK8YHYCMw1fHSouNqpmQWGjfFoa3JYvbw5+M9aBS+hGNHH3sbmnYgdUbCFg==
X-Received: by 2002:a17:903:1251:b0:156:9d8e:1077 with SMTP id u17-20020a170903125100b001569d8e1077mr37251498plh.116.1649774393999;
        Tue, 12 Apr 2022 07:39:53 -0700 (PDT)
Received: from [127.0.1.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id w2-20020a056a0014c200b00505cd237193sm6778328pfu.218.2022.04.12.07.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 07:39:53 -0700 (PDT)
From:   Jens Axboe <axboe@kernel.dk>
To:     asml.silence@gmail.com, io-uring@vger.kernel.org
In-Reply-To: <0d9b9f37841645518503f6a207e509d14a286aba.1649773463.git.asml.silence@gmail.com>
References: <0d9b9f37841645518503f6a207e509d14a286aba.1649773463.git.asml.silence@gmail.com>
Subject: Re: [PATCH 1/1] io_uring: fix assign file locking issues
Message-Id: <164977439318.31918.13119052065490090284.b4-ty@kernel.dk>
Date:   Tue, 12 Apr 2022 08:39:53 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

On Tue, 12 Apr 2022 15:24:43 +0100, Pavel Begunkov wrote:
> io-wq work cancellation path can't take uring_lock as how it's done on
> file assignment, we have to handle IO_WQ_WORK_CANCEL first, this fixes
> encountered hangs.
> 
> 

Applied, thanks!

[1/1] io_uring: fix assign file locking issues
      commit: 0f8da75b51ac863b9435368bd50691718cc454b0

Best regards,
-- 
Jens Axboe


