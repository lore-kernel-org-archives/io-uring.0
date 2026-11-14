Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673528;
	b=A+YfPoke5I/eVX4Q+R8cj9ahjznlzqMkPiA69HStkEb1DvdPTDWAtO/lTTGSDlKQCBKh
	 juI5MRiuTCEH52jDwJx9Gfehf6hu6v8ykQsDIHcfITsWUwIBa15pXLIrYUj8gcCbLHQRj
	 IZE3wJA/fjCgcEmNAfZVvS2Yy95LOkfjF3Y4YiZfwsENzqofVfyhaJ8tF5EhIostKs6Mm
	 v+LzaqlT10vkcM7sPLiiwFK83xrVQgpTWJnskDVbxZJkWoTBk0uoq68jQ0NaG4b8LYe7+
	 fmd2EfiNhCe9Pjt94Zc7h+HCFWxcdW7LEmjD7Azhg+RGgyJuj4OijO1nknDzczqQ9TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=lXPkYWUZ3Udi9LVDqQlr22wZnWQhsRh3Camx7qJwyCk=;
	b=ui8iPSyNemZ0zPaterWTiRJzdhzVk30v3gSjk7+QctM3W227jSmaro5KXqdhtt8a1Y8V
	 UM9ADlqQdgNCT8/F1euwhjnTr99JBeXW7MTJ/Gddb1zdmkF7G3lDaMHwiWAnQiQ6bN/vF
	 wuNXh3cVXEWrTwYMctEbtiwc/SU0+PP5o8Us2ChLwI9idqcjCQ5vsuFggmziGuMk3dGXa
	 3fjCYkbcTOXLqzeTlUtsCEIlC/Zr2Ag2+AYnNRlp+JppPuezl6oEUH2LWnNvl9P4byp+l
	 Tn4uQqxleVo4/gcIS2/o606WEVoJw2y+AFP/djt85xTHXjseTxnaC/eYJQE+S5yIe6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UwHxAxpw;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD902606A333
	for <io-uring@vger.kernel.org>; Sat, 14 Nov 2026 16:25:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD902606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UwHxAxpw
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so2646171eec.0
        for <io-uring@vger.kernel.org>; Sat, 14 Nov 2026 08:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794673527; x=1795278327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lXPkYWUZ3Udi9LVDqQlr22wZnWQhsRh3Camx7qJwyCk=;
        b=UwHxAxpwSIdnK8weihpuCIPRARd8lIXdmrk4RMTzPo7FqEDIHoCoZ+ISoJ8YfR8l24
         ScqJ12d/FrAQwQMdoUOq6QrqbNGSpeMYLcNTvRX2yx0pjox3FmBLvEKSROIowZijSq62
         xWii4o46mSD1Q1tM7SYtW33WaoEuLtsfdVoJtmTtboA6q72gPrJ/7KZxPCvxQTayNNTs
         dyU8HFDMMBxJeXsK5PP/K3wzsB80QDkuLpbmguyUfgJn5yH2p+70gTZPgE6oCO9IIji4
         FHSpBlSUVNFi/LD3k1oX8BO3ZsRJpXP9bRVkFVnbWz45v1ab8ZtLbmZSnMTNdkWRdC9O
         oyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673527; x=1795278327;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lXPkYWUZ3Udi9LVDqQlr22wZnWQhsRh3Camx7qJwyCk=;
        b=Pv+/J1LWPNnbpjlJ4jZC81iNGj1QOc/Olkm+jAZkD0aewNEJerMSmBqPMie0qzwd55
         SXyUJYM4+4LmPn1dLBDfcjeu0RQC7H7BgbloPikboW+CRLwXuYkAmTQ/3gc9bsQe63cY
         eZIFwqWM2ZisOL3BNvcsKGEI1XZ4MRY4CedLosl0ja7IKaF9wTTtqjIqjfYOdfQMFkLi
         MK6vh0+U33zwb7szS260qEX31rs30Wa5AgUOenNhqjsNTUi5O8Nk7Eo3mMQV7S1jbRXl
         6XFsyx5Cogd0Pj+0sz9vpT0+UmX0m8MggWEdR4IIZ/efotSSHJKEg9RDl7llm2JpuSKF
         cJWw==
X-Gm-Message-State: APuU4Z9y0WH3al9EGK1Knya9HMuSF6AVGPHS6vmM5RVL8CXnwGr4g1VE
	0uZv63gdPPiMkRMdO/3yYpyDSxIo6HKajX3tWYbpU9IRKE8/aEQ9uAJQ41l09wK/ILs3xI5wmjQ
	LX3fFx2c=
