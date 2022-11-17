Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D951EC4332F
	for <io-uring@archiver.kernel.org>; Thu, 17 Nov 2022 19:49:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240446AbiKQTtn (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Thu, 17 Nov 2022 14:49:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234917AbiKQTtm (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Thu, 17 Nov 2022 14:49:42 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD79F88FA9
        for <io-uring@vger.kernel.org>; Thu, 17 Nov 2022 11:49:39 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 6C94C225CF;
        Thu, 17 Nov 2022 19:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1668714578; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=EUkrrY4jjWoZ4UVPFHeEB5wfSiKL3bXZYXqgu7rxOUs=;
        b=vQnt5X3vXzWB2ubjRHGEcCvsC4WUkrvcLJCaIA2LTIgBV7gqrOD7bTw+yMi01fU9qZ1F19
        mrgLkrLcBthD32VrWojTdBxXhpxYKijF3LREnfWfMw9meWa1QP28SJzcfkkg255l+4Ewxo
        n+a2+I9lWhB4CiaADkfdv1v5vDGIoUc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1668714578;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=EUkrrY4jjWoZ4UVPFHeEB5wfSiKL3bXZYXqgu7rxOUs=;
        b=0xBgqS/tvVqWs3mqJVaHr63rwKRUSbrJiyP2Z72A6sXn0hPCiM7WPyo1e3HM64PhXWadWS
        2PsatHiRFWiCK2Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E7AB013A12;
        Thu, 17 Nov 2022 19:49:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id j35LLFGQdmPfAwAAMHmgww
        (envelope-from <krisman@suse.de>); Thu, 17 Nov 2022 19:49:37 +0000
From:   Gabriel Krisman Bertazi <krisman@suse.de>
To:     Pavel Begunkov <asml.silence@gmail.com>
Cc:     io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH for-next 1/1] io_uring: inline __io_req_complete_post()
References: <ef4c9059950a3da5cf68df00f977f1fd13bd9306.1668597569.git.asml.silence@gmail.com>
Date:   Thu, 17 Nov 2022 14:49:33 -0500
In-Reply-To: <ef4c9059950a3da5cf68df00f977f1fd13bd9306.1668597569.git.asml.silence@gmail.com>
        (Pavel Begunkov's message of "Thu, 17 Nov 2022 18:41:06 +0000")
Message-ID: <87mt8pwecy.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

Pavel Begunkov <asml.silence@gmail.com> writes:

> There is only one user of __io_req_complete_post(), inline it.

Probably already inlined by the compiler, so shouldn't be a problem.
Feel free to add:

Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>

Thanks,

-- 
Gabriel Krisman Bertazi
