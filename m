Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300109;
	b=cj+h9okWGwzFabBR4eq618FausoZ+VNBZOVPsjmkPT0AIjstjaeZgegbhXx7al1JmRWB
	 orYi1FmBg1j/yKE4cYe3/D5WTDhr+L4XbFRteJGpgaEIgVSseBW5bOvP2h14VzVfjtmFj
	 PmZEpl3cB7b4CgLBRP9pnA2tuD1X0IyhPv3TQ/hg6ngNLAKWsF7m0wm6U4SzQeMj8Rg7k
	 dlYoCTrVdkSG2GPf9ppVGCavPZf+SeHfw+OT9VE3KfKFPmCn7YbWviscF9decv177GnWq
	 aEi0N8kxMXi391/EdHxHZVYSRBsBLt2E/i12bW0fl4TjdjM/gmcuzcWuvHP7Xx+vSbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300109;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=ijoVdBB+CeUh65paN6kuGTG9ToIcwzTc9xfoUwMoOkk=;
	b=ocfoQSP1yS2r0/X/UeCHC3L5hAy0WT6Y4Ir2dVda+3qBzs5iuRhUV3HNwbodjYb1jhTf
	 NSO2bI8liDrs+Z7Q14WGsqiMQL4ydjXz/jxlND1paORysl/mzqhvl6DyTvyrShkDQSSmK
	 t2VPOLZKepdSU7TmUfeT7YIEy3k2YFkCJDj9jFhaX7aH539+vcuLV6psrvonhiRGF5yg9
	 G6z4k5KuYGhV0N+z9+srmePeWqxd7AZ1QUa/NZetzpctTtHunMbMZE+F4c7Q73eZehgGb
	 M9rNpqf32Ein0GhK9ae9njI4LUaeqQhyxn+ZSFbJDsjh+Cd2qq88Hlup7u/X1PSKMrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=lalinsky.com;
	spf=pass smtp.mailfrom=lalinsky.com;
	dkim=pass header.d=lalinsky.com header.i=@lalinsky.com header.a=rsa-sha256 header.s=fm3 header.b=cVf+jAOH;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Ofyucmd7;
	arc=none smtp.remote-ip=202.12.124.159
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1C0606A337
	for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 18:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D1C0606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lalinsky.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lalinsky.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lalinsky.com header.i=@lalinsky.com header.a=rsa-sha256 header.s=fm3 header.b=cVf+jAOH;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Ofyucmd7
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 392377A0144
	for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 14:55:08 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Thu, 29 Oct 2026 14:55:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lalinsky.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1793300106; x=1793386506; bh=ij
	oVdBB+CeUh65paN6kuGTG9ToIcwzTc9xfoUwMoOkk=; b=cVf+jAOHdWyIlXut8b
	sq1NSioi8e3TNmE3VML/ExUcPDYSvc7JAWCTemqOn8xDcccIvyyjc1nEVyRvDnKe
	/8QBowem5wf2XwdrghZq4uTWdVP3OFpTDHuoNMQbiF17WqFXz7t7ylW+uPR7XQ4L
	AZp2QC7an7PQE5fv1bUEIgsEer1NeH5napdkxtNf+mImlF0LlVjcUaTGJ5Z4vJC6
	EssvcGR4GvbiV6FOG9QsFdBNiYrklJeY5aX+DF6QHExSdfDpeN9yQlGQXinElSIr
	5hnvHVcsxWrbwAgaSzTw1jAOJi87Ia7YrkknSGDY972DsCxMlNz9YlB6PYfWfhs0
	gugg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1793300106; x=1793386506; bh=ijoVdBB+CeUh65paN6kuGTG9ToIc
	wzTc9xfoUwMoOkk=; b=Ofyucmd7lVp0NAHd6nfnHxv4yNAamyC5xPUWuJnIREjd
	E9eaRFwBFTw350JO81ryeuKq6gGfiuxZ+Rsghen2ajYxgfQMEYyyqYn9ZXcpA/ZY
	2LoxMGQyBlpg50oMLVGXdsJP19XIZwvorrAAEwgqZYLNqUoLcbFSru2E8DYulyLk
	SdNyUz/LslDhTJ3Zhv8mmqkMRWUztyZ9eTSSreRSJummcThror8G00LCXDXhtr/R
	a64nzH/lXg/UV81pk/NUoul8FpwblDj2hbOWibj6q02DNE6NjdIyo1P+pplGZnxG
	rJIRaiRM1TLIdKWeGb09b7z6BYXsILz13Rpdz5hL0w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=lalinsky.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793300106; d=lalinsky.com;
	mf=PGx1a2FzQGxhbGluc2t5LmNvbT4=;
	rt=PGlvLXVyaW5nQHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:oJBAnsUecKmnlv8aSNspgqcjZhM5CNqP8gbct2jZpQZ2+S8
	oWcKaivtgZRL4KRLW0Tz9A6eDCkum8Pg/T1xWaGxq41+V0wjhSTq+7eOANjlYx3M
	BYxsE1PQ5ou2HP1Vfp/Nz9uJSB+Yp891CQZYeoRZLYULRVv7xIY93FSw4nq1yBlh
	T1N05W7q9LcBdfsVChA+UafPWYX1inxhMocNW7ENJ+OrAki90qeNujFcOvgx9OZV
	crPIDtRh16BbAz6P5EIPmW2KVgYXG7GNcuz+JnHTA9ZZdQfeKefuLFVru247m6gx
	VdAw/tQouCdyaPznQc5J9WX/ggxDQ999KQJGAGg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:p2xYIjHogdrGFGIXsyQgOsGUoEIb9PU3CMR+wYSSpX8=:N91KpM6UB4OB8IzWiCtzLElitlTizqV4IqgxSq85CvQ=;
