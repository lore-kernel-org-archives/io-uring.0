Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40083EDACC
	for <io-uring@vger.kernel.org>; Thu,  9 Jul 2026 09:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587794; cv=none; b=KXMa4VwSTbPGV3TWTcOLum2Mwn0Ua4skg5zH3c/KCi76LfL0adg4IwWzp2mCT5Uimcis10vrPHRqXbuZScf4D5l8PeThFjcsyrGTk5fcqeh0g1a6Qy9jzvDpZWkPCmvuBQGBDVDdKdAK6ojDG321GayeQC4/5TtH5Ie2YGY7Fpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587794; c=relaxed/simple;
	bh=HZt2iungDBYDLP/rTlSbIxmzPrD8PxZAZfHX4nnzqC0=;
	h=Cc:Mime-Version:Date:Message-Id:To:Subject:From:In-Reply-To:
	 References:Content-Type; b=C4+4f9VEsmy5DDjPYNBBHgKRNSDpJpRAe11u9Z3Y0qjHlzbjVGBMLm1SnG9hCXk9tWU5OuugxGSKViK4d6SQLYw0tgvTXneq/E59ERA4s/sLjmVltux9jnVXbrwcwDoMy+RegIExtzBRIAHBTpPvu4ll8zGE16zyNld8x7ZD+Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=MeUqw1zd; arc=none smtp.client-ip=209.127.230.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="MeUqw1zd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1783587783; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=HZt2iungDBYDLP/rTlSbIxmzPrD8PxZAZfHX4nnzqC0=;
 b=MeUqw1zdJPTDbam09jxlp+xJDnSvu+j+YiCJgA/C4I1yz3VhognWL/ORDfGyiYsLVLJXbn
 kcJveeQgA1boqgO8KzjWP1tgCPKBCNTJgpQfWDX9gIQyAvUh2e724on5C4VwIcosVpatC5
 yhFleYHwKRoncllS64khCiPL2noDSzN4S3N1zU/egStbQxEXbQPvRdBZ2njAbnFXf7BcLJ
 t+1uDTKoA7DCS4n9lXnxlz8CxmUgt9k1x4EvDp40CL/GRV6R9VD7eN4zkdZMXAFYlQIy0B
 NjfJlnl68n7rEwMP17suU28bDXAHLrE3KWRAndjDkGNRUeY3Q1309j2KU6AecQ==
Cc: "io-uring" <io-uring@vger.kernel.org>, 
	"linux-kernel" <linux-kernel@vger.kernel.org>, "axboe" <axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Thu, 09 Jul 2026 17:02:58 +0800
Message-Id: <d9210bcdf73fbe1ac8b6ec132865609a3ed68688.d5a91db4.0585.4d41.9906.f471ca9a7118@bytedance.com>
To: "peterz" <peterz@infradead.org>, "rostedt" <rostedt@goodmis.org>
Subject: Re: [PATCH] io_uring/io-wq: avoid repeated task_work scans during teardown
From: "changfengnan" <changfengnan@bytedance.com>
X-Lms-Return-Path: <lba+16a4f63c5+840c33+vger.kernel.org+changfengnan@bytedance.com>
In-Reply-To: <d9210bcdf73fbe1ac8b6ec132865609a3ed68688.e79dfdc8.0374.4705.bd44.702afa9fc1bd@bytedance.com>
References: <20260520031221.83210-1-changfengnan@bytedance.com>
	<469287b6-201a-497d-ac67-03e1336dd81a@kernel.dk>
	<d9210bcdf73fbe1ac8b6ec132865609a3ed68688.e79dfdc8.0374.4705.bd44.702afa9fc1bd@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ping.

> From: "changfengnan"<changfengnan@bytedance.com>
> Date:=C2=A0 Mon, Jun 15, 2026, 15:33
> Subject:=C2=A0 Re: [PATCH] io_uring/io-wq: avoid repeated task_work scans=
 during teardown
> To: "peterz"<peterz@infradead.org>, "rostedt"<rostedt@goodmis.org>
> Cc: "io-uring"<io-uring@vger.kernel.org>, "linux-kernel"<linux-kernel@vge=
r.kernel.org>, "axboe"<axboe@kernel.dk>
> Hi Peter & Steven:
> Do you have time to help review this patch ?
>=C2=A0
> Thanks.
>=C2=A0
>=C2=A0
> > From: "Jens Axboe"<axboe@kernel.dk>
> > Date:=C2=A0 Fri, May 22, 2026, 00:59
> > Subject:=C2=A0 Re: [PATCH] io_uring/io-wq: avoid repeated task_work sca=
ns during teardown
> > To: "Fengnan Chang"<changfengnan@bytedance.com>, <io-uring@vger.kernel.=
org>, <linux-kernel@vger.kernel.org>, <peterz@infradead.org>, <rostedt@good=
mis.org>
> > On 5/19/26 9:12 PM, Fengnan Chang wrote:
> > > We hit hard-lockup reports from iou-wrk threads stuck in
> > > task_work_cancel_match() during io-wq teardown in syzkaller test.
> > > The root cause is that teardown repeatedly rescans the submitter task=
's
> > > full task_work list under pi_lock, once per matched item.
> > >=C2=A0
> > > Two spots are problematic:
> > >=C2=A0
> > > 1) io_wq_cancel_tw_create() loops calling task_work_cancel_match() to
> > > =C2=A0 =C2=A0remove worker-creation callbacks one at a time. Each cal=
l re-walks
> > > =C2=A0 =C2=A0the entire list from scratch while holding pi_lock.
> > >=C2=A0
> > > 2) io_worker_exit() unconditionally scans the submitter task_work lis=
t
> > > =C2=A0 =C2=A0for its own create_work, even when it never queued one. =
With many
> > > =C2=A0 =C2=A0workers exiting simultaneously against a large unrelated=
 task_work
> > > =C2=A0 =C2=A0list, this adds up fast.
> > >=C2=A0
> > > Fix (1) by adding task_work_cancel_match_all() that unlinks all match=
ing
> > > callbacks in a single traversal, then iterating the returned list loc=
ally.
> > > Same try_cmpxchg() synchronisation as before, stops at the work_exite=
d
> > > sentinel.
> > >=C2=A0
> > > Fix (2) by skipping the cancel entirely unless create_state indicates=
 a
> > > pending create_work. Since create_state is exclusively owned via
> > > test_and_set_bit_lock, at most one callback can be queued per worker,=
 so
> > > the cancel is also simplified from a loop to a single call.
> > >=C2=A0
> > > With this fix the reproducer (FIFO-open + MSG_RING SEND_FD stress) no
> > > longer triggers hard-lockup reports, and task_work_cancel_match sampl=
es
> > > drop to microseconds.
> >=C2=A0
> > Looks good to me, nicer way to do this too.
> >=C2=A0
> > --=C2=A0
> > Jens Axboe
> >=C2=A0
