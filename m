Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2EFBC433F5
	for <io-uring@archiver.kernel.org>; Mon, 30 May 2022 16:34:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237039AbiE3Qeu (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Mon, 30 May 2022 12:34:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233727AbiE3Qet (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Mon, 30 May 2022 12:34:49 -0400
Received: from out30-56.freemail.mail.aliyun.com (out30-56.freemail.mail.aliyun.com [115.124.30.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3D199CF51
        for <io-uring@vger.kernel.org>; Mon, 30 May 2022 09:34:47 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=xiaoguang.wang@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0VEqhBEg_1653928484;
Received: from 30.13.144.217(mailfrom:xiaoguang.wang@linux.alibaba.com fp:SMTPD_---0VEqhBEg_1653928484)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 31 May 2022 00:34:45 +0800
Message-ID: <d708da46-d61c-ce9d-4eed-ac8856996d71@linux.alibaba.com>
Date:   Tue, 31 May 2022 00:34:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v2] io_uring: let IORING_OP_FILES_UPDATE support to choose
 fixed file slots
Content-Language: en-US
To:     Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org
Cc:     asml.silence@gmail.com
References: <20220530131520.47712-1-xiaoguang.wang@linux.alibaba.com>
 <3064f1e4-c66b-a90b-8073-dc63525c5aca@kernel.dk>
 <08f2395c-50b2-850a-0ce9-583be34017e3@kernel.dk>
 <ea209f4d-cbf6-cc9f-ccab-9c28e9b58a35@linux.alibaba.com>
 <5f5a0896-8ba4-b526-d736-4343b507fb68@kernel.dk>
From:   Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
In-Reply-To: <5f5a0896-8ba4-b526-d736-4343b507fb68@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org


> On 5/30/22 10:15 AM, Xiaoguang Wang wrote:
>> hi,
>>
>>> On 5/30/22 7:18 AM, Jens Axboe wrote:
>>>> On 5/30/22 7:15 AM, Xiaoguang Wang wrote:
>>>>> @@ -5945,16 +5948,22 @@ static int io_statx(struct io_kiocb *req, unsigned int issue_flags)
>>>>>  	return 0;
>>>>>  }
>>>>>  
>>>>> +#define IORING_CLOSE_FD_AND_FILE_SLOT 1
>>>>> +
>>>> This should go into uapi/linux/io_uring.h - I'll just move it, no need
>>>> for a v3 for that. Test case should add it too.
>>> Here's what I merged so far:
>>>
>>> https://git.kernel.dk/cgit/linux-block/commit/?h=io_uring-5.19&id=f6b0e7c95c20d4889b811ada7fc0061e8cb4e82e
>>>
>>> Changes:
>>>
>>> - I re-wrote the commit message slightly
>>> - Move flag to header where it belongs
>>> - Get rid of 'goto' in io_files_update_with_index_alloc()
>>> - Drop unneeded variable in io_files_update_with_index_alloc()
>> I think file registration feature is much easier to use now, thanks!
> Thanks for making the change! Will you send a v2 of the liburing test?
Yeah, I'll do it, will send it soon.

Regards,
Xiaoguang Wang
> Then I'll get that queued up too.
>

