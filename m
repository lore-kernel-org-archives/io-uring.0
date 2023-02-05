Return-Path: <io-uring-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F81C636CC
	for <io-uring@archiver.kernel.org>; Sun,  5 Feb 2023 00:27:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbjBEA1T (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Sat, 4 Feb 2023 19:27:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbjBEA1S (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Sat, 4 Feb 2023 19:27:18 -0500
Received: from 66-220-144-178.mail-mxout.facebook.com (66-220-144-178.mail-mxout.facebook.com [66.220.144.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26E4626860
        for <io-uring@vger.kernel.org>; Sat,  4 Feb 2023 16:27:18 -0800 (PST)
Received: by dev0134.prn3.facebook.com (Postfix, from userid 425415)
        id 8BEA464A0C3E; Sat,  4 Feb 2023 16:24:37 -0800 (PST)
From:   Stefan Roesch <shr@devkernel.io>
To:     io-uring@vger.kernel.org, kernel-team@fb.com
Cc:     shr@devkernel.io, axboe@kernel.dk, ammarfaizi2@gnuweeb.org
Subject: [PATCH v7 4/4] liburing: update changelog with new feature
Date:   Sat,  4 Feb 2023 16:24:24 -0800
Message-Id: <20230205002424.102422-5-shr@devkernel.io>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230205002424.102422-1-shr@devkernel.io>
References: <20230205002424.102422-1-shr@devkernel.io>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

Add a new entry to the changelog file for the napi busy poll feature.

Signed-off-by: Stefan Roesch <shr@devkernel.io>
---
 CHANGELOG | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG b/CHANGELOG
index 0722aae..7810137 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -6,6 +6,7 @@ liburing-2.4 release
 - Add io_uring_prep_msg_ring_cqe_flags() function.
 - Deprecate --nolibc configure option.
 - CONFIG_NOLIBC is always enabled on x86-64, x86, and aarch64.
+- Support for napi busy polling
=20
 liburing-2.3 release
=20
--=20
2.30.2

