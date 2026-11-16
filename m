Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857511;
	b=F8ib+TjzqymrbghdpC46vLp0FA7TCqWtr7j4porxwIF/lG2HNJD804mMfU+2RgM6buua
	 XjvTwIWQV3GrXazEl/NPW0TaC2awKgx9d7PIGf5SCF9G4z7Vm1riSS1RpJNHyB5tHe7Wv
	 LJC8aYfauq/IBMDNcIz+/+DThNVzQ79ka+Q7BE62KnzxxpPF6YIq5LpgTOG55XEE2Zq4S
	 tbMRQK7u6UCMdPwekLYDdnMrX/eYK2eunSivd1OC6O+kWVPKbwHPb2oHqWOh0XQEjhFa/
	 2zhGwTzBKQV3xiCei+EMIY0CVN0U4XKgt6O2jDFnAd+Z5kEgzX6UrlCzu7yxWaJCi3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=GRJhsAcI15idx0cLc3j7efy8qNOYnMelLH4aXWx29N4=;
	b=LKGWvieJC2RU4fCbxVG96cgRws0OpQ9do2Bj+NDfCAkzZdLz5OQM5lYpVa/YsOH4M5E4
	 QsiQJN4nXMdGk3oxlJTlgStFhLdWjbV3HcbDFD/cwt6Q8YeBfoLexZ+8G7pZpLadLBHLs
	 L6elUZtarK0oXraewhoyMF/SKgvrfcFyYR7F1Gf7M+AhBQOGcirYgOInByix/rBZpN5BH
	 uSAQxEHREG27DTiJ9/MaEG5nboN4fy96NwcbhNf4A5hDbdFS4TvlbF259aQ9i9y/vtDg4
	 puWr8C+GWssLEWG5ejRm0xeo1C89LdMpLL+k7Cy6Gdm+6QT+UdbTzxyXG4vxdJsTVmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=arYGXhR9;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F142E606A322
	for <io-uring@vger.kernel.org>; Mon, 16 Nov 2026 19:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F142E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=arYGXhR9
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc147d86bebso185593a12.0
        for <io-uring@vger.kernel.org>; Mon, 16 Nov 2026 11:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794857510; x=1795462310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GRJhsAcI15idx0cLc3j7efy8qNOYnMelLH4aXWx29N4=;
        b=arYGXhR9kkD9xsAwOGi+AbeNo5o0hng0zmC2BWsww3vebBxrH2r5JnEaxgv4/uf6Sm
         1zh0imNKqytgTfMXAnsm/UBfXnn8y7p6jGQF1Gn41uZzqBTvBBdeHPWaVNfj2Hdga8N5
         v8aja3WNbGRXk5UIJNt9F9gLII6cvvEqQn/jiDP9abzvE0kEec3fAHTidodISySfQ8mA
         /8Y5JFL68CLBpyA/6g/53KuESnJGE2DfuAtylvGcpj+dBs5pgxvL43PeU5swMMzFCDfF
         xgDcDz8wP/AVdGyTl5c35f3h8xBSk2oKHuxKG+0E3oTRGHejWrx84ApdjzXfVd07NpdQ
         yU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794857510; x=1795462310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GRJhsAcI15idx0cLc3j7efy8qNOYnMelLH4aXWx29N4=;
        b=vS2b892OgUHynhq790IzHHJJmwdF2wb+0i3392L7OPyEJB2HSfptF5Q9lz2ajo00Ec
         vFSQ4CVby8gXdv+qofZ+E4upCFAANScDtbGBao38dHRnjRhv7Xc6VPz/9Ae6vLIUa+Dj
         XzQTF1RwY1PxWrEpUUAE7Zzym9Py0J9Fm2EIpayHXv4uC9QkhTuJcPJFHyHNierberL6
         SS+xeHUED6b0S0z9WfN+msdx7Uu7BDtdBQUoV84mk7awJYP5JlxVS63S5vpDK694Jo9f
         cOhatTv+7Yz8gdDRVKSWNKPaFXO0ZzKQyH47bouNnNS0TBul7GA6ZVCk9S7PBKlvC1t/
         fW6Q==
