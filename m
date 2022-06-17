Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34ABAC43334
	for <io-uring@archiver.kernel.org>; Fri, 17 Jun 2022 11:38:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380908AbiFQLig (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Fri, 17 Jun 2022 07:38:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380924AbiFQLiR (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Fri, 17 Jun 2022 07:38:17 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8811A527C7
        for <io-uring@vger.kernel.org>; Fri, 17 Jun 2022 04:38:16 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id y6so3680740plg.0
        for <io-uring@vger.kernel.org>; Fri, 17 Jun 2022 04:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=oUWvibdpMvYqxXaJaWyUnneRPpDc/Ohn2+IKV4BXars=;
        b=k59oEEam7a3WXrZF6eVKgccORUH1W2o0QjQNEnpYIIeqrAh3ZQFBF2WB3MKfKqWJnF
         VwKq4Eq0ELgZZDAa6qg7kTEhhfIWiUQDs15ivdSPyq+ieOPw4gsZgdv9XftD+wT6MQsE
         ELSegeVM4K8jnFr2ZLGNEI7/k8UoJEtOTQ1M1Zq1aifpIIzkvIieNmZPHb7rTlca6Ei/
         EePtpG+ONQCweuvrrk6eg7J9ebd5a15xPQaUigBQByTQyxTZdqhwKGLJyHS4e8cfrw44
         eGBv2e8EmYszEbyInsSi0vlO/HtV4vhtSv73rjJ2ZApk/+CBx3gXU+3bmTRC+FZmKbIr
         r3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=oUWvibdpMvYqxXaJaWyUnneRPpDc/Ohn2+IKV4BXars=;
        b=j6JGi6ueU6bC5zZqLhbKXzoVudoQXlmBCy1e56ZpzK3ZS1Pfc97d0p4Lgb749VJLJp
         WjfXNU6naNeuGG14/UocbEWInNWag7mCQhmGdYycvSmwbNPRUQIBgAsPOjWUBEBP0F3X
         fVw+Br+sLy/NrE2mQRNlOULd+mClJQj6HVA/lq5cVA0jce8YG+aoU1vs04HT5O2WSn1+
         IYj6nme9GKzCQmdlQLQStolHP+ABwfhR9yTDiHWg+faCiFV3lOi1sbpp0GlA7zmEyxgk
         DuK03+cThKO4AKmBuQF+s7XSvnTdih2ZQt66JsSMvZgma4fMIWSt8rvfgsfnRp2IaqFC
         domA==
X-Gm-Message-State: AJIora+E/ED41Uvsyn7H48RuGvCdBMb9RFd5oVszneHsQcOPQ7H5aOsq
        OXZjJMw8QALHDzSoNtOccJBkabaSKlOSXA==
X-Google-Smtp-Source: AGRyM1umdkGAd8JRwRzmps/gbYpgBDGWv9IwYIRKAIJ3Gm9ByoM5HWZBhIZiw+wzdvw83Lqyq6CVTA==
X-Received: by 2002:a17:902:f792:b0:168:e97b:3c05 with SMTP id q18-20020a170902f79200b00168e97b3c05mr9223661pln.94.1655465895756;
        Fri, 17 Jun 2022 04:38:15 -0700 (PDT)
Received: from [127.0.1.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id jj10-20020a170903048a00b00163247b64bfsm3340344plb.115.2022.06.17.04.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 04:38:15 -0700 (PDT)
From:   Jens Axboe <axboe@kernel.dk>
To:     io-uring@vger.kernel.org, hao.xu@linux.dev
Cc:     asml.silence@gmail.com
In-Reply-To: <20220617050429.94293-1-hao.xu@linux.dev>
References: <20220617050429.94293-1-hao.xu@linux.dev>
Subject: Re: [PATCH v2] io_uring: kbuf: add comments for some tricky code
Message-Id: <165546589464.253852.4276960984454502097.b4-ty@kernel.dk>
Date:   Fri, 17 Jun 2022 05:38:14 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

On Fri, 17 Jun 2022 13:04:29 +0800, Hao Xu wrote:
> From: Hao Xu <howeyxu@tencent.com>
> 
> Add comments to explain why it is always under uring lock when
> incrementing head in __io_kbuf_recycle. And rectify one comemnt about
> kbuf consuming in iowq case.
> 
> 
> [...]

Applied, thanks!

[1/1] io_uring: kbuf: add comments for some tricky code
      commit: 0efaf0d19e9e1271f2275393e62f709907cd40e2

Best regards,
-- 
Jens Axboe


