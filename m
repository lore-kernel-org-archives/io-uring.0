Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7169C19F2A
	for <io-uring@archiver.kernel.org>; Thu,  4 Aug 2022 14:21:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233941AbiHDOVa (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Thu, 4 Aug 2022 10:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232047AbiHDOVa (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Thu, 4 Aug 2022 10:21:30 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23DCC1F2E7
        for <io-uring@vger.kernel.org>; Thu,  4 Aug 2022 07:21:29 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id y13so23180935ejp.13
        for <io-uring@vger.kernel.org>; Thu, 04 Aug 2022 07:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=Fv58/kCzaAyI36kcClFE4iPSBytKiTOaHUiLRjwdtRs=;
        b=aEgI8XZGN8XTaQWmC+X15UmfrDokenLxDs7FqqBtSnVLD8VvunnzECYr3zz0dB1bMo
         FqUzSgkKdtxetRrqLi39ECxCoTJkOBwv9PL2ds6C7jbHt6BNrkskSXUXw/QH8clPaqzC
         vG58/Y0nVxfoZ1Vy2usrxj2MJSCnpN+bDkXiTrLwhZfP7XoocLYLPiZ4PLFyAlcYPk0G
         8FGq7T7R9ShUrjRilkHf85nLKY5Sel1veQpAMIxwyqTd7cSMgcEocqXpZra3ir8v7+/3
         Xhr69fdefz+c97GyGJZp8dbVBren6AKiTao3Uc0Ivns3TRJQQ14AlbFi68ltaObSWYX8
         xBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=Fv58/kCzaAyI36kcClFE4iPSBytKiTOaHUiLRjwdtRs=;
        b=vVbtkO/8I95dZp4R2kxJ70D7STwX5yiAlECRmRKoBgKdMvFiXAYhTCi3r3K/tgEBF4
         JZc+gfpEhQlR+UebIEo0nQ4/y0vQeMOKboEm0zZEVAPezeIenvrQGyTnxqGUg5A/VHyW
         2ce3pGl82UdTLYCfH+9bBXsCeQGyz4To7D7uvJtOsIKB1j1O7VRIIu0nun/VBnYYwqMb
         PxPSO8kq0SGpAd6Bsn0KnwUdH80zgH12dlLGdN8/3wBrDxQTmlQoo8dTFm3oJQzjXyjw
         EZss67S7pN5nZxegDImWScp5ZArlwk0mYQWGlHMQ+/Qa5f/OHsi+2fhF7b0mPbQ0zeqq
         seig==
X-Gm-Message-State: ACgBeo3yYyMRjVdEiDOv3uIgjeyQKhHtYieWnRlKVAuwecNsIdvIV9L5
        4mjF5QKc9Mb3PaDQLQrpuM9gbSUPXCA=
X-Google-Smtp-Source: AA6agR41LIIHn6qKClHpwYKz8m9Q2TcxXujIWjeu6L4aDSPfxUoC1yWpeDSccY+O0WsnqLg8rOApyQ==
X-Received: by 2002:a17:906:cc56:b0:730:a2f0:7466 with SMTP id mm22-20020a170906cc5600b00730a2f07466mr1546519ejb.211.1659622887459;
        Thu, 04 Aug 2022 07:21:27 -0700 (PDT)
Received: from 127.0.0.1localhost (188.28.126.24.threembb.co.uk. [188.28.126.24])
        by smtp.gmail.com with ESMTPSA id r10-20020aa7c14a000000b0043bc33530ddsm727945edp.32.2022.08.04.07.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 07:21:26 -0700 (PDT)
From:   Pavel Begunkov <asml.silence@gmail.com>
To:     io-uring@vger.kernel.org
Cc:     Jens Axboe <axboe@kernel.dk>, asml.silence@gmail.com
Subject: [PATCH liburing 0/6] improve zeoropy testing
Date:   Thu,  4 Aug 2022 15:20:19 +0100
Message-Id: <cover.1659622771.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

Add test cases for TCP and for short sends.

Pavel Begunkov (6):
  test/zc: improve error messages
  tests/zc: test tcp
  test/zc: allocate buffers dynamically
  test/zc: handle short rx
  test/zc: recv asynchronously
  test/zc: test short zc send

 test/send-zerocopy.c | 161 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 127 insertions(+), 34 deletions(-)

-- 
2.37.0

