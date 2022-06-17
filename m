Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6318C433EF
	for <io-uring@archiver.kernel.org>; Fri, 17 Jun 2022 14:36:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346863AbiFQOgL (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Fri, 17 Jun 2022 10:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231490AbiFQOgK (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Fri, 17 Jun 2022 10:36:10 -0400
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E66634755C
        for <io-uring@vger.kernel.org>; Fri, 17 Jun 2022 07:36:09 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1655476567;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=geF1aedunvKaJA154ryale8sbFahJGu/itZJ+sve54Q=;
        b=QBHmqmp+KCunucObBqFyiP/dc4n0poYNdzWnt/WjyVIC7fvNMhrNpYyVHJ655RLujs1XVs
        4hh/cBCBMuZwhcxCkvXMqKpaUdmHL+YTz1whLEO5qAtvv+FocnRZzK8bcszTzwhgidBKQs
        Oew63MuwR+G2aoZRA95GzVoSxBBiWk0=
From:   Hao Xu <hao.xu@linux.dev>
To:     io-uring@vger.kernel.org
Cc:     Jens Axboe <axboe@kernel.dk>,
        Pavel Begunkov <asml.silence@gmail.com>
Subject: [PATCH liburing 0/3] multishot accept test fix and clean
Date:   Fri, 17 Jun 2022 22:36:00 +0800
Message-Id: <20220617143603.179277-1-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

From: Hao Xu <howeyxu@tencent.com>

The multishot accept test is skipped, patch 1 fixes this. After this
it is still broken, patch 2 fixes it. And patch 3 is code clean.

Donald Hunter (1):
  Fix incorrect close in test for multishot accept

Hao Xu (2):
  test/accept: fix minus one error when calculating multishot_mask
  test/accept: clean code of accept test

 test/accept.c | 76 ++++++++++++++++++++++++---------------------------
 1 file changed, 36 insertions(+), 40 deletions(-)

-- 
2.25.1

