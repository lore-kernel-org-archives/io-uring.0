Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BCEC43334
	for <io-uring@archiver.kernel.org>; Tue, 26 Jul 2022 11:19:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232707AbiGZLTX (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Tue, 26 Jul 2022 07:19:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbiGZLTX (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Tue, 26 Jul 2022 07:19:23 -0400
Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9A7430F49
        for <io-uring@vger.kernel.org>; Tue, 26 Jul 2022 04:19:20 -0700 (PDT)
Received: from localhost.localdomain (unknown [138.197.159.143])
        by gnuweeb.org (Postfix) with ESMTPSA id B95A57E328;
        Tue, 26 Jul 2022 11:19:19 +0000 (UTC)
X-GW-Data: lPqxHiMPbJw1wb7CM9QUryAGzr0yq5atzVDdxTR0iA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
        s=default; t=1658834360;
        bh=k/V5rIfa9ylnDktf7+NicTFP9w4TxSG4KpRr5gBkXeY=;
        h=From:To:Cc:Subject:Date:From;
        b=bz0D3whobmJcCLVtTz6EmWuzEJg0HhsOO0DVz+Js5wMgn51WjqOQFDWMbNggGZPoL
         qZlQwfMH4nIqAswlelpgXg/EP9NZoP2QwTOj5qkZkyq2oieM8vMF9HcCYDhgQoOyMU
         hVlaEHww8vSeSubdyZ4D+tcxty31cc/CI9yADGoSVOnHw3cpDPFMMy31zxCNgpNAuB
         jgzz5Eieshh8rnFzkq2UtQ+FOwrF2iHfvteF8g7InuZDbQOm3saqy47PaxYFm4I3SD
         CKCnNjERtLZOJT/JHxzx2n6PJbY45ikz4B6+s01DERDXCrZaMpOPp25vvXdDe2yeo0
         Q9yaqg0IzcjRA==
From:   Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>,
        io-uring Mailing List <io-uring@vger.kernel.org>,
        Ammar Faizi <ammarfaizi2@gnuweeb.org>,
        GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [PATCH liburing] arch/syscall: Use __NR_mmap2 existence for preprocessor condition
Date:   Tue, 26 Jul 2022 11:18:51 +0000
Message-Id: <20220726111851.3608291-1-alviro.iskandar@gnuweeb.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

Now __NR_mmap2 is only used for i386. But it is also needed for other
archs like ARM and RISCV32. Decide to use it based on the __NR_mmap2
definition as it's not defined on other archs. Currently, this has no
effect because other archs use the generic mmap definition from libc.

Signed-off-by: Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>
---
 src/arch/syscall-defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/arch/syscall-defs.h b/src/arch/syscall-defs.h
index 9ddac45..374aa0d 100644
--- a/src/arch/syscall-defs.h
+++ b/src/arch/syscall-defs.h
@@ -27,7 +27,7 @@ static inline void *__sys_mmap(void *addr, size_t length, int prot, int flags,
 {
 	int nr;
 
-#if defined(__i386__)
+#if defined(__NR_mmap2)
 	nr = __NR_mmap2;
 	offset >>= 12;
 #else
-- 
Alviro Iskandar Setiawan

