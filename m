Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440143BB100
	for <io-uring@vger.kernel.org>; Mon, 15 Jun 2026 07:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781508834; cv=none; b=ScUDcDdxugwmAhnwK4P8p3Yukqoo9rLtzxzcZj7QkkQDwyLm2xcFceTFGk9O5PbOp8uOVvrslau5WlAtHjlXa35PH3Of/DeB/AylTUIZ0HjXY08DAEg3No/dwCqWdvYqruAVdVAMHYgF01FpOLtwqwfJ9IpJ1djZsed1JPq/tCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781508834; c=relaxed/simple;
	bh=UKO5Fzq52IRnypXc8N4L/aXVjRpgy+y1Wd8PHlnQ4nA=;
	h=References:In-Reply-To:Message-Id:To:Cc:From:Mime-Version:
	 Content-Type:Date:Subject; b=FmM6K4LMKfYuLMpoo6RjYH7WTnIvfP452rB14GkqTgV6Xx16VLxsZVzsk83VEWYNw36DowSsmp0hEzQKHoPmdTcB/ICKOsmzj8fFqL2fqR5hLVeu77RHYYPCEI0o7E64ZZbnwN7hO3KJ51D9xyY1Bbmwq2iOJBSvu0U1NAYEVWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=EtzjqvDf; arc=none smtp.client-ip=209.127.230.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="EtzjqvDf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1781508821; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=UKO5Fzq52IRnypXc8N4L/aXVjRpgy+y1Wd8PHlnQ4nA=;
 b=EtzjqvDfI6U7xL0SXhM/mJpZ+Y/Wew/O+hkE22Mhq08hI8O0cFaLe2Hf/9QXmyEgILiOD3
 pYnS4cHPx15O7NBILebZshgYkDhlyeaGlJk82AqKG09q0sdOjb1svoYmfs/6fmHkndXayY
 kdHSGMjfc5f9Uii92PJl6ET9d6fN9BYNQt4yt0MCVkvxfIQxNTMfoo1NcSzpFSBECjEH1K
 k29vuz41eW0UF8JsTCgOjY8wC1Y94gM5QXN+3eolEwpfogIkOWcmYqAmC/la30HB4XxvQ4
 ILS6gd358Ne1fGL8DXM7sprnXbRwLDBzuErDiFyHmU73ozAv5CXLoUFI8ZlH1A==
References: <20260520031221.83210-1-changfengnan@bytedance.com>
	<469287b6-201a-497d-ac67-03e1336dd81a@kernel.dk>
In-Reply-To: <469287b6-201a-497d-ac67-03e1336dd81a@kernel.dk>
X-Lms-Return-Path: <lba+16a2faad3+2de43a+vger.kernel.org+changfengnan@bytedance.com>
Message-Id: <d9210bcdf73fbe1ac8b6ec132865609a3ed68688.e79dfdc8.0374.4705.bd44.702afa9fc1bd@bytedance.com>
To: "peterz" <peterz@infradead.org>, "rostedt" <rostedt@goodmis.org>
Cc: "io-uring" <io-uring@vger.kernel.org>, 
	"linux-kernel" <linux-kernel@vger.kernel.org>, "axboe" <axboe@kernel.dk>
From: "changfengnan" <changfengnan@bytedance.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Jun 2026 15:33:36 +0800
Subject: Re: [PATCH] io_uring/io-wq: avoid repeated task_work scans during teardown
Content-Transfer-Encoding: quoted-printable

Hi Peter & Steven:
Do you have time to help review this patch ?

Thanks.


> From: "Jens Axboe"<axboe@kernel.dk>
> Date:=C2=A0 Fri, May 22, 2026, 00:59
> Subject:=C2=A0 Re: [PATCH] io_uring/io-wq: avoid repeated task_work scans=
 during teardown
> To: "Fengnan Chang"<changfengnan@bytedance.com>, <io-uring@vger.kernel.or=
g>, <linux-kernel@vger.kernel.org>, <peterz@infradead.org>, <rostedt@goodmi=
s.org>
> On 5/19/26 9:12 PM, Fengnan Chang wrote:
> > We hit hard-lockup reports from iou-wrk threads stuck in
> > task_work_cancel_match() during io-wq teardown in syzkaller test.
> > The root cause is that teardown repeatedly rescans the submitter task's
> > full task_work list under pi_lock, once per matched item.
> >=C2=A0
> > Two spots are problematic:
> >=C2=A0
> > 1) io_wq_cancel_tw_create() loops calling task_work_cancel_match() to
> > =C2=A0 =C2=A0remove worker-creation callbacks one at a time. Each call =
re-walks
> > =C2=A0 =C2=A0the entire list from scratch while holding pi_lock.
> >=C2=A0
> > 2) io_worker_exit() unconditionally scans the submitter task_work list
> > =C2=A0 =C2=A0for its own create_work, even when it never queued one. Wi=
th many
> > =C2=A0 =C2=A0workers exiting simultaneously against a large unrelated t=
ask_work
> > =C2=A0 =C2=A0list, this adds up fast.
> >=C2=A0
> > Fix (1) by adding task_work_cancel_match_all() that unlinks all matchin=
g
> > callbacks in a single traversal, then iterating the returned list local=
ly.
> > Same try_cmpxchg() synchronisation as before, stops at the work_exited
> > sentinel.
> >=C2=A0
> > Fix (2) by skipping the cancel entirely unless create_state indicates a
> > pending create_work. Since create_state is exclusively owned via
> > test_and_set_bit_lock, at most one callback can be queued per worker, s=
o
> > the cancel is also simplified from a loop to a single call.
> >=C2=A0
> > With this fix the reproducer (FIFO-open + MSG_RING SEND_FD stress) no
> > longer triggers hard-lockup reports, and task_work_cancel_match samples
> > drop to microseconds.
>=C2=A0
> Looks good to me, nicer way to do this too.
>=C2=A0
> --=C2=A0
> Jens Axboe
>=C2=A0
