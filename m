Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8167B2E718B
	for <io-uring@vger.kernel.org>; Tue,  7 Jul 2026 18:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783447982; cv=none; b=LfltDGU9Xpd+sMlTYpqhl44oqhoOdI+4Uj2qBjUuDxhANB2UTOau79CvJGyW4H1wgAffUdCe/UXBYnzQLDiWuX3jXDOmrWxb3Y/WpJov+rGHamBytsGQhrYlJhVpT1SBcBAPXl/6n5rjOd255CnJAtupje2zMwNKtTBafEYgfm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783447982; c=relaxed/simple;
	bh=DoQNKmWKA1yiL0oKKpLLl2KvpkQrgFXjEex2At4imbQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=nck6vbN5E+4psNyoz3V0NxgiF7lSPkYUCvGWE5+m1/Lqu9nCQFiDdyTbuWtDkI2X7/1MKTxkbxL6qEif7k0VnVW1XfUmiXac14zkl1+bUPnRdjMhJKQ6f3SNgNaUVKzhq1TvRJcaNIl1F1GeVMh7WXQEIr37zl4Gue4AEYyEH3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HC7dZa+4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HC7dZa+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783447980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0saS8hhTMnyAhiWHNRQeaGa2MnrZwF1yIrMCsQfrZVQ=;
	b=HC7dZa+4accK4jssWLbxxXxoht5VMj61j3L0F+dc1DSXvedAa1/MnEFN7MTcJe5zSWmE1M
	If41rGDWXr+/sjGyJINBsE71v6EsAbXR96n7LI3SjGeQFQyDSsq3rSqhvCxoqsAsnhaQXo
	Vklq/wbl4W/7aMYv5xiDm3O+FzyvWLo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-34--cOJVda_OVOhEnSl21Iqag-1; Tue,
 07 Jul 2026 14:12:55 -0400
X-MC-Unique: -cOJVda_OVOhEnSl21Iqag-1
X-Mimecast-MFC-AGG-ID: -cOJVda_OVOhEnSl21Iqag_1783447974
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 560DB1809C88;
	Tue,  7 Jul 2026 18:12:53 +0000 (UTC)
Received: from segfault.usersys.redhat.com (unknown [10.22.80.166])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2D7A73000C1E;
	Tue,  7 Jul 2026 18:12:52 +0000 (UTC)
From: Jeff Moyer <jmoyer@redhat.com>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Cc: axboe@kernel.dk,  io-uring@vger.kernel.org,  ammarfaizi2@gnuweeb.org
Subject: Re: [PATCH liburing 0/3] Convert manpages to markdown
References: <20260706214132.2841060-1-krisman@suse.de>
	<x49fr1vvvbe.fsf@segfault.usersys.redhat.com>
	<87y0fmhlnc.fsf@mailhost.krisman.be>
X-PGP-KeyID: 1F78E1B4
X-PGP-CertKey: F6FE 280D 8293 F72C 65FD  5A58 1FF8 A7CA 1F78 E1B4
Date: Tue, 07 Jul 2026 14:12:50 -0400
In-Reply-To: <87y0fmhlnc.fsf@mailhost.krisman.be> (Gabriel Krisman Bertazi's
	message of "Tue, 07 Jul 2026 11:20:07 -0400")
Message-ID: <x49zf02vfbx.fsf@segfault.usersys.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Gabriel Krisman Bertazi <krisman@suse.de> writes:

> Jeff Moyer <jmoyer@redhat.com> writes:
>
>> Hi, Gabriel,
>>
>> Gabriel Krisman Bertazi <krisman@suse.de> writes:
>>
>>> This obviously adds a build dependency on pandoc, which is already
>>> packaged by any sane distro out there.  The configure file is updated to
>>> check for that.
>>
>> I guess RHEL is not a sane distribution, then.  :)  pandoc was abandoned
>> in favor of ghc-pandoc, and RHEL does not ship a haskell compiler.
>
> Oh, that is a bummer!
>
>> It would make RHEL packaging considerably easier if the generated man
>> pages continued to be part of the upstream git tree.  If that's not
>> acceptable, then I can work around the problem, but it will be a pain.
>
> I suppose we'll have to keep them in-tree, no way around that.
> RHEL is unlikely to be the only problematic distro.

Well, RHEL is often an outlier, but there are derivatives that will
likely also see this issue.

> The question is whether we want to do the md conversion at all and have
> both in-tree or just drop this entirely.  On the bright side, Markdown
> is much easier to write, but duplicating the sources can make them go
> out of sync.

I don't have a strong opinion.  Either way, I'll be looking at
documentation and/or prior examples to make the changes I need to make.
:)  As I said in my last follow-up, it would be enough for me if the
generated man pages were simply part of the release tarballs (it's not
necessary to check them into git).  I'm sure that can be accomplished
with makefile magic.

>> At the very least, please make generation of the man pages optional
>> via configure.

And this would be a necessary part of the solution, were things to go
that way.

Thanks!
Jeff