X-Gm-Gg: AYBFou1VSvdr4ZE8/5P4fpRBU1rm3MgBqQgHmeGrSO7gabSClt32T7wdLj3MAdOBukE
	PU2OFa0JuDBLfUYoiNQOJSqbUWLg6lGd+cGQ0/pRx11/ey+6l8lKBz+4yJGd9cgS+t0qWy5zdxI
	VSpCTSSpr+RDQID/9aqNFclDTTcUJBlpcX5jg5a/6PDdo/3uBKXyeGz4jXcXTlQf4SFqOOtRP9u
	q/FpsW8fok1Sp12LaCegQ6e9EKW44l0vWqKzkBaHx/wNSVw8HDiRWOnwOZ5stfPAD+m1mH1qE/1
	wf/uAb+bDViGdpEly5TbcgRzZdG4YGmRAV4CgeHFV3LdbWnuyh8vGIpxbspbg26KJJJqZKpHQ+s
	HIi8Fq3RiggZ/YZqGJ159+YG7pzOoikw48SZ7EYuQj4zQB+/Q/6gXmeWBOQckU33Ct7Nbw5CjEO
	yOl5vtRIsvSJOuiR0LEVAvuKpCjxee72Df7QVqigFkIXNwW/SC+TFpj/Gy84sXTDCB4tNUs5B3B
	O4hM28465SCF82RQpgtc865v/gZlj6MaV0+Su1LlvaSFDSwkIzSiZ43z0fEUtOshdvKHPjKCbA8
	C8azMYzkK2mDLJFrjgGFSLxRojXbx7qWp9Zmq1z/bc+P+Ge1cliqYboz5eYlsKh59WYj3DEDC4d
	0IMExcYOEPzIV
X-Received: by 2002:a05:693c:4007:b0:379:730d:db52 with SMTP id 5a478bee46e88-379730de704mr5172270eec.32.1794673526554;
        Sat, 14 Nov 2026 08:25:26 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm18414414eec.5.2026.11.14.08.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:25:25 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261114031621.2924144-1-csander@purestorage.com>
References: <20261114031621.2924144-1-csander@purestorage.com>
Subject: Re: [PATCH 0/4] io_uring: avoid req->flags store-to-load
 forwarding failures
Message-Id: <179467352548.51068.17443816757303265088.b4-ty@b4>
Date: Sat, 14 Nov 2026 09:25:25 -0700
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Fri, 13 Nov 2026 20:16:17 -0700, Caleb Sander Mateos wrote:
> clang likes to set/clear req->flags bits using the narrowest possible or/and
> instructions (e.g. an 8-bit or if all flag bits are in the same byte). This
> causes store-to-load forwarding failures on subsequent wider req->flags loads.
> 
> For example, clang compiles the req->flags |= REQ_F_ASYNC_DATA in
> io_uring_cmd_prep() -> io_uring_alloc_cached_async_data() on x86_64 into an
> orb $0x40, 0x4a(%rdi) instruction, since REQ_F_ASYNC_DATA = 0x40 << 16 and
> offsetof(struct io_kiocb, flags) = 0x48. The subsequent 64-bit req->flags load
> for unlikely(req->flags & (IO_REQ_LINK_FLAGS | REQ_F_FORCE_ASYNC | REQ_F_FAIL))
> in io_submit_sqe() is extremely hot because it can't be served from the store
> buffer and must wait for the REQ_F_ASYNC_DATA set to hit the L1 cache. On a
> thread issuing ublk and NVMe passthrough commands, that one req->flags load
> consumes around 1% of all CPU cycles.
> 
> [...]

Applied, thanks!

[1/4] io_uring: return io_req_flags_t from io_slot_flags()
      commit: 4d81c9390d0a326f2beadea2503d3e3929c739e1
[2/4] io_uring: add multishot_flags constant in io_wq_submit_work()
      commit: 91801f8eab5e5963befb1358efa6832e9aa78499
[3/4] io_uring: add io_req_{set,clear,switch}_flags()
      commit: 3e5dd5a145214bd8996744e8a828ceb249570301
[4/4] io_uring: use io_req_{set,clear,switch}_flags()
      commit: 33e97a6c608064795dc5e36643a9cc66d98bfa99

Best regards,
-- 
Jens Axboe



