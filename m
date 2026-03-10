Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592E940DFB9
	for <io-uring@vger.kernel.org>; Tue, 10 Mar 2026 14:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773153856; cv=none; b=X2rDF/gYSmb9O12hu5MxX1/zTdURaqd9k843hb9hdQmLkokznDyBzaJDLVEAfLi+qWGMk8PaC9ohXydsqmWbJgfApamlLqgldKjacnn3/a/Mxjo9Z+XmCgM/HsLGfwHfnDIGWmJ+HSmXZPxwxAM05xHUggjb6VTT5xSLzWRpCt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773153856; c=relaxed/simple;
	bh=sbJ77EEpMaZOZQrUNl2zL7haM1JGc5g9CVsRflGvQ9s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Hn7VbkrsEeOCEutXQdrt/0/eeivLJLb2ShhQmW63eKkqGOegQAXbXEk7ah5kEsXTFHdbR2eXLei2PweCdML+IFc3X30LAeTLAAt+dZ0LhGQ752yv110ABOrzvkDTL+gBWe69PiREmAP2fMnQgqiYsjtBBan65KUX56ocRdBPoKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=BwnVu7tJ; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="BwnVu7tJ"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-467161c4b7aso815317b6e.1
        for <io-uring@vger.kernel.org>; Tue, 10 Mar 2026 07:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1773153853; x=1773758653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InZls8DGwDoMfw9lRwFb65CCcTrdxeMzvu06BShBAsc=;
        b=BwnVu7tJYUU461gWLSFTw1lZF7OLVr3w2uyg8OBZwjl1Uoi9FlGYT4eH2RTiEpyaoU
         ax2R0VOFduXR/6kVQ1/dQLipV9FXQuAguSqNW87e+SfCqC2SbtCnBf2nre+7SwGw/jv3
         GxnzQNuhORbB/al5sI5pmb7j5+N+XztiOdszqcyY0qLJIyCFGqiu8BNbIeS1AC3n6bBk
         b870DAeX+Cc5Rq+ZKNb1wEJqqE09PRp/cEGRDI9VAu3FZbrfyLGi6r3SHCLRQ1uH8zDa
         U+PRymkSZiHl1WIUTJrUVIRMtPvfz+RsnOODMKOOVvW16VyhGWaKUAQIKzT8y68c9LGc
         9Y9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773153853; x=1773758653;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=InZls8DGwDoMfw9lRwFb65CCcTrdxeMzvu06BShBAsc=;
        b=GnigTit9JVQlIMouiGMphpU3T1ViPPVoYDJKwNZ8Cynl0klWGls25xcKMYtuwL8m7H
         8Pbs++twbbv6Lexes9T0bFFJeu/GhViHVRGdRMb+5RUpoOq50jSQ48+n22Jp7t1j5y4A
         wq6kqqn7v9vKC08jerVB+1hsX44GwpOwGKUaS04iXT3lm0jjNVsHP33DrcFcjysavB0f
         OogDPwvSqaCiU/47dXJDYNymTQ3S0knVIGT/kin2nAOPbQhGE2LdCbbaW8vtdNxfghAc
         H5XWWosgHkWD12E/N0Ll6jgjCufHKrS+/FvITjEP21lddm7U3s0LMs5jaJBGUpB0NtE3
         TVvg==
X-Gm-Message-State: AOJu0YwTtNm9KO4KoEOxilkzpSaAE51Xylj+IwrI0H+iQyYoJlaBPL8F
	5OsgOBACMx3kYiltpBxPtMCDjOvejz0Xgqaq4OBZiXpatD7ufYa1j/iUiHfwU2LfNTGv1KoJ1yp
	RC13D+oI=
X-Gm-Gg: ATEYQzwRk93Yjmq+ugHnNCyMw26gC2yz1wleWiSkPJ9C3mhETCGBPumgGxfnVAoKxCf
	QLRCgR7p9VNwYswhg1349cal+qlu5fIoLXICAfWsBCqvbyKF5uO2aFEoWa6ZBrMo8rHmyJyegrk
	EkAZSGiiy1PexGw05jIrSNuJsj8QhepUKkZXPhiDKmQliUP+DRUFIMLf7dxZ3+DYc7DTKL6U1X6
	VZgEHkj1xMV7Gf8k+Ghnaia9P2WSwdJhEs6s6ts+p5rg7nvi6CLGxOVinK9aZqGJq4iOa2HDJf2
	d2ob03M7kdGqFIvRakRf+ISTjNF4Tkrwkf7G2YH6UVawPHlNxKbSOzU1EUC678VwWOnjurkI49l
	FLYROSJNHVHTsaTVoPX6hh00UR5TgbCGEzaVuycAHKOzH9FD8ivY/YHzahhjodfu3rz6c3TQEsS
	DutGW6+zdL/1wNuiy13KFNEbAIXtFIjt5I6MNRLO006TblLkAamfnYNa8JuMRlH7TVKM67wbRRW
	ji4
X-Received: by 2002:a05:6808:344c:b0:463:d796:ac9a with SMTP id 5614622812f47-466dc9f4406mr8485881b6e.4.1773153852103;
        Tue, 10 Mar 2026 07:44:12 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41756b38347sm2575948fac.5.2026.03.10.07.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 07:44:11 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, Tom Ryan <ryan36005@gmail.com>
Cc: gregkh@linuxfoundation.org, kbusch@kernel.org, csander@purestorage.com
In-Reply-To: <20260310052003.72871-1-ryan36005@gmail.com>
References: <aa9Bjbplx3b_Uvmj@kbusch-mbp>
 <20260310052003.72871-1-ryan36005@gmail.com>
Subject: Re: [PATCH v2] io_uring: fix physical SQE bounds check for
 SQE_MIXED 128-byte ops
Message-Id: <177315385125.66994.10167950413180757894.b4-ty@kernel.dk>
Date: Tue, 10 Mar 2026 08:44:11 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 09 Mar 2026 22:20:02 -0700, Tom Ryan wrote:
> When IORING_SETUP_SQE_MIXED is used without IORING_SETUP_NO_SQARRAY,
> the boundary check for 128-byte SQE operations in io_init_req()
> validated the logical SQ head position rather than the physical SQE
> index.
> 
> The existing check:
> 
> [...]

Applied, thanks!

[1/1] io_uring: fix physical SQE bounds check for SQE_MIXED 128-byte ops
      commit: c76e0f1d77f87e258193c2628253782d5ff414c7

Best regards,
-- 
Jens Axboe



