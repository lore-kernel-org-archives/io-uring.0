Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD2F3C19F2D
	for <io-uring@archiver.kernel.org>; Wed, 10 Aug 2022 00:55:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbiHJAza (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Tue, 9 Aug 2022 20:55:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbiHJAz3 (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Tue, 9 Aug 2022 20:55:29 -0400
Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3BB27539D
        for <io-uring@vger.kernel.org>; Tue,  9 Aug 2022 17:55:28 -0700 (PDT)
Received: from [192.168.88.254] (unknown [180.246.144.41])
        by gnuweeb.org (Postfix) with ESMTPSA id 6622F80615;
        Wed, 10 Aug 2022 00:55:26 +0000 (UTC)
X-GW-Data: lPqxHiMPbJw1wb7CM9QUryAGzr0yq5atzVDdxTR0iA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
        s=default; t=1660092928;
        bh=Cwyh/OMs5s/iLcDl1SrqOnJqss8XseSzIDQQbmTLV9s=;
        h=Date:To:Cc:From:Subject:From;
        b=fQmk+Vg0elNpC+ce/g0WISXnu36LsY2BJVQjF3eqyNwahTIt7hjKF9U2OBT0zHMQ/
         PkmSVjQ+s5mYxwz79FygcW/UIb7xIyeuNxJpY1M/BL8COM9FBN5tOHgurcnsQ42b3P
         FpdQzcqPHTLPX14B1Oc8HbGru1gPMuVGZs7dxDW6KhUOevPCP8tBVJQndHKZMWS6Us
         W9W4TaHhuyQTgEmeJxDgimNHWUiyC7oJ3LOo3S7BRbbNLVekZEilEK3DOiZapyZU4k
         XU0VmCIkeB46bLSpkC3Vcs5b7zJEj+xhQKchHxuJxU56vfhx3Jjhgp9j4f8UBgm3Fi
         xErLjkqP/SoNw==
Message-ID: <970548e2-e888-4d79-6eb2-789a6e75a872@gnuweeb.org>
Date:   Wed, 10 Aug 2022 07:55:22 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Kanna Scarlet <knscarlet@gnuweeb.org>,
        Fernanda Ma'rouf <fernandafmr12@gnuweeb.org>,
        io-uring Mailing List <io-uring@vger.kernel.org>,
        GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
From:   Ammar Faizi <ammarfaizi2@gnuweeb.org>
Subject: [GIT PULL] GitHub bot update
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

Hi Jens,

Just a single commit to upgrade the OS on the GitHub bot CI.
"ubuntu-latest" doesn't give the latest version of Ubuntu. Explicitly
specify "ubuntu-22.04" to get the latest version. This is just like
commit:

    f642f8fd71bf (".github: Upgrade GitHub bot to Ubuntu 22.04 and gcc-11")

... but for the shellcheck.

Please pull!

---
The following changes since commit 2757d61fa222739f77b014810894b9ccea79d7f3:

   io_uring-udp: make more obvious what kernel version is required (2022-08-05 08:43:23 -0600)

are available in the Git repository at:

   https://github.com/ammarfaizi2/liburing.git tags/github-bot-2022-08-10

for you to fetch changes up to 487604001a46441888469df44c081e08afd5e3c5:

   .github: Update OS to Ubuntu 22.04 for shellcheck CI (2022-08-10 07:53:14 +0700)

----------------------------------------------------------------
Just a single commit to upgrade the OS on the GitHub bot CI.
"ubuntu-latest" doesn't give the latest version of Ubuntu. Explicitly
specify "ubuntu-22.04" to get the latest version. This is just like
commit:

    f642f8fd71bf (".github: Upgrade GitHub bot to Ubuntu 22.04 and gcc-11")

... but for the shellcheck.

----------------------------------------------------------------
Ammar Faizi (1):
       .github: Update OS to Ubuntu 22.04 for shellcheck CI

  .github/workflows/shellcheck.yml | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

-- 
Ammar Faizi
