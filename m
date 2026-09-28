Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026E14DE72D
	for <io-uring@vger.kernel.org>; Mon, 28 Sep 2026 14:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605890; cv=none; b=bRv1ABso16vvroqExgNbVIvw0BEc49aa7hTxdBDMIcGIzJFDxUF0ZS+3ybcJYrw+ujS6ssoWRf/U1eZNmjbRgCwxuHeKXte1r/Cdg2M1L6eTTHkfoC+TnZUTSfE2fgfeyf0fI6YPYVWd0mGokpj0oDuKxIGWcFdmd0YSaN/tXxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605890; c=relaxed/simple;
	bh=ttRLp5uZBBXIDZVrjCp1/B/OT2B3HDt+3d9o6TVjSxE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TG233MsHmsVuy7W1Zr/a9UAt/vYasJZDn6fJqS3fC2IESe7hv35w1cxVAX/VJVcwz5OuAyiEHwWGrGoRoBS/o7//lVT3uh2XQy7pK52jJaiWCvD6elX2YSuzSaaPpE79LiDGyT1pd9vEHMOqKoIcw1u7AHnJ3BYwdxIk4yRK8tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=qqYb1UvO; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="qqYb1UvO"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a15703so2915412eec.0
        for <io-uring@vger.kernel.org>; Mon, 28 Sep 2026 07:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790605882; x=1791210682; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XjEI2w0L+wVlxSuDV0P7eMrDPKELPiH3pO+YDTZIuR4=;
        b=qqYb1UvOav6ON2Tm6Jdyf4QtwtcGCedQo9NPZ1CyLJZdGQ8RSPh+SKJ/Ol3y640Jzl
         n3EFeR+r8Uc8AoTH40AIF7WSL32TrzmlG1ag3QCHmaft08K4X/sE7AVEj60mE1IeDGaY
         suHmAP2B8BLFHRXXNLUaH9ZsSzyU7hbUOR1BxnkwZZxlHg1NdUiv5LsutrnLfWCQ4bOt
         5jaqS1qofe+fUPKf4Te820VNyrslRxCYlDpM1gU0PLNXaSHknBUI92F9SpKKnst4rTXM
         G0Rpl/UBrDffGPazA9HbRKjcwhxOhhwdmjTiRrkjjNQ/yz9VHydQxixJSsjlPrbKn1X5
         PanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605882; x=1791210682;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XjEI2w0L+wVlxSuDV0P7eMrDPKELPiH3pO+YDTZIuR4=;
        b=E3R8x3IsF48StaDmeTHFsBRWHcCojwSt+jmXoWnaHyn751DrPeQmxhgVcfCM2TGEPb
         wJZYIKJ2+o1X2Hc6mL9k+V6tnzUYby/wBwwiLI3uon0eiz7pPQJOCajdnPOS9LNgbmfF
         7pp9aYuLixWfjsfM8hIZCelsYaLDxBZrfTSq9irn0IuveDyfxXI9rhrMgQ7hbYOu/K0Y
         5VNzX6geoWXiooDVhEG2bAcrQRMrFzMneITYu0vT3U5ROrZ8a8rCVAuSoyz6DQzKwC7I
         u74/D+Ufztyq5py8LY8BIM9mergRFiY8TxYmA/x6zhbliAw9LczjbZnMhCm4fbnEd9Cn
         J/IA==
X-Forwarded-Encrypted: i=1; AKwUvBzwNDflXKqpPMbYPBUVf1SsQs093/nUlzU22XvCMwGfsfcsFq37eUz1pWW6pDq0OdwER8ok2Xpn0A==@vger.kernel.org
X-Gm-Message-State: AFuF++lqbtMl7WVF9HtuLfIXvdtn4iCNdhheVAo0xedCa1bm0U6jC6Gj
	WsVZf0bAaCD1WdT6hA9WC1wMwpyXG84Fgn4ObL6qtSpxVfHeR22za2DBUT7es4b1Szg=
X-Gm-Gg: AYBFou1NN4HhidiFuPy8FgT2YG+ww5sZoenWy89cdj30ibAUYvb/jRlCSQnSvyvakG7
	yNgg37A96e4Ia6V/KZIPJ50PGHx3uROKH9jHSUHrycrEIIf1pdRnnhyYwxYDiC4n5MXpWlCYDol
	GHtfcMxwk76/G24raA5vZyukicMf2Fb/KEMXCaNldbeWQnd2g6alApJWGZlAeZzDhBh8L/ffk4H
	ErSQb968Cg43yStKRvpyp1AxuBBIadeZszCls6i7OsLM5q9XoG70KqEioHo0MZAyffDkI62W7KP
	hniIsGt/VOW72JKbYyEMdiwYC8KdjC7mRM3zE5ZsqY6TZtPpqkrmwX/BJdTzCsIvcdXJhP4w3eO
	aWuDnpR1V2vxUM0mG80qB9wP5tcijpPxKUdhZf6W5/q1zoh0bStGYVjDmKnPJ7jOUCoA6zFhi3M
	n8+mJR+3hrObrJ+jF0culvAS1nOY1vL8vUTx8tkuFfRPuBCJd2yVl8hS9KvMzEuiFy4Rfhlv+Sd
	nE91C77M+iJpTVxD4A+ZjdBotn+ekwVv/eq1MWsutAA/Jx7poWZpLXqfQ==
X-Received: by 2002:a05:7022:6889:b0:141:517e:52ef with SMTP id a92af1059eb24-146ce492c9fmr13591875c88.17.1790605881108;
        Mon, 28 Sep 2026 07:31:21 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad9e097fsm28616577c88.13.2026.09.28.07.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:31:20 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: asml.silence@gmail.com, Junyuan Feng <a@lollipopkit.com>
Cc: dw@davidwei.uk, io-uring@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <010001a0cd914529-23df2f94-bbe0-49cd-ae5d-05922356fa12-000000@email.amazonses.com>
References: <010001a0cd914529-23df2f94-bbe0-49cd-ae5d-05922356fa12-000000@email.amazonses.com>
Subject: Re: [PATCH] io_uring/zcrx: requeue multishot receives stopped by a
 local resource
Message-Id: <179060587969.984285.7352315513863005103.b4-ty@b4>
Date: Mon, 28 Sep 2026 08:31:19 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 23 Sep 2026 09:20:44 +0000, Junyuan Feng wrote:
> A multishot RECV_ZC can go idle with unread TCP data when a receiver-local
> resource runs out. An empty copy-fallback niov freelist returns -ENOMEM;
> a full CQ returns -ENOSPC. After partial progress the stop reason is
> lost: io_zcrx_copy_chunk() and io_zcrx_recv_skb() report the copied
> bytes, and tcp_read_sock() drops an error from a later call once earlier
> data was consumed. The edge-triggered request is then not requeued, so
> it cannot consume the remaining data until another socket event arrives.
> 
> [...]

Applied, thanks!

[1/1] io_uring/zcrx: requeue multishot receives stopped by a local resource
      commit: 98ad5b63f5041dc354a6e694f4a9436f74e0681b

Best regards,
-- 
Jens Axboe



