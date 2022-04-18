Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61219C433EF
	for <io-uring@archiver.kernel.org>; Mon, 18 Apr 2022 00:05:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233219AbiDRAH5 (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Sun, 17 Apr 2022 20:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233085AbiDRAH4 (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Sun, 17 Apr 2022 20:07:56 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E5D112AC9
        for <io-uring@vger.kernel.org>; Sun, 17 Apr 2022 17:05:19 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id s14so11122719plk.8
        for <io-uring@vger.kernel.org>; Sun, 17 Apr 2022 17:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=V/xyuatSSzUElNhqC2Y+YK97ekMkKlkCKrMCITjNfFM=;
        b=aXkfpbxgmPO/TUfbiuWGZrWA3Zhm0ROdDvcvw1ltBIKHB6kClbpmymJ504K/vEA983
         ZJjKPiwacja4NTjFATeKSbkKZFwB7BmAu+3/dmChCkhMiqgY9LOthINxxsg138czIqS/
         5JjnF4hhLM4kEBay5nRcQbQphpRB4ONPUhsd1xYEqUQpMs7k2Qrdl8H5lDxUxYyaTOID
         k++3Pjrv2RiG4CAh3SJ03mmpTPJRks+9Xgn1AcTZvcR2EtAvxeyv4qvWaXAaPR9rODPl
         2d17v4Ym0LXkWU+Y4+u8VQb2A8AXd+LidxON1Jp4xYmjnvteIdn/uWlsxFG5Qwv/xVO/
         UOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=V/xyuatSSzUElNhqC2Y+YK97ekMkKlkCKrMCITjNfFM=;
        b=W3ZvK+oju9kKfX2DQOE2E2YeqjsyPtTHoEiGd/cIgw95a3JJ4WUu5aqbKV39jjaUfP
         E3lKik6XJpvbTmtxcT4n+/lr27G9VaMLXyNd8ayhgzgAPitB+EPmBRUSl/sBbw0+MwkR
         AhoamwdtIgXjv9J1wpYI8EYBxbJwxmz85K4VQmtIcJLeb1RbOMqusNsjuNxeOy+MdaQb
         Tvx5GHjUnZHIprTF9HRCYE/OXtLBKOae0D2GZOkx65IBceWYgMNpFy3kQP4aSOrSfvSh
         zQawqGqhcBXoYgulxfsnrcHtZHgRcU9cd6IIFC0aEUCyhCgtjPS2Rm/eHnngRm6xpTck
         6ZFg==
X-Gm-Message-State: AOAM531JfZ0WToGqVB2X+jVn8SAW9CgPOx/YlLi9jNDs9Mj93OC2Z919
        Op/h9lqtCZsovYB38AI6QQm+QbeXoONXA+7R
X-Google-Smtp-Source: ABdhPJxvMjEBqtQHRFbR/L/IchWCYS5E6e/SknReNXDsAmX3Z2qxuhjJbsTbXmn1e4os3S5bYDsuMQ==
X-Received: by 2002:a17:90b:1044:b0:1cd:2d00:9d23 with SMTP id gq4-20020a17090b104400b001cd2d009d23mr15416339pjb.124.1650240318704;
        Sun, 17 Apr 2022 17:05:18 -0700 (PDT)
Received: from [192.168.1.100] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id a2-20020a17090ad80200b001d27824fc24sm3489947pjv.5.2022.04.17.17.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Apr 2022 17:05:18 -0700 (PDT)
Message-ID: <6ba23bd7-26c1-64fd-a312-f90c398b4062@kernel.dk>
Date:   Sun, 17 Apr 2022 18:05:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 02/14] io_uring: add a hepler for putting rsrc nodes
Content-Language: en-US
To:     Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org
References: <cover.1650056133.git.asml.silence@gmail.com>
 <865313e8a7eac34b6c01c047a4af6900eb6337ee.1650056133.git.asml.silence@gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <865313e8a7eac34b6c01c047a4af6900eb6337ee.1650056133.git.asml.silence@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

On 4/15/22 3:08 PM, Pavel Begunkov wrote:
> @@ -1337,21 +1342,21 @@ static inline void io_req_put_rsrc_locked(struct io_kiocb *req,
>  		if (node == ctx->rsrc_node)
>  			ctx->rsrc_cached_refs++;
>  		else
> -			percpu_ref_put(&node->refs);
> +			io_rsrc_put_node(node, 1);
>  	}
>  }
>  
>  static inline void io_req_put_rsrc(struct io_kiocb *req, struct io_ring_ctx *ctx)
>  {
>  	if (req->rsrc_node)
> -		percpu_ref_put(&req->rsrc_node->refs);
> +		io_rsrc_put_node(req->rsrc_node, 1);
>  }

What's this against? I have req->fixed_rsrc_refs here.

Also, typo in subject s/hepler/helper.

-- 
Jens Axboe