X-ME-Sender: <xms:iJbjaniyfHW7TJo8yxpznjDcA3g5GNEj5e1V9jnWTixOOmeKwWE-iQ>
    <xme:iJbjau2gnoCOwodhXsOWB4F9t976yn7AH0_S36g4hnjVelY1JmsVZvw3nuSQQgYwC
    e7yR8gGR-BLxuxu2_0MD4tsbx3ic70Awu03CbjiyEACfxS-fatnIw>
X-ME-Proxy-Cause: dmFkZTGjfNYSf4a39q4RGY8M5SIZ5i7wEJMJXTRlHLPEc+0MWisx2g84NSChIAibQrespa
    4DHJLrlFZGb/LPwSe1PaRYeZOY84penYPi3RbtJm8O2amMS9mDsM/jntIRVNU3+7fgNOAN
    w61pkBzeiPCxVrX+pm+N7i2UWEUEJRmDXhD6TnLTgFxKKogI3BNw4QM6F8OeFPXkor6gGH
    BOvodAhTLZy9zyL79aAaUSrF1Qros2y/iUb93fIxsvV5mLFELvZrKNKmTrcIh3eFfMHYH6
    KlxwHTi9agGOVe4xRGpm32813Lb4JR0cybcJZ7xvWc4GynriJfQTi9IIXnDQ7WXlC6p6sf
    jbcUN7hMVRSjY2xgpqs+Z30d70iRi4+K1gAjbzVT2GfPokagGT50nbN0/jvKzBCNVHZodO
    t9ogxYPEpMppFjXNSPYnlRvGprd25DyjFyS2HH25mIGLq5ARpdDYrJ3FPwU+VAyOkyci+2
    uLyLd1VJTkJ65JNLzvTfC2HF8c1yJnWy1QMUF3My3FrCzn4v1Xa3PEDbA5CByJ+/ScPKTw
    gPEgQjqnkE6KWqszBxDLvK+JEPRZn+kpWWhgXFFHqnFx+ooq3K/ItFTfKyLuJ1e2uK90kC
    JhIDOrPnBUtzLF1vgCs9Gt22Lcdjm19ci/fbh4NObfTPdbPuyNywHBcoz5Ug
