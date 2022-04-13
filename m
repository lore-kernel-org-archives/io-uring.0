Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CFAAC4332F
	for <io-uring@archiver.kernel.org>; Wed, 13 Apr 2022 15:11:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232646AbiDMPNg (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Wed, 13 Apr 2022 11:13:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234773AbiDMPNf (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Wed, 13 Apr 2022 11:13:35 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8BC93A70E
        for <io-uring@vger.kernel.org>; Wed, 13 Apr 2022 08:11:13 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id g18so4565809ejc.10
        for <io-uring@vger.kernel.org>; Wed, 13 Apr 2022 08:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TJtiBC46TK7m8S59lkXw8Q7Xq4HghuPLu80OPR/hB8A=;
        b=ov7UnAcK69EtEBAyjlS48F/D6tPlMNwmsWP6QeEjEjx0ygXnTrUo9nwhflvnJcBVw6
         U8GnuAGaIHVeDQcNpXvo6Kh5X2OXaEAJUE4BL0J0hYhoFSHJIQgAEiVArmjYQ+4x5FL4
         VElXaSFXl0zXlnRyq66/E2WVKlcG71fNSo1dY/Pie9X2Us4abyyNbkcPuoMWBEc6yjiT
         ZnRtB3FiNZsIWM2ezH/LTv2lQVmLvKr47twyv7dyb0txRMM3OGoSMD3EwDtXzcEe9GB6
         IwbpuCmiLQEsVLWF4fP9DbGoTmpOSVfmUXw6MiP9utVLU8feRW6eN5JPTaUHAdjd4vQg
         kXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TJtiBC46TK7m8S59lkXw8Q7Xq4HghuPLu80OPR/hB8A=;
        b=5cGsCDfYE+svvAIXuH0USsLmj71uwbuWeiZLaKXh262Tld97JjgIHy6tfQn45rMezN
         Au4RoGth5mdUSsM4UOpKW40o58dmEJlw2mkMWEIr4X/b1pxsCR7xcUex+G35Jw4JoPvs
         wlC3iEn/vE7AwvHpmaliLKcSPF3VsXPdCHKUCieTktwuujCaGx9qax2Ls/LioeAHoVHC
         34HDJ27eoYX8dP4vT+gTf69aLO6ddeWhPwsiHwxzQ/k43EZ7/Q4W6wNxf4XZMhQr9bgf
         3PHCC6LF6THsLwY0XmoBaGGO0Ubodu41dAQfuo3YVONeddmy+IWX0Xy30m0JwbMJTq3M
         yOPA==
X-Gm-Message-State: AOAM532pPeg3/pZzVBVDc1n2Jsq+ZYeWREMJlRnhmFn7LVRnudJxqM05
        Cl2Woel6Mrba3WEltDMTJSQStjuckW0=
X-Google-Smtp-Source: ABdhPJzkmBcqU00bRdDIIKfUUkPNREZj1sIGkAwyGF6FtVIytQOwaiZifPG2ImycX5pdXZt8WU/06g==
X-Received: by 2002:a17:906:830c:b0:6e8:7b71:2342 with SMTP id j12-20020a170906830c00b006e87b712342mr17198316ejx.226.1649862672171;
        Wed, 13 Apr 2022 08:11:12 -0700 (PDT)
Received: from 127.0.0.1localhost ([185.69.145.65])
        by smtp.gmail.com with ESMTPSA id j2-20020a056402238200b0041f351a8b83sm1037152eda.43.2022.04.13.08.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 08:11:11 -0700 (PDT)
From:   Pavel Begunkov <asml.silence@gmail.com>
To:     io-uring@vger.kernel.org
Cc:     Jens Axboe <axboe@kernel.dk>, asml.silence@gmail.com
Subject: [PATCH 3/3] io_uring: fix poll error reporting
Date:   Wed, 13 Apr 2022 16:10:35 +0100
Message-Id: <5f03514ee33324dc811fb93df84aee0f695fb044.1649862516.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1649862516.git.asml.silence@gmail.com>
References: <cover.1649862516.git.asml.silence@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

We should not return an error code in req->result in
io_poll_check_events(), because it may get mangled and returned as
success. Just return the error code directly, the callers will fail the
request or proceed accordingly.

Fixes: 6bf9c47a3989 ("io_uring: defer file assignment")
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 fs/io_uring.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index d06f1952fdfa..ab674a0d269b 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -5861,9 +5861,8 @@ static int io_poll_check_events(struct io_kiocb *req, bool locked)
 			unsigned flags = locked ? 0 : IO_URING_F_UNLOCKED;
 
 			if (unlikely(!io_assign_file(req, flags)))
-				req->result = -EBADF;
-			else
-				req->result = vfs_poll(req->file, &pt) & req->apoll_events;
+				return -EBADF;
+			req->result = vfs_poll(req->file, &pt) & req->apoll_events;
 		}
 
 		/* multishot, just fill an CQE and proceed */
-- 
2.35.1

