Received: from mail-yx2-f39.google.com (mail-yx2-f39.google.com [74.125.224.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9996F53B337
	for <io-uring@vger.kernel.org>; Tue, 29 Sep 2026 15:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790694394; cv=none; b=NaCsJEJ/mBYBefyUL7suIVKVyoZxlWJ2sdPm0ECa75DcdaUoqiHMR8ObsRmIYr+IfefFDZE8YcvsEvfBhlUUWynXRyS8FLS02o/ivXAgTU5yMUHk9FCfl02jyU5J+9GvGFWt7pkCe5ddvItqscsXS8RDLvO+KIIkhNvEPYBsMGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790694394; c=relaxed/simple;
	bh=jwEA9tszSdXiqK2lVGbK9zWNHlffeaTYOxNnAuJHg0s=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=c0pehLBOmDzqUOhr0Nm3WDKpiF1KDvGMwsRkVrF6XvKExa8X2dk4ZTcardKlopd82u8Le8zmoMB/YcqMtAGxZKBFznMK9pnSWQcjTJceujBiVasa47eCUcQ+ZYcshG6dR9sy2kU3Cee41mkmewmbyxh40GZ5Nea/jnIIIurCb90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6GT5t2o; arc=none smtp.client-ip=74.125.224.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6GT5t2o"
Received: by mail-yx2-f39.google.com with SMTP id 00721157ae682-8ab3694b2acso16255577b3.1
        for <io-uring@vger.kernel.org>; Tue, 29 Sep 2026 08:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790694388; x=1791299188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aBbvMtdtXkPr9NqwMjzBWKgQ9hOQ8+AsNzjKBiR/MZM=;
        b=h6GT5t2oAjpHhnStHfZZs5+v/BGAaWIu/60oc/Jvtrwgq25a5N78TqLWlLY6tAon4h
         CUKwPT4nszAokGPumvJbv0xMvmD3KJbacNAD4CKQSd+3ue/XjXYvXB81nfL2qRoQmA2X
         /K7XkENNeq0m7wX+miFKcfZrwHwZM/Nn7TC4VlpXCjqvSCLzqWslN1U9szSJZx1/W4dz
         KWiToeXr+ZUMsx9/i7ZeQkOGaIm41XisMs6mmxTjZjYrWYqlgmdjdjBVCPeGxBwg9v9q
         q+O3vyHinS+AHmQy8NviMV8vGooteQFhkUTjtTggt8Zcl8rlDz88/WTcnZIg8DXVix3M
         ouzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790694388; x=1791299188;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aBbvMtdtXkPr9NqwMjzBWKgQ9hOQ8+AsNzjKBiR/MZM=;
        b=XxOlvJL0abjCpzNTaCujlIgU5kTt669XsMR4idATU9ot2p/29oUwtuLzDm5rk4xVkZ
         UBofHEvjc/7rY2Ot172exIaT80RtZJdBQuJkpWcYiXLCIYn4+Gk8BaDoxA2axx2BC+mA
         raeAFCreXK0lcdK6NeGzItjdaz7E+bs9AB2w954Jix0n7OdcDGqXmvC91CuLF+/2p2ki
         Ib3ZeSBBhQ6891oVuePED2smk37SFTZUkzayaEwIRojXC/TBcVS1o3o37DC1soqTuG5m
         P7OJksx0vb5wnW0NwPvtSvLuaEPGa3l09h9TXDiv7BxlQnEHCKj7BZY13sCTBJeCd8Ra
         /czg==
X-Forwarded-Encrypted: i=1; AKwUvBx7iuq7GS6CRHUAGIArR2XB4x+vJHPCysVQ9JafVo/POkywoN7S44O0l08MdcRPLo9gXrlNmoVtSw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJaq5vYNlpU62v77ubRdf/0YWEPol8cYag3HT8LozfnW/8PdziS
	DM2tr92k0ZS13uUKyuyLiRV0ExIMavG2vy4udkVxCA7WEZYb+fQcrkR6
X-Gm-Gg: AYBFou3klURKDUNwKX7JHFaHlmOdVmmCvEwEQk80MpGMu2ltjFzzje1DVbBg1J7h7AD
	nxMphJmPw6B0rWekGrlL8RCuTLoAHND5tW6jfGT8u2Ti/KnbhwzelqtdCBVhsKLgR2C9UF4dFfp
	9uLo7t7Mrj6bs2zFRCMTaSdWXHZSGcYEXpcRyZrHHHqDe7GMxY9oFHxHya/KmS6drMAFV3mwa3D
	BUduSZCI1+Z5nw/fsMUhTN0cFrLYWYdPy1FaMheudakiJkcw0XfktTkiXt2YLGyxWk+f3yxF/sC
	1WRpxnZLT/wswkHT+wjntsEXHjXYStowvDqwl9SpIuViaIl4vyR8y6MSuTNhxxzkjVxlIYyOwye
	Xt9ysk+7yMAKrZ13kIFwwBtNtL13U76Qr+FTVJh/PaIwWiQrlNB/qJ8zU/Ov5UnftrpsK3xS9TC
	lKDAgAEQfKuWEwGZAUygr+OEuJZkcMPWQKi2a5NSUo2KokYsA6P+A1JkFBrs05BAixn5RA16pej
	rVqWUsK+5evK3u1DSqKIxBxwfaRxsRhXM8d6QCHnJzuDMEzhwkH
X-Received: by 2002:a05:690c:c50f:b0:8a9:a1e9:2659 with SMTP id 00721157ae682-8a9a1e92fcfmr37633367b3.50.1790694387584;
        Tue, 29 Sep 2026 08:06:27 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f9cdb0sm60566977b3.24.2026.09.29.08.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:06:26 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:06:26 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: lollipopkit <a@lolli.tech>, 
 Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>, 
 Willem de Bruijn <willemb@google.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 io-uring@vger.kernel.org, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 lollipopkit <a@lolli.tech>, 
 stable@vger.kernel.org
Message-ID: <willemdebruijn.kernel.570e0a646f4@gmail.com>
In-Reply-To: <20260929045433.59435-1-a@lolli.tech>
References: <20260929045433.59435-1-a@lolli.tech>
Subject: Re: [PATCH] io_uring/cmd_net: drop unextractable TX_TIMESTAMP skbs
 instead of requeueing
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

lollipopkit wrote:
> SOCKET_URING_OP_TX_TIMESTAMP selects error-queue skbs with
> skb_has_tx_timestamp() but extracts the timestamp with
> skb_get_tx_timestamp().  The two use different checks and can disagree:
> a skb the walk accepted can be rejected with -ENOENT forever.  When
> that happens the processing loop stops and skb_queue_splice() puts the
> unprocessed skbs back onto the HEAD of sk_error_queue.  The rejected
> skb is selected first on every following run, fails again, and blocks
> every skb behind it: new timestamps keep arriving and keep re-running
> the command, but nothing is ever delivered again.
> 
> The disagreement is reachable without a race.  With
> SOF_TIMESTAMPING_BIND_PHC the walk never looks at sk_bind_phc, but
> skb_get_tx_timestamp() converts the hardware timestamp through
> ptp_convert_timestamp(), which returns 0 when no virtual clock matches
> sk_bind_phc (for example when the vclock was destroyed after the
> socket bound to it).  ktime_to_timespec64_cond() then fails and the
> extractor returns -ENOENT permanently.  Any skb with a non-zero
> hwtstamp is selected while SOF_TIMESTAMPING_RAW_HARDWARE is set, so a
> single such skb blocks even the software timestamps queued behind it.
> 
> Measured on real hardware, an I219-V (e1000e), using
> /sys/class/ptp/ptpN/n_vclocks to create and destroy the vclock the
> socket was bound to: 22 error-queue skbs generated (16 software + 6
> hardware).  Of the 21 extractor calls, 20 failed with -ENOENT and the
> one that succeeded delivered 1 software timestamp; deliveries then
> froze while 8 further sends kept re-running the command, and the
> remaining 21 skbs (15 software + 6 hardware) sat in the error queue.
> Both control arms (vclock kept alive; no BIND_PHC) delivered
> everything.
> 
> With this patch applied on top of the CQ-full fix ("io_uring/cmd_net:
> end TX_TIMESTAMP multishot when the CQ is full"), A/B tested in a KVM
> guest from a single kernel binary, with the new behaviour behind a
> test-only runtime switch (the switch is test scaffolding and is not
> part of this patch).  The guest needs no special hardware: QEMU's igb
> model emulates hardware TX timestamping (TSYNCTXCTL/TXSTMPL/TXSTMPH)
> and the igb driver registers a PTP clock, so the guest reproduces the
> same failure the same way.  The two arms are separate runs with their
> own sockets and sends; the device holds one pending hardware
> timestamp, so how many of the 16 sends get a hardware skb varies per
> run (12 and 8 here).  Switch off: 28 skbs generated (16 software + 12
> hardware), deliveries froze at 1 and the remaining 27 (15 software +
> 12 hardware) sat in the error queue.  Switch on: 24 skbs generated (16
> software + 8 hardware); all 16 software timestamps were delivered, the
> 8 hardware skbs the extractor rejected with -ENOENT were dropped, and
> the error queue drained.
> 
> recvmsg(MSG_ERRQUEUE) already treats such a skb as skippable:
> sock_recv_errqueue() dequeues it, returns the error message without a
> timestamp, and frees it.  Do the same here and keep the deliverable
> timestamps moving: drop the skb the extractor rejected and continue
> with the rest of the list.  The CQE-full case keeps its
> requeue-and-end-multishot behaviour.
> 
> Fixes: 9e4ed359b8ef ("io_uring/netcmd: add tx timestamping cmd support")
> Cc: stable@vger.kernel.org # needs the CQ-full fix above
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: lollipopkit <a@lolli.tech>

Is this a real name?

https://docs.kernel.org/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

"a known identity (sorry, no anonymous contributions.)"
