Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83069C433EF
	for <io-uring@archiver.kernel.org>; Sat, 25 Jun 2022 13:08:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232991AbiFYNIl (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Sat, 25 Jun 2022 09:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231982AbiFYNIj (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Sat, 25 Jun 2022 09:08:39 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E99417055
        for <io-uring@vger.kernel.org>; Sat, 25 Jun 2022 06:08:38 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d5so4355570plo.12
        for <io-uring@vger.kernel.org>; Sat, 25 Jun 2022 06:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=Z2ZHkV3/rPGgsPPcyIbZ7eWciDf2eSXp5gzthvQFdcM=;
        b=X+fgIrqV9lJAHUn31QAtM7sGBFY2yCytGaYPPvMQjWzEvNU9Uu53LOYH+bn1QQ6FUQ
         DthCCScoi3u2JvYQCLZBbeqiqQ3UHGc2HOUbos9wDixOf7O71uaWCeP1Li9eE1GqIalc
         psD/E2+YeYfAvMlv5xaHKiuZzGghYVmapfePG1YkLNUsHaN2IHWHe87MOGG1oMYjvLIO
         svXk6DHFS/eXItbRbDoRMXuQsV+BYsE+pSamAKzv3Rw/kkU5aP1wHcPWqTVAthUHXXfs
         bvOosryPRx0yBxFsi3EqBNX2EA1V15HD1DGUHFRVGI7zs7zBMWJfMD6dvxHQHNYIeQ6l
         bWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Z2ZHkV3/rPGgsPPcyIbZ7eWciDf2eSXp5gzthvQFdcM=;
        b=nrHdRqbgFqvBZXnqCy6Io4w+fiDoTTHQzZYrs/Lgdvtxe14WNZ24L6dYTpwmXJO7l4
         hYYh58HDmCoDBDQ6PX52xijii44KYwVDUIXWGkQpKjB6+vqDgV58sSvBNcCs7FUrQbph
         1QbFa5JFAaoz0hk8PufuKArlWosRIOe27cimf4op7qVdXKxQ+BmF5R5cA8dRv+rWnTNn
         j2EgUTOw/W8irnD5YvYXepREdew3a22ir94DGB0i+9kzWorzJd7wG02A49Qv5JonhQe6
         sITqZkNR8eVqQlmuECite8+RFgmXMyak0IMxHG0z1Ed2WuquYUHFis2plsxn7+jmYg4t
         5qQQ==
X-Gm-Message-State: AJIora+rDK78Ob5OiVvJdxxPRzllXb1LeQMl8wBCCkDlqVkMSTbZrIUC
        rDHofaRBgMZ7P370KTSnprfD2w==
X-Google-Smtp-Source: AGRyM1sAE4/Pwi73gzJCP98UbFHJ/P959eL3gqUFfkxCsQB++trVRlEETBiLwz75ArIQPTRv1EaEnQ==
X-Received: by 2002:a17:90b:4b8f:b0:1ec:e852:22c7 with SMTP id lr15-20020a17090b4b8f00b001ece85222c7mr4493466pjb.38.1656162517653;
        Sat, 25 Jun 2022 06:08:37 -0700 (PDT)
Received: from [192.168.1.100] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id q21-20020aa79835000000b0051844a64d3dsm3625743pfl.25.2022.06.25.06.08.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jun 2022 06:08:37 -0700 (PDT)
Message-ID: <91ee50d5-60e8-39e9-604f-bc6aed6f18a6@kernel.dk>
Date:   Sat, 25 Jun 2022 07:08:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH for-next] io_uring: let to set a range for file slot
 allocation
Content-Language: en-US
To:     Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org
References: <66ab0394e436f38437cf7c44676e1920d09687ad.1656154403.git.asml.silence@gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <66ab0394e436f38437cf7c44676e1920d09687ad.1656154403.git.asml.silence@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

On 6/25/22 4:55 AM, Pavel Begunkov wrote:
> From recently io_uring provides an option to allocate a file index for
> operation registering fixed files. However, it's utterly unusable with
> mixed approaches when for a part of files the userspace knows better
> where to place it, as it may race and users don't have any sane way to
> pick a slot and hoping it will not be taken.
> 
> Let the userspace to register a range of fixed file slots in which the
> auto-allocation happens. The use case is splittting the fixed table in
> two parts, where on of them is used for auto-allocation and another for
> slot-specified operations.

This looks pretty straight forward, and a useful addition to be able to
mix and match app and ring managed direct descriptors. I'll let others
comment on it first.

-- 
Jens Axboe

