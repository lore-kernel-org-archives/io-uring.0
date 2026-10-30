Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.207.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336637;
	b=rPkdTDZRU7W3ideWIa6vKTImeaARgimwBV/9BG/01gFqanLNHN16zN5R0T+jiwDqglbJ
	 BrpiqOzm1PiADgScGTQptr3kA8VnEJgi/2AtzCU3CYLmP9YiItTf/cF6TPpYC5UETciF6
	 3V1MoGhS45UML5bgYY7dDLzTermyCTF2SEmRQCgEySMt8bB6SqM2iubyH52xx8A/K52HK
	 VvZJaC2hu9BAxIh6x+Q0TnpjReW6pEX4sCNdZUd57uAEWT1bcMZlqWFFZB5TBunv3bYys
	 PeEDypBuOrGWkeAoWXor38ycGtNs6IVWreQ8YA0faJO12EFOUZQiwtJFlrW7o1YR+kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336637;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Received:Received:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Smtpcorp-Track:Feedback-ID:
	 X-Report-Abuse;
	bh=ucAfK/MzpfbMb0wqURA3fUx84Y9iewje5yWIPDbnD6Q=;
	b=LzFfsXteR7wvT8ACBPy7O4mgqScUOgQcyWaUKOGjC21bO2LX4NUAsVCUWYfgN8Idi+Fx
	 JqDvz3aoBcNfBkadh1VEWKRY4OM2Md+TMtOXXOI6Kt/VEmbtWGsHAvkiGigJ9Hzk1svDz
	 gu/h6Q0GS23IgTAXd+S/owExMYbHR0+BRSDgTdiIJGnrbgbbbGhhsH9RluA982AdKst3i
	 Kidt+4HXc0SqC+iTxCeBdy6gHPn8CfivujGF5DiLo4rWy2Uwuc1ET2EaCXpsfcFFZhJBr
	 6c1+zIaxdlr0Qocp/GU0H9qg4Tm5JAG3cWEoD/xG2aVHcyjVrejLZksPuSBHbTNCiHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=shangen.org;
	spf=pass smtp.mailfrom=em879706.shangen.org;
	dkim=fail reason="unknown key version" header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=miusa0.a1-4.dyn header.b=g3VEa+8p;
	dkim=pass header.d=shangen.org header.i=@shangen.org header.a=rsa-sha256 header.s=s879706 header.b=Wd9zIvgn;
	arc=none smtp.remote-ip=103.47.207.181
Received: from a2i949.smtp2go.com (a2i949.smtp2go.com [103.47.207.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC22606A31A
	for <io-uring@vger.kernel.org>; Fri, 30 Oct 2026 05:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFC22606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shangen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em879706.shangen.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=miusa0.a1-4.dyn header.b=g3VEa+8p;
	dkim=pass (2048-bit key, unprotected) header.d=shangen.org header.i=@shangen.org header.a=rsa-sha256 header.s=s879706 header.b=Wd9zIvgn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=miusa0.a1-4.dyn; x=1793337536; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Date:Subject:To:From:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=ucAfK/MzpfbMb0wqURA3fUx84Y9iewje5yWIPDbnD6Q=; b=g3VEa+8pEq1hKmNvUCmFHivwfr
	P85vQ3dzdaqc8PWEPGUJovGH6P2L14fqj610Oa7AJnk/Q8nasyKBRndM6Z0JmiwGIvDSd1KDdkYNx
	7higq8evEyOxX999FxEFaw6ASerNle7QobaMOmZOF+ucoNIqVxYU+iYXxfWn6hiTyeScXRSgtRmxU
	RSH6u5UAw2ZNsSzc69tuTMGGp3JKEbu4LkwqwsY6KVFwECM3jnTkKkmZh9RdrSflWMokSjPbgF3z4
	vXVwRYqbzcA2szsu6GPu5pFAcPZAAUMT8rVlVVL9IT3O7CD7wxwU5uZQW9z9qqMD7UhuyZDjkJNmk
	9cN2yJAQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shangen.org;
 i=@shangen.org; q=dns/txt; s=s879706; t=1793336636; h=from : subject :
 to : message-id : date;
 bh=ucAfK/MzpfbMb0wqURA3fUx84Y9iewje5yWIPDbnD6Q=;
 b=Wd9zIvgn5wIH9ww8PYw0WOxntfrw/3Fkib/Y3IS5U/foDuS9XCrMtcPBx/gfkiRzRr2w2
 Of/d4UBU725y07HjtD1cdXq2CkS3LG3gjzgS5tpScaqIkJ8nTc1BAO3ZA+mnAanqjYRJHrs
 mVoAfYb/y0mNw5TmfW0AlEwceJvSv5I+8xCrkV3NVTi2K1KHuMPqAYS25Tity8zCmqaJpm2
 Bhe/42sQrqdccmF+l6WDlhO71KFGsM2paTy89hEIObB/UIQMchHomGkMT9GJd9QAqmBb+ou
 TWsIXswvf4TcRkRFaekkx+6YAIs9RhUEjR77+cvz9LtRTlbjJQbONwAN857Q==
Received: from [10.143.42.182] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <sim@shangen.org>)
 id 1xMemM-gL4Q4W-PH; Fri, 30 Oct 2026 05:03:50 +0000
Received: from [10.195.244.224] (helo=sse-laptop.lan)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
 (Exim 4.100.1) (envelope-from <sim@shangen.org>)
 id 1xMemM-FnQW0hPtGB2-hQdi; Fri, 30 Oct 2026 05:03:50 +0000
From: Shang En Sim <sim@shangen.org>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org
Cc: Shang En Sim <sim@shangen.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] io_uring/cancel: cancel all poll matches in one pass
Date: Fri, 30 Oct 2026 00:03:15 -0500
Message-ID: <20261030050319.1448530-1-sim@shangen.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Smtpcorp-Track: CbszwFm9JgBg.5hErLPRUvlsB.oS3ekgQq3Dg
Feedback-ID: 879706m:879706aL5FzMA:879706sIuh6qtCNs
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

