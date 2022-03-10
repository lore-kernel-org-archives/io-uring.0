Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D51EC3526E
	for <io-uring@archiver.kernel.org>; Thu, 10 Mar 2022 10:32:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241266AbiCJKdn (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Thu, 10 Mar 2022 05:33:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241435AbiCJKde (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Thu, 10 Mar 2022 05:33:34 -0500
Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC8C10D9
        for <io-uring@vger.kernel.org>; Thu, 10 Mar 2022 02:32:31 -0800 (PST)
Received: from localhost.localdomain (unknown [138.197.159.143])
        by gnuweeb.org (Postfix) with ESMTPSA id 3F27A7E2E0;
        Thu, 10 Mar 2022 10:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
        s=default; t=1646908350;
        bh=uuX90nuv877/C4onFNI5x1c9ovU7MdZmcxbW9Y0HIJI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=g0zzk3O6lpPloaa1JmlSs2lUU/P9YUObmCmjzTsn0kgJR1Br61oZnILbDsxy+5aW1
         SYCtA25PSdKzfznZvNE2Z0UJMrwSyWv9+xrtNnIdiaipHKX6YwYKo5zQgqTo5wQ2RA
         N/RpnFNYQVgTfszQ2woSxtEa8RjeifsXSbtzJzz8Yhrl86iLl2gHYQxD1uSz0uyXt7
         gaiWVYx9MTIo6U/lw4BkRtD2ohhrBdVz618GAYAL77WZE9KjjdmjFc1gD+LC8UQMCN
         a62flpgrpO2q/yT9MD8SZtLToX9+sOGhpk6FTjYtTHxktbiXD+XA/om3QAhSNnzWF7
         6YBto7aBcx3uA==
From:   Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>,
        Pavel Begunkov <asml.silence@gmail.com>,
        Ammar Faizi <ammarfaizi2@gnuweeb.org>,
        Alviro Iskandar Setiawan <alviro.iskandar@gmail.com>,
        io-uring <io-uring@vger.kernel.org>, gwml <gwml@vger.gnuweeb.org>
Subject: [PATCH liburing v2 3/4] test/Makefile: Add liburing.a as a dependency
Date:   Thu, 10 Mar 2022 10:32:23 +0000
Message-Id: <20220310103224.1675123-4-alviro.iskandar@gnuweeb.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220310103224.1675123-1-alviro.iskandar@gnuweeb.org>
References: <20220310103224.1675123-1-alviro.iskandar@gnuweeb.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

The test binaries statically link liburing using liburing.a file. When
liburing.a is recompiled, make sure the tests are also recompiled to
ensure changes are applied to the test binary. It makes "make clean"
command optional when making changes.

Signed-off-by: Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>
---
 test/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/test/Makefile b/test/Makefile
index f421f53..9dae002 100644
--- a/test/Makefile
+++ b/test/Makefile
@@ -196,10 +196,10 @@ all: $(test_targets)
 helpers.o: helpers.c
 	$(QUIET_CC)$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ -c $<
 
-%: %.c $(helpers) helpers.h
+%: %.c $(helpers) helpers.h ../src/liburing.a
 	$(QUIET_CC)$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ $< $(helpers) $(LDFLAGS)
 
-%: %.cc $(helpers) helpers.h
+%: %.cc $(helpers) helpers.h ../src/liburing.a
 	$(QUIET_CXX)$(CXX) $(CPPFLAGS) $(CXXFLAGS) -o $@ $< $(helpers) $(LDFLAGS)
 
 
-- 
2.25.1

