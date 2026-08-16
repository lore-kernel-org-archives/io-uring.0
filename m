Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71488F9C0
	for <io-uring@vger.kernel.org>; Sun, 16 Aug 2026 00:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786838541; cv=none; b=ElG8coq6pD5DLptrFh6vJ9iSYU4goIWd8EzUJyvqH9GpDrkuo25N9N4WFLq5+wduNETG/7SvCrKRzUIoMqL7IE9N52VYP9S7vm+gJaUyEFEFPd9gVcH3j9JLRU7dSLtYFo6MMBPQvMnZBDByamNThGD06tz2sKkT099fv31J8XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786838541; c=relaxed/simple;
	bh=d8phVPdEHqp16VgqSLVJvjQs29buELJ4498RhK31tVE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pTIgTK0NZ+iMN+L35vTayROrb0bttNlT1+BAVJgJ1URn3/Op2cGpwa/RitNPRGbDdvZYWhz8l3fnQUDTNREFRQ6wyJuxX7zOqJwitAe4SkM9Dho6FEuuoD+JyNeASIWgMKcXLQxKaDfPnXWQEaULTqT6Dc+HU1lPHTEgXNmQE8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=CbAKXYYo; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="CbAKXYYo"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4a071495be0so1205023b6e.0
        for <io-uring@vger.kernel.org>; Sat, 15 Aug 2026 17:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1786838538; x=1787443338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ogWrJClySs3xUgtcSiXTo+teNL0Cts1zb6TqI5m5YlU=;
        b=CbAKXYYorXb44hqvUgUr23yFex+EZW+PvNKzDgA0da9gk9Sh56QEI8tIYrNNV7ffZW
         cKOMGUsAJwMQJtrczQAkkfAGFr5H3RZ7VXEED8n6CzLX4TRIUHuF13MOS17PjVo+fWPl
         1qMb6xYzT6MzZzxF/MyaJbn1z35w93ilOVJ9rLOwq5TEXIU9XPT2wyo/X3Jemdj+7PI5
         s1x1fH3l+ozx6W7OBuIMKKdTF7+RVSQGsp0DCD5HDNZtZnGk7tQsVh9a0NSmbDgV8PbQ
         X/KqB7tYqW9YXikzBxxU4KZgCFKQzu9EfY3GBlBOdTYCdAeo/vLzAmF7QIq8h8vGDH9k
         lDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786838538; x=1787443338;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ogWrJClySs3xUgtcSiXTo+teNL0Cts1zb6TqI5m5YlU=;
        b=CQTA9A3rFOr8cQlnvGtsfDsAU7PpOGU9PVtwxo/Fu3lrIhqGJBcqLhPcToh9r1avty
         y4f0Rpk+/Y7YvQTTyeTXy20LND3wc57MHeCDtR8e/vJBYqGqdBO6SGYe60VP2MTh/fud
         sbseNWHttcLfDyfupqTZa9dE0TU5J3vJ3uiIiDaY200du84xffjA6K9E/YMJ0pgSgVk6
         QE6JMoO2TOAYl22eyboDz2f9AYHicswvqnSpgEY6I5USL/WP6fasFlU6EPGzJzK1CBGw
         yL1N191ZXGVd7yfAT2OWSSlcMFHW8oxuPJ6FJan+xcX61fsQt8wVQaG56Z6CI3Tx+FUU
         D3lQ==
X-Gm-Message-State: AOJu0Yx6to79ILdf6pVqub3fLsVTAg3nk2bxk6D5VCXkWVvdMaUsaND9
	QXdvkGOixJxb8RQvDLnVWCF/Jtz88LmGWUGakS/G/CPcWhswyntMy33OZKqR6pYcxy4=
X-Gm-Gg: AR+sD12Q+ayC0qMPBGYGxqY5ZYaplc+Ii4PnBp3PFiL3oXkAljl1hfCsW/F2929mgq9
	mARNCZZU4gFUlbhbWpqggQpMRPw01QxQuutNTLyLX7c5NwRishy3+SfGAE8I7YW5jGsApZoR6w6
	qrLxZOo9RZPrc7wbUosA6fK80obZYCKjrkSAkTH5zF0z9YTShCVYwoEAOhBMDYA3N+cUsI/ZL6h
	mTwZNFpF5lEPTQ5zIiSuPfP+13jqQlg+oyVs+Q9YfmtsFoCY+qQ2SrmBx7rveFUQdstTqOXayST
	I6zZKqLCRBgC4x+s9D3yJK7l+Gge+4ZmCiE9XogryemIMYouSKu3wbvEPKn20TYeYqt1n/pInh1
	CtDD1Rd/v+AOsPj2vtBFFHjaBlCJH34ACzA1Z80HpYbg9/BOQ/j3N0OD9lPgc57oo9HqxcjdeA7
	qr3fXwJKn7nADKYOer9kk91+pFtTmGCfZDzIrzjw1msacyT3dfCCSqvCfJRQs9xSBbq9lZ6s9cn
	3vdovwHELiyOw3KKGXX9NgMsJlY7J3ll3Q8RDTVEw==
