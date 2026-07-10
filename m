Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C05413D6F
	for <io-uring@vger.kernel.org>; Fri, 10 Jul 2026 12:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783685694; cv=none; b=ntRbjVl9ar3sLeHN5o4dy90tb+rQMfEy4+MDWrsJ7NjOecLXrMIngkZEnnsNGH+SXzdet02CaXXUyGP34evEvcWV9pRd9Nds35pHGdwHnhX5Unb+NprllemRUEHJgVssRqTj4RYsSdYl0kCcfYxchh2w6dsiMqiMYqjPj5p0daE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783685694; c=relaxed/simple;
	bh=MyW584d3sWFhR1Y2E1pNjyOR6P0Mq/KtTRdHvQpOWHo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=mRDRA5kBEb/kmYRaAOewozettaxY9/mlb5DZFcWHRKP/WribSXnbn1HNJm5/utV/KUji+wLpsiZuEvpxvEOLBzBO9go22/vW9pQGduadFkGKICOMkAxVv14vWPsjJpiS7vYc/i1ljSe3YmTH2s6ivochqaDgdPFePdP2CiUNsLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hjBkDYkw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hjBkDYkw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783685692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hFOFV8vk0sG3K6vLbWajJCJAOU4KJzrYi9j/8xLrN1c=;
	b=hjBkDYkwfb68A4oNSZCNKQmlsHCJ1Sp/jJS6W9wLuOypWG/PVf+qMEkrm0fDFul4/Ylc8D
	NhpPh+5e/5OvjrIIJs0F7sTHR91q/n2hRHGGibNbms+1Yrvt6lnDz1YRzPb+AD7AGKGyZ7
	pYqnovOUqNeNtQrYp7qSsHTqhFJTKG0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-235-unnTEMhxNq6QIyF0njy0Ew-1; Fri,
 10 Jul 2026 08:14:46 -0400
X-MC-Unique: unnTEMhxNq6QIyF0njy0Ew-1
X-Mimecast-MFC-AGG-ID: unnTEMhxNq6QIyF0njy0Ew_1783685685
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4DC4E18001F0;
	Fri, 10 Jul 2026 12:14:45 +0000 (UTC)
Received: from segfault.usersys.redhat.com (unknown [10.22.64.191])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AB75C195419E;
	Fri, 10 Jul 2026 12:14:43 +0000 (UTC)
From: Jeff Moyer <jmoyer@redhat.com>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Cc: axboe@kernel.dk,  io-uring@vger.kernel.org,  ammarfaizi2@gnuweeb.org
Subject: Re: [PATCH liburing 0/3] Convert manpages to markdown
References: <20260706214132.2841060-1-krisman@suse.de>
	<x49fr1vvvbe.fsf@segfault.usersys.redhat.com>
	<87y0fmhlnc.fsf@mailhost.krisman.be>
	<x49zf02vfbx.fsf@segfault.usersys.redhat.com>
	<87zf028ng8.fsf@mailhost.krisman.be>
X-PGP-KeyID: 1F78E1B4
X-PGP-CertKey: F6FE 280D 8293 F72C 65FD  5A58 1FF8 A7CA 1F78 E1B4
Date: Fri, 10 Jul 2026 08:14:41 -0400
In-Reply-To: <87zf028ng8.fsf@mailhost.krisman.be> (Gabriel Krisman Bertazi's
	message of "Tue, 07 Jul 2026 18:05:59 -0400")
Message-ID: <x498q7jf3da.fsf@segfault.usersys.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Gabriel Krisman Bertazi <krisman@suse.de> writes:

> Jeff Moyer <jmoyer@redhat.com> writes:
>
>> I don't have a strong opinion.  Either way, I'll be looking at
>> documentation and/or prior examples to make the changes I need to make.
>> :)  As I said in my last follow-up, it would be enough for me if the
>> generated man pages were simply part of the release tarballs (it's not
>> necessary to check them into git).  I'm sure that can be accomplished
>> with makefile magic.
>
> I considered that, part of a 'make dist'-kind of rule.  But
> there is the tarballs generated by github which do a simple
> git-archive. I don't think we can change them to run a custom command.
>
> We fetch our sources from https://brick.kernel.dk.  That seems to be
> generated by the create-archive rule, which we could patch.
>
> If github tarballs differing from Jens' server are not a problem, and
> you can use that server, I'm happy make it build through the
> create-archive rule.  Should solve the problem.

Yes, I use brick.kernel.dk.

>>>> At the very least, please make generation of the man pages optional
>>>> via configure.
>>
>> And this would be a necessary part of the solution, were things to go
>> that way.
>
> ack!

Thanks, Gabriel!

-Jeff

