Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F7548CD7E
	for <io-uring@vger.kernel.org>; Tue, 25 Aug 2026 18:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787681492; cv=none; b=MJcpSCyU9nXjap+r1sl3RsoPlgLCJwwVdZ0hPWhyG9hEFaAwU/Gv2dTDASHb03UMSvJLelOJDNTuutw7iw824g/AU1QymVI620Z6uY3Zd+5CuiEcH+K/nh4jPFY7KoFn3vEUD12ievZ409UKXzEO+ios8jPBOqYMhLqsX3mgAt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787681492; c=relaxed/simple;
	bh=N1QrMA5ObWp/XY1oSMeV1FCiVJPQXt/MwRzQHOM0Vng=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GfPAes/9blmuVak7yWmecOKcHk9zjQaQS1N9akgLgzxCM7ClUTPWJKDnDzHpQIMgrrKuIgPoRluXS8rz3tOnR2wcYQy5s5g6I9t52sMp7UgYQ2XraWqzD1uLmU6bsLalYmSezpYxMEXaKE3l7aPPyMcS5oI81ACnxZt49hSx6gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=cWSJso5r; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="cWSJso5r"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7e9eaf04bfaso62149a34.1
        for <io-uring@vger.kernel.org>; Tue, 25 Aug 2026 11:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1787681487; x=1788286287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VHGXj2p8sgHPOQBt6Rn3e/76PLQCdLvJmm0grKZQxr8=;
        b=cWSJso5rPGxrBT7jNKq7aCzWBPiw6YzWLusTwby4nADKjan572QhUc6PZ0qQC9Dm0J
         fFAz78G4RN92wO1tTQx0MKlFdqyYymtPEU3Ma8qNSSXQYsDTclEz46bdPl9YY7gOQycg
         eQYPHW+cgRdQVD1G6+cQdRQiJ0LfiIlrq3smUM50QU5RXmazIGjVMfnknGskbjrv/48L
         j9NmboDUE4451+4iAUeMYPpzmacZR6V+DwLZYcHtuClVv7eEepakK/h5/KkgjVo82eQW
         cUH83uCv29neChmqdLq60Lm48PKGyF1JnCf92SNJevUvpbpsfYRPe3Tq3VYJ8WqAGBVU
         qRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787681487; x=1788286287;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VHGXj2p8sgHPOQBt6Rn3e/76PLQCdLvJmm0grKZQxr8=;
        b=DinDkb3RMUvJ003Aj8s8b0eKsiTOrhliMfvfCzpXpldUksQkvTIynL4/h4rNLWUTrM
         7pAx+Pp1KHVlx/H/sdwsPrfJKL7kiqj8B5jXpD5pV1rCcoB0+SE6vbNYhqs2p1bvsjLs
         BG9Jx2oZlsUMTDKzdqXI92PeCoRFTsiGTwY/0iorrglVFKdFnrnoo37VlALytkilGRnu
         0o7yIEGKzemI0q2uNEeq4x2i3WPE93TPqfiQFMPW3f6YfmW/eCWHIanAgcrtxG7uKgA1
         wl3+mG6GpFXufz9hoG0cuoYIjglFvvle7lGnojbcvR58uROF5zNQ0bQtfwnSKdncOsEG
         KX+w==
X-Gm-Message-State: AFuF++mNW79MkWBGbjSbj/KSc2nz6VpVoONaGuAsmBpkIAWzzU15yFXO
	t3PtOUmXaeGED2yNjD6ByogBuEr7Qa1U03sfTIFId+AyNgHTx/PkTjZ2vm0UWVzx72XapdPwAhW
	wGSfWaT0=
X-Gm-Gg: AR+sD12GKitbYnaf38CqVTrqAVdfeO+x7gX9tY4PpkwkMGsaKT0cu+lxTlJT2OdVhE2
	Gw1JTZSsOGDZ83J6jhwzPs2QLPuMnklTu0/NRsG5oiX6hLSrn5aaysfGeW3jVugmvp5va29ff+v
	q6fqN/mFOF4F3BFZp9e7SOqPUeABxECAF1SnLe52J8miYwQ+RQnjGWxrpN14RutAEOdbRUG82bC
	QMn/9zx03ke29hNQg/ufj2VXFj0b4htAznYc1aDcfAWi9GwkAg8PkFkl1P+BbPWiw22ZGQySgvY
	aBtjSjroZVgTe4MCepvFbKUVEEhV9xomT2qQDDjff2D3vybw7po69Jay0G42iJh3fJPeZmgjGPF
	5PrPOj7lnIbehETroOdLYcKreo/RmSJTG+WgJsvfvSWZPprD+b1Z2XC9jwRWbWg/kYT8/2E2OZU
	wEt/5QuN3aJxP8whq3WyM2B4HxUrKBDExTsrqh0Y7+N5BVIIfq2iZ/VV6YLplKvaoz/boRWh5oy
	fIAo3IurB0VZDwzU5Vu6UsWSyLydA2lhBGr1gO7
X-Received: by 2002:a05:6830:6211:b0:7e9:cddb:142a with SMTP id 46e09a7af769-7f4c50847d4mr483681a34.7.1787681486941;
        Tue, 25 Aug 2026 11:11:26 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4c4424de5sm185250a34.17.2026.08.25.11.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 11:11:26 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Hui Su <sh_def@163.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asml.silence@gmail.com, gganji11@naver.com, stable@vger.kernel.org
In-Reply-To: <20260818103336.1922818-2-sh_def@163.com>
References: <20260818103336.1922818-2-sh_def@163.com>
Subject: Re: [PATCH 1/2] io_uring/waitid: honor task_work cancellation
Message-Id: <178768148595.43624.3625796882295211976.b4-ty@b4>
Date: Tue, 25 Aug 2026 12:11:25 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 18 Aug 2026 18:33:36 +0800, Hui Su wrote:
> io_waitid_cb() may run through the fallback task_work path when
> task_work_add() can no longer queue work to the originating task. The
> fallback runs from a kworker and io_uring marks such task work as
> canceled through tw.cancel.
> 
> io_waitid_cb() currently ignores tw.cancel and calls __do_wait().
> waitid is task-context dependent: __do_wait() performs child lookup
> relative to current, and the retry path also uses
> current->signal->wait_chldexit. If the callback runs from the fallback
> kworker, current is therefore not the task that submitted the request.
> 
> [...]

Applied, thanks!

[1/2] io_uring/waitid: honor task_work cancellation
      commit: 14572de82e5022899e5856008bc9cac97004a88c
[2/2] io_uring/waitid: avoid siginfo copy during ring teardown
      commit: 2cf20c4e0f72d523b8673053e7120d092ff1f074

Best regards,
-- 
Jens Axboe



