Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C0654704A;
	Sat, 19 Sep 2026 04:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.70.13.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789793638; cv=none; b=o+V7mmSTDrxTtcAr/glaHkrp5eyBf6NRTFmDmY9/c24oM1tSiAgJ6lNrae3Se1tGieTQyHqK+1UXwCkVd8UiyGzucOvX/6Ptt7Iv+pGNyRtpCGMLmmwAcMnh/wLzdk4ayiS5DEaq8SazU6RUNXQ6cNNViIXIEnCMMARcGgYzbkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789793638; c=relaxed/simple;
	bh=RZWen5AgjBWrYZJ5pGQA17J3wafpYMVpmSF7wo7K36U=;
	h=From:To:Cc:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type:Subject; b=BbgqSBRjpN+l8qCHS+2YOavUi2FtSX1qpO516bhTzT/NBR2YS0C0UyjnyBu2YsY7t9vfpOlzXRYPeAkSUdbH4JymmLJ0LdAlVGZnqP7Gja+q6ETa1y068QP9eCGWC6Ak+QPrb5qX5mplX28kqGfmrVdtNQgqDVCcL9/I2guav3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com; spf=pass smtp.mailfrom=xmission.com; dkim=pass (1024-bit key) header.d=xmission.com header.i=@xmission.com header.b=EO2SBL3Q; arc=none smtp.client-ip=166.70.13.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xmission.com header.i=@xmission.com header.b="EO2SBL3Q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=xmission.com;
	 s=xmission; h=Subject:Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=RZWen5AgjBWrYZJ5pGQA17J3wafpYMVpmSF7wo7K36U=; b=EO2SBL3QH6fRvP2pEmWE8Deu39
	ubmC1YL9TnUv3xW7YqmVKfV9zQorl7RTbINLcDw4flvs24egWErZPHeInsazuJEOx+wXktgYbOKU2
	3av3S7hgtZoCWfAKdGk0S/ctKQAa6OX9eVy0sLFq+we8ock9ZbV7V/oJdrJExXclGg6Q=;
Received: from in01.mta.xmission.com ([166.70.13.51]:60084)
	by out01.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1x7mlZ-002Ci8-SB; Fri, 18 Sep 2026 22:33:33 -0600
Received: from ip72-198-196-98.om.om.cox.net ([72.198.196.98]:59022 helo=email.froward.int.ebiederm.org.xmission.com)
	by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1x7mlX-00H4gm-15; Fri, 18 Sep 2026 22:33:33 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,  tglx@kernel.org,  mingo@redhat.com,
 peterz@infradead.org, Oleg Nesterov <oleg@redhat.com> 
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk> (Jens Axboe's message
	of "Fri, 11 Sep 2026 09:40:50 -0600")
References: <20260911154148.644489-1-axboe@kernel.dk>
Date: Fri, 18 Sep 2026 23:33:25 -0500
Message-ID: <87a4pdami2.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1x7mlX-00H4gm-15;;;mid=<87a4pdami2.fsf@email.froward.int.ebiederm.org>;;;hst=in01.mta.xmission.com;;;ip=72.198.196.98;;;frm=ebiederm@xmission.com;;;sPfnum=0;;;sPf=pass
X-XM-AID: U2FsdGVkX19vXQSjoUfiXnvOr525YQvVO6XmJ8MQ/NI=
X-Spam-Level: *
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.1 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.4992]
	*  0.7 XMSubLong Long Subject
	*  1.5 XMNoVowels Alpha-numberic number with no vowels
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa06 1397; Body=1 Fuz1=1 Fuz2=1]
	*  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: XMission; sa06 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: *;Jens Axboe <axboe@kernel.dk>
X-Spam-Relay-Country: 
X-Spam-Timing: total 2340 ms - load_scoreonly_sql: 0.06 (0.0%),
	signal_user_changed: 16 (0.7%), b_tie_ro: 14 (0.6%), parse: 0.99
	(0.0%), extract_message_metadata: 13 (0.6%), get_uri_detail_list: 1.59
	(0.1%), tests_pri_-2000: 4.8 (0.2%), tests_pri_-1000: 2.6 (0.1%),
	tests_pri_-950: 1.34 (0.1%), tests_pri_-900: 0.98 (0.0%),
	tests_pri_-90: 82 (3.5%), check_bayes: 80 (3.4%), b_tokenize: 9 (0.4%),
	 b_tok_get_all: 11 (0.5%), b_comp_prob: 4.3 (0.2%), b_tok_touch_all:
	49 (2.1%), b_finish: 1.35 (0.1%), tests_pri_0: 289 (12.3%),
	check_dkim_signature: 0.58 (0.0%), check_dkim_adsp: 3.0 (0.1%),
	poll_dns_idle: 1906 (81.4%), tests_pri_10: 1.89 (0.1%), tests_pri_500:
	1923 (82.2%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [RFC PATCH 00/15] io_uring: thread identity handoff for
 blocking inline issue
X-SA-Exim-Connect-IP: 166.70.13.51
X-SA-Exim-Rcpt-To: oleg@redhat.com, peterz@infradead.org, mingo@redhat.com, tglx@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, io-uring@vger.kernel.org, axboe@kernel.dk
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out01.mta.xmission.com); SAEximRunCond expanded to false

Jens Axboe <axboe@kernel.dk> writes:

> Hi,
>
> io_uring issues requests inline with IO_URING_F_NONBLOCK and punts to
> io-wq when that isn't possible. For a range of opcodes it isn't possible
> at all, as there's no nonblocking path in the kernel for them: fsync,
> statx, openat, the *at family, xattr, fadvise, splice, etc. Those are
> punted unconditionally, and the punt costs a thread wakeup, a context
> switch and a task_work completion round trip per request. io_uring HAS
> to be cautious to prevent accidental blocking in the kernel, even if the
> operations predominantly never block. Sad story. Examples of that are
> things like an fdatasync that doesn't block, statx that hits dcache,
> openat for O_TMPFILE, etc. All of those would've completed inline just
> fine, but io_uring just cannot rely on that.
>
> This series issues those requests inline in blocking mode instead, and
> only pays for the offload if the request actually blocks. But by the
> time it blocks, the submitter is deep in the kernel with the request on
> its stack, so the work can't be moved to another thread. What we can
> move is the identity. If the submitting task blocks, an idle io-wq
> worker takes over its user visible identity (tid, signal state,
> credentials, scheduling attributes, cgroup, user register state),
> finishes the io_uring_enter() call and returns to userspace as the
> submitter. The original task finishes the request as an
> io-wq worker and joins the pool. Userspace is none the wiser, hopefully,
> the same tid came back from the syscall, it's just on a different
> task_struct. Folks that have been around a while may remember earlier
> attempts at this about 20 years ago.

I don't see anything immediately wrong, but I suspect I am just
not looking hard enough.

In my time working with the kernel I have never seen anyone actually get
this kind of thing correct.

The handoff that we do during exec has a bug with posix timers that
I think is 23 years old that we just caught, and still hasn't been
merged to Linus.

There was the old daemonize call that got it wrong so often I added
kthreadd.


Maybe you want something like the old solaris doors, or vfork.
Perform a synchronous task switch to this other thread, and call this
function in the other thread.  Then block waiting on the other thread
until the other thread blocks, or the function you called finishes.

Is there a reason you didn't try and do it that way?
Just a synchronous switch to and from a thread in your thread pool?

You aren't changing the mm so I really doubt changing the stack pointer
and a registers will be that expensive.


Eric
