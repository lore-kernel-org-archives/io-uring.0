Return-Path: <io-uring-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF2DC7EE2E
	for <io-uring@archiver.kernel.org>; Mon, 12 Jun 2023 03:43:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233223AbjFLDne (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Sun, 11 Jun 2023 23:43:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjFLDnd (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Sun, 11 Jun 2023 23:43:33 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA97BC
        for <io-uring@vger.kernel.org>; Sun, 11 Jun 2023 20:43:33 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-39ce0ab782fso144857b6e.2
        for <io-uring@vger.kernel.org>; Sun, 11 Jun 2023 20:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686541411; x=1689133411;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5TVVO4LwS3Ms7mjKaB4FDCiXylD07t4fJORxIFRT36w=;
        b=dsJoSDGALCN2UFyYYFvRJH5+tOlHYbXyHjvEy5THQN6YKZ8Rf8evxzn1LGqM0p//Li
         k1djZUIgRAWCJkU6XVUsPeya4xdvopbFHNrgwYKh+zptDSmkM0y6Mht4xeY2yo92pC79
         rwBekfAmWF2RONibdyYAMjWG7tbAO4jLfPALxboscHUD+xYBTBkZwD6d6Mrx4L03anU2
         tye6ynbN5qaU7d3s9ng0p4F0Wk3cfeZgBvEvYIdzydNpjQkdt4Cw56jMV9CK6/CdWz10
         ViuSiOLtMAJTogMvjt/iN6yWrLZwjnzqFiO1qGK2wIzSfrWow+yJVyfWEAfvdT/+rnZn
         QhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686541411; x=1689133411;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5TVVO4LwS3Ms7mjKaB4FDCiXylD07t4fJORxIFRT36w=;
        b=FrcLx8d0M4Ze4Wj3b8WoerLsMeOVuKVkHBztVm/sOA2Jy4puwxxcADOadLZxnGMB3J
         6MXC4Qivh+VhNGVNLj6hqUFqf46tlwyPTvZKPgytqLqgvRdXSWACvGK0IZdyGAkWN04r
         TAk/Y0eTZsLex4Kcarol+1MJnS6rrpHjGmiX9yA+iv7AwkTesNyvFdr7MV4nXgC/dAN5
         VXrj4/4YzpJYyHmEaxZnTwTXkCBzNuekWmuVOU7iZIIMGIl9qo0USTMXvAOpRP/3+nki
         MPiaoyIsRmQ64mAns8cIWBD1ytmdGnuV08J6wl9mUHpAOeJhMBwCZ10EYZOfa3sJJRpi
         BOxg==
X-Gm-Message-State: AC+VfDyffquoFnHN1Lih/gSO5F9uZfxcGjJHtbuRk34aCfIceZXvDwPi
        pVITRv/Tpkv9Iw5Hr8iZdH73TE/2h6WR/sefSSY4cqWFGdnxeA==
X-Google-Smtp-Source: ACHHUZ7BNHpgezKbcz5lLcWq0RBHN4yLtXGC4W/ZgRoWfymz4jaa22gLyb4sBIK0iNjqPGrMzVQbNnnqKCxxnn+XYtw=
X-Received: by 2002:a05:6808:2a6e:b0:39a:b787:1aca with SMTP id
 fu14-20020a0568082a6e00b0039ab7871acamr3221982oib.49.1686541411663; Sun, 11
 Jun 2023 20:43:31 -0700 (PDT)
MIME-Version: 1.0
From:   Thomas Marsh <tmarsh.dyan@gmail.com>
Date:   Mon, 12 Jun 2023 09:43:19 +0600
Message-ID: <CAL66sUjTkm5fTaLwupGe1F2br+LjYgzBqh+uYu0qA=j2rLmABQ@mail.gmail.com>
Subject: Callbacks in io_uring submission queue
To:     io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

Hello. Recently I was busy making a coroutine executor. It was going
smoothly until the point where I needed to read from stdin. It turns
out that the default way to do it blocks the thread that executes the
read. This is not an acceptable situation for the worker thread which
should execute as many pieces of work as possible. I tried to find how
to do asynchronous io in Linux, but among the variety of things I came
across on the web, the io_uring appeared as an appropriate solution at
first sight. Sadly, soon after going deeper into the io_uring's
interface, I discovered that the only way to know about the completion
of submitted work is through polling. This appeared quite counter to
the premise of asynchronous io, which is to eliminate waiting on
things.
Dissatisfied with my findings I tried to see if any other os provided
a better interface, and I found one conceptually interesting
approach... in Apple's Metal. In that graphics framework, it is
possible to ask the system for a command buffer and then put in it a
user-provided callback, which the system will execute when it
processes that buffer.

Is it possible to put a callback in io_uring which the system will
execute without polling the thing?