X-Gm-Message-State: APuU4Z/XJ1IkVjroeLyuKmFpEphwgdQdjLU05n6/4aol9+cUDCjZBwpJ
	G1361O99f1FSaAcA3JQnZROBo8/Hy+j6mICBlVRKk4sJ//fCCkhWzdvkLCot+g==
X-Gm-Gg: AZFdTZcJEaw4THkGigUJ2pxrS7Iw4HqR/8eYcEKZvz1KffvK31k4RdLPcnw1b/ws1C2
	IPRJ4yGOOZ6sBoOKVDoRvYrm6MQ4HGg/8NEYpYup4BxWmgwRQcjX1TNYCN/4HY7REL2PNHLKhoV
	UMt2nITQAObjPhXluj1kXmmF7IOmofU9w4huWCXocdLbjhOvV55FPAX2CM8LwSFsKnYilq6jVcR
	1YLsFEnU1gKd7qFq1AIWX39w/slISfhi2uFV4R19dbG9YpUKPzpneTPV6FG1uSXHOH2KFqdRr2X
	yoXm6LkQIq0xMpyUxfgcp6bvvX8B2WBHQcSSbfXVKJomrX2iEF3L2D4z5xNuc5KgUA2l/D2MDaK
	hyIjbYJXIj9mNX0Hl4/ub398Du+QE9rJxW5Ei6NVSrX8LHxwCpIC2+oi1XHJrhXa79rXSs+xnvx
	qocvERhtT+zwwYYlUjLvEhWEYOnw02YndosqBXx0y9Qqg9OCqqcwxHN39/J7zHJ1GmY4WcZt8OG
	qPTbTVEphD8jmXjdVUmcKvQBFUSti7MsEe/WP/ZWwY8F2R23i1UhYpr7BqNghXgFVpCTHyOIoUb
	TKZMbzgJgAnVD1RJsG+9NXd51DPwTq/c4jS59mdO9MmZa1lR4HnhRveujPOO8mZ1OHgIuo8QGYY
	B69uYmLJ6hpayAdPD5+ftSP2mhKETRFf+8V/jVCIhxhra41EQ6UsclP+FOXboSeoCsBQrtW5Bn/
	Wc1wQH8ZSLEswB4q0HinP8v4RlBXahzaF0rFIi4n8L
X-Received: by 2002:a17:90b:4d06:b0:3b1:bd6d:fcc2 with SMTP id 98e67ed59e1d1-3b3abe7e796mr215871a91.40.1794857510114;
        Mon, 16 Nov 2026 11:31:50 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abe77179sm539396a91.11.2026.11.16.11.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:31:49 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rachel Menge <rlmenge@gmail.com>,
	Hardik Garg <hargar@linux.microsoft.com>,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH v1 1/1] io_uring/kbuf: initialize arg->out_len from arg->max_len in io_buffers_select()
Date: Mon, 16 Nov 2026 19:31:46 +0000
Message-ID: <20261116193146.65315-1-sidchintamaneni@gmail.com>
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

io_buffers_select() passes &arg->out_len to io_provided_buffers_select()
on the legacy provided-buffer path. Because callers initialize
arg->max_len (from sqe->len) while leaving arg->out_len as 0,
io_provided_buffers_select() sees *len == 0 and always selects the full
buffer size buf->len, ignoring the user-specified sqe->len limit.

Initialize arg->out_len = arg->max_len before calling
io_provided_buffers_select().

Fixes: 35c8711c8fc4 ("io_uring/kbuf: add helpers for getting/peeking multiple buffers")
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 io_uring/kbuf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/io_uring/kbuf.c b/io_uring/kbuf.c
index abf44f5dba26..873d66a06b36 100644
--- a/io_uring/kbuf.c
+++ b/io_uring/kbuf.c
@@ -370,6 +370,7 @@ int io_buffers_select(struct io_kiocb *req, struct buf_sel_arg *arg,
 				req->flags |= REQ_F_BUF_MORE;
 		}
 	} else {
+		arg->out_len = arg->max_len;
 		ret = io_provided_buffers_select(req, &arg->out_len, sel->buf_list, arg->iovs);
 	}
 out_unlock:
-- 
2.43.0
