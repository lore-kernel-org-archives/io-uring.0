Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B9A2C4332F
	for <io-uring@archiver.kernel.org>; Sat, 19 Nov 2022 04:12:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233606AbiKSEMx (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Fri, 18 Nov 2022 23:12:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232754AbiKSEMM (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Fri, 18 Nov 2022 23:12:12 -0500
Received: from 66-220-144-178.mail-mxout.facebook.com (66-220-144-178.mail-mxout.facebook.com [66.220.144.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44F89A13F1
        for <io-uring@vger.kernel.org>; Fri, 18 Nov 2022 20:11:29 -0800 (PST)
Received: by dev0134.prn3.facebook.com (Postfix, from userid 425415)
        id F3147195672D; Fri, 18 Nov 2022 20:11:14 -0800 (PST)
From:   Stefan Roesch <shr@devkernel.io>
To:     kernel-team@fb.com
Cc:     shr@devkernel.io, axboe@kernel.dk, olivier@trillion01.com,
        netdev@vger.kernel.org, io-uring@vger.kernel.org, kuba@kernel.org,
        ammarfaizi2@gnuweeb.org
Subject: [RFC PATCH v4 4/4] liburing: update changelog with new feature
Date:   Fri, 18 Nov 2022 20:11:13 -0800
Message-Id: <20221119041113.146790-5-shr@devkernel.io>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221119041113.146790-1-shr@devkernel.io>
References: <20221119041113.146790-1-shr@devkernel.io>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

Add a new entry to the changelog file for the napi busy poll feature.

Signed-off-by: Stefan Roesch <shr@devkernel.io>
---
 CHANGELOG | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/CHANGELOG b/CHANGELOG
index 09511af..1db0269 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -1,3 +1,6 @@
+liburing-2.4 release
+- Support for napi busy polling
+
 liburing-2.3 release
=20
 - Support non-libc build for aarch64.
--=20
2.30.2

