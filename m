Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7512FC433F5
	for <io-uring@archiver.kernel.org>; Tue,  8 Feb 2022 15:24:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353706AbiBHPYT (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Tue, 8 Feb 2022 10:24:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239854AbiBHPYS (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Tue, 8 Feb 2022 10:24:18 -0500
X-Greylist: delayed 1538 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 08 Feb 2022 07:24:18 PST
Received: from cloud48395.mywhc.ca (cloud48395.mywhc.ca [173.209.37.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0491BC061576
        for <io-uring@vger.kernel.org>; Tue,  8 Feb 2022 07:24:17 -0800 (PST)
Received: from [45.44.224.220] (port=44102 helo=[192.168.1.179])
        by cloud48395.mywhc.ca with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <olivier@trillion01.com>)
        id 1nHRx0-00038r-Av
        for io-uring@vger.kernel.org; Tue, 08 Feb 2022 09:58:38 -0500
Message-ID: <21bfe359aa45123b36ee823076a036146d1d9518.camel@trillion01.com>
Subject: napi_busy_poll
From:   Olivier Langlois <olivier@trillion01.com>
To:     io-uring@vger.kernel.org
Date:   Tue, 08 Feb 2022 09:58:37 -0500
Organization: Trillion01 Inc
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.42.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cloud48395.mywhc.ca
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - trillion01.com
X-Get-Message-Sender-Via: cloud48395.mywhc.ca: authenticated_id: olivier@trillion01.com
X-Authenticated-Sender: cloud48395.mywhc.ca: olivier@trillion01.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

Hi,

I was wondering if integrating the NAPI busy poll for socket fds into
io_uring like how select/poll/epoll are doing has ever been considered?

It seems to me that it could be an awesome feature when used along with
a io_qpoll thread and something not too difficult to add...

Greetings,
Olivier

