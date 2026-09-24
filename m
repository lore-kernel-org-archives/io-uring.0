Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BF546AA8B
	for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 18:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790273367; cv=pass; b=Lcogh692vfR0Gyrtt7kDLaV3+mP1tunRv9X/qp1wQYwckMGaHRPS7GHKl61oRfZXeJ/+bfnNDbVJ7oBU2vG+p5HoSQopjxKUe7YANJz4xqvbneqKio74jprmWIr3i9CNgyPqfEky7aWh5NjN1oQDBL859keIhYRjRyrC4FSsAtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790273367; c=relaxed/simple;
	bh=2EkFOHbtczJ25xIy9v+cbiIrZHbSfV+/ZFifSdlSvm0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Kue+AnzZLFC5jpAAsDMF5RSxLbMBRk+2j9RxpM/oJJTS4J/XnWLeoOyH46bv9XeLGaMMQkOXGO4rq+2rAQOxG/xFN+C6nIF3T4pfvDnqarPK46m65K7Md4iu80sDg3VWv0KSPcGTrVRStrg6jUt5vBVqcy1tWx4z7pIksc1zB6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NcFtfn/+; arc=pass smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NcFtfn/+"
Received: by mail-oo2-f39.google.com with SMTP id 006d021491bc7-6b1ae6b200fso107298eaf.1
        for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 11:09:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790273364; cv=none;
        d=google.com; s=arc-20260327;
        b=nYeNFLVgQh0yw1abfDoKfpm1opeirkAODnWoxxWaSQrFGQoTrvfKbGPExw9h3gpQ2o
         Cza+UwRB9rUZ3JN7fgT2IMO2dTn9Osog9/y6gIqT5RgmE78hnxMXsPR+7qAHxdwFKU/I
         HCSnYTESs80v6tWc9idVDAn/TiVbbco7QUIIM+wI20n0rFPrLC+WZeGlsndqOv7zJvAP
         SoG59/BsWhWVLxqC31mxTWIT59H+QhOV/F+biMimbwMB6Gwak4BG25fgYxb8vBaQAUNY
         5gOIndbZIcLQbFon17rtxQvDAQIR0PuGC89m1nbNjyGt+0ygG1bem+xSviKnkwQzfpzA
         NvqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=2EkFOHbtczJ25xIy9v+cbiIrZHbSfV+/ZFifSdlSvm0=;
        fh=36jcj/+NZwuQxJoODN+AsVleiqrdJeCtrpNeL3thujc=;
        b=Nys16QtP3h0THVD2CeCfYONWlsHb0+dRxBB58GAWHNxuo/k62AFba4JXZmPmdp78tz
         NG8uKd/fehJNTq6WZsmquMAJbV9I3gJJE601ZBggpRk4Oo5qAd3YOvCZh4BYTlXZdg/A
         k2+8vs+hufcpDUZNlKM0rlscysVTYG2mUd4nRdUgNyhC509onm4RiwlDHflkpRVLD3cI
         1IW50qNrN9+2EtuwS0Sz2fNkwlgYXkIET0KEGzg/kbyLV+jRjjQXnB34R/VTy1C4leKr
         2aFjuZ12n/f8xUR3fm2X4jb9OIWegq4mN60vUpi+9K45FWLZH7mc9phqrNePjYmuxwPj
         nH/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790273364; x=1790878164; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2EkFOHbtczJ25xIy9v+cbiIrZHbSfV+/ZFifSdlSvm0=;
        b=NcFtfn/+Jxow3K8bNArOLLr2cZfJRbIwMl5c3X9CCd0ZoZKr8ewqPuaGDrWd3KYxy8
         cmEw+McSe0AJDtPWEgwk8QPc0kKa8vu/cFc5H++CJQCvQ+5g7DtFieAYF95XVbkkIbqB
         9gL7vEhSU70muCzUk1G/JbXMhZFjwVQ0iHAMjPdTVUieZ17K27timh4xLI7NTIWAJi3V
         z7S67DCYz3f3jSQn1aGKHiexsUzI765s+SchzKD7rD1I/r6PoGHGc98MFfaEQaylU9Uj
         Hh2D8gtoGqjR0m435lhP21R2aaCqCxEKLd193EhK4pK6ChAtAub2cTqLWUE/qR2Vwt+9
         Nd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790273364; x=1790878164;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2EkFOHbtczJ25xIy9v+cbiIrZHbSfV+/ZFifSdlSvm0=;
        b=ZtyTcQqs+/1lw9ELJxL63NGeRKf3ejFYd5npIvGyN6eKjrgPl5u9rJWHJkNIHFN5C2
         z3F1wDDUgz3rYqHV2QsQBfxqmjxADcEUMRQtdJeRp3r5M9dV00sgcesAiV6NyWaCMpET
         gIIdeyYFLokSOSffd1vCpSSpifokA37bQt+Qb081uD/BducWtT8wbgoTuenyZaTTcIVN
         ZAQzkgo6X5L2suMx+Hy00mPrz4M1tYpe2QTq/aED+Bw8kshk/sp0MmO7+qLpsM6eV2sJ
         GNfWagJ9dCCNjOeYFBxlyN5qLskG1J1+Q9yNSKI+tR4g0GzcAoamvWLvxtiGG3t7YGmp
         SkUg==
