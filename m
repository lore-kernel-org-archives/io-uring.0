Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795131008;
	b=JFvTteCVP0tNNplbBl9kEV2VrClyfzCttS32vK27JtijriVhYuRJRB65+OSvDQgeRx7x
	 VUTo6f+wIeF/RHUvaRZ7Uutgz2qphtpL0rSDv+r6bcS188MJFyBfLLDzW+Zjxz1EL+9yO
	 00jhGITKHDMvjDdT6dHO8L9JFaHFoGAFRW36sr6zHxvUf8Kbo04qsnVA/qWWoVfexbUJ8
	 ON6BQ4DQIWfMNZgMuOSlUI0i/bI4PefpbdZGhRxLHQF/83E7aGjJqUpuHIf+4mTV6kfXu
	 i0K5UtG+aIlstihHdWp5Lla/Qo77msIskPYrLCTKxUR5ALfLn6zJBm13tbY/KUoi4HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795131008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Ea1gJLVhc2AO1s67WLIHygzyGKJ2RI2yud9cLOuT1ts=;
	b=jRegzZPr1VVVprkST2Hx45DzesO7rfGeMZMMmVaYQ6BfXgLR5n4HZnaZR7M+Nxymxx6M
	 +xvCTayijaqeSHn3yMZ4EvfW7dBqzUV03ZlZhcP3xWTWxgsLpnJKcJttViECS0Te/s7L7
	 ZOrRlvsmKK+T7bhPX0LCJP/EWI41Zh/vM5PE8UTrFRM58IVGNoFwJ7poDs4pA2TXOHKR5
	 TVtDMXGpdGgv1wD6bKgN2uVEvRYfkcFEhmOi9g7fwCbuhM6eRZVyuCcLo4uliXTfb5Foy
	 bLaRjVhVD6sF3CPYrJOdgGBxLzlJqY+n1g9qcfbws1QFT/2VRC+cYDniOnr9c6tXjJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=asN7KogE;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CE860A261D
	for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 23:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68CE860A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=asN7KogE
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-382f4710a17so427350eec.0
        for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 15:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795131007; x=1795735807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ea1gJLVhc2AO1s67WLIHygzyGKJ2RI2yud9cLOuT1ts=;
        b=asN7KogEdB96Lzvh3BR5oH7SonpAuK8Q2/X/M8t/crF2IPtJoovK27hdTnMt/868+D
         TlvSSoQnPXoxVLQUX6pbtp+CEK/iNCQ2sCdAtBuCn12ID9Sa6CMD+gAkoOTNtsZYIpWD
         kBB23MWbIvaw/oBLvyUxwiSeAVOBonehR1MMIwFJmBJ3rJcuDTAzrdUuUrgibVQe5Gu+
         YM7VLIXm+p+jSM8Mv68Z0hbhMPQ4MnjDt+jHjKhJt/bK2xMOWPh9/wTsLuVfh+zKdvRp
         wXt3wfZdhL46pF5G/40RYxoUecauz7ILlISDElM0d6d9amgqwsDiPefYW7+cdMo7X9eD
         kq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795131007; x=1795735807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ea1gJLVhc2AO1s67WLIHygzyGKJ2RI2yud9cLOuT1ts=;
        b=v8W8v/JMxorVV80GUKE8cxBocaLeUw1CvgjGhO7Sr+QbnASwd3Y6qNQApSBEbYAuc1
         xFagn3cU3AXA5lcmsG3xIShcC44iouvcYebUS+F0WJ7uPOD8lhRV+H+rLIUpO/qFPVZi
         PML4/b37ujGJctKRgPf9sgb6oZzRLgTt4aMcmtnuHJIySXY2tC8Tqqbuya3qi0JSs+Vs
         dVyM9NOUgFaX1i45OGFKnBaF4PbPnVjzqxU0JR/lmnjdMGvxyEda2YkcSppFF0zfmJ0A
         ibMWp9Xg4S41FUgMcqbYmDMo4N+DkFmaYTGYJpG+FAbQ9T8X03kVF1/bHFUvvXUPxhQM
         fijQ==
X-Gm-Message-State: APuU4Z891mYkWIcBoQfUIUycgtcHyVISt9+Xb1wFlIVOc4voCkJ4+57j
	Pz/EJpI3qEcz/Bmc1oQYV6wVShNyMWS8EZiq3VJt4Xo3CtSHyqCsfRfR
