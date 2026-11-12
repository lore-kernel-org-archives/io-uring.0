Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495293;
	b=Ewf3LMpaFGTGuhlCLBKEpEl5cbedccq3scsgTnPajgCeMC2asr0sSMxbgOiGu9MXcxho
	 O/90hRunhEEdGmUIGMlDakBPTAyvT0598eHniGb6ie1JUgRfD5XRqCo6W0npjQVAmwNf2
	 R6jfx3SolbWFQRVH+xeR/mM+ggGajTbq9YB63X7NsDxqOknywO2GeP+dKcTir1+bNasnm
	 QojaZjvjPFxaYtmK3RQVUDQQgxnBB6SNz1am4OGDb6iG6bHjU2FeBoZvvyGnTRt5hdQvB
	 Wn2OFqHv67VaqMYywRt6r+U17r0QmbrToxWx1NibFl13XXg9SlIomlbYAno7zxrnrJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YJAKVSq5yqKYSt2NYDkWivS5DNZ0RRvFzcrDx4hLtrA=;
	b=3I058wdaF2gxQ+N9t6iXL2aHAHIJp7sGynyZqssChDV/tMP3KXkNQOjthoA33jPF318w
	 k+N916JS31vqwtCpRRFH00H5S+KtirXSNdc56ltpKInQp88SniBtv/aRJC3eARaFQ3QR2
	 omQZVNmYEmQ4tojKWD0P2D6RSWiudCD8hKInsF/ckMtzSpCx+qqBVkNiOCxG6xUJbQ7ni
	 gBYA0TwVOPgzpWL9MwNU6ktDE/igA5ZMwNos3W8JXg5MG2dc9ILKc0WudcgO8uXBk2upi
	 ipR0IlnB5BgNs1aoUrFmTl7sUDGom24+1NCdo56U83t/rRO+7LIGYqrPpRe4PP5dZjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pBy7U8XD;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5E4606A321
	for <io-uring@vger.kernel.org>; Thu, 12 Nov 2026 14:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C5E4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pBy7U8XD
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so26056025e9.1
        for <io-uring@vger.kernel.org>; Thu, 12 Nov 2026 06:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794495291; x=1795100091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJAKVSq5yqKYSt2NYDkWivS5DNZ0RRvFzcrDx4hLtrA=;
        b=pBy7U8XDNAWse1O6+/qfCw4GU6uCvmoQJcEU8Eub3ENzcDL0eTGFTS74o7FFODs09C
         zbIBeHzRirh+I6XYVUqC9yrksNitJoDLFqgSSiLWK+Sf0qm3W6NkASrPDHW37+V8Fj2H
         aPAhXHvj3RIcAB226+cT0eXq8JhUkU4OUeqN3v/lxVm+iemueF3ySxypZZpRHUWrcc9J
         wZuLPKLSY4SQ34DY6ZvHPHeYsUyQaBpN/MgsZg0+S+HwUNi3b4Nmm9h2BPdDRhs0x3ww
         C1skj5UNF8RchccJHGsgHimM/1cwLToxgTdMzuIyT2hAoO7ycEiJ+x2NpRF9JWp/uB40
         eufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495291; x=1795100091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YJAKVSq5yqKYSt2NYDkWivS5DNZ0RRvFzcrDx4hLtrA=;
        b=r9POU5zwWhN+s6Z6+P9Cl7QdGGjF5YFQKDvtTtjx7bS6nzDls3Be1ctP3720iDx2g7
         TujyqJ3iz+t9wiXAHlqLX/2/jNUxjqXTAVCqSJkwHi5A/tVvcuMuFcWz4QYoG13A3X68
         W/JXGyMdjGxFlJpgJWDgLkRzv66c1IjwGmQtGQWWKKLDJuYMTVEgQcBaKTxNGlBOXJ3V
         6QWCW8iwg/aVjuxz5/p2sV5GbDlfC/PZ2nGbDsHUV1tvho4QWdfZ60T+dmkGBzUoJwaC
         ymWroTSNlZhckDm82/VMwF+ToMcoohkkdBHTNKB1BcX0vvwEuDU9KqKU649mUWSQUdpG
         SGaA==
X-Forwarded-Encrypted: i=1; AL+hErGQgR5zZOUitFfRIMuaYb0tU+/vAgNMX00wLRJUGic9BgDx/wnTZjE5BwIbcukTw1MlFYusIhV+BQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z97/P5pT4Ni9DUGl42sti64TNz6sZzYbMQ8TiIppaSTQ1CTXQ2X
	1u3p1yKRZswPQQBt1o4cUZQ4wcRKppKLSrVuokl7jnKpzP/isr1Xi3+s
