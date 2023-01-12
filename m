Return-Path: <io-uring-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89FA3C54EBD
	for <io-uring@archiver.kernel.org>; Thu, 12 Jan 2023 23:16:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232118AbjALXQT (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Thu, 12 Jan 2023 18:16:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbjALXQS (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Thu, 12 Jan 2023 18:16:18 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA2442F78E
        for <io-uring@vger.kernel.org>; Thu, 12 Jan 2023 15:16:16 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id 20so9521755pfu.13
        for <io-uring@vger.kernel.org>; Thu, 12 Jan 2023 15:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNj8hiHmYECMxQ7rDPxg/ql88u4zYVQ6jg68zWAoduU=;
        b=o3UKieOxKgyc/xo4BYmvsY+C9h/BeuIF3FvDvnUmJeSKP95tl/GoDTgKzbs6GiJH68
         M5HLJuFaLLMphfyZ987JQ5gmqdoeJrN7AvqDKQJAG9/QMHgxUWsCM5NQ09foDNiUrqCw
         HNem62CND1ThzJlmLlNLKWiub6wDOOTmQZ2mAGwM2RUDMPfcHZtQUvQYJhuz7ydFvuMh
         RWIqkeXHFzMulYXBXqgJVOhW5T2MaKeT3mnfaHhHIZpumeplsgBfqfrgYdWes2tozsKk
         zKaL9oG0WM/oJWUc2sTQZTCyXQ/s3g9ozBtNxPyjSm9La5tWL3dp+h2wtNrv9DxcnsWg
         ZjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNj8hiHmYECMxQ7rDPxg/ql88u4zYVQ6jg68zWAoduU=;
        b=kWyvJYHhgkfnpWqrEL6gsAGEENBMEFzAUho11AvRG6MMZzkS6lHEBi7dGCDgk0mpTG
         3k3Vr4UjmEi2Kyd566OyAXPFux8hUa0pxDQSKHGr7dr5RUD6cKCCGCCrCiTfK8JW0Lxs
         T8/MfeIt6e4/Lkgw/PUNksoTxK5NBkb4cPLmHCtn+hwj5cFTkC/yjj7lDhKHEYwOx3x1
         ALpAmAFiPOFLs0wvHvYGWNS+xBYESdU7d0mAeH3VkVfVA6ds/3pKsoWVLcM8ZjwdAtiO
         Vuy7swNQ8Z525Sm6NkxQkBHV0KoN/rNq98IHThzA3ipFm5RXQ69Q1re5btRao7J5Kx+y
         gwgg==
X-Gm-Message-State: AFqh2koX1/DxoiNYqpOu8Nt6tkcx8sn8gSf/tPNIqzd7LXCGjqExL56T
        lN1pZtI6P3TX3b/xHfNxQFgAzB+YHMi9uqcQ
X-Google-Smtp-Source: AMrXdXsU17qDRodGGHs2H+tRGx4RZMQiFUb57DEDPdbRG7LpDpfQBmmDbDcRfRuPA2EMe09PM3/8FA==
X-Received: by 2002:a62:1695:0:b0:57f:f570:128d with SMTP id 143-20020a621695000000b0057ff570128dmr19435910pfw.1.1673565376231;
        Thu, 12 Jan 2023 15:16:16 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id y127-20020a623285000000b0058abddad316sm5689607pfy.209.2023.01.12.15.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 15:16:15 -0800 (PST)
From:   Jens Axboe <axboe@kernel.dk>
To:     Ammar Faizi <ammarfaizi2@gnuweeb.org>
Cc:     Pavel Begunkov <asml.silence@gmail.com>,
        Breno Leitao <leitao@debian.org>,
        Christian Mazakas <christian.mazakas@gmail.com>,
        Gilang Fachrezy <gilang4321@gmail.com>,
        "io-uring Mailing List" <io-uring@vger.kernel.org>,
        VNLX Kernel Department <kernel@vnlx.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>,
        Jiahao XU <Jiahao_XU@outlook.com>,
        Gabriel Krisman Bertazi <krisman@suse.de>
In-Reply-To: <20230112203452.317648-1-ammar.faizi@intel.com>
References: <20230112203452.317648-1-ammar.faizi@intel.com>
Subject: Re: [PATCH liburing v1] man/io_uring_prep_splice.3: Fix
 description in io_uring_prep_splice() manpage
Message-Id: <167356537481.562725.4943790071828235420.b4-ty@kernel.dk>
Date:   Thu, 12 Jan 2023 16:16:14 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-78c63
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org


On Fri, 13 Jan 2023 03:34:52 +0700, Ammar Faizi wrote:
> Commit 55bbe5b71c7d missed a review from Gabriel. It was blindly copied
> from liburing.h comment with just a modification to support manpage
> formatting. Fix that.
> 
> While in there, also fix the liburing.h from which that mistake comes.
> 
> 
> [...]

Applied, thanks!

[1/1] man/io_uring_prep_splice.3: Fix description in io_uring_prep_splice() manpage
      commit: 0df8a379e929641699c2ab1f42de1efd2515b908

Best regards,
-- 
Jens Axboe