X-ME-Proxy: <xmx:iZbjaqOnuKceUHnFPVbOLd27kcr8B4sT5o0jAmyePB_b5wF4nkcKjg>
    <xmx:iZbjam4bWlxoCxcifQZbE_GzlUaBrebSBYK68eW12T3g6i11eBjfAQ>
    <xmx:iZbjao3_MN6rYg3zPtW9cd9ExQhIbnVtgrA6X5F2-zXy7jAOsWsXPA>
    <xmx:iZbjanZoCRrTYvTXgindyD3a5sJtZDHd1svnO3tTb4EMKc4YG7Xypw>
    <xmx:ipbjah9y_ekI8X-OGDYbs7muVIIY97X15f0fhmEbRAMeD1f4ZuB5e1rD>
Feedback-ID: ib6f146ff:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 74187F80093; Thu, 29 Oct 2026 14:55:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 29 Oct 2026 19:54:44 +0100
From: =?UTF-8?Q?Luk=C3=A1=C5=A1_Lalinsk=C3=BD?= <lukas@lalinsky.com>
To: "Jens Axboe" <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org
Message-Id: <a5589b66-9a20-4b1c-a0f1-1b5b31af3667@app.fastmail.com>
Subject: io_uring: SENDMSG/WRITEV return -EAGAIN on O_NONBLOCK socket after peer
 half-close
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

IORING_OP_SENDMSG can complete with -EAGAIN even though MSG_DONTWAIT
was not used. It happens when the send is waiting for buffer space, the
peer calls shutdown(SHUT_WR), and the socket has O_NONBLOCK set.

IORING_OP_SEND in the same situation keeps waiting and completes
normally once the peer reads. So does SENDMSG on a socket without
O_NONBLOCK. IORING_OP_WRITEV behaves the same way as SENDMSG.

I consider this a bug. Based on previous discussions [1][2], io_uring
should ignore O_NONBLOCK for operations that take a per-call nonblock
flag. SENDMSG mostly does: on the full socket the request doesn't fail
immediately, it waits. It only fails after the peer half-closes. At the
very least it's inconsistent, because SEND and SENDMSG/WRITEV behave
differently on the same socket.

There is no good option for handling the error. Resubmitting fails
again the same way. Waiting for writability with
IORING_OP_POLL_ADD(POLLOUT) doesn't work after a half-close either, it
completes immediately with POLLRDHUP, even though POLLRDHUP wasn't
requested. The only workarounds are dropping the O_NONBLOCK flag, or
using a separate epoll to wait for writability.

If I'm reading the code correctly, after the half-close EPOLLRDHUP
keeps waking the request's internal poll. The request runs out of
APOLL_MAX_RETRY and is punted to io-wq, where the blocking attempt goes
through __sys_sendmsg_sock() -> ____sys_sendmsg(). That function turns
O_NONBLOCK into MSG_DONTWAIT, so the attempt returns -EAGAIN instead of
blocking. io_send() calls sock_sendmsg() directly, which is why SEND
blocks in the worker instead. WRITEV seems to hit the same thing in
sock_write_iter(), and IORING_OP_RECVMSG through ____sys_recvmsg(),
after enough wakeups that find no data.

We hit this in zio, an async runtime for Zig, via an HTTP/2 server's
half-close tests [3]. ringline, a Rust io_uring runtime, hit it
independently on 6.12 and 7.1 [4], and libosmocore seems to have hit
the same -EAGAIN and worked around it by clearing O_NONBLOCK [5]. We'll
work around it in zio for now.

Here is a minimal reproducer:

/*
 * IORING_OP_SENDMSG or IORING_OP_WRITEV with flags 0 is parked on a
 * full AF_UNIX stream socket. If the socket has O_NONBLOCK and the
 * peer then calls shutdown(SHUT_WR), the request completes with
 * -EAGAIN. IORING_OP_SEND, or any of them without O_NONBLOCK, keeps
 * waiting and completes once the peer reads.
 *
 * Build: cc -O2 -Wall -o sendmsg_eagain sendmsg_eagain.c -luring
 */
#include <errno.h>
#include <fcntl.h>
#include <liburing.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/utsname.h>
#include <unistd.h>

#define CHECK(x) do { if (!(x)) { perror(#x); exit(2); } } while (0)

enum { OP_SEND, OP_SENDMSG, OP_WRITEV };
static const char *const op_names[] = {
	"SEND   ", "SENDMSG", "WRITEV ",
};

static char buf[65536];

