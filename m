Return-Path: <io-uring-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6DD8C761A6
	for <io-uring@archiver.kernel.org>; Sat,  1 Apr 2023 00:05:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233166AbjDAAFF (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Fri, 31 Mar 2023 20:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233396AbjDAAFD (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Fri, 31 Mar 2023 20:05:03 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D595901C;
        Fri, 31 Mar 2023 17:04:53 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 34D7021A89;
        Sat,  1 Apr 2023 00:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1680307492; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Okwnr5qauASHAsEFw1/R6hIbFinf58P4KeKuOuyDC8s=;
        b=TX46C1dQTO9lgGzXXjdlcIcH5Ny/YS1+HeVUfOdQhwsDLRIY0/SALE1KlmQSuLzluTt0b+
        tS8OHlXfHGzYHNRvK8XpmexsROVUiIqLI0mZRi1W5eb/5kc4aLia9XTLnc2U4B3VzqM0ko
        R6yIopHQgZ8uGD5Z9CDvVvsuwabKBsU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1680307492;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Okwnr5qauASHAsEFw1/R6hIbFinf58P4KeKuOuyDC8s=;
        b=IPxozgKTw3NH//wQSo1bSnKWB+qf5WXWBFVe4DUVTpiVZaDhx8wRwKG+BbydGQMLJJG9yq
        +8OUIRaAmDVtRNAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A4B43134FB;
        Sat,  1 Apr 2023 00:04:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id Ok/EGyN1J2RHZQAAMHmgww
        (envelope-from <krisman@suse.de>); Sat, 01 Apr 2023 00:04:51 +0000
From:   Gabriel Krisman Bertazi <krisman@suse.de>
To:     Pavel Begunkov <asml.silence@gmail.com>
Cc:     io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/11] io_uring/rsrc: cache struct io_rsrc_node
Organization: SUSE
References: <cover.1680187408.git.asml.silence@gmail.com>
        <7f5eb1b89e8dcf93739607c79bbf7aec1784cbbe.1680187408.git.asml.silence@gmail.com>
        <87cz4p1083.fsf@suse.de>
        <6eaadad2-d6a6-dfbb-88aa-8ae68af2f89d@gmail.com>
Date:   Fri, 31 Mar 2023 21:04:48 -0300
In-Reply-To: <6eaadad2-d6a6-dfbb-88aa-8ae68af2f89d@gmail.com> (Pavel
        Begunkov's message of "Fri, 31 Mar 2023 17:27:45 +0100")
Message-ID: <87wn2wzcv3.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

Pavel Begunkov <asml.silence@gmail.com> writes:

> On 3/31/23 15:09, Gabriel Krisman Bertazi wrote:
>> Pavel Begunkov <asml.silence@gmail.com> writes:
>> 
>>> Add allocation cache for struct io_rsrc_node, it's always allocated and
>>> put under ->uring_lock, so it doesn't need any extra synchronisation
>>> around caches.
>> Hi Pavel,
>> I'm curious if you considered using kmem_cache instead of the custom
>> cache for this case?  I'm wondering if this provokes visible difference in
>> performance in your benchmark.
>
> I didn't try it, but kmem_cache vs kmalloc, IIRC, doesn't bring us
> much, definitely doesn't spare from locking, and the overhead
> definitely wasn't satisfactory for requests before.

There is no locks in the fast path of slub, as far as I know.  it has a
per-cpu cache that is refilled once empty, quite similar to the fastpath
of this cache.  I imagine the performance hit in slub comes from the
barrier and atomic operations?

kmem_cache works fine for most hot paths of the kernel.  I think this
custom cache makes sense for the request cache, where objects are
allocated at an incredibly high rate.  but is this level of update
frequency a valid use case here?

If it is indeed a significant performance improvement, I guess it is
fine to have another user of the cache. But I'd be curious to know how
much of the performance improvement you mentioned in the cover letter is
due to this patch!

-- 
Gabriel Krisman Bertazi
