Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978F8C433F5
	for <io-uring@archiver.kernel.org>; Wed, 25 May 2022 11:37:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237348AbiEYLh4 (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Wed, 25 May 2022 07:37:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232506AbiEYLhz (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Wed, 25 May 2022 07:37:55 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FF9A9EB5F
        for <io-uring@vger.kernel.org>; Wed, 25 May 2022 04:37:54 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id n8so18332739plh.1
        for <io-uring@vger.kernel.org>; Wed, 25 May 2022 04:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=h7GQWKwKz0wGAe1N3tFIztIJ46eFV4zbsB1fU2eRxP4=;
        b=J4VSi6vpJAy7tPHcXH7tWFqEhM0dyN9m5DD4RKM/OFnR4nN3YpYdD593PlnAV7MIJ/
         VgIEDGGRzUm+yaeDMi1Mj8+GSZrDO4dQavnLNZwGQVfMpBqUqz0kA70tyKVvHh2cj3SH
         ujotcThM06qCdsj9v8YKO4yHzoJPlgEc5wUzXcjhz4uLwhB+xDjvUEr4F/vcSupCB7x/
         s+T+nHBW+cOoEOzfe7yeNNiu1XFC8XKPq+R9jtjIohc4ny1uU/aPBLaGremzWYzmsDD8
         wXJ8qsaWopEReAKXaC0FYyLLlBhCyZAffTDF8vb14IMnDeOnidATk57mX5zP/1JuxRBk
         QcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=h7GQWKwKz0wGAe1N3tFIztIJ46eFV4zbsB1fU2eRxP4=;
        b=6PGEtHKqBY+kJKyF2QZ1teHj3hQBROYFgGxVvRMz0X1UYlEGdcMH3id6hzNm7T0kWX
         9htHbLjVghK4e84pYQcy1NCFxu9A3gSN9fBoQCLTDKJMsCCmiEDVqB4LMjdf0hRG3KWG
         YGEZ05UiTTyrd1RmnLswqv33kHdlGH+mI3CK78pg5yOMkogVdBWKT71zuesQF9OOEVh6
         PyZqmQTIUygKYc7dSsV/TmT+2MrWXoox/UYrNd5qtsjtNjF7/RaLv1k2sO7zHV+TifVS
         9QYJ/61g4Rx9qnVmMXkuK72pl6u+ywZAyqak23tb6fVFzGot6uYNAlzjUaJ3rEdXBjek
         gB+g==
X-Gm-Message-State: AOAM533kHNcn40LleOOWo/Umo93W5QFpX5zcEIiDpVRywfT01APCwLxA
        PiLF5rMhEbQPNQKkuobtUi9aB0onwCpJgg==
X-Google-Smtp-Source: ABdhPJyxnE6OE0uHLVF6nA3rQ0LB9R15IQHhjwVSm0UkQm2V/a5b0wswhZcrtUHrrLxwfCQiAB/bxQ==
X-Received: by 2002:a17:902:8687:b0:161:f0ac:723a with SMTP id g7-20020a170902868700b00161f0ac723amr26031803plo.128.1653478673746;
        Wed, 25 May 2022 04:37:53 -0700 (PDT)
Received: from [192.168.1.100] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id n10-20020a056a00212a00b0050dc762816bsm11228643pfj.69.2022.05.25.04.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 04:37:53 -0700 (PDT)
Message-ID: <7af3347a-a89b-50bc-2fe7-50b5dffe11a9@kernel.dk>
Date:   Wed, 25 May 2022 05:37:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 3/6] io_uring: add io_op_defs 'def' pointer in req init
 and issue
Content-Language: en-US
To:     Kanchan Joshi <joshi.k@samsung.com>
Cc:     io-uring@vger.kernel.org
References: <20220524213727.409630-1-axboe@kernel.dk>
 <CGME20220524213742epcas5p19444ad9556b07159c8fca0512792ea48@epcas5p1.samsung.com>
 <20220524213727.409630-4-axboe@kernel.dk> <20220525064159.GD4491@test-zns>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20220525064159.GD4491@test-zns>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

On 5/25/22 12:41 AM, Kanchan Joshi wrote:
> On Tue, May 24, 2022 at 03:37:24PM -0600, Jens Axboe wrote:
>> Define and set it when appropriate, and use it consistently in the
>> function rather than using io_op_defs[opcode].
> 
> seems you skipped doing this inside io_alloc_async_data() because
> access is not that repetitive.

Right, and because it won't get impacted by abstracting out opcode
handlers.

-- 
Jens Axboe