IORING_OP_ASYNC_CANCEL with IORING_ASYNC_CANCEL_ALL cancels poll
requests one at a time, and every lookup starts over at the beginning
of the poll hash. Cancelled requests stay hashed until their task work
runs, so each lookup also walks past the ones already cancelled. One
cancel that matches K of N pending polls costs about K*N/2 visits in a
single io_uring_enter(), with uring_lock held.

Patch 2 makes poll cancel all its matches in one pass, as futex and
waitid already do through io_cancel_remove(). Patch 1 is a prerequisite
and a fix on its own: __io_async_cancel() counts each io_try_cancel()
call as one, so CANCEL_ALL on futex or waitid requests reports 1 no
matter how many it cancelled. Patch 2 needs it to keep the poll count
right.

Reproducer, 80000 polls on one eventfd and a single CANCEL_FD|ALL:

  #include <liburing.h>
  #include <poll.h>
  #include <sys/eventfd.h>

  int main(void)
  {
  	struct io_uring ring;
  	int fd = eventfd(0, 0), i;

  	io_uring_queue_init(4096, &ring, 0);
  	for (i = 0; i < 80000; i++) {
  		struct io_uring_sqe *sqe = io_uring_get_sqe(&ring);

  		if (!sqe) {
  			io_uring_submit(&ring);
  			sqe = io_uring_get_sqe(&ring);
  		}
  		io_uring_prep_poll_add(sqe, fd, POLLIN);
  	}
  	io_uring_prep_cancel_fd(io_uring_get_sqe(&ring), fd,
  				IORING_ASYNC_CANCEL_ALL);
  	io_uring_submit(&ring);
  	return 0;
  }

In a 4 vCPU KVM guest, "time ./repro" takes 17.06s of system time on
next-20261029 (lazy preemption) and 0.02s with these patches. On
v6.18.59 with voluntary preemption it takes 36.24s, and the soft lockup
watchdog fires during the cancel.

Testing, on next-20261029 and v6.18.59: liburing's cancel tests
(poll-cancel-all, poll-cancel, poll-cancel-ton, cancel-fd-userdata,
io-cancel, sync-cancel, cancel-race, futex, waitid), plus three new
tests that I'll send to liburing separately: a futex CANCEL_ALL count
(fails before patch 1), and poll CANCEL_ALL by user_data alone and with
1000 polls on one fd. All pass, except waitid's pidfd test on
v6.18.59, which fails with and without these patches. Not tested:
lockdep, KASAN, and SQPOLL or DEFER_TASKRUN rings for the new cases.


Shang En Sim (2):
  io_uring/cancel: count all requests that a CANCEL_ALL cancels
  io_uring/poll: cancel all matching requests in one pass

 io_uring/cancel.c |  3 ++-
 io_uring/poll.c   | 39 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 39 insertions(+), 3 deletions(-)


base-commit: 70866cfa169d5ee149364267289e71d50f9a7ae9
-- 
2.56.0

