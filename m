Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D7C3B3C19
	for <io-uring@vger.kernel.org>; Mon, 17 Aug 2026 18:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786990466; cv=none; b=rf+RET7T7/yRGpmgJKVLYMa/JJZXes35+uODeZGQ0FoUu8waFTkMBbkBzrs+C88bCzNvIuM4HlqVfWR8x2PirvybTLBEl5mx8dFAG51W4oMkCjAPMuXCYDUsAKfMC4v2RCxgGKG6bBtk5u40fDUwmeKsKKmC4Ipop2mUHwFg490=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786990466; c=relaxed/simple;
	bh=ao9m2sLvbtNitvCpUq+Gv1OifNM6AgmqBnJ0gntYEVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPED9WPDw0G65f21PnZ8jdm6KGq3YiMD0YIm4cLbYiAX+BJJH3qOHrKhlqEiKP9ugBnOC5/89jEXBY5igl3jydvp+uVLVe9ewxvEA6XflRWciwV4bTLhXipj4zm/NtriM37sNmNv7E5BRmDm5jkpV7fBF7fyWosS8nNQRUSTZC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=qFP9GyxO; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="qFP9GyxO"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c08df8513so20513481cf.3
        for <io-uring@vger.kernel.org>; Mon, 17 Aug 2026 11:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786990461; x=1787595261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AhYnEHSrQOfQP14QlDp7s2GCgdzZ6d9RZ1i39j+Wq9Y=;
        b=qFP9GyxOxrsgDi9Ctm40p+jaZqUb550Lcko2pdBHJ+4wYoE5/a6vePAzZXeFWEueB5
         fuEOv0e8g5XFVYL0TbH+nRizrdb/Zb/LZtSbJW+CarMf14qyWoHobOqW3jTFD3su55d3
         YxEXd3okmktpe4Z8jPz6YSpF2f1KfONocVBQJKRUeAjPQ140vD7Y38omVgVlmb0HH979
         QpfATP3XoTkSdbjrht8v1vclheWTCAswY5svcWc+29mKiCDBNXt10VcKUxZfjPapozq+
         lMpP1GP9XQVmuyYjI+Ume/BAapqzL5YU7HyLvU6Zu0xTtVuMaJp/ZIJyZsF91UwIIuvH
         bhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786990461; x=1787595261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AhYnEHSrQOfQP14QlDp7s2GCgdzZ6d9RZ1i39j+Wq9Y=;
        b=ks5idPsSchBNHqBSD6m5fJ/1TAaz+1DIHQNnSPWZzyZGdpxsf0DynzDsNfSMFelOhy
         3fQmoousqbCsZbjO6mGoUmc3U0PCTOlep+ERYMdREQMFnRBksRNzWj0PNYtKrbmyh65W
         CYh6kVBKkwC0UrimDFeYpwWIptKPWGEruUV6WgK+iDdaKafVXI1W4qFLI7Lf2fthss4V
         BVTyU6OvpmcIRyEOmdz3ySJFWnXvLibaMO5DkMhuI+1ObbxcmEmpqymJJk4ZUoLMnfIz
         eXZwrLNNOn/EaC93mtr5j5XtWlM2XAL8iwKtEMWuvkhirzFIsxEf/DG65gFSo9HJGJmv
         KHUA==
X-Forwarded-Encrypted: i=1; AHgh+RqU079AN73Nqnqrxs/yReYbb1H6p+3x/YG+Z9d7BZFrRmBf6ogECFy3Vd2b2nvf8tLVUwohn0qALQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YygE9LUSL9EJY+j77oU+FSp4ghr6CK/ysQT192uLjaC/rR2Mqqx
	4w94Q/jiKKeCIyGbvMHZFKwoTSJ81XZicLA1gnfzzo1ARYfu9rg05LBYBT9oLk/30A==
X-Gm-Gg: AR+sD138/I+1bf8wydatWmWRhl+3BG+dJkuSmneHOvfjZmbfp4yjRthfdyhypnU8XWa
	uuqgzeGE1g/p4AMGORzNrQp6D+Qt0yRC/fhSmyY6SO2z3flrpqngSjFDl9MuZNdega44SZVZSnl
	X4V9OXBC1xREnWhkuuoK2WdUfqKtUMmuSNECgEhqRpWLsIpkAFln5D9zXl2HClOcZ2ifRWjBezE
	ulFFL5ser1KFNmNM/bt69/mHGClkfOqRMiDiLsLjVuX61qya7LCTcPOSEeHKGD7n/FTLk3zTA7X
	zqPBtAPVixKa17rC1UXGTn+wdPqK9S1q2z1cbS1tP2MNbahvMzJpe3M5daTKj7hg8CHckdRxW2n
	7hH48qeguFyyG195T4x1Sbs2AW3osM3AJbfjtVm8yKircvvwLvEiHIie7dV1Q3egp1UhS2IUj8i
	mohib2XlKPdfLlAGuDOZbdzhKCbkT2Cu7tacd5HF6sJ4gAtRHwDQO/dpZ41S86Yjhe1U9zABETr
	2ytRNfmrLofmdmJFHjBestbN6wn/iJyFkNITttlVTk=
X-Received: by 2002:a05:622a:2445:b0:528:3d62:16c8 with SMTP id d75a77b69052e-52d854a46f0mr317463501cf.31.1786990460710;
        Mon, 17 Aug 2026 11:14:20 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c4580f7ebsm14450746d6.5.2026.08.17.11.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 11:14:19 -0700 (PDT)
Date: Mon, 17 Aug 2026 14:14:17 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: syzbot <syzbot+df9e891bf8ea586f846b@syzkaller.appspotmail.com>,
	asml.silence@gmail.com, axboe@kernel.dk, brauner@kernel.org,
	io-uring@vger.kernel.org, jack@suse.cz, kartikey406@gmail.com,
	kees@kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, mjguzik@gmail.com, nogikh@google.com,
	syzbot@kernel.org, syzbot@lists.linux.dev,
	syzkaller-bugs@googlegroups.com,
	syzkaller-upstream-moderation@googlegroups.com,
	torvalds@ppc970.osdl.org, viro@zeniv.linux.org.uk
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in ep_open
Message-ID: <16741050-a3e2-4193-bfca-232a615a1311@rowland.harvard.edu>
References: <34e65096-8827-470c-9a88-8c643cccef22@rowland.harvard.edu>
 <6a8338ea.dbb3a75c.20434b.006a.GAE@google.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a8338ea.dbb3a75c.20434b.006a.GAE@google.com>

On Mon, Aug 17, 2026 at 09:38:02AM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> 
> Reported-by: syzbot+df9e891bf8ea586f846b@syzkaller.appspotmail.com
> Tested-by: syzbot+df9e891bf8ea586f846b@syzkaller.appspotmail.com
> 
> Tested on:
> 
> commit:         8d3ae592 Linux 7.2
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ v7.2
> console output: https://syzkaller.appspot.com/x/log.txt?x=16a91a25580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=c44651ea7dd2f307
> dashboard link: https://syzkaller.appspot.com/bug?extid=df9e891bf8ea586f846b
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=15790679580000
> 
> Note: testing is done by a robot and is best-effort only.

Greg:

Has this patch ever been queued?

https://lore.kernel.org/linux-usb/ee41fbfd-f368-4a06-95d6-ae9b4267fd82@mail.kernel.org/

Looks like you can add syzbot's Tested-by: tag, as well as my Acked-by:.

Note that a different patch to fix the same problem was submitted here:

https://lore.kernel.org/linux-usb/20260731230603.4637-1-kartikey406@gmail.com/

IMO the first patch above is superior.

Alan Stern
