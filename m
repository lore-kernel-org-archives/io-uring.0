Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793809110;
	b=yr64FycNhs3qbQo/xPmPQZQB+OfC6QbNMrTTHPVTD1niXqRgWDvFnc2PzIfKkspFLqSk
	 SU7rnJuvMTUz2OsGEaXe8ga6f4zL9H5HtbF5Ct6Z2j/+CttFEluH5l8yX50VWgDJi3jKY
	 vKTK5TLFAJIQuXNLExOUsU7/siTKyABOkeXGHsEGTGVemHjH4iijbE3ob8hr8sSq87IY6
	 H7mKhuWtm9OP5dRmhmsOi9VDjCTNeqWa/4S0tbc2FjthNf4JFCcgKpLIaxdvbhTEFWe1w
	 ik121RMsst3CEDCgD1/CPLtQBBilPstIBfKed7nJM2vi9d/drjdqopULLbxhn+85cGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=ffgGmkTnKfMjsylvKYr40/ecH94exTgaX+mw6xwKZrs=;
	b=Ch5wjdP3x/vff2jllNZuVbeu2tAd4w/dorq2vKPFiwtvH7RQ0N6oCOqg9B9SrVW7WX1y
	 TtwXy2FMisEk7ZI8uHL80Bisp4MlZJOnCo2m4xwy4QJqgqTHSsQs2uyNUJN7SACGL4mNP
	 HMaPg2flrihzvwmesTMy3xMqwguD0tcQHbW/8fLqJABc4yYOepj0Pyxcf+sAH6zB0NzZM
	 jlF0QniMeMCmL8oBmqVJ6YRiD2KLgnkB7UKqe0XZF8UasX6XWXCAP7SoEL+ahdFrwSQ0k
	 6hgp7fQBx+v04mZutMdhLvEhQPqTUZfL6gFAvHpl6l1/u2A2sP99/ZY38iWz98GW32w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=W+CyjG5V;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3D5606EE99
	for <io-uring@vger.kernel.org>; Wed,  4 Nov 2026 16:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B3D5606EE99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=W+CyjG5V
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-845f3fa7f38so355298a34.3
        for <io-uring@vger.kernel.org>; Wed, 04 Nov 2026 08:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793809109; x=1794413909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ffgGmkTnKfMjsylvKYr40/ecH94exTgaX+mw6xwKZrs=;
        b=W+CyjG5Vu6IoqiNe31MzZY7sVtmEPpEjzO0iIAHIQaxXjc8AKt6SMD3nTk0RtmPSSA
         SySa8pxuu0j8SF/02AKbiSaFZ8/93xS7cgwRC0Ele0yE2xUvKPb1iHajmw8CdGMYvfay
         5hiaXSL11zflBZkcGTF7yOAahPXSdK13aGUsVRPEUWZ8FqfX+aIRZqX7csvE68/xhOVh
         69tz5Mpcpj7WI1Sd/6WDb4vfn/Vwk76ebDPNf/xdhRCjkAJfU2G1LiGCENAIjNIp5ajB
         s8ciJL8/1y38/m2E0y8iOL6S1med8KrQFD68H4ikw6M0kXRKC1OHKPO68KBBX2Hk1dPt
         J9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793809109; x=1794413909;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ffgGmkTnKfMjsylvKYr40/ecH94exTgaX+mw6xwKZrs=;
        b=anbTjCrUANKPJ4+FPH3v0Ub4eU4gCMjMWXXngkyOGiA0bVYtPJD06iQZhNNqzziOAi
         G2FE+348080XznlN4Q5xCQytOgCIlXkNL1lAN+bd49YoCZcp0uVc/xRl9TX7EQyTlX25
         2k6NVO1kGd+TbHY6N1yaBugoMSeLGJkyo6awCSbMcgEu1joakqrMDoHMTDMeE2xcgXpg
         Ia/AAqaRmOc8E5r6I96fpjEnl5U28B7GRPrO1R1eOa9ZUZZlSI0CKqkAjp/oA7jhoqJU
         X7+3XhtxPxx/GH4bj0c+7elDoovpBeg2wNDbU9faCTrzyOTHSjJGTYYZxnPwMmW79vZU
         0A/A==
