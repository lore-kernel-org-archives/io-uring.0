Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF17C433EF
	for <io-uring@archiver.kernel.org>; Tue, 12 Apr 2022 14:10:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355376AbiDLOMy (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Tue, 12 Apr 2022 10:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350319AbiDLOMw (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Tue, 12 Apr 2022 10:12:52 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD1671CFD4
        for <io-uring@vger.kernel.org>; Tue, 12 Apr 2022 07:10:34 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id u3so27933647wrg.3
        for <io-uring@vger.kernel.org>; Tue, 12 Apr 2022 07:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MLB88jBPzd+UKwTc/nTm9hN5u7OocLRwGb1wbBHBS9A=;
        b=XFwaMfJq1OdeDsmrrnnilAWjGbjrtS6DfnI0kehJM95NFcyR+Czg6RBsKFc+ellLVK
         Z5QjO5xN0JN8rZkcEeB49xHxT3YCA5I7F/gdibxfX+DLtRLlSX7NT9TgrGdRypSr1eYP
         bK6Eqy/254uMtVXOX9RPjq2D03E701LAT8Ltn/CXJYJQo5SqEqbkKxJtKIUOxv8cnS9t
         Lbe0tf4nQsFbqe3Qy1ZyKH9k0FroaedvyHAxzxTnf0s+S7GMEexz+47vh8wrK+qLP4+m
         pDWKpTfZ7u61/o1f9Jjfc4nTW7nlEPBN+X73g9VPh6LW2kuRHY6tWhfp9clQnzrSQZ3P
         t3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MLB88jBPzd+UKwTc/nTm9hN5u7OocLRwGb1wbBHBS9A=;
        b=Gkbdty1pZHVCSo7rjbQOoI6uTlsQC+tna1X++2zDE+HkHLhHOJnBUS1oY9m/HjFpDg
         ipT55O1tYGSwG3uPZeoVyTrGkzIvzwrhaCLBIYa0XQiKUTXEV98sBdmZCYW8jm1pDkvK
         fgqU/LJTHiXW6pxYWkl0j7k1or+BUivYHZQ6nYVakngmuL48BBGlPMOgCmtdIFdzlYdl
         /oeRN7itiAilDfBbh1nwdY66Z2xpbgfV6GEMkaUXiUTNI9a70VmQwaLy/08GcAY/8wlg
         6aCYuYoQApG8NoYMX7Z5OHs/RooSfZDzQTFzOuOCuz1q1vfRA0sr7NSAcLgY+eO/IiBe
         bMHA==
X-Gm-Message-State: AOAM530qUWocVMtrYE5YUk7FRucAOwZTVWQBpoLThvVWQ5KgW2FVsFh7
        DcOyHm7b09S9BH686yxlnX34wNHkMTg=
X-Google-Smtp-Source: ABdhPJzXZst0Y6djmDzrFESGlXNrmASJd6/x5wjRLJ91DXLtETAcOLtfCJAsByNqAku1ARe10VgjDg==
X-Received: by 2002:adf:f307:0:b0:207:b0b5:999b with SMTP id i7-20020adff307000000b00207b0b5999bmr1967057wro.694.1649772633063;
        Tue, 12 Apr 2022 07:10:33 -0700 (PDT)
Received: from 127.0.0.1localhost ([148.252.129.222])
        by smtp.gmail.com with ESMTPSA id ay41-20020a05600c1e2900b0038e75fda4edsm2363703wmb.47.2022.04.12.07.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 07:10:32 -0700 (PDT)
From:   Pavel Begunkov <asml.silence@gmail.com>
To:     io-uring@vger.kernel.org
Cc:     Jens Axboe <axboe@kernel.dk>, asml.silence@gmail.com
Subject: [PATCH next 0/9] for-next clean ups and micro optimisation
Date:   Tue, 12 Apr 2022 15:09:42 +0100
Message-Id: <cover.1649771823.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

nops benchmark: 40.3 -> 41.1 MIOPS, or +2%

Pavel Begunkov (9):
  io_uring: explicitly keep a CQE in io_kiocb
  io_uring: memcpy CQE from req
  io_uring: shrink final link flush
  io_uring: inline io_flush_cached_reqs
  io_uring: helper for empty req cache checks
  io_uring: add helper to return req to cache list
  io_uring: optimise submission loop invariant
  io_uring: optimise submission left counting
  io_uring: optimise io_get_cqe()

 fs/io_uring.c | 288 +++++++++++++++++++++++++++++---------------------
 1 file changed, 165 insertions(+), 123 deletions(-)

-- 
2.35.1

