Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1BEFC433EF
	for <io-uring@archiver.kernel.org>; Tue, 15 Feb 2022 01:15:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232458AbiBOBPV (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Mon, 14 Feb 2022 20:15:21 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231664AbiBOBPV (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Mon, 14 Feb 2022 20:15:21 -0500
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [IPv6:2607:5300:60:148a::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30C3B1342C4;
        Mon, 14 Feb 2022 17:15:13 -0800 (PST)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nJmQx-001q8Z-Vt; Tue, 15 Feb 2022 01:15:12 +0000
Date:   Tue, 15 Feb 2022 01:15:11 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Stefan Roesch <shr@fb.com>
Cc:     io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        kernel-team@fb.com
Subject: Re: [PATCH v2 1/2] fs: replace const char* parameter in vfs_statx
 and do_statx with struct filename
Message-ID: <Ygr+nzDK6ft6LXfG@zeniv-ca.linux.org.uk>
References: <20220215002121.2049686-1-shr@fb.com>
 <20220215002121.2049686-2-shr@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215002121.2049686-2-shr@fb.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

On Mon, Feb 14, 2022 at 04:21:20PM -0800, Stefan Roesch wrote:
>  {
> -	return do_statx(dfd, filename, flags, mask, buffer);
> +	int ret;
> +	struct filename *name;
> +
> +	name = getname_flags(filename, getname_statx_lookup_flags(flags), NULL);
> +	ret = do_statx(dfd, name, flags, mask, buffer);
> +	if (name)
> +		putname(name);

... and the same comment goes for this one - getname... does *not*
report a failure as NULL; it's ERR_PTR(), and putname(ERR_PTR(...))
is an explicit no-op.