X-Gm-Message-State: APuU4Z9nJVsgfh+0CjHbe2IrRWnliJ4cOVFFKCpnYF6SVHsebs/Kq0db
	1Ov++6sSH7c1PqEKfcv8nj2oBg6P7HodYaZz4RNvTtJGpxcGKuZWIg5y4Gvgxv1rfTo=
X-Gm-Gg: AYBFou2RGRJCxllM/WBYKsK0svShB4gFHmphag1uTh86IvPI3cWo+vJ4McUa1tVudIX
	ViT1skndmR8PLnaV7SfEaTnKzn/Nw76pf+AN55f3UX7iQPNWeZEpSU5D365yrOk0L/Cofud34Ck
	kEIF+eHPxlJ9KgijSJ/OR1UFHKL0nbJlfhkw/gAyTLSjAkivIqMRwLqoBN/zKH/6kQUNhDy82RP
	Ba915S9CLRx0PgUPr5G/3Sm3zEIrQ7a0C2P+dHmc7QeQ0hk3NkR/jmWkCTk8MumMYmp9OMhBn6a
	MHVk0oPQhHnQnvcNRUCZhwSmG9g/Q1RSR7bG44uWi5RVy5ZujTG/Wv9AUSK/9H5jke/UPlJimXp
	Em9E9TmVJyHQxWp5qR3aoi8rAGb8lfoV2AkagHp7sCVt+TT5GYILttmNHoz52hckqaKTkLC8nlN
	B02ur1AVcc7aTY4Qto20iSQmRspZ3ALKjR/1EOyibM7wcU93CcJOT4pZsrSI4g+8Z74BN5soamM
	gFdyyBLT/9nOkpxJpJjmUO/3kzKzxAHgIA4kLa2dxvZTBMjIlv1SftuUtY1PPwJVDM9LAABZ2uG
	JVck8qWrNsIkbz200wSMsnLVcVR0XeJ/rbscVMRwmLIYF/dS66lHnR4MRoWry0lDq2fuiNHiJSs
	uriYCtJZSQw==
X-Received: by 2002:a05:6808:1b2c:b0:4e5:2f2e:45b4 with SMTP id 5614622812f47-5640dc2a7a3mr10879028b6e.21.1793809108449;
        Wed, 04 Nov 2026 08:18:28 -0800 (PST)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9fdfa53sm1897499b6e.15.2026.11.04.08.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:18:26 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Yuansheng Yang <0xbeac@gmail.com>
Cc: io-uring@vger.kernel.org
In-Reply-To: <20261104154655.81876-1-0xbeac@gmail.com>
References: <20261104154655.81876-1-0xbeac@gmail.com>
Subject: Re: [PATCH RESEND] io_uring/rsrc: hold uring_lock across
 index-alloc put_user
Message-Id: <179380910563.4062229.5945785102447310306.b4-ty@b4>
Date: Wed, 04 Nov 2026 09:18:25 -0700
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


On Wed, 04 Nov 2026 23:46:55 +0800, Yuansheng Yang wrote:
> io_files_update_with_index_alloc() installs a fixed file via
> io_fixed_fd_install(), which drops ->uring_lock when the request runs on
> io-wq, then put_user()s the allocated slot back to userspace.  If that
> faults, the error path calls __io_close_fixed() by slot index after
> re-taking the lock.
> 
> The slot can be closed and reused between the install and that cleanup:
> another fixed CLOSE plus open/accept/pipe/socket, or a FILES_UPDATE, can
> put an unrelated file into the same slot.  The error path then removes
> that file instead of the one this request installed, ending an unrelated
> file's fixed-table reference early.  This is a correctness/DoS issue, not
> a use-after-free: fixed-file requests hold an io_rsrc_node reference, so
> the node and file stay alive until they are done.
> 
> [...]

Applied, thanks!

[1/1] io_uring/rsrc: hold uring_lock across index-alloc put_user
      commit: d7c7037253f6935af243570635d71b4920b5a4ea

Best regards,
-- 
Jens Axboe