X-Gm-Message-State: AFuF++nEADEQGHG1aXg/7n61huKY+TX/QY1p8KXThGIsTiD12F7noc7B
	zFNSCMSh3TeBymoF13xqUwvYGSDLvYb6QD17kGefc07ZHpVRlPhHaA+Mo5iAuwbfPP2yZfpQ9j4
	+TLauk2kivUvhiL6vKietYY6AVD4UI9CirSpPquM=
X-Gm-Gg: AYBFou3W47aqVJlhFnWWordFVmdYNIKkp65f5/LWIg2lFM/hd8vBwRDF0YNiIfodsHh
	8LmR4+UCk5kPpITje4ANZB4DGjXN7Bw2iqELX9sA+fAgovum8luHoO5avHBY0arRPWGNzOfOYxR
	eHpEtD5DXzBdTZZGFIoYr1dXsQehD++8QLDKA3tKnTLk4fVggfKCkBBo8lLGK9cZOP4eKhYPGRJ
	HOGZQyDC8OuHU/HDWbp07DMl2uRqWFW2s4WRMIpuS+CEc0bgkD3p3tTBrHQktYrl7/UUKZUjM9S
	HASW53Yl45yOa0RWH53oPWL26x3mKvO+GVdneAWeIZgo5TZ05BEM6fkN1zAg1FAxQd+UZrHhgys
	NGV9+1TYNNX7V202SDwBW4Q==
X-Received: by 2002:a4a:e911:0:b0:6cd:3fcc:96cd with SMTP id
 006d021491bc7-6d440727618mr2876058eaf.75.1790273364474; Thu, 24 Sep 2026
 11:09:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: David Kahurani <k.kahurani@gmail.com>
Date: Thu, 24 Sep 2026 21:10:17 +0300
X-Gm-Features: AclHuK-UFtDLQMsV18Y4wTPBabatIQ__XOC0_s6nwPVOifgFG4IFCTOuHeX7SZM
Message-ID: <CAAZOf26tZiTZLsh1717muAospPb95HHAcxqLq0_qmL850+-oPg@mail.gmail.com>
Subject: Other user-space threading issues
To: io-uring <io-uring@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, tglx@kernel.org
Content-Type: text/plain; charset="UTF-8"

Just replying to this :
https://lwn.net/ml/all/20260911154148.644489-2-axboe@kernel.dk/ but
because this thread is locked on lwn.net I will do it right here :-)

...............


I know you do ask for this and this not part of the review to the
patchset it responds to. However, I think this is important enough to
append here. At least for FYI purposes.

io-uring uses a file model and a file model, from the looks of it( not
something I have a lot of experience with), seems very leniet in it's
security model especially from a user-space perspective. For instance,
there's no way to restrict a process from reading data that belongs to
another process, if the socket is shared. This is obviously something
that is probably common across all files. In other words, a shared
file could possibly be generally said to be, insecure. I don't know
for sure.

io-uring has file_table construct and a buffer concept. These are
additional concepts to a filesystem file's private_data. At the same
time, these objects and members of io-uring will get shared when the
file is shared across processes.

The above obviously introduces additional security and possibly
*memory* concerns. If one process for instance setups up an io-uring
and add somes files into the file table, then the ring gets shared
with another process, then and now this second process has access to
the contents of the file_table and possibly files that the first
process didn't share with it. In fact, the second process can now even
close files that were opened the by first process and then saved to
the file_table. Just essentially putting, the second process now
essentially has total control over files that belong to the first
process. This and vice versa.

The same thing applies to buffers. In fact, just going with the
scenario above, whereby we have a first process and a second process
and the first process configures buffers then shares the ring. The
second process can for instance, add buffers to the head of the buffer
list and each time the first process grabs a buffer from the
buffer_list then this buffer belongs to the second process; the kernel
doesn't know this and proceeds to write to the buffer and eventually
the second process can now watch what is happening in the first
process and the first process is denied access to it's data,
effectively. This could be a bug even in a normal / ordinary consumer
operations where there's no malicious users at all.

At the very least, the above are at least issues that are mostly
fairly inconsequential and probably ill described but, still, I am yet
to come across io-uring code that works around these problem(s).

Anyways

..................