static int run(int op, int nonblock)
{
	struct __kernel_timespec ts = { .tv_sec = 1 };
	struct iovec iov = { .iov_base = buf, .iov_len = sizeof(buf) };
	struct msghdr msg = { .msg_iov = &iov, .msg_iovlen = 1 };
	struct io_uring_sqe *sqe;
	struct io_uring_cqe *cqe;
	struct io_uring ring;
	char sink[65536];
	int sv[2], ret, res;

	CHECK(socketpair(AF_UNIX, SOCK_STREAM, 0, sv) == 0);
	if (nonblock)
		CHECK(fcntl(sv[0], F_SETFL,
			    fcntl(sv[0], F_GETFL) | O_NONBLOCK) == 0);

	/* Fill the send buffer. */
	while (send(sv[0], buf, sizeof(buf), MSG_DONTWAIT) > 0)
		;
	CHECK(errno == EAGAIN);

	ret = io_uring_queue_init(4, &ring, 0);
	if (ret) {
		fprintf(stderr, "queue_init: %s\n", strerror(-ret));
		exit(2);
	}
	sqe = io_uring_get_sqe(&ring);
	if (op == OP_SEND)
		io_uring_prep_send(sqe, sv[0], buf, sizeof(buf), 0);
	else if (op == OP_SENDMSG)
		io_uring_prep_sendmsg(sqe, sv[0], &msg, 0);
	else
		io_uring_prep_writev(sqe, sv[0], &iov, 1, 0);
	CHECK(io_uring_submit(&ring) == 1);

	/* The request must be waiting for space, not completed. */
	CHECK(io_uring_peek_cqe(&ring, &cqe) == -EAGAIN);

	CHECK(shutdown(sv[1], SHUT_WR) == 0);

	ret = io_uring_wait_cqe_timeout(&ring, &cqe, &ts);
	if (ret == 0) {
		res = cqe->res;
		printf("%s O_NONBLOCK=%d: res=%d after peer shutdown\n",
		       op_names[op], nonblock, res);
	} else {
		CHECK(ret == -ETIME);
		/* Still waiting after 1s: drain the peer until done. */
		do {
			while (recv(sv[1], sink, sizeof(sink),
				    MSG_DONTWAIT) > 0)
				;
			ts.tv_sec = 0;
			ts.tv_nsec = 10 * 1000 * 1000;
			ret = io_uring_wait_cqe_timeout(&ring, &cqe,
							&ts);
		} while (ret == -ETIME);
		CHECK(ret == 0);
		res = cqe->res;
		printf("%s O_NONBLOCK=%d: res=%d after peer read\n",
		       op_names[op], nonblock, res);
	}
	io_uring_cqe_seen(&ring, cqe);
	io_uring_queue_exit(&ring);
	close(sv[0]);
	close(sv[1]);
	return res == sizeof(buf) ? 0 : 1;
}

int main(void)
{
	struct utsname u;
	int op, fail = 0;

	CHECK(uname(&u) == 0);
	printf("kernel %s, liburing %d.%d\n", u.release,
	       io_uring_major_version(), io_uring_minor_version());
	for (op = OP_SEND; op <= OP_WRITEV; op++) {
		fail |= run(op, 0);
		fail |= run(op, 1);
	}
	return fail;
}

Output:

kernel 7.0.0-38-generic, liburing 2.5
SEND    O_NONBLOCK=0: res=65536 after peer read
SEND    O_NONBLOCK=1: res=65536 after peer read
SENDMSG O_NONBLOCK=0: res=65536 after peer read
SENDMSG O_NONBLOCK=1: res=-11 after peer shutdown
WRITEV  O_NONBLOCK=0: res=65536 after peer read
WRITEV  O_NONBLOCK=1: res=-11 after peer shutdown

The relevant code is unchanged in current master.

[1] https://lore.kernel.org/io-uring/e83c9ef0-8016-2c4a-9dd0-b2a1318238ef@kernel.dk/
[2] https://github.com/axboe/liburing/issues/1270
[3] https://github.com/lalinsky/zio/issues/864
[4] https://github.com/ringline-rs/ringline/issues/603
[5] https://gerrit.osmocom.org/c/libosmocore/+/41671

Lukas