X-Received: by 2002:a05:6808:3092:b0:4a0:d9a1:1a95 with SMTP id 5614622812f47-4b241cfd572mr15604177b6e.14.1786838538325;
        Sat, 15 Aug 2026 17:02:18 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b24d92462dsm4347729b6e.5.2026.08.15.17.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 17:02:15 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>
Cc: netdev@vger.kernel.org
In-Reply-To: <cover.1786108672.git.asml.silence@gmail.com>
References: <cover.1786108672.git.asml.silence@gmail.com>
Subject: Re: [PATCH io_uring 00/16] zcrx update for-7.3
Message-Id: <178683853475.1984298.4698280029125415324.b4-ty@b4>
Date: Sat, 15 Aug 2026 18:02:14 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Fri, 07 Aug 2026 14:19:18 +0100, Pavel Begunkov wrote:
> zcrx update for 7.3. Patch 1 fixes RQ processing over-throttling,
> which shows up with larger page sizes. Patches 2-5 makes the RQ
> use more scalable for multi-CPU setups, including softirq running
> on a different CPU from CPU. Patches 9-16 implement dynamic area
> provisioning.
> 
> Pavel Begunkov (16):
>   io_uring/zcrx: scale refilling with large pages
>   io_uring/zcrx: move RQ head/tail to separate cache lines
>   io_uring/zcrx: add RQ iterator
>   io_uring/zcrx: cache RQ tail
>   io_uring/zcrx: coalesce same-niov RQEs on refill
>   io_uring/zcrx: constify area_reg on import
>   io_urint/zcrx: narrow var scope in io_zcrx_recv_skb()
>   io_uring/zcrx: don't reload skb_shinfo
>   io_uring/zcrx: add helper for deriving area token
>   io_uring/zcrx: don't pass ifq_reg to area creation
>   io_uring/zcrx: split dmabuf unmap and release
>   io_uring/zcrx: unmap under netdev lock
>   io_uring/zcrx: move freelist lock to struct zcrx
>   io_uring/zcrx: keep array of areas
>   io_uring/zcrx: lock area creation with pp_lock
>   io_uring/zcrx: add dynamic area provisioning
> 
> [...]

Applied, thanks!

[01/16] io_uring/zcrx: scale refilling with large pages
        commit: 1afcef59fea02c271f5bcf3496402c34b3508a0f
[02/16] io_uring/zcrx: move RQ head/tail to separate cache lines
        commit: 433c57e9b175ed82c0f68a58200d2f10a6ea5580
[03/16] io_uring/zcrx: add RQ iterator
        commit: 2292f4fbc54ed15b6ad07bf788a17903a3337730
[04/16] io_uring/zcrx: cache RQ tail
        commit: 888f7ab164508b4c7246dcb4475294d61b2db055
[05/16] io_uring/zcrx: coalesce same-niov RQEs on refill
        commit: 7b188cf990abe5e1f7bbc9d79db22ce1b414d7c3
[06/16] io_uring/zcrx: constify area_reg on import
        commit: ebb2b81a2d063675a09186a9dffd627ce50e5b9b
[07/16] io_urint/zcrx: narrow var scope in io_zcrx_recv_skb()
        commit: 7f32f17ffbcd2bd8157b9602e1e50b0129ef4522
[08/16] io_uring/zcrx: don't reload skb_shinfo
        commit: 2d837b9961ec7ce46d1f1241a88d2b1f57e87f5a
[09/16] io_uring/zcrx: add helper for deriving area token
        commit: 84a7fc9b1862dfe9e2e743ca6627d311a5e03545
[10/16] io_uring/zcrx: don't pass ifq_reg to area creation
        commit: eb840beb51bb17da87968f3b8359183bde11be22
[11/16] io_uring/zcrx: split dmabuf unmap and release
        commit: be94c24ce377c528f10176906f2b939d90b53716
[12/16] io_uring/zcrx: unmap under netdev lock
        commit: 6bc4d9dec9059f1373eb140fc80b6f64fd153ecd
[13/16] io_uring/zcrx: move freelist lock to struct zcrx
        commit: 7d5d94fe9af1b402271236ff8536252789f3eb17
[14/16] io_uring/zcrx: keep array of areas
        commit: ef0f0e10ee66d9c96298b5331515f46ab074957e
[15/16] io_uring/zcrx: lock area creation with pp_lock
        commit: 5a22bfdd615bf47a0ea5e11f5090b1011764b3a4
[16/16] io_uring/zcrx: add dynamic area provisioning
        commit: 3c8a5e271594f6ba6d2af40f229cbcd0bcb08c06

Best regards,
-- 
Jens Axboe



