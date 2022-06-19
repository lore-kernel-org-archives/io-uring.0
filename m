Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D492C43334
	for <io-uring@archiver.kernel.org>; Sun, 19 Jun 2022 01:59:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbiFSB7d (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Sat, 18 Jun 2022 21:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiFSB7c (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Sat, 18 Jun 2022 21:59:32 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2517FBCAF
        for <io-uring@vger.kernel.org>; Sat, 18 Jun 2022 18:59:31 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id p3-20020a17090a428300b001ec865eb4a2so2616449pjg.3
        for <io-uring@vger.kernel.org>; Sat, 18 Jun 2022 18:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Sa+xNwB1Xnx4vib+uEQTPzySliXR7Z1GMwuehk1Itc=;
        b=pbx5l343Xpq/kyz7ajR/sJTASLwi8F6g/5dwAKlDDTPZnOtJ+UlhDuaPlcoZ0+3Tuo
         BIZkWRBzT3k2pW7y1zUmGFrdhKJF5EFlVKx+3iiqtP5twmA2Ty1req6OagZtvurxbWNX
         lJ1VttEIhQMhSjDW5JTwo/2AS6S36QI4VieptlYzGK6kO8FfAen/3Ggw0eLK4paEYkOW
         T7FUDj6V008myy44b2/+mIbol3okd1mtXnXnZLW6GId+eFOfxJgQUXIU6+3WJMYPzVBW
         spCVBmzhzEfZPZLI5fllsdZP352tb14xaR3DxJcgF4CBbPN4Ik9C3MLWuN9fFDGXSL4V
         MwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Sa+xNwB1Xnx4vib+uEQTPzySliXR7Z1GMwuehk1Itc=;
        b=OEHNFEc5G0O0GDH+OAY/VLXxtY2GYVOJOg6LGky8meBaYOI8qm+U9E/pIlBy8BCZQN
         Dr8mtFhAr0ZK2VFaV4yjlR3zzpu0YemMBaQD4IIBOmeMZ1Sn6pFEaMMDOLXPb+5/oFkt
         3Ty/Fsh23knvsI9dfGn9ozCOZO+qajhnnRgwGJhiB7kQaPHYGjEuAarmox+aunE5q917
         YCq+85zxlx4/UJn+zrcec6cTmVDlYy9L5HQDWmINBGm888q2I8WAIbQBCbRDZBNrVnv0
         hxyNKLfpuS0IvM9wrKGGzZOwZYEFRdmBrApf/QqJTSgtb7edTZLO1fXIY6vgNcX5hbRY
         jX/w==
X-Gm-Message-State: AJIora8Hi/qECo7MRHlgwZX/2Nwrae9GgivFYPQZVlqmUtGrdwDttXDG
        8ES024kMkAiCP0GCN0olSofVP/5e/pDgag==
X-Google-Smtp-Source: AGRyM1ufpbOK/RoI4TQOEmQjKtlow6Nx0Tu3AcGlJydWHw2YixUrKlmdUEcW1vVsEnU0AWbBPM39pA==
X-Received: by 2002:a17:902:e750:b0:166:3058:d0ed with SMTP id p16-20020a170902e75000b001663058d0edmr17283140plf.0.1655603970292;
        Sat, 18 Jun 2022 18:59:30 -0700 (PDT)
Received: from localhost.localdomain ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b0016194c1df58sm3526725plb.105.2022.06.18.18.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jun 2022 18:59:29 -0700 (PDT)
From:   Jens Axboe <axboe@kernel.dk>
To:     io-uring@vger.kernel.org
Cc:     asml.silence@gmail.com
Subject: [PATCHSET v2 for-next 0/2] Add direct descriptor ring passing
Date:   Sat, 18 Jun 2022 19:59:20 -0600
Message-Id: <20220619015922.1325241-1-axboe@kernel.dk>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

Hi,

One of the things we currently cannot do with direct descriptors is pass
it to another application or ring. This adds support for doing so, through
the IORING_OP_MSG_RING ring-to-ring messaging opcode.

Changes since v1:
- Add IORING_MSG_RING_CQE_SKIP flag for IORING_OP_MSG_RING
- Expand commit message in patch 2

-- 
Jens Axboe