X-Gm-Gg: AYBFou1SoD9R+I5oQOboPXt9RufNxLgSI/yYVQVLmypofi4O3riSiVOlK2x8CAE9hSC
	9IA30RkkMxgdLQPeVvD9qomwdDNHLFiBWPmEuAgxnkY6lGYhm2fYYsDE8TDRFVW4QGw1Amq3rqg
	79N9dfZKg3lfNmyZqi9nFEkGUxe8+mEluX+DLrRB5EGfEn485xFFPdPMkPP5f6WpTr6HHw7dEov
	jitAMk3h3TAJrKHCa8F7YoJAwxqJ+5zYd5lNMCi/SA+HRlfKzO/GeB1Y8nsryZFSBBUbPHjSq4X
	9OwMa1D9nIuddywEz0gRImVAFwBj12ZPDk7Oa/etT94maBwMdsJGMra+mu5S800nuxuV4uRCdTH
	qkOXge0nVgf9gDl5IR0A01uWG6lQYjI/LFnMfRcsWDy2/VQWNNqd+DHZlX35KldR9vBuaeGW4e/
	UEDc6+BNTsOr+E0kvZaGZlso/N+omLMMAHwg1hJKF3g8s3rhV8X0/HIWMkibKfCl5FIqQYhXGv/
	CuUVdWJJDEKN+8LRjA5Ejsr2RMdox2wiRM9skO0Ld8fCKEo/P1W5VabGIdOH3fE0mSry3AtwaSM
	ShDNJIDYWfltasllek0GCGxHKWou/b2NOlw=
X-Received: by 2002:a05:600c:3152:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4ba09395149mr112085775e9.19.1794495291269;
        Thu, 12 Nov 2026 06:54:51 -0800 (PST)
Received: from build-server.. ([62.96.37.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49944d646f9sm13956621f8f.32.2026.11.12.06.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:54:50 -0800 (PST)
From: Mikhail Malyshev <mike.malyshev@gmail.com>
To: "Moessbauer, Felix" <felix.moessbauer@siemens.com>
Cc: Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org,
	Pavel Begunkov <asml.silence@gmail.com>,
	Josef Bacik <josef@toxicpanda.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] io_uring/io-wq: apply the current cpuset to new workers
Date: Thu, 12 Nov 2026 14:54:49 +0000
Message-ID: <20261112145449.1570302-1-mike.malyshev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <b95051ac2caf63d3266bd02b326d0e0166a138b6.camel@siemens.com>
References: <20261111162705.1150983-1-mike.malyshev@gmail.com> <b95051ac2caf63d3266bd02b326d0e0166a138b6.camel@siemens.com>
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

On Thu, 2026-11-12 at 07:52 +0000, Moessbauer, Felix wrote:
> that's a valid finding.

Thanks for looking at it.

>> Keep wq->cpu_mask for the affinity of the io-wq itself, all CPUs or the
>> mask set with IORING_REGISTER_IOWQ_AFF, and intersect it with the cpuset
>> of the worker when the worker starts, falling back to the cpuset if the
>> two do not intersect, as __set_cpus_allowed_ptr() does.
>
> Why not simply fail the worker creation if the intersection is empty?
> Just falling back means that the worker threads run on CPUs where they
> - intentionally - should not run.

This only matters for an application that registered a mask with
IORING_REGISTER_IOWQ_AFF and does not register a new one after its
cpuset changes. Nothing tells it about the change, so it may never do
that. When none of the registered CPUs are left in the cpuset, new
workers can either fail, or make a best effort: run on the cpuset, and
on the registered CPUs again once the cpuset includes any of them.
That is the open question; when some registered CPUs are left, new
workers get those either way.

The patch makes the best effort. It never takes a worker out of its
cpuset, it only ignores the registered mask while the mask does not
fit. That is what the scheduler does with a task's sched_setaffinity()
mask when a cpuset change leaves none of its CPUs, since da019032819a
("sched: Enforce user requested affinity"). I preferred it to failing
for two reasons:

- The workers that already exist get the new cpuset whatever we do
  here: cpuset_update_tasks_cpumask() calls set_cpus_allowed_ptr() on
  them with the whole cpuset, and the scheduler does not know the
  registered mask. In the test from my notes, a worker started with
  2-3 registered had 3-6 once the cpuset changed to 3-6, with or
  without the patch. Failing to start new workers would not keep the
  ring's work off those CPUs, the existing workers would go on running
  it there.

- Nothing reports the failure to the application. When no worker exists
  and none can be started, io_wq_enqueue() cancels the work, so the
  requests that go async would complete with -ECANCELED until the
  cpuset or the registered mask changes. A mask outside the cpuset is
  refused with -EINVAL when it is registered, where the caller can act
  on it; here the cause would be a cpuset write by someone else, and the
  error would land on unrelated I/O.

If you and Jens still prefer failing, I can do that in a v2.

> This test program should be added to the liburing testsuite, shouldn't
> it?

It is, posted separately: the cpuset change and the move to another
cgroup.

https://lore.kernel.org/io-uring/20261111162716.1151068-1-mike.malyshev@gmail.com/

I can add the IORING_REGISTER_IOWQ_AFF case to it once we agree on what
an empty intersection should do.

> Shouldn't that also apply to 6.12 (it technically does not apply but
> semantically it should)?

Yes, 6.12.y has 84eacf177faa and the same bug. The patch needs only
context changes there (no io_worker_retire(), io_init_new_worker()
without the acct argument, wq->lock), and I will send a 6.12.y backport
once this is applied.

Thanks,
Mikhail
