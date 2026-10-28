Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206067;
	b=vSfDHrBhiIOOnvxgH3SHJiu5EplqP3x8fiABlv9bRmsVqstVN8RLNeDLPvOJuI5hLg4Z
	 Pipff0+LmeQqfy643aI/qcIAUHzKFBE6pZk99Ld57GqyOhTgmNWmf1ECADORnaUXaPNGS
	 TXUbTdwc1WIdai5ex+XYVvY/IqazqXagHexQAzNyEXAWAbaa2Yz3NShG3tX3qkY8//3Md
	 8Is2QckHn4C16JDGBDrhdQXFYkoB2M/pGQQQZ25J3v8Mprc0rX6QNxfJ5y5ePYW4LvSXj
	 UhRy9PRpbSUcFot7cwsKmR5ti6RKWc7+RbEx5IyjgWfeeZ2gth84jq2SRw6EZ/m0qVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OAzx0q/CoMCzcW5ipl7ejGrSoA9Q4FjKiqMCcWPSFUY=;
	b=XmYKeOwCQqVts1DHlGn6b5YkwqxYSzQClcET86R8KOP4SiL2fGuTLSZfMQG8ib9X9n/c
	 X+8sB8tpEsdpyfr/BpPYSOsr59FMYiHfuI/O+b3Zo/fWfjI+Da5d89tRgrQx5n4rkl7XN
	 yj2DKDO6UmjPCEQBwU+vw7GXs/9+H/WdcM5VQ5psUOa9e7FjpTh920gonrGN72pAU2Ryb
	 cXS07Qmgh/mUQ1CK6LzfhJFmxim2oIXBSUsCv6o1dwnZMd5jmo7tU8MPTbtQbdQXWXiub
	 OJID8oNtIke+pI5JyCIbm4cXM8ZBYxXNkdsI8ZM1QlriAQWsYelIRZgrVXqkHVTL7Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=TUWgivuO;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B4C606A31D
	for <io-uring@vger.kernel.org>; Wed, 28 Oct 2026 16:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3B4C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=TUWgivuO
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6d290b10a35so608836eaf.2
        for <io-uring@vger.kernel.org>; Wed, 28 Oct 2026 09:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793206066; x=1793810866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OAzx0q/CoMCzcW5ipl7ejGrSoA9Q4FjKiqMCcWPSFUY=;
        b=TUWgivuOt4Ise2icyBdNufGJc9dEKhELhqNN0b/icqgsgQ1W+Vp5vIcDmi2Tvrcq2x
         98oPtbYVSg7Zye7cMNTzwHw2iP+FjgpP1hV2he2RRK9w/uS7kn72W5ULFMbPF2xnyvFq
         Q+AttdmB0MNwuoAQn26nzp0iWVDJc5gE6IFhAqKSGIpMKDqrg2Nzhj9OMv9OeF8WtvlA
         YqYkKSG33l1LVOCg7SjfUgUKeWUkXZWYP5aFTZvV2HPPMG81pv1IpChzO2v00BGuJ/B+
         YnmWb1McMhNrt8ftzVYJ5AEgS6jtVhyPm2ThikcG1j4X4SZTVka1HloB1t83fk86ZxQj
         uWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206066; x=1793810866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OAzx0q/CoMCzcW5ipl7ejGrSoA9Q4FjKiqMCcWPSFUY=;
        b=JC2uAYwIY8emje92vWvqkuWGqa6ynqskylkNwJk+rClPdx5EBpwOnvqYYGgbhFUqpj
         z/cm/cm8HoDbzbWYpRqnXhOauxAu7+y1BMEPKkcZ6vbJFAJiOJvrxFUZ/dQVvFsSm5s9
         HPoAc22qZCrMGRPdr2PPKUD4CZxZ8g466NiKOuHIY1ppmsi2okpk8jPojHihva54shjD
         6x/Rf4UhHcwuMRSg5fbDgErwdNV9Qg1Tp0gz2+6QoAMZvYNS8KoKW3az5UTCZeuV0oEM
         XAPdhGM9JEVBliI1BcjAg+82UwAts6pOb51SdoJYuGCzw4yvevVE1iHv8GMAtCxWjlSE
         LXBQ==
