Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B035DC433F5
	for <io-uring@archiver.kernel.org>; Fri, 25 Feb 2022 00:52:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236156AbiBYAwf (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Thu, 24 Feb 2022 19:52:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbiBYAwe (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Thu, 24 Feb 2022 19:52:34 -0500
Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 813746211C
        for <io-uring@vger.kernel.org>; Thu, 24 Feb 2022 16:52:03 -0800 (PST)
Received: from [192.168.88.87] (unknown [36.78.50.60])
        by gnuweeb.org (Postfix) with ESMTPSA id 235967E29A;
        Fri, 25 Feb 2022 00:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
        s=default; t=1645750322;
        bh=gCzpBm1Ve/XwJwjRRyy3IKdwe861sPfvD8OJseUeiQ0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ZK5W12LJhnTYyJc5isDeGBboVDgHyVrowlayiOq0Q3M9W3CX50cWQeoW9CXIIVzlz
         p3jZ5BfvmyZiKR/cDZutZdJMyRbWxTVRXdFnw2uyDYFbi+xwELzcYTec16FqbK+RsF
         ZXVhbbCgjUGVhwSyAd91b4NtDNGYK5bt3C8mABkIz2MuqhIcF1cwhb75KgGMIyX8CO
         C6T0uDUWnBcwxGIn2zwo5qMLTW/Zy8e8lfa6yRAyEClUoOJOl0M1843x03NspTl+SS
         hfqLn7C5wDgt7HzS8x06V5fi08Mh7bzHeJ2TL51/ry6od/ArE0Qq8FEOjCmwP6TE3Y
         W3Jsfj7GuaLJw==
Message-ID: <ef7d0e27-cdd1-7791-a55d-8bd08825b52b@gnuweeb.org>
Date:   Fri, 25 Feb 2022 07:51:49 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH liburing v1] queue, liburing.h: Avoid `io_uring_get_sqe()`
 code duplication
Content-Language: en-US
To:     Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>
Cc:     Jens Axboe <axboe@kernel.dk>, Nugra <richiisei@gmail.com>,
        GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
        Tea Inside Mailing List <timl@vger.teainside.org>,
        io-uring Mailing List <io-uring@vger.kernel.org>
References: <20220225002852.111521-1-ammarfaizi2@gnuweeb.org>
 <CAOG64qORUFkWjO3e6paDrG9NhykTvd+RCfwFgjADHjxn+N2rSA@mail.gmail.com>
From:   Ammar Faizi <ammarfaizi2@gnuweeb.org>
In-Reply-To: <CAOG64qORUFkWjO3e6paDrG9NhykTvd+RCfwFgjADHjxn+N2rSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

On 2/25/22 7:46 AM, Alviro Iskandar Setiawan wrote:
> On Fri, Feb 25, 2022 at 7:29 AM Ammar Faizi <ammarfaizi2@gnuweeb.org> wrote:
>>
>> Since commit 8be8af4afcb4909104c ("queue: provide io_uring_get_sqe()
>> symbol again"), we have the same defintion of `io_uring_get_sqe()` in
> 
> Typo
> /s/defintion/definition/
> 
> with that fixed
> 
> Reviewed-by: Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>
> 
>> queue.c and liburing.h.
>>
>> Make it simpler, maintain it in a single place, create a new static
>> inline function wrapper with name `_io_uring_get_sqe()`. Then tail
>> call both `io_uring_get_sqe()` functions to `_io_uring_get_sqe()`.
>>
> 
> Also, I tested this, the fpos test failed. Maybe it needs the recent
> kernel fixes? So I assume everything is fine.
> 
>    Tests timed out:  <rsrc_tags>
>    Tests failed:  <fpos>
> 
>    [viro@freezing ~/liburing]$ test/fpos
>    inconsistent reads, got 0s:8192 1s:6144
>    f_pos incorrect, expected 14336 have 7
>    failed read async=0 blocksize=7
> 
> Tested-by: Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>

Thanks for reviewing and testing. I will fix it and append those tags and
in the v2.

-- 
Ammar Faizi
