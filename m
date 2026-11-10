Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279276;
	b=Ll4Srift/0VeLC6aIqyMOSXI6CReZ6+YzrvGIS5p0dciCfs4riti5bjkTwg/AaiL5dGM
	 0q5v9dGWZF3w+ZKuOiplk8tX99Q/RlINrQPS/0ZvypAOA5cBWx3FWmjibnhdI+EbrsZsK
	 L3KMCzTft6w3m7bnV8rhrEQ/2KEombmHgNZUyhm+xKAgp6MGV0Qtpi/yWBoeRfkvuRyBf
	 VQMtyp0ecqWsQVzvutbGN6dGAhZ9L/YGOL7I4OjsSv1t3ClCYN9fmomavPviiS4eBB6Vv
	 B8N9Hq8v10HmdIpqNUHH0c1/81kZW1wVCOIjPf03tOtMDb9N46Na9Hbmnj0PncEUWqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279276;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=liAvaygvAi7zq6Qajed8oFY32cHq+aoYM0Cq/AlueW0=;
	b=y0Hp1Dy5pkSWMjqV+8ZsiJGdBpbNhiywZhEs5n0n2SenL6ODIm3X5ylHY+ejjZISsZ4G
	 sog7RmwXHVYou+RDqZjP2B8YJpnjz2cOBVvU/kFsBJq0tu3W9P7hhzk1RWkKuMY3fY4c/
	 bSqfWvS78m4uafjKJvg/MkJ6eSMMko0s21fxDu7QTRBVJDPYuIqkUq9jOt5R8Sa/pWjO4
	 oyK2SQ91RbN96oGZsAuzl5uaUN8l+znCC559EvuxgdZBvHi/Hb9502AiRzU+2yyf0ikbk
	 lqQbUIw6sZGbsEL5Z6tlad/dRAijjDfhR2oHQEicX6yE1u6Uh2FGnQHotjtb+x2Eh/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b="A/myxarS";
	arc=none smtp.remote-ip=185.70.43.103
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6391606A31C
	for <io-uring@vger.kernel.org>; Tue, 10 Nov 2026 02:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6391606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=A/myxarS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794279272; x=1794538472;
	bh=liAvaygvAi7zq6Qajed8oFY32cHq+aoYM0Cq/AlueW0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=A/myxarSBfLfQHdtssu9mYKVU0yZLY/K09i4FRAovrLXDtLfa82RhlSXDJEMuCerA
	 8qQVuie22k+KXSNMT1Y9K62zQb8eWE6fk11Bao/ld9h9xi/QEojeYy7ehrOYo0WVdP
	 i0MFKFsPhZtjMgO6PHjk+nFLyMWBSDLv5h0e1fI1kbLgciZx9z7BS+CFQ3/Ieiu8V8
	 oWkCATzgdYIlojmbXKFvHBONFSMI1Uqww11mgz/25zGCc9HRMlZANgrd9ZX2b1zu7N
	 7Q5UOdz9P4skDNzLSBPIGR8XIBQZT4M9litAT8Qg27WuAKxUbOlDyCJHYZfCd/dKGK
	 FBOP/iXPKDrxw==
Date: Tue, 10 Nov 2026 02:54:26 +0000
To: Jens Axboe <axboe@kernel.dk>
From: 7z0423arsenova <7z0423arsenova@pm.me>
Cc: "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>, Martin Michaelis <code@mgjm.de>
Subject: io_uring/kbuf: incremental buffer rings and early commit, which contract?
Message-ID: <NQrKgZ_EzA_lZTXUfCjSTokySt8Mb9474M_oITPgvLg-dllIWY29FCJBQLEIOaX0BKW7cdNcBC64LFX34Q5o9CH60OwsfODdq7irTvKzQvo=@pm.me>
Feedback-ID: 231403807:user:proton
X-Pm-Message-ID: 32078a3ae5593570d7ed7738108c4bbf0b71016d
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



Hi Jens,

This is about liburing issue #1555 [1], "Wrong offset for incremental
buffers after non-pollable files". Before writing a patch I'd like to
check which behaviour you want, since the possible fixes differ in what
applications can rely on.

When a buffer is selected from an IOU_PBUF_RING_INC ring and
io_should_commit() is true (io-wq, or a file that can't be polled),
io_ring_buffer_select() commits the requested length up front, as the
real transfer size isn't known yet. That causes two problems:

1) Short reads: the buffer was advanced by the requested length, but the
   CQE reports less. The next completion for the same buffer ID starts
   after a gap, while the application expects it right after the
   previous data.

2) Concurrent requests: a request that committed early can complete
   after a later request that selected from the same buffer, so CQEs for
   a buffer ID are posted in a different order than the data sits in
   the buffer. For example, a read punted to io-wq on an empty pipe
   selects the buffer and waits, an inline read on another pipe with
   data completes first, then the first read gets its data.

The man page describes the contract per buffer ID: each completion of a
given buffer ID continues where the previous one left off. In practice
the locked path also gives a global order: the kernel only moves on to
the next buffer after posting the last CQE (without
IORING_CQE_F_BUF_MORE) for the current one. Martin suggested in the
issue that applications rely on that, and that early commit should be
refused on incremental rings. That would break regular file reads, which
test/read-inc-file.c and 418eab7a6f3c explicitly support, so I don't
think that's what you want. But the question behind it seems to be the
real one:

  Is the contract per buffer ID only, or can applications rely on a
  global order across buffer IDs?

The options I can see:

a) At completion, give back the part that wasn't used, if the buffer is
   still the current one. Small, and fixes 1) as long as only one
   request is pending. It doesn't fix 2), nor overlapping short reads
   (on tmpfs, batched reads go through io-wq and overlap).

b) Treat a buffer committed early by a pending request as pinned. A
   later selection retires it (head++) and moves on to the next buffer.
   On completion, the owner gives back the unused part if the buffer is
   still current, and otherwise posts its CQE without BUF_MORE. This
   fixes 1) and 2) per buffer ID, but breaks the global order, spreads
   concurrent requests over several buffers, and a ring with a single
   buffer returns -ENOBUFS to the second concurrent request. I have a
   prototype of this (about 110 lines in kbuf.c and rw.c, reads only).

c) Consume the whole buffer on early commit for incremental rings,
   without BUF_MORE. Always correct, but it wastes the rest of the
   buffer and undoes what 418eab7a6f3c added for regular files.

d) Do a), and refuse a second early commit while one is pending on the
   same buffer. This keeps the global order and the existing tests, but
   concurrent users get an error.

Which direction would you prefer? I'm happy to write the patch and aHi Jens=
,

This is about liburing issue #1555 [1], "Wrong offset for incremental
buffers after non-pollable files". Before writing a patch I'd like to
check which behaviour you want, since the possible fixes differ in what
applications can rely on.

When a buffer is selected from an IOU_PBUF_RING_INC ring and
io_should_commit() is true (io-wq, or a file that can't be polled),
io_ring_buffer_select() commits the requested length up front, as the
real transfer size isn't known yet. That causes two problems:

1) Short reads: the buffer was advanced by the requested length, but the
   CQE reports less. The next completion for the same buffer ID starts
   after a gap, while the application expects it right after the
   previous data.

2) Concurrent requests: a request that committed early can complete
   after a later request that selected from the same buffer, so CQEs for
   a buffer ID are posted in a different order than the data sits in
   the buffer. For example, a read punted to io-wq on an empty pipe
   selects the buffer and waits, an inline read on another pipe with
   data completes first, then the first read gets its data.

The man page describes the contract per buffer ID: each completion of a
given buffer ID continues where the previous one left off. In practice
the locked path also gives a global order: the kernel only moves on to
the next buffer after posting the last CQE (without
IORING_CQE_F_BUF_MORE) for the current one. Martin suggested in the
issue that applications rely on that, and that early commit should be
refused on incremental rings. That would break regular file reads, which
test/read-inc-file.c and 418eab7a6f3c explicitly support, so I don't
think that's what you want. But the question behind it seems to be the
real one:

  Is the contract per buffer ID only, or can applications rely on a
  global order across buffer IDs?

The options I can see:

a) At completion, give back the part that wasn't used, if the buffer is
   still the current one. Small, and fixes 1) as long as only one
   request is pending. It doesn't fix 2), nor overlapping short reads
   (on tmpfs, batched reads go through io-wq and overlap).

b) Treat a buffer committed early by a pending request as pinned. A
   later selection retires it (head++) and moves on to the next buffer.
   On completion, the owner gives back the unused part if the buffer is
   still current, and otherwise posts its CQE without BUF_MORE. This
   fixes 1) and 2) per buffer ID, but breaks the global order, spreads
   concurrent requests over several buffers, and a ring with a single
   buffer returns -ENOBUFS to the second concurrent request. I have a
   prototype of this (about 110 lines in kbuf.c and rw.c, reads only).

c) Consume the whole buffer on early commit for incremental rings,
   without BUF_MORE. Always correct, but it wastes the rest of the
   buffer and undoes what 418eab7a6f3c added for regular files.

d) Do a), and refuse a second early commit while one is pending on the
   same buffer. This keeps the global order and the existing tests, but
   concurrent users get an error.

Which direction would you prefer? I'm happy to write the patch and a
liburing test for it. I have a test that checks the per buffer ID
contract with sequential, batched and out-of-order reads, which I'll
adapt to whatever the answer is.

I've tested the b) prototype in a VM on your io_uring-7.4 branch
(cf6542493e35) and on bare metal on linux-next as of 2026-11-05. In my
tests, both the short-read and concurrent cases are fixed. Known gaps:
recv punted to io-wq isn't handled, and the IOPOLL and failure paths
are untested.

I was going to send the test to liburing and the prototype as an RFC,
but since the documented contract isn't explicit, it may not be the
direction you want. Maybe you'd prefer a smaller fix, or have a better
idea. If you'd rather handle it yourself, that's completely fine, and
I'm happy to test.

I used an AI assistant to help read the code and search documentation,
and to handle some repetitive tasks (applying patches and building).

Thanks,
Yun Wang

[1] https://github.com/axboe/liburing/issues/1555
liburing test for it. I have a test that checks the per buffer ID
contract with sequential, batched and out-of-order reads, which I'll
adapt to whatever the answer is.

I've tested the b) prototype in a VM on your io_uring-7.4 branch
(cf6542493e35) and on bare metal on linux-next as of 2026-11-05. In my
tests, both the short-read and concurrent cases are fixed. Known gaps:
recv punted to io-wq isn't handled, and the IOPOLL and failure paths
are untested.

I was going to send the test to liburing and the prototype as an RFC,
but since the documented contract isn't explicit, it may not be the
direction you want. Maybe you'd prefer a smaller fix, or have a better
idea. If you'd rather handle it yourself, that's completely fine, and
I'm happy to test.

I used an AI assistant to help read the code and search documentation,
and to handle some repetitive tasks (applying patches and building).

Thanks,
Yun Wang

[1] https://github.com/axboe/liburing/issues/1555