X-Gm-Gg: AZFdTZf0HdIPaYhsrTsIWyx789tSFyA1EBEz936qxnQLDFZ/e/vKewVGo7rXVGNZ6ku
	Qr9zkJyltixFi69dIb3VDNHftm15N7mYD3+GHKJXo9Pdfm3bMVzSm+y2yb3KCivsKlkkgx96aY6
	IP8Rn53sRuZOlh1MTZR0dHrHyBycrEoS39QijHEkBVTpPsdYb/hROovBWuW5TXkhJMMkrXGy6ae
	11+kjKsLEYMKil+0Qhhkg1wXCHUmdtDS3fUWD07jjcAsvvS1GHX8+S6h6Ue9Ok+pYcWj7jbYNdZ
	v0CUC2mceG5T6aZZeLvoNgYMzcJ+LrU0b7PvfOmgIBgYKT4FiEqeVHsWlNUd8hXJ2LY3rjuaVKQ
	kVpqNiT4kntvqsZcNMqTIuMRCn6uXJzDPT4b3Fa7bTA03yZozCv+xPLpJSmqV86ESHM7zrnlQSH
	178XCjbF7LELkK7xyxESc4najPau9rD2ZbvnrJBwALE9Gc3VQ9jgVDx17b76KsKMr3F52xMYCLz
	9/qyPCl2q0C7iXdmayA7+iRhItMVGVqiacDw71JTBQQOwXdqnAF26OyBzQm/pPlSnL3clvRXTeR
	AGxqLbpD7Duw4eSeBgr2H8w6z42IiT1k0FndsBGMvpsibhYXr5PqDSV9MSGNKc/FyTWn9uoXqK0
	8OPVxtskS
X-Received: by 2002:a05:7300:8816:b0:381:5fe2:8008 with SMTP id 5a478bee46e88-38571b071d3mr821602eec.39.1795131007412;
        Thu, 19 Nov 2026 15:30:07 -0800 (PST)
Received: from lounas.tail428e48.ts.net ([157.131.129.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm176015eec.20.2026.11.19.15.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 15:30:06 -0800 (PST)
From: Louis Thiery <thiery.louis@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	Pavel Begunkov <asml.silence@gmail.com>,
	linux-kernel@vger.kernel.org,
	Louis Thiery <thiery.louis@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] io_uring/net: don't charge the folio offset to truesize for managed frags
Date: Thu, 19 Nov 2026 23:29:35 +0000
Message-ID: <20261119232935.1708458-1-thiery.louis@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Registered buffers backed by huge pages are coalesced into one bvec per
folio, so bv_offset is relative to the folio, not to a 4K page.
io_sg_from_iter() adds PAGE_ALIGN(bv_len + bv_offset) to the skb
truesize, which charges the socket for the whole run-up inside the
folio. A 64K send from 1.5MB into a 2MB THP folio adds about 1.6MB of
truesize, and sk_wmem_queued fills long before any real memory is used.

The visible effect is a socket that looks full: with a 2MB send buffer
only 4 of 128 queued 64K sends complete before the sender blocks,
versus 30 of 128 with the same buffer registered as 4K pages, and most
pipelined send_zc requests come back short.

Only the in-page part of the offset matters for how much memory a
fragment ties up, so use offset_in_page(). This matches what
zerocopy_fill_skb_from_iter() charges for the same data.

Fixes: 57bebf807e2a ("io_uring/rsrc: optimise registered huge pages")
Cc: stable@vger.kernel.org
Signed-off-by: Louis Thiery <thiery.louis@gmail.com>
---
 io_uring/net.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/io_uring/net.c b/io_uring/net.c
index 533afd335..8afad1b2d 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -1501,7 +1501,12 @@ static int io_sg_from_iter(struct sk_buff *skb,
 		struct bio_vec v = mp_bvec_iter_bvec(from->bvec, bi);
 
 		copied += v.bv_len;
-		truesize += PAGE_ALIGN(v.bv_len + v.bv_offset);
+		/*
+		 * bv_offset is relative to the folio for coalesced huge page
+		 * registrations, so only the in-page part of it matters for
+		 * how much memory this fragment ties up.
+		 */
+		truesize += PAGE_ALIGN(v.bv_len + offset_in_page(v.bv_offset));
 		__skb_fill_page_desc_noacc(shinfo, frag++, v.bv_page,
 					   v.bv_offset, v.bv_len);
 		bvec_iter_advance_single(from->bvec, &bi, v.bv_len);

base-commit: 0659e44ce739ecd856164c75a5325b7959a2921d
-- 
2.43.0