X-Gm-Message-State: AFq9FYJ4f1Us7hae80kq3LxfIepxvmgOjz6d7ksdqqkdqFnezbWtUPj3
	/Dvo+LJcXnY+zDNmxOsBpQYxizGzTTIC8hmfXlY4/zQEn+KMD14038GnkkW678VcIerOCEDkiWQ
	wCIGawZw=
X-Gm-Gg: AYBFou0HgimR9XM0uNMnrOKry6O+t+70hXqZvt4pZOAHeUumv/ZMouJL3k4U8rKFF/Q
	f/Oqfvlyn4DoC+sDs3iCYV//BeQN3kvjBMhnuMrykHZPX5OQItkib/+DZv/pQ59t7rzHk2Oc/GI
	aPDhrnQyiIcbTEY0vGAwluBLpRPW4P7RyxEHdFLTt7D3vrUFY8XIgqUhsNfTmGoAVSHokKgtZjX
	Mlv8LCgSCAgQ66B8NAZ5ruYyJnrk60xAGegWqjjVfPgXyHlI3RkeJ8AM0uJMHwFtROgVcbOWzuf
	Pundl7OQDjYtT6CulvdX5LB+auxHyEO3YHWvNhQ15RIqkTkNY7mRjU04jsMvTBMNcmziRYWwBJG
	KpsAjdnsVI5kIJfVnrnEShy9FCJ11jZOAju867KN6n0Y7BVsRkBBsYfkbse6W6TgAoUZallMCHr
	qJjBUJXata5JpLLvebi2yb3I1gQtZJJEfe6kCaEaMI+9duYJSEtUTf3EoP1wCdDS6gtXllJBNnx
	o6ZYyPfa9VRxi3RE4pU1q5eljfAlDRTx73n9qpjX8Lv8uesk0wLbA57eFF5KN+KuBWoKCW5T6cw
	jMOlOG55YtQ8DFM1xdUH5xJsOscO9zzAbjBURSORC9Tk8F1FU3sRXsCi2unDLimQzjfkDjbXjWB
	n5nIJXGCyYcGux7uqKkey
X-Received: by 2002:a05:6820:807:b0:6f7:6416:a33 with SMTP id 006d021491bc7-713ee66d85amr1672874eaf.39.1793206065948;
        Wed, 28 Oct 2026 09:47:45 -0700 (PDT)
Received: from xps16 ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b206f8a41sm2019182a34.25.2026.10.28.09.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:47:45 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: Kyle Zeng <kylebot@openai.com>,
	stable@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 09/10] io_uring/io-wq: save worker type before dropping its reference
Date: Wed, 28 Oct 2026 10:46:57 -0600
Message-ID: <20261028164732.1264069-10-axboe@kernel.dk>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028164732.1264069-1-axboe@kernel.dk>
References: <20261028164732.1264069-1-axboe@kernel.dk>
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

From: Kyle Zeng <kylebot@openai.com>

io_wq_cancel_tw_create() inspects cb->func after calling
io_worker_cancel_cb(). For an existing worker, that call can drop the
last worker reference and wake io_worker_exit(). If the canceling task
is preempted, the worker can be unlinked and freed by kfree_rcu() before
the callback function is inspected. KASAN reports a slab-use-after-free
read in this path.

Save whether the callback belongs to an unpublished continuation worker
while its reference is still held, then use the saved result for the
conditional free. This preserves the existing accounting and frees only
the worker allocated for the canceled continuation.

Fixes: e6db6f9398da ("io_uring/io-wq: only free worker if it was allocated for creation")
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Zeng <kylebot@openai.com>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/io-wq.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
index 28533174d0da..92df54c6f50c 100644
--- a/io_uring/io-wq.c
+++ b/io_uring/io-wq.c
@@ -1434,14 +1434,16 @@ static void io_wq_cancel_tw_create(struct io_wq *wq)
 
 	while ((cb = task_work_cancel_match(wq->task, io_task_work_match, wq)) != NULL) {
 		struct io_worker *worker;
+		bool free_worker;
 
 		worker = container_of(cb, struct io_worker, create_work);
-		io_worker_cancel_cb(worker);
 		/*
 		 * Only the worker continuation helper has worker allocated and
-		 * hence needs freeing.
+		 * hence needs freeing. Save this before dropping its reference.
 		 */
-		if (cb->func == create_worker_cont)
+		free_worker = cb->func == create_worker_cont;
+		io_worker_cancel_cb(worker);
+		if (free_worker)
 			kfree(worker);
 	}
 }
-- 
2.56.0

