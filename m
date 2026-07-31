Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861B319F121
	for <io-uring@vger.kernel.org>; Fri, 31 Jul 2026 00:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785456879; cv=none; b=SN3MEB+VeNVxoYD0eN/Eg7ZO6cKchshD7IIsQYuTDsV7q2UiJkOL85m3WHOKCuYmZ6j+xan7CLVLW8MSBUjR6AqtWn4ah8poBxON2dbp2aUPc+wjdg2ALftceqeEj9bYgJHuigqfLJqVHSY3ALNLOBgCc7Lwd/nHyxEjA30WoY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785456879; c=relaxed/simple;
	bh=MN7ge1T5lQ1JTVCub8CTaie64yF5EP52iawEc5weizk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ipW/4wMdXsKipMWy7cnEZIshy0/W/KiNe2YxhfOGJz4cxNyp2gSFoSPyhIyFF257/2/rCJnE3uHUMHRgsdteeHP1FUPc52GH3hDcg6rNWpdOJkLdAVv3AESQuzV1bEhThkGCVQBwrWBs6fkIh36SzO/6Cnb7O/NSX7O5yZp0hKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZOtBtupa; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZOtBtupa"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c197f968b3cso47411666b.2
        for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 17:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1785456876; x=1786061676; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QCTwPWTe36H8QlcoShrFPKk4L1n8utyt7k+WGp1VOEw=;
        b=ZOtBtupaUbCW04/GtbWmNTvregWKAfS2cWfMyHVlOQCPVmYLvX2DKlw7w7K8hG8Qcv
         NZ2BfhjMlwtvuV6nxX1xGvP57MNGviFan1pMOv6g3logA6HFrK545Y5VUbJwXW5L4QiK
         4d4POFloQLj65KWjI1Pb09BuODx4KxuBPj+Kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785456876; x=1786061676;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QCTwPWTe36H8QlcoShrFPKk4L1n8utyt7k+WGp1VOEw=;
        b=ctoAeeg8S4dqLLy1ZiiLPsHGax9qphgT/4uK35hs865GSrBO/0Qlht7vTiMnlVPQ6r
         p9NU9y81GYKTIEtFGmTTmvzKzwDH0d2dhPlHPBo1JQhMEAiYVtzBa8App94tVFcMDXw7
         I4Zmpp+oDTkPyv0W5vJ7n6JusCmSi14EdzqjPj0AkMtyRJqO4pl7pcrp/tfU2qm/Qbu3
         fADrm1SW/Wfis2bRvF+vLkwMgbw5fCsNYhBllqIua540tItPgKcQ+Vvn9lIcB25S+/oe
         wCTs/E6j1uMFrsru6VJjTeqZVME5ACSX7EkCy1nSDkDduy/7zGFUyt4/IE18gDeOYRpH
         j91g==
X-Forwarded-Encrypted: i=1; AHgh+RqzBq0uMqoaIc7wn2MuH+ImzKcC4ahO+SUBa5WPdK3OKe+w4ttd+falVHbP0yA2Tp5bz/zHY7XoQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxicQiaXEqzrS1m+ra2D5apXAgOy4wOwIa36aveQOWxaj4kvgY5
	5APCjkqQGGYI+4PobvGgOK/Djf1st7IVnG67m7q+F+XoyrleX82pt+brKlwsnUj+NHb2h6kXKwe
	Q2jYAye4=
X-Gm-Gg: AR+sD10t0h79WtNhN0nr8UWucnICTgPy0T8pNiVQnYxIdegl7VPxVFgqVLDu0BrsjS4
	j551H1wLamfGILaBiGjiUx4iLEl7SrNz0sQSILCGY+ifUzAXEDHbr1X3ZxvXL9AOO09SfJy7Y0o
	1M/L660+TjQ93XZ1QnQ6ygLbPwDZswqoNAp3mlYYTcA3tVPHLmlMVpW1OJFEL05qoErazHLNUmp
	EPIbmm0EOMjhjzlYbOmyii53HxmHmC4CUJl9aRaWM84Cayx0S3bubHK/T1k61faZ0aeUHxlbJS4
	LfDvtjsmn6/qL/7vfC3ZCi2sWlEaJKbdg26pRVbgDummTBiex0se2B7dt4Pds1CyH7CV+dn2wiQ
	yfkq5heoXwHdTAf6NaeECSTBZhSLkdmqggf5PVpPKbQHDfo05WJmTITROdbzZIrUw33A3MaTo5S
	AgZUW/ZZwpvl2LBWME+4YYXzwqGzjBWbZ6DMyJAljM68S9fOu9/fqsgQoHMl3TSox8/NdkxvAQu
	lHjtgVYuCbKtGQBqHJKVS9J2Iemo2oi7/CG/w==
X-Received: by 2002:a17:907:94d1:b0:c16:71b:7f02 with SMTP id a640c23a62f3a-c1fa58b4432mr249415566b.56.1785456875616;
        Thu, 30 Jul 2026 17:14:35 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa85768ddsm119753266b.15.2026.07.30.17.14.33
        for <io-uring@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 17:14:33 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c1c4c7ddaf6so45560266b.3
        for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 17:14:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoA+NGxOTgnbxArmC/lBlSnBnUCp7NsJL7DpsRTYT6cLYbHZF/RHKQPgiI4Zdxv/ACC2aU62f7RQQ==@vger.kernel.org
X-Received: by 2002:a17:907:97d1:b0:c16:29eb:e81a with SMTP id
 a640c23a62f3a-c1fa56df16dmr245684466b.29.1785456873638; Thu, 30 Jul 2026
 17:14:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <amtbpwrhlNGJ9OK6@redhat.com> <amtbxpqJ3pZwyT8D@redhat.com>
 <amteY30qxRuPzFh3@gmail.com> <amth6owVUdVOmyAL@redhat.com>
 <CAGudoHE=GjMRKGbip8nRUm34VUud_YSqGZJrfr+Vz6Qu22Mdaw@mail.gmail.com> <amu1i8rzQ3hZ-vAu@redhat.com>
In-Reply-To: <amu1i8rzQ3hZ-vAu@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 30 Jul 2026 17:14:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiUWQdiHbH9s4XKnYZwRs5vR1Azq83V4scN+N-w-VFRng@mail.gmail.com>
X-Gm-Features: AUfX_mz5zon_kbqMfY60s241UG4SIgEzvMbb41Bh6TGn6yZhyVsZ-jzWpF_8les
Message-ID: <CAHk-=wiUWQdiHbH9s4XKnYZwRs5vR1Azq83V4scN+N-w-VFRng@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] pipe: only enable the extra wake_up(rd_wait) for
 edge-triggered consumers
To: Oleg Nesterov <oleg@redhat.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>, Breno Leitao <leitao@debian.org>, 
	Christian Brauner <brauner@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Pavel Begunkov <asml.silence@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Alexey Gladkov <legion@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Jul 2026 at 13:35, Oleg Nesterov <oleg@redhat.com> wrote:
>
> Again, contrary to the current comments this is not Epoll-only...

Sure it is. As far as we know, only epoll has ever *cared*.

Yes, you can show the semantics with io_uring, but do you have a user
application that actually cares?

The only reason that ugly hack exists is because we did have that
break user space. If we can get rid of th eugly hack for io_uring,
that would only be a good thing.

So this literally *should* be about only epoll unless you have a
report that io_uring users are equally broken and use that
shit-for-brains notion of edges that aren't edges that nobody sane
should ever use.

               Linus
