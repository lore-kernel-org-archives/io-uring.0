Return-Path: <io-uring-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D63CC77B73
	for <io-uring@archiver.kernel.org>; Tue, 25 Apr 2023 18:21:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbjDYSVT (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Tue, 25 Apr 2023 14:21:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234378AbjDYSVS (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Tue, 25 Apr 2023 14:21:18 -0400
Received: from 66-220-144-178.mail-mxout.facebook.com (66-220-144-178.mail-mxout.facebook.com [66.220.144.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CA8C86BE
        for <io-uring@vger.kernel.org>; Tue, 25 Apr 2023 11:21:18 -0700 (PDT)
Received: by devbig1114.prn1.facebook.com (Postfix, from userid 425415)
        id 87016442EFE8; Tue, 25 Apr 2023 11:21:06 -0700 (PDT)
From:   Stefan Roesch <shr@devkernel.io>
To:     io-uring@vger.kernel.org, kernel-team@fb.com
Cc:     shr@devkernel.io, axboe@kernel.dk, ammarfaizi2@gnuweeb.org
Subject: [PATCH v9 4/4] liburing: update changelog with new feature
Date:   Tue, 25 Apr 2023 11:20:54 -0700
Message-Id: <20230425182054.2826621-5-shr@devkernel.io>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230425182054.2826621-1-shr@devkernel.io>
References: <20230425182054.2826621-1-shr@devkernel.io>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

Add a new entry to the changelog file for the napi busy poll feature.

Signed-off-by: Stefan Roesch <shr@devkernel.io>
Acked-by: Ammar Faizi <ammarfaizi2@gnuweeb.org>
---
 CHANGELOG | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG b/CHANGELOG
index 71ca391..3b4144f 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -15,6 +15,7 @@ liburing-2.4 release
   io_uring_prep_socket_direct() factor in being called with
   IORING_FILE_INDEX_ALLOC for allocating a direct descriptor.
 - Add io_uring_prep_sendto() function.
+- Support for napi busy polling
=20
 liburing-2.3 release
=20
--=20
2.39.1

